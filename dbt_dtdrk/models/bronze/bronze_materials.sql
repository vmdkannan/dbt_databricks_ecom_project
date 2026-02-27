{{ config(
    database='dbt_industry_dev',
    materialized='table',
    tags=['industry']
) }}

SELECT 
    * 
    FROM {{ source('industry_source', 'materials') }}