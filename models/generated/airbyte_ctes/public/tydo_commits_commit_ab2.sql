{{ config(schema="_airbyte_public", tags=["nested-intermediate"]) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
select
    _airbyte_tydo_commits_hashid,
    cast(url as {{ dbt_utils.type_string() }}) as url,
    cast(tree as {{ type_json() }}) as tree,
    cast(author as {{ type_json() }}) as author,
    cast(message as {{ dbt_utils.type_string() }}) as message,
    cast(committer as {{ type_json() }}) as committer,
    cast(verification as {{ type_json() }}) as verification,
    cast(comment_count as {{ dbt_utils.type_bigint() }}) as comment_count,
    author_id,
    _airbyte_emitted_at
from {{ ref('tydo_commits_commit_ab1') }}
-- commit at tydo_commits/commit

