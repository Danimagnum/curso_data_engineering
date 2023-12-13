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
