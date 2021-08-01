{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_tydo_commits_hashid,
    url,
    tree,
    author,
    message,
    committer,
    verification,
    comment_count,
    author_id,
    _airbyte_emitted_at,
    _airbyte_commit_hashid
from {{ ref('tydo_commits_commit_ab3') }}
-- commit at tydo_commits/commit from {{ ref('tydo_commits') }}

