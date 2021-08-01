{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_tydo_collaborators_hashid,
    {{ json_extract_scalar('permissions', ['pull']) }} as pull,
    {{ json_extract_scalar('permissions', ['push']) }} as push,
    {{ json_extract_scalar('permissions', ['admin']) }} as {{ adapter.quote('admin') }},
    _airbyte_emitted_at
from {{ ref('tydo_collaborators') }}
where permissions is not null
-- permissions at tydo_collaborators/permissions

