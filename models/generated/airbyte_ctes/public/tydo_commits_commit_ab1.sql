{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    _airbyte_tydo_commits_hashid,
    {{ json_extract_scalar(adapter.quote('commit'), ['url']) }} as url,
    {{ json_extract(adapter.quote('commit'), ['tree']) }} as tree,
    {{ json_extract(adapter.quote('commit'), ['author']) }} as author,
    {{ json_extract_scalar(adapter.quote('commit'), ['message']) }} as message,
    {{ json_extract(adapter.quote('commit'), ['committer']) }} as committer,
    {{ json_extract(adapter.quote('commit'), ['verification']) }} as verification,
    {{ json_extract_scalar(adapter.quote('commit'), ['comment_count']) }} as comment_count,
    author_id,
    _airbyte_emitted_at
from {{ ref('tydo_commits') }}
where {{ adapter.quote('commit') }} is not null
-- commit at tydo_commits/commit

