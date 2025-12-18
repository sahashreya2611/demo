{{ config(materialized='table') }}

with cte1 as (
select t.* ,
w.*
from {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.trip_dt=w.date_weather
)

select * from cte1