{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        'url',
        adapter.quote('name'),
        'slug',
        'parent',
        'node_id',
        'privacy',
        'html_url',
        adapter.quote('permission'),
        'description',
        'members_url',
        'repositories_url',
        '_ab_github_repository',
    ]) }} as _airbyte_tydo_teams_hashid
from {{ ref('tydo_teams_ab2') }}
-- tydo_teams

