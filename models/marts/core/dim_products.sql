{{
  config(
    materialized='table'
  )
}}
with stg_products as (

    select * from {{ ref('stg_products')}}

),

dim_products as (

    select*
    from stg_products

)

select * from dim_products