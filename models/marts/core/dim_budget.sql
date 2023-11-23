{{
  config(
    materialized='table'
  )
}}
with stg_budget as (

    select * from {{ ref('stg_budget') }}

),

dim_budget as (

    select
        quantity,
        month,
        product_id,
    from stg_budget

)

select * from dim_budget