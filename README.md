# Olist E-Commerce Analysis — SQL Project
## Overview
End-to-end SQL analysis of a real Brazilian e-commerce dataset from Olist, covering 99,441 customers, 98,666 orders, and 32,951 products across a 2-year period (2016–2018). The project includes data loading, exploration, Python cleaning, and multi-table SQL analysis with advanced queries.
## Tools Used
**MySQL** — database, all queries and analysis <br>
**Python (pandas)** — data cleaning prior to import
## Dataset
- Source: Brazilian E-Commerce Public Dataset by Olist (Kaggle) <br>
- Tables: 8 relational tables <br>
- Records: ~500,000+ rows across all tables <br>
- Period: September 2016 – October 2018 <br>
- Note: Real anonymized data from a Brazilian e-commerce marketplace
## Project Structure
```
olist-sql-analysis/
│
├── README.md
├── sql/
│   ├── 01_schema.sql           -- Create all 8 tables
│   ├── 02_exploration.sql      -- Data exploration & quality checks
│   ├── 03_analysis.sql         -- Business analysis queries
│   └── 04_advanced_queries.sql -- CTEs, window functions, subqueries
└── insights/
    └── key_findings.md         -- Summary of all findings
```
## Database Schema
```
customers ──┐
            ├── orders ──── order_items ──── products
sellers ────┘       │
                    ├── order_payments
                    └── order_reviews

geolocation (linked via zip code to customers/sellers)
```
## SQL Concepts Demonstrated
- Multi-table `JOIN` across 3–4 tables simultaneously  <br>
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` <br>
- `CASE WHEN` for conditional logic and flagging <br>
- `DATE_FORMAT` and `DATEDIFF` for date analysis <br>
- Window functions: `RANK()`, `SUM() OVER()` <br>
- CTEs (`WITH` clause) for readable, reusable subqueries <br>
- `PARTITION BY` for grouped window calculations <br>
- Subqueries and inline views
## Data Cleaning (Python)
1. Filled 610 missing product category names with `'unknown'`  <br>
2. Removed 775 orphan orders with no associated items <br>
3. Removed 3 rows with `'not_defined'` payment type <br>
4. Flagged 2,965 undelivered orders with `is_delivered` column <br>
5. Reduced geolocation table from 3M to 1M rows (deduplicated by zip code) <br>
6. Filled missing physical product dimensions with `0` <br>
7. Filled missing review comments with `'no comment'` <br>
## Key Findings
- Beauty & Health is the top revenue category ($1.26M) — high price per item drives revenue over volume <br>
- São Paulo accounts for 42% of all customers; top 3 states represent 67% of the market <br>
- November 2017 was the best month ($1M+ revenue) — Black Friday effect clearly visible <br>
- Roraima averages 29.3 days delivery vs ~8-10 days for São Paulo — geography drives delivery time <br>
- Delivery time directly correlates with review scores — remote states wait longer and rate lower <br>
- Insurance & Services category scores just 2.5/5 — worst customer satisfaction <br>
