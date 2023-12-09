{{
  config(
    materialized='table'
  )
}}
with stg_orders as (

    select * from {{ ref('stg_orders') }}

),

orders_users as (

    select*
    from stg_orders

)
SELECT
    user_id,
    COUNT(order_id) as n_pedidos
FROM orders_users
group by user_id
--having n_pedidos = 1 OR n_pedidos = 2 OR n_pedidos = 3
