{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_tydo_pull_requests_hashid,
    cast({{ adapter.quote('ref') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('ref') }},
    cast(sha as {{ dbt_utils.type_string() }}) as sha,
    cast({{ adapter.quote('label') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('label') }},
    cast(repo_id as {{ dbt_utils.type_bigint() }}) as repo_id,
    cast(user_id as {{ dbt_utils.type_bigint() }}) as user_id,
    _airbyte_emitted_at
from {{ ref('tydo_pull_requests_base_ab1') }}
-- base at tydo_pull_requests/base

