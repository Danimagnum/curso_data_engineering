{{
  config(
    materialized='table'
  )
}}
  WITH genere_birth as (

    select * from {{ ref('genere_birth') }}
),

base_genere_birth as (

    select * FROM genere_birth

)
select * from base_genere_birth