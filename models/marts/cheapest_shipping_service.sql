{{
  config(
    materialized='table'
  )
}}
with dim_shipping_service as (

    select * from {{ ref('dim_shipping_service') }}

),
cheapest_shipping_service as (

    select*
    from dim_shipping_service

)
SELECT
    shipping_service,
    AVG(shipping_cost) AS avg_cost
FROM cheapest_shipping_service
GROUP BY shipping_service
ORDER BY avg_cost ASC
