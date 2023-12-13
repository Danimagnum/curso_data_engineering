/* Este código se utiliza para cargar datos desde la tabla referenciada 
'stg_order_items' en una tabla destino 'dim_order_items', y la tabla 
destino se configura como una tabla regular (materialized='table').*/
{{
  config(
    materialized='incremental',
    unique_key='order_id'
  )
}}
with stg_order_items as (

    select * from {{ ref('stg_order_items') }}

),

dim_order_items as (

    select
        order_id,
        product_id,
        quantity
    from stg_order_items
)
select * from dim_order_items
