{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte__links_hashid,
    href,
    _airbyte_emitted_at,
    _airbyte_html_hashid
from {{ ref('tydo_pull_requests__links_html_ab3') }}
-- html at tydo_pull_requests/_links/html from {{ ref('tydo_pull_requests__links') }}

