{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_commit_hashid',
        adapter.quote('date'),
        adapter.quote('name'),
        'email',
    ]) }} as _airbyte_committer_hashid
from {{ ref('tydo_commits_commit_committer_ab2') }}
-- committer at tydo_commits/commit/committer

