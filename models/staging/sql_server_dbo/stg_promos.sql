with src_promos as (

    select * from {{ source('sql_server_dbo', 'promos') }}

),

stg_promos as (

    select
        promo_id,
        discount,
        status,
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_promos

)

select * from stg_promos