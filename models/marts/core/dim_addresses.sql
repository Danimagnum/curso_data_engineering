{{
  config(
    materialized='table'
  )
}}
with stg_addresses as (

    select * from {{ ref('stg_addresses') }}

),

dim_addresses as (

    select*
    from stg_addresses

)

select * from dim_addresses
