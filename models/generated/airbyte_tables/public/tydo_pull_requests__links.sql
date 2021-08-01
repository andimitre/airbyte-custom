{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_tydo_pull_requests_hashid,
    html,
    {{ adapter.quote('self') }},
    issue,
    commits,
    {{ adapter.quote('comments') }},
    statuses,
    review_comment,
    review_comments,
    _airbyte_emitted_at,
    _airbyte__links_hashid
from {{ ref('tydo_pull_requests__links_ab3') }}
-- _links at tydo_pull_requests/_links from {{ ref('tydo_pull_requests') }}

