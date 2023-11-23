{{
  config(
    materialized='table'
  )
}}
with stg_orders as (

    select * from {{ ref('stg_orders') }}

),

dim_shipping_service as (

    select
        shipping_service,
        shipping_cost,
        tracking_id,
    from stg_orders

)

select * from dim_shipping_service
