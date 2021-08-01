{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte__links_hashid,
    href,
    _airbyte_emitted_at,
    _airbyte_commits_hashid
from {{ ref('tydo_pull_requests__links_commits_ab3') }}
-- commits at tydo_pull_requests/_links/commits from {{ ref('tydo_pull_requests__links') }}

