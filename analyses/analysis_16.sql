-- Revenue and profit performance by enquiry channel

WITH rev_pro AS(
     SELECT 
            enquiry_type as customer_enquiry_chanel,
            count(booking_id) as total_bookings,
            SUM(revenue) as total_revenue,
            SUM(profit) as total_profit
      FROM {{ ref('fact_bookings') }}
      GROUP BY enquiry_type
),

     ranked_channels AS(
    SELECT
          customer_enquiry_chanel,
          total_bookings,
          ROUND(total_revenue,2) AS total_revenue,
          ROUND(total_profit,2) AS total_profit,
          DENSE_RANK() OVER (ORDER BY total_revenue) AS revenue_rank,
          DENSE_RANK() OVER (ORDER BY total_profit) AS profit_rank,
          DENSE_RANK() OVER (ORDER BY total_bookings) AS booking_rank
    FROM rev_pro
    ORDER BY total_revenue DESC
)

SELECT
    customer_enquiry_chanel,
    total_bookings,
    total_revenue,
    total_profit,
    revenue_rank,
    profit_rank,
    booking_rank
FROM ranked_channels
ORDER BY revenue_rank





