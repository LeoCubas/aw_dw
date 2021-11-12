with
    pedido as (
        select
            salesorderid as codigo_pedido
            , customerid as codigo_cliente
            , salespersonid as codigo_vendedor
            , territoryid as codigo_territorio
            , billtoaddressid as codigo_endereco_cliente
            , shiptoaddressid as codigo_endereco_frete
            , shipmethodid as codigo_tipo_frete
            , creditcardid as codigo_cartao
            , cast(orderdate as timestamp) as data_pedido
            , cast(shipdate as timestamp) as data_envio
            , status as status_pedido
            , case
                when status = 1
                    then 'In progress'
                when status = 2
                    then 'Approved'
                when status = 3
                    then 'Backordered'
                when status = 4
                    then 'Rejected'
                when status = 5
                    then 'Shipped'
                when status = 6
                    then 'Cancelled'
                else 'No information'
            end as descricao_status_pedido
            , case
                when onlineorderflag = False
                    then 'Salesperson'
                when onlineorderflag = True
                    then 'Online'
                else 'No information'
            end as tipo_venda
            , purchaseordernumber as numero_ordem_compra
            , accountnumber as numero_conta
            , currencyrateid
            , subtotal as subtotal
            , taxamt as taxa
            , freight as frete
            , totaldue as debito_cliente
            , comment as comentario_pedido
        from {{ source('sales','salesorderheader') }}
    )
select *
from pedido