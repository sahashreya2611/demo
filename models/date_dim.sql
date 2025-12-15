with CTE AS (
select
STARTED_AT,
to_timestamp(STARTED_AT),
date(to_timestamp(STARTED_AT)) DATE_STARTED_AT,
hour(to_timestamp(STARTED_AT)) hour_STARTED_AT,
case 
when dayname(to_timestamp(STARTED_AT)) in ('Sat','Sun') then 'Weekend'
else 'BusinessDay'
end as day_type,
case
when month(to_timestamp(STARTED_AT)) in (12,1,2) then 'winter'
when month(to_timestamp(STARTED_AT)) in (3,4,5,6) then 'summer'
when month(to_timestamp(STARTED_AT)) in (7,8) then 'rainy'
else 'autumn'
end season
from {{ source('demo', 'bike') }}
where STARTED_AT!='started_at'
)
select * from CTE