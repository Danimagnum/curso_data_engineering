with src_users as (

    select * from {{ source('sql_server_dbo', 'users') }}

),

stg_users as (

    select
        user_id::varchar(50) as user_id,
        updated_at::timestamp_ntz as updated_at,
        address_id::varchar(50) as address_id,
        last_name::varchar(50) as last_name,
        created_at::timestamp_ntz as created_at,
        phone_number::varchar(20) as phone_number,
        total_orders::varchar(50) as total_orders,
        first_name::varchar(50) as first_name,
        email::varchar(100) as email,
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_users

)

select * from stg_users
