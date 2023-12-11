{% snapshot promos_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='promo_id',
      strategy='check',
      check_cols=['discount','promo_status'],
    )
}}

select * from {{ ref('stg_promos') }}

{% endsnapshot %}