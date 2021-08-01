{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to build a hash column based on the values of this record
select
    *,
    {{ dbt_utils.surrogate_key([
        '_airbyte_tydo_pull_requests_hashid',
        'html',
        adapter.quote('self'),
        'issue',
        'commits',
        adapter.quote('comments'),
        'statuses',
        'review_comment',
        'review_comments',
    ]) }} as _airbyte__links_hashid
from {{ ref('tydo_pull_requests__links_ab2') }}
-- _links at tydo_pull_requests/_links

