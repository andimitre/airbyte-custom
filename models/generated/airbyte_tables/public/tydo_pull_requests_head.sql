{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_tydo_pull_requests_hashid,
    {{ adapter.quote('ref') }},
    sha,
    {{ adapter.quote('label') }},
    repo_id,
    user_id,
    _airbyte_emitted_at,
    _airbyte_head_hashid
from {{ ref('tydo_pull_requests_head_ab3') }}
-- head at tydo_pull_requests/head from {{ ref('tydo_pull_requests') }}

