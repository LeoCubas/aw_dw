with
    pessoa as (
        select
            businessentityid as codigo_funcionario
            , persontype as tipo_pessoa
            , case
                when persontype = 'SC'
                    then 'Contato Loja'
                when persontype = 'IN'
                    then 'Cliente individual'
                when persontype = 'SP'
                    then 'Vendedor'
                when persontype = 'EM'
                    then 'Funcionário'
            end nome_tipo_pessoa
            , namestyle
            , title as titulo
            , firstname as primeiro_nome
            , middlename as nome_do_meio
            , lastname as sobrenome
            , concat(firstname,' ',lastname) as nome_completo
            , suffix as sufixo
            , modifieddate as data_modificacao
        from {{ source('person','person')}}
    )
select *
from pessoa