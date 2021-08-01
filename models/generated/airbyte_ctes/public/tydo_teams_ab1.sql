{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    {{ json_extract_scalar('_airbyte_data', ['id']) }} as {{ adapter.quote('id') }},
    {{ json_extract_scalar('_airbyte_data', ['url']) }} as url,
    {{ json_extract_scalar('_airbyte_data', ['name']) }} as {{ adapter.quote('name') }},
    {{ json_extract_scalar('_airbyte_data', ['slug']) }} as slug,
    {{ json_extract_scalar('_airbyte_data', ['parent']) }} as parent,
    {{ json_extract_scalar('_airbyte_data', ['node_id']) }} as node_id,
    {{ json_extract_scalar('_airbyte_data', ['privacy']) }} as privacy,
    {{ json_extract_scalar('_airbyte_data', ['html_url']) }} as html_url,
    {{ json_extract_scalar('_airbyte_data', ['permission']) }} as {{ adapter.quote('permission') }},
    {{ json_extract_scalar('_airbyte_data', ['description']) }} as description,
    {{ json_extract_scalar('_airbyte_data', ['members_url']) }} as members_url,
    {{ json_extract_scalar('_airbyte_data', ['repositories_url']) }} as repositories_url,
    {{ json_extract_scalar('_airbyte_data', ['_ab_github_repository']) }} as _ab_github_repository,
    _airbyte_emitted_at
from {{ source('public', '_airbyte_raw_tydo_teams') }}
-- tydo_teams

