rollback;

select
   selecao.*
 , to_char(datalancto, 'MM/YYYY') as mesAno
 , coalesce(NullIf(
   (
      select
         sum(dp.valorpagto)
      from
         duplicatas dp
         join
            documentospag dt
            on
               dp.documentopag = dt.numero
      where
         dp.documentopag = selecao.documentopag
         and not coalesce(dt.regimedecaixa,false)
   )
   ,0),selecao.valorpagto) as TotalValorPagto
 , coalesce(NullIf(
   (
      select
         sum
            (
               case
                  when dp.valorpagto>dp.valorvencto
                     then dp.valorpagto-dp.valorvencto
                     else 0.00
               end
            )
      from
         duplicatas dp
         join
            documentospag dt
            on
               dp.documentopag = dt.numero
      where
         dp.documentopag = selecao.documentopag
         and not coalesce(dt.regimedecaixa,false)
   )
   ,0), case
      when selecao.valorpagto>selecao.valorvencto
         then selecao.valorpagto-selecao.valorvencto
         else 0.00
   end) as TotalValorJurosPagos
 , coalesce(NullIf(
   (
      select
         sum
            (
               case
                  when coalesce(dp.valorpagto,0)<>0
                     and dp.valorpagto           <dp.valorvencto
                     then dp.valorvencto-dp.valorpagto
                     else 0.00
               end
            )
      from
         duplicatas dp
         join
            documentospag dt
            on
               dp.documentopag = dt.numero
      where
         dp.documentopag = selecao.documentopag
         and not coalesce(dt.regimedecaixa,false)
   )
   ,0), case
      when coalesce(selecao.valorpagto,0)<>0
         and selecao.valorpagto           <selecao.valorvencto
         then selecao.valorvencto-selecao.valorpagto
         else 0.00
   end) as TotalValorDescReceb
 , coalesce(NullIf(
   (
      select
         count(*)
      from
         duplicatas dp
         join
            documentospag dt
            on
               dp.documentopag = dt.numero
      where
         dp.documentopag = selecao.documentopag
         and not coalesce(dt.regimedecaixa,false)
   )
   ,0),1)                                                              as QtParcelas
 , coalesce(selecao.valorvencto,0) - coalesce(selecao.valordesconto,0) as valorliquido
from
   (
   (
      Select
         t.documentopag
       , t.numero
       , d.filialemissao
       , f.nome       as nomefilialemissao
       , f.cnpj       as cnpjfilial
       , fgf.grupo    as grupofilialemissao
       , gf.descricao as nomegrupofilialemissao
       , n.numero     as nota
       , n.serie
       , d.complemento
       , t.complemento as complementoduplicata
       , d.fornecedor
       , d.tipofornecedor
       , coalesce(vf.razao,vf.nome) as nomefornecedor
       , vf.pessoanumero            as cnpj_cpf_fornecedor
       , d.emissao
       , case
            when d.regimedecaixa
               then t.datavencto
               else d.datalancto
         end as datalancto
       , d.previsao
       , t.bancocobranca
       , (
            select
               b.sigla
            from
               bancos b
            where
               b.codigo = t.bancocobranca
         )
         as siglabancocobranca
       , t.datavencto
       , t.valorvencto
       , t.valordesconto
       , t.datapagto
       , t.valorpagto
       , (
            select
               b.sigla
            from
               bancos b
               join
                  contas c
                  on
                     c.banco = b.codigo
            where
               c.conta = t.contapagto
         )
         as siglabancopagto
       , t.contapagto
       , t.observacao
       , false as adiantamento
       , cast(cast(abs(t.datavencto - current_date)as varchar)
            || cast(' - D' as                         varchar) as varchar) as obs
       , case
            When 'f'
               then True
               else False
         end as Diferenciar
       , (
            select
               e.codigo
            from
               eventos e
            where
               e.codigo=coalesce(t.evento,d.evento)
         )
         as evento
       , (
            select
               e.descricao
            from
               eventos e
            where
               e.codigo=coalesce(t.evento,d.evento)
         )
         as descricao_evento
       , (
            select
               u.usename
            from
               duplicatas_log t_log
               join
                  usuarios u
                  on
                     t_log.trigger_user = u.usename
            where
               t_log.documentopag      = t.documentopag
               and t_log.numero        = t.numero
               and t_log.trigger_mode  = 'INSERT'
               and t_log.trigger_tuple = 'NEW'
            order by
               t_log.trigger_changed desc limit 1
         )
         as UsuarioLancamento
       , (
            select
               u.usename
            from
               duplicatas_log t_log
               join
                  usuarios u
                  on
                     t_log.trigger_user = u.usename
            where
               t_log.documentopag            = t.documentopag
               and t_log.numero              = t.numero
               and t_log.trigger_mode        = 'UPDATE'
               and t_log.trigger_tuple       = 'NEW'
               AND t_log.datapagto is not null
            order by
               t_log.trigger_changed desc limit 1
         )
         as UsuarioPagamento
       , t.dda
       , d.regimedecaixa
       , case
            when coalesce(d.regimedecaixa,false)
               then t.valorvencto
               else d.valor
         end as valor
      From
         ((duplicatas t
         left join
            notaspag n
            on
               n.documentopag = t.documentopag)
         join
            (((documentospag d
            join
               (filiais f
               left join
                  (filiaisgruposfiliais fgf
                  left join
                     gruposfiliais gf
                     on
                        fgf.grupo=gf.codigo )
                  on
                     f.codigo=fgf.filial)
               on
                  d.filialemissao=f.codigo)
            JOIN
               eventos e
               ON
                  d.evento = e.Codigo)
            join
               vfornecedores vf
               on
                  d.fornecedor         = vf.codigo
                  and d.tipofornecedor = vf.tipo)
            on
               t.documentopag = d.numero)
      where
         't'
         and
         (
            t.datapagto is null
         )
         and
         (
            d.emissao between ('01/01/2000') and
            (
               '31/07/2024'
            )
         )
         and
         (
            t.autorizado = true
         )
   )
union all
   (
      Select
         d.numero           as documentopag
       , cast(1 as integer) as numero
       , d.filialemissao
       , f.nome                   as nomefilialemissao
       , f.cnpj                   as cnpjfilial
       , fgf.grupo                as grupofilialemissao
       , gf.descricao             as nomegrupofilialemissao
       , cast(null as integer)    as nota
       , cast(null as varchar(3)) as serie
       , d.complemento
       , d.complemento as complementoduplicata
       , d.fornecedor
       , d.tipofornecedor
       , coalesce(vf.razao,vf.nome) as nomefornecedor
       , vf.pessoanumero            as cnpj_cpf_fornecedor
       , d.emissao
       , d.datalancto
       , d.previsao
       , (
            select
               ct.banco
            from
               contas ct
            where
               ct.conta = d.contapagto
         )
         as bancocobranca
       , (
            select
               b.sigla
            from
               bancos b
            where
               b.codigo =
               (
                  select
                     ct.banco
                  from
                     contas ct
                  where
                     ct.conta = d.contapagto
               )
         )
                      as siglabancocobranca
       , d.datalancto as datavencto
       , d.valor      as valorvencto
       , 0.00         as valordesconto
       , d.datalancto as datapagto
       , d.valor      as valorpagto
       , (
            select
               b.sigla
            from
               bancos b
            where
               b.codigo =
               (
                  select
                     ct.banco
                  from
                     contas ct
                  where
                     ct.conta = d.contapagto
               )
         )
         as siglabancopagto
       , d.contapagto
       , d.referencia          as observacao
       , true                  as adiantamento
       , cast(null as varchar) as obs
       , case
            When 'f'
               then True
               else False
         end as Diferenciar
       , (
            select
               e.codigo
            from
               eventos e
            where
               e.codigo=d.evento
         )
         as evento
       , (
            select
               e.descricao
            from
               eventos e
            where
               e.codigo=d.evento
         )
         as descricao_evento
       , (
            select
               u.nome
            from
               documentospag_log d_log
               join
                  usuarios u
                  on
                     d_log.trigger_user = u.usename
            where
               d_log.numero            = d.numero
               and d_log.trigger_mode  = 'INSERT'
               and d_log.trigger_tuple = 'NEW'
            order by
               d_log.trigger_changed desc limit 1
         )
         as UsuarioLancamento
       , (
            select
               u.nome
            from
               documentospag_log d_log
               join
                  usuarios u
                  on
                     d_log.trigger_user = u.usename
            where
               d_log.numero            = d.numero
               and d_log.trigger_mode  = 'INSERT'
               and d_log.trigger_tuple = 'NEW'
            order by
               d_log.trigger_changed desc limit 1
         )
               as UsuarioPagamento
       , false as dda
       , d.regimedecaixa
       , d.valor
      From
         (((documentospag d
         join
            (filiais f
            left join
               (filiaisgruposfiliais fgf
               left join
                  gruposfiliais gf
                  on
                     fgf.grupo=gf.codigo)
               on
                  f.codigo=fgf.filial)
            on
               d.filialemissao=f.codigo)
         JOIN
            eventos e
            ON
               d.evento = e.Codigo)
         join
            vfornecedores vf
            on
               d.fornecedor         = vf.codigo
               and d.tipofornecedor = vf.tipo)
      where
         coalesce(d.adiantamento,false)
         and 'f'
         and
         (
            d.emissao between ('01/01/2000') and
            (
               '31/07/2024'
            )
         )
   )
   ) as selecao
Order by
   filialemissao
 , nomefilialemissao
 , datavencto
 , nomefornecedor
 , fornecedor
;;