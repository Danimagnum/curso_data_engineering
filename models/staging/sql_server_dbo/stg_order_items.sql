with src_order_items as (

    select * from {{ source('sql_server_dbo', 'order_items') }}

),

stg_order_items as (

    select
        order_id::varchar(50) as order_id,
        product_id::varchar(50) as product_id,
        quantity::number(38,0) as quantity,
        _fivetran_deleted,
        _fivetran_synced AS date_load
    from src_order_items

)

select * from stg_order_items
