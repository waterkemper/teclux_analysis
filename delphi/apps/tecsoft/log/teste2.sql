select
             sel.*
           , case
                          when coalesce(sel.novo_preco_desejado,0) > 0
                                       then ((sel.novo_preco_desejado - sel.comissao - sel.custo_frete - sel.custo_produto - sel.ValorImposto) / sel.novo_preco_desejado)*100
                                       else cast(null as numeric(6,2))
             end                                                                                                                                                                                                                as margem
           , (((sel.PrecoVendaComDesconto + sel.ValorDevDescInformado) - sel.ComissPrecoVendaComDesc - sel.ValorComissaoDevDes - sel.custo_frete - sel.custo_produto - sel.NovoValorImposto) / sel.PrecoVendaComDesconto) * 100 as novamargem
           , false                                                                                                                                                                                                              as alterado
           , true                                                                                                                                                                                                               as alterar
           , 0.00                                                                                                                                                                                                               as CampoCalculado
           , Cast(null as Varchar(50))                                                                                                                                                                                          as NomeCampoCalculado
           , row_number() OVER (PARTITION by 0)                                                                                                                                                                                 as _seq
from
             (
                    select
                           sel.*
                         , comissao_manutencao_preco(vendedor,Novo_Preco_Desejado)                                          as comissao
                         , comissao_manutencao_preco(sel.PercComissao, sel.PrecoVendaComDesconto, sel.descricaomarketplace) as ComissPrecoVendaComDesc
                         , comissao_manutencao_preco(sel.PercComissao, sel.ValorDevDescInformado, sel.descricaomarketplace) as ValorComissaoDevDes
                         , sel.PrecoVendaComDesconto * sel.Aliq_icms / 100                                                  as NovoValorImposto
                    from
                           (
                                  select *
                                       , sel.novo_preco_desejado    - sel.ValorDescontoInformado               as PrecoVendaComDesconto
                                       , sel.ValorDescontoInformado * sel.PercentualDevDescontoInformado / 100 as ValorDevDescInformado
                                  from
                                         (
                                                select *
                                                     , (sel.novo_preco_desejado * sel.PercentualDescontoInformado / 100) as ValorDescontoInformado
                                                     , sel.novo_preco_desejado * sel.Aliq_icms / 100                     as ValorImposto
                                                from
                                                       (
                                                              select *
                                                                   , case
                                                                            when sel.precotabelado
                                                                                   then sel.precovendacargo
                                                                                   else (custo_produto + custo_frete) / (1 - coalesce(margem_final_desejada_pm,margem_final_desejada_mk)/100 - (perccomissao + aliq_icms)/100)
                                                                     end as Novo_Preco_Desejado
                                                              from
                                                                     (
                                                                            select *
                                                                                 ,
                                                                                   /* custo_frete(produto, tabela_frete, precovendacargo_m_p_f ) as custo_frete,*/
                                                                                   custo_frete(produto, tabela_frete, precovendacargo) as custo_frete
                                                                            from
                                                                                   (
                                                                                          select *
                                                                                               ,
                                                                                                 /* precovendacargo * coalesce(FatorMarkProduto,0)/100 as ValorMarkProduto,*/
                                                                                                 /* precovendacargo + (precovendacargo * coalesce(FatorMarkProduto,0)/100) as precovendacargo_m_p_f, */
                                                                                                 case
                                                                                                        when sel.regimetributario = 1
                                                                                                               then
                                                                                                               case
                                                                                                                      when sel.csosn not in ('101'
                                                                                                                                           ,'102'
                                                                                                                                           ,'900')
                                                                                                                             then (sel.PercentualICMSSimples * 66.5)/100
                                                                                                                             else sel.PercentualICMSSimples
                                                                                                               end
                                                                                                               else
                                                                                                               case
                                                                                                                      when sel.cst in ('00'
                                                                                                                                     ,'20')
                                                                                                                             then sel.PercentualICMSNormal
                                                                                                                             else cast(0 as numeric(6,2))
                                                                                                               end
                                                                                                 end as Aliq_icms
                                                                                          from
                                                                                                 (
                                                                                                           select
                                                                                                                     mk.codigo
                                                                                                                   , pm.codigo as codigo_produto_marketplace
                                                                                                                   , CAST(cast(mk.codigo as varchar)
                                                                                                                               || '-'
                                                                                                                               ||u.nome AS varchar(130)) as descricaomarketplace
                                                                                                                   , pm.marketplace
                                                                                                                   , cast(cast(cg.codigo as varchar)
                                                                                                                               || '-'
                                                                                                                               ||cg.descricao as varchar(60)) as tabela
                                                                                                                   , pc.cargo
                                                                                                                   , p.codigo       as produto
                                                                                                                   , P.codigovisual as produtovisual
                                                                                                                   , c.codigo       as caracteristica
                                                                                                                   , cp.coluna
                                                                                                                   , cp.validade
                                                                                                                   , p.preco
                                                                                                                   , c.codigovisual as caracteristicavisual
                                                                                                                   , cast(trim(p.descricao
                                                                                                                               ||' '
                                                                                                                               ||coalesce(p.valorgrade1,'')
                                                                                                                               ||' '
                                                                                                                               ||coalesce(p.valorgrade2,'')) as varchar(202)) as descricao
                                                                                                                   , p.valorgrade1
                                                                                                                   , p.valorgrade2
                                                                                                                   , c.grupo
                                                                                                                   , c.classe
                                                                                                                   , c.marca
                                                                                                                   , p.resultadocurvaabc
                                                                                                                   , c.csosn
                                                                                                                   , case
                                                                                                                               when customedio(p.codigo,e.filial)>0
                                                                                                                                         then customedio(p.codigo,e.filial)
                                                                                                                                         else e.valorultimacompra
                                                                                                                     end as custo_produto
                                                                                                                   , p.peso_entrega
                                                                                                                   , pc.markup as desconto_cargo
                                                                                                                   ,
                                                                                                                     (
                                                                                                                               case
                                                                                                                                         when cast(mk.cargo_preco as varchar)=parametros_valor('Cargo Tabela Preco Internet')
                                                                                                                                                   THEN estoques_preco(pm.produto,mk.filial,pc.markup)
                                                                                                                                                   ELSE estoques_precoporcargonormal(pm.produto,mk.filial,pc.markup)
                                                                                                                               END
                                                                                                                     )
                                                                                                                     as precovendacargo
                                                                                                                   , CASE
                                                                                                                               WHEN estoques_preco(p.codigo, mk.filial_estoque , pc.markup) = 0
                                                                                                                                         then 0
                                                                                                                                         else (1 - e.valorultimacompra /estoques_preco(p.codigo, mk.filial_estoque, pc.markup)) * 100
                                                                                                                     end as margem_cargo
                                                                                                                   ,
                                                                                                                     /* m_p_f.fator as FatorMarkProduto,*/
                                                                                                                     coalesce(
                                                                                                                               (
                                                                                                                                      select
                                                                                                                                             g_m_c.comissao
                                                                                                                                      from
                                                                                                                                             grupo_marketplace_comissao g_m_c
                                                                                                                                      where
                                                                                                                                             g_m_c.grupo_codigo           = g.codigo
                                                                                                                                             and g_m_c.marketplace_codigo = mk.codigo
                                                                                                                              )
                                                                                                                              , (
                                                                                                                                     select
                                                                                                                                            cu.percprazo
                                                                                                                                     from
                                                                                                                                            comissoesusuarios cu
                                                                                                                                     where
                                                                                                                                            cu.usuario = u.codigo limit 1
                                                                                                                              )
                                                                                                                              ) as perccomissao
                                                                                                                   , mk.vendedor
                                                                                                                   , ti.valor as cst
                                                                                                                   , fm.regimetributario
                                                                                                                   , case
                                                                                                                               when fm.regimetributario = 1
                                                                                                                                         then cast('SIMPLES' as varchar(10))
                                                                                                                                         else cast('NORMAL' as  varchar(10))
                                                                                                                     end as descricaoregimetributario
                                                                                                                   , c.markup
                                                                                                                   , mk.filial_estoque
                                                                                                                   , mk.filial
                                                                                                                   , e.valorultimacompra as ultimacompra
                                                                                                                   , (
                                                                                                                            select
                                                                                                                                   markup_inverso
                                                                                                                            from
                                                                                                                                   formacaoprecovenda(p.codigo, mk.filial_estoque, '', '', e.valorultimacompra, 0, c.markup, 0, 0, estoques_preconormal(p.codigo, mk.filial_estoque) )
                                                                                                                     )
                                                                                                                     as markupinverso
                                                                                                                   , (
                                                                                                                            select
                                                                                                                                   precovenda
                                                                                                                            from
                                                                                                                                   formacaoprecovenda(p.codigo, mk.filial_estoque, '', '', e.valorultimacompra, 0, c.markup, 0, 0 )
                                                                                                                     )
                                                                                                                                                                       as precovenda
                                                                                                                   , estoques_preconormal(p.codigo, mk.filial_estoque) as preconormal
                                                                                                                   , pr.promocao
                                                                                                                   , pro.descricao as descricaopromocao
                                                                                                                   , mk.tabela_frete
                                                                                                                   , mk.margem_final_desejada as margem_final_desejada_mk
                                                                                                                   , pm.margem_final_desejada as margem_final_desejada_pm
                                                                                                                   , (
                                                                                                                            select
                                                                                                                                   ei.valor
                                                                                                                            from
                                                                                                                                   estadosicms ei
                                                                                                                            where
                                                                                                                                   ei.icms       = c.icms
                                                                                                                                   and ei.estado = fm.estado
                                                                                                                     )
                                                                                                                                                              as PercentualICMSNormal
                                                                                                                   , cast(coalesce(12, 0.00) as numeric(6,2)) as PercentualICMSSimples
                                                                                                                   , cast(coalesce(0, 0.00) as  numeric(6,2)) as PercentualDescontoInformado
                                                                                                                   , cast(coalesce(0, 0.00) as  numeric(6,2)) as PercentualDevDescontoInformado
                                                                                                                   , c.precotabelado
                                                                                                           from
                                                                                                                     produtos p
                                                                                                                     join
                                                                                                                               produto_marketplace pm
                                                                                                                     join
                                                                                                                               marketplace mk
                                                                                                                     join
                                                                                                                               cargos cg
                                                                                                                               on
                                                                                                                                         cg.codigo=mk.cargo_preco
                                                                                                                     join
                                                                                                                               usuarios u
                                                                                                                               on
                                                                                                                                         u.codigo=mk.vendedor
                                                                                                                     join
                                                                                                                               filiais fm
                                                                                                                               on
                                                                                                                                         mk.filial = fm.codigo
                                                                                                                                         on
                                                                                                                                                   mk.codigo=pm.marketplace
                                                                                                                                                   on
                                                                                                                                                             p.codigo=pm.produto
                                                                                                                                         join
                                                                                                                                                   produtoscargos pc
                                                                                                                                                   on
                                                                                                                                                             p.codigo     = pc.produto
                                                                                                                                                             and pc.cargo = mk.cargo_preco
                                                                                                                                         join
                                                                                                                                                   caracteristicas c
                                                                                                                                         join
                                                                                                                                                   grupos g
                                                                                                                                                   on
                                                                                                                                                             g.codigo=c.grupo
                                                                                                                                         join
                                                                                                                                                   classes cl
                                                                                                                                                   on
                                                                                                                                                             cl.codigo=c.classe
                                                                                                                                         join
                                                                                                                                                   marcas m
                                                                                                                                                   on
                                                                                                                                                             m.codigo=c.marca
                                                                                                                                         join
                                                                                                                                                   tributosicms ti
                                                                                                                                                   on
                                                                                                                                                             ti.codigo = c.incidencia
                                                                                                                                         left join
                                                                                                                                                   csosn
                                                                                                                                                   on
                                                                                                                                                             csosn.codigo = c.csosn
                                                                                                                                                             on
                                                                                                                                                                       c.codigo=p.caracteristica
                                                                                                                                                   join
                                                                                                                                                             estoques e
                                                                                                                                                             on
                                                                                                                                                                       e.produto    =p.codigo
                                                                                                                                                                       and e.filial = mk.filial_estoque
                                                                                                                                                   join
                                                                                                                                                             (precos pr
                                                                                                                                                             left join
                                                                                                                                                                       promocoes pro
                                                                                                                                                                       on
                                                                                                                                                                                 pr.promocao = pro.codigo)
                                                                                                                                                             on
                                                                                                                                                                       pr.caracteristica = c.codigo
                                                                                                                                                                       and pr.codigo     = p.preco
                                                                                                                                                   join
                                                                                                                                                             colunasprecos cp
                                                                                                                                                             on
                                                                                                                                                                       cp.caracteristica = p.caracteristica
                                                                                                                                                                       and cp.preco      = pr.codigo
                                                                                                                                                                       and cp.coluna     = fm.preconormal
                                                                                                                                                   /*  left join marketplace_produtos_fator m_p_f  on m_p_f.produto = p.codigo  and m_p_f.marketplace = mk.codigo  */
                                                                                                                                         where
                                                                                                                                                   true
                                                                                                                                                   and
                                                                                                                                                   (
                                                                                                                                                             g.codigo = '1'
                                                                                                                                                   )
                                                                                                                                                   and not p.foralinhal
                                                                                                                                                   and not c.foralinhal
                                                                                                                                                   and
                                                                                                                                                   (
                                                                                                                                                             not
                                                                                                                                                             (
                                                                                                                                                                       p.inativo is not null
                                                                                                                                                             )
                                                                                                                                                   )
                                                                                                                                                   and
                                                                                                                                                   (
                                                                                                                                                          select
                                                                                                                                                                 sum(emestoque+reservado+conserto+demonstracao+reservaprevia+futuro)
                                                                                                                                                          from
                                                                                                                                                                 estoques
                                                                                                                                                          where
                                                                                                                                                                 estoques.produto=p.codigo
                                                                                                                                                   )
                                                                                                                                                   >0
                                                                                                                                                   and not estoques_produtoempromocao(p.codigo, 7)
                                                                                                                                                   and coalesce(mk.ativo,false)
                                                                                                                                                   /*  and mk.descricao='SKYHUB'  and e.filial=7  and not p.inativol  and pm.ativo  */
                                                                                                                                         order by
                                                                                                                                                   p.codigo
                                                                                                                                                 , mk.codigo
                                                                                                 )
                                                                                                 as sel
                                                                                   )
                                                                                   as sel
                                                                     )
                                                                     as sel
                                                       )
                                                       as sel
                                         )
                                         as sel
                           )
                           as sel
                    ;