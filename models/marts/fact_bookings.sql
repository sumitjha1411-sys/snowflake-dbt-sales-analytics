{{
    config(
        materialized='incremental',
        unique_key='booking_id',
        incremental_strategy='merge'
    )
}}

SELECT * FROM {{ ref('int_booking_details') }}

{% if is_incremental() %}
WHERE property_booking_date > (SELECT MAX(property_booking_date) FROM {{ this }})
{% endif %}