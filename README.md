# Inflation Decision Support System (DSS)

## Overview

This project implements an **end-to-end Decision Support System (DSS)** to analyze inflation trends across countries using two key economic indicators:

* **Consumer Price Index (CPI)**
* **GDP Deflator**

The system integrates data modeling, ETL processes, SQL analytics, dashboarding, and pipeline automation to provide actionable insights for decision-making.

---

## Objectives

* Analyze inflation evolution over time (1973–2014)
* Compare inflation patterns across countries
* Identify economic instability and inflation peaks
* Provide automated and reliable KPI computation

---

##  Architecture

```
CSV Data → PostgreSQL → SQL Views (KPIs) → Power BI Dashboard
                           ↓
                    Airflow (Docker)
```

---

##  Project Structure

```
inflation-dss-project/
│
├── data/                  # Raw CSV datasets
├── sql/                   # SQL scripts (tables, views, KPIs)
├── etl/                   # Python scripts (automation)
├── airflow/               # Airflow DAG + Docker setup
├── dashboard/             # Power BI dashboard + screenshots
├── docs/                  # Reports (Week 1–4)
├── README.md
└── .gitignore
```

---

##  Data Source

* Source: World Bank (via DataHub)
* Format: CSV
* Coverage:

  * ~200 countries
  * ~40 years (1973–2014)
  * ~15,000+ records

---

##  Data Modeling

A normalized relational schema (3NF) was designed:

* `pays` (countries)
* `indicateur` (CPI, GDP)
* `donnees_economiques` (fact table)

Includes:

* Primary keys & foreign keys
* Data integrity constraints

---

##  ETL & Data Processing

* Data cleaning (duplicates, NULLs, format standardization)
* Data integration into PostgreSQL
* SQL transformations for KPI computation

---

##  Analytical Layer

### SQL Views

* `vue_inflation_annuelle` → time evolution
* `vue_kpi_pays` → aggregated KPIs per country
* `vue_comparaison_indicateurs` → CPI vs GDP comparison

### KPIs

* Average inflation
* Maximum inflation
* Inflation volatility
* CPI vs GDP gap
* High-inflation years (>10%)

---

##  Dashboard (Power BI)

Features:

* KPI cards
* Time-series visualizations
* Comparative analysis
* Interactive filters (country, year)
* Analytical insights
<img width="1327" height="688" alt="Capture d&#39;écran 2026-03-19 163554" src="https://github.com/user-attachments/assets/9c2ba994-486e-4fbc-8af2-06602d58aad9" />
---

##  Automation

###  Implemented using:

* **PostgreSQL Stored Procedure**
* **Python (psycopg2)**
* **Apache Airflow (Docker)**

### Pipeline Features:

* Daily KPI recalculation
* Data quality checks (NULL detection)
* Task orchestration via DAG
* Containerized execution

---

##  Running the Project

### 1. Database Setup

```bash
Run SQL scripts in /sql:
- create_tables.sql
- insert_data.sql
- views.sql
```

---

### 2. Run ETL Script

```bash
python etl/run_kpi.py
```

---

### 3. Launch Airflow (Docker)

```bash
cd airflow
docker-compose up
```

Then open:

```
http://localhost:8080
```

---

### 4. Open Dashboard

Open `.pbix` file in Power BI Desktop.

---

##  Data Quality

* Duplicate detection
* NULL value checks
* Automated validation in pipeline

---

##  SQL Optimization

* Index creation
* Query performance analysis (EXPLAIN ANALYZE)
* Optimized joins and aggregations

---

##  Business Value

This system enables:

* Detection of inflation trends and anomalies
* Cross-country economic comparison
* Data-driven decision-making
* Continuous monitoring via automation

---

##  Key Skills Demonstrated

* Data Modeling (3NF)
* SQL (Advanced queries, views, optimization)
* ETL & Data Cleaning
* Python (Database integration)
* Business Intelligence (Power BI)
* Workflow Automation (Airflow, Scheduler)
* Docker (Containerization)

---

##  Future Improvements

* Real-time data ingestion (API)
* Cloud deployment (AWS / GCP)
* Alert system for abnormal KPIs

---

## 👤 Author

Soukaina Amehri
