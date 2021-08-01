{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_tydo_pull_requests_hashid,
    {{ json_extract('_links', ['html']) }} as html,
    {{ json_extract('_links', ['self']) }} as {{ adapter.quote('self') }},
    {{ json_extract('_links', ['issue']) }} as issue,
    {{ json_extract('_links', ['commits']) }} as commits,
    {{ json_extract('_links', ['comments']) }} as {{ adapter.quote('comments') }},
    {{ json_extract('_links', ['statuses']) }} as statuses,
    {{ json_extract('_links', ['review_comment']) }} as review_comment,
    {{ json_extract('_links', ['review_comments']) }} as review_comments,
    _airbyte_emitted_at
from {{ ref('tydo_pull_requests') }}
where _links is not null
-- _links at tydo_pull_requests/_links

