{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom','silver']
) }}

SELECT
    payment_id,
    order_id,
    payment_method,
    payment_status,
    payment_amount,
    payment_date
FROM {{ ref('bronze_payments') }}
WHERE payment_id IS NOT NULL