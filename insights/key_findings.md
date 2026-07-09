# Key Findings — Olist E-Commerce SQL Analysis
## Dataset Overview
- **99,441 customers** across Brazil (2016–2018) <br>
- **98,666 orders** after removing 775 orphan records with no items <br>
- **32,951 products** across multiple categories <br>
- **3,095 sellers** operating on the platform <br>
- **99,222 reviews** from customers <br>
## Revenue & Products
- Beauty & Health is the top revenue category ($1.26M) despite not having the most orders — high price per item <br>
- Watches & Gifts ranks 2nd ($1.2M) with only 5,991 orders — most expensive items on average <br>
- Bed & Bath has the most orders (11,115) but ranks 3rd in revenue — lower price per item <br>
- Key insight: high order volume does not always mean high revenue <br>
- November 2017 was the best month ($1M+) — clear Black Friday effect <br>
- 2018 stabilized at $850K–$1M per month — platform reached maturity <br>
## Customer Geography
- **São Paulo (SP) accounts for ~42% of all customers** (41,746) <br>
- **Top 3 states (SP, RJ, MG) represent ~67% of customers** — heavily concentrated in southeast Brazil <br>
- **Large opportunity for growth** in northern and northeastern states <br>
## Delivery Performance
- Roraima (RR) averages 29.3 days delivery — furthest from main seller hubs <br>
- All slowest states are in North/Northeast Brazil — geography drives delivery time <br>
- Delivery time directly correlates with review scores — remote states rate lower <br>
- Insurance & Services category scores just 2.5/5 — worst rated category <br>
## Data Quality Issues Found & Fixed
- 775 orphan orders (no items) removed <br>
- 610 products with missing category names filled with 'unknown' <br>
- 3 'not_defined' payment rows removed <br>
- 2,965 orders with missing delivery dates flagged with `is_delivered` column <br>
- Geolocation table reduced from 3,000,489 to 1,000,163 rows (removed duplicate coordinates per zip code) <br>
- Physical product dimensions with missing values filled with 0
