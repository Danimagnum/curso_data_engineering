/*Este código se utiliza para cargar datos desde la tabla 
referenciada 'users_events' en una CTE llamada 'unique_session',
 donde se agrupan los eventos de usuarios por hora y se 
 cuentan las sesiones únicas para cada hora. Luego, se realiza 
 una consulta que calcula el promedio de sesiones únicas por hora. 
 La columna resultante se llama 'session_hour'.*/
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
