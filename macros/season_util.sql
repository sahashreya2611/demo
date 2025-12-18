{% macro function2(x) %}

case
when month(to_timestamp({{x}})) in (12,1,2) then 'winter'
when month(to_timestamp({{x}})) in (3,4,5,6) then 'summer'
when month(to_timestamp({{x}})) in (7,8) then 'rainy'
else 'autumn'
end season

{% endmacro %}