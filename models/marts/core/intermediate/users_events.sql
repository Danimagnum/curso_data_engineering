/*Este código se utiliza para combinar datos de las tablas 
'stg_users' y 'stg_events' mediante la columna 'user_id'
 y presenta los resultados en una nueva tabla llamada 'stg_users_events'.
  La tabla final incluirá información de usuarios y eventos relacionados.*/
WITH stg_users as (

    SELECT * FROM {{ ref('stg_users') }}

),
    stg_events as(
    SELECT* FROM {{ref('stg_events')}}
),

stg_users_events as (

    SELECT
        a.user_id,
        a.updated_at,
        a.address_id,
        a.last_name,
        a.created_at,
        a.phone_number,
        a.first_name,
        a.email,
        a.genere,
        a.birth,
        b.event_id,
        b.page_url,
        b.event_type,
        b.product_id,
        b.session_id,
        b.events_created_at,
        b.order_id,
        b.date_load
    FROM stg_users a
    INNER JOIN stg_events b
        ON a.user_id=b.user_id
)

select * from stg_users_events
