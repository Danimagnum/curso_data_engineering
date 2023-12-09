WITH users_events as (

    SELECT * FROM {{ ref('users_events') }}

),

orders_birth as (

    SELECT *
     
    FROM users_events
    
)

SELECT
    CASE
        WHEN birth BETWEEN 1961 AND 1980 THEN '50'
        WHEN birth BETWEEN 1981 AND 2000 THEN '30'
        WHEN birth BETWEEN 2001 AND 2020 THEN '20'
        ELSE '+56'
    END AS age_group,
    COUNT(order_id) AS total_orders
FROM orders_birth
WHERE order_id != 'no_order'
GROUP BY age_group
ORDER BY age_group DESC
