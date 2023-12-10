/*este código se utiliza para combinar datos de las tablas 
'stg_users' y 'stg_addresses' mediante la columna 'address_id' 
y presenta los resultados en una nueva tabla llamada 'stg_users_addresses'. 
La tabla final incluirá información de usuarios y direcciones relacionadas.*/
WITH stg_users as (

    SELECT * FROM {{ ref('stg_users') }}

),
    stg_addresses as(
    SELECT* FROM {{ref('stg_addresses')}}
),

stg_users_addresses as (

    SELECT
        a.user_id,
        a.updated_at,
        a.address_id,
        a.last_name,
        a.created_at,
        a.phone_number,
        a.first_name,
        a.email,
        a.genere,
        a.birth,
        b.zipcode,
        b.country,
        b.address,
        b.state
    FROM stg_users a
    INNER JOIN stg_addresses b
        ON a.address_id=b.address_id
)

select * from stg_users_addresses
