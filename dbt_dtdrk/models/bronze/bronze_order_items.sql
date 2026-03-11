{{ config(
    database='dbt_ecom_dev',
    materialized='table',
    tags=['ecom']
) }}

SELECT 
    * 
    FROM {{ source('source', 'order_items') }}