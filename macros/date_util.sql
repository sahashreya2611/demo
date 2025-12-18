
{% macro function1(x) %}

case when to_timestamp({{x}}) < CURRENT_DATE then 'past'
else 'future'  end as mode

{% endmacro %}