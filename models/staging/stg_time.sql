with src_time as (

    {{ dbt_date.get_date_dimension('2015-01-01', '2022-12-31') }}

),

stg_time as (

    select *
        
    from src_time

)

select * from stg_time
