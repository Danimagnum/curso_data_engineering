/*Este código se utiliza para cargar datos desde la tabla 
referenciada 'stg_products' en una tabla destino 'dim_products', 
y la tabla destino se configura como una tabla regular (materialized='table').*/
{{
  config(
    materialized='table'
  )
}}
with stg_products as (

    select * from {{ ref('stg_products')}}

),

dim_products as (

    select*
    from stg_products

)

select * from dim_products