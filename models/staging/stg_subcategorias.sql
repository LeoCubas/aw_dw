with
    subcategoria as (
        select
            /* Primary key */
            (cast(productsubcategoryid as int) as codigo_subcategoria
            /* Columns */
            , cast(productcategoryid as int) as codigo_categoria
            , trim(name) as nome_subcategoria
        from {{ source('production','productsubcategory') }}
    )
select *
from subcategoria
order by codigo_subcategoria asc