# 📊 Mutual Fund Analysis using BigQuery

## 🧠 Objective

This project analyzes mutual fund data to evaluate performance, data quality, expense efficiency, and ESG impact using SQL in Google BigQuery.

---

## 📁 Dataset Overview

The dataset includes:

* Fund details
* Returns (1-year, 3-year, 5-year)
* Expense ratios
* Portfolio holdings
* ESG scores

---

## 🔍 Analysis Performed

### 🧹 Data Validation

Performed multiple checks to ensure data quality:

* Identified missing return values
* Detected duplicate NAV records
* Validated expense ratios (0–5% range)
* Verified portfolio weight totals (≤100%)

---

### 📈 Performance Analysis

* Identified **Top 10 funds** based on 3-year returns
* Identified **Worst 10 funds** based on 1-year returns

---

### 📂 Category Analysis

* Calculated **average return and expense ratio by category**

### 🌱 ESG Analysis

* Grouped funds into **High, Medium, and Low ESG categories**
* Compared **average 3-year returns**

## 🛠️ Tools Used

* Google BigQuery
* SQL (Joins, Aggregations, CASE statements)

---

## 📂 Project Structure

```
.
├── MS_new.sql        # Main SQL file containing all analysis
├── results/          # Query outputs in PNG format
└── README.md         # Project documentation
```

## 🚀 Key Takeaways

* Data validation is critical before analysis
* Expense ratio and returns often have a trade-off
* ESG investing can align with strong financial performance
---
