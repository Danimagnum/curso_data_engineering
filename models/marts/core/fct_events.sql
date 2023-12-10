/*Este código se utiliza para cargar datos desde la tabla 
referenciada 'users_events' en una tabla destino 'fct_events',
 y la tabla destino se configura como una tabla regular (materialized='table'). */
with users_events as (

    select * from {{ ref('users_events') }}

),

fct_events as (

    select
        event_id,
        user_id,
        event_type,
        session_id,
        events_created_at,
        order_id,
        product_id

    from users_events

)

select * from fct_events