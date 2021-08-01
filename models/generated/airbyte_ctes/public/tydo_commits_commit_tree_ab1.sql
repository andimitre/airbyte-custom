{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_commit_hashid,
    {{ json_extract_scalar('tree', ['sha']) }} as sha,
    {{ json_extract_scalar('tree', ['url']) }} as url,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit') }}
where tree is not null
-- tree at tydo_commits/commit/tree

