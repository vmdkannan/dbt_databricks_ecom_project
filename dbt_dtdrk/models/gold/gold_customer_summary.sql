{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom','gold']
) }}

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.country,

    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS avg_order_value,
    MAX(o.order_date) AS last_order_date

FROM {{ ref('silver_dim_customers') }} c

LEFT JOIN {{ ref('silver_fact_orders') }} o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.country