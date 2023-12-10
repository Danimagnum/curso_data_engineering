/*este código se utiliza para cargar datos desde la tabla referenciada
 'dim_shipping_service' en una tabla destino 'cheapest_shipping_service', 
 y la tabla destino se configura como una tabla regular (materialized='table').
  Luego, se realiza una consulta que calcula y presenta el costo promedio de 
  envío para cada servicio de envío.*/

{{
  config(
    materialized='table'
  )
}}
with dim_shipping_service as (

    select * from {{ ref('dim_shipping_service') }}

),
cheapest_shipping_service as (

    select*
    from dim_shipping_service

)
SELECT
    shipping_service,
    AVG(shipping_cost) AS avg_cost
FROM cheapest_shipping_service
GROUP BY shipping_service
ORDER BY avg_cost ASC
