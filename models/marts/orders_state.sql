{{
  config(
    materialized='table'
  )
}}
with orders_addresses as (

    select * from {{ ref('orders_addresses') }}

),

orders_state as (

    select*
    from orders_addresses

)
SELECT
    state,
    COUNT(*) as total_orders
FROM orders_state
GROUP BY state
ORDER BY total_orders DESC