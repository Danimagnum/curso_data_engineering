{% snapshot events_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='event_id',
      strategy='timestamp',
      updated_at='date_load',
    )
}}

select * from {{ ref('stg_events') }}

{% endsnapshot %}