# 🦠 COVID-19 Global Analytics with SQL

📊 A full-scale SQL-based data analysis project on COVID-19 using PostgreSQL, focused on transforming raw data into decision-ready insights through advanced queries, data modeling, and data quality checks.

---

## 🧠 Project Objective

To analyze the global COVID-19 pandemic using SQL by:
- Normalizing raw datasets into a relational schema
- Performing advanced analytical queries
- Validating data quality and completeness
- Laying the foundation for future Power BI dashboards

---

## 📁 Database Design

**Database Name:** `covid_project` 

**Tables:**
- `covid_data_raw` – raw OWID CSV import
- `country` – country info and population
- `datedim` – date dimension with month, year, etc.
- `covid_data` – cleaned case/death data
- `vaccination` – vaccination metrics

**Views Created:**
- `vw_case_fatality_rate`
- `vw_country_comparison_latest`
- `vw_global_summary_by_date`
- `vw_rolling_avg_new_cases`
- `vw_stringency_vs_cases`
- `vw_vaccination_rate`

---

## 🧾 Dataset Used

- 📄 File: `owid-covid-data.csv`
- 🌐 Source: [Our World in Data](https://ourworldindata.org/covid-data)
- 🔍 Contains: Country-level daily cases, deaths, vaccinations, testing, stringency index

---

## 🧩 Key Features

✅ SQL-based schema design & normalization  
✅ 25+ SQL queries from basic to complex  
✅ Data quality validation (NULLs, duplicates, ranges)  
✅ Prepared for Power BI dashboarding  

---

## 💡 Key Insights

- 🇮🇳 India and 🇺🇸 USA recorded the largest single-day spikes in new cases.
- 🌍 Some small regions (e.g., Tokelau, Gibraltar) showed >100% vaccination — potential data reporting anomalies.
- 📉 Countries like Guadeloupe had high deaths but low stringency, indicating weak policy enforcement.
- 🧪 Zero-death nations like Micronesia had cases but no recorded fatalities.
- ⚠️ Case fatality rates (CFR) ranged from <0.2% to over 5% globally.
- 📆 Seasonal spikes observed most frequently in **January** and **July**.
- 🧵 ICU burden per 1,000 cases gave insights into healthcare response.
- ✅ Perfect referential integrity across all tables; no data corruption found.

---

## 🔎 SQL Highlights

- **Window Functions**: Rolling averages, time to peak
- **CTEs & Subqueries**: Peak detection, first-case logic
- **Conditional Aggregates**: Filters for missing or unusual values
- **Safe Calculations**: `NULLIF()`, `COALESCE()`, `ROUND(...::NUMERIC, 2)`
- **Normalized Schema**: Dimension + Fact model

---

## 📊 What's Next?

- 🔄 Connect to Power BI for interactive visualizations
- 📈 Design dashboards for:
  - Global KPIs
  - Rolling trends
  - Vaccine vs CFR comparison
  - Government stringency vs outcome correlation

---

## 🛠 Tech Stack

- PostgreSQL (v15+)
- pgAdmin
- Power BI (upcoming)
- Raw CSV Data

---

## 🧪 Data Quality Checks Performed

| Check | Status |
|-------|--------|
| ✅ No negative case or death counts | Passed |
| ✅ No duplicate country-date entries | Passed |
| ✅ All dates map to `datedim` | Passed |
| ✅ No NULLs in critical columns | Cleaned |
| ✅ Vaccination outliers flagged | Logged |

---

## 📂 Folder Structure

```
covid_project/
├── data/
│   └── owid-covid-data.csv
├── sql/
│   ├── tables.sql
│   ├── inserts.sql
│   ├── views.sql
│   ├── analysis_queries.sql
│   └── data_quality_checks.sql
├── README.md
```

---

## 📬 Contact

👨‍💻 **Developed by:** Yaswanth Kumar Chaganti  
📧 [yaswanthkumarchaganti@gmail.com](mailto:yaswanthkumarchaganti@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/yaswanth-kumar-chaganti)

---

### ⭐ If you like this project or find it helpful, consider giving it a star!
### covid-sql-analytics
Advanced SQL analysis on global COVID-19 data using PostgreSQL


