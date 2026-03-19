{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom','gold']
) }}

SELECT
    o.order_id,
    o.order_date,
    d.year,
    d.month,
    d.week_of_year,

    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.state,
    c.country,

    o.order_status,
    o.total_amount,

    SUM(oi.quantity) AS total_items,
    COUNT(DISTINCT oi.product_id) AS unique_products

FROM {{ ref('silver_fact_orders') }} o

LEFT JOIN {{ ref('silver_dim_customers') }} c
    ON o.customer_id = c.customer_id

LEFT JOIN {{ ref('silver_dim_date') }} d
    ON o.order_date = d.date

LEFT JOIN {{ ref('silver_fact_order_items') }} oi
    ON o.order_id = oi.order_id

GROUP BY
    o.order_id,
    o.order_date,
    d.year,
    d.month,
    d.week_of_year,
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.state,
    c.country,
    o.order_status,
    o.total_amount