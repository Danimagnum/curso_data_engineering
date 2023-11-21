{% snapshot users_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='user_id',
      strategy='check',
      check_cols=['first_name','last_name','address_id','phone_number'],
    )
}}

select * from {{ ref( 'incremental_users') }}
where f_carga > (select max(f_carga) from {{ 'incremental_users' }})

{% endsnapshot %}