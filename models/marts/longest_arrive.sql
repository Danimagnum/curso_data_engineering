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
    AVG(TIMESTAMPDIFF(DAY,order_created_at,delivered_at)) AS avg_delivered
FROM longest_arrive
WHERE delivered_at IS NOT NULL
GROUP BY state
ORDER BY avg_delivered DESC