-- Total revenue and profit over time

SELECT
      booking_month_year,
      ROUND(sum(revenue),2) as Total_Revenue,
      ROUND(sum(Profit),2) as Total_Profit
FROM {{ ref('fact_bookings') }}
GROUP BY 1
ORDER BY 1

