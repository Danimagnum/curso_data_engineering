/*Este código se utiliza para cargar datos desde la tabla 
referenciada 'orders_orders_items' en una tabla destino 
'fct_orders', y la tabla destino se configura como una tabla 
regular (materialized='table')*/
{{
  config(
    materialized='table',
  )
}}


WITH orders_orders_items as (

    SELECT * FROM {{ ref('orders_orders_items') }}

),
fct_orders as (

    SELECT
        *
    FROM orders_orders_items

)

select * from fct_orders
