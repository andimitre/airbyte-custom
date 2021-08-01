{{ config(schema="public", tags=["nested"]) }}
-- Final base SQL model
select
    _airbyte_tydo_commits_hashid,
    sha,
    url,
    html_url,
    _airbyte_emitted_at,
    _airbyte_parents_hashid
from {{ ref('tydo_commits_parents_ab3') }}
-- parents at tydo_commits/parents from {{ ref('tydo_commits') }}

