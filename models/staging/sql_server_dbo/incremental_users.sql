{{ config(
    materialized='incremental',
    unique_key='user_id',
    invalidate_hard_deletes=True
    ) 
    }}


WITH stg_users_incremental AS (
    SELECT * 
    FROM {{ source('sql_server_dbo','users') }}
{% if is_incremental() %}

	  where _fivetran_synced > (select max(f_carga) from {{ this }})

{% endif %}
    ),

increm_users AS (
    SELECT
        user_id::varchar(50) as user_id,
        address_id::varchar(50) as address_id,
        last_name::varchar(50) as last_name,
        REPLACE(phone_number, '-', '')::varchar(20) as phone_number,
        first_name::varchar(50) as first_name,
        _fivetran_synced AS f_carga
    FROM stg_users_incremental
    )

SELECT * FROM increm_users

