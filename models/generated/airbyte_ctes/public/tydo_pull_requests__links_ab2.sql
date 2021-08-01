{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_tydo_pull_requests_hashid,
    cast(html as {{ type_json() }}) as html,
    cast({{ adapter.quote('self') }} as {{ type_json() }}) as {{ adapter.quote('self') }},
    cast(issue as {{ type_json() }}) as issue,
    cast(commits as {{ type_json() }}) as commits,
    cast({{ adapter.quote('comments') }} as {{ type_json() }}) as {{ adapter.quote('comments') }},
    cast(statuses as {{ type_json() }}) as statuses,
    cast(review_comment as {{ type_json() }}) as review_comment,
    cast(review_comments as {{ type_json() }}) as review_comments,
    _airbyte_emitted_at
from {{ ref('tydo_pull_requests__links_ab1') }}
-- _links at tydo_pull_requests/_links

