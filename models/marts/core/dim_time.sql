{{
  config(
    materialized='table'
  )
}}
with stg_time as (

    select * from {{ ref('stg_time') }}

),

dim_time as (

    select*
    from stg_time

)

select * from dim_time