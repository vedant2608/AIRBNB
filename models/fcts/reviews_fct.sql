{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}
with reviews_fct as(
    select * from {{ ref('src_reviews') }}
)
select * from reviews_fct
where review_date is not null
{% if is_incremental()%}
and review_date > (select max(review_date) from {{ this }})
{%endif%}