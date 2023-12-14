/*este código se utiliza para copiar todos los datos de la tabla 
'stg_time' a una nueva tabla llamada 'dim_time'. Ambas tablas 
son esencialmente iguales en este caso.*/
{{
  config(
    materialized='table'
  )
}}
with stg_time as (

    select * from {{ ref('stg_time') }}

),

dim_time as (

    select*
    from stg_time

)

select * from dim_time