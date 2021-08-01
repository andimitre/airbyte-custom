{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_commit_hashid,
    {{ json_extract_scalar('verification', ['reason']) }} as reason,
    {{ json_extract_scalar('verification', ['payload']) }} as payload,
    {{ json_extract_scalar('verification', ['verified']) }} as verified,
    {{ json_extract_scalar('verification', ['signature']) }} as signature,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit') }}
where verification is not null
-- verification at tydo_commits/commit/verification

