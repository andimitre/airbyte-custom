{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte__links_hashid,
    cast(href as {{ dbt_utils.type_string() }}) as href,
    _airbyte_emitted_at
from {{ ref('tydo_pull_requests__links_self_ab1') }}
-- self at tydo_pull_requests/_links/self

