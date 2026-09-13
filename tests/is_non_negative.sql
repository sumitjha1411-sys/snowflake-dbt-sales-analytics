select profit
from {{ ref('int_booking_details') }}   
where profit < 0  