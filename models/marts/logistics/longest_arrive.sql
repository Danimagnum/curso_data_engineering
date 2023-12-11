/*este código se utiliza para cargar datos desde la tabla referenciada 
'orders_addresses' en una tabla destino 'longest_arrive', y la tabla 
destino se configura como una tabla regular (materialized='table'). 
Luego, se realiza una consulta que calcula y presenta el tiempo 
promedio de entrega para cada estado, excluyendo aquellos pedidos 
que aún no han sido entregados.*/

{{
  config(
    materialized='table'
  )
}}
with orders_addresses as (

    select * from {{ ref('orders_addresses') }}

),

longest_arrive as (

    select*
    from orders_addresses

)
SELECT
    state,
    ROUND(AVG(TIMESTAMPDIFF(DAY,order_created_at,delivered_at)),2) AS avg_delivered
FROM longest_arrive
WHERE delivered_at IS NOT NULL
GROUP BY state
ORDER BY avg_delivered DESC