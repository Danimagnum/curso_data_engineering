/*Este código se utiliza para cargar datos desde la tabla referenciada 
'stg_orders' en una tabla destino 'time_delivery', y la tabla destino 
se configura como una tabla regular (materialized='table'). Luego, se 
realiza una consulta que calcula y presenta el tiempo promedio de 
entrega en días. La columna resultante se llama 'days_AVG'.*/
{{
  config(
    materialized='table'
  )
}}
with stg_orders as (

    select * from {{ ref('stg_orders') }}

),

time_delivery as (

    select*
    from stg_orders

)
SELECT
    AVG(DATEDIFF(day,order_created_at,delivered_at)) as days_AVG
   
FROM time_delivery