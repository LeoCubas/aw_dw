with
    endereco as (
        select
            addressid as codigo_endereco
            , stateprovinceid as codigo_estado
            , trim(addressline1) as endereco_1
            , trim(addressline2) as endereco_2
            , trim(city) as nome_cidade
            , postalcode as codigo_postal
            , spatiallocation as localizacao_espacial
        from {{ source('person','address') }}
    )
select *
from endereco