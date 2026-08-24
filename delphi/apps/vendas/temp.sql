SELECT * FROM crosstab
(
'select  cast(nome||cast(cliente as varchar)||tipocliente as varchar(50)) as clientetipocliente,
         cliente,tipocliente,nome,mes, cast(sum(ValorTotal) as numeric(12,2)) as ValorTotal from
 (

  /*VENDAS*/

  (
   select cliente, tipocliente, nome, mes,
          cast(sum(ValorBrutodoProduto-ValorDescontodoProduto+ValorAcrescProduto) as numeric(12,2)) as ValorTotal
   from
   (
		(
		  select ct.cliente, ct.tipocliente, ct.nome,
		  to_char(ct.faturamento, ''YYYY/MM'') as mes,

		  ((pc.quantidade*pc.precovenda) +
		  (((coalesce(ct.frete,0)+coalesce(ct.seguro,0))*(pc.quantidade*pc.precovenda))  /
		   (COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coalesce(ct.frete,0)-coalesce(ct.seguro,0)) -
				   coalesce((select  sum(sc.quantidade*coalesce(sc.valorservico,0))
					from servicoscontratos sc
					where sc.contrato = ct.numero),0)),0),1))
		  )) as ValorBrutodoProduto,

		  ((coalesce(ct.desconto,0)*(pc.quantidade*pc.precovenda))  /
		   (COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coalesce(ct.frete,0)-coalesce(ct.seguro,0)) -
				   coalesce((select  sum(sc.quantidade*coalesce(sc.valorservico,0))
					from servicoscontratos sc
					where sc.contrato = ct.numero),0)),0),1))
		  ) as ValorDescontodoProduto,

		  (((ValorPrazo-ValorVista)*(pc.quantidade*pc.precovenda))  /
		   (COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coalesce(ct.frete,0)-coalesce(ct.seguro,0)) -
				   coalesce((select  sum(sc.quantidade*coalesce(sc.valorservico,0))
					from servicoscontratos sc
					where sc.contrato = ct.numero),0)),0),1))
		  ) as ValorAcrescProduto

		  from (contratos ct join
			 (produtoscontratos pc join
			  (produtos p join
		   (((caracteristicas c join classes cl on c.classe=cl.codigo)
							   join grupos g on c.grupo=g.codigo)
					   join marcas m on c.marca=m.codigo)
			   on p.caracteristica=c.codigo)
			  on pc.produto=p.codigo)
			 on ct.numero = pc.contrato)

		  %DataFaturamentoVendasProdutos
		  /*ct.faturamento between(:DataInicial) and (:DataFinal)*/

		  and (coalesce(ct.valorvista,0)<>0)
		  and ct.origem is null 

		  %FiltroVendas
		  order by ct.cliente, ct.tipocliente, UPPER(TO_ASCII(ct.nome,''LATIN1'')), mes
		)
		
		union all
		
		(
		
		  select df.cliente, df.tipocliente, df.nome as nomecliente,
		         to_char(df.data, ''YYYY/MM'') as mes,
				
				((pdf.quantidade*pdf.precovenda) + 
				  coalesce(pdf.acrescimo,0) + 
				  coalesce(pdf.frete,0) + 
				  coalesce(pdf.seguro,0) - 
				  coalesce(pdf.desconto,0)) as ValorBrutodoProduto,
				 
				  coalesce(pdf.desconto,0) as ValorDescontodoProduto,
				  
				  coalesce(pdf.acrescimo,0) as ValorAcrescProduto
		  from (dadosfiscais df
				join (produtosdadosfiscais pdf
					  join (produtos p
							join (((caracteristicas c
								    join classes cl on c.classe=cl.codigo)
								    join grupos g on c.grupo=g.codigo)
								    join marcas m on c.marca=m.codigo)
									
							on c.codigo = p.caracteristica)
					  on pdf.produto = p.codigo)
				on pdf.dadofiscal = df.numero)

		  %DataFaturamentoVendasProdutosFrentedeCaixa
		  /* df.data between(:DataInicial) and (:DataFinal) */
		  
		  %FiltroVendasFrentedeCaixa
		  
		  %FiltroVendasFrentedeCaixa
		  
		  order by df.cliente, df.tipocliente, UPPER(TO_ASCII(df.nome,''LATIN1'')), mes
		  
		)
   ) as vendas
   group by  nome, cliente, tipocliente,  mes
  )
  union all

/*SERVICOS*/

  (
   select ct.cliente, ct.tipocliente, ct.nome,
      to_char(ct.faturamento, ''YYYY/MM'') as mes,
      cast(sum(coalesce(sc.quantidade,0)*coalesce(sc.valorservico,0)) as numeric(12,2)) as valorTotal


   from (contratos ct join
         (servicoscontratos sc join servicos s on sc.servico = s.codigo)
         on ct.numero = sc.contrato)

   %DataFaturamentoVendasServicos
   /*ct.faturamento between(:DataInicial) and (:DataFinal)*/

   %FiltroServicos

   group by  ct.nome, ct.cliente, ct.tipocliente,  mes
  )
  union all

/*DEVOLUÇÕES*/

  (
   (
    select ct.cliente, ct.tipocliente, ct.nome,
      to_char(cd.devolucao, ''YYYY/MM'') as mes,
      - cast(sum((cd.valorvista + cd.desconto) - cd.desconto + (cd.ValorPrazo-cd.ValorVista)) as numeric(12,2)) as ValorTotal

    from (((contratosdevolvidos cd join contratos ct on cd.contrato=ct.numero)
                                  join produtoscontratos pc on cd.contrato = pc.contrato and cd.produto=pc.produto and cd.filial = pc.filial)
	 	                  join (produtos p join (((caracteristicas c join classes cl on c.classe=cl.codigo)
 				  	                                     join grupos g on c.grupo=g.codigo)
			                                                     join marcas m on c.marca=m.codigo)
                                                                             on p.caracteristica=c.codigo)
                                                  on cd.produto=p.codigo)
      %DataFaturamentoVendasDevolucoes
      /*cd.devolucao between(:DataInicial) and (:DataFinal)*/

      and cd.tipo = ''D''

      %FiltroDevolucoes

    group by ct.nome, ct.cliente, ct.tipocliente, mes

   )
   union all
   (
     select cliente, tipocliente, nome, mes,
         - cast(sum(ValorBrutodoProduto-ValorDescontodoProduto+ValorAcrescProduto) as numeric(12,2)) as ValorTotal
     from
     (
	select ct.nome, ct.cliente, ct.tipocliente,
               to_char(cancelados.datapagto, ''YYYY/MM'') as mes,

		((pc.quantidade*pc.precovenda) +
		(((coalesce(ct.frete,0)+coalesce(ct.seguro,0))*(pc.quantidade*pc.precovenda))  /
		(COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coalesce(ct.frete,0)-coalesce(ct.seguro,0)) -
                                 coalesce((select  sum(sc.quantidade*coalesce(sc.valorservico,0))
			from servicoscontratos sc
			where sc.contrato = ct.numero),0)),0),1))
		)) as ValorBrutodoProduto,

		((coalesce(ct.desconto,0)*(pc.quantidade*pc.precovenda))  /
		(COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coalesce(ct.frete,0)-coalesce(ct.seguro,0)) -
		                 coalesce((select  sum(sc.quantidade*coalesce(sc.valorservico,0))
			from servicoscontratos sc
			where sc.contrato = ct.numero),0)),0),1))
		) as ValorDescontodoProduto,

		(((ValorPrazo-ValorVista)*(pc.quantidade*pc.precovenda))  /
		(COALESCE(NULLIF(((ct.valorvista+coalesce(ct.desconto,0)-coalesce(ct.frete,0)-coalesce(ct.seguro,0)) -
		                 coalesce((select  sum(sc.quantidade*coalesce(sc.valorservico,0))
			from servicoscontratos sc
			where sc.contrato = ct.numero),0)),0),1))
		) as ValorAcrescProduto

	from (select distinct ct.numero, p.datapagto
		from contratos ct, parcelas p
		where ct.numero=p.contrato and
		ct.situacao=''C'' and
		not exists (select p2.numero
				from parcelas p2
				where p2.contrato = ct.numero and
					p2.tipopagto<>''E'')

                                  %DataPagamentoCancelamento
		/*p.datapagto  between(:DataInicial) and (:DataFinal)*/

                                       and not exists (select cd.contrato
                                                           from contratosdevolvidos cd
                                                           where cd.contrato = ct.numero and cd.tipo=''D'')
		) as cancelados, (contratos ct join
		                  (produtoscontratos pc join
				   (produtos p join (((caracteristicas c join classes cl on c.classe = cl.codigo)
 			  	                                         join grupos g on c.grupo=g.codigo)
			                                                 join marcas m on c.marca=m.codigo)
					                               on p.caracteristica = c.codigo)
				               on pc.produto=p.codigo)
			          on pc.contrato = ct.numero)
	where cancelados.numero = ct.numero

              %FiltroCancelamentos

        order by UPPER(TO_ASCII(ct.nome,''LATIN1'')), ct.cliente, ct.tipocliente, mes
     ) as cancelamentos
     group by  nome, cliente, tipocliente, mes
   )
  )
 ) as temp
 group by  clientetipocliente, nome, cliente, tipocliente, mes
 order by 1',

'select distinct to_char(cast(''
        %datainicial_1
        '' as date)  + s.a,''YYYY/MM'') as mes from generate_series(1,cast(''
            %datafinal
            '' as date)-cast(''
              %datainicial_2
             '' as date)) as s(a) order by 1'
)
AS
 (
   clientetipocliente varchar(50),
   cliente int,
   tipocliente char(1),
   nome varchar(50),
   %meses
)