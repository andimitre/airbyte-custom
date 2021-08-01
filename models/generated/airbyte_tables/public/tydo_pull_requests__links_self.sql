{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte__links_hashid,
    href,
    _airbyte_emitted_at,
    _airbyte_self_hashid
from {{ ref('tydo_pull_requests__links_self_ab3') }}
-- self at tydo_pull_requests/_links/self from {{ ref('tydo_pull_requests__links') }}

