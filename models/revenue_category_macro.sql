SELECT
     CUSTOMER_ID,
     FULL_NAME,
     REVENUE,
     {{revenue_category('revenue')}} AS REVENUE_CATEGORY
FROM {{ ref('fact_bookings') }}