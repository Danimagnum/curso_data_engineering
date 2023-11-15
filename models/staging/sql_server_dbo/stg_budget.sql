with src_budget as (

    select * from {{ source('google_sheets', 'budget') }}

),

stg_budget as (

    select
        _row,
        quantity,
        month,
        product_id,
        _fivetran_synced AS date_load

    from src_budget

)

select * from stg_budget
