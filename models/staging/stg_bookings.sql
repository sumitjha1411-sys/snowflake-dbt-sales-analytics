SELECT
TRIM(booking_order_id) AS booking_id,
DATE(booking_date) AS property_booking_date,
TRIM(customer_id) AS customer_id,
TRIM(booking_id) AS property_id,
round(selling_price,2) AS propert_selling_price,
discount,
cancelled AS booking_cancelled
FROM {{ source('stg_source', 'bookings') }}