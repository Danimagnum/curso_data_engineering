/*Este código se utiliza para generar una dimensión de fechas utilizando 
dbt_date.get_date_dimension y seleccionar algunos atributos específicos 
de esa dimensión para cargarlos en la tabla destino 'stg_time'.*/

with src_time as (

    {{ dbt_date.get_date_dimension('2015-01-01', '2022-12-31') }}

),

stg_time as (

    select 
        date_day as dia,
        day_of_week,
        month_of_year,
        year_number

        
    from src_time

)

select * from stg_time

