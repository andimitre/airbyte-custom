{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_tydo_commits_hashid',
        'url',
        'tree',
        'author',
        'message',
        'committer',
        'verification',
        'comment_count',
    ]) }} as _airbyte_commit_hashid
from {{ ref('tydo_commits_commit_ab2') }}
-- commit at tydo_commits/commit

