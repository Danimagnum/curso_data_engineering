/*Este código se utiliza para cargar datos desde la tabla referenciada 
'stg_promos' en una tabla destino 'dim_promos', y la tabla destino 
se configura como una tabla regular (materialized='table')*/
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
