{{ config(schema="public", tags=["top-level"]) }}
-- Final base SQL model
select
    {{ adapter.quote('id') }},
    url,
    {{ adapter.quote('name') }},
    slug,
    parent,
    node_id,
    privacy,
    html_url,
    {{ adapter.quote('permission') }},
    description,
    members_url,
    repositories_url,
    _ab_github_repository,
    _airbyte_emitted_at,
    _airbyte_tydo_teams_hashid
from {{ ref('tydo_teams_ab3') }}
-- tydo_teams from {{ source('public', '_airbyte_raw_tydo_teams') }}

