with src_products as (

    select * from {{ source('sql_server_dbo', 'products') }}

),

stg_products as (

    select
        product_id::Varchar(50) as product_id,
        (replace(PRICE,',','.'))::decimal as price,
        name::varchar(100) as name,
        inventory::number(38,0) as inventory,
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_products

)

select * from stg_products
