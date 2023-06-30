{% snapshot snapshots_stripe %}
{{
    config
    (
        target_database= "RAW",
        target_schema= "SNAPSHOT",
        unique_key = 'ID',
        strategy = 'timestamp',
        updated_at = '_BATCHED_AT'

    )
}}
    
    select * from {{source("stripe", "payment")}}

{% endsnapshot %}