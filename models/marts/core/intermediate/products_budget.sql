WITH stg_products as (

    SELECT * FROM {{ ref('stg_products') }}

),
    stg_budget as(
    SELECT* FROM {{ref('stg_budget')}}
),

stg_products_budget as (

    SELECT
        a.product_id,
        a.price,
        a.name,
        a.inventory,
        b._row,
        b.quantity,
        b.month
    FROM stg_products a
    INNER JOIN stg_budget b
        ON a.product_id=b.product_id
)

select * from stg_products_budget
