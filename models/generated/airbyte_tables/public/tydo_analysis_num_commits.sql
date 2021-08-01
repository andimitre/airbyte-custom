{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    count(_airbyte_commit_hashid) as num_commits,
    {{ adapter.quote('name') }} as name, 
    email
from {{ ref('tydo_commits_commit_author') }}
group by name, email
order by num_commits desc


