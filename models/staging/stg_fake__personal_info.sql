with source as (
    select *
    from {{ source('raw_fake_company', 'fake_personal_info') }}
)
select *
from source