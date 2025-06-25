with source as (
    select id
      , CAST(REGEXP_SUBSTR(phone_number, '\\+(\\d+)', 1, 1, 'e', 1) AS INT) AS area_code
      , CAST(REGEXP_SUBSTR(phone_number, '-\\s*(\\d+)', 1, 1, 'e', 1) AS INT) AS phone_number
      , birthdate
      , blood_type
      , favorite_color
      , credit_score
    from {{ source('raw_fake_company', 'fake_personal_info') }}
)
select id
      , area_code
      , phone_number
      , birthdate
      , blood_type
      , favorite_color
      , credit_score
from source