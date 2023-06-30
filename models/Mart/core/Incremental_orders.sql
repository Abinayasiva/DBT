{{
    config(
        materilized="incremental",
        unique_key= "ID"
        
    )
}}
select *  from {{source('jaffle_shop','orders') }}

{% if is_incremental() %}
    where _ETL_LOADED_AT > select max(_ETL_LOADED_AT) from {{this}}

{%endif%}