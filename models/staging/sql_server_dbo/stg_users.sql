{{
  config(
    materialized='table'
  )
}}

with 
    base_users as (

    select * from {{ ref('base_users') }}
),
    base_genere_birth as (

    select * from {{ ref('base_genere_birth') }}
),

stg_users as (

    select * FROM base_users
    CROSS JOIN base_genere_birth

)
select * from stg_users