{% snapshot order_items_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='date_load',
    )
}}

select * from {{ ref('stg_order_items') }}

{% endsnapshot %}