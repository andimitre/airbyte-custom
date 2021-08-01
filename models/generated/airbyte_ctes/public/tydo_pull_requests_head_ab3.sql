{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_tydo_pull_requests_hashid',
        adapter.quote('ref'),
        'sha',
        adapter.quote('label'),
        'repo_id',
        'user_id',
    ]) }} as _airbyte_head_hashid
from {{ ref('tydo_pull_requests_head_ab2') }}
-- head at tydo_pull_requests/head

