with src_events as (

    select * from {{ source('sql_server_dbo', 'events') }}

),

stg_events as (

    select
        event_id::varchar(50) as event_id,
        page_url::varchar(200) as page_url,
        event_type::varchar(50) as event_type,
        user_id::varchar(50) as user_id,
        product_id::varchar(50) as product_id,
        session_id::varchar(50) as session_id,
        created_at::timestamp_ntz as events_created_at,
        order_id::varchar(50) as order_id,
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_events

)

select * from stg_events
