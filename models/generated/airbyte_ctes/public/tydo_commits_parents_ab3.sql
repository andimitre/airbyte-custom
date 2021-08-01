{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_tydo_commits_hashid',
        'sha',
        'url',
        'html_url',
    ]) }} as _airbyte_parents_hashid
from {{ ref('tydo_commits_parents_ab2') }}
-- parents at tydo_commits/parents

