/*Este código se utiliza para cargar datos desde la tabla referenciada 
'orders_addresses' en una tabla destino 'orders_state', y la tabla 
destino se configura como una tabla regular (materialized='table'). 
Luego, se realiza una consulta que cuenta y presenta el número total 
de pedidos para cada estado. La columna resultante se llama 'total_orders'.*/
{{
  config(
    materialized='table'
  )
}}
with orders_addresses as (

    select * from {{ ref('orders_addresses') }}

),

orders_state as (

    select*
    from orders_addresses

)
SELECT
    state,
    COUNT(*) as total_orders
FROM orders_state
GROUP BY state
ORDER BY total_orders DESC