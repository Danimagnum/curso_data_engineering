WITH products_order_items as (

    SELECT * FROM {{ ref('products_order_items') }}

),
fct_order_items as (

    SELECT
        product_id,
        price,
        name,
        inventory,
        order_id,
        quantity
    FROM products_order_items
)

select * from fct_order_items