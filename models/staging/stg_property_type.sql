SELECT
      TRIM(booking_id) AS property_id,
      INITCAP(TRIM(product_name)) AS property_type,
      INITCAP(TRIM(product_category)) AS property_category,
      INITCAP(TRIM(product_sub_category)) AS property_subcategory,    
      ROUND(product_price,2) AS property_price,
      ROUND(product_cost,2) AS property_cost,
      TO_DATE(launch_date, 'DD-MM-YYYY') AS property_launch_date
FROM {{ source('stg_source', 'property_type') }}