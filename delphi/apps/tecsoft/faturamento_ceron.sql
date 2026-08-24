select sel.*
from
(


(

select 
       to_char(ct.faturamento, 'yyyy-MM') as ano_mes,
       cast('Faturamento de Licitações (notas emitidas)'  as varchar(100)) as descricao,      
       cast(6 as smallint) as ordem, 
             
/*       sum(coalesce(pc.frete,0)) as frete,*/
       
       sum(
       (pc.quantidade * pc.precovenda) -
        ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
        coalesce(pc.acrescimo,0) + 
        /*coalesce(pc.frete,0) - */
        coalesce(pc.desconto,0) -  
        coalesce(pc.descontofinanceiro,0)
        ) as total


from contratos ct
     join produtoscontratos pc
          join licitacoesprodutos lp
          on pc.licitacao = lp.licitacao
          and pc.produto = lp.produto
          and pc.numeroprodutolicitacao = lp.numero   
     on ct.numero = pc.contrato 
     
where ct.origem is null and
      ct.faturamento between '2023-07-01' and current_date
  and case when ct.os then ct.tipoequipamento in (1,2) 
  and not (coalesce(ct.os_garantia,false) 
  and ct.os_garantia_status='A') 
  and not coalesce(ct.os_cortesia,false) else true end
     
group by to_char(ct.faturamento, 'yyyy-MM')

)

union all

(

select 
       to_char(ct.faturamento, 'yyyy-MM') as ano_mes,
       cast('Fretes sob Licitações (notas emitidas)'  as varchar(100)) as descricao,      
       cast(6 as smallint) as ordem, 
             
       sum(coalesce(pc.frete,0)) as Total
       
       /*
       sum(
       (pc.quantidade * pc.precovenda) + 
        coalesce(pc.acrescimo,0) + 
        coalesce(pc.frete,0) - 
        coalesce(pc.desconto,0) -  
        coalesce(pc.descontofinanceiro,0)
        ) as total
        */


from contratos ct
     join produtoscontratos pc
          join licitacoesprodutos lp
          on pc.licitacao = lp.licitacao
          and pc.produto = lp.produto
          and pc.numeroprodutolicitacao = lp.numero   
     on ct.numero = pc.contrato 
     
where ct.origem is null and
      ct.faturamento between '2023-07-01' and current_date
  and case when ct.os then ct.tipoequipamento in (1,2) 
  and not (coalesce(ct.os_garantia,false) 
  and ct.os_garantia_status='A') 
  and not coalesce(ct.os_cortesia,false) else true end
  
  and coalesce(pc.frete,0) <> 0
     
group by to_char(ct.faturamento, 'yyyy-MM')

)

union all


(

select 
       to_char(ct.faturamento, 'yyyy-MM') as ano_mes,
       cast('Faturamento Sem Licitações (notas emitidas)'  as varchar(100)) as descricao,      
       cast(6 as smallint) as ordem, 
             
/*       sum(coalesce(pc.frete,0)) as frete,*/
       
       sum(
       (pc.quantidade * pc.precovenda) -
       ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
        coalesce(pc.acrescimo,0) + 
        /*coalesce(pc.frete,0) - */
        coalesce(pc.desconto,0) -  
        coalesce(pc.descontofinanceiro,0)
        ) as total


from contratos ct
     join produtoscontratos pc
     /*
          left join licitacoesprodutos lp
          on pc.licitacao = lp.licitacao
          and pc.produto = lp.produto
          and pc.numeroprodutolicitacao = lp.numero 
          */  
     on ct.numero = pc.contrato 
     
where ct.origem is null and
      ct.faturamento between '2023-07-01' and current_date
  and case when ct.os then ct.tipoequipamento in (1,2) 
  and not (coalesce(ct.os_garantia,false) 
  and ct.os_garantia_status='A') 
  and not coalesce(ct.os_cortesia,false) else true end
  and pc.licitacao is null
     
group by to_char(ct.faturamento, 'yyyy-MM')

)

union all

(

select 
       to_char(ct.faturamento, 'yyyy-MM') as ano_mes,
       cast('Fretes sem Licitações (notas emitidas)'  as varchar(100)) as descricao,      
       cast(6 as smallint) as ordem, 
             
       sum(coalesce(pc.frete,0)) as Total
       
       /*
       sum(
       (pc.quantidade * pc.precovenda) + 
        coalesce(pc.acrescimo,0) + 
        coalesce(pc.frete,0) - 
        coalesce(pc.desconto,0) -  
        coalesce(pc.descontofinanceiro,0)
        ) as total
        */


from contratos ct
     join produtoscontratos pc
     /*
          left join licitacoesprodutos lp
          on pc.licitacao = lp.licitacao
          and pc.produto = lp.produto
          and pc.numeroprodutolicitacao = lp.numero   
          */
     on ct.numero = pc.contrato 
     
where ct.origem is null and
      ct.faturamento between '2023-07-01' and current_date
  and case when ct.os then ct.tipoequipamento in (1,2) 
  and not (coalesce(ct.os_garantia,false) 
  and ct.os_garantia_status='A') 
  and not coalesce(ct.os_cortesia,false) else true end
  
  and coalesce(pc.frete,0) <> 0
  and pc.licitacao is null
     
group by to_char(ct.faturamento, 'yyyy-MM')

)





) as sel