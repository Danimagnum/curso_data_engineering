{{
  config(
    materialized='table'
  )
}}

with 
    base_users as (

    select * from {{ ref('base_users') }}
),
    genere_birth as (

    select * from {{ ref('genere_birth') }}
),

stg_users as (

    select * FROM base_users
    CROSS JOIN genere_birth

)
select * from stg_users