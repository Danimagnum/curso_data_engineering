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
    AVG(inventory - quantity) AS avg_inventory_diff
FROM avg_quantity_inventory
