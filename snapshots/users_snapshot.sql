{% snapshot users_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='user_id',
      strategy='timestamp',
      updated_at='date_load',
    )
}}

select * from {{ ref('stg_users') }}

{% endsnapshot %}