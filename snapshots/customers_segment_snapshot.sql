{% snapshot customers_segment_snapshot %}
{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_segment']
    )
}}
SELECT * FROM {{ source('stg_source', 'customer') }}
{% endsnapshot %}