{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_commit_hashid,
    {{ json_extract_scalar('committer', ['date']) }} as {{ adapter.quote('date') }},
    {{ json_extract_scalar('committer', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('committer', ['email']) }} as email,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit') }}
where committer is not null
-- committer at tydo_commits/commit/committer

