with
    produto as (
        select
            /* Primary key */
            cast(productid as int) as codigo_produto
            /* Columns */
            , cast(productsubcategoryid as int) as codigo_subcategoria
            , cast(productmodelid as int) as codigo_modelo
            , trim(name) as nome_produto
            , productnumber as id_produto
            , makeflag as produto_proprio
            , finishedgoodsflag as produto_vendavel
            , color as cor_produto
            , safetystocklevel as estoque_minimo
            , reorderpoint as ponto_recompra
            , standardcost as custo_bruto
            , listprice as custo_venda
            , weight as peso_produto
            , daystomanufacture as dias_producao
            , coalesce(trim(productline),'') as linha_produto
            , case
                when trim(productline) = 'R'
                    then 'Estrada'
                when trim(productline) = 'M'
                    then 'Montanha'
                when trim(productline) = 'T'
                    then 'Turismo'
                when trim(productline) = 'S'
                    then 'Padrão'
                else 'Sem informação'
            end descricao_linha_produto
            , coalesce(trim(class),'') as classe
            , case
                when trim(class) = 'H'
                    then 'Alta'
                when trim(class) = 'M'
                    then 'Média'
                when trim(class) = 'L'
                    then 'Baixa'
                else 'Sem informação'
            end descricao_classe
            , coalesce(trim(style),'') as genero_produto
            , case
                when trim(style) = 'W'
                    then 'Mulheres'
                when trim(style) = 'M'
                    then 'Homens'
                when trim(style) = 'U'
                    then 'Universal'
                else 'Sem informação'
            end descricao_genero_produto
        from {{ source('production','product') }}

    )
select *
from produto
order by codigo_produto asc