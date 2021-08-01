{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_commit_hashid,
    reason,
    payload,
    verified,
    signature,
    _airbyte_emitted_at,
    _airbyte_verification_hashid
from {{ ref('tydo_commits_commit_verification_ab3') }}
-- verification at tydo_commits/commit/verification from {{ ref('tydo_commits_commit') }}

