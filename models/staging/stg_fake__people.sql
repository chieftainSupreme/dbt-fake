with source as (
    select *
    from {{ source('raw_fake_company', 'fake_people') }}
)
select *
from source