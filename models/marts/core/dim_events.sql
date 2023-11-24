with stg_events as (

    select * from {{ ref('stg_events') }}

),

dim_events as (

    select
        event_id,
        event_type,
        session_id,
        events_created_at,
        order_id

    from stg_events

)

select * from dim_events