/*Este código se utiliza para cargar datos desde la tabla 'order_items' en la fuente a la tabla destino 'stg_order_items'.*/
{{
  config(
    materialized='incremental',
    unique_key='order_id'
  )
}}
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
{% if is_incremental() %}

	  where _fivetran_synced > (select max(date_load) from {{ this }})

{% endif %}
)

select * from stg_order_items
