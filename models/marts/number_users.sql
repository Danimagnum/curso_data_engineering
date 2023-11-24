{{
  config(
    materialized='table'
  )
}}
with stg_users as (

    select * from {{ ref('stg_users') }}

),

number_users as (

    select*
    from stg_users

)
SELECT
    COUNT(*) as user_id
FROM number_users