with src_orders as (

    select * from {{ source('sql_server_dbo', 'orders') }}

),

stg_orders as (

    select
        order_id::varchar(50),
        shipping_service::varchar(20),
       (replace(SHIPPING_COST,',','.'))::decimal as shipping_cost,
        address_id::varchar(50),
        created_at::timestamp_ntz,
         IFNULL(promo_id,'N/A') as promo_id,
        estimated_delivery_at::timestamp_ntz,
        (replace(ORDER_COST,',','.'))::decimal as order_cost,
        user_id::varchar(50),
        (replace(ORDER_TOTAL,',','.'))::decimal as order_total,
        delivered_at::timestamp_ntz,
        tracking_id::varchar(50),
        status::varchar(20),
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_orders

)

select * from stg_orders
