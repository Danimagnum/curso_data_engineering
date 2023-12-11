/*Este código se utiliza para cargar datos desde la tabla referenciada 
'stg_users' en una tabla destino 'number_users', y la tabla destino se 
configura como una tabla regular (materialized='table'). Luego, se 
realiza una consulta que cuenta y presenta el número total de registros 
en la CTE number_users.*/
{{
  config(
    materialized='table'
  )
}}
with stg_users as (

    select * from {{ ref('stg_users') }}

),

number_users as (

    select*
    from stg_users

)
SELECT
    COUNT(*) as user_id
FROM number_users