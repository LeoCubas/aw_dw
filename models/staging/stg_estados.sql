with
    estado as (
        select
            stateprovinceid as codigo_estado
            , countryregioncode as codigo_pais
            , territoryid as codigo_territorio
            , stateprovincecode as sigla_estado
            , isonlystateprovinceflag as estado_unico
            , trim(name) as nome_estado
        from {{ source('person','stateprovince') }}
    )
select *
from estado