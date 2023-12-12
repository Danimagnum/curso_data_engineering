/*Este código se utiliza para cargar datos desde la tabla 'orders' 
en la fuente a la tabla destino 'stg_orders'. */
{{
  config(
    materialized='incremental',
    unique_key='order_id'
  )
}}
with src_orders as (

    select * from {{ source('sql_server_dbo', 'orders') }}

),

stg_orders as (

    select
        order_id::varchar(50) as order_id,
        decode(shipping_service,'','preparing',null,'preparing',shipping_service)::varchar(20) as shipping_service,
        SHIPPING_COST::decimal as shipping_cost,
        address_id::varchar(50) as address_id,
        to_date(created_at) as order_created_at,
        decode(promo_id,'','no_promo',null,'no_promo',promo_id) as promo_id,
        to_date(estimated_delivery_at) as estimated_delivery_at,
        ORDER_COST::decimal as order_cost,
        user_id::varchar(50) as user_id,
        (replace(ORDER_TOTAL,',','.'))::decimal as order_total,
        to_date(delivered_at) as delivered_at,
        decode(tracking_id,'','preparing',null,'preparing',tracking_id)::varchar(50) as tracking_id,
        status::varchar(20) as status,
        _fivetran_synced AS date_load

    from src_orders
{% if is_incremental() %}

	  where _fivetran_synced > (select max(date_load) from {{ this }})

{% endif %}
)

select * from stg_orders
