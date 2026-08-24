/* qryFiliaisVendedores */
;
(
   select
      Vendas.*
    , round((valortotal * 100) / (COALESCE(NULLIF(ValorTotalGeral,0),1)),2) as Percentual
    , 'A_Vendas'                                                            as tipo
   from
      (
         select
            VendasVendedores.*
          , sum(VendasTotal.valorprazo) as ValorTotalGeral
         from
            (
               select
                  vendedor
                , nome                                                                   as nomevendedor
                , sum((valorvista+desconto))                                             as ValorMercadoria
                , (sum(desconto)*100)/(COALESCE(NULLIF((sum(valorvista+desconto)),0),1)) as percdesconto
                , sum(desconto)                                                          as desconto
                , sum(valorvista)                                                        as ValorLiquidoVendedor
                , sum(ValorPrazo-ValorVista)                                             as eFinanceiro
                , count(*)                                                               as Notas
                , sum(produtos)                                                          as produtos
                , sum(ValorPrazo)                                                        as ValorTotal
                , sum
                     (
                        case
                           when not ContratoeAPrazo
                              then ValorPrazo
                              else 0
                        end
                     )
                  as ValorVista
                , sum
                     (
                        case
                           when ContratoeAPrazo
                              then valorprazo
                              else 0
                        end
                     )
                                    as ValorPrazo
                , sum(creditotroca) as creditotroca
               from
                  (
                  /* inicio vendas por contrato */
				  				  
                  (
                     select
                        ct.vendedor
                      , u.nome
                      , ct.valorvista
                      , ct.valorprazo
                      , (coalesce(ct.desconto, 0) + coalesce(
                                                              (
                                                                 SELECT
                                                                    sum(pc.valordescontoitem)
                                                                 FROM
                                                                    produtoscontratos pc
                                                                 WHERE
                                                                    ct.numero=pc.contrato
                                                             )
                                                             ,0)) AS desconto
                      , coalesce(ct.frete,0)                      as frete
                      , coalesce(ct.seguro, 0)                    as seguro
                      , (coalesce(
                                   (
                                      select
                                         sum(pc.quantidade)
                                      from
                                         produtoscontratos pc
                                      where
                                         ct.numero=pc.contrato
                                         and not pc.brinde
                                  )
                                  ,0)+ coalesce(
                                                 (
                                                    select
                                                       sum(sc.quantidade)
                                                    from
                                                       servicoscontratos sc
                                                    where
                                                       ct.numero=sc.contrato
                                                )
                                                ,0)) as Produtos
                      , (
                           select
                              exists
                              (
                                 select
                                    p.contrato
                                 from
                                    parcelas p
                                 where
                                    p.contrato       = ct.numero
                                    and p.datavencto > ct.faturamento
                              )
                        )
                                                      as ContratoeAPrazo
                      , - coalesce(ct.creditotroca,0) as creditotroca
                     from
                        (((contratos ct
                        join
                           (usuarios u
                           left join
                              GruposUsuarios gu
                              on
                                 u.grupo = gu.codigo)
                           on
                              ct.vendedor=u.codigo)
                        join
                           vfornecedores vf
                           on
                              ct.cliente         = vf.codigo
                              and ct.tipocliente = vf.tipo)
                        join
                           (filiais f
                           left join
                              (filiaisgruposfiliais fgf
                              join
                                 gruposfiliais gf
                                 on
                                    fgf.grupo=gf.codigo)
                              on
                                 f.codigo=fgf.filial)
                           on
                              ct.filialvenda=f.codigo)
                     where
                        ct.faturamento between('01/01/2024') and
                        (
                           '31/01/2024'
                        )
                        and
                        (
                           coalesce(ct.valorvista,0)<>0
                        )
                        and
                        (
                           coalesce(ct.valorprazo,0)<>0
                        )
                        and
                        case
                           when ct.os
                              then ct.tipoequipamento in (1, 2)
                              and not (
                                 coalesce(ct.os_garantia,false)
                                 and ct.os_garantia_status='A'
                              )
                              and not coalesce(ct.os_cortesia,false)
                              else true
                        end
                        and ct.origem is null
                  )
				  
               /* final vendas por contrato */
               union all
                  /* inicio vendas frente de caixa */
                  (
                     select
                        df.vendedor
                      , coalesce(u.nome, cast('FRENTE DE CAIXA' as varchar)) as nome
                      , df.valorvista
                      , df.valortotal                                           as valorprazo
                      , coalesce(df.desconto, 0) + coalesce(df.descontoitem, 0) as desconto
                      , coalesce(df.valorfrete,0)                               as frete
                      , coalesce(df.seguro, 0)                                  as seguro
                      , (coalesce(
                                   (
                                      select
                                         sum(pdf.quantidade)
                                      from
                                         produtosdadosfiscais pdf
                                      where
                                         df.numero=pdf.dadofiscal
                                  )
                                  ,0)+ coalesce(
                                                 (
                                                    select
                                                       sum(sdf.quantidade)
                                                    from
                                                       servicosdadosfiscais sdf
                                                    where
                                                       df.numero=sdf.dadofiscal
                                                )
                                                ,0)) as Produtos
                      , false                        as ContratoeAPrazo
                      , 0.00                         as creditotroca
                     from
                        (((dadosfiscais df
                        left join
                           (usuarios u
                           left join
                              GruposUsuarios gu
                              on
                                 u.grupo = gu.codigo)
                           on
                              df.vendedor=u.codigo)
                        left join
                           vfornecedores vf
                           on
                              df.cliente         = vf.codigo
                              and df.tipocliente = vf.tipo)
                        join
                           (filiais f
                           left join
                              (filiaisgruposfiliais fgf
                              join
                                 gruposfiliais gf
                                 on
                                    fgf.grupo=gf.codigo)
                              on
                                 f.codigo=fgf.filial)
                           on
                              df.filialvenda=f.codigo)
                     Where
                        (
                           df.data between ('01/01/2024') and
                           (
                              '31/01/2024'
                           )
                        )
                        and df.contrato is null
                        and df.situacao       ='N'
                        and
                        (
                           eHNotaFiscalSaidaVenda(df.codigofiscal)
                           or mod(df.codigofiscal,1000) in (929)
                        )
                        and not coalesce(df.notavinculada,false)
                  )
                  /* final vendas frente de caixa */
                  ) as contratos
               group by
                  vendedor
                , nome
            )
            as VendasVendedores
          , (
               select
                  sum(valorprazo) as valorprazo
               from
                  (
                  /* inicio vendas por contrato */
                  (
                     select
                        ct.valorprazo
                     from
                        (((contratos ct
                        left join
                           (usuarios u
                           left join
                              GruposUsuarios gu
                              on
                                 u.grupo = gu.codigo)
                           on
                              ct.vendedor = u.codigo)
                        join
                           vfornecedores vf
                           on
                              ct.cliente         = vf.codigo
                              and ct.tipocliente = vf.tipo)
                        join
                           (filiais f
                           left join
                              (filiaisgruposfiliais fgf
                              join
                                 gruposfiliais gf
                                 on
                                    fgf.grupo=gf.codigo)
                              on
                                 f.codigo=fgf.filial)
                           on
                              ct.filialvenda=f.codigo)
                     where
                        ct.faturamento between('01/01/2024') and
                        (
                           '31/01/2024'
                        )
                        and
                        (
                           coalesce(ct.valorvista,0)<>0
                        )
                        and
                        (
                           coalesce(ct.valorprazo,0)<>0
                        )
                        and ct.origem is null
                        and
                        case
                           when ct.os
                              then ct.tipoequipamento in (1, 2)
                              and not (
                                 coalesce(ct.os_garantia,false)
                                 and ct.os_garantia_status='A'
                              )
                              and not coalesce(ct.os_cortesia,false)
                              else true
                        end
                  )
               /* final vendas por contrato */
               union all
                  /* inicio vendas frente de caixa */
                  (
                     select
                        df.valortotal as valorprazo
                     from
                        (((dadosfiscais df
                        left join
                           vfornecedores vf
                           on
                              df.cliente         = vf.codigo
                              and df.tipocliente = vf.tipo)
                        join
                           (usuarios u
                           left join
                              GruposUsuarios gu
                              on
                                 u.grupo = gu.codigo)
                           on
                              df.vendedor=u.codigo)
                        join
                           (filiais f
                           left join
                              (filiaisgruposfiliais fgf
                              join
                                 gruposfiliais gf
                                 on
                                    fgf.grupo=gf.codigo)
                              on
                                 f.codigo=fgf.filial)
                           on
                              df.filialvenda=f.codigo)
                     Where
                        (
                           df.data between ('01/01/2024') and
                           (
                              '31/01/2024'
                           )
                        )
                        and df.contrato is null
                        and df.situacao       ='N'
                        and
                        (
                           eHNotaFiscalSaidaVenda(df.codigofiscal)
                           or mod(df.codigofiscal,1000) in (929)
                        )
                        /* ((EXISTS (SELECT vdf.dadofiscal FROM venctosdadosfiscais vdf WHERE vdf.dadofiscal=df.numero)) or  (mod(df.codigofiscal,1000) in (102,103,104,105,929))) */
                        and not coalesce(df.notavinculada,false)
                  )
                  /* final vendas frente de caixa */
                  ) as SomatorioVendas
            )
            as VendasTotal
         group by
            VendasVendedores.vendedor
          , VendasVendedores.nomevendedor
          , VendasVendedores.ValorMercadoria
          , VendasVendedores.percdesconto
          , VendasVendedores.desconto
          , VendasVendedores.ValorLiquidoVendedor
          , VendasVendedores.eFinanceiro
          , VendasVendedores.Notas
          , VendasVendedores.produtos
          , VendasVendedores.ValorTotal
          , VendasVendedores.ValorVista
          , VendasVendedores.ValorPrazo
          , vendasVendedores.creditotroca
      )
      as vendas
)
/* inicio Devolucoes */
union all
   (
      select
         vendedor
       , nome                                                                    as nomevendedor
       , -sum((valorvista+desconto))                                             as ValorMercadoria
       , -(sum(desconto)*100)/(COALESCE(NULLIF((sum(valorvista+desconto)),0),1)) as percdesconto
       , -sum(desconto)                                                          as desconto
       , -sum(valorvista)                                                        as ValorLiquidoVendedor
       , -sum(ValorPrazo-ValorVista)                                             as eFinanceiro
       , -count(*)                                                               as Notas
       , -sum(quantidade)                                                        as produtos
       , -sum(ValorPrazo)                                                        as ValorTotal
       , -sum
            (
               case
                  when not ContratoeAPrazo
                     then ValorPrazo
                     else 0
               end
            )
         as ValorVista
       , -sum
            (
               case
                  when ContratoeAPrazo
                     then valorprazo
                     else 0
               end
            )
                               as ValorPrazo
       , sum(creditotroca)     as creditotroca
       , cast(null as numeric) as ValorTotalGeral
       , cast(null as numeric) as Percentual
       , 'B_Devolucoes'        as tipo
      from
         (
            select
               devolucoes.*
            from
               (
               (
                  select
                     u.codigo as vendedor
                   , u.nome
                   , devolucoes.valorvista
                   , devolucoes.valorprazo
                   , devolucoes.desconto
                   , devolucoes.frete
                   , devolucoes.seguro
                   , devolucoes.quantidade
                   , (
                        select
                           exists
                           (
                              select
                                 p.contrato
                              from
                                 parcelas p
                              where
                                 p.contrato       = ct.numero
                                 and p.datavencto > ct.faturamento
                           )
                     )
                                                 as ContratoeAPrazo
                   , coalesce(ct.creditotroca,0) as creditotroca
                  from
                     (
                     (
                        select
                           cd.contrato
                         , sum(cd.valorvista)                                            as valorvista
                         , sum(cd.valorprazo)                                            as valorprazo
                         , sum(coalesce(cd.desconto,0)+coalesce(cd.valordescontoitem,0)) as desconto
                         , sum(cd.frete)                                                 as frete
                         , sum(cd.seguro)                                                as seguro
                         , sum(cd.quantidade)                                            as quantidade
                        from
                           (contratosdevolvidos cd
                           join
                              (((contratos ct
                              join
                                 (usuarios u
                                 left join
                                    GruposUsuarios gu
                                    on
                                       u.grupo = gu.codigo)
                                 on
                                    ct.vendedor=u.codigo)
                              join
                                 vfornecedores vf
                                 on
                                    ct.cliente         = vf.codigo
                                    and ct.tipocliente = vf.tipo)
                              join
                                 (filiais f
                                 left join
                                    (filiaisgruposfiliais fgf
                                    join
                                       gruposfiliais gf
                                       on
                                          fgf.grupo=gf.codigo)
                                    on
                                       f.codigo=fgf.filial)
                                 on
                                    ct.filialvenda=f.codigo)
                              on
                                 cd.contrato=ct.numero)
                        where
                           cd.devolucao between('01/01/2024') and
                           (
                              '31/01/2024'
                           )
                           and cd.tipo='D'
                           and
                           case
                              when ct.os
                                 then ct.tipoequipamento in (1, 2)
                                 and not (
                                    coalesce(ct.os_garantia,false)
                                    and ct.os_garantia_status='A'
                                 )
                                 and not coalesce(ct.os_cortesia,false)
                                 else true
                           end
                        group by
                           cd.contrato
                     )
                  union all
                     (
                        select
                           ct.numero as contrato
                         , ct.valorvista
                         , ct.valorprazo
                         , (coalesce(ct.desconto, 0) + coalesce(
                                                                 (
                                                                    SELECT
                                                                       sum(pc.valordescontoitem)
                                                                    FROM
                                                                       produtoscontratos pc
                                                                    WHERE
                                                                       ct.numero=pc.contrato
                                                                )
                                                                ,0)) AS desconto
                         , coalesce(ct.frete,0)                      as frete
                         , coalesce(ct.seguro,0)                     as seguro
                         , (coalesce(
                                      (
                                         select
                                            sum(pc.quantidade)
                                         from
                                            produtoscontratos pc
                                         where
                                            ct.numero=pc.contrato
                                            and not pc.brinde
                                     )
                                     ,0)+ coalesce(
                                                    (
                                                       select
                                                          sum(sc.quantidade)
                                                       from
                                                          servicoscontratos sc
                                                       where
                                                          ct.numero=sc.contrato
                                                   )
                                                   ,0)) as quantidade
                        from
                           (
                              select distinct
                                 ct.numero
                              from
                                 contratos ct
                               , parcelas  p
                              where
                                 ct.numero      =p.contrato
                                 and ct.situacao='C'
                                 and not exists
                                 (
                                    select
                                       p2.numero
                                    from
                                       parcelas p2
                                    where
                                       p2.contrato      = ct.numero
                                       and p2.tipopagto<>'E'
                                 )
                                 and p.datapagto between '01/01/2024' and '31/01/2024'
                                 and not exists
                                 (
                                    select
                                       cd.contrato
                                    from
                                       contratosdevolvidos cd
                                    where
                                       cd.contrato = ct.numero
                                       and cd.tipo ='D'
                                 )
                                 and
                                 case
                                    when ct.os
                                       then ct.tipoequipamento in (1, 2)
                                       and not (
                                          coalesce(ct.os_garantia,false)
                                          and ct.os_garantia_status='A'
                                       )
                                       and not coalesce(ct.os_cortesia,false)
                                       else true
                                 end
                           )
                           as cancelados
                         , (((contratos ct
                           join
                              (usuarios u
                              left join
                                 GruposUsuarios gu
                                 on
                                    u.grupo = gu.codigo)
                              on
                                 ct.vendedor=u.codigo)
                           join
                              vfornecedores vf
                              on
                                 ct.cliente         = vf.codigo
                                 and ct.tipocliente = vf.tipo)
                           join
                              (filiais f
                              left join
                                 (filiaisgruposfiliais fgf
                                 join
                                    gruposfiliais gf
                                    on
                                       fgf.grupo=gf.codigo)
                                 on
                                    f.codigo=fgf.filial)
                              on
                                 ct.filialvenda=f.codigo)
                        where
                           cancelados.numero = ct.numero
                     )
                     ) as devolucoes
                   , (contratos ct
                     join
                        usuarios u
                        on
                           ct.vendedor=u.codigo)
                  where
                     devolucoes.contrato=ct.numero
               )
            union all
               (
                  select
                     u.codigo as vendedor
                   , u.nome
                   , np.valornota                                         as valorvista
                   , np.valornota                                         as valorprazo
                   , coalesce(np.desconto,0)+ coalesce(np.descontoitem,0) as desconto
                   , coalesce(np.freteinterno, 0)                         as frete
                   , coalesce(np.seguro,0)                                as seguro
                   , coalesce(
                               (
                                  select
                                     sum(pnp.quantidade)
                                  from
                                     produtosnotaspag pnp
                                  where
                                     pnp.codigonota=np.codigo
                              )
                              ,0) as quantidade
                   , false        as ContratoeAPrazo
                   , 0.00         as creditotroca
                  from
                     (((notaspag np
                     join
                        vfornecedores vf
                        on
                           np.fornecedor         = vf.codigo
                           and np.tipofornecedor = vf.tipo)
                     left join
                        (usuarios u
                        left join
                           GruposUsuarios gu
                           on
                              u.grupo = gu.codigo)
                        on
                           np.vendedor=u.codigo)
                     join
                        (filiais f
                        left join
                           (filiaisgruposfiliais fgf
                           join
                              gruposfiliais gf
                              on
                                 fgf.grupo=gf.codigo)
                           on
                              f.codigo=fgf.filial)
                        on
                           np.filial = f.codigo)
                  Where
                     (
                        np.data between ('01/01/2024') and
                        (
                           '31/01/2024'
                        )
                        and situacao='N'
                     )
                     and np.contrato is null
                     and ehnotafiscalentradadevolucao(np.codigofiscal)
               )
               ) as devolucoes
         )
         as devolucoes
      group by
         vendedor
       , nome
   )
   /* final devolucoes */
order by
   tipo
 , percentual desc
      ;