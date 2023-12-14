/*Este código se utiliza para contar el número total de pedidos 
para cada combinación de usuario, género y promoción, excluyendo 
aquellos sin promoción, utilizando las tablas 'events_orders' y 
'stg_users'. Los resultados se presentan en una tabla final llamada
 'most_promos_products_users'.*/
{{
  config(
    materialized='table'
  )
}}
WITH events_orders as (

    SELECT * FROM {{ ref('events_orders') }}

),
    stg_users as(
    SELECT* FROM {{ref('stg_users')}}
),

most_promos_users as (

    SELECT
        a.event_id,
        a.event_type,
        a.product_id,
        a.order_id,
        a.shipping_service,
        a.shipping_cost,
        a.address_id,
        a.promo_id,
        a.order_cost,
        a.order_total,
        b.user_id,
        b.genere,
        b.birth
    FROM events_orders a
    INNER JOIN stg_users b
        ON a.user_id=b.user_id
)

SELECT
    user_id,
    genere,
    birth,
    promo_id,
    COUNT(order_id) as total_orders
FROM most_promos_users
WHERE promo_id!='no_promo'
GROUP BY user_id,genere,birth,promo_id
