{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='date_load',
    )
}}

select * from {{ ref('stg_orders') }}

{% endsnapshot %}