{%macro generate_schema_name(custom_schema_name, node)%}
    {%set default_schema_name = target.schema%}
    {% if schema_name is none%}
        {{default_schema}}
    {%elif env_var('DBT_ENV_VAR','') == 'prod'%}
        {{custom_schema_name| trim}}
    {%else%}
        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%endmacro%}