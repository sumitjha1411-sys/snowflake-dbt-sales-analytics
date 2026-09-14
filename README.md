# Sales Analytics Pipeline — dbt & Snowflake

An end-to-end analytics engineering project built to practice dbt fundamentals and modern data transformation workflows, using Snowflake as the data warehouse.

The project takes raw - customer, property_type, and booking/sales data and transforms it through a structured pipeline into a clean, tested, dimensional model ready for reporting.

## Tech stack

dbt cloud | Snowflake | SQL | GitHub

## What this project demonstrates

- **Structured transformation architecture** — staging, intermediate, and marts, following dbt's recommended project structure
- **Dimensional modeling** — a fact/dimension design (fact_bookings, dim_customers, dim_properties) for analysis and reporting
- **Data testing** — source tests, built-in generic tests (unique, not_null, accepted_values, relationships), a custom reusable generic test, and a dbt_utils composite-key uniqueness check
- **Incremental models** — merge-based incremental loading on the fact table, including resolving a real data-freshness filtering bug during development
- **Reusable macros** — custom Jinja macros for schema naming and business logic (e.g., revenue categorization)
- **Version control workflow** — feature branches and pull requests via GitHub

## Project structure

**models**:

      staging/  # cleaned views of raw source data
      
      intermediate/   # joins staging models, applies business logic and derived metrics
      
      marts/          # fact and dimension tables for reporting

**seeds**:                   sample CSV data (customers, bookings, property_type)

**macros**:                 reusable Jinja macros and custom generic tests

**tests**:                   singular tests

**analyses**:               ad-hoc revenue and profit analysis queries

**scratch**:                exploratory/setup files, not part of the production pipeline


## Data flow

Raw seeds → Snowflake (raw schema)
    → staging (cleaning, type casting, null handling)
    → intermediate (joins, derived business metrics)
    → marts (fact_bookings, dim_customers, dim_properties)

## Key technical details

**Incremental strategy:**  fact_bookings model uses `materialized='incremental'`, `unique_key='booking_id'`, and `incremental_strategy='merge'`

**Testing approach:** data quality is enforced at the source layer (catching upstream issues early) and at the model layer (catching transformation bugs), including a custom `is_non_negative` generic test applied across multiple financial columns.

## Note

This is a personal learning project using sample seed data, built to develop hands-on analytics engineering skills alongside ongoing data analysis/BI work.

## data_flow_reference (ref: Snowflake)

-- Step 1: steps to connect Snowflake with dbt : connection details


create database if not exists dbt_tutorial;


create schema if not exists dbt_tutorial.raw;


create warehouse if not exists dbt_xs_wh;


grant all privileges on database dbt_tutorial to role accountadmin;


use database dbt_tutorial;


show schemas;

-- Step 2: Read CSV files : dbt SEEDS ---> RAW SCHEMA


SELECT * FROM dbt_tutorial.raw.customer;

SELECT * FROM dbt_tutorial.raw.property_type;

SELECT * FROM dbt_tutorial.raw.bookings;


-- Step 3: RAW SCHEMA --> BASIC DATA TRANSFORMATION in dbt ---> STAGING SCHEMA


SELECT * FROM dbt_tutorial.staging.stg_customer;

SELECT * FROM dbt_tutorial.staging.stg_property_type;

SELECT * FROM dbt_tutorial.staging.stg_bookings;


-- Step 4: STAGING SCHEMA --> DATA TRANSFORMATION in dbt ---> INTERMEDIATE SCHEMA


SELECT * FROM dbt_tutorial.intermediate.int_booking_details;


-- Step 5: INTERMEDIATE SCHEMA  --> DATA TRANSFORMATION in dbt ---> MARTS SCHEMA (BUSINESS READY DATA FOR ANALYSIS)


SELECT * FROM dbt_tutorial.marts.dim_customers;

SELECT * FROM dbt_tutorial.marts.dim_properties;

SELECT * FROM dbt_tutorial.marts.fact_bookings;














