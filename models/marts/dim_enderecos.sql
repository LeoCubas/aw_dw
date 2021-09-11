with
    endereco as (
        select *
        from {{ ref('stg_enderecos') }}
    )
    , estado as (
        select *
        from {{ ref('stg_estados') }}
    )
    , pais as (
        select *
        from {{ ref('stg_paises') }}
    )
    , territorio as (
        select *
        from {{ ref('stg_territorios') }}
    )
    , joined as (
        select
            endereco.codigo_endereco
            , endereco.codigo_estado
            , estado.codigo_pais
            , estado.codigo_territorio
            , territorio.grupo
            , territorio.nome_territorio
            , pais.nome_pais
            , estado.sigla_estado
            , estado.nome_estado
            , endereco.nome_cidade
            , endereco.endereco_1
            , endereco.endereco_2
            , endereco.codigo_postal
            , endereco.localizacao_espacial
            , estado.estado_unico
        from endereco
        left join estado
            on endereco.codigo_estado = estado.codigo_estado
        left join pais
            on estado.codigo_pais = pais.codigo_pais
        left join territorio
            on estado.codigo_territorio = territorio.codigo_territorio
    )
select *
from joined