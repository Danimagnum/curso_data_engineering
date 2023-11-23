with stg_events as (

    select * from {{ ref('stg_events') }}

),

dim_events as (

    select
        event_id,
        event_type,
        user_id,
        decode(product_id,'','processing_order',product_id),
        session_id,
        created_at,
        decode(order_id,'','no_order',order_id),

    from stg_events

)

select * from dim_events