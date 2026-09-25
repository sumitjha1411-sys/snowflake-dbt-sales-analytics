{{
    config(
        materialized='view',
        alias='new_target'
    )
}}

select
    '{{ target.type }}' as target_type,
    '{{ target.database }}' as target_database,
    '{{ target.schema }}' as target_schema
