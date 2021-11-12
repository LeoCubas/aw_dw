with
    motivo_venda as (
        select *
        from {{ ref('stg_motivos_vendas') }}
    )
select *
from motivo_venda