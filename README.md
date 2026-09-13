# Sales Analytics Pipeline — dbt & Snowflake

An end-to-end analytics engineering project built to practice dbt fundamentals and modern data transformation workflows, using Snowflake as the data warehouse.

The project takes raw customer, product, and booking/sales data and transforms it through a layered pipeline into a clean, tested, dimensional model ready for reporting.

## Tech stack

dbt cloud(trial version) | Snowflake(trial version) | SQL | GitHub

## What this project demonstrates

- **Structured transformation architecture** — staging, intermediate, and marts, following dbt's recommended project structure
- **Dimensional modeling** — a fact/dimension design (fact_bookings, dim_customers, dim_properties) for analysis and reporting
- **Data testing** — source tests, built-in generic tests (unique, not_null, accepted_values, relationships), a custom reusable generic test, and a dbt_utils composite-key uniqueness check
- **Incremental models** — merge-based incremental loading on the fact table, including resolving a real data-freshness filtering bug during development
- **Reusable macros** — custom Jinja macros for schema naming and business logic (e.g., revenue categorization)
- **Version control workflow** — feature branches and pull requests via GitHub

## Project structure

models:

      staging/  # cleaned views of raw source data
      
      intermediate/   # joins staging models, applies business logic and derived metrics
      
      marts/          # fact and dimension tables for reporting

seeds:                   sample CSV data (customers, bookings, products)

macros:                 reusable Jinja macros and custom generic tests

tests:                   singular tests

analyses:               ad-hoc revenue and profit analysis queries

scratch:                exploratory/setup files, not part of the production pipeline


## Data flow

Raw seeds → Snowflake (raw schema)
    → staging (cleaning, type casting, null handling)
    → intermediate (joins, derived business metrics)
    → marts (fact_bookings, dim_customers, dim_properties)

## Key technical details

**Incremental strategy:** fact_bookings model uses `materialized='incremental' with unique_key='booking_id'` and `incremental_strategy='merge'`

**Testing approach:** data quality is enforced at the source layer (catching upstream issues early) and at the model layer (catching transformation bugs), including a custom `is_non_negative` generic test applied across multiple financial columns.

## Note

This is a personal learning project using sample seed data, built to develop hands-on analytics engineering skills alongside ongoing data analysis/BI work.
