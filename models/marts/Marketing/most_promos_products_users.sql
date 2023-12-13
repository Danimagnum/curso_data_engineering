WITH events_orders as (

    SELECT * FROM {{ ref('events_orders') }}

),
    stg_users as(
    SELECT* FROM {{ref('stg_users')}}
),

most_promos_products_users as (

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

select 
    user_id,
    promo_id,
    product_id,
    COUNT(order_id) as total_orders
 from most_promos_products_users
