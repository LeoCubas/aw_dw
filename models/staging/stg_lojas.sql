with
    loja as (
        select
            businessentityid as codigo_funcionario
            , name as nome_loja
            , salespersonid as codigo_vendedor
            , modifieddate as data_modificacao
        from {{ source('sales','store') }}
    )
select *
from loja