{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom']
) }}

SELECT
    product_id,
    product_name,
    category,
    brand,
    price,
    cost,
    created_at
FROM {{ ref('bronze_products') }}
WHERE product_id IS NOT NULL