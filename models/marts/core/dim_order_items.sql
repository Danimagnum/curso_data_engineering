{{
  config(
    materialized='table'
  )
}}
with stg_order_items as (

    select * from {{ ref('stg_order_items') }}

),

dim_order_items as (

    select
        order_id,
        product_id,
        quantity
    from stg_order_items
)
select * from dim_order_items
