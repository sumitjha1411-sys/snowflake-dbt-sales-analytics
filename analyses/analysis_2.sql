-- Which property types generate the highest revenue and profit

SELECT
      property_type,
      COUNT(property_type) AS Count,
      ROUND(sum(revenue),2) as Total_Revenue,
      ROUND(SUM(revenue)*100/SUM(SUM(revenue)) OVER(),2) AS Revenue_Percentage,
      ROUND(sum(profit),2) as Profit,
      ROUND(SUM(profit)*100/SUM(SUM(profit)) OVER (),2) AS Profit_Percentage
FROM {{ ref('fact_bookings') }}
GROUP BY property_type
ORDER BY Total_Revenue DESC