
with users_events as (

    select * from {{ ref('users_events') }}

),

unique_session as (

    select 
        DATE_TRUNC('hour',created_at) as horas,
        COUNT(distinct session_id) as session_hour
    from users_events
    GROUP BY horas
)
SELECT
    
    AVG(session_hour) as session_hour
    
FROM unique_session

--AVG(session_hour) as n_session