{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte__links_hashid,
    href,
    _airbyte_emitted_at,
    _airbyte_statuses_hashid
from {{ ref('tydo_pull_requests__links_statuses_ab3') }}
-- statuses at tydo_pull_requests/_links/statuses from {{ ref('tydo_pull_requests__links') }}

