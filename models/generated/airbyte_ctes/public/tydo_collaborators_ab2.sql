{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    cast({{ adapter.quote('id') }} as {{ dbt_utils.type_bigint() }}) as {{ adapter.quote('id') }},
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast({{ adapter.quote('type') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('type') }},
    cast(login as {{ dbt_utils.type_string() }}) as login,
    cast(node_id as {{ dbt_utils.type_string() }}) as node_id,
    cast(html_url as {{ dbt_utils.type_string() }}) as html_url,
    cast(gists_url as {{ dbt_utils.type_string() }}) as gists_url,
    cast(repos_url as {{ dbt_utils.type_string() }}) as repos_url,
    cast(avatar_url as {{ dbt_utils.type_string() }}) as avatar_url,
    cast(events_url as {{ dbt_utils.type_string() }}) as events_url,
    {{ cast_to_boolean('site_admin') }} as site_admin,
    cast(gravatar_id as {{ dbt_utils.type_string() }}) as gravatar_id,
    cast(permissions as {{ type_json() }}) as permissions,
    cast(starred_url as {{ dbt_utils.type_string() }}) as starred_url,
    cast(followers_url as {{ dbt_utils.type_string() }}) as followers_url,
    cast(following_url as {{ dbt_utils.type_string() }}) as following_url,
    cast(organizations_url as {{ dbt_utils.type_string() }}) as organizations_url,
    cast(subscriptions_url as {{ dbt_utils.type_string() }}) as subscriptions_url,
    cast(received_events_url as {{ dbt_utils.type_string() }}) as received_events_url,
    cast(_ab_github_repository as {{ dbt_utils.type_string() }}) as _ab_github_repository,
    _airbyte_emitted_at
from {{ ref('tydo_collaborators_ab1') }}
-- tydo_collaborators

