with
    pedido as (
        select *
        from {{ ref('stg_pedidos_vendas') }}
    )
    , pedido_item as (
        select *
        from {{ ref('stg_pedidos_vendas_itens') }}
    )
    , motivo_venda as (
        select *
        from {{ ref('stg_motivos_vendas') }}
    )
    , joined as (
        select
            pedido.codigo_pedido
            , pedido_item.codigo_pedido_item
            , {{ dbt_utils.surrogate_key(['pedido.codigo_pedido','codigo_pedido_item']) }} as sk_pedido_item
            , pedido_item.codigo_produto
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
            , pedido_item.quantidade_pedido
            , pedido_item.preco_unitario
            , pedido_item.desconto_unitario
            , motivo_venda.nome_motivo_venda
            , motivo_venda.tipo_motivo_venda
        from pedido
        left join pedido_item
            on pedido.codigo_pedido = pedido_item.codigo_pedido
        left join motivo_venda
            on pedido.codigo_pedido = motivo_venda.codigo_pedido
    )
select *
from joined