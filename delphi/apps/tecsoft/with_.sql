WITH atendimentos_ as

(
select
   a.cliente
 , a.tipocliente as clientetipo
 , vf.nome
 , a.data
 , a.lembrar
 , a.codigo
 , a.origem
 , a.tipo
 , a.assunto
 , a.tipoatendimento
 , ta.descricao as descricaotipoatendimento
 , cast(cast(a.lembrar as varchar)
      ||' '
      ||cast(a.lembrarhora as varchar) as timestamp) as lembrardatahora
 , a.orcamento
 , a.contrato
 , a.lembrarhora
 , a.datainclusao
 , ct.os
 , (
      Select
         a1.informes
      From
         atendimentos a1
      Where
         (
            a1.cliente = a.cliente
         )
         and
         (
            a1.tipocliente = a.tipocliente
         )
         and
         (
            a1.tipo = 'C'
         )
      Order By
         a1.data desc limit 1
   )
   as informescobranca
 , (
      Select
         a2.informes
      From
         atendimentos a2
      Where
         (
            a2.cliente = a.cliente
         )
         and
         (
            a2.tipocliente = a.tipocliente
         )
         and
         (
            a2.tipo = 'R'
         )
      Order By
         a2.data desc limit 1
   )
   as informesreclamacao
 , coalesce(
             (
                select
                   c.naoligar
                from
                   clientes c
                where
                   c.codigo          = a.cliente
                   and a.tipocliente = 'C'
            )
            ,false) as naoligar
 , (
      select
         c.razaonaoligar
      from
         clientes c
      where
         c.codigo          = a.cliente
         and a.tipocliente = 'C'
   )
   as razaonaoligar
 , case
      when a.tipocliente = 'C'
         then coalesce(
                        (
                           select
                              c.naoligar
                           from
                              clientes c
                           where
                              c.codigo          = a.cliente
                              and a.tipocliente = 'C'
                       )
                       ,false)
         else false
   end as naoligar
 , case
      when a.tipocliente = 'C'
         then
         (
            select
               c.razaonaoligar
            from
               clientes c
            where
               c.codigo          = a.cliente
               and a.tipocliente = 'C'
         )
         else cast(null as varchar(760))
   end   as razaonaoligar
 , false as comcontato
 , case
      when a.origem is null
         then a.data
         else
              (
                 select
                    a2.data
                 from
                    atendimentos a2
                 where
                    a2.codigo = a.origem
         )
   end as datainicio
 ,
   /* (select a2.data from atendimentos a2 where a2.codigo = coalesce(a.origem, a.codigo)) as datainicio,*/
   case
      when a.origem is null
         then a.informes
         else
              (
                 select
                    a2.informes
                 from
                    atendimentos a2
                 where
                    a2.origem = a.origem
                 order by
                    a2.data desc
                  , a2.codigo desc limit 1
         )
   end as informeultimocontato
 ,
   /* (select a2.informes from atendimentos a2 where coalesce(a2.origem, a2.codigo) = coalesce(a.origem,a.codigo) order by a2.data desc, a2.codigo desc limit 1) as informeultimocontato,*/
   a.usuario as vendedor
 , uc.nome   as nomevendedor
 ,
   /* (select u.nome from usuarios u where u.codigo = a.usuario) as nomevendedor, */
   coalesce(o.filial,ct.filialvenda,a.filial) as filialvenda
 ,
   /*  coalesce((select o.filial from orcamentos o where o.codigo = a.orcamento),  (select ct.filialvenda from contratos ct where ct.numero = a.contrato), a.filial) as filialvenda,  */
   case
      when a.contrato is not null
         and ct.situacao in ('N'
                           ,'P')
         then notas_notasdocontrato(a.contrato)
         else cast(null as varchar)
   end as notasdocontrato
 ,
   /* notas_notasdocontrato(a.contrato) as notasdocontrato, */
   a.status
from
   (((((atendimentos a
   join
      vfornecedores vf
      on
         a.cliente         = vf.codigo
         and a.tipocliente = vf.tipo)
   left join
      tiposatendimentos ta
      on
         a.tipoatendimento = ta.codigo)
   join
      (usuarios uc
      left join
         GruposUsuarios guc
         on
            uc.grupo = guc.codigo)
      on
         a.usuario = uc.codigo)
   left join
      (contratos ct
      join
         (usuarios uvc
         left join
            GruposUsuarios guvc
            on
               uvc.grupo = guvc.codigo)
         on
            ct.vendedor = uvc.codigo)
      on
         a.contrato = ct.numero)
   left join
      (orcamentos o
      join
         (usuarios uvo
         left join
            GruposUsuarios guvo
            on
               uvo.grupo = guvo.codigo)
         on
            o.vendedor = uvo.codigo)
      on
         a.orcamento = o.codigo)
where
   a.status = 'A'
   and
   case
      when a.origem is not null
         then a.codigo        = atendimento_origem(a.codigo)
         else true
   end
   and
   (
      coalesce(a.filial, (
         select
            o.filial
         from
            orcamentos o
         where
            o.codigo = a.orcamento
      )
      , (
         select
            ct.filialvenda
         from
            contratos ct
         where
            ct.numero = a.contrato
      )
      ) = 11
   )
   and
   (
      uc.codigo = '708'
   )
   and
   (
      a.lembrar between ('09/06/2023') and
      (
         '28/11/2023'
      )
   )
   and
   (
      a.lembrarhora   >= '00:00:00'
      or a.lembrarhora = '00:00:00'
   )
   and
   (
      (
         Select
            count(*)
         From
            atendimentos a1
         Where
            (
               a1.lembrar >= current_date
            )
            and
            (
               a1.cliente = a.cliente
            )
            and
            (
               a1.tipocliente = a.tipocliente
            )
            and
            (
               a1.tipo = 'C'
            )
      )
      = 0
   ) 
ORDER BY
   UPPER(TO_ASCII(vf.nome,'LATIN1')) 
   
   )
   
   
   select a.* from atendimentos_ a
   
   where 
   not exists
   (
      select
         a2.codigo
      from atendimentos a2
      where a2.origem is not null
        and a.origem = a2.origem
        and
         (
            (
               Select
                  count(*)
               From
                  atendimentos a1
               Where
                  (
                     a1.lembrar >= current_date
                  )
                  and
                  (
                     a1.cliente = a2.cliente
                  )
                  and
                  (
                     a1.tipocliente = a2.tipocliente
                  )
                  and
                  (
                     a1.tipo = 'C'
                  )
            )
            = 0
         )
/*         and coalesce(a.origem, a.codigo) = coalesce(a2.origem, a2.codigo)*/
         and a.codigo <= a2.codigo
         and
         (
            (
               cast(cast(a2.lembrar as varchar)
                  ||' '
                  ||cast(a2.lembrarhora as varchar) as timestamp) >= cast(cast(a.lembrar as varchar)
                  ||' '
                  ||cast(a.lembrarhora as varchar) as timestamp)
            )
            and a2.datainclusao > a.datainclusao
         )
         /*   and (cast(cast(a2.lembrar as varchar)||' '||cast(a2.lembrarhora as varchar) as timestamp) > cast(cast(a.lembrar as varchar)||' '||cast(a.lembrarhora as varchar) as timestamp) or  (cast(cast(a2.lembrar as varchar)||' '||cast(a2.lembrarhora as varchar) as timestamp) = cast(cast(a.lembrar as varchar)||' '||cast(a.lembrarhora as varchar) as timestamp) and a2.datainclusao > a.datainclusao)) */
         limit 1
   )
   
   
   
   /*  '\'00:00:00\''  */
;