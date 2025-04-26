# Sleep Health Analysis


---

## Table of Contents
- [Project Overview](#project-overview)
- [Project Objectives](#project-objectives)
- [Project Scope](#project-scope)
- [Dataset Information](#dataset-information)
- [Methodology](#methodology)
  - [Data Collection (Obtain)](#data-collection-obtain)
  - [Data Cleaning (Scrub)](#data-cleaning-scrub)
  - [Exploratory Data Analysis (Explore)](#exploratory-data-analysis-explore)
  - [Data Modeling](#data-modeling)
- [Results and Model Evaluation](#results-and-model-evaluation)
- [How to Run](#how-to-run)
- [References](#references)

---

## Project Overview
This project focuses on analyzing sleep health and lifestyle data to uncover patterns, predict sleep quality, and understand the factors influencing sleep disorders. By applying data science techniques, the project aims to promote healthier lifestyle habits and better sleep practices.

---

## Project Objectives
The main objectives of this project are:
- **Predict** sleep quality by examining factors such as gender, age, occupation, physical activity level, stress levels, BMI category, blood pressure, heart rate, daily steps, and sleep disorders.
- **Identify patterns and correlations** between lifestyle factors (sleep, activity, stress, health metrics).
- **Investigate** the impact of different lifestyle factors on health and well-being.
- **Inform interventions and strategies** to improve sleep health and lifestyle habits.

---

## Project Scope
- **Data Collection**: Retrieved from [Kaggle Sleep Health and Lifestyle Dataset](https://www.kaggle.com/datasets/uom190346a/sleep-health-and-lifestyle-dataset).
- **Data Cleaning**: Handled missing values, corrected formatting issues, removed duplicates.
- **Exploratory Data Analysis (EDA)**: Used visualizations and statistical summaries to understand data trends and relationships.
- **Modeling**: Built and evaluated multiple machine learning models to predict sleep quality.
- **Feature Analysis**: Identified key factors influencing sleep quality.
- **Deployment**: Plan to create a simple web-based dashboard for sleep prediction in the future.

---

## Dataset Information
- **Source**: [Kaggle Sleep Health and Lifestyle Dataset](https://www.kaggle.com/datasets/uom190346a/sleep-health-and-lifestyle-dataset)
- **Description**: The dataset contains demographic details, lifestyle habits, and health metrics related to sleep quality.
- **Features Include**:
  - Gender, Age, Occupation
  - Sleep Duration, Sleep Disorders
  - Physical Activity Level, Stress Level
  - BMI Category, Blood Pressure, Heart Rate, Daily Steps

---

## Methodology

### Data Collection (Obtain)
- **Source**: Kaggle
- **Format**: CSV
- **Reliability**: High, verified dataset from an academic institution.

### Data Cleaning (Scrub)
- Removed missing values
- Fixed data formatting inconsistencies
- Removed duplicates
- Imputation techniques for minor missing fields

### Exploratory Data Analysis (Explore)
- Summary Statistics
- Correlation Matrices
- Visualization of feature distributions
- Grouped comparisons (e.g., Sleep Disorders by BMI Category)

---

## Data Modeling
We used the following regression models to predict sleep quality:
- **Polynomial Ridge Regression**
- **Support Vector Regression (SVR)**
- **Decision Tree Regression**
- **Random Forest Regression**

**Evaluation Metrics**:
- Mean Squared Error (MSE)
- Root Mean Squared Error (RMSE)
- R² Score

| Model                    | MSE      | RMSE    | R² Score |
|---------------------------|----------|---------|----------|
| Polynomial Ridge Regression | 0.00236 | 0.04858 | 0.962    |
| Support Vector Regression   | 0.00280 | 0.05288 | 0.955    |
| Decision Tree Regression    | 0.00078 | 0.02787 | 0.987    |
| Random Forest Regression    | 0.00037 | 0.01931 | 0.994    |

**Best Model**:  
✅ **Random Forest Regression** — achieved the highest R² (0.993995) and lowest RMSE (0.01931).

---

## Results and Model Evaluation
- Random Forest model demonstrated excellent predictive capability.
- Feature importance analysis identified key predictors like **stress level**, **BMI category**, and **physical activity**.
- Residual plots showed minimal prediction errors.
- Hyperparameter tuning improved model generalization.

---

## How to Run

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/ngzhiwei517/Sleep-Health-Analysis.git
    cd Sleep-Health-Analysis
    ```

2. Install required dependencies (assuming you have Python and pip installed):

    ```bash
    pip install -r requirements.txt
    ```

3. Open the Jupyter notebook (`sleep_health_analysis.ipynb`) in Google Colab or any Jupyter notebook environment.

4. Follow the instructions within the notebook to:
    - Load the dataset
    - Preprocess the data
    - Train various machine learning models
    - Evaluate model performance

---

## References
- [Sleep Health and Lifestyle Dataset - Kaggle](https://www.kaggle.com/datasets/uom190346a/sleep-health-and-lifestyle-dataset)
- McKinney, W. (2010). Data Structures for Statistical Computing in Python.
- Scikit-learn: Machine Learning in Python - Pedregosa et al., JMLR 2011
