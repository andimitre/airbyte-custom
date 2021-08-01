{{ config(schema="_airbyte_public", tags=["top-level-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        adapter.quote('id'),
        'url',
        adapter.quote('type'),
        'login',
        'node_id',
        'html_url',
        'gists_url',
        'repos_url',
        'avatar_url',
        'events_url',
        boolean_to_string('site_admin'),
        'gravatar_id',
        'permissions',
        'starred_url',
        'followers_url',
        'following_url',
        'organizations_url',
        'subscriptions_url',
        'received_events_url',
        '_ab_github_repository',
    ]) }} as _airbyte_tydo_collaborators_hashid
from {{ ref('tydo_collaborators_ab2') }}
-- tydo_collaborators

