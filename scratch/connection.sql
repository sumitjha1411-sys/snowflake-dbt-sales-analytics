-- checking connections

select
    current_database() AS database_name,
    current_schema() AS schema_name,
    current_warehouse() AS warehouse_name,
    current_user() AS user_name