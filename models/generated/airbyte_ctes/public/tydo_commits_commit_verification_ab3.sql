{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_commit_hashid',
        'reason',
        'payload',
        boolean_to_string('verified'),
        'signature',
    ]) }} as _airbyte_verification_hashid
from {{ ref('tydo_commits_commit_verification_ab2') }}
-- verification at tydo_commits/commit/verification

