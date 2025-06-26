{{
  config(
    materialized = "table"
  )
}}

with source as (
    select * 
    , TRY_PARSE_JSON(REPLACE(address, '''', '"')) AS addr
    from {{ ref('stg_fake__personal_info') }}
)
select id
, area_code
, phone_number
, birthdate
, blood_type
, favorite_color
, credit_score 
,  addr:"street_address"::STRING AS street_address
,  addr:"city"::STRING           AS city
,  addr:"state"::STRING          AS state
,  addr:"zipcode"::STRING        AS zipcode 
from source