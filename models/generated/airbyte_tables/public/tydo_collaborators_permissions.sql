{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_tydo_collaborators_hashid,
    pull,
    push,
    {{ adapter.quote('admin') }},
    _airbyte_emitted_at,
    _airbyte_permissions_hashid
from {{ ref('tydo_collaborators_permissions_ab3') }}
-- permissions at tydo_collaborators/permissions from {{ ref('tydo_collaborators') }}

