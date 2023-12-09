{{
  config(
    materialized='table'
  )
}}
with stg_orders as (

    select * from {{ ref('stg_orders') }}

),

time_delivery as (

    select*
    from stg_orders

)
SELECT
    AVG(DATEDIFF(day,order_created_at,delivered_at)) as days_AVG
   
FROM time_delivery