{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    sha,
    url,
    {{ adapter.quote('commit') }},
    node_id,
    parents,
    html_url,
    author_id,
    created_at,
    comments_url,
    committer_id,
    _ab_github_repository,
    _airbyte_emitted_at,
    _airbyte_tydo_commits_hashid
from {{ ref('tydo_commits_ab3') }}
-- tydo_commits from {{ source('public', '_airbyte_raw_tydo_commits') }}

