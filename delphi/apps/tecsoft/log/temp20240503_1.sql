 /* qryFiliaisClasseProdutos */
 
 
    select
       Vendas.*
     , round(((valorliquidoproduto * 100) / (COALESCE(NULLIF(TotalLiquidoProdutos,0),1))),2) as Percentual
    from
       (
          select
             VendasClasses.*
           , sum(TotalClasses.ValorBrutodoProduto-TotalClasses.ValorDescontodoProduto) as totalliquidoprodutos
          from
             (
                select
                   classe
                 , descricao                                                                                     as nomeclasse
                 , sum(quantidade)                                                                               as quantidade
                 , sum(ValorBrutodoProduto)                                                                      as ValorBrutodoProduto
                 , sum(ValorDescontodoProduto)                                                                   as ValorDescontodoProduto
                 , round(((sum(ValorDescontodoProduto)*100)/(COALESCE(NULLIF(sum(ValorBrutodoProduto),0),1))),2) as PercDescontodoProduto
                 , sum(ValorBrutodoProduto-ValorDescontodoProduto)                                               as valorliquidoProduto
                 , sum(ValorAcrescProduto)                                                                       as ValorAcrescProduto
                 , sum(ValoraVistadoProduto)                                                                     as ValoraVistadoProduto
                 , sum(ValoraPrazodoProduto)                                                                     as ValoraPrazodoProduto
                 , sum(creditotrocaclasse)                                                                       as creditotrocaclasse
                 , 'A_Vendas'                                                                                    as tipo
                from
                   (
                   /* inicio vendas por contrato */
                   (
                   (
                      select
                         classe
                       , descricao
                       , quantidade
                       , ValorBrutodoProduto
                       , ValorDescontodoProduto
                       , ValorAcrescProduto
                       , case
                            when not ContratoeAPrazo
                               then (ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto
                               else 0
                         end as ValoraVistadoProduto
                       , case
                            when ContratoeAPrazo
                               then (ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto
                               else 0
                         end                                                                                                                   as ValoraPrazodoProduto
                       , ((((ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto)*creditotroca)/(COALESCE(NULLIF(valorprazo,0),1))) as creditotrocaclasse
                      from
                         (
                         
                         
                         
                         
                         
                            select
                               c.classe
                             , cl.descricao
                             , pc.quantidade
                             , ((pc.quantidade*pc.precovenda) + coalesce(pc.frete,0) + coalesce(pc.seguro,0) - ratearimpostoretidoproduto_contratos (pc.contrato, pc.produto) ) as ValorBrutodoProduto
                             
                             , coalesce(pc.desconto,0) + coalesce(pc.valordescontoitem,0)                                                                                       as ValorDescontodoProduto
                             , coalesce(pc.acrescimo,0)                                                                                                                         as ValorAcrescProduto
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
                               as ContratoeaPrazo
                             , ct.valorprazo
                             , - coalesce(ct.creditotroca,0) as creditotroca
                            from
                               (((contratos ct
                               join
                                  ((produtoscontratos pc
                                  join
                                     (produtos p
                                     join
                                        (caracteristicas c
                                        join
                                           classes cl
                                           on
                                              c.classe=cl.codigo)
                                        on
                                           p.caracteristica=c.codigo)
                                     on
                                        pc.produto=p.codigo)
                                  join
                                     (usuarios u
                                     left join
                                        GruposUsuarios gu
                                        on
                                           u.grupo = gu.codigo)
                                     on
                                        pc.vendedor=u.codigo)
                                  on
                                     ct.numero = pc.contrato)
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
                               not pc.brinde
                               and ct.faturamento between('01/05/2024') and
                               (
                                  '03/05/2024'
                               )
                               and
                               (
                                  coalesce(ct.valorvista,0)<>0
                               )
                               and ct.origem is null
                               and filialvenda     = 1
                               
                               
                               
                               
                         )
                         as produtos
                   )
                union all
                   (
                      select
                         classe
                       , descricao
                       , quantidade
                       , ValorBrutodoProduto
                       , ValorDescontodoProduto
                       , ValorAcrescProduto
                       , case
                            when not ContratoeAPrazo
                               then ValorBrutodoProduto
                               else 0
                         end as ValoraVistadoProduto
                       , case
                            when ContratoeAPrazo
                               then ValorBrutodoProduto
                               else 0
                         end                                                                     as ValoraPrazodoProduto
                       , ((ValorBrutodoProduto*creditotroca)/(COALESCE(NULLIF(valorprazo,0),1))) as creditotrocaclasse
                      from
                         (
                            select
                               cast('SE' as       varchar)                             as classe
                             , cast('SERVICOS' as varchar)                             as descricao
                             , (coalesce(sc.quantidade,0))                             as quantidade
                             , (coalesce(sc.quantidade,0)*coalesce(sc.valorservico,0)) as valorBrutodoProduto
                             , cast(0 as numeric)                                      as valordescontodoProduto
                             , cast(0 as numeric)                                      as ValorAcrescProduto
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
                             , ct.valorprazo
                             , - coalesce(ct.creditotroca,0) as creditotroca
                            from
                               (((contratos ct
                               join
                                  (servicoscontratos sc
                                  left join
                                     (usuarios u
                                     left join
                                        GruposUsuarios gu
                                        on
                                           u.grupo = gu.codigo)
                                     on
                                        sc.vendedor=u.codigo)
                                  on
                                     ct.numero = sc.contrato)
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
                               ct.faturamento between('01/05/2024') and
                               (
                                  '03/05/2024'
                               )
                               and filialvenda = 1
                         )
                         as servicos
                   )
                   )
                /* final vendas por contrato */
                union all
                   /* inicio vendas frente de caixa */
                   (
                   (
                      select
                         classe
                       , descricao
                       , quantidade
                       , ValorBrutodoProduto
                       , ValorDescontodoProduto
                       , ValorAcrescProduto
                       , case
                            when not ContratoeAPrazo
                               then (ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto
                               else 0
                         end as ValoraVistadoProduto
                       , case
                            when ContratoeAPrazo
                               then (ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto
                               else 0
                         end  as ValoraPrazodoProduto
                       , 0.00 as creditotrocaclasse
                      from
                         (
                            select
                               c.classe
                             , cl.descricao
                             , pdf.quantidade
                             , ((pdf.quantidade*pdf.precovenda) + coalesce(pdf.frete,0) + coalesce(pdf.seguro,0)) as ValorBrutodoProduto
                             , coalesce(pdf.desconto,0) + coalesce(pdf.valordescontoitem,0)                       as ValorDescontodoProduto
                             , coalesce(pdf.acrescimo,0)                                                          as ValorAcrescProduto
                             , false                                                                              as ContratoeaPrazo
                             , 0.00                                                                               as valorprazo
                             , 0.00                                                                               as creditotroca
                            from
                               (((dadosfiscais df
                               join
                                  ((produtosdadosfiscais pdf
                                  join
                                     (produtos p
                                     join
                                        (caracteristicas c
                                        join
                                           classes cl
                                           on
                                              c.classe=cl.codigo)
                                        on
                                           p.caracteristica=c.codigo)
                                     on
                                        pdf.produto=p.codigo)
                                  join
                                     (usuarios u
                                     left join
                                        GruposUsuarios gu
                                        on
                                           u.grupo = gu.codigo)
                                     on
                                        pdf.vendedor=u.codigo)
                                  on
                                     df.numero = pdf.dadofiscal)
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
                                  df.data between ('01/05/2024') and
                                  (
                                     '03/05/2024'
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
                               and filialvenda = 1
                         )
                         as produtos
                   )
                union all
                   (
                      select
                         classe
                       , descricao
                       , quantidade
                       , ValorBrutodoProduto
                       , ValorDescontodoProduto
                       , ValorAcrescProduto
                       , case
                            when not ContratoeAPrazo
                               then ValorBrutodoProduto
                               else 0
                         end as ValoraVistadoProduto
                       , case
                            when ContratoeAPrazo
                               then ValorBrutodoProduto
                               else 0
                         end  as ValoraPrazodoProduto
                       , 0.00 as creditotrocaclasse
                      from
                         (
                            select
                               cast('SE' as       varchar)                               as classe
                             , cast('SERVICOS' as varchar)                               as descricao
                             , (coalesce(sdf.quantidade,0))                              as quantidade
                             , (coalesce(sdf.quantidade,0)*coalesce(sdf.valorservico,0)) as valorBrutodoProduto
                             , cast(0 as numeric)                                        as valordescontodoProduto
                             , cast(0 as numeric)                                        as ValorAcrescProduto
                             , false                                                     as ContratoeAPrazo
                             , 0.00                                                      as valorprazo
                             , 0.00                                                      as creditotroca
                            from
                               ((((dadosfiscais df
                               join
                                  servicosdadosfiscais sdf
                                  on
                                     df.numero = sdf.dadofiscal)
                               join
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
                               join
                                  (servicoscontratos sc
                                  join
                                     (usuarios u
                                     left join
                                        GruposUsuarios gu
                                        on
                                           u.grupo = gu.codigo)
                                     on
                                        sc.vendedor=u.codigo)
                                  on
                                     df.contrato     = sc.contrato
                                     and sdf.servico = sc.servico)
                            where
                               df.data between('01/05/2024') and
                               (
                                  '03/05/2024'
                               )
                               and not coalesce(df.notavinculada,false)
                               and filialvenda = 1
                         )
                         as servicos
                   )
                   )
                   /* final vendas frente de caixa */
                   ) as contratos
                group by
                   classe
                 , nomeclasse
                 , tipo
             )
             as VendasClasses
           , (
                select
                   sum(ValorBrutodoProduto)    as ValorBrutodoProduto
                 , sum(ValorDescontodoProduto) as ValorDescontodoProduto
                from
                   (
                   /* inicio vendas por contrato */
                   (
                   (
                      select
                         ((pc.quantidade*pc.precovenda) + coalesce(pc.frete,0) + coalesce(pc.seguro,0)) as ValorBrutodoProduto
                       , coalesce(pc.desconto,0) + coalesce(pc.valordescontoitem,0)                     as ValorDescontodoProduto
                      from
                         (((contratos ct
                         join
                            (produtoscontratos pc
                            join
                               (usuarios u
                               left join
                                  GruposUsuarios gu
                                  on
                                     u.grupo = gu.codigo)
                               on
                                  pc.vendedor=u.codigo)
                            on
                               ct.numero = pc.contrato)
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
                         not pc.brinde
                         and ct.faturamento between('01/05/2024') and
                         (
                            '03/05/2024'
                         )
                         and
                         (
                            coalesce(ct.valorvista,0)<>0
                         )
                         and ct.origem is null
                         and filialvenda     = 1
                   )
                union all
                   (
                      select
                         (coalesce(sc.quantidade,0)*coalesce(sc.valorservico,0)) as valorBrutodoProduto
                       , cast(0 as numeric)                                      as valordescontodoProduto
                      from
                         (((contratos ct
                         join
                            (servicoscontratos sc
                            left join
                               (usuarios u
                               left join
                                  GruposUsuarios gu
                                  on
                                     u.grupo = gu.codigo)
                               on
                                  sc.vendedor=u.codigo)
                            on
                               ct.numero = sc.contrato)
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
                         ct.faturamento between('01/05/2024') and
                         (
                            '03/05/2024'
                         )
                         and filialvenda = 1
                   )
                   )
                /* final vendas por contrato */
                union all
                   /* inicio vendas frente de caixa */
                   (
                   (
                      select
                         ((pdf.quantidade*pdf.precovenda) + coalesce(pdf.frete,0) + coalesce(pdf.seguro,0)) as ValorBrutodoProduto
                       , coalesce(pdf.desconto,0) + coalesce(pdf.valordescontoitem,0)                       as ValorDescontodoProduto
                      from
                         (((dadosfiscais df
                         join
                            (produtosdadosfiscais pdf
                            join
                               (usuarios u
                               left join
                                  GruposUsuarios gu
                                  on
                                     u.grupo = gu.codigo)
                               on
                                  pdf.vendedor=u.codigo)
                            on
                               df.numero = pdf.dadofiscal)
                         join
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
                            df.data between ('01/05/2024') and
                            (
                               '03/05/2024'
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
                         and filialvenda = 1
                   )
                union all
                   (
                      select
                         (coalesce(sdf.quantidade,0)*coalesce(sdf.valorservico,0)) as valorBrutodoProduto
                       , cast(0 as numeric)                                        as valordescontodoProduto
                      from
                         ((((dadosfiscais df
                         join
                            servicosdadosfiscais sdf
                            on
                               df.numero = sdf.dadofiscal)
                         join
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
                         join
                            (servicoscontratos sc
                            join
                               (usuarios u
                               left join
                                  GruposUsuarios gu
                                  on
                                     u.grupo = gu.codigo)
                               on
                                  sc.vendedor=u.codigo)
                            on
                               df.contrato     = sc.contrato
                               and sdf.servico = sc.servico)
                      where
                         df.data between('01/05/2024') and
                         (
                            '03/05/2024'
                         )
                         and not coalesce(df.notavinculada,false)
                         and filialvenda = 1
                   )
                   )
                   /* final vendas frente de caixa */
                   ) as somatorioVendas
             )
             as TotalClasses
          group by
             classe
           , nomeclasse
           , quantidade
           , vendasclasses.valorbrutodoproduto
           , vendasclasses.valordescontodoproduto
           , vendasclasses.percdescontodoproduto
           , vendasclasses.valorliquidoproduto
           , vendasclasses.ValorAcrescProduto
           , vendasclasses.valoravistadoproduto
           , vendasclasses.valoraprazodoproduto
           , vendasclasses.creditotrocaclasse
           , vendasclasses.tipo
       )
       as Vendas
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 /* inicio Devolucoes */
 union all
    (
    
    
       select
          classe
        , descricao                                                                                      as nomeclasse
        , -sum(quantidade)                                                                               as quantidade
        , -sum(ValorBrutodoProduto)                                                                      as ValorBrutodoProduto
        , -sum(ValorDescontodoProduto)                                                                   as ValorDescontodoProduto
        , -round(((sum(ValorDescontodoProduto)*100)/(COALESCE(NULLIF(sum(ValorBrutodoProduto),0),1))),2) as PercDescontodoProduto
        , -sum(ValorBrutodoProduto-ValorDescontodoProduto)                                               as valorliquidoProduto
        , -sum(ValorAcrescProduto)                                                                       as ValorAcrescProduto
        , -sum(ValoraVistadoProduto)                                                                     as ValoraVistadoProduto
        , -sum(ValoraPrazodoProduto)                                                                     as ValoraPrazodoProduto
        , sum(creditotrocaclasse)                                                                        as creditotrocaclasse
        , 'B_Devolucoes'                                                                                 as tipo
        , cast(null as numeric)                                                                          as totalliquidoprodutos
        , cast(null as numeric)                                                                          as Percentual
       from
          (
             select
                devolucoes.*
              , case
                   when not ContratoeAPrazo
                      then (ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto
                      else 0
                end as ValoraVistadoProduto
              , case
                   when ContratoeAPrazo
                      then (ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto
                      else 0
                end                                                                                                                 as ValoraPrazodoProduto
              , (((ValorBrutodoProduto-ValorDescontodoProduto)+ValorAcrescProduto)*creditotroca)/(COALESCE(NULLIF(valorprazo,0),1)) as creditotrocaclasse
             from
                (
                (
                   select
                      c.classe
                    , cl.descricao
                    , cd.quantidade
                    , (cd.valorvista + cd.desconto + coalesce(cd.valordescontoitem,0)) as ValorBrutodoproduto
                    , coalesce(cd.desconto,0) + coalesce(cd.valordescontoitem,0)       as ValorDescontodoProduto
                    , (cd.ValorPrazo-cd.ValorVista)                                    as ValorAcrescProduto
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
                    , cd.valorprazo
                    , 0.00 as creditotroca
                   from
                      ((contratosdevolvidos cd
                      join
                         ((contratos ct
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
                      join
                         ((produtoscontratos pc
                         join
                            (produtos p
                            join
                               (caracteristicas c
                               join
                                  classes cl
                                  on
                                     c.classe=cl.codigo)
                               on
                                  p.caracteristica=c.codigo)
                            on
                               pc.produto = p.codigo)
                         join
                            (usuarios u
                            left join
                               GruposUsuarios gu
                               on
                                  u.grupo = gu.codigo)
                            on
                               pc.vendedor=u.codigo)
                         on
                            cd.contrato   = pc.contrato
                            and cd.produto=pc.produto)
                   where
                      cd.devolucao between('01/05/2024') and
                      (
                         '03/05/2024'
                      )
                      and cd.tipo = 'D'
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
                      and filialvenda = 1
                )
             union all
                (
                
                
                   select
                      c.classe
                    , cl.descricao
                    , pc.quantidade
                    , ((pc.quantidade*pc.precovenda) + coalesce(pc.frete,0) + coalesce(pc.seguro,0) - ratearimpostoretidoproduto_contratos (pc.contrato, pc.produto) ) as ValorBrutodoProduto
                    , coalesce(pc.desconto,0) + coalesce(pc.valordescontoitem,0)                                                                                       as ValorDescontodoProduto
                    , coalesce(pc.acrescimo,0)                                                                                                                         as ValorAcrescProduto
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
                    , ct.valorprazo
                    , coalesce(ct.creditotroca,0) as creditotroca
                   from
                      (
                         select distinct
                            ct.numero
                          , p.datapagto
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
                            and p.datapagto between '01/05/2024' and '03/05/2024'
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
                         ((produtoscontratos pc
                         join
                            (produtos p
                            join
                               (caracteristicas c
                               join
                                  classes cl
                                  on
                                     c.classe = cl.codigo)
                               on
                                  p.caracteristica = c.codigo)
                            on
                               pc.produto=p.codigo)
                         join
                            (usuarios u
                            left join
                               GruposUsuarios gu
                               on
                                  u.grupo = gu.codigo)
                            on
                               pc.vendedor=u.codigo)
                         on
                            pc.contrato = ct.numero)
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
                      and filialvenda   = 1
                      
                      
                      
                      
                )
             union all
                (
                   select
                      c.classe
                    , cl.descricao
                    , pnp.quantidade
                    , (pnp.quantidade*pnp.precounitario) + coalesce(pnp.frete,0) + coalesce(pnp.seguro,0) as ValorBrutodoProduto
                    , coalesce(pnp.desconto,0) + coalesce(pnp.valordescontoitem,0)                        as ValorDescontodoProduto
                    , coalesce(pnp.acrescimo,0)                                                           as ValorAcrescProduto
                    , false                                                                               as ContratoeAPrazo
                    , np.valornota                                                                        as valorprazo
                    , 0.00                                                                                as creditotroca
                   from
                      (((notaspag np
                      join
                         ((produtosnotaspag pnp
                         join
                            (produtos p
                            join
                               (caracteristicas c
                               join
                                  classes cl
                                  on
                                     c.classe = cl.codigo)
                               on
                                  p.caracteristica = c.codigo)
                            on
                               pnp.produto=p.codigo)
                         left join
                            (usuarios u
                            left join
                               GruposUsuarios gu
                               on
                                  u.grupo = gu.codigo)
                            on
                               pnp.vendedor=u.codigo)
                         on
                            pnp.codigonota = np.codigo)
                      join
                         vfornecedores vf
                         on
                            np.fornecedor         = vf.codigo
                            and np.tipofornecedor = vf.tipo)
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
                            np.filial=f.codigo)
                   Where
                      (
                         np.data between ('01/05/2024') and
                         (
                            '03/05/2024'
                         )
                         and situacao='N'
                      )
                      and np.contrato is null
                      and ehnotafiscalentradadevolucao(np.codigofiscal)
                      and np.filial = 1
                )
                ) as devolucoes
          )
          as vendasclasses
       group by
          classe
        , nomeclasse
        , tipo
        
        
    )
    /* final devolucoes */
 order by
    tipo
  , percentual desc
       ;