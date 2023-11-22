{{ config(
  materialized='table'
) }}

with src_promos as (
    select * from {{ source('sql_server_dbo', 'promos') }}
),

stg_promos as (
    select
        promo_id::VARCHAR (30) as promo_type,
        discount::FLOAT as discount,
        status::VARCHAR(50) as promo_status,
        {{dbt_utils.generate_surrogate_key(['promo_id'])}}::STRING as promo_id,
        _fivetran_synced::timestamp_ntz(9) as date_load
    from src_promos
)

select 
    promo_type,
    discount_usd,
    promo_status,
    promo_id
from stg_promos
union all 
SELECT 
    'sin_promo' ,
    0 , 
    'inactive' ,
    {{dbt_utils.generate_surrogate_key(['9999'])}}
