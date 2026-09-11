-- Which property types generate the highest revenue and profit

SELECT
      property_type,
      COUNT(property_type) AS Count,
      ROUND(sum(revenue),2) as Total_Revenue,
      ROUND(sum(profit),2) as Profit
FROM {{ ref('fact_bookings') }}
GROUP BY property_type
ORDER BY Total_Revenue DESC