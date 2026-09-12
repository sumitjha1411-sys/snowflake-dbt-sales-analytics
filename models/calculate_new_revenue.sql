
SELECT 
    CUSTOMER_ID,
    FULL_NAME,
    REVENUE,
    {{calculate_new_revenue('revenue')}} AS new_revenue
FROM {{ ref('fact_bookings') }}