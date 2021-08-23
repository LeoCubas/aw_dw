with
    cartao as (
        select
            creditcardid as codigo_cartao
            , cardtype as tipo_cartao
            , cardnumber as numero_cartao
            , expmonth as mes_expiracao
            , expyear as ano_expiracao
            , cast(modifieddate as timestamp) as data_modificacao
        from {{ source('sales','creditcard') }}
    )
select *
from cartao