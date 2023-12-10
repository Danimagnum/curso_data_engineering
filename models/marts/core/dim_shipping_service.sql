/*Este código se utiliza para cargar datos desde la tabla referenciada 
'stg_orders' en una tabla destino 'dim_shipping_service', y la tabla 
destino se configura como una tabla regular (materialized='table'). */
{{
  config(
    materialized='table'
  )
}}
with stg_orders as (

    select * from {{ ref('stg_orders') }}

),

dim_shipping_service as (

    select
        shipping_service,
        shipping_cost,
        tracking_id
    from stg_orders

)

select * from dim_shipping_service
