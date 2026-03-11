{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom']
) }}


WITH dates AS (
    SELECT explode(sequence(to_date('2024-01-01'), to_date('2024-12-31'), interval 1 day)) AS date
)
SELECT
    date,
    year(date) AS year,
    month(date) AS month,
    day(date) AS day,
    dayofweek(date) AS day_of_week,
    quarter(date) AS quarter,
    weekofyear(date) AS week_of_year,
    CASE WHEN dayofweek(date) IN (1,7) THEN true ELSE false END AS is_weekend
FROM dates