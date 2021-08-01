{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        'sha',
        'url',
        adapter.quote('commit'),
        'node_id',
        array_to_string('parents'),
        'html_url',
        'author_id',
        'created_at',
        'comments_url',
        'committer_id',
        '_ab_github_repository',
    ]) }} as _airbyte_tydo_commits_hashid
from {{ ref('tydo_commits_ab2') }}
-- tydo_commits

