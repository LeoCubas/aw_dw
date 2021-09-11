with
    pais as (
        select
            countryregioncode as codigo_pais
            , trim(name) as nome_pais
        from {{ source('person','countryregion') }}
    )
select *
from pais