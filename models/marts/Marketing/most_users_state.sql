/* este código se utiliza para contar el número de 
usuarios por estado utilizando la tabla 'users_addresess'
 y presenta los resultados en una tabla final llamada 
 'most_users_state'. La tabla final incluirá dos columnas: 
 'state' y 'user_count', mostrando la cantidad de usuarios
  para cada estado en orden ascendente*/

{{
  config(
    materialized='table'
  )
}}
with users_addresess as (

    select * from {{ ref('users_addresess') }}

),
most_users_state as (

    select*
    from users_addresess

)
SELECT
    state,
    COUNT(user_id) AS user_count
FROM most_users_state
GROUP BY state
ORDER BY user_count ASC
