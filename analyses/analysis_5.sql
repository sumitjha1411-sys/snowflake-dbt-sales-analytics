-- How much revenue is lost due to cancelled bookings

SELECT
    booking_cancelled_status,
    COUNT(DISTINCT booking_id) AS total_bookings,
    ROUND(SUM(revenue),2) AS total_revenue,
    ROUND(SUM(profit),2) AS total_profit
FROM  {{ ref('fact_bookings') }}
GROUP BY booking_cancelled_status
ORDER BY total_revenue DESC