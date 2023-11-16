with src_users as (

    select * from {{ source('sql_server_dbo', 'users') }}

),

stg_users as (

    select
        user_id::varchar(50),
        updated_at::timestamp_ntz,
        address_id::varchar(50),
        last_name::varchar(50),
        created_at::timestamp_ntz,
        phone_number::varchar(20),
        total_orders::varchar(50),
        first_name::varchar(50),
        email::varchar(100),
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_users

)

select * from stg_users
