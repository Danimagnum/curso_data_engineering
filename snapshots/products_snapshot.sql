{% snapshot products_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='product_id',
      strategy='check',
      check_cols=['price','name','inventory'],
    )
}}

select * from {{ ref('stg_products') }}

{% endsnapshot %}