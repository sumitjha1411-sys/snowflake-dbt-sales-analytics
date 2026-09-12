-- Identify high-value customers (revenue >average revenue)

WITH customer_revenue AS(
     SELECT
           customer_id,
           full_name,
           ROUND(SUM(revenue),2) as revenue
     FROM {{ ref('fact_bookings') }}
     GROUP BY 1,2
),

customer_average AS (
    SELECT
        AVG(revenue) AS average_customer_revenue
    FROM customer_revenue
),

new_joins AS(
SELECT
    c.customer_id,
    c.full_name,
    c.revenue,
    ROUND(a.average_customer_revenue,2) AS average_customer_revenue
FROM customer_revenue c
CROSS JOIN customer_average a)

SELECT * FROM new_joins WHERE revenue > average_customer_revenue -- Customers whose revenue > average revenue