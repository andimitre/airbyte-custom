{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_commit_hashid,
    cast({{ adapter.quote('date') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('date') }},
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(email as {{ dbt_utils.type_string() }}) as email,
    author_id,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit_author_ab1') }}
-- author at tydo_commits/commit/author

