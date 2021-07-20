with
    produtos as (
        select *
        from {{ ref('stg_produtos') }}
    )
    , categorias as (
        select *
        from {{ ref('stg_categorias') }}
    )
    , subcategorias as (
        select *
        from {{ ref('stg_subcategorias') }}
    )
    , categorias_joined as (
        select
            subcategorias.codigo_subcategoria
            , subcategorias.nome_subcategoria
            , subcategorias.codigo_categoria
            , categorias.nome_categoria
        from subcategorias
        left join categorias
            on subcategorias.codigo_categoria = categorias.codigo_categoria
    )
    , joined as (
        select
            produtos.codigo_produto
            , produtos.codigo_modelo
            , produtos.nome_produto
            , categorias_joined.codigo_subcategoria
            , coalesce(categorias_joined.nome_subcategoria,'Sem subcategoria') as nome_subcategoria
            , categorias_joined.codigo_categoria
            , coalesce(categorias_joined.nome_categoria,'Sem categoria') as nome_categoria
            , produtos.id_produto
            , produtos.produto_proprio
            , produtos.produto_vendavel
            , produtos.cor_produto
            , produtos.estoque_minimo
            , produtos.ponto_recompra
            , produtos.custo_bruto
            , produtos.custo_venda
            , produtos.peso_produto
            , produtos.dias_producao
            , produtos.linha_produto
            , produtos.descricao_linha_produto
            , produtos.classe
            , produtos.descricao_classe
            , produtos.genero_produto
            , produtos.descricao_genero_produto
        from produtos
        left join categorias_joined
            on produtos.codigo_subcategoria = categorias_joined.codigo_subcategoria
    )
select *
from joined
order by codigo_produto asc