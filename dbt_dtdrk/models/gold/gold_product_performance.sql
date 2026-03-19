{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom','gold']
) }}

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.brand,

    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.total_price) AS total_revenue,
    SUM(oi.total_price - (oi.quantity * p.cost)) AS total_profit

FROM {{ ref('silver_fact_order_items') }} oi

LEFT JOIN {{ ref('silver_dim_products') }} p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.brand