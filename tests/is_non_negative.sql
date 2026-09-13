
-- example of singular test
-- command to run this: dbt test --select is_non_negative (name = filename)
-- path to save singular test (always): tests/
-- No .yml file required

select profit
from {{ ref('int_booking_details') }}   
where profit < 0  