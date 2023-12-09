WITH users_events as (

    SELECT * FROM {{ ref('users_events') }}

),

orders_birth as (

    SELECT *
     
    FROM users_events
    
)

SELECT
    CASE
        WHEN CURRENT_DATE - birth BETWEEN 18 AND DATEADD('YEAR', 29, orders_birth.birth) THEN '18-29'
        WHEN CURRENT_DATE - birth BETWEEN 30 AND DATEADD('YEAR', 39, orders_birth.birth) THEN '30-39'
        WHEN CURRENT_DATE - birth BETWEEN 40 AND DATEADD('YEAR', 49, orders_birth.birth) THEN '40-49'
        ELSE '56+'
    END AS age_group,
    COUNT(order_id) AS total_orders
FROM orders_birth
WHERE order_id != 'no_order'
GROUP BY age_group
ORDER BY age_group
