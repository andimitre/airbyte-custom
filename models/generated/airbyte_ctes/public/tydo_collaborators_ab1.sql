{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['url']) }} as url,
    {{ json_extract_scalar('_airbyte_data', ['type']) }} as {{ adapter.quote('type') }},
    {{ json_extract_scalar('_airbyte_data', ['login']) }} as login,
    {{ json_extract_scalar('_airbyte_data', ['node_id']) }} as node_id,
    {{ json_extract_scalar('_airbyte_data', ['html_url']) }} as html_url,
    {{ json_extract_scalar('_airbyte_data', ['gists_url']) }} as gists_url,
    {{ json_extract_scalar('_airbyte_data', ['repos_url']) }} as repos_url,
    {{ json_extract_scalar('_airbyte_data', ['avatar_url']) }} as avatar_url,
    {{ json_extract_scalar('_airbyte_data', ['events_url']) }} as events_url,
    {{ json_extract_scalar('_airbyte_data', ['site_admin']) }} as site_admin,
    {{ json_extract_scalar('_airbyte_data', ['gravatar_id']) }} as gravatar_id,
    {{ json_extract('_airbyte_data', ['permissions']) }} as permissions,
    {{ json_extract_scalar('_airbyte_data', ['starred_url']) }} as starred_url,
    {{ json_extract_scalar('_airbyte_data', ['followers_url']) }} as followers_url,
    {{ json_extract_scalar('_airbyte_data', ['following_url']) }} as following_url,
    {{ json_extract_scalar('_airbyte_data', ['organizations_url']) }} as organizations_url,
    {{ json_extract_scalar('_airbyte_data', ['subscriptions_url']) }} as subscriptions_url,
    {{ json_extract_scalar('_airbyte_data', ['received_events_url']) }} as received_events_url,
    {{ json_extract_scalar('_airbyte_data', ['_ab_github_repository']) }} as _ab_github_repository,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_tydo_collaborators') }}
-- tydo_collaborators

