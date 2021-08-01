{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_commit_hashid,
    {{ adapter.quote('date') }},
    {{ adapter.quote('name') }},
    email,
    author_id,
    _airbyte_emitted_at,
    _airbyte_author_hashid
from {{ ref('tydo_commits_commit_author_ab3') }}
-- author at tydo_commits/commit/author from {{ ref('tydo_commits_commit') }}

