# 🛵 Zomato Delivery Time Prediction


## 🚀 Project Overview

This project implements a **machine learning system to predict food delivery time** for Zomato orders.  
It follows a complete **end-to-end ML pipeline** — from raw data cleaning to deployment — ensuring automation, reproducibility, and scalability.

### 🔍 What this project does
- Cleans and preprocesses raw delivery data
- Performs EDA and feature engineering
- Trains and tunes ML models using **Optuna**
- Tracks experiments using **MLflow** & **DAGsHub**
- Deploys the trained model as a **REST API**
- Manages artifacts and data versions using **DVC**

The final outcome is an API endpoint that predicts **estimated delivery time (in minutes)** given order details.

---

## 🧰 Tech Stack & Tools

| Category | Tools Used |
|-----------|-------------|
| **Language** | Python 3.8+ |
| **Data Handling** | pandas, numpy, scikit-learn |
| **Visualization** | matplotlib, seaborn |
| **Modeling** | XGBoost, RandomForest, LightGBM |
| **Optimization** | Optuna |
| **Experiment Tracking** | MLflow, DAGsHub |
| **Data Versioning** | DVC |
| **Serving / Deployment** | FastAPI, Uvicorn |
| **Containerization** | Docker |
| **Version Control** | Git & GitHub |

---
## 📊 Model Performance

| Metric | Score |
|---------|-------|
| **MAE** | 3.1 minutes |
| **R² Score** | 0.81 |

