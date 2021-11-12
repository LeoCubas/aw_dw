with
    pedido as (
        select *
        from {{ ref('stg_pedidos_vendas') }}
    )
    , joined as (
        select
            pedido.codigo_pedido
            , pedido.codigo_cliente
            , pedido.codigo_vendedor
            , pedido.codigo_endereco_cliente
            , pedido.codigo_endereco_frete
            , pedido.codigo_cartao
            , pedido.data_pedido
            , pedido.data_envio
            , pedido.status_pedido
            , pedido.descricao_status_pedido
            , pedido.tipo_venda
            , pedido.numero_ordem_compra
            , pedido.numero_conta
            , pedido.subtotal
            , pedido.taxa
            , pedido.frete
            , pedido.debito_cliente
            , pedido.comentario_pedido
        from pedido
    )
select *
from joined