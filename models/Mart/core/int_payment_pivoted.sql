{% set payments = ["credit_card", "coupon", "bank_transfer", "gift_card"] %}
with
    src as (select * from {{ source("stripe", "payment") }}),
    pivoted as (
        select
            orderid,
            {%- for p in payments -%}
                sum(
                    case when paymentmethod = '{{p}}' then amount else 0 end
                ) as {{ p }}_total_amt
                {% if not loop.last %}, {% endif %}

            {%- endfor %}
        from src
        group by 1
    )
select *
from pivoted
