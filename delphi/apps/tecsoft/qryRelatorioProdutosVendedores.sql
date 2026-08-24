;SELECT * FROM
(
select produtosvendedores.*,
       u.nome as nomevendedor,


            case when
            first_value(produto)

            OVER(

                PARTITION BY coalesce(contrato,cast(dadofiscal as varchar(20)))

                    ORDER BY coalesce(contrato,cast(dadofiscal as varchar(20))), produto desc

                ) = produto then case when quantidade>0 then 1 else -1 end else cast(null as integer) end as ticket_count

from
(


/* Produtos com notas/cupons emitidos */

  (
    select vendas.*,
           n.serie,
           n.numero as numeronota
    from
    (
     select vendas.*,
            cp.maquina,
            cp.intervensao,
            cp.numero as numerocupom
     from
     (
      select
             coalesce(pdf.vendedor,df.vendedor) as vendedor,
             ct.numero as contrato,
             ct.pedidocliente,
     	     ct.situacao,
             ct.faturamento,
             df.filialvenda,
     	     pdf.dadofiscal,
             df.data,
             pdf.quantidade,
             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, pdf.produto) as creditotroca,
             pdf.produto,
             p.codigovisual as produtovisual,
             pdf.filial,
             p.descricao,
             pdf.precovenda,
             pdf.precotabela,
             pdf.quantidade*pdf.precovenda as totalprecovenda,
             pdf.quantidade*pdf.precotabela as totalprecotabela,

             cast(null as date) as devolucao,

             -((coalesce(pdf.desconto,0)+
                coalesce(pdf.valordescontoitem,0)) -
               coalesce(pdf.acrescimo,0)
               ) as desconto,

             cast('V'  as char) as registro,

             (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as ncm,

             (select cp.produto_cliente
              from clientesprodutos cp
              where cp.cliente = ct.cliente
                and cp.tipocliente = ct.tipocliente
                and cp.produto = pdf.produto) as produto_cliente

      from (contratos ct
            join (dadosfiscais df
                  join (produtosdadosfiscais pdf
                        join ((produtos p left join promocoes pro on p.promocao = pro.codigo)
                              join (((caracteristicas c
                                      join grupos g
                                      on c.grupo = g.codigo)

                                      join classes cl
                                      on c.classe = cl.codigo)

                                      join marcas m
                                      on c.marca = m.codigo)

                              on c.codigo = p.caracteristica)
                        on pdf.produto = p.codigo)
                   on pdf.dadofiscal = df.numero)
            on df.contrato = ct.numero)

      where ct.faturamento between (:datainicial) and (:datafinal)
        and ct.numero = df.contrato
        and not coalesce(pdf.brinde,false)
        and (coalesce(ct.valorvista,0)<>0)
        and not coalesce(df.notavinculada,false)
        and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
        and ct.origem IS NULL
        and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

            /*   ct.situacao in ('N','P') and - Rel vendas não possui esta restrição */
            /*   df.situacao='N' and */

         and case when ct.situacao = 'N' then
                  ct.situacao = df.situacao
	   else (case when ct.situacao='C' then
	         (case when coalesce((select sum(p.valorpagto) from parcelas p where p.contrato = ct.numero and p.tipopagto='E'),0) = ct.valorprazo then
			    df.numero = (select max(df2.numero) from dadosfiscais df2 where df2.contrato = ct.numero)
		 	 else df.situacao='N' end) else true end) end

      %DadosFiscais

      %NCMIsentoPISCOFINS

     ) as vendas left join cupons cp on vendas.dadofiscal = cp.dadofiscal
    ) as vendas left join notas n on vendas.dadofiscal = n.dadofiscal


 )
 
 union all

 /* Serviços com notas/cupons emitidos */
  
  (
    select vendas.*,
           n.serie,
           n.numero as numeronota
    from
    (
     select vendas.*,
            cp.maquina,
            cp.intervensao,
            cp.numero as numerocupom
     from
     (
      select coalesce(sc.vendedor,df.vendedor) as vendedor,
             ct.numero as contrato,
             ct.pedidocliente,
             ct.situacao,
             ct.faturamento,
             df.filialvenda,
             df.numero as dadofiscal,
             df.data,
             sdf.quantidade,
             cast(null as numeric(11,2)) as creditotroca,
             cast(sdf.servico as bigint) as produto,
             cast(sdf.servico as varchar(30)) as produtovisual,
             df.filialvenda as filial,
             cast(s.descricao as varchar(162)) as descricao,
             sdf.valorservico as precovenda,
             s.valor as precotabela,
             sdf.quantidade*sdf.valorservico as totalprecovenda,
             sdf.quantidade*s.valor as totalprecotabela,
             cast(null as date) as devolucao,
             0.00 as desconto,
             cast('V' as char) as registro,
             cast(null as varchar(8)) as ncm,
             cast(null as varchar(30)) as produto_cliente

             
      from (contratos ct
            join (dadosfiscais df
                  join (Servicosdadosfiscais sdf
                        join servicos s 
                        on sdf.produto = s.codigo)
                  on sdf.dadofiscal = df.numero)
            on df.contrato = ct.numero)
            
            join servicoscontratos sc
            on ct.numero = sc.contrato
            and sc.servico = sdf.servico

      where ct.faturamento between (:Datainicial) and (:DataFinal) and
            ct.numero = df.contrato  and

/*          ct.situacao in ('N','P') and - Rel vendas não possui esta restrição */

            df.situacao='N' and not coalesce(df.notavinculada,false)
            and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

            %DadosFiscais_Servicos

            %NCMIsentoPISCOFINS_Servicos

     ) as vendas left join cupons cp on vendas.dadofiscal = cp.dadofiscal
    ) as vendas left join notas n on vendas.dadofiscal = n.dadofiscal
   
 )
 
 /*  Produtos contratos em situação Parcial ou Faturado */
 
  union all
  
 (
  select produtos.vendedor,
         produtos.contrato,
         produtos.pedidocliente,
         produtos.situacao,
         produtos.faturamento,
         produtos.filialvenda,
         cast(null as integer) as dadofiscal,
         cast(null as date) as data,
         produtos.quantidade - produtos.quantidade_entregue as quantidade,
         ((produtos.creditotroca / produtos.quantidade) * (produtos.quantidade - produtos.quantidade_entregue)) as creditotroca,
         produtos.produto,
         produtos.produtovisual,
         produtos.filial,
         produtos.descricao,
         produtos.precovenda,
         produtos.precotabela,
         ((produtos.quantidade - produtos.quantidade_entregue) * produtos.precovenda) as totalprecovenda,
         ((produtos.quantidade - produtos.quantidade_entregue) * produtos.precotabela) as totalprecotabela,

         cast(null as date) as devolucao,
         produtos.desconto,
         produtos.registro,

         produtos.ncm,

         produtos.produto_cliente,
       cast(null as integer) as maquina,
       cast(null as integer) as intervensao,
       cast(null as integer) as numerocupom,
       cast(null as varchar(3)) as serie,
       cast(null as integer) as numeronota
  from
  (
     select pc.vendedor,
            ct.numero as contrato,
            ct.pedidocliente,
  	  ct.situacao,
            ct.faturamento,
            ct.filialvenda,
            pc.quantidade,
            - ratearcreditotroca_contratos(pc.contrato, pc.produto) as creditotroca,
            case when ct.situacao = 'P' then
              produtoscontratos_qtdeentregue(coalesce(ct.primogenito, ct.numero),pc.produto,pc.filial)
            else cast(0 as Numeric(9,3)) end as quantidade_entregue,
            pc.produto,
            p.codigovisual as produtovisual,
            pc.filial,
            cast(btrim(p.descricao ||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'')) as varchar(162)) as descricao,
            pc.precovenda,
            pc.precotabela,

/*            - (rateardesconto(ct.numero, cast(pc.produto as bigint)) + coalesce(pc.valordescontoitem,0)) as desconto, */

            - ((coalesce(pc.desconto) +
                coalesce(pc.valordescontoitem,0)) -
                coalesce(pc.acrescimo,0)) as desconto,

    	    cast('V' as char) as registro,

            (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as ncm,

             (select cp.produto_cliente
              from clientesprodutos cp
              where cp.cliente = ct.cliente
                and cp.tipocliente = ct.tipocliente
                and cp.produto = pc.produto) as produto_cliente

     from (contratos ct
           join (produtoscontratos pc
                 join ((produtos p left join promocoes pro on p.promocao = pro.codigo)
                       join (((caracteristicas c
                                      join grupos g
                                      on c.grupo = g.codigo)

                                      join classes cl
                                      on c.classe = cl.codigo)

                                      join marcas m
                                      on c.marca = m.codigo)

                       on c.codigo = p.caracteristica)
                 on p.codigo = pc.produto)
           on pc.contrato = ct.numero)

     where ct.faturamento between (:datainicial) and (:datafinal) and
           ct.situacao in ('P','F')
           and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

     %Contratos

     %NCMIsentoPISCOFINS

     %ProdutosComNFEmitida_Faturados


    ) as produtos
    where (quantidade-quantidade_entregue)<>0

 )


 union all


   /* Serviços contratos em situação Parcial não existe ou Faturado */



 (
 
  select produtos.vendedor,
         produtos.contrato,
         produtos.pedidocliente,
         produtos.situacao,
         produtos.faturamento,
         produtos.filialvenda,
         cast(null as integer) as dadofiscal,
         cast(null as date) as data,
         produtos.quantidade,
         cast(null as numeric(11,2)) as creditotroca,
         cast(produtos.servico as bigint) as produto,
         cast(produtos.servico as varchar(30)) as produtovisual,
         produtos.filial,
         produtos.descricao,                  
         produtos.precovenda,
         produtos.precotabela,
         produtos.totalprecovenda,
         produtos.totalprecotabela,
         cast(null as date) as devolucao,
         produtos.desconto,
         produtos.registro,
         produtos.ncm,
         cast(null as varchar(30)) as produto_cliente,
         cast(null as integer) as maquina,
         cast(null as integer) as intervensao,
         cast(null as integer) as numerocupom,
         cast(null as varchar(3)) as serie,
         cast(null as integer) as numeronota
  from
  (
     select coalesce(sc.vendedor,ct.vendedor) as vendedor,
            ct.numero as contrato,
            ct.pedidocliente,
            ct.situacao,
            ct.faturamento,
            ct.filialvenda,
            sc.quantidade,
            sc.servico,
            ct.filialvenda as filial,
            s.descricao,
            
            sc.valorservico as precovenda,
            s.valor as precotabela,
            sc.quantidade*sc.valorservico as totalprecovenda,
            sc.quantidade*s.valor as totalprecotabela,
            
            0.00 as desconto,
  	        cast('V' as char) as registro,
            
            cast(null as varchar(8)) as ncm


     from (contratos ct
           join (servicoscontratos sc
                 join servicos s
                 on s.codigo = sc.servico)
           on sc.contrato = ct.numero)

     where ct.faturamento between (:DataInicial) and (:DataFinal) and
           ct.situacao in (/*'P',*/'F')
           and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

          %Contratos_Servicos

          %NCMIsentoPISCOFINS_Servicos

          %ProdutosComNFEmitida_Faturados

  ) as produtos
 )
 
 

 union all
 
 /* produtos com vendas sem contrato */
 
   (
    select vendas.*,
           n.serie,
           n.numero as numeronota
    from
    (
     select vendas.*,
            cp.maquina,
            cp.intervensao,
            cp.numero as numerocupom
     from
     (
      select
             coalesce(pdf.vendedor,df.vendedor) as vendedor,
             df.contrato,
             cast(null as varchar(35)) as pedidocliente,
			 cast(null as char(1)) as situacao,
             df.data as faturamento,
             df.filialvenda,
     	     pdf.dadofiscal,
             df.data,
             pdf.quantidade,
             - ratearcreditotroca_dadosfiscais(pdf.dadofiscal, pdf.produto) as creditotroca,
             pdf.produto,
             p.codigovisual as produtovisual,
             pdf.filial,
             cast(btrim(p.descricao ||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'')) as varchar(162)) as descricao,
             pdf.precovenda,
             pdf.precotabela,
             pdf.quantidade*pdf.precovenda as totalprecovenda,
             pdf.quantidade*pdf.precotabela as totalprecotabela,

             cast(null as date) as devolucao,

             -((coalesce(pdf.desconto,0)+
                coalesce(pdf.valordescontoitem,0)) -
               coalesce(pdf.acrescimo,0)
               ) as desconto,


             cast('V'  as char) as registro,

             (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as ncm,

             (select cp.produto_cliente
              from clientesprodutos cp
              where cp.cliente = df.cliente
                and cp.tipocliente = df.tipocliente
                and cp.produto = pdf.produto) as produto_cliente

      from (dadosfiscais df
	        join (produtosdadosfiscais pdf
			      join ((produtos p left join promocoes pro on p.promocao = pro.codigo)
				    join (((caracteristicas c
                                      join grupos g
                                      on c.grupo = g.codigo)

                                      join classes cl
                                      on c.classe = cl.codigo)

                                      join marcas m
                                      on c.marca = m.codigo)

						on c.codigo = p.caracteristica)
                  on pdf.produto = p.codigo)
            on pdf.dadofiscal = df.numero)

      where df.data between :Datainicial and :DataFinal
        and df.contrato is null
        and df.situacao='N'
	    and not coalesce(df.notavinculada,false)
      and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))


      %DadosFiscais_FrentedeCaixa

      %NCMIsentoPISCOFINS
	  
     ) as vendas left join cupons cp on vendas.dadofiscal = cp.dadofiscal
    ) as vendas left join notas n on vendas.dadofiscal = n.dadofiscal
 )


 union all
 

 
 (
  select devolucoes.*,
       cast(null as integer) as maquina,
       cast(null as integer) as intervensao,
       cast(null as integer) as numerocupom,
       cast(null as varchar(3)) as serie,
       cast(null as integer) as numeronota
  from
  (
  
  /* produtos com devolução em contratosdevolvidos */
  
   (

   select (select pc.vendedor
           from produtoscontratos pc
           where pc.contrato = ct.numero
             and pc.produto = cd.produto
             and pc.filial = cd.filial limit 1) as vendedor,

          ct.numero as contrato,
          ct.pedidocliente,
          cd.situacao,
          ct.faturamento,
          ct.filialvenda,
	      cast(null as integer) as dadofiscal,
	      cast(null as date) as data,
          -cd.quantidade as quantidade,
          cd.creditotroca,
          cd.produto,
          p.codigovisual as produtovisual,
          cd.filial,
          cast(btrim(p.descricao ||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'')) as varchar(162)) as descricao,
          - ((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valordescontoitem)/cd.quantidade) as precovenda,

          cast(null as numeric(15,2)) as precotabela,

          /* -cd.valorprazo as totalprecovenda, */

          -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valordescontoitem) as totalprecovenda,

          cast(null as numeric(15,2)) as totalprecotabela,
          cd.devolucao,

          ((coalesce(cd.desconto,0)+
              coalesce(cd.valordescontoitem,0)) -
             (cd.valorvista - cd.valorprazo)) as desconto,

          cast('D' as char) as registro,

          (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as ncm,

             (select cp.produto_cliente
              from clientesprodutos cp
              where cp.cliente = ct.cliente
                and cp.tipocliente = ct.tipocliente
                and cp.produto = cd.produto) as produto_cliente

   from (contratos ct
         join (contratosdevolvidos cd
               join ((produtos p left join promocoes pro on p.promocao = pro.codigo)
                     join (((caracteristicas c
                                      join grupos g
                                      on c.grupo = g.codigo)

                                      join classes cl
                                      on c.classe = cl.codigo)

                                      join marcas m
                                      on c.marca = m.codigo)
                     on c.codigo = p.caracteristica)
               on p.codigo = cd.produto)
         on ct.numero = cd.contrato)

   where :IncluirDevolucoes
     and ct.situacao in ('N','P','F','C') and
             cd.devolucao between (:DataInicial) and (:DataFinal)
             and cd.tipo = 'D'
             and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

             %Devolucoes

             %NCMIsentoPISCOFINS

             %ProdutosComNFEmitida_Devolvido

    )

    union all

  /* Produtos contratos cancelados */

    (


        SELECT produtos.*
        from
        (
        select produtos.* 
         from
        (
         select coalesce(pc.vendedor, ct.vendedor) as vendedor,
		        ct.numero as contrato,
                ct.pedidocliente,
                ct.situacao,
                ct.faturamento,
                ct.filialvenda,
	            cast(null as integer) as dadofiscal,
	            cast(null as date) as data,
                -pc.quantidade as quantidade,
				ratearcreditotroca_contratos(pc.contrato, pc.produto) as creditotroca,
                pc.produto,
                p.codigovisual as produtovisual,
                pc.filial,
                cast(btrim(p.descricao ||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'')) as varchar(162)) as descricao,
                - pc.precovenda,
                cast(null as numeric(15,2)) as precotabela,

                - (pc.quantidade*pc.precovenda) as totalprecovenda,
				
                cast(null as numeric(15,2)) as totalprecotabela,
                cancelados.datapagto as devolucao,

              ((coalesce(pc.desconto,0)+
              coalesce(pc.valordescontoitem,0)) -
                pc.acrescimo) as desconto,

              cast('D' as char) as registro,

             (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as ncm,

             (select cp.produto_cliente
              from clientesprodutos cp
              where cp.cliente = ct.cliente
                and cp.tipocliente = ct.tipocliente
                and cp.produto = pc.produto) as produto_cliente
		 

                from

        (
        select distinct p.*
        from
        (select p.contrato, p.datapagto
         from parcelas p
         where p.datapagto between :datainicial and :datafinal
          and p.tipopagto='E') as p join contratos ct on p.contrato = ct.numero
        where ct.situacao='C'
          AND (coalesce(ct.valorvista,0)<>0)
          and ct.origem is NULL
          and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end
          and not exists (select cd.contrato
                          from contratosdevolvidos cd
                           where cd.contrato = ct.numero
                             and cd.tipo='D')
        ) as cancelados, (contratos ct join
                                   (produtoscontratos pc
                                        join (produtos p
                                                join ((caracteristicas c join classes cl	on c.classe = cl.codigo)
                                                                         join grupos g on g.codigo=c.grupo)
                                                on p.caracteristica = c.codigo)
                                        on pc.produto=p.codigo)
                                on pc.contrato = ct.numero)
         where cancelados.contrato = ct.numero
		 
     %Contratos

     %NCMIsentoPISCOFINS

     %ProdutosComNFEmitida_Faturados
		 


        order by pc.contrato, pc.produto, pc.filial
        ) as produtos /* left join (SELECT sc.contrato,
                                        coalesce(SUM(sc.quantidade*sc.valorservico),0) as totalservico
                                 FROM contratos ct, servicoscontratos sc
                                 WHERE sc.contrato = ct.numero
                                   AND ct.faturamento BETWEEN(:DataInicial) and (:DataFinal)
                                   AND (coalesce(ct.valorvista,0)<>0)
                                   and ct.origem IS NULL
                                   and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

                                 group by sc.contrato) as sc on sc.contrato = produtos.vcontrato */
        ) as produtos /*, movimentos WHERE numero=(SELECT max(numero)
                                                FROM movimentos
                                                WHERE produto=vProduto
                                                  AND   filial=vFilial
                                                  AND   cast(data as date)=vfaturamento)*/













    )
    
    union all
    

 /* serviços com devolução em contratosdevolvidos */
 
     (
      select devolucoes.*
      from
      (
       select 
       
             (select sc.vendedor
              from servicoscontratos sc
              where sc.contrato = ct.numero
                and sc.servico = cd.servico limit 1) as vendedor,
              
              ct.numero as contrato,
              ct.pedidocliente,
              cd.situacao,
              ct.faturamento,
              ct.filialvenda,
              cast(null as integer) as dadofiscal,
              cast(null as date) as data,
              -cd.quantidade as quantidade,
              cast(null as numeric(12,2)) as creditotroca,
              cast(cd.servico as bigint) as produto,
              cast(cd.servico as varchar(30)) as produtovisual,
              cd.filial,
              s.descricao,
              -((cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valordescontoitem)/cd.quantidade) as precovenda,
              cast(null as numeric(15,2)) as precotabela,
              -(cd.valorvista-cd.frete-cd.seguro+cd.desconto+cd.valordescontoitem) as totalprecovenda,
              cast(null as numeric(15,2)) as totalprecotabela,
              cd.devolucao,
              0.00 as desconto,
              cast('D' as char) as registro,
              cast(null as varchar(8)) as ncm,
              cast(null as varchar(30)) as produto_cliente

       from (contratos ct
             join (contratosdevolvidos cd
                   join servicos s
                   on s.codigo = cd.servico)
             on ct.numero = cd.contrato)

       where :IncluirDevolucoes
         and ct.situacao in ('N','P','F','C') 
         and cd.devolucao between (:DataInicial) and (:DataFinal)
         and cd.tipo = 'D'
         and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

                 %Devolucoes_Servicos

                 %NCMIsentoPISCOFINS_Servicos

                 %ProdutosComNFEmitida_Devolvido

       ) as devolucoes
      )
    
    
    

    union all
    
    /*  Produtos com devolução em notas de entrada em contrato */
    
    (

        select coalesce(pnp.vendedor,np.vendedor) as vendedor,
          np.contrato,
          cast(null as varchar(35)) as pedidocliente,
          np.situacao,
          np.data as faturamento,
          np.filial as filialvenda,
	      cast(null as integer) as dadofiscal,
	      cast(null as date) as data,
          -pnp.quantidade as quantidade,
          cast(null as numeric(12,2)) as creditotroca,
          pnp.produto,
          p.codigovisual as produtovisual,
          np.filial,
          cast(btrim(p.descricao ||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'')) as varchar(162)) as descricao,
          -pnp.precounitario as precovenda,
          cast(null as numeric(15,2)) as precotabela,
          -(pnp.precounitario * pnp.quantidade) as totalprecovenda,
          cast(null as numeric(15,2)) as totalprecotabela,
          np.data as devolucao,

          (coalesce(pnp.valordescontoitem,0) +
           coalesce(pnp.desconto,0)) -
           coalesce(pnp.acrescimo,0) as desconto,

          cast('D' as char) as registro,
          (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as ncm,
          
          (select cp.produto_cliente
           from clientesprodutos cp
           where cp.cliente = np.fornecedor
             and cp.tipocliente = np.tipofornecedor
             and cp.produto = pnp.produto) as produto_cliente

     from (notaspag np

           join (produtosnotaspag pnp
		             join ((produtos p left join promocoes pro on p.promocao = pro.codigo)
			                 join (((caracteristicas c
                                      join grupos g
                                      on c.grupo = g.codigo)

                                      join classes cl
                                      on c.classe = cl.codigo)

                                      join marcas m
                                      on c.marca = m.codigo)
              				 on c.codigo = p.caracteristica)
                       on pnp.produto = p.codigo)
                 on pnp.codigonota = np.codigo)


     Where :IncluirDevolucoes
       and (np.data between (:DataInicial) and (:DataFinal) and situacao='N')
       and np.contrato is null
       and ehnotafiscalentradadevolucao(np.codigofiscal)
       and :IncluirDevolucoesSemContrato
       
             %Devolucoes_np

             %NCMIsentoPISCOFINS
    )
   ) as devolucoes
  )
  

) as produtosvendedores join usuarios u on produtosvendedores.vendedor = u.codigo

) AS rpv

ORDER BY UPPER(TO_ASCII(nomevendedor,'LATIN1')),
         Vendedor,
         
         %Ordenacao