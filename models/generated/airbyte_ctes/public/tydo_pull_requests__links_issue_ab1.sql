{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte__links_hashid,
    {{ json_extract_scalar('issue', ['href']) }} as href,
    _airbyte_emitted_at
from {{ ref('tydo_pull_requests__links') }}
where issue is not null
-- issue at tydo_pull_requests/_links/issue

