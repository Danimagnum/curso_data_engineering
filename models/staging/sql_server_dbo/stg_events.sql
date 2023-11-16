with src_events as (

    select * from {{ source('sql_server_dbo', 'events') }}

),

stg_events as (

    select
        event_id::varchar(50),
        page_url::varchar(200),
        event_type::varchar(50),
        user_id::varchar(50),
        product_id::varchar(50),
        session_id::varchar(50),
        created_at::timestamp_ntz,
        order_id::varchar(50),
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_events

)

select * from stg_events
