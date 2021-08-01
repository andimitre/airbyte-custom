{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_tydo_collaborators_hashid,
    {{ cast_to_boolean('pull') }} as pull,
    {{ cast_to_boolean('push') }} as push,
    {{ cast_to_boolean(adapter.quote('admin')) }} as {{ adapter.quote('admin') }},
    _airbyte_emitted_at
from {{ ref('tydo_collaborators_permissions_ab1') }}
-- permissions at tydo_collaborators/permissions

