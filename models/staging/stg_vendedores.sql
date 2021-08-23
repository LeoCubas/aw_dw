with
    vendedor as (
        select
            businessentityid as codigo_funcionario
            , territoryid as codigo_territorio
            , salesquota as meta_anual
            , bonus as bonus
            , commissionpct as comissao
            , salesytd as vendas_ano_atual
            , saleslastyear as vendas_ultimo_ano
            , modifieddate as data_modificacao
        from {{ source('sales','salesperson') }}
    )
select *
from vendedor