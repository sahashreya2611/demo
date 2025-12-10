select 
*
from {{ source('demo', 'call_center') }}
limit 10