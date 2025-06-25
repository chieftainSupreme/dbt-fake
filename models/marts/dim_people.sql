with people as (

    select *
    from {{ ref('stg_fake__people') }}

)
, personal_info as (

    select *
    from {{ ref('stg_fake__personal_info') }}

)
select p.*
from people p
join personal_info i on p.id = i.id 