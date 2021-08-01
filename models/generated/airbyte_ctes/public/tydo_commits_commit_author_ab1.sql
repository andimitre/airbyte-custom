{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_commit_hashid,
    {{ json_extract_scalar('author', ['date']) }} as {{ adapter.quote('date') }},
    {{ json_extract_scalar('author', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('author', ['email']) }} as email,
    author_id,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit') }}
where author is not null
-- author at tydo_commits/commit/author

