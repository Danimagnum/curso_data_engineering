SELECT *
FROM {{ ref('stg_orders') }}
WHERE delivered_at < order_created_at