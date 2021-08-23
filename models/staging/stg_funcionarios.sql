with
    funcionario as (
        select
            businessentityid as codigo_funcionario
            , nationalidnumber as numero_identidade
            , jobtitle as nome_cargo
            , birthdate as data_nascimento
            , maritalstatus as estado_civil
            , case
                when maritalstatus = 'S'
                    then 'Solteiro'
                when maritalstatus = 'M'
                    then 'Casado'
            end nome_estado_civil
            , gender as genero
            , case
                when gender = 'M'
                    then 'Masculino'
                when gender = 'F'
                    then 'Feminino'
            end nome_genero
            , hiredate as data_contratacao
            , salariedflag as eh_salariado
            , vacationhours as horas_ferias
            , currentflag as eh_ativo
            , modifieddate as data_modificacao
        from {{ source('humanresources','employee') }}
    )
select *
from funcionario