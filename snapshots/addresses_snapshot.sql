{% snapshot addresses_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='address_id',
      strategy='timestamp',
      updated_at='date_load',
    )
}}

select * from {{ ref('stg_addresses') }}

{% endsnapshot %}