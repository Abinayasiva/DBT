{% macro select_dist(table_name, column_name) %}
    {% set query = "select distinct {{column_name}} from {{ ref(table_name) }} " %}
    {% set distinct_values = run_query(query) %}

    {% set value_list = distinct_values.columns[0].values() %}

    {{ value_list }}
{% endmacro %}


