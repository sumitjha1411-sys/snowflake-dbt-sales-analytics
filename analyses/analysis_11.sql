-- Top 3 customers by revenue in each country

WITH customer_revenue AS(
     SELECT COUNTRY, 
            CUSTOMER_ID, 
            FULL_NAME,
            SUM(revenue) AS REVENUE
     FROM {{ ref('fact_bookings') }}
     GROUP BY COUNTRY, 
              CUSTOMER_ID, 
              FULL_NAME    
),
 
     ranked_customers AS(
     SELECT *,
             DENSE_RANK() OVER (PARTITION BY COUNTRY ORDER BY REVENUE DESC) as rnk
     FROM customer_revenue
)

SELECT * FROM ranked_customers WHERE rnk <=3

