with
    territorio as (
        select
            territoryid as codigo_territorio
            , name as nome_territorio
            , countryregioncode as codigo_pais
            , territorio.group as grupo
            , salesytd as vendas_atuais
            , saleslastyear as vendas_ano_passado
            , costytd as custos_atuais
            , costlastyear as custos_ano_passado
        from {{ source('sales','salesterritory') }} territorio
    )
select *
from territorio