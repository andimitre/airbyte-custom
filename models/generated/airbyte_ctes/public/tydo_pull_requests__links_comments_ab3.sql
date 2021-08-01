{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte__links_hashid',
        'href',
    ]) }} as _airbyte_comments_hashid
from {{ ref('tydo_pull_requests__links_comments_ab2') }}
-- comments at tydo_pull_requests/_links/comments

