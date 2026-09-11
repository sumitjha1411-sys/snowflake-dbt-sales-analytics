SELECT
    CURRENT_DATABASE() AS database_name,
    CURRENT_SCHEMA() AS schema_name,
    CURRENT_WAREHOUSE() AS warehouse_name,
    CURRENT_USER() AS user_name