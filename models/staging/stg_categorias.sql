with
    categoria as (
        select
            /* Primary key */
            cast(productcategoryid as int) as codigo_categoria
            , trim(name) as nome_categoria
        from {{ source('production','productcategory') }}
    )
select *
from categoria
order by codigo_categoria asc