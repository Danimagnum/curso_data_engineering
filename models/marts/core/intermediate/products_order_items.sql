/*Este código se utiliza para combinar datos de las 
tablas 'stg_products' y 'stg_order_items' mediante 
la columna 'product_id' y presenta los resultados 
en una nueva tabla llamada 'products_order_items'.*/
WITH stg_products as (

    SELECT * FROM {{ ref('stg_products') }}

),
    stg_order_items as(
    SELECT* FROM {{ref('stg_order_items')}}
),

products_order_items as (

    SELECT
        a.product_id,
        a.price,
        a.name,
        a.inventory,
        b.order_id,
        b.quantity
    FROM stg_products a
    INNER JOIN stg_order_items b
        ON a.product_id=b.product_id
)

select * from products_order_items