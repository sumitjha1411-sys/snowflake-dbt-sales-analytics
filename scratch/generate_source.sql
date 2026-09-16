
-- we could use codegen.generate_source for single or multiple tables too

  {{ codegen.generate_source(
    schema_name='raw',
    database_name='dbt_tutorial',
    generate_columns=True,
    table_names=['payments', 'returns', 'discounts_log']
) }}