{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom']
) }}

SELECT
    customer_id,
    INITCAP(first_name) AS first_name,
    INITCAP(last_name) AS last_name,
    LOWER(email) AS email,
    phone,
    city,
    state,
    country,
    signup_date,
    updated_at
FROM {{ ref('bronze_customers') }}
WHERE customer_id IS NOT NULL