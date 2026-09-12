-- What is the average revenue and profit per booking

SELECT
    COUNT(DISTINCT booking_id) AS total_bookings,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(AVG(revenue),2) AS avg_revenue_per_booking,
    ROUND(AVG(profit),2) AS avg_profit_per_booking
FROM {{ ref('fact_bookings') }}