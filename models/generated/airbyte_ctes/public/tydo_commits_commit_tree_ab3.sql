{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_commit_hashid',
        'sha',
        'url',
    ]) }} as _airbyte_tree_hashid
from {{ ref('tydo_commits_commit_tree_ab2') }}
-- tree at tydo_commits/commit/tree

