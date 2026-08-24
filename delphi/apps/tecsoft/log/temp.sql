(
   select
      comissoes.vendedor
    , comissoes.indicador
    , comissoes.vendedorindicado
    , u.nome as nomevendedorindicado
    , comissoes.nome
    , comissoes.contrato
    , case
         when 't'
            then comissoes.filialvenda
            else cast(null as integer)
      end as filialvenda
    , case
         when 't'
            then comissoes.nomefilialvenda
            else cast(null as varchar)
      end as nomefilialvenda
    ,
      /* case when 'f' then comissoes.grupofilialvenda else cast(null as integer) end as grupofilialvenda,  case when 'f' then comissoes.nomegrupofilialvenda else cast(null as varchar) end as nomegrupofilialvenda,*/
      comissoes.produto
    , comissoes.nomeproduto
    , comissoes.faturamento
    , cast(comissoes.evento as varchar(100)) as evento
    , sum(comissoes.Valor)                   as valor
    , sum(comissoes.base)                    as base
    , comissoes.tipobase
    , comissoes.tipocomissao
    , comissoes.nivelcomissao
    , comissoes.percentual_ou_valor
    , sum(comissoes.valorcomissao) as valorcomissao
   from
      (
         SELECT
            comissoes.vendedor
          , comissoes.indicador
          , usuarios.nome
          , contrato
          , case
               when
                  /*'t'*/
                  true
                  then produto
                  else cast(null as bigint)
            end as produto
          , case
               when
                  /*'t'*/
                  true
                  then nomeproduto
                  else cast(null as varchar(50))
            end as nomeproduto
          , filialvenda
          , f.nome as nomefilialvenda
          ,
            /* fgf.grupo as grupofilialvenda,  gf.descricao as nomegrupofilialvenda,*/
            faturamento
          , evento
          , valor
          , base
          , tipobase
          , comissoes.vendedorindicado
          , comissoes.tipocomissao
          , nivelcomissao
          , case
               when produtomonstruario
                  then percentual_ou_valor * cast(Parametros_Valor('Percentual da comissão para produtos do monstruário',Filialvenda) as numeric) / 100
                  else percentual_ou_valor
            end as percentual_ou_valor
          , calculacomissao(evento, base, comissoes.tipocomissao, case
               when produtomonstruario
                  then percentual_ou_valor * cast(Parametros_Valor('Percentual da comissão para produtos do monstruário',Filialvenda) as numeric) / 100
                  else percentual_ou_valor
            end, quantidade) as valorcomissao
         FROM
            (
            /*INICIO_NIVEL_DE_COMISSAO_DA_TABELA_COMISSOESUSUARIOS*/
            (
               select
                  vendas_e_estornos.vendedor
                , vendas_e_estornos.indicador
                , vendas_e_estornos.contrato
                , vendas_e_estornos.produto
                , vendas_e_estornos.nomeproduto
                , vendas_e_estornos.filialvenda
                , vendas_e_estornos.faturamento
                , vendas_e_estornos.evento
                , case
                     when vendas_e_estornos.exibirsomentebase
                        then CAST(null as numeric(11,2))
                        else vendas_e_estornos.valor
                  end as valor
                , vendas_e_estornos.base
                , vendas_e_estornos.tipobase
                , vendas_e_estornos.vendedorindicado
                , percentual.nivelcomissao
                , case
                     when vendas_e_estornos.evento = 'VENDA A VISTA'
                        or (
                           vendas_e_estornos.evento = 'ESTORNO A VISTA'
                           and not vendas_e_estornos.ExibirSomenteBase
                        )
                        or vendas_e_estornos.evento = 'ABATIMENTO CREDITO TROCA - VENDA A VISTA'
                        then coalesce(usuarioscomissoes.percvista,0)
                     when vendas_e_estornos.evento = 'VENDA A PRAZO'
                        or (
                           vendas_e_estornos.evento = 'ESTORNO A PRAZO'
                           and not vendas_e_estornos.ExibirSomenteBase
                        )
                        or vendas_e_estornos.evento = 'ABATIMENTO CREDITO TROCA - VENDA A PRAZO'
                        then coalesce(usuarioscomissoes.percprazo,0)
                     when vendas_e_estornos.evento = 'VENDA ENTRADA'
                        or (
                           vendas_e_estornos.evento = 'ESTORNO ENTRADA'
                           and not vendas_e_estornos.ExibirSomenteBase
                        )
                        or vendas_e_estornos.evento = 'ABATIMENTO CREDITO TROCA - VENDA ENTRADA'
                        then coalesce(usuarioscomissoes.percentrada,0)
                        else cast(null as numeric(5,2))
                  end                   as percentual_ou_valor
                , cast(null as numeric) as quantidade
                , false                 as produtomonstruario
                , cast('%' as char(1))  as tipocomissao
                , vendas_e_estornos.exibirsomentebase
               from
                  (
                     select
                        false as indicador
                      , cu.*
                     from
                        comissoesusuarios cu
                     union all
                     select
                        true as indicador
                      , cui.*
                     from
                        comissoesusuariosindicados cui
                  )
                  as usuarioscomissoes
                , (
                     select
                        vendedor
                      , indicador
                      , faixa_comissao(vendedor, indicador, sum(base)) as nivelcomissao
                     from
                        (
                        (
                           select
                              vendedor
                            , indicador
                            , base
                           from
                              DadosComissoes('VENDAS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
                        )
                     union all
                        (
                           select
                              vendedor
                            , indicador
                            , base
                           from
                              DadosComissoes('ABATIMENTO_CREDITOTROCA_VENDAS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
                        )
                     union all
                        (
                           select
                              vendedor
                            , indicador
                            , base
                           from
                              DadosComissoes('DEVOLUCOES_DO_MES', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
                        )
                     order by
                        vendedor ) as vendas
                     group by
                        vendedor
                      , indicador
                  )
                  as percentual
                , (
                  /*INICIO_VENDAS_A_SER_APLICADO_O_PERCENTUAL*/
                  (
                     select
                        vendedor
                      , indicador
                      , contrato
                      , produto
                      , nomeproduto
                      , filialvenda
                      , faturamento
                      , evento
                      , valor
                      , base
                      , tipobase
                      , vendedorindicado
                      , false as ExibirSomenteBase
                     from
                        DadosComissoes('VENDAS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
                  )
                     /*FINAL_VENDAS_A_SER_APLICADO_O_PERCENTUAL*/
                     UNION ALL
                        /*INICIO_ABATIMENTO_CREDITO_TROCA_VENDAS_A_SER_APLICADO_O_PERCENTUAL*/
                        (
                           select
                              vendedor
                            , indicador
                            , contrato
                            , produto
                            , nomeproduto
                            , filialvenda
                            , faturamento
                            , evento
                            , valor
                            , base
                            , tipobase
                            , vendedorindicado
                            , false as ExibirSomenteBase
                           from
                              DadosComissoes('ABATIMENTO_CREDITOTROCA_VENDAS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
                        )
                     /*FINAL_ABATIMENTO_CREDITO_TROCA_VENDAS_A_SER_APLICADO_O_PERCENTUAL*/
                     UNION ALL
                        /*INICIO_ESTORNOS_DO_MES_E_FORA_DO_MES_A_SER_APLICADO_O_PERCENTUAL*/
                        (
                           select
                              vendedor
                            , indicador
                            , contrato
                            , produto
                            , nomeproduto
                            , filialvenda
                            , faturamento
                            , evento
                            , valor
                            , base
                            , tipobase
                            , vendedorindicado
                            , ExibirSomenteBase
                           from
                              DadosComissoes('DEVOLUCOES_DO_MES', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
                        )
                        /*FINAL_ESTORNOS_DO_MES_E_FORA_DO_MES_A_SER_APLICADO_O_PERCENTUAL*/
                     order by
                        vendedor
                      , evento ) as vendas_e_estornos
               where
                  percentual.vendedor             = vendas_e_estornos.vendedor
                  and percentual.indicador        = vendas_e_estornos.indicador
                  and usuarioscomissoes.usuario   = vendas_e_estornos.vendedor
                  and usuarioscomissoes.indicador = vendas_e_estornos.indicador
                  and usuarioscomissoes.numero    = percentual.nivelcomissao
            )
         /*FINAL_NIVEL_DE_COMISSAO_DA_TABELA_COMISSOESUSUARIOS*/
         UNION ALL
            /*INICIO_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS*/
            (
               select *
               from
                  DadosComissoes('ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
            )
         /*FINAL_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS*/
         UNION ALL
            /*INICIO_ABATIMENTO_CREDITO_TROCA_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS*/
            (
               select *
               from
                  DadosComissoes('ABATIMENTO_CREDITO_TROCA_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
            )
         /*FINAL_ABATIMENTO_CREDITO_TROCA_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS*/
         UNION ALL
            /*INICIO_ADICIONAL_PRODUTOS_E_SERVICOS_ESTORNOS*/
            (
               select *
               from
                  DadosComissoes('ADICIONAL_PRODUTOS_E_SERVICOS_ESTORNOS', '25/10/2023', '25/10/2023', '5416296', '', '', '', '', 't')
            )
            /*FINAL_ADICIONAL_PRODUTOS_E_SERVICOS_ESTORNOS*/
            ) as comissoes
            join
               /*(*/
               filiais f
               /* left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)  on f.codigo=fgf.filial) */
               on
                  comissoes.filialvenda=f.codigo
            join
               usuarios
               on
                  comissoes.vendedor = usuarios.codigo
      )
      as comissoes
      left join
         usuarios u
         on
            comissoes.vendedorindicado = u.codigo
   group by
      comissoes.filialvenda
    , comissoes.nomefilialvenda
    ,
      /* comissoes.grupofilialvenda,  comissoes.nomegrupofilialvenda,*/
      comissoes.nome
    , comissoes.vendedor
    , comissoes.indicador
    , u.nome
    , comissoes.vendedorindicado
    , comissoes.faturamento
    , comissoes.contrato
    , comissoes.evento
    , comissoes.tipobase
    , comissoes.tipocomissao
    , comissoes.nivelcomissao
    , comissoes.percentual_ou_valor
    , comissoes.produto
    , comissoes.nomeproduto
   order by
      comissoes.filialvenda
    , UPPER(TO_ASCII(comissoes.nomefilialvenda,'LATIN1'))
    ,
      /* comissoes.grupofilialvenda,  UPPER(TO_ASCII(comissoes.nomegrupofilialvenda,'LATIN1')),*/
         UPPER(TO_ASCII(comissoes.nome,'LATIN1'))
       , comissoes.vendedor
       , comissoes.indicador
       , UPPER(TO_ASCII(u.nome,'LATIN1'))
       , comissoes.vendedorindicado
       , comissoes.faturamento
       , comissoes.contrato
       , comissoes.evento
       , comissoes.produto
       , UPPER(TO_ASCII(comissoes.nomeproduto,'LATIN1'))
       , comissoes.tipobase
       , comissoes.tipocomissao
       , comissoes.nivelcomissao
       , comissoes.percentual_ou_valor
)
;