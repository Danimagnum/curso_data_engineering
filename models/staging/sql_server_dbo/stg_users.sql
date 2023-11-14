with src_users as (

    select * from {{ source('sql_server_dbo', 'users') }}

),

stg_users as (

    select
        user_id,
        updated_at,
        address_id,
        last_name,
        created_at,
        phone_number,
        total_orders,
        first_name,
        email,
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_users

)

select * from stg_users
