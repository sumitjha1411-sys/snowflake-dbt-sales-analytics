SELECT
      TRIM(payment_id) AS payment_id,
      TRIM(booking_order_id) AS booking_order_id,
      round(payment_amount,2) AS payment_amount,
      payment_date,
      TRIM(payment_method) AS payment_method,
FROM {{ source('stg_source', 'bookings') }}


    - name: payment_id
    - name: booking_order_id
    - name: payment_amount
    - name: payment_date
    - name: payment_method

