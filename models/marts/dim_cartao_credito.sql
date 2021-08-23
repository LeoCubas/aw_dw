with
    cartao as (
        select *
        from {{ ref('stg_cartao_credito') }}
    )
select *
from cartao