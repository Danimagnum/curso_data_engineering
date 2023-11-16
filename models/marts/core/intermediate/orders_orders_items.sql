WITH stg_orders as (

    SELECT * FROM {{ ref('stg_orders') }}

),
    stg_order_items as(
    SELECT* FROM {{ref('stg_order_items')}}
),

stg_orders_order_items as (

    SELECT
        a.order_id,
        a.shipping_service,
        a.shipping_cost,
        a.address_id,
        a.created_at,
        a.promo_id,
        a.estimated_delivery_at,
        a.order_cost,
        a.user_id,
        a.order_total,
        a.delivered_at,
        a.tracking_id,
        a.status,
        b.product_id,
        b.quantity
    FROM stg_orders a
    INNER JOIN stg_order_items b
        ON a.order_id=b.order_id
)

select * from stg_orders_order_items
