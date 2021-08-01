{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast(sha as {{ dbt_utils.type_string() }}) as sha,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast({{ adapter.quote('commit') }} as {{ type_json() }}) as {{ adapter.quote('commit') }},
    cast(node_id as {{ dbt_utils.type_string() }}) as node_id,
    parents,
    cast(html_url as {{ dbt_utils.type_string() }}) as html_url,
    cast(author_id as {{ dbt_utils.type_bigint() }}) as author_id,
    cast(created_at as {{ dbt_utils.type_string() }}) as created_at,
    cast(comments_url as {{ dbt_utils.type_string() }}) as comments_url,
    cast(committer_id as {{ dbt_utils.type_bigint() }}) as committer_id,
    cast(_ab_github_repository as {{ dbt_utils.type_string() }}) as _ab_github_repository,
    _airbyte_emitted_at
from {{ ref('tydo_commits_ab1') }}
-- tydo_commits

