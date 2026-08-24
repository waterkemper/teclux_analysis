rollback;
begin;

select dynamic_pivot_(

'

WITH 

  
  Licitacoes_Ganhas_Venda as
  (
  select 
         to_char(l.datavenda, ''yyyy-MM'') as ano_mes,
	 cast(''C'' as char(3)) as tipoconta,
         True as totalizar,
         cast(''Licitações Ganhas - Venda''  as varchar(100)) as descricao,
         cast(1 as smallint) as ordem,
         sum(lc.quantidade * lc.preco) as Total

  from licitacoes l
       join filiais f
       on l.filialvenda = f.codigo

       join licitacoesprodutos lc
       on lc.licitacao = l.numero


  where l.datavenda between

  '':Data_Inicial''

  and

  '':Data_Final''


  group by to_char(l.datavenda, ''yyyy-MM'')
  ),

  Custos as
  (
  select
         to_char(l.datavenda, ''yyyy-MM'') as ano_mes,
		 cast(''C'' as char(3)) as tipoconta,
                 True as totalizar,
         cast(''Custo''  as varchar(100)) as descricao,
         cast(3 as smallint) as ordem,
         - sum(lc.quantidade * coalesce(lc.customedio,0)) as Total


  from licitacoes l
       join filiais f
       on l.filialvenda = f.codigo

       join licitacoesprodutos lc
       on lc.licitacao = l.numero


  where l.datavenda between

  '':Data_Inicial''

  and

  '':Data_Final''


  group by to_char(l.datavenda, ''yyyy-MM'')
  ),
  
  Lucro_Bruto_Prejuizo AS 
  
    (select L_G_V.ano_mes,
	      cast(''RT'' as char(3)) as tipoconta,
              True as totalizar,
          cast(''LUCRO BRUTO / PREJUIZO''  as varchar(100)) as descricao,      
          cast(5 as smallint) as ordem,
          sum(l_G_V.total+Custos.total) as total          
   from Licitacoes_Ganhas_Venda  L_G_V
        join Custos 
        on L_G_V.ano_mes = Custos.ano_mes
   group by L_G_V.ano_mes, Custos.ano_mes),

  
  Emissao as 
  (
  select 
       to_char(cast(

       '':Data_Inicial''

       as date), ''yyyy-MM'') as ano_mes,
       cast(''C'' as char(3)) as tipoconta,
       False as totalizar,
       cast(''EMISSÃO''  as varchar(100)) as descricao,
       cast(7 as smallint) as ordem,       
       cast(null as numeric(11,2)) as Total

  ),
  
  Faturamento_de_Licitacoes AS 
  
  (

	select 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Faturamento de Licitações (notas emitidas)''  as varchar(100)) as descricao,      
		   cast(9 as smallint) as ordem, 
				 
	/*       sum(coalesce(pc.frete,0)) as frete,*/
		   
		   sum(
		   (pc.quantidade * pc.precovenda) -
			ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
			coalesce(pc.acrescimo,0) - 
			/*coalesce(pc.frete,0) - */
			coalesce(pc.desconto,0) -  
	/*        coalesce(pc.descontofinanceiro,0)*/
			coalesce(pc.valordescontoitem,0)  
			) as total


	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero   
		 on ct.numero = pc.contrato 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')
  ),
  
  Faturamento_sem_Licitacoes as 
  (

	select 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Faturamento Sem Licitações (notas emitidas)''  as varchar(100)) as descricao,      
		   cast(11 as smallint) as ordem, 
				 
	/*       sum(coalesce(pc.frete,0)) as frete,*/
		   
		   sum(
		   (pc.quantidade * pc.precovenda) -
		   ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
			coalesce(pc.acrescimo,0) - 
			/*coalesce(pc.frete,0) - */
			coalesce(pc.desconto,0) -  
	/*        coalesce(pc.descontofinanceiro,0) */
			coalesce(pc.valordescontoitem,0)  
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
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  and pc.licitacao is null
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	Total_Faturamento as
   (select faturamento.ano_mes, 
           cast(''T'' as char(3)) as tipoconta,
           True as totalizar, 
	       cast(''TOTAL FATURAMENTO'' as varchar(100)) as descricao, 
	       cast(13 as SMALLINT) as ordem,
		   sum(faturamento.Total) as Total
		   from
		   (	    
			   (select ano_mes, total from Faturamento_de_Licitacoes)  union ALL 
			   (select ano_mes, total from Faturamento_sem_Licitacoes)
		    ) as faturamento
			group by faturamento.ano_mes),
			
	Custo_Eqptos_Faturamento_com_Licitacoes as		
	(

	select 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Custo dos Equipamentos sobre o Faturamento de Licitações (notas emitidas)''  as varchar(100)) as descricao,      
		   cast(8 as smallint) as ordem, 
		   
		  - sum(    
			pc.quantidade *	

			  cast(coalesce( e.valorultimacompra,

			  case when (e.emestoque +
						   e.reservado +
								 e.reservaprevia +
								 e.transito +
								 e.demonstracao +
								 e.conserto +
								 e.danificada) <> 0 then


				 (e.financeiro / (e.emestoque +
												 e.reservado +
												 e.reservaprevia +
												 e.transito +
												 e.demonstracao +
												 e.conserto +
												 e.danificada) )

			  end ,  0.00) as numeric(11,2))) Total
			


	from contratos ct
		 join produtoscontratos pc
		 
			  join estoques e
			  on pc.produto = e.produto
			  and pc.filial = e.filial
			  
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero   
		 on ct.numero = pc.contrato 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''


	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	Custo_Eqptos_Faturamento_sem_Licitacoes as		
	(

	select 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Custo dos Equipamentos sobre o Faturamento sem Licitações (notas emitidas)''  as varchar(100)) as descricao,      
		   cast(15 as smallint) as ordem, 
				 
		  
		 - sum(pc.quantidade *	

			  cast(coalesce( e.valorultimacompra,

			  case when (e.emestoque +
						   e.reservado +
								 e.reservaprevia +
								 e.transito +
								 e.demonstracao +
								 e.conserto +
								 e.danificada) <> 0 then


				 (e.financeiro / (e.emestoque +
												 e.reservado +
												 e.reservaprevia +
												 e.transito +
												 e.demonstracao +
												 e.conserto +
												 e.danificada) )

			  end ,  0.00) as numeric(11,2))) Total


	from contratos ct
		 join produtoscontratos pc
		 
			  join estoques e
			  on pc.produto = e.produto
			  and pc.filial = e.filial

		 /*
			  left join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero 
			  */  
		 on ct.numero = pc.contrato 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''


	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  and pc.licitacao is null
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	
	Total_Custo_Eqptos_Faturamento as
   (select Total_Custo_Eqptos_Faturamento.ano_mes, 
           cast(''T'' as char(3)) as tipoconta,
           True as totalizar, 
	       cast(''TOTAL CUSTO EQUIPAMENTO SOBRE O FATURAMENTO'' as varchar(100)) as descricao, 
	       cast(17 as SMALLINT) as ordem,
		   sum(Total_Custo_Eqptos_Faturamento.Total) as Total
		   from
		   (	    
			   (select ano_mes, total from Custo_Eqptos_Faturamento_com_Licitacoes)  union ALL 
			   (select ano_mes, total from Custo_Eqptos_Faturamento_sem_Licitacoes)
		    ) as Total_Custo_Eqptos_Faturamento
			group by Total_Custo_Eqptos_Faturamento.ano_mes),
			
	Fretes_Sobre_Faturamento_com_Licitacoes as		
			
	(

	select 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar, 
		   cast(''Fretes sob Licitações (notas emitidas)''  as varchar(100)) as descricao,      
		   cast(19 as smallint) as ordem, 
				 
		 - sum(coalesce(pc.frete,0)) as Total
		   
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
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''


	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false)
	  and ct.os_garantia_status=''A'')
	  and not coalesce(ct.os_cortesia,false) else true end

	  and coalesce(pc.frete,0) <> 0

	group by to_char(ct.faturamento, ''yyyy-MM'')

	),

	Fretes_Sobre_Faturamento_sem_Licitacoes as

	(

	select
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Fretes sem Licitações (notas emitidas)''  as varchar(100)) as descricao,
		   cast(21 as smallint) as ordem,

		 - sum(coalesce(pc.frete,0)) as Total

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
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false)
	  and ct.os_garantia_status=''A'')
	  and not coalesce(ct.os_cortesia,false) else true end

	  and coalesce(pc.frete,0) <> 0
	  and pc.licitacao is null

	group by to_char(ct.faturamento, ''yyyy-MM'')

	),


    Espaco_linha_Frete as
   (
    select
       to_char(cast(

       '':Data_Inicial''

       as date), ''yyyy-MM'') as ano_mes,
	   cast(''C'' as char(3)) as tipoconta,
           False as totalizar,
       cast('' ''  as varchar(100)) as descricao,
       cast(23 as smallint) as ordem,
       cast(null as numeric(11,2)) as Total

    ),

	Comissao_Sobre_Licitacoes as
	(
	select
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,

		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Comissão Sobre Licitações ''||u.nome  as varchar(100)) as descricao,
		   cast(25 as smallint) as ordem,


		 - sum(
		   round(
		   (
			 (
			   cv.perccomissao *

			   (
			   (pc.quantidade * pc.precovenda) -
				ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
				coalesce(pc.acrescimo,0) +
				coalesce(pc.frete,0) -
				coalesce(pc.desconto,0) -
		/*        coalesce(pc.descontofinanceiro,0)*/
				coalesce(pc.valordescontoitem,0)
				)
			  )/100
			),2)


			) as total


	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero
		 on ct.numero = pc.contrato

		 join contratosvendedores cv
			  join usuarios u
			  on cv.vendedor = u.codigo
		 on ct.numero = cv.contrato

	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false)
	  and ct.os_garantia_status=''A'')
	  and not coalesce(ct.os_cortesia,false) else true end

	  and not pc.brinde

	group by to_char(ct.faturamento, ''yyyy-MM''), u.nome
	),

	Total_Comissao_Sobre_Licitacoes as
	(
	  select ano_mes, 
	         cast(''T'' as char(3)) as tipoconta,
                 True as totalizar,
	         cast(''TOTAL COMISSÕES SOBRE LICITAÇÕES''  as varchar(100)) as descricao,
	         cast(27 as smallint) as ordem,
		   - sum(total) as total
      from
	  (
	  select
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''Comissão Sobre Licitações ''||u.nome  as varchar(100)) as descricao,
		   cast(12 as smallint) as ordem,


		   sum(
		   round(
		   (
			 (
			   cv.perccomissao *

			   (
			   (pc.quantidade * pc.precovenda) -
				ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
				coalesce(pc.acrescimo,0) +
				coalesce(pc.frete,0) -
				coalesce(pc.desconto,0) -
		/*        coalesce(pc.descontofinanceiro,0)*/
				coalesce(pc.valordescontoitem,0)
				)
			  )/100
			),2)


			) as total


	   from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero
		 on ct.numero = pc.contrato

		 join contratosvendedores cv
			  join usuarios u
			  on cv.vendedor = u.codigo
		 on ct.numero = cv.contrato

	   where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	    and case when ct.os then ct.tipoequipamento in (1,2)
	    and not (coalesce(ct.os_garantia,false)
	    and ct.os_garantia_status=''A'')
	    and not coalesce(ct.os_cortesia,false) else true end

	    and not pc.brinde

	   group by to_char(ct.faturamento, ''yyyy-MM''), u.nome
	  ) as Total_Comissao_Sobre_Licitacoes
	  group by ano_mes
	),


	Comissao_Sem_Licitacoes as
	(


   	    select
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Comissão Sem Licitações ''||u.nome  as varchar(100)) as descricao,
		   cast(29 as smallint) as ordem,


		 - sum(
		   round(
		   (
			 (
			   cv.perccomissao *

			   (
			   (pc.quantidade * pc.precovenda) -
				ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
				coalesce(pc.acrescimo,0) +
				coalesce(pc.frete,0) - 
				coalesce(pc.desconto,0) -  
		/*        coalesce(pc.descontofinanceiro,0)*/
				coalesce(pc.valordescontoitem,0)  
				)
			  )/100
			),2)
			
			
			) as total


	     from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato 
		 
		 join contratosvendedores cv
			  join usuarios u
			  on cv.vendedor = u.codigo    
		 on ct.numero = cv.contrato
		 
		where ct.origem is null and
			  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

		  and case when ct.os then ct.tipoequipamento in (1,2)
		  and not (coalesce(ct.os_garantia,false)
		  and ct.os_garantia_status=''A'')
		  and not coalesce(ct.os_cortesia,false) else true end

		  and not pc.brinde
		  and pc.licitacao is null

		group by to_char(ct.faturamento, ''yyyy-MM''), u.nome
	),


	Total_Comissao_Sem_Licitacoes as
	(

	  select ano_mes, 
	         cast(''T'' as char(3)) as tipoconta,
                 True as totalizar,
	         cast(''TOTAL COMISSÕES SEM LICITAÇÕES''  as varchar(100)) as descricao,
	         cast(31 as smallint) as ordem,
		   - sum(total) as total
      from
	  (



   	    select
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''Comissão Sem Licitações ''||u.nome  as varchar(100)) as descricao,
		   cast(13 as smallint) as ordem,


		   sum(
		   round(
		   (
			 (
			   cv.perccomissao *

			   (
			   (pc.quantidade * pc.precovenda) -
				ratearimpostoretidoproduto_contratos(ct.numero, pc.produto) +
				coalesce(pc.acrescimo,0) +
				coalesce(pc.frete,0) -
				coalesce(pc.desconto,0) -
		/*        coalesce(pc.descontofinanceiro,0)*/
				coalesce(pc.valordescontoitem,0)
				)
			  )/100
			),2)


			) as total


	     from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato

		 join contratosvendedores cv
			  join usuarios u
			  on cv.vendedor = u.codigo
		 on ct.numero = cv.contrato

		where ct.origem is null and
			  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

		  and case when ct.os then ct.tipoequipamento in (1,2)
		  and not (coalesce(ct.os_garantia,false)
		  and ct.os_garantia_status=''A'')
		  and not coalesce(ct.os_cortesia,false) else true end
		  
		  and not pc.brinde
		  and pc.licitacao is null
			 
		group by to_char(ct.faturamento, ''yyyy-MM''), u.nome
		
	  ) AS Total_Comissao_Sem_Licitacoes	
	  group by ano_mes
	),
	
	ICMS_sobre_Faturamento_de_Licitacoes as
	(
	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento de Licitações - ICMS''  as varchar(100)) as descricao,      
		   cast(33 as smallint) as ordem, 
		   
		 - sum(pdf.icmsvalor) as total

	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero   
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''


	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	IPI_sobre_Faturamento_de_Licitacoes as
	(
	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento de Licitações - IPI''  as varchar(100)) as descricao,      
		   cast(35 as smallint) as ordem, 
		   
		 - sum(pdf.valoripi) as total

	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero   
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false)
	  and ct.os_garantia_status=''A'')
	  and not coalesce(ct.os_cortesia,false) else true end

	  and not pc.brinde

	group by to_char(ct.faturamento, ''yyyy-MM'')

	),


	PIS_sobre_Faturamento_de_Licitacoes as
	(
	SELECT
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento de Licitações - PIS''  as varchar(100)) as descricao,
		   cast(37 as smallint) as ordem,

		 - sum(pdf.pisvalor) as total

	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero
		 on ct.numero = pc.contrato

		 join dadosfiscais df
		 on ct.numero = df.contrato

		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto
		 and pc.filial = pdf.filial
		 and df.numero = pdf.dadofiscal


	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false)
	  and ct.os_garantia_status=''A'')
	  and not coalesce(ct.os_cortesia,false) else true end

	  and not pc.brinde

	group by to_char(ct.faturamento, ''yyyy-MM'')

	),

	COFINS_sobre_Faturamento_de_Licitacoes as
	(

	SELECT
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento de Licitações - COFINS''  as varchar(100)) as descricao,
		   cast(39 as smallint) as ordem,

		 - sum(pdf.cofinsvalor) as total

	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero
		 on ct.numero = pc.contrato

		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2)
	  and not (coalesce(ct.os_garantia,false)
	  and ct.os_garantia_status=''A'')
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	Total_Impostos_sobre_Faturamento_de_Licitacoes as
	(

	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''T'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''TOTAL IMPOSTOS SOBRE FATURAMENTO DE LICITAÇÕES''  as varchar(100)) as descricao,      
		   cast(41 as smallint) as ordem, 
		   
		 - sum(coalesce(pdf.cofinsvalor,0) + 
		       coalesce(pdf.pisvalor,0) + 
			   coalesce(pdf.valoripi,0) + 
			   coalesce(pdf.icmsvalor,0)) as total

	from contratos ct
		 join produtoscontratos pc
			  join licitacoesprodutos lp
			  on pc.licitacao = lp.licitacao
			  and pc.produto = lp.produto
			  and pc.numeroprodutolicitacao = lp.numero   
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	ICMS_sobre_Faturamento_sem_Licitacoes as 	
	(

	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento sem Licitações - ICMS''  as varchar(100)) as descricao,      
		   cast(43 as smallint) as ordem, 
		   
		 - sum(pdf.icmsvalor) as total

	from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''


	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
	  and pc.licitacao is null
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	IPI_sobre_Faturamento_sem_Licitacoes as 
	(

	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento sem Licitações - IPI''  as varchar(100)) as descricao,      
		   cast(43 as smallint) as ordem, 
		   
		 - sum(pdf.valoripi) as total

	from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
	  and pc.licitacao is null
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	PIS_sobre_Faturamento_sem_Licitacoes as 
	(


	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento sem Licitações - PIS''  as varchar(100)) as descricao,      
		   cast(45 as smallint) as ordem, 
		   
		 - sum(pdf.pisvalor) as total

	from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
	  and pc.licitacao is null
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	COFINS_sobre_Faturamento_sem_Licitacoes as 
	(

	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''C'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''Impostos sobre Faturamento sem Licitações - COFINS''  as varchar(100)) as descricao,      
		   cast(47 as smallint) as ordem, 
		   
		 - sum(pdf.cofinsvalor) as total

	from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
	  and pc.licitacao is null
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
	
	Total_Impostos_sobre_Faturamento_sem_Licitacoes as
	(

	SELECT 
		   to_char(ct.faturamento, ''yyyy-MM'') as ano_mes,
		   cast(''T'' as char(3)) as tipoconta,
                   True as totalizar,
		   cast(''TOTAL IMPOSTOS SOBRE FATURAMENTO SEM LICITAÇÕES''  as varchar(100)) as descricao,      
		   cast(49 as smallint) as ordem, 
		   
		 - sum(coalesce(pdf.cofinsvalor,0) + 
		       coalesce(pdf.pisvalor,0) + 
			   coalesce(pdf.valoripi,0) + 
			   coalesce(pdf.icmsvalor,0)) as total

	from contratos ct
		 join produtoscontratos pc
		 on ct.numero = pc.contrato 
		 
		 join dadosfiscais df
		 on ct.numero = df.contrato
		 
		 join produtosdadosfiscais pdf
		 on pc.produto = pdf.produto     
		 and pc.filial = pdf.filial	
		 and df.numero = pdf.dadofiscal 
		 
		 
	where ct.origem is null and
		  ct.faturamento between

                  '':Data_Inicial''

                  and

                  '':Data_Final''


	  and case when ct.os then ct.tipoequipamento in (1,2) 
	  and not (coalesce(ct.os_garantia,false) 
	  and ct.os_garantia_status=''A'') 
	  and not coalesce(ct.os_cortesia,false) else true end
	  
	  and not pc.brinde
	  and pc.licitacao is null
		 
	group by to_char(ct.faturamento, ''yyyy-MM'')

	),
    
      pg_eventos_ as 
  (
  
  select to_char(d.datavencto, ''yyyy-MM'') as ano_mes,    
         cast(''C'' as char(3)) as tipoconta,
         True as totalizar, 
         d.descricao,
         cast(51 as SMALLINT) as ordem,      
         - sum(d.valorvencto) as Total
  from
  
    (         
      
    select 
          d.datavencto,    
          
          (select e2.descricao
           from eventos e2 
           where e2.codigo <> e.codigo
             and position(e2.classificacao in e.classificacao)=1
             and e2.tipo = ''S''
             order by e2.classificacao desc limit 1         
            ) as descricao,       
          
          d.valorvencto
                  
          
    from duplicatas d
         join documentospag dp
         on d.documentopag = dp.numero
         join eventos e
         on coalesce(d.evento, dp.evento) = e.codigo
         
    where d.datavencto between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

      and e.incluirnadregerencial  
      and trim(e.descricao) <> ''Empréstimos Bancos'' /* Existe uma linha específica para empréstimo */
  )  as d    
  where trim(d.descricao) <> ''Investimentos''  
  group by to_char(d.datavencto, ''yyyy-MM''), d.descricao
  order by to_char(d.datavencto, ''yyyy-MM''), d.descricao
  ),

    
    Soma_despesas as
   (select sel.ano_mes, 
           cast(''T'' as char(3)) as tipoconta,
           True as totalizar,
	       cast(''TOTAL DESPESAS'' as varchar(100)) as descricao, 
	       cast(53 as SMALLINT) as ordem,
		   sum(sel.Total) as Total
		   from
		   (	    
			   (select ano_mes, total from Total_Impostos_sobre_Faturamento_sem_Licitacoes)  union ALL 
			   (select ano_mes, total from Total_Impostos_sobre_Faturamento_de_Licitacoes) union all
               (select ano_mes, total from pg_eventos_) union all
               (select ano_mes, total from Total_Comissao_Sem_Licitacoes) union all
               (select ano_mes, total from Total_Comissao_sobre_Licitacoes) union all
               (select ano_mes, total from Total_Custo_Eqptos_Faturamento) union all
               (select ano_mes, total from Fretes_Sobre_Faturamento_sem_Licitacoes) union all
               (select ano_mes, total from Fretes_Sobre_Faturamento_com_Licitacoes)
		    ) as sel
			group by sel.ano_mes
     ),
     
   Lucro_do_Exercicio as
   (select sel.ano_mes, 
           cast(''RT'' as char(3)) as tipoconta,
           True as totalizar,
	       cast(''LUCRO DO EXERCÍCIO'' as varchar(100)) as descricao, 
	       cast(55 as SMALLINT) as ordem,
		   sum(sel.Total) as Total
		   from
		   (	    
			   (select ano_mes, total from Total_Faturamento)  union ALL 
			   (select ano_mes, total from Soma_despesas) 
		    ) as sel
			group by sel.ano_mes
     ),
     
  Linha_Caixa as 
  (
  select 
       to_char(cast(

       '':Data_Inicial''

       as date), ''yyyy-MM'') as ano_mes,
       cast(''C'' as char(3)) as tipoconta,
       False as totalizar,
       cast(''CAIXA''  as varchar(100)) as descricao,      
       cast(57 as smallint) as ordem,       
       cast(null as numeric(11,2)) as Total

  ),
     
     
    Recebimentos_em_Aberto as
    (
        WITH Recebimentos_em_Aberto_ as
        ( 
           select sel.faturamento, sum(sel.valorvencto) as valorvencto FROM
             (    
               (
                  Select c.faturamento
                   , sum(p.valorvencto) as valorvencto
                   
                     
                  from
                     ((contratos c
                     join
                        (filiais f
                        left join
                           (filiaisgruposfiliais fgf
                           join
                              gruposfiliais gf
                              on
                                 fgf.grupo=gf.codigo)
                           on
                              f.codigo = fgf.filial)
                        on
                           c.filialvenda = f.codigo)
                     join
                        (parcelas p
                        left join
                           (filiais f_p
                           left join
                              (filiaisgruposfiliais fgf_p
                              join
                                 gruposfiliais gf_p
                                 on
                                    fgf_p.grupo=gf_p.codigo)
                              on
                                 f_p.codigo = fgf_p.filial)
                           on
                              p.filialpagto = f_p.codigo)
                        on
                           c.numero = p.contrato)
                     left join
                        usuarios u
                        on
                           c.vendedor = u.codigo
                  Where
                     c.numero = p.contrato
                     and c.Situacao IN (''F''
                                      ,''N''
                                      ,''P'')
                     AND NOT contratos_renegociado(c.numero)
                     and coalesce(p.tipopagto,'''') <>''E''
                     and
                     case
                        when c.os
                           then c.tipoequipamento in (1, 2)
                           else true
                     end
                     and
                     (
                        p.datapagto is null
                     )
                     and c.faturamento <=

                       '':Data_Final''


                     and coalesce(p.formapagamento,'''')<>''T''
                     
                  group by c.faturamento   
                     
                     
               )
             
               
              /* NÃO TRATAM DEVOLUÇÕES 
      union all

               (
                  Select c.faturamento
                   , - sum(p.valorvencto) as valorvencto
                  from
                     ((contratos c
                     join
                        (filiais f
                        left join
                           (filiaisgruposfiliais fgf
                           join
                              gruposfiliais gf
                              on
                                 fgf.grupo=gf.codigo)
                           on
                              f.codigo = fgf.filial)
                        on
                           c.filialvenda = f.codigo)
                     join
                        (parcelas p
                        left join
                           (filiais f_p
                           left join
                              (filiaisgruposfiliais fgf_p
                              join
                                 gruposfiliais gf_p
                                 on
                                    fgf_p.grupo=gf_p.codigo)
                              on
                                 f_p.codigo = fgf_p.filial)
                           on
                              p.filialpagto = f_p.codigo)
                        on
                           c.numero = p.contrato)
                     left join
                        usuarios u
                        on
                           c.vendedor = u.codigo
                  Where
                     c.numero                   = p.contrato
                     and p.deventrada is not null
                     AND NOT contratos_renegociado(c.numero)
                     and
                     case
                        when c.os
                           then c.tipoequipamento in (1, 2)
                           else true
                     end
                     and ''f''
                     and
                     (
                        p.datapagto is null
                     )
                     and c.faturamento <= current_date
                     and coalesce(p.formapagamento,'''')<>''T''
                     
                 group by c.faturamento    
               )
               */
             ) as sel group by sel.faturamento
      )

      select to_char(mon_last,''YYYY-MM'') as ano_mes,
              cast(''C'' as char(3)) as tipoconta,
              false as totalizar,
      	      cast(''A Receber'' as varchar(100)) as descricao,
	          cast(59 as SMALLINT) as ordem,

              (select sum(valorvencto) 
               from Recebimentos_em_Aberto_
               where faturamento <= mon_last) as Total                 
      from         
      (        
                          
          select min(cast(d as date)) as mon_first,
                 max(cast(d as date)) as mon_last
          FROM   generate_series(date

          '':Data_Inicial''

          ,
          date

          '':Data_Final''

          , interval ''1 day'') d
          group by to_char(d, ''YYYY/MM'')
                                             
      )  as sel    
    
    ),
    
    
    Pagamentos_em_Aberto as
    (
    
        with Pagamentos_em_Aberto as
        (

          
           select emissao, sum(valorliquido) as valorliquido
           From
           (
           
               (
                  Select d.emissao,
                         sum(coalesce(t.valorvencto,0) - 
                             coalesce(t.valordesconto,0)) as valorliquido		   
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
                     ''t''
                     and
                     (
                        t.datapagto is null
                     )
                     and
                     (
                        d.emissao between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

                     )
                     and
                     (
                        t.autorizado = true
                     )
        			 
                  group by d.emissao
        		  
               )
            union all
               (
                  Select
                     d.emissao,
                     sum(d.valor) as valorliquido
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
                     and ''f''
                     and
                     (
                        d.emissao between

                  '':Data_Inicial''

                  and

                  '':Data_Final''

                     )
                  group by d.emissao 		 
               )
            ) as sel   
            group by emissao
        )


        select to_char(mon_last,''YYYY-MM'') as ano_mes,
		      cast(''C'' as char(3)) as tipoconta,
                      False as totalizar,
      	      cast(''À Pagar'' as varchar(100)) as descricao, 
	          cast(61 as SMALLINT) as ordem,
        
              -  (select sum(valorliquido) 
                 from Pagamentos_em_Aberto
                 where emissao <= mon_last) as Total                 
        from         
        (        
          select min(cast(d as date)) as mon_first,
                 max(cast(d as date)) as mon_last
          FROM   generate_series(date

          '':Data_Inicial''

          ,
          date

          '':Data_Final''

          , interval ''1 day'') d
          group by to_char(d, ''YYYY/MM'')
        )  as sel 
    ),
    
    
  Linha_Bancos_e_Caixa as 
  (
  select 
       to_char(cast(

       '':Data_Inicial''

       as date), ''yyyy-MM'') as ano_mes,
       cast(''C'' as char(3)) as tipoconta,
       False as totalizar,
       cast(''  ''  as varchar(100)) as descricao,      
       cast(63 as smallint) as ordem,       
       cast(null as numeric(11,2)) as Total

  ),
    
    
  Saldos_Bancos_e_Caixa as
  (
  
      select to_char(periodo.mon_last,''yyyy-MM'') as ano_mes,
      /*       c.banco, b.nome, c.agencia, ag.nome, c.conta, c.digito,*/
	         cast(''C'' as char(3)) as tipoconta,
              false as totalizar,   
             cast(b.nome||'' ''||''Ag. ''||ag.nome||'' ''||cast(c.conta as varchar)||''-''||cast(c.digito as varchar) as varchar(100)) as descricao,
             cast(64 as smallint) as ordem,
             saldobanco(c.conta, periodo.mon_last,''C'') as Total
             
      from contas c
           join agencias ag
           on c.banco = ag.banco
           and c.agencia = ag.codigo
           
           join bancos b
           on c.banco = b.codigo,
                                                                                (
                                                                                  select min(cast(d as date)) as mon_first,
                                                                                         max(cast(d as date)) as mon_last
                                                                                  FROM   generate_series(date

                                                                                  '':Data_Inicial''

                                                                                  ,
                                                                                  date

                                                                                  '':Data_Final''

                                                                                  , interval ''1 day'') d
                                                                                  group by to_char(d, ''YYYY/MM'')
                                                                                  order by to_char(d, ''YYYY/MM'')
                                                                                  ) as periodo
  ),
  
  
  Total_Saldos_Bancos_e_Caixa as
  (
     select ano_mes, 
            /* descricao,  */
			cast(''T'' as char(3)) as tipoconta,
                        false as totalizar,
            cast(''TOTAL SALDOS BANCÁRIOS E CAIXA CERON'' as varchar(100)) as descricao,
            cast(65 as smallint) as ordem,
            sum(Total) as Total 
     from
     
     (
      select to_char(periodo.mon_last,''yyyy-MM'') as ano_mes,
      /*       c.banco, b.nome, c.agencia, ag.nome, c.conta, c.digito, */
             cast(b.nome||'' ''||''Ag. ''||ag.nome||'' ''||cast(c.conta as varchar)||''-''||cast(c.digito as varchar) as varchar(100)) as descricao,
             cast(65 as smallint) as ordem,
             saldobanco(c.conta, periodo.mon_last,''C'') as Total
             
      from contas c
           join agencias ag
           on c.banco = ag.banco
           and c.agencia = ag.codigo
           
           join bancos b
           on c.banco = b.codigo,
                                                                                (
                                                                                  select min(cast(d as date)) as mon_first,
                                                                                         max(cast(d as date)) as mon_last
                                                                                  FROM   generate_series(date

                                                                                  '':Data_Inicial''

                                                                                  ,
                                                                                  date

                                                                                  '':Data_Final''

                                                                                  , interval ''1 day'') d
                                                                                  group by to_char(d, ''YYYY/MM'')
                                                                                  order by to_char(d, ''YYYY/MM'')
                                                                                  ) as periodo


  
   ) as sel
     group by ano_mes
     order by ano_mes
  ),
  
    
    
  pg_eventos_Emprestimos as 
  (
  
            select 
                  to_char(periodo.mon_last, ''yyyy-MM'') as ano_mes,
        /*          periodo.mon_last,
                  dp.emissao, */
				  cast(''C'' as char(3)) as tipoconta,
                                  True as totalizar,
                   e.descricao,
                   cast(66 as SMALLINT) as ordem,   
        /*           d.valorvencto */
                   
                  - sum(d.valorvencto) as Total
            from duplicatas d
                 join documentospag dp
                 on d.documentopag = dp.numero
                 join eventos e
                 on coalesce(d.evento, dp.evento) = e.codigo,
                 
                                                                                  (
                                                                                    select min(cast(d as date)) as mon_first,
                                                                                           max(cast(d as date)) as mon_last
                                                                                    FROM   generate_series(date

                                                                                    '':Data_Inicial''

                                                                                    ,
                                                                                    date

                                                                                    '':Data_Final''

                                                                                    , interval ''1 day'') d
                                                                                    group by to_char(d, ''YYYY/MM'')
                                                                                    order by to_char(d, ''YYYY/MM'')
                                                                                    ) as periodo

            where dp.emissao <= periodo.mon_last
              and d.datapagto is null
              and e.incluirnadregerencial
              and trim(e.descricao) = ''Empréstimos Bancos''

        group by to_char(periodo.mon_last, ''yyyy-MM''), e.descricao
        order by to_char(periodo.mon_last, ''yyyy-MM'')        
  
  ),
    
	
  pg_eventos_Investimentos as 
  (
  
  select to_char(d.datavencto, ''yyyy-MM'') as ano_mes,    
         cast(''C'' as char(3)) as tipoconta,
         True as totalizar,
         d.descricao,
         cast(67 as SMALLINT) as ordem,      
         - sum(d.valorvencto) as Total
  from
  
    (         
      
    select 
          d.datavencto,    
          
          (select e2.descricao
           from eventos e2 
           where e2.codigo <> e.codigo
             and position(e2.classificacao in e.classificacao)=1
             and e2.tipo = ''S''
             order by e2.classificacao desc limit 1         
            ) as descricao,       
          
          d.valorvencto
                  
          
    from duplicatas d
         join documentospag dp
         on d.documentopag = dp.numero
         join eventos e
         on coalesce(d.evento, dp.evento) = e.codigo
         
    where d.datavencto between

    '':Data_Inicial''

    and

    '':Data_Final''

      and e.incluirnadregerencial
      and trim(e.descricao) <> ''Empréstimos Bancos''
  )  as d    
  where trim(d.descricao) = ''Investimentos''  
  group by to_char(d.datavencto, ''yyyy-MM''), d.descricao
  order by to_char(d.datavencto, ''yyyy-MM''), d.descricao
  ),
	
	
       
    Estoques as 
    (
    

      select ano_mes,
	       cast(''C'' as char(3)) as tipoconta,
               False as totalizar,
           CAST(''Estoque'' as varchar(100)) as descricao,
           cast(69 as smallint) as ordem,
           round(sum(Total), 2)      as Total
      from
         (


            select
            /*
               case
                  When ''f''
                     then codigogrupofilial
                     else cast(null as integer)
               end as codigogrupofilial
             , case
                  When ''f''
                     then nomegrupofilial
                     else cast(null as varchar)
               end as nomegrupofilial
             , case
                  When ''t''
                     then codigofilial
                     else cast(null as integer)
               end as codigofilial
             , case
                  When ''t''
                     then nomefilial
                     else cast(null as varchar)
               end as nomefilial
             , case
                  When ''f''
                     then localizacao
                     else cast(null as varchar)
               end as localizacao
             , case
                  When ''f''
                     then codigoclasse
                     else cast(null as varchar)
               end as codigoclasse
             , case
                  When ''f''
                     then classeproduto
                     else cast(null as varchar)
               end as classeproduto
             , case
                  When ''f''
                     then codigogrupo
                     else cast(null as varchar)
               end as codigogrupo
             , case
                  When ''f''
                     then grupoproduto
                     else cast(null as varchar)
               end as grupoproduto
             , case
                  When ''f''
                     then codigoproduto
                     else cast(null as bigint)
               end as codigoproduto
             , case
                  When ''f''
                     then codigoprodutovisual
                     else cast(null as varchar(30))
               end as codigoprodutovisual
             , case
                  When ''f''
                     then produto
                     else cast(null as varchar)
               end as produto
               
             , */ case
                  When ''f''
                     then financeiro
                     else
                        (
                           case
                              when coalesce(qtdultimaentrada,0)<>0
                                 then (qtdestoque*(custo_ultimaentrada/qtdultimaentrada))
                                 else cast(null as numeric)
                           end
                        )
               end as Total, ano_mes
      /*       , qtdestoque*/
            from
               (

                  SELECT
                     ep.*
                   , estoques_preco(ep.codigoitem,ep.codigofilial) as precovenda
                   , financeiro/qtdestoque                         as custo_medio
                   , case
                        when ''f''
                           then custoestoquefisico(ep.codigoitem,ep.codigofilial,

                           '':Data_Final''

                           )
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
                               , (ep.emestoque+ep.reservado+ep.transito+ep.demonstracao+ep.conserto+ep.danificada+ep.reservaprevia/*+ep.estoquefisico*/) AS qtdestoque
                               , f.nome                                                                                                              AS nomefilial
                               , gf.descricao                                                                                                        as nomegrupofilial
                               , gf.codigo                                                                                                           as codigogrupofilial
                              FROM
                                 (

                                    select
                                       ep.*
                                       /*
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
                                          ||'' ''
                                          ||coalesce(p.valorgrade1,'''')
                                          ||'' ''
                                          ||coalesce(p.valorgrade2,'''') as varchar) AS item
                                     , ma.descricao                                AS marca
                                     , p.referencia
                                     , p.codigovisual as codigoitemvisual
                                     , c.unidade
                                     , c.subconta
                                     */
                                    from
                                       (

                                          select
                                             ep.*
                                           , m2.valor
                                           , m2.quantidade as qtdUltimaEntrada
                                          from
                                             (

                                                select ano_mes, mon_last
                                                 , e.codigofilial
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

                                                      select ano_mes, mon_last
                                                       ,  m.numero
                                                       , e.filial  as codigofilial
                                                       , e.produto as codigoitem
                                                       , e.localizacao
                                                       , e.precocomicms
                                                      from
                                                         (

                                                            select ano_mes, mon_last
                                                             , m2.numero
                                                             , m1.produto
                                                             , m1.filial
                                                            from
                                                               (

                                                                  select ano_mes, mon_last
                                                                   , m1.data
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
                                                                           TO_char(periodo.mon_last, ''yyyy-MM'') as ano_mes, periodo.mon_last,
                                                                           max(m1.data) as data
                                                                         , m1.produto
                                                                         , m1.filial
                                                                        from
                                                                           movimentos m1,
                                                                           
                                                                          (
                                                                            select min(cast(d as date)) as mon_first,
                                                                                   max(cast(d as date)) as mon_last
                                                                            FROM   generate_series(date

                                                                            '':Data_Inicial''

                                                                            ,
                                                                            date

                                                                            '':Data_Final''

                                                                            , interval ''1 day'') d
                                                                            group by to_char(d, ''YYYY/MM'')
                                                                            order by to_char(d, ''YYYY/MM'')
                                                                            ) as periodo
                                                                          
                                                                        where
                                                                           m1.data <= periodo.mon_last 
                                                                           /* and m1.produto = 55 */
                                                                        group by
                                                                           TO_char(periodo.mon_last, ''yyyy-MM''), periodo.mon_last
                                                                         ,  m1.produto
                                                                         , m1.filial
                                                                        order by
                                                                          TO_char(periodo.mon_last, ''yyyy-MM'')
                                                                         ,  m1.produto
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
                                                   )
                                                   as e
                                                   join
                                                      movimentos m
                                                      on
                                                         e.numero         = m.numero
                                                         and m.financeiro<>0
                                                         
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
                                                         and m.data <=  mon_last                           
                                                         and substring(m.operacao from 12 for 1)=''+''
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
                                             /*
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
                                             */
                                       /*  muito lento na kilar - 02-01-2013 - banco 8.4  JOIN ( produtos p  JOIN (((caracteristicas c  JOIN grupos g  ON c.grupo = g.codigo)  JOIN classes cl  ON c.classe=cl.codigo)  JOIN marcas ma  ON c.marca=ma.codigo)  ON p.caracteristica=c.codigo)  ON p.codigo = ep.codigoitem */
                                    where
                                       TRUE
                                       /* ((not (c.inativo is not null)) or (c.inativo>''30/06/2024'')) Comentado em 13/09/2019 por LÚCIO WATERKEMPER */
                                       and c.tipoproduto in (''00'')
                                       
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
      /*                         , codigoitemvisual*/
                               , codigoitem
      /*                         , item*/

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
         group by ano_mes order by ano_mes
    ),
    
    
    Adiantamentos_de_Pagamentos as
    (
    
        select to_char(max(periodo.mon_last), ''yyyy-MM'')  as ano_mes,
		              cast(''C'' as char(3)) as tipoconta,
                      False as totalizar,        
                      cast(''Importação (PEDIDOS JÁ PAGOS POR ANTECIPAÇÃO)'' as varchar(100)) as descricao, 
                      cast(71 as SMALLINT) as ordem,
              - sum(saldo) as total
        from
        (
        select sel.*,
               Calcular_Saldo_Adiantamento(sel.numero,

               cast(

                 '':Data_Final''

                 as date)

               ) as Saldo
        from
        (       
        select sel.*,
               (select max(dp.numero)
                from documentospag dp
                where dp.fornecedor = sel.fornecedor 
                  and dp.tipofornecedor = sel.tipofornecedor
                  and dp.emissao = sel.emissao) as numero
               
                  
                  
        from
        (       

        select dp.fornecedor, dp.tipofornecedor, max(dp.emissao) as emissao
        from documentospag dp
             join tipospagamentos tp
             on dp.tipopagamento = tp.codigo
        where coalesce(dp.adiantamento,false) 
        and dp.emissao <=

          '':Data_Final''

        /*and dp.fornecedor = 695*/
        group by dp.fornecedor, dp.tipofornecedor, to_char(dp.emissao, ''YYYY/MM'')
        order by dp.fornecedor, dp.tipofornecedor, to_char(dp.emissao, ''YYYY/MM'')

        ) as sel
        ) as sel
        )  as sel,
                (
                  select min(cast(d as date)) as mon_first,
                         max(cast(d as date)) as mon_last
                  FROM   generate_series(date

                  '':Data_Inicial''

                  ,
                  date

                  '':Data_Final''

                  , interval ''1 day'') d
                  group by to_char(d, ''YYYY/MM'')
                  order by to_char(d, ''YYYY/MM'')
                  ) as periodo
          where sel.emissao <= periodo.mon_last

        group by to_char(periodo.mon_last, ''YYYY/MM'')
        order by to_char(periodo.mon_last, ''YYYY/MM'')
    
    
    ),


    Recebimentos_mes as
    (
    
        Select to_char(p.datapagto, ''yyyy-MM'') as ano_mes,
              cast(''DT'' as char(3)) as tipoconta,
              True as totalizar,
      	      cast(''RECEBIMENTOS MÊS'' as varchar(100)) as descricao, 
	          cast(75 as SMALLINT) as ordem,
        
              sum(p.valorpagto) as Total

        from ((contratos c join (filiais f
                                left join (filiaisgruposfiliais fgf
                                          join gruposfiliais gf
                                          on fgf.grupo=gf.codigo)
                                on f.codigo = fgf.filial)
                         on c.filialvenda = f.codigo)

                         join (parcelas p
                          left join (filiais f_p
                                left join (filiaisgruposfiliais fgf_p
                                          join gruposfiliais gf_p
                                          on fgf_p.grupo=gf_p.codigo)
                                on f_p.codigo = fgf_p.filial)
                          on  p.filialpagto = f_p.codigo)
                         on c.numero = p.contrato)

                         left join usuarios u on c.vendedor = u.codigo,
                         
                  (       
                  select min(cast(d as date)) as mon_first,
                         max(cast(d as date)) as mon_last
                  FROM   generate_series(date

                  '':Data_Inicial''

                  ,
                  date

                  '':Data_Final''

                  , interval ''1 day'') d
                  group by to_char(d, ''YYYY/MM'')
                  ) as intervalo


        Where c.numero = p.contrato and c.Situacao IN (''F'',''N'',''P'')
          AND NOT contratos_renegociado(c.numero)  and coalesce(p.tipopagto,'''') <>''E''
          and case when c.os then c.tipoequipamento in (1,2) else true end
          and (p.datapagto is not null)
          and coalesce(p.formapagamento,'''')<>''T'' and p.datapagto between intervalo.mon_first and intervalo.mon_last
        group by to_char(p.datapagto, ''yyyy-MM'')

    ),



    Pagamentos_mes as
    (

                  Select to_char(t.datapagto, ''yyyy-MM'') as ano_mes,
                            cast(''DT'' as char(3)) as tipoconta,
                            True as totalizar,
                            cast(''PAGAMENTOS MÊS'' as varchar(100)) as descricao, 
                            cast(77 as SMALLINT) as ordem,
                  
                       -  sum(coalesce(t.valorpagto,0)) as Total
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
                           t.documentopag = d.numero),
                           
                        (        
                          select min(cast(d as date)) as mon_first,
                                 max(cast(d as date)) as mon_last
                          FROM   generate_series(date

                          '':Data_Inicial''

                          ,
                          date

                          '':Data_Final''

                          , interval ''1 day'') d
                          group by to_char(d, ''YYYY/MM'')
                        )  as intervalo 

                  where
                     ''t''
                     and
                     (
                        t.datapagto is not null
                     )
                     and
                     (
                        t.datapagto between intervalo.mon_first and intervalo.mon_last
                     )
                     and
                     (
                        t.autorizado = true
                     )
        			 
                  group by to_char(t.datapagto, ''yyyy-MM'')    
    
    )

  select tipoconta, totalizar, descricao, sum(ordem) as ordem, ano_mes, sum(Total) as Total
  from

  (


        select tipoconta,
               totalizar,
               descricao, sum(ordem) as ordem,
               ano_mes,
               sum(Total) as Total
         from
        (


          (select * from Licitacoes_Ganhas_Venda)     				UNION ALL
          (select * from Custos)                      				UNION ALL
          (select * from Lucro_Bruto_Prejuizo)        				UNION ALL
          (select * from emissao)                     				UNION ALL
          (select * from Faturamento_de_Licitacoes)   				UNION ALL
          (select * from Faturamento_sem_Licitacoes)  				UNION ALL
          (select * from Total_Faturamento)           				UNION ALL
          (select * from Custo_Eqptos_Faturamento_com_Licitacoes) 	UNION ALL
          (select * from Custo_Eqptos_Faturamento_sem_Licitacoes) 	UNION ALL
          (select * from Total_Custo_Eqptos_Faturamento) 			UNION ALL
          (select * from Fretes_Sobre_Faturamento_com_Licitacoes) 	UNION ALL
          (select * from Fretes_Sobre_Faturamento_sem_Licitacoes) 	UNION ALL
          (select * from Espaco_linha_Frete) 						UNION ALL
          (select * from Comissao_Sobre_Licitacoes) 				UNION ALL
          (select * from Total_Comissao_Sobre_Licitacoes)  			UNION ALL
          (select * from Comissao_Sem_Licitacoes) 					UNION ALL
          (select * from Total_Comissao_Sem_Licitacoes) 			UNION ALL

          (select * from ICMS_sobre_Faturamento_de_Licitacoes)		UNION ALL
          (select * from IPI_sobre_Faturamento_de_Licitacoes)		UNION ALL
          (select * from PIS_sobre_Faturamento_de_Licitacoes)		UNION ALL
          (select * from COFINS_sobre_Faturamento_de_Licitacoes)	UNION ALL
          (select * from Total_Impostos_sobre_Faturamento_de_Licitacoes)	UNION ALL

          (select * from ICMS_sobre_Faturamento_sem_Licitacoes)		UNION ALL
          (select * from IPI_sobre_Faturamento_sem_Licitacoes)		UNION ALL
          (select * from PIS_sobre_Faturamento_sem_Licitacoes)		UNION ALL
          (select * from COFINS_sobre_Faturamento_sem_Licitacoes)	UNION ALL
          (select * from Total_Impostos_sobre_Faturamento_sem_Licitacoes)	UNION ALL
          (select * from pg_eventos_) 										UNION ALL
          (select * from Soma_despesas)                              UNION ALL
          (select * from Lucro_do_Exercicio)                         UNION ALL

          (select * from Linha_Caixa)                     				UNION ALL

          (select * from Recebimentos_em_Aberto)                     UNION ALL
          (select * from Pagamentos_em_Aberto)                       UNION ALL
          (select * from Linha_Bancos_e_Caixa)                       UNION ALL
          (select * from Saldos_Bancos_e_Caixa)                       UNION ALL
          (select * from Total_Saldos_Bancos_e_Caixa)                       UNION ALL
          (select * from pg_eventos_Emprestimos) 					UNION ALL
          (select * from pg_eventos_Investimentos) 					UNION ALL
          (select * from Estoques)                       UNION ALL
          (select * from Adiantamentos_de_pagamentos) UNION ALL


          (select  ano_mes,
                   cast(''RT'' as char(3)) as tipoconta,
                   false as totalizar,
                   cast(''TOTAL LÍQUIDO'' as varchar(100)) as descricao,
                   cast(74 as smallint) as ordem,
                   sum(total) as Total
            from
            (
              (select ano_mes, total from Recebimentos_em_Aberto)                     UNION ALL
              (select ano_mes, total from Pagamentos_em_Aberto)                       UNION ALL
              (select ano_mes, total from Total_Saldos_Bancos_e_Caixa)                       UNION ALL
              (select ano_mes, total from pg_eventos_Emprestimos) 					UNION ALL
              (select ano_mes, total from pg_eventos_Investimentos) 					UNION ALL
              (select ano_mes, total from Estoques)                       UNION ALL
              (select ano_mes, total from Adiantamentos_de_pagamentos)

            ) as sel
            group by ano_mes

          ) UNION ALL

          (select * from Recebimentos_mes) UNION ALL
          (select * from Pagamentos_mes)

        ) as sel
        group by tipoconta, totalizar, descricao, ano_mes, ordem
        order by ordem, descricao, ano_mes

        )

        union all

        (
        select tipoconta,
               totalizar,
               descricao, sum(ordem) as ordem,
               cast(''TOTAL'' as varchar(7)) as ano_mes,
               sum(Total) as Total
         from
        (


          (select * from Licitacoes_Ganhas_Venda)     				UNION ALL
          (select * from Custos)                      				UNION ALL
          (select * from Lucro_Bruto_Prejuizo)        				UNION ALL
          (select * from emissao)                     				UNION ALL
          (select * from Faturamento_de_Licitacoes)   				UNION ALL
          (select * from Faturamento_sem_Licitacoes)  				UNION ALL
          (select * from Total_Faturamento)           				UNION ALL
          (select * from Custo_Eqptos_Faturamento_com_Licitacoes) 	UNION ALL
          (select * from Custo_Eqptos_Faturamento_sem_Licitacoes) 	UNION ALL
          (select * from Total_Custo_Eqptos_Faturamento) 			UNION ALL
          (select * from Fretes_Sobre_Faturamento_com_Licitacoes) 	UNION ALL
          (select * from Fretes_Sobre_Faturamento_sem_Licitacoes) 	UNION ALL
          (select * from Espaco_linha_Frete) 						UNION ALL
          (select * from Comissao_Sobre_Licitacoes) 				UNION ALL
          (select * from Total_Comissao_Sobre_Licitacoes)  			UNION ALL
          (select * from Comissao_Sem_Licitacoes) 					UNION ALL
          (select * from Total_Comissao_Sem_Licitacoes) 			UNION ALL

          (select * from ICMS_sobre_Faturamento_de_Licitacoes)		UNION ALL
          (select * from IPI_sobre_Faturamento_de_Licitacoes)		UNION ALL
          (select * from PIS_sobre_Faturamento_de_Licitacoes)		UNION ALL
          (select * from COFINS_sobre_Faturamento_de_Licitacoes)	UNION ALL
          (select * from Total_Impostos_sobre_Faturamento_de_Licitacoes)	UNION ALL

          (select * from ICMS_sobre_Faturamento_sem_Licitacoes)		UNION ALL
          (select * from IPI_sobre_Faturamento_sem_Licitacoes)		UNION ALL
          (select * from PIS_sobre_Faturamento_sem_Licitacoes)		UNION ALL
          (select * from COFINS_sobre_Faturamento_sem_Licitacoes)	UNION ALL
          (select * from Total_Impostos_sobre_Faturamento_sem_Licitacoes)	UNION ALL
          (select * from pg_eventos_) 										UNION ALL
          (select * from Soma_despesas)                              UNION ALL
          (select * from Lucro_do_Exercicio)                         UNION ALL

          (select * from Linha_Caixa)                     				UNION ALL

          (select * from Recebimentos_em_Aberto)                     UNION ALL
          (select * from Pagamentos_em_Aberto)                       UNION ALL
          (select * from Linha_Bancos_e_Caixa)                       UNION ALL
          (select * from Saldos_Bancos_e_Caixa)                       UNION ALL
          (select * from Total_Saldos_Bancos_e_Caixa)                       UNION ALL
          (select * from pg_eventos_Emprestimos) 					UNION ALL
          (select * from pg_eventos_Investimentos) 					UNION ALL
          (select * from Estoques)                       UNION ALL
          (select * from Adiantamentos_de_pagamentos) UNION ALL


          (select  ano_mes,
                   cast(''RT'' as char(3)) as tipoconta,
                   false as totalizar,
                   cast(''TOTAL LÍQUIDO'' as varchar(100)) as descricao,
                   cast(74 as smallint) as ordem,
                   sum(total) as Total
            from
            (
              (select ano_mes, total from Recebimentos_em_Aberto)                     UNION ALL
              (select ano_mes, total from Pagamentos_em_Aberto)                       UNION ALL
              (select ano_mes, total from Total_Saldos_Bancos_e_Caixa)                       UNION ALL
              (select ano_mes, total from pg_eventos_Emprestimos) 					UNION ALL
              (select ano_mes, total from pg_eventos_Investimentos) 					UNION ALL
              (select ano_mes, total from Estoques)                       UNION ALL
              (select ano_mes, total from Adiantamentos_de_pagamentos)

            ) as sel
            group by ano_mes
          ) UNION ALL

          (select * from Recebimentos_mes) UNION ALL
          (select * from Pagamentos_mes)

         )
          
        ) as sel
        group by tipoconta, totalizar, descricao, ordem

        order by ordem, descricao, ano_mes

      ) as sel

      group by tipoconta, totalizar, descricao, ano_mes, ordem
      order by ordem, descricao, ano_mes


',

' select sel.* from
 (

  (
  select distinct to_char(cast(

        '':Data_Inicial''

           as date)  + s.a,''YYYY-MM'') as ano_mes from generate_series(1,cast(

            '':Data_Final''

               as date)-cast(

              '':Data_Inicial''

                as date)) as s(a) order by 1
  )

union all

  (
 select  cast(''TOTAL'' as varchar(7)) as ano_mes
  )

 ) as sel ',

'descricao',
 ', tipoconta, totalizar',

'ano_mes', 'total', 'curs'
                
)
as cur;

fetch ALL in curs
