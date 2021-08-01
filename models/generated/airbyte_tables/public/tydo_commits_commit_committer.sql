{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_commit_hashid,
    {{ adapter.quote('date') }},
    {{ adapter.quote('name') }},
    email,
    _airbyte_emitted_at,
    _airbyte_committer_hashid
from {{ ref('tydo_commits_commit_committer_ab3') }}
-- committer at tydo_commits/commit/committer from {{ ref('tydo_commits_commit') }}

