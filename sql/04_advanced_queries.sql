-- ============================================================
-- PHASE 3: ADVANCED QUERIES
-- Goal: Demonstrate CTEs, window functions, and subqueries
-- Concepts: RANK(), ROW_NUMBER(), WITH clause, multi-table JOINs
-- ============================================================

-- 1. Rank sellers by revenue within each state
--    Concept: CTE + RANK() window function with PARTITION BY
WITH seller_revenue AS (
    SELECT 
        s.seller_id,
        s.seller_state,
        ROUND(SUM(oi.price), 2) AS total_revenue
    FROM order_items oi
    JOIN sellers s ON oi.seller_id = s.seller_id
    GROUP BY s.seller_id, s.seller_state
)
SELECT 
    seller_state,
    seller_id,
    total_revenue,
    RANK() OVER (PARTITION BY seller_state ORDER BY total_revenue DESC) AS state_rank
FROM seller_revenue
ORDER BY seller_state, state_rank
LIMIT 20;

-- 2. Monthly revenue with running total
--    Concept: SUM() OVER() for cumulative calculation
WITH monthly AS (
    SELECT 
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
        ROUND(SUM(oi.price), 2) AS monthly_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY month
)
SELECT 
    month,
    monthly_revenue,
    ROUND(SUM(monthly_revenue) OVER (ORDER BY month), 2) AS running_total
FROM monthly
ORDER BY month;

-- 3. Customers who spent above average
--    Concept: CTE + JOIN to filter above-average spenders
WITH customer_spending AS (
    SELECT 
        o.customer_id,
        ROUND(SUM(oi.price), 2) AS total_spent
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
),
avg_spending AS (
    SELECT AVG(total_spent) AS avg_spent
    FROM customer_spending
)
SELECT 
    cs.customer_id,
    cs.total_spent,
    ROUND(a.avg_spent, 2) AS avg_spent
FROM customer_spending cs
CROSS JOIN avg_spending a
WHERE cs.total_spent > a.avg_spent
ORDER BY cs.total_spent DESC
LIMIT 20;

-- 4. Delivery performance: on time vs late
--    Concept: CASE WHEN + aggregation
SELECT 
    c.customer_state,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date 
             THEN 1 ELSE 0 END) AS on_time,
    SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
             THEN 1 ELSE 0 END) AS late,
    ROUND(SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date 
                   THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS late_pct
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY late_pct DESC
LIMIT 10;
