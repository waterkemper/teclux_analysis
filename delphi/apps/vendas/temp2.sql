SELECT * FROM crosstab
(
'select cast(descricao||cast(produto as varchar)||cast(filial as varchar)||cast(cliente as varchar)||cast(tipocliente as varchar) as varchar(70)) as produtofilial,
          produto,
          filial,
          descricao,
          cliente,
          tipocliente,
          mes,
          cast(sum(quantidade) as numeric(9,3)) as quantidade
          from
 (

  /*VENDAS*/

  (
   select
      ct.cliente,
      ct.tipocliente,
      pc.produto,
      pc.filial,
      p.descricao,
      to_char(ct.faturamento, ''YYYY/MM'') as mes,
      cast(sum(pc.quantidade) as numeric(9,3)) as quantidade
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

   group by  pc.produto, pc.filial, p.descricao, ct.cliente, ct.tipocliente, mes
  )
  
  /* VENDAS FRENTE DE CAIXA */
  union all
  
  (
  
   select
      df.cliente,
      df.tipocliente,
      pdf.produto,
      pdf.filial,
      p.descricao,
      to_char(df.data, ''YYYY/MM'') as mes,
      cast(sum(pdf.quantidade) as numeric(9,3)) as quantidade
	  
		 
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

   group by  pdf.produto, pdf.filial, p.descricao, df.cliente, df.tipocliente, mes
     
  )
  
  union all

/*SERVICOS*/

  (
   select
       ct.cliente, ct.tipocliente,   
      sc.servico as produto,
      ct.filialvenda as filial,
      s.descricao,
      to_char(ct.faturamento, ''YYYY/MM'') as mes,
      cast(sum(sc.quantidade) as numeric(9,3)) as quantidade

   from (contratos ct join
         (servicoscontratos sc join servicos s on sc.servico = s.codigo)
         on ct.numero = sc.contrato)

   %DataFaturamentoVendasServicos
   /*ct.faturamento between(:DataInicial) and (:DataFinal)*/

   %FiltroServicos

   group by  sc.servico, ct.filialvenda, s.descricao, ct.cliente, ct.tipocliente,  mes
  )
  union all

/*DEVOLUÇÕES*/

  (
   (
    select ct.cliente, ct.tipocliente,   
      cd.produto,
      cd.filial,
      p.descricao,
      to_char(cd.devolucao, ''YYYY/MM'') as mes,
      - cast(sum(cd.quantidade) as numeric(9,3)) as quantidade

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

    group by cd.produto, cd.filial, p.descricao, ct.cliente, ct.tipocliente, mes

   )
   union all
   (
                select        ct.cliente,  ct.tipocliente,
                    pc.produto,
	       pc.filial,
               p.descricao,
               to_char(cancelados.datapagto, ''YYYY/MM'') as mes,
               cast(sum(pc.quantidade) as numeric(9,3)) as quantidade

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

        group by  pc.produto, pc.filial, p.descricao, ct.cliente, ct.tipocliente, mes
   )
  )
 ) as temp
 group by  produtofilial, produto, filial, descricao, cliente, tipocliente, mes
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
 ( produtofilial varchar(70),
   produto bigint,
   filial int,
   descricao varchar(50),
   cliente int,
   tipocliente char(1),
   %meses
)