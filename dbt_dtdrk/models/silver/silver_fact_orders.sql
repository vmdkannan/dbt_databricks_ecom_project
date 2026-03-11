{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom']
) }}

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount,
    created_at
FROM {{ ref('bronze_orders') }}
WHERE order_id IS NOT NULL