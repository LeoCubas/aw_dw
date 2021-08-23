with
    cliente as (
        select *
        from {{ ref('stg_clientes') }}
    )
    , loja as (
        select *
        from {{ ref('stg_lojas') }}
    )
    , pessoa as (
        select *
        from {{ ref('stg_pessoas') }}
    )
    , joined as (
        select
            cliente.codigo_cliente
            , cliente.codigo_pessoa
            , cliente.codigo_loja
            , pessoa.nome_tipo_pessoa
            , pessoa.titulo
            , pessoa.nome_completo
            , loja.nome_loja
        from cliente
        left join pessoa
            on cliente.codigo_pessoa = pessoa.codigo_funcionario
        left join loja
            on cliente.codigo_loja = loja.codigo_funcionario
    )
select *
from joined