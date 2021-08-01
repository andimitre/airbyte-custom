{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
{{ unnest_cte('tydo_commits', 'tydo_commits', 'parents') }}
select
    _airbyte_tydo_commits_hashid,
    {{ json_extract_scalar(unnested_column_value('parents'), ['sha']) }} as sha,
    {{ json_extract_scalar(unnested_column_value('parents'), ['url']) }} as url,
    {{ json_extract_scalar(unnested_column_value('parents'), ['html_url']) }} as html_url,
    _airbyte_emitted_at
from {{ ref('tydo_commits') }}
{{ cross_join_unnest('tydo_commits', 'parents') }}
where parents is not null
-- parents at tydo_commits/parents

