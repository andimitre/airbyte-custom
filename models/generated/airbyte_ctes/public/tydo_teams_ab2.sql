{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast({{ adapter.quote('name') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('name') }},
    cast(slug as {{ dbt_utils.type_string() }}) as slug,
    cast(parent as {{ dbt_utils.type_string() }}) as parent,
    cast(node_id as {{ dbt_utils.type_string() }}) as node_id,
    cast(privacy as {{ dbt_utils.type_string() }}) as privacy,
    cast(html_url as {{ dbt_utils.type_string() }}) as html_url,
    cast({{ adapter.quote('permission') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('permission') }},
    cast(description as {{ dbt_utils.type_string() }}) as description,
    cast(members_url as {{ dbt_utils.type_string() }}) as members_url,
    cast(repositories_url as {{ dbt_utils.type_string() }}) as repositories_url,
    cast(_ab_github_repository as {{ dbt_utils.type_string() }}) as _ab_github_repository,
    _airbyte_emitted_at
from {{ ref('tydo_teams_ab1') }}
-- tydo_teams

