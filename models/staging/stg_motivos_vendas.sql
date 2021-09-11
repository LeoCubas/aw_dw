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
            motivo_pedido.salesorderid as codigo_pedido
            , motivo_venda.codigo_motivo_venda
            , motivo_venda.nome_motivo_venda
            , motivo_venda.tipo_motivo_venda
        from motivo_venda
        left join {{ source('sales','salesorderheadersalesreason') }} motivo_pedido
            on motivo_venda.codigo_motivo_venda = motivo_pedido.salesreasonid
    )
select *
from joined
order by codigo_motivo_venda asc