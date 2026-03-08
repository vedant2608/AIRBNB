{{
    config(
        materialized='view'
    )
}}
with dims_host as (
    select * from {{ ref('src_hosts') }}
)
select 
    host_id,
    nvl(host_name,'Anonymouns') as host_name,
    is_superhost,
    created_at,
    updated_at
from dims_host dh