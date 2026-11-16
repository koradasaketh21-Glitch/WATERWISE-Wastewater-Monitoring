# WATERWISE – AI-Assisted Wastewater Monitoring

## Project Overview
WATERWISE is a Python-based environmental monitoring project that uses data analysis and machine learning to identify unusual wastewater-quality patterns and support pollution-abatement decisions.

## Objectives
- Analyse wastewater-quality data.
- Clean and preprocess missing values.
- Identify unusual observations using machine learning.
- Visualize BOD, COD and suspended solids.
- Provide pollution-abatement recommendations.

## Dataset
**Source:** UCI Machine Learning Repository – Water Treatment Plant Dataset (ID 106).

- Observations: 527
- Numerical variables: 38
- Missing values handled: 591

## Technologies Used
- Python
- Pandas and NumPy
- Scikit-learn
- Matplotlib
- Streamlit
- Plotly

## Machine Learning Algorithm
**Isolation Forest – Unsupervised Learning**

The model identifies unusual combinations of wastewater measurements without requiring labelled training data.

Model configuration: `contamination=0.05`

Results:
- Typical observations: 500
- Anomalies detected: 27
- Anomaly rate: 5.12%

## Important Parameters
- BOD – Biochemical Oxygen Demand
- COD – Chemical Oxygen Demand
- SS – Suspended Solids

## Project Structure
- `main.py` – Data preprocessing and ML analysis
- `app.py` – Interactive Streamlit dashboard
- `data/` – Dataset
- `outputs/` – Analysis results and visualizations
- `requirements.txt` – Python dependencies

## How to Run
1. Install Python 3.10 or newer.
2. Install dependencies:

   `python -m pip install -r requirements.txt`

3. Run the analysis:

   `python main.py`

4. Start the dashboard:

   `python -m streamlit run app.py`

## Limitations
- Uses historical wastewater data, not live sensor readings.
- Anomaly detection does not prove pollution violations.
- No labelled test dataset was available for supervised accuracy evaluation.

## Conclusion
WATERWISE demonstrates how machine learning and data visualization can support wastewater monitoring, anomaly identification and environmental decision-making.

## Dataset Reference
UCI Machine Learning Repository – Water Treatment Plant Dataset (ID 106).

https://archive.ics.uci.edu/dataset/106/water+treatment+plant
