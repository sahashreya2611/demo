{{ config(materialized='table') }}


with daily_weather as (

select 
date(time) as date_weather,
clouds,humidity,pressure,temp,weather
from {{ source('demo', 'weather') }}
),
daily_weather_agg as (

select date_weather, weather,
round(avg(clouds),2) as avg_clouds ,
round(avg(humidity),2) as avg_humidity,
round(avg(pressure),2) as avg_pressure,
round(avg(temp),2) as avg_temp
from daily_weather
group by date_weather,weather
qualify row_number() over (partition by date_weather order by count(weather) desc) =1
)

select * from daily_weather_agg

