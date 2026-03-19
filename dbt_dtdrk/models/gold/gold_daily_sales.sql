{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom','gold']
) }}

SELECT
    d.date,
    d.year,
    d.month,

    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue

FROM {{ ref('silver_fact_orders') }} o

LEFT JOIN {{ ref('silver_dim_date') }} d
    ON o.order_date = d.date

GROUP BY
    d.date,
    d.year,
    d.month