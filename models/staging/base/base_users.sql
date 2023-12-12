/*Este código se utiliza para cargar datos desde la tabla 'users' 
en la fuente de datos a la tabla destino 'base_users'. */
with src_users as (

    select * from {{ source('sql_server_dbo', 'users') }}

),

base_users as (

    select
        user_id::varchar(50) as user_id,
        to_date(updated_at) as updated_at,
        address_id::varchar(50) as address_id,
        last_name::varchar(50) as last_name,
        to_date(created_at) as created_at,
        phone_number::varchar(20) as phone_number,
        first_name::varchar(50) as first_name,
        email::varchar(100) as email,
        _fivetran_synced AS date_load

    from src_users

)

select * from base_users
