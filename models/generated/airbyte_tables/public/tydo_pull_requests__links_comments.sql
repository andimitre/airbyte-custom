{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte__links_hashid,
    href,
    _airbyte_emitted_at,
    _airbyte_comments_hashid
from {{ ref('tydo_pull_requests__links_comments_ab3') }}
-- comments at tydo_pull_requests/_links/comments from {{ ref('tydo_pull_requests__links') }}

