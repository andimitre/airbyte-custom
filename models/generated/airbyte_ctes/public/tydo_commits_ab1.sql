{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['sha']) }} as sha,
    {{ json_extract_scalar('_airbyte_data', ['url']) }} as url,
    {{ json_extract('_airbyte_data', ['commit']) }} as {{ adapter.quote('commit') }},
    {{ json_extract_scalar('_airbyte_data', ['node_id']) }} as node_id,
    {{ json_extract_array('_airbyte_data', ['parents']) }} as parents,
    {{ json_extract_scalar('_airbyte_data', ['html_url']) }} as html_url,
    {{ json_extract_scalar('_airbyte_data', ['author_id']) }} as author_id,
    {{ json_extract_scalar('_airbyte_data', ['created_at']) }} as created_at,
    {{ json_extract_scalar('_airbyte_data', ['comments_url']) }} as comments_url,
    {{ json_extract_scalar('_airbyte_data', ['committer_id']) }} as committer_id,
    {{ json_extract_scalar('_airbyte_data', ['_ab_github_repository']) }} as _ab_github_repository,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_tydo_commits') }}
-- tydo_commits

