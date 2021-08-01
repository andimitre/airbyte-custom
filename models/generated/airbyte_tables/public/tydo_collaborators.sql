{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    url,
    {{ adapter.quote('type') }},
    login,
    node_id,
    html_url,
    gists_url,
    repos_url,
    avatar_url,
    events_url,
    site_admin,
    gravatar_id,
    permissions,
    starred_url,
    followers_url,
    following_url,
    organizations_url,
    subscriptions_url,
    received_events_url,
    _ab_github_repository,
    _airbyte_emitted_at,
    _airbyte_tydo_collaborators_hashid
from {{ ref('tydo_collaborators_ab3') }}
-- tydo_collaborators from {{ source('public', '_airbyte_raw_tydo_collaborators') }}

