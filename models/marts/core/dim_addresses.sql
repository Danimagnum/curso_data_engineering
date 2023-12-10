/*Este código se utiliza para cargar datos desde la tabla referenciada 
'stg_addresses' en una tabla destino 'dim_addresses', y la tabla destino 
se configura como una tabla regular (materialized='table').*/

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
