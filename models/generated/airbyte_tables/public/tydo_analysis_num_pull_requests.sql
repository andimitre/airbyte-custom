{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    count(a.{{ adapter.quote('id') }}) as num_pull_requests,
    b.{{ adapter.quote('name') }}
from {{ ref('tydo_pull_requests') }} a 
inner join {{ ref('tydo_commits_commit_author') }} b
on a.user_id = b.author_id
group by b.{{ adapter.quote('name') }}
order by num_pull_requests desc

