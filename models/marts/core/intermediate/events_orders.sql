WITH stg_events as (

    SELECT * FROM {{ ref('stg_events') }}

),
    stg_orders as(
    SELECT* FROM {{ref('stg_orders')}}
),

stg_events_orders as (

    SELECT
        a.event_id,
        a.page_url,
        a.event_type,
        a.user_id,
        a.product_id,
        a.session_id,
        a.created_at,
        a.order_id,
        b.shipping_service,
        b.shipping_cost,
        b.address_id,
        b.created_at,
        b.promo_id,
        b.estimated_delivery_at,
        b.order_cost,
        b.order_total,
        b.delivered_at,
        b.tracking_id,
        b.status
    FROM stg_events a
    INNER JOIN stg_orders b
        ON a.order_id=b.order_id
)

select * from stg_events_orders
