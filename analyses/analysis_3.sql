-- Which customer segments generate the most revenue and profit

SELECT
      customer_segment,
      ROUND(SUM(revenue),2) as Total_Revenue,
      ROUND(SUM(revenue)*100/SUM(SUM(revenue)) OVER(),2) AS Revenue_Percentage,
      ROUND(SUM(Profit),2) as Total_Profit,
      ROUND(SUM(profit)*100/SUM(SUM(profit)) OVER(),2) AS Profit_Percentage
FROM {{ ref('fact_bookings') }}
GROUP BY 1
ORDER BY Total_Revenue DESC
