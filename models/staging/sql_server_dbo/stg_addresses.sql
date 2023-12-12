/*Este código se utiliza para cargar datos desde la tabla 'addresses' en la fuente 
a la tabla destino 'stg_addresses', realizando algunas transformaciones en el proceso. */
{{
  config(
    materialized='view',
  )
}}

with src_addresses as (

    select * from {{ source('sql_server_dbo', 'addresses') }}

),

stg_addresses as (

    select
        address_id::VARCHAR(256) as address_id,
        zipcode::VARCHAR(256) as zipcode,
        country::VARCHAR(256) as country,
        address::VARCHAR(256) as address,
        state::VARCHAR(256) as state,
        _fivetran_deleted,
        _fivetran_synced AS date_load

    from src_addresses

)

select * from stg_addresses
