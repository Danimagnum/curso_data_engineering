/*este código se utiliza para realizar una combinación de todas las filas 
de 'base_users' con todas las filas de 'base_genere_birth' y cargar el 
resultado en la tabla destino 'stg_users'. */
{{
  config(
    materialized='view',
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
