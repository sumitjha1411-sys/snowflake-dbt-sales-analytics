SELECT customer_id, city
FROM {{ ref('customer') }}
WHERE TRIM(city, '''') = ''
  AND city IS NOT NULL