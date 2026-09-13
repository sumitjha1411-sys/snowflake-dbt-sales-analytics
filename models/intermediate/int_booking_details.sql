{{
    config(
        materialized='table'
    )
}}


SELECT
    b.booking_id,
    b.customer_id,
    b.property_id,
    b.property_booking_date,
    TO_CHAR(b.property_booking_date, 'MM-YYYY') AS booking_month_year,
    b.property_selling_price as revenue,
    b.property_selling_price - p.property_cost as profit,
    b.discount,
    CASE
        WHEN b.booking_cancelled = 0 THEN 'No'
        ELSE 'Yes' 
    END AS booking_cancelled_status
    ,
    c.full_name,
    c.city,
    c.country,
    c.domain,
    c.customer_segment,
    c.channel AS enquiry_type,
    c.age,
    CASE
        WHEN C.age <=40 THEN 'Young'
        ELSE 'Old'
    END AS customer_type
    ,
    p.property_type,
    p.property_category,
    p.property_subcategory
    
FROM {{ ref('stg_bookings') }} b

LEFT JOIN {{ ref('stg_customer') }} c
    ON b.customer_id = c.customer_id

LEFT JOIN {{ ref('stg_product') }} p
    ON b.property_id = p.property_id
