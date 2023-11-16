with src_products as (

    select * from {{ source('sql_server_dbo', 'products') }}

),

stg_products as (

    select
        product_id::Varchar(50),
        (replace(PRICE,',','.'))::decimal as price,
        name::varchar(100),
        inventory::number(38,0),
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_products

)

select * from stg_products
