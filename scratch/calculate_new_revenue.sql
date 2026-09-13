-- In this model "calculate_new_revenue" is a macro and passing arguments are 'revenue' and 'multiplier(1.10)'-dynamic
-- multiplier could be any number

SELECT 
    customer_id,
    full_name,
    revenue,
    ROUND({{calculate_new_revenue('revenue',1.10)}},2) AS new_revenue
FROM {{ ref('fact_bookings') }}

