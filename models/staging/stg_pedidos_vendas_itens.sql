with
    pedido as (
        select
            salesorderid as codigo_pedido
            , salesorderdetailid as codigo_pedido_item
            , orderqty as quantidade_pedido
            , productid as codigo_produto
            , specialofferid as codigo_oferta
            , unitprice as preco_unitario
            , unitpricediscount as desconto_unitario
        from {{ source('sales','salesorderdetail') }}
    )
select *
from pedido