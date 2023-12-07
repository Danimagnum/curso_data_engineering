{{
  config(
    materialized='table'
  )
}}
with orders_addresses as (

    select * from {{ ref('orders_addresses') }}

),

longest_arrive as (

    select*
    from orders_addresses

)
SELECT
    state,
    COUNT(*) AS total_envios,
    AVG(CASE WHEN delivered_at IS NOT NULL THEN order_created_at - delivered_at ELSE NULL END) AS avg_delivered
FROM longest_arrive
GROUP BY state
ORDER BY avg_delivered DESC