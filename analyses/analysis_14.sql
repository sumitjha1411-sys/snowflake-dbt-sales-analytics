-- Customer contribution to total revenue

WITH customer_revenue AS (
    SELECT
        customer_id,
        full_name,
        SUM(revenue) AS customer_revenue
    FROM {{ ref('fact_bookings') }}
    GROUP BY
        customer_id,
        full_name
)

SELECT
    customer_id,
    full_name,
    customer_revenue,
    ROUND(customer_revenue * 100 / NULLIF(SUM(customer_revenue) OVER (), 0) ,2) AS revenue_contribution_pct
FROM customer_revenue
ORDER BY customer_revenue DESC