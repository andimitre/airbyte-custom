{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_commit_hashid,
    cast(sha as {{ dbt_utils.type_string() }}) as sha,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit_tree_ab1') }}
-- tree at tydo_commits/commit/tree

