{{
  config(
    materialized='table'
  )
}}
with products_budget as (

    select * from {{ ref('products_budget') }}

),

fct_budget as (

    select
        product_id,
        name,
        quantity,
        price,
        month
               
    from products_budget

)

select * from fct_budget