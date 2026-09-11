SELECT
      TRIM(customer_id) AS customer_id,
      INITCAP(f_name) AS first_name,
      INITCAP(l_name) AS last_name,
      INITCAP(CONCAT(f_name, ' ', l_name)) AS full_name,
      TRIM(email) AS email,
      SPLIT_PART(SPLIT_PART(email,'@',2),'.',1) AS domain,
      COALESCE(city,'Unknown') AS city,
      COALESCE(country,'Unknown') as country,
      TRIM(customer_segment) AS customer_segment,
      COALESCE(channel,'Unknown') AS channel,
      TO_DATE(dob, 'dd-MM-yyyy') AS date_of_birth,
      DATEDIFF(YEAR,TO_DATE(dob, 'DD-MM-YYYY'),CURRENT_DATE()) AS age
      
FROM {{ source('stg_source', 'customer') }}

