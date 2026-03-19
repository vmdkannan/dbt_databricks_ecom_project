{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom','silver']
) }}

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_price
FROM {{ ref('bronze_order_items') }}