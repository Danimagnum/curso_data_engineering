WITH stg_orders as (

    SELECT * FROM {{ ref('stg_orders') }}

),
    stg_promos as(
    SELECT* FROM {{ref('stg_promos')}}
),

stg_orders_promos as (

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
        b.discount,
        b.promos_status
    FROM stg_orders a
    INNER JOIN stg_promos b
        ON a.promo_id=b.promo_id
)

select * from stg_orders_promos