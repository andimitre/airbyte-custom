{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_commit_hashid,
    sha,
    url,
    _airbyte_emitted_at,
    _airbyte_tree_hashid
from {{ ref('tydo_commits_commit_tree_ab3') }}
-- tree at tydo_commits/commit/tree from {{ ref('tydo_commits_commit') }}

