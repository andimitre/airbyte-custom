{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte__links_hashid,
    href,
    _airbyte_emitted_at,
    _airbyte_issue_hashid
from {{ ref('tydo_pull_requests__links_issue_ab3') }}
-- issue at tydo_pull_requests/_links/issue from {{ ref('tydo_pull_requests__links') }}

