with src_budget as (

    select * from {{ source('google_sheets', 'budget') }}

),

stg_budget as (

    select
        _row,
        quantity::number(38,0) as quantity,
        month::timestamp_ntz as month,
        product_id::Varchar(50) as product_id,
        _fivetran_synced AS date_load

    from src_budget

)

select * from stg_budget
