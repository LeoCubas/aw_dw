with
    cliente as (
        select
            customerid as codigo_cliente
            , personid as codigo_pessoa
            , storeid as codigo_loja
            , territoryid as codigo_territorio
            , modifieddate as data_modificacao
        from {{ source('sales','customer') }}
    )
select *
from cliente