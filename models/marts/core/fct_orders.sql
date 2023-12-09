WITH orders_orders_items as (

    SELECT * FROM {{ ref('orders_orders_items') }}

),
fct_orders as (

    SELECT
        *
    FROM orders_orders_items
)

select * from fct_orders
