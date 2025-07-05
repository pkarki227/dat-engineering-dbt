# 🏗️ Data Engineering Portfolio Project

This end-to-end project simulates a real-world e-commerce data engineering pipeline — from raw data ingestion to deploying a machine learning-ready feature store API.

---

## 🎯 Project Summary

This project demonstrates my hands-on experience with modern data engineering tools and practices:

- ✅ Designing data pipelines for structured, semi-structured, and unstructured data
- ✅ Building modular, testable transformation logic using DBT
- ✅ Enabling CI/CD for automated testing and documentation
- ✅ Serving engineered ML features using FastAPI
- ✅ Deploying to cloud platforms using GitHub Actions and Render

It serves as a comprehensive demonstration of my capabilities in data engineering, DevOps, and ML feature readiness.

---

## 🔧 Tech Stack

| Tool            | Purpose                                |
|-----------------|----------------------------------------|
| **PostgreSQL**  | Data warehouse + staging layer         |
| **DBT**         | Data transformation, modeling & tests  |
| **FastAPI**     | Feature Store API for ML integration   |
| **GitHub Actions** | CI/CD for dbt runs & docs publishing |
| **Render**      | Deploying live FastAPI service         |
| **Supabase**    | Hosted PostgreSQL (cloud DB backend)   |
| **Pandas**      | Data loading and wrangling             |

---

## 🧩 Architecture Overview
Raw CSV / JSON / PDF
│
▼
🛢️ PostgreSQL (Raw Layer)
│
▼
🔄 DBT: Staging → Dimension/Fact → Feature Store Table
│
├─ 🧪 DBT Tests (not null, unique, accepted values)
│
└─ 📘 dbt Docs (CI-published to GitHub Pages)
▼
🤖 FastAPI serving /api/v1/features/<customer_id>


---

## ✅ Key Features

- **Structured + Semi-structured ingestion**: Handles `.csv` orders/customers/products and `.json` user events
- **DBT transformations**: Built staging, dimension, and fact models using modular SQL
- **DBT testing and documentation**: Implemented test coverage and automated docs via CI
- **FastAPI for ML features**: REST endpoint exposes user-level churn features
- **Secure deployments**: Environment variables managed through `.env` and GitHub Secrets
- **CI/CD automation**: Auto triggers dbt run, test, and docs generation on every push to `main`

---

## 🧠 ML Feature Store Highlights

The `churn_feature_store` table powers the FastAPI endpoint and includes features like:

- Total orders and spend per customer
- Average order value
- Days since last order
- Signup to last order duration
- Count of web events
- Last event type
- Active customer flag

The API is ready to integrate with downstream churn models or ML workflows.

---

## 🚀 Live Components

| Component        | Link                                             |
|------------------|--------------------------------------------------|
| 📘 **DBT Docs**  | [View on GitHub Pages](https://pkarki227.github.io/dat-engineering-dbt) |
| ⚙️ **FastAPI UI** | [Render Deployment](https://ml-feature-store.onrender.com/docs) |
| 🔄 **CI/CD Logs** | [GitHub Actions](https://github.com/pkarki227/dat-engineering-dbt/actions) |

---


## 👤 Author

**Pawan Karki**  
💼 Data Engineering & Analytics  
🌏 Based in Australia  
🔗 [GitHub](https://github.com/pkarki227)

---

## 📄 License

This project is released under the [MIT License](LICENSE).


