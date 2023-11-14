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
        a.total_orders,
        a.first_name,
        a.email,
        b.zipcode,
        b.country,
        b.address,
        b.state
    FROM stg_users a
    INNER JOIN stg_addresses b
        ON a.address_id=b.address_id
)

select * from stg_users_addresses
