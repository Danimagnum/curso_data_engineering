/*este código se utiliza para calcular la diferencia promedio 
entre las columnas 'inventory' y 'quantity' para cada producto 
en la tabla 'products_budget' y presenta los resultados en una 
tabla final.*/
{{
  config(
    materialized='table'
  )
}}
with products_budget as (

    select * from {{ ref('products_budget') }}

),
avg_quantity_inventory as (

    select*
    from products_budget

)
SELECT
    product_id,
    (inventory - quantity) AS avg_inventory_diff
FROM avg_quantity_inventory
ORDER BY avg_inventory_diff ASC
