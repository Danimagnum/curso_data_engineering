/*Este código se utiliza para cargar datos desde la tabla referenciada 
'genere_birth' en una tabla destino 'base_genere_birth'*/

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