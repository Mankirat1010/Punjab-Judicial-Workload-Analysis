# Punjab Judicial Workload Analysis

## Overview

Punjab Judicial Workload Analysis is a data analytics project focused on studying court workload, judicial efficiency, and gender-related patterns in Punjab district courts using large-scale judicial data from 2010–2018.

This project applies data cleaning, SQL-based analysis, and dashboard visualization to uncover meaningful insights from millions of court records. The goal is to understand workload distribution, identify judicial bottlenecks, and analyze trends in case participation and court functioning across Punjab districts.

---

## Problem Statement

Indian district courts handle an enormous volume of cases, leading to significant workload imbalances and case pendency.

This project aims to answer key questions such as:

* Which districts handle the highest judicial workload?
* How does workload vary across years?
* What are the gender participation trends in courts?
* How can data help understand judicial efficiency?

---

## Tech Stack

* **Python** — Data Cleaning & Preprocessing
* **Pandas / NumPy** — Data Manipulation
* **MySQL / SQL** — Data Querying & Analysis
* **Power BI** — Dashboard Visualization
* **Git & GitHub** — Version Control

---

## Dataset Source

The raw dataset used in this project was sourced from the **Development Data Lab (DDL) Judicial Data Portal**.

**Original Dataset Link:**
https://www.devdatalab.org/judicial-data

### Dataset Information

* Covers **81 million district court cases across India**
* Time period: **2010–2018**
* Includes:

  * Case filing dates
  * Decision dates
  * Court details
  * District information
  * Judge-related metadata
  * Petitioner and defendant details

For this project, the national dataset was filtered to focus specifically on **Punjab district courts**.

---

## Project Assets

Due to GitHub file size limitations (100 MB/file), large project assets are hosted on Google Drive.

### Google Drive Assets

Includes:

* Cleaned Punjab judicial dataset (CSV files)
* Final Power BI dashboard (`.pbix`)

**Drive Link:**
https://drive.google.com/drive/folders/1MVOIPTQ6NJg7RF0YiGFsuuocOtQKVDbd?usp=sharing

---

## Data Processing Pipeline

Raw Judicial Dataset
→ Punjab State Filtering
→ Data Cleaning & Validation
→ Missing Value Handling
→ Outlier Removal
→ SQL Analysis
→ Power BI Dashboard
→ Insight Generation

---

## Repository Structure

```bash
Punjab-Judicial-Workload-Analysis/
│
├── python_notebooks/    # Data cleaning & preprocessing
├── sql_analysis/        # SQL queries and analysis
└── README.md
```

---

## Dashboard Features

The Power BI dashboard enables:

* District-wise workload comparison
* Year-wise judicial trend analysis
* Female judges distribution analysis
* Female petitioner participation analysis
* Female defendant participation analysis
* Comparative district-level visual insights

---

## Key Insights

* Judicial workload varies significantly across Punjab districts.
* Gender representation among judges shows notable district-level variation.
* Female petitioner and defendant participation trends differ over time.
* Data-driven analysis helps identify district-specific judicial patterns.

---

## Sample Dashboard

Example Power BI visualization includes:

* Female Judges Over Years
* Female Judges by District
* Female Petitioners Over Years
* Female Petitioners by District
* Female Defendants Over Years
* Female Defendants by District

---

## Future Improvements

Potential future enhancements:

* Predictive modeling for case pendency
* Resolution time forecasting
* Advanced district clustering
* Interactive web dashboard deployment

---

## Conclusion

This project demonstrates how large-scale judicial data can be transformed into actionable insights using analytics and visualization. By combining Python, SQL, and Power BI, the analysis highlights important workload and gender-related trends across Punjab’s judicial system.

---

## Author

**Mankirat Singh Bhatia**
