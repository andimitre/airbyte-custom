{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_commit_hashid,
    cast(reason as {{ dbt_utils.type_string() }}) as reason,
    cast(payload as {{ dbt_utils.type_string() }}) as payload,
    {{ cast_to_boolean('verified') }} as verified,
    cast(signature as {{ dbt_utils.type_string() }}) as signature,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit_verification_ab1') }}
-- verification at tydo_commits/commit/verification

