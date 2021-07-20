with
    motivo_venda as (
        select
            cast(salesreasonid as int) as codigo_motivo_venda
            , trim(name) as nome_motivo_venda
            , trim(reasontype) as tipo_motivo_venda
        from {{ source('sales','salesreason') }}
    )
    , joined as (
        select
            motivo_venda.codigo_motivo_venda
            , motivo_venda.nome_motivo_venda
            , motivo_venda.tipo_motivo_venda
        from motivo_venda
    )
select *
from joined
order by codigo_motivo_venda asc