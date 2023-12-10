/*Este código se utiliza para cargar datos desde la tabla referenciada 
'products_order_items' en una tabla destino 'fct_order_items', y la 
tabla destino se configura como una tabla regular (materialized='table'). */
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