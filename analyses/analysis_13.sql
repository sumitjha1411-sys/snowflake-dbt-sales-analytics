-- Top property types by profit margin

SELECT
    property_type,
    COUNT(DISTINCT booking_id) AS total_bookings,
    ROUND(SUM(revenue),2) AS total_revenue,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(profit)*100 / NULLIF(SUM(revenue), 0),2) AS profit_margin_pct
FROM {{ ref('fact_bookings') }}
GROUP BY property_type
ORDER BY profit_margin_pct DESC