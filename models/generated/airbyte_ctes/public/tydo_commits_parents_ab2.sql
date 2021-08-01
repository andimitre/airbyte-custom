{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_tydo_commits_hashid,
    cast(sha as {{ dbt_utils.type_string() }}) as sha,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast(html_url as {{ dbt_utils.type_string() }}) as html_url,
    _airbyte_emitted_at
from {{ ref('tydo_commits_parents_ab1') }}
-- parents at tydo_commits/parents

