-- Monthly revenue growth

WITH monthly_revenue AS (
    SELECT
        booking_month_year,
        ROUND(SUM(revenue),2) AS revenue
    FROM {{ ref('fact_bookings') }}
    GROUP BY 1
),

monthly_revenue_growth AS (
    SELECT
        booking_month_year,
        revenue,
        ROUND(LAG(revenue) OVER (ORDER BY booking_month_year),2) AS previous_month_revenue        
    FROM monthly_revenue
)

SELECT
    booking_month_year,
    revenue,
    previous_month_revenue,
    ROUND(revenue - previous_month_revenue,2) AS revenue_change,
    ROUND((revenue - previous_month_revenue)* 100/NULLIF(previous_month_revenue, 0),2) mom_growth_percentage
FROM monthly_revenue_growth
ORDER BY booking_month_year




