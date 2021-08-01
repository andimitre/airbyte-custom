{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_tydo_collaborators_hashid',
        boolean_to_string('pull'),
        boolean_to_string('push'),
        boolean_to_string(adapter.quote('admin')),
    ]) }} as _airbyte_permissions_hashid
from {{ ref('tydo_collaborators_permissions_ab2') }}
-- permissions at tydo_collaborators/permissions

