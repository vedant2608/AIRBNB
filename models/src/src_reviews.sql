with src_reviews as (
    select * from {{ source('airbnb','reviews') }}
)
select 
    LISTING_ID,
    DATE as review_date,
    REVIEWER_NAME,
    COMMENTS as review_text,
    SENTIMENT as review_sentiment
from src_reviews