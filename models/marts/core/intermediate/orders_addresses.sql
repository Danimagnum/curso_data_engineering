/*Este código se utiliza para combinar datos de las tablas
 'stg_orders' y 'stg_addresses' mediante la columna 'address_id' y
  presenta los resultados en una nueva tabla llamada 'stg_orders_addresses'. */
WITH stg_orders as (

    SELECT * FROM {{ ref('stg_orders') }}

),
    stg_addresses as(
    SELECT* FROM {{ref('stg_addresses')}}
),

stg_orders_addresses as (

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
        b.zipcode,
        b.country,
        b.address,
        b.state
    FROM stg_orders a
    INNER JOIN stg_addresses b
        ON a.address_id=b.address_id
)

select * from stg_orders_addresses
