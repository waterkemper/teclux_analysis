;
select
   codigogrupofilial
 , nomegrupofilial
 , codigofilial
 , nomefilial
 , localizacao
 , codigoclasse
 , classeproduto
 , codigogrupo
 , grupoproduto
 , codigoproduto
 , codigoprodutovisual
 , produto
 , sum(Total)      as Total
 , sum(qtdestoque) as qtdestoque
from
   (
      select
         case
            When 'f'
               then codigogrupofilial
               else cast(null as integer)
         end as codigogrupofilial
       , case
            When 'f'
               then nomegrupofilial
               else cast(null as varchar)
         end as nomegrupofilial
       , case
            When 't'
               then codigofilial
               else cast(null as integer)
         end as codigofilial
       , case
            When 't'
               then nomefilial
               else cast(null as varchar)
         end as nomefilial
       , case
            When 'f'
               then localizacao
               else cast(null as varchar)
         end as localizacao
       , case
            When 'f'
               then codigoclasse
               else cast(null as varchar)
         end as codigoclasse
       , case
            When 'f'
               then classeproduto
               else cast(null as varchar)
         end as classeproduto
       , case
            When 'f'
               then codigogrupo
               else cast(null as varchar)
         end as codigogrupo
       , case
            When 'f'
               then grupoproduto
               else cast(null as varchar)
         end as grupoproduto
       , case
            When 'f'
               then codigoproduto
               else cast(null as bigint)
         end as codigoproduto
       , case
            When 'f'
               then codigoprodutovisual
               else cast(null as varchar(30))
         end as codigoprodutovisual
       , case
            When 'f'
               then produto
               else cast(null as varchar)
         end as produto
       , case
            When 'f'
               then financeiro
               else
                  (
                     case
                        when coalesce(qtdultimaentrada,0)<>0
                           then (qtdestoque*(custo_ultimaentrada/qtdultimaentrada))
                           else cast(null as numeric)
                     end
                  )
         end as Total
       , qtdestoque
      from
         (
            SELECT
               ep.*
             , estoques_preco(ep.codigoitem,ep.codigofilial) as precovenda
             , financeiro/qtdestoque                         as custo_medio
             , case
                  when 'f'
                     then custoestoquefisico(ep.codigoitem,ep.codigofilial,'30/06/2024')
                     else ep.valor
               end as Custo_ultimaEntrada
            from
               (
                  SELECT
                     ep.*
                  from
                     (
                        SELECT
                           ep.*
                         , (ep.emestoque+ep.reservado+ep.transito+ep.demonstracao+ep.conserto+ep.danificada+ep.reservaprevia+ep.estoquefisico) AS qtdestoque
                         , f.nome                                                                                                              AS nomefilial
                         , gf.descricao                                                                                                        as nomegrupofilial
                         , gf.codigo                                                                                                           as codigogrupofilial
                        FROM
                           (
                              select
                                 ep.*
                               , (
                                    select
                                       i.classificacaofiscal
                                    from
                                       ipi i
                                    where
                                       i.codigo = c.ipi
                                 )
                                                as classificacaofiscal
                               , cl.descricao   AS classeproduto
                               , cl.codigo      AS codigoclasse
                               , g.descricao    AS grupoproduto
                               , g.codigo       AS codigogrupo
                               , c.descricao    AS produto
                               , c.codigo       AS codigoproduto
                               , c.codigovisual as codigoprodutovisual
                               , cast(p.descricao
                                    ||' '
                                    ||coalesce(p.valorgrade1,'')
                                    ||' '
                                    ||coalesce(p.valorgrade2,'') as varchar) AS item
                               , ma.descricao                                AS marca
                               , p.referencia
                               , p.codigovisual as codigoitemvisual
                               , c.unidade
                               , c.subconta
                              from
                                 (
                                    select
                                       ep.*
                                     , m2.valor
                                     , m2.quantidade as qtdUltimaEntrada
                                    from
                                       (
                                          select
                                             e.codigofilial
                                           , e.codigoitem
                                           , e.localizacao
                                           , e.precocomicms
                                           ,
                                             /*,estoques_preco(e.produto,e.filial) as precovenda*/
                                             m.emestoque
                                           , m.reservado
                                           , m.transito
                                           , m.demonstracao
                                           , m.conserto
                                           , m.danificada
                                           , m.reservaprevia
                                           , m.estoquefisico
                                           , m.financeiro
                                          from
                                             (
                                                select
                                                   m.numero
                                                 , e.filial  as codigofilial
                                                 , e.produto as codigoitem
                                                 , e.localizacao
                                                 , e.precocomicms
                                                from
                                                   (
                                                      select
                                                         m2.numero
                                                       , m1.produto
                                                       , m1.filial
                                                      from
                                                         (
                                                            select
                                                               m1.data
                                                             , m1.produto
                                                             , m1.filial
                                                             , (
                                                                  select
                                                                     max(m2.lancto)
                                                                  from
                                                                     movimentos m2
                                                                  where
                                                                     m2.produto    = m1.produto
                                                                     and m2.filial = m1.filial
                                                                     and m2.data   = m1.data
                                                               )
                                                               as lancto
                                                            from
                                                               (
                                                                  select
                                                                     max(m1.data) as data
                                                                   , m1.produto
                                                                   , m1.filial
                                                                  from
                                                                     movimentos m1
                                                                  where
                                                                     m1.data < (cast('30/06/2024' as date)+1)
                                                                  group by
                                                                     m1.produto
                                                                   , m1.filial
                                                                  order by
                                                                     m1.produto
                                                                   , m1.filial
                                                               )
                                                               as m1
                                                         )
                                                         as m1
                                                         join
                                                            movimentos m2
                                                            on
                                                               m1.data        = m2.data
                                                               and m1.lancto  = m2.lancto
                                                               and m1.produto = m2.produto
                                                               and m1.filial  = m2.filial
                                                   )
                                                   as m
                                                   join
                                                      estoques e
                                                      on
                                                         m.produto    = e.produto
                                                         and m.filial = e.filial
                                                Where
                                                   (
                                                      e.filial = 1
                                                   )
                                                   /* WHERE ESTOQUE where e.produto =0 */
                                             )
                                             as e
                                             join
                                                movimentos m
                                                on
                                                   e.numero         = m.numero
                                                   and m.financeiro<>0
                                                   /*and m1.financeiro<>0*/
                                       )
                                       as ep
                                       LEFT JOIN
                                          movimentos m2
                                          ON
                                             m2.produto    = ep.codigoitem
                                             AND m2.filial = ep.codigofilial
                                             and m2.numero =
                                             (
                                                SELECT
                                                   m.numero
                                                   /*max(m.numero)*/
                                                from
                                                   movimentos m
                                                where
                                                   m.produto                              =ep.codigoitem
                                                   and m.filial                           =ep.codigofilial
                                                   and m.data                             < (cast('30/06/2024' as date)+1)
                                                   and substring(m.operacao from 12 for 1)='+'
                                                order by
                                                   m.data desc
                                                 , m.lancto desc limit 1
                                             )
                                 )
                                 as ep
                                 /*trocado para kilar, fica bem mais rapido*/
                                 JOIN
                                    produtos p
                                    on
                                       p.codigo=ep.codigoitem
                                 JOIN
                                    caracteristicas c
                                    on
                                       c.codigo=p.caracteristica
                                 JOIN
                                    grupos g
                                    on
                                       g.codigo=c.grupo
                                 JOIN
                                    classes cl
                                    on
                                       cl.codigo=c.classe
                                 JOIN
                                    marcas ma
                                    on
                                       ma.codigo=c.marca
                                 /*  muito lento na kilar - 02-01-2013 - banco 8.4  JOIN ( produtos p  JOIN (((caracteristicas c  JOIN grupos g  ON c.grupo = g.codigo)  JOIN classes cl  ON c.classe=cl.codigo)  JOIN marcas ma  ON c.marca=ma.codigo)  ON p.caracteristica=c.codigo)  ON p.codigo = ep.codigoitem */
                              where
                                 TRUE
                                 /* ((not (c.inativo is not null)) or (c.inativo>'30/06/2024')) Comentado em 13/09/2019 por LÚCIO WATERKEMPER */
                                 and c.tipoproduto in ('00')
                           )
                           as ep
                           JOIN
                              (filiais f
                              left join
                                 (filiaisgruposfiliais fgf
                                 join
                                    gruposfiliais gf
                                    on
                                       fgf.grupo = gf.codigo)
                                 on
                                    fgf.filial = f.codigo)
                              ON
                                 f.codigo = ep.codigofilial
                        Order by
                           nomefilial
                         , codigofilial
                         , codigoitemvisual
                         , codigoitem
                         , item
                     )
                     as ep
                  WHERE
                     qtdestoque>0
               )
               as ep
         )
         as temp
   )
   as temp
group by
   nomegrupofilial
 , codigogrupofilial
 , nomefilial
 , codigofilial
 , localizacao
 , classeproduto
 , codigoclasse
 , GrupoProduto
 , CodigoGrupo
 , Produto
 , CodigoProdutoVisual
 , CodigoProduto
Order by
   nomefilial
 , codigofilial
;