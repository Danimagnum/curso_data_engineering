/*Este código se utiliza para analizar las pedidos en función 
del genero de los usuarios.La consulta final presenta el número 
total de pedidos para hombre y mujer.*/
WITH users_events as (

    SELECT * FROM {{ ref('users_events') }}

),

orders_birth as (

    SELECT *
     
    FROM users_events
    
)

SELECT
    genere,
    COUNT(order_id) AS total_orders
FROM orders_birth
WHERE genere IS NOT NULL
GROUP BY genere
ORDER BY total_orders 
