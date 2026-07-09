##Dataset Overview
99,441 customers across Brazil (2016–2018)
98,666 orders after removing 775 orphan records with no items
32,951 products across multiple categories
3,095 sellers operating on the platform
99,222 reviews from customers
# Revenue & Products
Beauty & Health is the top revenue category ($1.26M) despite not having the most orders — high price per item
Watches & Gifts ranks 2nd ($1.2M) with only 5,991 orders — most expensive items on average
Bed & Bath has the most orders (11,115) but ranks 3rd in revenue — lower price per item
Key insight: high order volume does not always mean high revenue
November 2017 was the best month ($1M+) — clear Black Friday effect
2018 stabilized at $850K–$1M per month — platform reached maturity
Customer Geography
São Paulo (SP) accounts for ~42% of all customers (41,746)
Top 3 states (SP, RJ, MG) represent ~67% of customers — heavily concentrated in southeast Brazil
Large opportunity for growth in northern and northeastern states
Delivery Performance
Roraima (RR) averages 29.3 days delivery — furthest from main seller hubs
All slowest states are in North/Northeast Brazil — geography drives delivery time
Delivery time directly correlates with review scores — remote states rate lower
Insurance & Services category scores just 2.5/5 — worst rated category
Data Quality Issues Found & Fixed
775 orphan orders (no items) removed
610 products with missing category names filled with 'unknown'
3 'not_defined' payment rows removed
2,965 orders with missing delivery dates flagged with `is_delivered` column
Geolocation table reduced from 3,000,489 to 1,000,163 rows (removed duplicate coordinates per zip code)
Physical product dimensions with missing values filled with 0
