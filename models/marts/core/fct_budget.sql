/*Este código se utiliza para cargar datos desde la tabla referenciada 
'products_budget' en una tabla destino 'fct_budget', y la tabla destino
 se configura como una tabla regular (materialized='table').*/
{{
  config(
    materialized='table',
  )
}}
with products_budget as (

    select * from {{ ref('products_budget') }}

),

fct_budget as (

    select
        product_id,
        name,
        quantity,
        price,
        month
               
    from products_budget
)

select * from fct_budget