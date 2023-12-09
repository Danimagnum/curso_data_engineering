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