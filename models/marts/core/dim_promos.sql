{{
  config(
    materialized='table'
  )
}}
with stg_promos as (

    select * from {{ ref('stg_promos') }}

),

dim_promos as (

    select*
    from stg_promos

)

select * from dim_promos
