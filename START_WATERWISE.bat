@echo off
setlocal
cd /d "%~dp0"
title WATERWISE - Wastewater Monitoring

echo ======================================================
echo   WATERWISE - AI-ASSISTED WASTEWATER MONITORING
echo ======================================================
echo.

where python >nul 2>&1
if errorlevel 1 (
  echo Python was not found on this computer.
  echo Install Python 3.10 or newer from https://www.python.org/downloads/
  echo During installation, tick "Add Python to PATH".
  pause
  exit /b 1
)

echo [1/3] Installing/checking project libraries...
python -m pip install -r requirements.txt
if errorlevel 1 (
  echo.
  echo Could not install libraries. Check internet and Python/pip setup.
  pause
  exit /b 1
)

echo.
if not exist "outputs\cleaned_data.csv" goto RUN_ANALYSIS
if not exist "outputs\anomaly_results.csv" goto RUN_ANALYSIS
goto LAUNCH_DASHBOARD

:RUN_ANALYSIS
echo [2/3] Creating the analysis outputs from the UCI dataset...
python main.py
if errorlevel 1 (
  if not exist "data\water-treatment.data" (
    echo.
    echo Automatic UCI download did not work.
    echo Opening the official dataset page. Download water-treatment.data
    echo and save it inside this folder's data subfolder, then press a key.
    start "" "https://archive.ics.uci.edu/dataset/106/water+treatment+plant"
    if not exist "data" mkdir "data"
    pause
    if exist "data\water-treatment.data" (
      python main.py
      if errorlevel 1 goto FAILED
    ) else (
      echo Dataset file was not found at data\water-treatment.data
      goto FAILED
    )
  ) else (
    goto FAILED
  )
)

:LAUNCH_DASHBOARD
echo.
echo [3/3] Opening the WATERWISE dashboard...
echo Keep this black terminal window open while using the dashboard.
echo To stop the dashboard, press CTRL+C in this window.
echo.
python -m streamlit run app.py
if errorlevel 1 goto FAILED
exit /b 0

:FAILED
echo.
echo WATERWISE could not finish starting. Read the error above.
pause
exit /b 1
