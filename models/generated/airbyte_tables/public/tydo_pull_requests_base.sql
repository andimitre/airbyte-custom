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
    _airbyte_base_hashid
from {{ ref('tydo_pull_requests_base_ab3') }}
-- base at tydo_pull_requests/base from {{ ref('tydo_pull_requests') }}

