select * from {{ ref('reviews_fct') }} fct
left join {{ ref('dims_listing_cleansed') }} clean
using (listing_id)
where fct.review_date < clean.created_at