with
    pessoa as (
        select *
        from {{ ref('stg_pessoas') }}
    )
    , funcionario as (
        select *
        from {{ ref('stg_funcionarios') }}
    )
    , vendedor as (
        select *
        from {{ ref('stg_vendedores') }}
    )
    , joined as (
        select
            vendedor.codigo_funcionario as codigo_vendedor
            , pessoa.tipo_pessoa
            , pessoa.nome_completo
            , funcionario.nome_cargo
            , funcionario.data_nascimento
            , funcionario.nome_estado_civil
            , funcionario.nome_genero
            , funcionario.eh_ativo
        from vendedor
        left join funcionario
            on vendedor.codigo_funcionario = funcionario.codigo_funcionario
        left join pessoa
            on vendedor.codigo_funcionario = pessoa.codigo_funcionario
        where pessoa.tipo_pessoa = 'SP'
    )
select *
from joined