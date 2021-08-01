{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_tydo_pull_requests_hashid,
    {{ json_extract_scalar('base', ['ref']) }} as {{ adapter.quote('ref') }},
    {{ json_extract_scalar('base', ['sha']) }} as sha,
    {{ json_extract_scalar('base', ['label']) }} as {{ adapter.quote('label') }},
    {{ json_extract_scalar('base', ['repo_id']) }} as repo_id,
    {{ json_extract_scalar('base', ['user_id']) }} as user_id,
    _airbyte_emitted_at
from {{ ref('tydo_pull_requests') }}
where base is not null
-- base at tydo_pull_requests/base

