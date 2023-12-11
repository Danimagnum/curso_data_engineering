/*Este código se utiliza para calcular y presentar la cantidad total 
de productos vendidos por estado. Combina información de las tablas 
'orders_addresses' y 'stg_order_items' para obtener la información 
necesaria y luego realiza cálculos de agregación para determinar la 
cantidad total vendida por estado y producto.*/
WITH orders_addresses as (

    SELECT * FROM {{ ref('orders_addresses') }}

),
    stg_order_items as(
    SELECT* FROM {{ref('stg_order_items')}}
),

most_selling_state as (

    SELECT
        a.order_id,
        a.shipping_service,
        a.shipping_cost,
        a.address_id,
        a.order_created_at,
        a.promo_id,
        a.estimated_delivery_at,
        a.order_cost,
        a.user_id,
        a.order_total,
        a.delivered_at,
        a.tracking_id,
        a.status,
        a.zipcode,
        a.country,
        a.address,
        a.state,
        b.product_id,
        b.quantity
    FROM orders_addresses a
    INNER JOIN stg_order_items b
        ON a.order_id=b.order_id
)

 SELECT
        product_id,
        state,
        SUM(quantity) AS total_quantity
    FROM most_selling_state
    GROUP BY state, product_id
    ORDER BY total_quantity DESC