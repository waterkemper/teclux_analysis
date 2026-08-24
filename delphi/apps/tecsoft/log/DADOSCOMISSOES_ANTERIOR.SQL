CREATE OR REPLACE FUNCTION public.dadoscomissoes (
  pdescricaoinformacao varchar,
  pdatainicial date,
  pdatafinal date,
  plistavendedores varchar,
  plistaagentes varchar,
  plistaconceitos varchar,
  plistafiliais varchar,
  plistagruposfiliais varchar,
  pincluirdevolucoessemcontrato boolean
)
RETURNS SETOF public.tp_dadoscomissoes AS
$body$
DECLARE
/* informar : 'VENDAS', 'ABATIMENTO_CREDITOTROCA_VENDAS', 'DEVOLUCOES_DO_MES' */


/* 'ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS', 'ABATIMENTO_CREDITO_TROCA_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS' */


/* 'ADICIONAL_PRODUTOS_E_SERVICOS_ESTORNOS' */


  


  refvendas refcursor;


  tabela record;


  dados tp_dadoscomissoes;

BEGIN

   /************************************************************************************************************************************************/
   /************************************************************************************************************************************************/
   if pDescricaoInformacao = 'VENDAS' then

    OPEN refvendas scroll FOR
    select vendedor,
	       u.tipocomissao as tipobase,
		   u.usuario_indicou as indicador,
		   ui.tipocomissao as tipobaseindicador,

           contrato,
           cast(null as bigint) as produto,
           cast(null as varchar(50)) as nomeproduto,
           filialvenda,
           faturamento,
           evento,
           case when evento = 'VENDA ENTRADA' then valor
                                              else valorprazo
           end as valor,

           case when evento = 'VENDA A VISTA' then valorprazo - (valorprazo - valor)
                when evento = 'VENDA A PRAZO' then
                case when u.tipocomissao = 'P' then valorprazo - (valorprazo - valor)
                     when u.tipocomissao = 'V' then valorvista - (valorprazo - valor)
                end
                when evento = 'VENDA ENTRADA' then valor
           end as base,
		
           case when evento = 'VENDA A VISTA' then valorprazo - (valorprazo - valor)
                when evento = 'VENDA A PRAZO' then
                case when ui.tipocomissao = 'P' then valorprazo - (valorprazo - valor)
                     when ui.tipocomissao = 'V' then valorvista - (valorprazo - valor)
                end
                when evento = 'VENDA ENTRADA' then valor
           end as baseindicador
		
	
    from
      (
      
      
        (
        SELECT vendedor,
               cast('CT '||contrato as varchar(25)) as contrato,
               filialvenda,
               faturamento,
               valorvista,
               valorprazo,
               CASE WHEN avista = 't' THEN 'VENDA A VISTA'
                    WHEN ( avista = 'f' AND datavencto>(faturamento+coalesce(toleranciaentrada,0)) ) THEN 'VENDA A PRAZO'
               ELSE 'VENDA ENTRADA' END AS evento,
               SUM(valorvencto) AS valor
        FROM
        (
        SELECT vendas.vendedor,
               vendas.contrato,
               vendas.filialvenda,
               vendas.faturamento,
               round(((vendas.valorvista * vendas.percvendedor)/100),2) as valorvista,
               round(((vendas.valorprazo * vendas.percvendedor)/100),2) as valorprazo,


              


               round((( ((vendas.valorprazo/vendas.totalcontrato)*parcelas.valorvencto) * vendas.percvendedor)/100),2) as valorvencto,


                             
               case when (select min(datavencto) 


                          from recebimentos 


                          where parcelas.transacao=recebimentos.transacao 


						    and parcelas.tiporecebimento=recebimentos.tiporecebimento


                            and recebimentos.situacao='N') is not null THEN  (select min(datavencto) 


                                                                              from recebimentos 


                                                                              where parcelas.transacao=recebimentos.transacao 


																			    and parcelas.tiporecebimento=recebimentos.tiporecebimento


                                                                                and recebimentos.situacao='N')  


                                                                       ELSE   parcelas.datavencto END as datavencto,
               contratos_avista(vendas.contrato) AS avista,
               (select toleranciaentrada from planos where planos.codigo = vendas.plano) as toleranciaentrada
        FROM parcelas, (

                            select vendedor, ((sum(totalvendedor)*100)/(valorvista+coalesce(desconto,0))) as percvendedor,
                            contrato, filialvenda, faturamento, valorvista, coalesce(desconto,0) as desconto, valorprazo, totalcontrato, plano
                            from
                            (
                             (
                               SELECT
                               coalesce(pc.vendedor, faturados.vendedor) as vendedor,
                               pc.quantidade * pc.precovenda as totalvendedor,
                               faturados.numero as contrato,
							   faturados.filialvenda,
                               faturados.faturamento,
                               (faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0))) as valorvista,
                               
                               (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0)) as desconto,
                               
                               (faturados.valorprazo-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0))) as valorprazo,


                               (faturados.valorprazo-coalesce(faturados.ImpostoRetido,0)) as totalcontrato,
                               faturados.plano

                               FROM produtoscontratos pc join contratos faturados on pc.contrato = faturados.numero
                               where pc.contrato = faturados.numero
                                 and not pc.brinde

                                 and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
                                 AND (faturados.origem IS NULL)
                                 AND ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
                                 
                               (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))                                 
                                 )<>0
								

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
								
                             )

                               union all

                             (
                               SELECT
                               faturados.vendedor,

                               sc.quantidade * sc.valorservico as totalvendedor,

                               faturados.numero as contrato,
							   faturados.filialvenda,
                               faturados.faturamento,
                               coalesce(faturados.TotalServicos,0) as valorvista,
                               0.00 as desconto,
                               coalesce(faturados.TotalServicos,0) as valorprazo,


                               


                               (faturados.valorprazo-coalesce(faturados.ImpostoRetido,0)) as totalcontrato,
                               faturados.plano
                               FROM servicoscontratos sc
                                   join contratos faturados
                                   on sc.contrato = faturados.numero
                               where sc.contrato = faturados.numero

                                 and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
                                 AND (faturados.origem IS NULL)
                                 AND coalesce(faturados.TotalServicos,0)<>0
								
                                 /*%FiltroServicosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(sc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */

                                  /*%FiltroContratos*/

                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
								
                             )
                            ) as faturados
                               GROUP BY vendedor,  contrato, filialvenda, faturamento, valorvista, desconto, valorprazo, totalcontrato, plano
                               ORDER BY contrato					

        	             ) as vendas
        WHERE parcelas.contrato = vendas.contrato AND
             (parcelas.tipopagto is null or parcelas.tipopagto not in ('P','X'))
        ORDER BY contrato, parcelas.datavencto
        ) AS base
		
        GROUP BY vendedor, contrato, filialvenda, faturamento, evento, valorvista, toleranciaentrada, valorprazo, avista
		
		
        )
        
        union all
        
        (
          SELECT vendedor,
                 nota as contrato,
                 filialvenda,
                 data as faturamento,
                 valorvista,
                 valorprazo,
                 CASE WHEN avista = 't' THEN 'VENDA A VISTA'
                      WHEN ( avista = 'f' AND datavencto>(data+coalesce(toleranciaentrada,0)) ) THEN 'VENDA A PRAZO'
                 ELSE 'VENDA ENTRADA' END AS evento,
                 SUM(valorvencto) AS valor
          FROM
            (
            SELECT vendas.vendedor,
                   vendas.nota,
                   vendas.data,
                   vendas.filialvenda,
                   round(((vendas.valorvista * vendas.percvendedor)/100),2) as valorvista,
                   round(((vendas.valortotal * vendas.percvendedor)/100),2) as valorprazo,
                   round(((vdf.valorvencto * vendas.percvendedor)/100),2) as valorvencto,


                                                     


                   


                   case when (select min(datavencto) 


                              from recebimentos 


                              where vdf.transacao=recebimentos.transacao 


							    and vdf.tiporecebimento=recebimentos.tiporecebimento


                                and recebimentos.situacao='N') is not null THEN  (select min(datavencto) 


                                                                                  from recebimentos 


                                                                                  where vdf.transacao=recebimentos.transacao 


																				    and vdf.tiporecebimento=recebimentos.tiporecebimento


                                                                                    and recebimentos.situacao='N')  


                                                                           ELSE   vdf.datavencto END as datavencto,
                   true AS avista,
                   (select toleranciaentrada from planos where planos.codigo = vendas.plano) as toleranciaentrada
            FROM venctosdadosfiscais vdf ,
                           (
                           
                             SELECT coalesce(pdf.vendedor, faturados.vendedor) as vendedor,
                                   ((sum(pdf.quantidade * pdf.precovenda)*100)/(faturados.valorvista+faturados.desconto)) as percvendedor,
                                    faturados.dadofiscal,
                                    faturados.nota,
                                    faturados.data,
                  		    faturados.valorvista,
                  		    faturados.desconto,
                  		    faturados.valortotal,


                            


                  		    faturados.plano,
                                    faturados.filialvenda
                              FROM produtosdadosfiscais pdf, 
                                             ( SELECT df.numero as dadofiscal,
                                             
                                                      cast(coalesce('NF '||cast(n.serie as varchar)||' '||cast(n.numero as varchar),
             								          'CP '||cast(c.maquina as varchar)||' '||cast(c.intervensao as varchar)||' '||cast(c.numero as varchar)) 
                                                      as varchar(25)) as nota,
                                                      
                                                      df.data,
                  			                          df.valorvista,
                                                      coalesce(df.desconto,0)+coalesce(df.descontoitem,0) as desconto,
                  			                          df.valortotal,
                  						              df.plano,
                                                      df.filialvenda,
                                                      df.vendedor
                                                      
                      		                   FROM dadosfiscais df left join notas n on df.numero = n.dadofiscal
                                                                    left join cupons c on df.numero = c.dadofiscal
                                                                    
               		                           WHERE (df.data BETWEEN pdatainicial AND pdatafinal)
                                                 and not coalesce(df.notavinculada,false)
                                                 AND df.contrato is null
                                                 
												 /* Alterado para não considerar notas canceladas sem contrato  */
                                                 and /*case when c.dadofiscal is not null then */ df.situacao='N' /*else true end*/
                                                 
              									and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
       						
                                                 /*%FiltroContratos*/
                                                 and case when pListaAgentes<>'' THEN
                                                   df.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                                 else
                                                   true
                                                 end

                                                 and case when pListaConceitos<>'' then
                                                   df.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                                 else
                                                   true
                                                 end

                                                 and case when pListaFiliais<>'' then
                                                   df.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                                 else
                                                   true
                                                 end

                                                 and case when pListaGruposFiliais<>'' then
                                                   df.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                                 else
                                                   true
                                                 end
                                                
                                              ORDER BY df.numero
                                          
                  			                ) AS faturados
                              WHERE pdf.dadofiscal = faturados.dadofiscal
                                and not coalesce(pdf.brinde,false)

                                 /*%FiltroProdutosDadosFiscais
								
                                 and case when pListaVendedores<>'' then
                                   coalesce(pdf.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
								

                              GROUP BY pdf.vendedor, faturados.vendedor, faturados.dadofiscal, faturados.nota,
                                       faturados.data, faturados.filialvenda,
                                       faturados.valorvista, faturados.desconto, faturados.valortotal, faturados.plano
              		      ORDER BY faturados.dadofiscal
						
						
						
            	             ) as vendas
							
            WHERE vdf.dadofiscal = vendas.dadofiscal
            ORDER BY vendas.dadofiscal, vdf.datavencto
            ) AS base 			
          GROUP BY vendedor, nota, filialvenda, data, evento, valorvista, toleranciaentrada, valorprazo, avista
        )
        
      ) as base join (usuarios u 
	                  left join usuarios ui 
					  on u.usuario_indicou = ui.codigo 
	                 ) on base.vendedor = u.codigo; 
	  
	
	  /* DADOS DO VENDEDOR */
	  loop
	    fetch refvendas into tabela;
	
	    if tabela.vendedor is null then
	      exit;
	    end if;

		if (pListaVendedores='') or
		   (pListaVendedores<>'' and tabela.vendedor in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 		   
								
			dados.vendedor := tabela.vendedor;		
			dados.indicador := false;
			dados.contrato := tabela.contrato;
			dados.produto := tabela.produto;
			dados.nomeproduto := tabela.nomeproduto;
			dados.filialvenda := tabela.filialvenda;
			dados.faturamento := tabela.faturamento;
			dados.evento := tabela.evento;
			dados.valor := tabela.valor;
			dados.base := tabela.base;
			dados.tipobase := tabela.tipobase;
			dados.exibirsomentebase := false;
			return next dados;	
			
		end if;	
         	
	  end loop;
	  	
	  MOVE first FROM refvendas;
	  MOVE relative -1 FROM refvendas;
	
	  /* DADOS DO INDICADOR */
	  loop
	    fetch refvendas into tabela;
	
	    if tabela.vendedor is null then
	      exit;
	    end if;
		
		if tabela.indicador is not null then

			if (pListaVendedores='') or
			   (pListaVendedores<>'' and tabela.indicador in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
			
				dados.vendedor := tabela.indicador;
				dados.indicador := true;
				dados.contrato := tabela.contrato;
				dados.produto := tabela.produto;
				dados.nomeproduto := tabela.nomeproduto;
				dados.filialvenda := tabela.filialvenda;
				dados.faturamento := tabela.faturamento;
				dados.evento := tabela.evento;
				dados.valor := tabela.valor;
				dados.base := tabela.baseindicador;
				dados.tipobase := tabela.tipobaseindicador;
				dados.exibirsomentebase := false;
				dados.vendedorindicado := tabela.vendedor;
				return next dados;	
			end if;	
					
		end if;

   	             	
	  end loop	;


      


      close refvendas;

   else

   /************************************************************************************************************************************************/
   /************************************************************************************************************************************************/

   if pDescricaoInformacao = 'ABATIMENTO_CREDITOTROCA_VENDAS' then
	
			OPEN refvendas scroll FOR
			select vendedor,
				   u.tipocomissao as tipobase,
				   u.usuario_indicou as indicador,
				   ui.tipocomissao as tipobaseindicador,
				   cast('CT '||contrato as varchar(25)) as contrato,
				   cast(null as bigint) as produto,
				   cast(null as varchar(50)) as nomeproduto,
				   filialvenda,
				   faturamento,
				   evento,
				   -valor as valor,
				   -valor as base,
				   -valor as baseindicador
				
			from
			(
			SELECT vendedor,
				   contrato,
				   filialvenda,
				   faturamento,
				   CASE WHEN avista = 't' THEN 'ABATIMENTO CREDITO TROCA - VENDA A VISTA'
						WHEN ( avista = 'f' AND datavencto>(faturamento+coalesce(toleranciaentrada,0)) ) THEN 'ABATIMENTO CREDITO TROCA - VENDA A PRAZO'
				   ELSE 'ABATIMENTO CREDITO TROCA - VENDA ENTRADA' END AS evento,
				   SUM(valorvencto) AS valor
			FROM
			(
			SELECT vendas.vendedor,
				   vendas.contrato,
				   vendas.filialvenda,
				   vendas.faturamento,


                   


                   round((( ((vendas.valorprazo/vendas.totalcontrato)*parcelas.valorvencto) * vendas.percvendedor)/100),2) as valorvencto,
				   case when (select min(datavencto) 


                              from recebimentos 


                              where parcelas.transacao=recebimentos.transacao 


							    and parcelas.tiporecebimento=recebimentos.tiporecebimento


                                and recebimentos.situacao='N') is not null THEN  (select min(datavencto) 


                                                                                  from recebimentos 


                                                                                  where parcelas.transacao=recebimentos.transacao 


																				    and parcelas.tiporecebimento=recebimentos.tiporecebimento


                                                                                    and recebimentos.situacao='N')  


                                                                           ELSE parcelas.datavencto END as datavencto,
				   contratos_avista(vendas.contrato) AS avista,
				   (select toleranciaentrada from planos where planos.codigo = vendas.plano) as toleranciaentrada
			FROM parcelas,

						   (
										select vendedor, ((sum(totalvendedor)*100)/(valorvista+coalesce(desconto,0))) as percvendedor,
										contrato, filialvenda, faturamento, valorvista, desconto, valorprazo, totalcontrato, plano
										from
										(
										 (
										   SELECT
										   coalesce(pc.vendedor, faturados.vendedor) as vendedor,
										   pc.quantidade * pc.precovenda as totalvendedor,
										   faturados.numero as contrato,
										   faturados.filialvenda,
										   faturados.faturamento,
										   (faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0))) as valorvista,


                               (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0)) as desconto,                                           
                                           
										   (faturados.valorprazo-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0))) as valorprazo,


                                           (faturados.valorprazo-coalesce(faturados.ImpostoRetido,0)) as totalcontrato,
										   faturados.plano

										   FROM produtoscontratos pc join contratos faturados on pc.contrato = faturados.numero
										   where pc.contrato = faturados.numero
											 and not pc.brinde
											 and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
											 AND (faturados.origem IS NULL)
                                             
											 AND ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
                                             
                               (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))                                             
                                             )<>0
											 AND (coalesce(faturados.creditotroca,0)<>0)
											
											 /*%FiltroProdutosContratos
											 and case when pListaVendedores<>'' then
											   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
											 else
											   true
											 end								
											 */
											 
											 /*%FiltroContratos*/									
											 and case when pListaAgentes<>'' THEN
											   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaConceitos<>'' then
											   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
											 else
											   true
											 end

											 and case when pListaFiliais<>'' then
											   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaGruposFiliais<>'' then
											   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
											 else
											   true
											 end
										 )

										   union all

										 (
										   SELECT
										   faturados.vendedor,

										   sc.quantidade * sc.valorservico as totalvendedor,

										   faturados.numero as contrato,
										   faturados.filialvenda,
										   faturados.faturamento,
										   coalesce(faturados.TotalServicos,0) as valorvista,
										   0.00 as desconto,
										   coalesce(faturados.TotalServicos,0) as valorprazo,


                                           


                                           (faturados.valorprazo-coalesce(faturados.ImpostoRetido,0)) as totalcontrato,
										   faturados.plano
										   FROM servicoscontratos sc
											   join contratos faturados
											   on sc.contrato = faturados.numero
										   where sc.contrato = faturados.numero

											 and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
											 AND (faturados.origem IS NULL)
											 AND coalesce(faturados.TotalServicos,0)<>0
											 AND (coalesce(faturados.creditotroca,0)<>0)
											
											
											/*%FiltroServicosContratos
											and case when pListaVendedores<>'' then
											   coalesce(sc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
											else
											  true
										   end
										   */


												/*%FiltroContratos*/
												
											 and case when pListaAgentes<>'' THEN
											   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaConceitos<>'' then
											   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
											 else
											   true
											 end

											 and case when pListaFiliais<>'' then
											   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaGruposFiliais<>'' then
											   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
											 else
											   true
											 end
											

										 )
										) as faturados
										   GROUP BY vendedor,  contrato, filialvenda, faturamento, valorvista, desconto, valorprazo, totalcontrato, plano
										   ORDER BY contrato					
							
							
						   ) as vendas
			WHERE parcelas.contrato = vendas.contrato AND
				 (parcelas.tipopagto is null or parcelas.tipopagto not in ('P','X','C')) AND (parcelas.formapagamento='T')
			ORDER BY contrato, parcelas.datavencto
			) AS base
			GROUP BY vendedor, contrato, filialvenda, faturamento, evento, toleranciaentrada, avista
		  ) as base join (usuarios u 
						  left join usuarios ui 
						  on u.usuario_indicou = ui.codigo 
						 ) on base.vendedor = u.codigo; 
			
			
			  /* DADOS DO VENDEDOR */
			  loop
				fetch refvendas into tabela;
				
				if tabela.vendedor is null then
				  exit;
				end if;
				
				if (pListaVendedores='') or
				   (pListaVendedores<>'' and tabela.vendedor in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
				
					dados.vendedor := tabela.vendedor;		
					dados.indicador := false;
					dados.contrato := tabela.contrato;
					dados.produto := tabela.produto;
					dados.nomeproduto := tabela.nomeproduto;
					dados.filialvenda := tabela.filialvenda;
					dados.faturamento := tabela.faturamento;
					dados.evento := tabela.evento;
					dados.valor := tabela.valor;
					dados.base := tabela.base;
					dados.tipobase := tabela.tipobase;		
					dados.exibirsomentebase := false;
					
					return next dados;	
				end if;	
					
			  end loop;
				
			  MOVE first FROM refvendas;
			  MOVE relative -1 FROM refvendas;
			
			  /* DADOS DO INDICADOR */
			  loop
				fetch refvendas into tabela;
				
				if tabela.vendedor is null then
				  exit;
				end if;
				
				if tabela.indicador is not null then
				
					if (pListaVendedores='') or
					   (pListaVendedores<>'' and tabela.indicador in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
					
						dados.vendedor := tabela.indicador;
						dados.indicador := true;
						dados.contrato := tabela.contrato;
						dados.produto := tabela.produto;
						dados.nomeproduto := tabela.nomeproduto;
						dados.filialvenda := tabela.filialvenda;
						dados.faturamento := tabela.faturamento;
						dados.evento := tabela.evento;
						dados.valor := tabela.valor;
						dados.base := tabela.baseindicador;
						dados.tipobase := tabela.tipobaseindicador;
						dados.exibirsomentebase := false;
						dados.vendedorindicado := tabela.vendedor;
						
						return next dados;	
					end if;		
							
				end if;

			  end loop	;


              


              close refvendas;


			
   else

   /************************************************************************************************************************************************/
   /************************************************************************************************************************************************/
   if pDescricaoInformacao = 'DEVOLUCOES_DO_MES' then


				OPEN refvendas scroll FOR
				select vendedor,
					   u.tipocomissao as tipobase,
					   u.usuario_indicou as indicador,
					   ui.tipocomissao as tipobaseindicador,
					   contrato,
					   cast(null as bigint) as produto,
					   cast(null as varchar(50)) as nomeproduto,
					   filialvenda,
					   dataestorno as faturamento,
					   evento,
					   
					  - case
						  when evento = 'ESTORNO ENTRADA' then valor
						  else valorprazo
						end as valor,
						
					  - case
						  when evento = 'ESTORNO A VISTA' then valorprazo - (valorprazo - valor)
						  when evento = 'ESTORNO A PRAZO' then
							case
							  when u.tipocomissao = 'P' then valorprazo - (valorprazo - valor)
							  WHEN u.tipocomissao = 'V' then valorvista - (valorprazo - valor)
							end
						  when evento = 'ESTORNO ENTRADA' then valor
						end as base,
						
					  - case
						  when evento = 'ESTORNO A VISTA' then valorprazo - (valorprazo - valor)
						  when evento = 'ESTORNO A PRAZO' then
							case
							  when ui.tipocomissao = 'P' then valorprazo - (valorprazo - valor)
							  WHEN ui.tipocomissao = 'V' then valorvista - (valorprazo - valor)
							end
						  when evento = 'ESTORNO ENTRADA' then valor
						end as baseindicador,
						
						ExibirSomenteBase
						

				from
				(
				  (
				  SELECT vendedor,
						  cast('CT '||contrato as varchar(25)) as contrato,
						 filialvenda,
						 dataestorno,
						 valorvista,
						 valorprazo,
						 CASE WHEN avista = 't' THEN 'ESTORNO A VISTA'
							  WHEN ( avista = 'f' AND datavencto>(faturamento+coalesce(toleranciaentrada,0)) ) THEN 'ESTORNO A PRAZO'
						 ELSE 'ESTORNO ENTRADA' END AS evento,
						 SUM(valorvencto) AS valor,
						 false as ExibirSomenteBase
				  FROM
				  (
				  SELECT vendas.vendedor,
						 vendas.contrato,
						 vendas.filialvenda,
						 vendas.faturamento,
						 round(((vendas.valorvista * vendas.percvendedor)/100),2) as valorvista,
						 round(((vendas.valorprazo * vendas.percvendedor)/100),2) as valorprazo,


                        


                         round((( ((vendas.valorprazo/vendas.totalcontrato)*parcelas.valorvencto) * vendas.percvendedor)/100),2) as valorvencto,
						 parcelas.datavencto,
						 CASE WHEN tipopagto in ('E','J') THEN datapagto ELSE deventrada END AS dataestorno,
						 contratos_avista(vendas.contrato) AS avista,
						 (select toleranciaentrada from planos where planos.codigo = vendas.plano) as toleranciaentrada
				  FROM parcelas, (
					
							
							
								 select vendedor, ((sum(totalvendedor)*100)/(valorvista+desconto)) as percvendedor,
											contrato, filialvenda, faturamento, valorvista, desconto, valorprazo, totalcontrato, plano
											from
											(
											 (
											 
											 
											   SELECT
											   coalesce(pc.vendedor, faturados.vendedor) as vendedor,
											   pc.quantidade * pc.precovenda as totalvendedor,
											   faturados.numero as contrato,
											   faturados.filialvenda,
											   faturados.faturamento,
											   (faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0))) as valorvista,
											                                                 
                                               (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0)) as desconto,
                                               
											   (faturados.valorprazo-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0))) as valorprazo,


                                               (faturados.valorprazo-coalesce(faturados.ImpostoRetido,0)) as totalcontrato,
											   faturados.plano

											   FROM produtoscontratos pc join contratos faturados on pc.contrato = faturados.numero
											
											   where pc.contrato = faturados.numero
												 and (((faturados.numero, pc.produto) in
																		  (
																		   SELECT distinct cv.contrato, cv.produto
																		   FROM contratosdevolvidos cv
																		   WHERE cv.devolucao BETWEEN pdatainicial AND pdatafinal
																			 and cv.tipo='D' and cv.produto is not null
																		  ))
														or							
													   (faturados.numero in										
																		  (
																		   select distinct p.contrato
																		   from contratos ct, parcelas p
																		   where ct.numero=p.contrato
																			 and ct.situacao='C'
																			 and not exists (select p2.numero
																							 from parcelas p2
																							 where p2.contrato = ct.numero
																							  and p2.tipopagto<>'E')
																			 and p.datapagto between pdatainicial and pdatafinal
																			 and not exists (select cd.contrato
																							 from contratosdevolvidos cd
																							 where cd.contrato = ct.numero
																							   and cd.tipo = 'D')
																		   )
																		  ))
												and ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
                                                
                               (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))                                                
                                                
                                                )<>0						
												and not pc.brinde

												/*%FiltroContratos*/
												 and case when pListaAgentes<>'' THEN
												   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
												 else
												   true
												 end

												 and case when pListaConceitos<>'' then
												   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
												 else
												   true
												 end

												 and case when pListaFiliais<>'' then
												   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
												 else
												   true
												 end

												 and case when pListaGruposFiliais<>'' then
												   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
												 else
												   true
												 end
												
												/*%FiltroProdutosContratos
												 and case when pListaVendedores<>'' then
												   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
												 else
												   true
												 end								
												 */
												


											 )

											   union all

											 (
											   SELECT
											   faturados.vendedor,

											   sc.quantidade * sc.valorservico as totalvendedor,

											   faturados.numero as contrato,
											   faturados.filialvenda,
											   faturados.faturamento,
											   coalesce(faturados.TotalServicos,0) as valorvista,
											   0.00  as desconto,
											   coalesce(faturados.TotalServicos,0) as valorprazo,


                                               


                                               (faturados.valorprazo-coalesce(faturados.ImpostoRetido,0)) as totalcontrato,
											   faturados.plano
											   FROM servicoscontratos sc
												   join contratos faturados
												   on sc.contrato = faturados.numero
											   where sc.contrato = faturados.numero

												 AND coalesce(faturados.totalservicos,0)<>0
												
												 and (((faturados.numero, sc.servico) in (
																		   SELECT distinct cv.contrato, cv.servico
																		   FROM contratosdevolvidos cv
																		   WHERE cv.devolucao BETWEEN pdatainicial AND pdatafinal
																			 and cv.tipo='D' and cv.servico is not null
																		  ))
													or
													
													(faturados.numero in (
																		   select distinct p.contrato
																		   from contratos ct, parcelas p
																		   where ct.numero=p.contrato
																			 and ct.situacao='C'
																			 and not exists (select p2.numero
																							 from parcelas p2
																							 where p2.contrato = ct.numero
																							  and p2.tipopagto<>'E')
																			 and p.datapagto between pdatainicial and pdatafinal
																			 and not exists (select cd.contrato
																							 from contratosdevolvidos cd
																							 where cd.contrato = ct.numero
																							   and cd.tipo = 'D')
																		   )
																		  ))
													 /*%FiltroServicosContratos
												   and case when pListaVendedores<>'' then
													   coalesce(sc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
													else
													  true
												   end
												   */
																		
												 /*%FiltroContratos*/

												 and case when pListaAgentes<>'' THEN
												   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
												 else
												   true
												 end

												 and case when pListaConceitos<>'' then
												   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
												 else
												   true
												 end

												 and case when pListaFiliais<>'' then
												   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
												 else
												   true
												 end

												 and case when pListaGruposFiliais<>'' then
												   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
												 else
												   true
												 end
																		
											 )
											) as faturados
											   GROUP BY vendedor,  contrato, filialvenda, faturamento, valorvista, desconto, valorprazo, totalcontrato, plano
											   ORDER BY contrato			
						   ) as vendas
				  WHERE parcelas.contrato = vendas.contrato AND (tipopagto IN ('E','D','C')) AND
					 ((parcelas.tipopagto in ('E','J') and parcelas.datapagto between pdatainicial AND pdatafinal) or


                     


					  (parcelas.tipopagto in ('D','C') and parcelas.deventrada between pdatainicial AND pdatafinal))

				  ORDER BY contrato, parcelas.datavencto
				  ) AS base
				  GROUP BY vendedor, contrato, filialvenda, faturamento, dataestorno, evento, valorvista, toleranciaentrada, valorprazo, avista
				  )
                  
				  union all
                  
				  (
					SELECT vendedor,
						   nota as contrato,
						   filialvenda,
						   datacancelamento as dataestorno,
						   valorvista,
						   valorprazo,
						   CASE WHEN avista = 't' THEN 'ESTORNO A VISTA'
								WHEN ( avista = 'f' AND datavencto>(data+coalesce(toleranciaentrada,0)) ) THEN 'ESTORNO A PRAZO'
						   ELSE 'ESTORNO ENTRADA' END AS evento,
						   SUM(valorvencto) AS valor,
						   false as ExibirSomenteBase
					FROM
					  (
					  SELECT vendas.vendedor,
							 vendas.nota,
							 vendas.filialvenda,
							 vendas.datacancelamento,
							 vendas.data,
							 round(((vendas.valorvista * vendas.percvendedor)/100),2) as valorvista,
							 round(((vendas.valortotal * vendas.percvendedor)/100),2) as valorprazo,
							 round(((vdf.valorvencto * vendas.percvendedor)/100),2) as valorvencto,
							 vdf.datavencto,
							 true AS avista,
							 (select toleranciaentrada from planos where planos.codigo = vendas.plano) as toleranciaentrada
					  FROM venctosdadosfiscais vdf ,
                      
									 (SELECT coalesce(pdf.vendedor, faturados.vendedor) as vendedor,
											 ((sum(pdf.quantidade * pdf.precovenda)*100)/(faturados.valorvista+faturados.desconto)) as percvendedor,
											  faturados.dadofiscal,
											  faturados.nota,
										  faturados.datacancelamento,
											  faturados.data,
										  faturados.valorvista,
										  faturados.desconto,
										  faturados.valortotal,
										  faturados.plano,
								  faturados.filialvenda
									  FROM produtosdadosfiscais pdf, ( SELECT df.numero as dadofiscal,
                                      
																		  	  cast(coalesce('NF '||cast(n.serie as varchar)||' '||cast(n.numero as varchar),
																	          'CP '||cast(c.maquina as varchar)||' '||cast(c.intervensao as varchar)||' '||cast(c.numero as varchar)) as varchar(25)) as nota,
                                                                      
																			  df.datacancelamento,
																		      df.data,
																			  df.valorvista,
                                                                              coalesce(df.desconto,0)+coalesce(df.descontoitem,0) as desconto,
																			  df.valortotal,
																              df.plano,
													                          df.filialvenda, 
																			  df.vendedor
                                                                              
																	   FROM dadosfiscais df left join notas n on df.numero = n.dadofiscal
																								   left join cupons c on df.numero = c.dadofiscal
                                                                                                   
																	   WHERE (df.datacancelamento BETWEEN pdatainicial AND pdatafinal)
																	       and df.situacao = 'C'
																		   and not coalesce(df.notavinculada,false)
																		   AND df.contrato is null
																		   
																		   /* Alterado para não considerar notas canceladas sem contrato  */
                                                                           and /*case when c.dadofiscal is not null then*/ df.situacao='N' /* else true end */
																		
													
																and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
																
																/*%FiltroContratos*/																
																 and case when pListaAgentes<>'' THEN
																   df.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
																 else
																   true
																 end

																 and case when pListaConceitos<>'' then
																   df.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
																 else
																   true
																 end

																 and case when pListaFiliais<>'' then
																   df.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
																 else
																   true
																 end

																 and case when pListaGruposFiliais<>'' then
																   df.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
																 else
																   true
																 end
													
													
													
													
														 ORDER BY df.numero
														
															   ) AS faturados
                                                               
									  WHERE pdf.dadofiscal = faturados.dadofiscal
										and not coalesce(pdf.brinde,false)

										/*%FiltroProdutosDadosFiscais
										and case when pListaVendedores<>'' then
										  coalesce(pdf.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
										else
										  true
										end
										*/

									  GROUP BY pdf.vendedor, faturados.vendedor, faturados.filialvenda, faturados.dadofiscal, faturados.nota, faturados.datacancelamento,
											   faturados.data,
											   faturados.valorvista, faturados.desconto, faturados.valortotal, faturados.plano
							ORDER BY faturados.dadofiscal
							   ) as vendas
					  WHERE vdf.dadofiscal = vendas.dadofiscal
					  ORDER BY vendas.dadofiscal, vdf.datavencto
					  ) AS base
					GROUP BY vendedor, nota, filialvenda, data, datacancelamento, evento, valorvista, toleranciaentrada, valorprazo, avista
				  )
                  
                  union all
                                   
                 
                  (
                      SELECT vendedor,
                             nota as contrato,
                             filialvenda,
                             datacancelamento as dataestorno,
                             valorvista,
                             valorprazo,
                             CASE WHEN avista = 't' THEN 'ESTORNO A VISTA'
                                  WHEN ( avista = 'f' AND datavencto>(data+coalesce(toleranciaentrada,0)) ) THEN 'ESTORNO A PRAZO'
                             ELSE 'ESTORNO ENTRADA' END AS evento,
                             SUM(valorvencto) AS valor,
							 ExibirSomenteBase
                      FROM
                      (


                        SELECT vendas.vendedor,
                               vendas.nota,
                               vendas.filialvenda,
                               vendas.datacancelamento,
                               vendas.data,
                               round(((vendas.valorvista * vendas.percvendedor)/100),2) as valorvista,
                               round(((vendas.valortotal * vendas.percvendedor)/100),2) as valorprazo,							   
                               round(((vendas.valortotal * vendas.percvendedor)/100),2) as valorvencto,
                               vendas.data as datavencto,
                               true AS avista,
                               (select toleranciaentrada from planos where planos.codigo = vendas.plano) as toleranciaentrada,
							   ExibirSomenteBase
                        FROM

                        (

                           SELECT coalesce(pnp.vendedor, faturados.vendedor) as vendedor,

                                 ((sum(pnp.quantidade * pnp.precounitario)*100)/(faturados.valorvista+faturados.desconto)) as percvendedor,

                                  faturados.nota,
                                  faturados.datacancelamento,
                                  faturados.data,
                                  faturados.valorvista,
                                  faturados.desconto,
                                  faturados.valortotal,
                                  faturados.plano,
                                  faturados.filialvenda,
								  faturados.ExibirSomenteBase

                          FROM produtosnotaspag pnp,

                          (


                            select distinct
                                   np.codigo,
                                   cast(('NF '||cast(np.serie as varchar)||' '||cast(np.numero as varchar)) as varchar(25)) as nota,
                                   np.data as datacancelamento,
                                   np.data,
                                   np.valornota as valorvista,
                                   coalesce(np.desconto,0)+coalesce(np.descontoitem,0) as desconto,
                                   np.valornota as valortotal,
                                   cast(1 as smallint) as plano,
                                   np.filial as filialvenda,
                                   np.vendedor,								   
								   pnp.dadofiscal is null as ExibirSomenteBase


                            FROM notaspag np

                                    join (produtosnotaspag pnp
                                          left join dadosfiscais df
                                          on pnp.dadofiscal = df.numero )

                                         join produtos p
                                              join caracteristicas c
                                              on p.caracteristica = c.codigo
                                         on pnp.produto = p.codigo

                                         join movimentos m
                                         on pnp.codigonota = m.codigonota
                                         and pnp.produto = m.produto
                                         and pnp.numero = m.numerocontrole
                                    on np.codigo = pnp.codigonota


                                    join (vfornecedores vf
                                          left join conceitos cc
                                          on vf.conceito = cc.codigo
                                         )
                                    on np.fornecedor = vf.codigo
                                    and np.tipofornecedor = vf.tipo


                            WHERE np.data BETWEEN pdatainicial AND pdatafinal
                              and ehnotafiscalentradadevolucao(np.codigofiscal)
                              and np.contrato is null 


							  


							  /*nao pegar estes casos, visto que este tipo de nota só é gerado através de troca e para isso temos o abatimento


							  JR 2019-12-10


							  */


							  and pIncluirDevolucoesSemContrato

                             and case when pListaAgentes<>'' THEN
                               df.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                             else
                               true
                             end

                             and case when pListaConceitos<>'' then
                               df.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                             else
                               true
                             end

                             and case when pListaFiliais<>'' then
                               df.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                             else
                               true
                             end

                             and case when pListaGruposFiliais<>'' then
                               df.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                             else
                               true
                             end


                            order by np.codigo

                          ) as faturados

                          WHERE pnp.codigonota = faturados.codigo
                          
                          
										/*%FiltroProdutosDadosFiscais
										and case when pListaVendedores<>'' then
										  coalesce(pdf.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
										else
										  true
										end
										*/
                          

                          GROUP BY pnp.vendedor, faturados.vendedor, faturados.filialvenda, faturados.nota, faturados.datacancelamento,
                               faturados.data,
                               faturados.valorvista, faturados.desconto, faturados.valortotal, faturados.plano, faturados.ExibirSomenteBase

                          ORDER BY faturados.data

                        ) as vendas
                        ORDER BY vendas.data

                      ) AS base
                       GROUP BY vendedor, nota, filialvenda, data, datacancelamento, evento, valorvista, toleranciaentrada, valorprazo, avista, ExibirSomenteBase
                       
                    )   
              
                                    
			  ) as base join (usuarios u 
							  left join usuarios ui 
							  on u.usuario_indicou = ui.codigo 
							 ) on base.vendedor = u.codigo; 

				
				  /* DADOS DO VENDEDOR */
				  loop
					fetch refvendas into tabela;
					
					if tabela.vendedor is null then
					  exit;
					end if;
					
					if (pListaVendedores='') or
					   (pListaVendedores<>'' and tabela.vendedor in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
					
						dados.vendedor := tabela.vendedor;		
						dados.indicador := false;
						dados.contrato := tabela.contrato;
						dados.produto := tabela.produto;
						dados.nomeproduto := tabela.nomeproduto;
						dados.filialvenda := tabela.filialvenda;
						dados.faturamento := tabela.faturamento;
						dados.evento := tabela.evento;
						dados.valor := tabela.valor;
						dados.base := tabela.base;
					    dados.tipobase := tabela.tipobase;
                        dados.exibirsomentebase := tabela.exibirsomentebase;
						
						return next dados;	
					end if;	
						
				  end loop;
					
				  MOVE first FROM refvendas;
				  MOVE relative -1 FROM refvendas;
				
				  /* DADOS DO INDICADOR */
				  loop
					fetch refvendas into tabela;
					
					if tabela.vendedor is null then
					  exit;
					end if;
					
					if tabela.indicador is not null then
					
						if (pListaVendedores='') or
						   (pListaVendedores<>'' and tabela.indicador in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 

							dados.vendedor := tabela.indicador;
							dados.indicador := true;
							dados.contrato := tabela.contrato;
							dados.produto := tabela.produto;
							dados.nomeproduto := tabela.nomeproduto;
							dados.filialvenda := tabela.filialvenda;
							dados.faturamento := tabela.faturamento;
							dados.evento := tabela.evento;							
							dados.valor := tabela.valor;
							dados.base := tabela.baseindicador;
							dados.tipobase := tabela.tipobaseindicador;
							dados.exibirsomentebase := tabela.exibirsomentebase;
							dados.vendedorindicado := tabela.vendedor;							
							return next dados;	
						end if;	
								
					end if;

				  end loop	;


                  


                  close refvendas;
				
			

   else

   /************************************************************************************************************************************************/
   /************************************************************************************************************************************************/
   if pDescricaoInformacao = 'ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS' then

       OPEN refvendas scroll FOR
		
	   (
		
		(
		SELECT vendedor, 
		    indicador,
			contrato,
			produto,
			p.descricao as nomeproduto,
			filialvenda,
			faturamento,
			CASE WHEN tipobase = 'V' THEN
			  CAST('ADIC. PRODUTO $' AS TEXT)
			ELSE
			  CAST('ADIC. PRODUTO %' AS TEXT)
			END AS evento,
			
			valor,
			valor as base,
			tipobase,
			
			valorindicador,
			valorindicador as baseindicador,
			tipobaseindicador,
			
			cast(null as integer) as nivelcomissao,
			
			percentual_ou_valor,
			percentual_ou_valorindicador,
			
			quantidade,
		    produtomonstruario,
			
			tipocomissao,
			tipocomissaoindicador

		FROM
		(
		SELECT vendas.*,
			CASE WHEN cug.comissao is not null THEN cug.tipocomissao
				 WHEN cuc.comissao is not null THEN cuc.tipocomissao
				 WHEN c.comissao   is not null THEN c.tipocomissao
				 WHEN g.comissao   is not null THEN g.tipocomissao
				WHEN cl.comissao  is not null THEN cl.tipocomissao
			END AS tipocomissao,
			
			c.tipocomissaoindicador,

			CASE WHEN cug.comissao is not null THEN cug.comissao
				 WHEN cuc.comissao is not null THEN cuc.comissao
				 WHEN c.comissao   is not null THEN c.comissao
				 WHEN g.comissao   is not null THEN g.comissao
				WHEN cl.comissao  is not null THEN cl.comissao
			END AS percentual_ou_valor,
			
			c.comissaoindicador as percentual_ou_valorindicador,

			CASE WHEN (tipobase='P') THEN
				  round(((quantidade*precovenda)*(valorprazo/*-frete*/))/(valorvista/*-frete*/+coalesce(desconto,0)),2)
			ELSE
				  round(((quantidade*precovenda)*(valorvista/*-frete*/))/(valorvista/*-frete*/+coalesce(desconto,0)),2)
			END AS valor,
			
			CASE WHEN (tipobaseindicador='P') THEN
				  round(((quantidade*precovenda)*(valorprazo/*-frete*/))/(valorvista/*-frete*/+coalesce(desconto,0)),2)
			ELSE
				  round(((quantidade*precovenda)*(valorvista/*-frete*/))/(valorvista/*-frete*/+coalesce(desconto,0)),2)
			END AS valorindicador
			
			
		FROM
		(
		  (
			SELECT coalesce(pc.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   pc.produto,
				   pc.precovenda,
				   pc.quantidade,
				   pc.produtomonstruario,
				   u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   cast('CT '||faturados.numero as varchar(25)) as contrato,

				   cast(faturados.numero as varchar) as numerodocumento,
				   cast('CT' as varchar) as tipo,

				   faturados.filialvenda,
				   faturados.faturamento,
				   (faturados.valorprazo-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)) - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0)) as valorprazo,
				   (faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)) - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0)) as valorvista,
				   (coalesce(faturados.desconto,0) + coalesce(pc.valordescontoitem,0)) as desconto /*,
				   coalesce(faturados.frete,0) as frete */

			FROM produtoscontratos pc
				 join contratos faturados
				 on pc.contrato = faturados.numero

				 join (usuarios u 
	                   left join usuarios ui 
					   on u.usuario_indicou = ui.codigo 
	                  ) on coalesce(pc.vendedor, faturados.vendedor) = u.codigo
					  
			where pc.contrato = faturados.numero
			  and coalesce(pc.vendedor, faturados.vendedor) = u.codigo
			  and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
			  AND faturados.origem IS NULL
			  and ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+

                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
              
              )<>0
			  and not pc.brinde
			

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
								
                                 /*%FiltroProdutosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
								
			ORDER BY pc.produto
		  )
		  union all
		  (
			SELECT coalesce(pdf.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   pdf.produto,
				   pdf.precovenda,
				   pdf.quantidade,
				   pdf.produtomonstruario,
				   u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   
				   faturados.nota as contrato,

				   cast(faturados.dadofiscal as varchar) as numerodocumento,
				   cast('DF' as varchar) as tipo,

				   faturados.filialvenda,
				   faturados.faturamento,
				   faturados.valorprazo - COALESCE(faturados.valorfrete, 0) - COALESCE(faturados.seguro, 0) as valorprazo,
				   faturados.valorvista - COALESCE(faturados.valorfrete, 0) - COALESCE(faturados.seguro, 0) as valorvista,
				   faturados.desconto /*,
				   COALESCE(faturados.valorfrete, 0) as Frete */

			FROM produtosdadosfiscais pdf, 
			
			
					  (usuarios u 
	                   left join usuarios ui 
					   on u.usuario_indicou = ui.codigo ),
			
						(
						SELECT
									   df.numero as dadofiscal,
									   cast(coalesce('NF '||cast(n.serie as varchar)||' '||cast(n.numero as varchar),
													 'CP '||cast(c.maquina as varchar)||' '||cast(c.intervensao as varchar)||' '||cast(c.numero as varchar)) as varchar(25)) as nota,
							   df.filialvenda,
							   df.data as faturamento,
							   df.valortotal as valorprazo,
							   df.valorvista,
                               coalesce(df.desconto,0)+coalesce(df.descontoitem,0) as desconto,
						   df.valorfrete, df.seguro,
									   df.vendedor

									   FROM dadosfiscais df left join notas n on df.numero = n.dadofiscal
																  left join cupons c on df.numero = c.dadofiscal
									   WHERE (df.data BETWEEN pdatainicial AND pdatafinal)
										 and not coalesce(df.notavinculada,false)
										 AND df.contrato is null
										 and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
										 /* Alterado para não considerar notas canceladas sem contrato  */
                                         and /*case when c.dadofiscal is not null then */ df.situacao='N' /*else true end*/
										
										                    					         /*%FiltroContratos*/
											 and case when pListaAgentes<>'' THEN
											   df.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaConceitos<>'' then
											   df.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
											 else
											   true
											 end

											 and case when pListaFiliais<>'' then
											   df.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaGruposFiliais<>'' then
											   df.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
											 else
											   true
											 end

									
									   ORDER BY df.numero
						) AS faturados
			WHERE pdf.dadofiscal = faturados.dadofiscal
			  and coalesce(pdf.vendedor, faturados.vendedor) = u.codigo
			  and not coalesce(pdf.brinde,false)

			
                                 /*%FiltroProdutosDadosFiscais
                                 and case when pListaVendedores<>'' then
                                   coalesce(pdf.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
			

			ORDER BY pdf.produto
		  )
		) as vendas
			join (produtos p
				   join (caracteristicas c
							
							 join classes cl
						on c.classe = cl.codigo)
						
				   on p.caracteristica = c.codigo)
			on p.codigo = vendas.produto

			left join comissoesusuariosgrupos cug
			on cug.usuario = vendas.vendedor and cug.grupo = c.grupo

			left join comissoesusuariosclasses cuc
			on cuc.usuario = vendedor and cuc.classe = cl.codigo

		   left join



			(
		 SELECT pc.contrato, pc.grupo, gc.comissao, gc.tipocomissao
		FROM ((
			SELECT pc.contrato, pc.grupo, pc.total, (
				SELECT gc.numero
				FROM gruposcomissoes gc
				WHERE ((gc.grupo = pc.grupo) AND (gc.limite >= pc.total))
				ORDER BY gc.limite
				LIMIT 1
				) AS numero
			FROM (
				SELECT pc.contrato, pc.grupo, sum(((((((pc.quantidade * pc.precovenda)
					+ COALESCE(pc.acrescimo, 0)) + COALESCE(pc.frete,
					0)) + COALESCE(pc.seguro, 0)) -
					COALESCE(pc.valordescontoitem, 0)) -
					COALESCE(pc.desconto, 0))) AS total
				FROM (
					SELECT pc.quantidade, pc.precovenda, pc.acrescimo, pc.frete,
						pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto, pc.produto,
						pc.contrato, pc.caracteristica, pc.grupo
					FROM (
						SELECT pc.quantidade, pc.precovenda, pc.acrescimo, pc.frete,
							pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto, pc.produto,
							pc.contrato, pc.caracteristica, c.grupo
						FROM ((
							SELECT pc.quantidade, pc.precovenda, pc.acrescimo,
								pc.frete, pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto,
								pc.produto, pc.contrato, p.caracteristica
							FROM ((

								SELECT pc.quantidade, pc.precovenda, pc.acrescimo,
									pc.frete, pc.seguro, pc.valordescontoitem,
									coalesce(pc.desconto,0) as desconto, pc.produto, pc.contrato
								FROM produtoscontratos pc join contratos faturados on pc.contrato = faturados.numero
								where pc.contrato = faturados.numero
								  and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
								  AND faturados.origem IS NULL
								  AND ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
                                  
                                  
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                                  
                                  )<>0
  								  and not pc.brinde

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
																	
                                 /*%FiltroProdutosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
								
								) pc JOIN produtos p ON ((pc.produto = p.codigo)))
							WHERE (pc.produto = p.codigo)
							) pc JOIN caracteristicas c ON ((pc.caracteristica = c.codigo)))
						WHERE (pc.caracteristica = c.codigo)
						) pc
					) pc
				GROUP BY pc.contrato, pc.grupo
				) pc
			) pc LEFT JOIN gruposcomissoes gc ON (((pc.grupo = gc.grupo) AND (pc.numero
				= gc.numero))))


		 ) as g

		   on c.grupo = g.grupo
		   and g.contrato = vendas.numerodocumento
		   and vendas.tipo = 'CT'

		where c.classe = cl.codigo
		  and p.caracteristica = c.codigo
		  and p.codigo = vendas.produto
		  and (coalesce(cug.comissao, cuc.comissao, c.comissao, g.comissao, cl.comissao) is not null)

		) AS vendas join produtos p on vendas.produto = p.codigo
		  where (coalesce(percentual_ou_valor,0) <> 0 or coalesce(percentual_ou_valorindicador,0) <> 0)
			and vendas.produto = p.codigo
		)

		union all

		(
		SELECT vendedor,
		    indicador,
			
			contrato,
			cast(s.codigo as bigint) as produto,
			s.descricao as nomeproduto,
			filialvenda,
			faturamento,
			CASE WHEN tipobase = 'V' THEN
			  CAST('ADIC. SERVI?OS $' AS TEXT)
			ELSE
			  CAST('ADIC. SERVI?OS %' AS TEXT)
			END AS evento,
			
			round((quantidade*precovenda),2) as Valor,
			round((quantidade*precovenda),2) as base,
			tipobase,
			
			round((quantidade*precovenda),2) as Valorindicador,
			round((quantidade*precovenda),2) as baseindicador,
			tipobaseindicador,
			
			
			cast(null as integer) as nivelcomissao,
			
			s.comissao AS percentual_ou_valor,
			s.comissaoindicador AS percentual_ou_valorindicador,

			
			quantidade,
			produtomonstruario,
			
			s.tipocomissao,
			s.tipocomissaoindicador
			

		FROM
		(
		
			SELECT coalesce(sc.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   
				   sc.servico,
				   sc.valorservico as precovenda,
				   sc.quantidade,
				   false as produtomonstruario,
				   u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   
				   cast('CT '||faturados.numero as varchar(25)) as contrato,

				   cast(faturados.numero as varchar) as numerodocumento,
				   cast('CT' as varchar) as tipo,

				   faturados.filialvenda,
				   faturados.faturamento,
				   coalesce(faturados.TotalServicos,0) as valorprazo,
				   coalesce(faturados.TotalServicos,0) as valorvista,
				   0.00 as desconto,
				   coalesce(faturados.frete,0) as frete

			FROM servicoscontratos sc
				 join contratos faturados
				 on sc.contrato = faturados.numero

				 join (usuarios u 
	                   left join usuarios ui 
					   on u.usuario_indicou = ui.codigo 
	                   ) on coalesce(sc.vendedor, faturados.vendedor) = u.codigo
			where sc.contrato = faturados.numero
			  and coalesce(sc.vendedor, faturados.vendedor) = u.codigo
			  and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
			  AND faturados.origem IS NULL
			  and coalesce(faturados.TotalServicos,0)<>0

			
                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
			  			
                                 /*%FiltroServicosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(sc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
			
			ORDER BY sc.servico
		

		) AS vendas join servicos s on vendas.servico = s.codigo
		  where vendas.servico = s.codigo
			and (coalesce(s.comissao,0)<>0 or coalesce(s.comissaoindicador,0)<>0)
			
		)
		);
				
		  /* DADOS DO VENDEDOR */
		  loop
			fetch refvendas into tabela;
		
			if tabela.vendedor is null then
			  exit;
			end if;
			
            if coalesce(tabela.percentual_ou_valor,0)<>0 then

				if (pListaVendedores='') or
				   (pListaVendedores<>'' and tabela.vendedor in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
				
					  dados.vendedor := tabela.vendedor;		
					  dados.indicador := false;
					  dados.contrato := tabela.contrato;
					  dados.produto := tabela.produto;
					  dados.nomeproduto := tabela.nomeproduto;
					  dados.filialvenda := tabela.filialvenda;
					  dados.faturamento := tabela.faturamento;
					  dados.evento := tabela.evento;
					  dados.valor := tabela.valor;
					  dados.base := tabela.base;
					  dados.tipobase := tabela.tipobase;
					  dados.exibirsomentebase := false;					  
					  dados.nivelcomissao := tabela.nivelcomissao;
					  dados.percentual_ou_valor := tabela.percentual_ou_valor;
					  dados.quantidade := tabela.quantidade;
					  dados.produtomonstruario := tabela.produtomonstruario;
					  dados.tipocomissao := tabela.tipocomissao;			  					  
					  return next dados;	
				end if;	  
				  
			end if;  
				
		  end loop;
			
		  MOVE first FROM refvendas;
		  MOVE relative -1 FROM refvendas;
		
		  /* DADOS DO INDICADOR */
		  loop
			fetch refvendas into tabela;
		
			if tabela.vendedor is null then
			  exit;
			end if;
			
			if tabela.indicador is not null then
               if coalesce(tabela.percentual_ou_valorindicador,0)<>0 then 
			   
					if (pListaVendedores='') or
					   (pListaVendedores<>'' and tabela.indicador in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
			   
						dados.vendedor := tabela.indicador;
						dados.indicador := true;
						dados.contrato := tabela.contrato;
						dados.produto := tabela.produto;
						dados.nomeproduto := tabela.nomeproduto;
						dados.filialvenda := tabela.filialvenda;
						dados.faturamento := tabela.faturamento;
						dados.evento := tabela.evento;
						dados.valor := tabela.valorindicador;
						dados.base := tabela.baseindicador;						
						dados.tipobase := tabela.tipobaseindicador;
						dados.exibirsomentebase := false;												
						dados.nivelcomissao := tabela.nivelcomissao;
						dados.percentual_ou_valor := tabela.percentual_ou_valorindicador;
						dados.quantidade := tabela.quantidade;
						dados.produtomonstruario := tabela.produtomonstruario;
						dados.tipocomissao := tabela.tipocomissaoindicador;			  
						dados.vendedorindicado := tabela.vendedor;
						
						return next dados;	
					end if;	
				end if;	
			end if;

		  end loop	;


          


          close refvendas;
		
		
		
   else

   /************************************************************************************************************************************************/
   /************************************************************************************************************************************************/
   if pDescricaoInformacao = 'ABATIMENTO_CREDITO_TROCA_ADICIONAL_PRODUTOS_E_SERVICOS_VENDAS' then

       OPEN refvendas scroll FOR
	
		(
		(
		SELECT vendedor,
		       indicador,
			contrato,
			produto,
			p.descricao as nomeproduto,
			filialvenda,
			faturamento,
			CASE WHEN tipobase = 'V' THEN
			  CAST('ABATIMENTO CREDITO TROCA - ADIC. PRODUTO $' AS TEXT)
			ELSE
			  CAST('ABATIMENTO CREDITO TROCA - ADIC. PRODUTO %' AS TEXT)
			END AS evento,
			
			- valor as valor,
			- valor as base,
			tipobase,
			
			- valor as valorindicador,
			- valor as baseindicador,
			tipobaseindicador,
			
			
			cast(null as integer) as nivelcomissao,
			
			percentual_ou_valor,
			percentual_ou_valorindicador,
			
			quantidade,
		    produtomonstruario,
			
			tipocomissao,
			tipocomissaoindicador
			
		FROM
		(
		SELECT vendas.*,
			CASE WHEN cug.comissao is not null THEN cug.tipocomissao
				 WHEN cuc.comissao is not null THEN cuc.tipocomissao
				 WHEN c.comissao   is not null THEN c.tipocomissao
				 WHEN g.comissao   is not null THEN g.tipocomissao
				WHEN cl.comissao  is not null THEN cl.tipocomissao
			END AS tipocomissao,
			
			c.tipocomissaoindicador,
			
			CASE WHEN cug.comissao is not null THEN cug.comissao
				 WHEN cuc.comissao is not null THEN cuc.comissao
				 WHEN c.comissao   is not null THEN c.comissao
				 WHEN g.comissao   is not null THEN g.comissao
				WHEN cl.comissao  is not null THEN cl.comissao
			END AS percentual_ou_valor,
			
			c.comissaoindicador as percentual_ou_valorindicador,
			
			CASE WHEN (tipobase='P') THEN
				  round(((quantidade*precovenda)*creditotroca)/valorvista,2)
			ELSE
				  round(((quantidade*precovenda)*creditotroca)/valorvista,2)
			END AS valor,
			
			CASE WHEN (tipobaseindicador='P') THEN
				  round(((quantidade*precovenda)*creditotroca)/valorvista,2)
			ELSE
				  round(((quantidade*precovenda)*creditotroca)/valorvista,2)
			END AS valorindicador
			
		FROM
		(
			SELECT coalesce(pc.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   pc.produto,
				   pc.precovenda,
				   pc.quantidade,
				  pc.produtomonstruario,
				   u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   cast('CT '||faturados.numero as varchar(25)) as contrato,

				  cast(faturados.numero as varchar) as numerodocumento,
				  cast('CT' as varchar) as tipo,

					   faturados.filialvenda,
					   faturados.faturamento,
					   (faturados.valorprazo + coalesce(faturados.ImpostoRetido,0) + 
                       
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                       
                       - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0)) as valorprazo,
                       
					   (faturados.valorvista + coalesce(faturados.ImpostoRetido,0) + 
                       
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                       
                       - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0)) as valorvista,			
					   faturados.creditotroca


			FROM produtoscontratos pc
				 join contratos faturados
				 on pc.contrato = faturados.numero

				 join (usuarios u 
	                   left join usuarios ui 
					   on u.usuario_indicou = ui.codigo 
	                   ) on coalesce(pc.vendedor, faturados.vendedor) = u.codigo
			where pc.contrato = faturados.numero
			  and coalesce(pc.vendedor, faturados.vendedor) = u.codigo
			  and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
			  AND faturados.origem IS NULL
			  and ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
              
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
              
              )<>0
			  and	(coalesce(faturados.creditotroca,0)<>0)
			
			  and not pc.brinde
			

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
		

                                 /*%FiltroProdutosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
			
			


			ORDER BY pc.produto


		) as vendas
			join (produtos p
				   join (caracteristicas c
							
							 join classes cl
						on c.classe = cl.codigo)
						
				   on p.caracteristica = c.codigo)
			on p.codigo = vendas.produto

			left join comissoesusuariosgrupos cug
			on cug.usuario = vendas.vendedor and cug.grupo = c.grupo

			left join comissoesusuariosclasses cuc
			on cuc.usuario = vendedor and cuc.classe = cl.codigo
			
		   left join


			(
		 SELECT pc.contrato, pc.grupo, gc.comissao, gc.tipocomissao
		FROM ((
			SELECT pc.contrato, pc.grupo, pc.total, (
				SELECT gc.numero
				FROM gruposcomissoes gc
				WHERE ((gc.grupo = pc.grupo) AND (gc.limite >= pc.total))
				ORDER BY gc.limite
				LIMIT 1
				) AS numero
			FROM (
				SELECT pc.contrato, pc.grupo, sum(((((((pc.quantidade * pc.precovenda)
					+ COALESCE(pc.acrescimo, 0)) + COALESCE(pc.frete,
					0)) + COALESCE(pc.seguro, 0)) -
					COALESCE(pc.valordescontoitem, 0)) -
					COALESCE(pc.desconto, 0))) AS total
				FROM (
					SELECT pc.quantidade, pc.precovenda, pc.acrescimo, pc.frete,
						pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto, pc.produto,
						pc.contrato, pc.caracteristica, pc.grupo
					FROM (
						SELECT pc.quantidade, pc.precovenda, pc.acrescimo, pc.frete,
							pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto, pc.produto,
							pc.contrato, pc.caracteristica, c.grupo
						FROM ((
							SELECT pc.quantidade, pc.precovenda, pc.acrescimo,
								pc.frete, pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto,
								pc.produto, pc.contrato, p.caracteristica
							FROM ((

								SELECT pc.quantidade, pc.precovenda, pc.acrescimo,
									pc.frete, pc.seguro, pc.valordescontoitem,
									coalesce(pc.desconto,0) as desconto, pc.produto, pc.contrato
								FROM produtoscontratos pc join contratos faturados on pc.contrato = faturados.numero
								where pc.contrato = faturados.numero
								  and (faturados.faturamento BETWEEN pdatainicial AND pdatafinal)
								  AND (faturados.origem IS NULL)
								  AND ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
                                  
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                                  
                                  )<>0
								  and not pc.brinde
								
                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
		

                                 /*%FiltroProdutosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
								

								) pc JOIN produtos p ON ((pc.produto = p.codigo)))
							WHERE (pc.produto = p.codigo)
							) pc JOIN caracteristicas c ON ((pc.caracteristica = c.codigo)))
						WHERE (pc.caracteristica = c.codigo)
						) pc
					) pc
				GROUP BY pc.contrato, pc.grupo
				) pc
			) pc LEFT JOIN gruposcomissoes gc ON (((pc.grupo = gc.grupo) AND (pc.numero
				= gc.numero))))


		 ) as g

		   on c.grupo = g.grupo
		   and g.contrato = vendas.numerodocumento
		   and vendas.tipo = 'CT'

		where c.classe = cl.codigo
		  and p.caracteristica = c.codigo
		  and p.codigo = vendas.produto
		  and (coalesce(cug.comissao, cuc.comissao, c.comissao, g.comissao, cl.comissao) is not null)


		) AS vendas join produtos p on vendas.produto = p.codigo
		  where (percentual_ou_valor <> 0 or percentual_ou_valorindicador <> 0)
			and vendas.produto = p.codigo
		)

		union all

		(
		SELECT vendedor,
		    indicador,
			contrato,
			cast(servico as bigint) as produto,
			s.descricao as nomeproduto,
			filialvenda,
			faturamento,
			CASE WHEN tipobase = 'V' THEN
			  CAST('ABATIMENTO CREDITO TROCA - ADIC. SERVI?OS $' AS TEXT)
			ELSE
			  CAST('ABATIMENTO CREDITO TROCA - ADIC. SERVI?OS %' AS TEXT)
			END AS evento,
			
			- round(((quantidade*precovenda)*creditotroca)/valorvista,2) as valor,
			- round(((quantidade*precovenda)*creditotroca)/valorvista,2) as base,
			tipobase,
			
			- round(((quantidade*precovenda)*creditotroca)/valorvista,2) as valorindicador,
			- round(((quantidade*precovenda)*creditotroca)/valorvista,2) as baseindicador,
			tipobaseindicador,
			
			cast(null as integer) as nivelcomissao,
			s.comissao as percentual_ou_valor,
			s.comissaoindicador as percentual_ou_valor_indicador,
			quantidade,
		   produtomonstruario,
			s.tipocomissao,
			s.tipocomissaoindicador
		FROM
		(
			SELECT coalesce(sc.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   sc.servico,
				   sc.valorservico as precovenda,
				   sc.quantidade,
				   false as produtomonstruario,
				   u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   cast('CT '||faturados.numero as varchar(25)) as contrato,

				  cast(faturados.numero as varchar) as numerodocumento,
				  cast('CT' as varchar) as tipo,

					   faturados.filialvenda,
					   faturados.faturamento,
					   (faturados.valorprazo + coalesce(faturados.ImpostoRetido,0) + 
                       
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                       
                       - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0)) as valorprazo,
                       
                       
					   (faturados.valorvista + coalesce(faturados.ImpostoRetido,0) + 
                       
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                       
                       - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0)) as valorvista,			
		/*
					   coalesce(faturados.TotalServicos,0) as valorprazo,
					   coalesce(faturados.TotalServicos,0) as valorvista,
					
					   faturados.desconto, */
					   faturados.creditotroca

			FROM servicoscontratos sc
				 join contratos faturados
				 on sc.contrato = faturados.numero

				 join (usuarios u 
	                   left join usuarios ui 
					   on u.usuario_indicou = ui.codigo 
	                   ) on coalesce(sc.vendedor, faturados.vendedor) = u.codigo
				
			where sc.contrato = faturados.numero
			  and coalesce(sc.vendedor, faturados.vendedor) = u.codigo
			  and faturados.faturamento BETWEEN pdatainicial AND pdatafinal
			  AND faturados.origem IS NULL
			  and (faturados.valorvista + coalesce(faturados.ImpostoRetido,0) - coalesce(faturados.frete,0) - coalesce(faturados.seguro,0))<>0
			  and	(coalesce(faturados.creditotroca,0)<>0)

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
			
			
                                 /*%FiltroServicosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(sc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
			

			ORDER BY sc.servico


		) as vendas
			join servicos s
			on s.codigo = vendas.servico

		where s.codigo = vendas.servico
		  and (coalesce(s.comissao,0)<>0 or  coalesce(s.comissaoindicador,0)<>0 )
		)
		);
		
		
		  /* DADOS DO VENDEDOR */
		  loop
			fetch refvendas into tabela;
		
			if tabela.vendedor is null then
			  exit;
			end if;
			
            if coalesce(tabela.percentual_ou_valor,0)<>0 then
			
				if (pListaVendedores='') or
				   (pListaVendedores<>'' and tabela.vendedor in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
				
					  dados.vendedor := tabela.vendedor;		
					  dados.indicador := false;
					  dados.contrato := tabela.contrato;
					  dados.produto := tabela.produto;
					  dados.nomeproduto := tabela.nomeproduto;
					  dados.filialvenda := tabela.filialvenda;
					  dados.faturamento := tabela.faturamento;
					  dados.evento := tabela.evento;
					  dados.valor := tabela.valor;
					  dados.base := tabela.base;
					  dados.tipobase := tabela.tipobase;
					  dados.exibirsomentebase := false;					  
					  dados.nivelcomissao := tabela.nivelcomissao;
					  dados.percentual_ou_valor := tabela.percentual_ou_valor;
					  dados.quantidade := tabela.quantidade;
					  dados.produtomonstruario := tabela.produtomonstruario;
					  dados.tipocomissao := tabela.tipocomissao;			  
					  
				  return next dados;	
				end if;  
			end if;  
				
		  end loop;
			
		  MOVE first FROM refvendas;
		  MOVE relative -1 FROM refvendas;
		
		  /* DADOS DO INDICADOR */
		  loop
			fetch refvendas into tabela;
		
			if tabela.vendedor is null then
			  exit;
			end if;
			
			if tabela.indicador is not null then
               if coalesce(tabela.percentual_ou_valorindicador,0)<>0 then 
			   
					if (pListaVendedores='') or
					   (pListaVendedores<>'' and tabela.indicador in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
				   
						dados.vendedor := tabela.indicador;
						dados.indicador := true;
						dados.contrato := tabela.contrato;
						dados.produto := tabela.produto;
						dados.nomeproduto := tabela.nomeproduto;
						dados.filialvenda := tabela.filialvenda;
						dados.faturamento := tabela.faturamento;
						dados.evento := tabela.evento;
						dados.valor := tabela.valorindicador;
						dados.base := tabela.baseindicador;
						dados.tipobase := tabela.tipobaseindicador;
						dados.exibirsomentebase := false;												
						dados.nivelcomissao := tabela.nivelcomissao;
						dados.percentual_ou_valor := tabela.percentual_ou_valorindicador;
						dados.quantidade := tabela.quantidade;
						dados.produtomonstruario := tabela.produtomonstruario;
						dados.tipocomissao := tabela.tipocomissaoindicador;			  
						dados.vendedorindicado := tabela.vendedor;
						
						return next dados;	
					end if;	
				end if;	
			end if;

		  end loop	;


          


          close refvendas;
		

   /************************************************************************************************************************************************/
   /************************************************************************************************************************************************/
   else
   if pDescricaoInformacao = 'ADICIONAL_PRODUTOS_E_SERVICOS_ESTORNOS' then

       OPEN refvendas scroll FOR
	
	   (
		(
		SELECT vendedor,
		    indicador,
			contrato,
			produto,
			p.descricao as nomeproduto,
			filialvenda,
			devolucao as faturamento,
			CASE WHEN tipobase = 'V' THEN CAST('ESTORNO ADIC. PRODUTO $' AS TEXT)
			ELSE CAST('ESTORNO ADIC. PRODUTO %' AS TEXT) END AS evento,
			
			- valor as valor,
			- valor as base,
			tipobase,
			
			- valor as valorindicador,
			- valor as baseindicador,
			tipobaseindicador,
			
			
			cast(null as integer) as nivelcomissao,
			
			percentual_ou_valor,
			percentual_ou_valorindicador,		
			
			quantidade, 
			produtomonstruario, 
			
			tipocomissao,
			tipocomissaoindicador			
			
		FROM
		(

		SELECT vendas.*,
			CASE WHEN cug.comissao is not null THEN cug.tipocomissao
				 WHEN cuc.comissao is not null THEN cuc.tipocomissao
				 WHEN c.comissao   is not null THEN c.tipocomissao
				 WHEN g.comissao   is not null THEN g.tipocomissao
				WHEN cl.comissao  is not null THEN cl.tipocomissao
			END AS tipocomissao,
			
			c.tipocomissaoindicador,
		
			CASE WHEN cug.comissao is not null THEN cug.comissao
				 WHEN cuc.comissao is not null THEN cuc.comissao
				 WHEN c.comissao   is not null THEN c.comissao
				 WHEN g.comissao   is not null THEN g.comissao
				WHEN cl.comissao  is not null THEN cl.comissao
			END AS percentual_ou_valor,
			
			c.comissaoindicador as percentual_ou_valorindicador,
			
			CASE WHEN (tipobase='P') THEN
						 valorprazo
			ELSE
						 valorvista
			END AS valor,
			
			CASE WHEN (tipobaseindicador='P') THEN
						 valorprazo
			ELSE
						 valorvista
			END AS valorindicador
			
			
		FROM
		(
		  (
			SELECT coalesce(pc.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
			       u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   cast('CT '||faturados.contrato as varchar(25)) as contrato,
				   cast(faturados.contrato as varchar) as numerodocumento,
				   cast('CT' as varchar) as tipo,
				   faturados.filialvenda,
				   faturados.produto,
				   faturados.filial,
				   faturados.valorvista,
				   faturados.valorprazo,
				   faturados.quantidade,
				   faturados.produtomonstruario,
				   faturados.devolucao
			FROM produtoscontratos pc,  (usuarios u 
										   left join usuarios ui 
										   on u.usuario_indicou = ui.codigo 
										   ),
			
						(
						 ((
					  SELECT cv.contrato,
								   ct.filialvenda,
								   cv.produto,
									 cv.filial,
								   coalesce(cv.valorvista,0) - coalesce(cv.frete,0) - coalesce(cv.seguro,0) as valorvista,
									 coalesce(cv.valorprazo,0) - coalesce(cv.frete,0) - coalesce(cv.seguro,0) as  valorprazo,
							   cv.quantidade,
							 (select pc.produtomonstruario
							  from produtoscontratos pc
							  where pc.contrato = ct.numero
								and pc.produto = cv.produto
								and pc.filial = cv.filial limit 1) as produtomonstruario,
									 cv.devolucao,
							 ct.vendedor

							 FROM (contratos ct join contratosdevolvidos cv on ct.numero = cv.contrato)
							 WHERE (cv.devolucao BETWEEN pdatainicial AND pdatafinal)
						 AND cv.tipo='D' and cv.produto is not null

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   ct.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   ct.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   ct.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   ct.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
							
							
						 )
						 union ALL
						 (
						select pc.contrato,
									 ct.filialvenda,
							   pc.produto,
							   pc.filial,
							   round(((pc.quantidade*pc.precovenda) * (ct.valorvista-(coalesce(ct.TotalServicos,0)-coalesce(ct.ImpostoRetido,0)) - coalesce(ct.frete,0) - coalesce(ct.seguro,0)) )/((ct.valorvista-(coalesce(ct.TotalServicos,0)-coalesce(ct.ImpostoRetido,0)) - coalesce(ct.frete,0) - coalesce(ct.seguro,0))+coalesce(ct.desconto,0)),2) as valorvista,
							   /* Note que a linha abaixo a divis?o ? pelo valor a vista. Isto mesmo. */
							   round(((pc.quantidade*pc.precovenda) * (ct.valorPrazo-(coalesce(ct.TotalServicos,0)-coalesce(ct.ImpostoRetido,0)) - coalesce(ct.frete,0) - coalesce(ct.seguro,0)) )/((ct.valorvista-(coalesce(ct.TotalServicos,0)-coalesce(ct.ImpostoRetido,0)) - coalesce(ct.frete,0) - coalesce(ct.seguro,0))+ct.desconto),2) as valorPrazo,
							   pc.quantidade,
							   pc.produtomonstruario,
							   cancelados.datapagto as devolucao,
							   ct.vendedor
						from (select distinct ct.numero, p.datapagto
							  from contratos ct, parcelas p
							  where ct.numero=p.contrato and
									ct.situacao='C' and
									not exists (select p2.numero
												from parcelas p2
										  where p2.contrato = ct.numero and
										  p2.tipopagto<>'E') and
									p.datapagto between pdatainicial AND pdatafinal and
								not exists (select cd.contrato
									from contratosdevolvidos cd
									where cd.contrato = ct.numero and
									  cd.tipo = 'D')
							  ) as cancelados, contratos ct, produtoscontratos pc
						  where cancelados.numero = ct.numero and
								cancelados.numero = pc.contrato

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   ct.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   ct.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   ct.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   ct.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
							
						 )
						 )
						) AS faturados
			WHERE pc.contrato = faturados.contrato and
				  pc.produto = faturados.produto and
				  pc.filial = faturados.filial
			  and coalesce(pc.vendedor, faturados.vendedor) = u.codigo
			  and not pc.brinde

								
                                 /*%FiltroProdutosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
								

			ORDER BY pc.produto
		   )
		   union all
		   (
			SELECT coalesce(pdf.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   u.tipocomissao as tipobase,
				   ui.tipocomissao as tipobaseindicador,
				   faturados.nota as contrato,
				
				   cast(faturados.dadofiscal as varchar) as numerodocumento,
				   cast('DF' as varchar) as tipo,
				
				   faturados.filialvenda,
				   pdf.produto,
				   pdf.filial,
				   faturados.valorvista,
				   faturados.valorprazo,
				   pdf.quantidade,
				   pdf.produtomonstruario,
				   faturados.data as devolucao

			FROM produtosdadosfiscais pdf, 	(usuarios u 
											   left join usuarios ui 
											   on u.usuario_indicou = ui.codigo 
											   ),
					   
						(
						SELECT
									   df.numero as dadofiscal,
									   cast(coalesce('NF '||cast(n.serie as varchar)||' '||cast(n.numero as varchar),
													 'CP '||cast(c.maquina as varchar)||' '||cast(c.intervensao as varchar)||' '||cast(c.numero as varchar)) as varchar(25)) as nota,    			       df.filialvenda,
							   df.data,
							   df.valortotal as valorprazo,
							   df.valorvista,
									   df.vendedor

									   FROM dadosfiscais df left join notas n on df.numero = n.dadofiscal
																  left join cupons c on df.numero = c.dadofiscal
									   WHERE (df.datacancelamento BETWEEN pdatainicial AND pdatafinal)
										 and not coalesce(df.notavinculada,false)
										 AND df.contrato is null
										 /* Alterado para não considerar notas canceladas sem contrato  */
                                         and /*case when c.dadofiscal is not null then*/ df.situacao='N' /*/else true end*/
											
											and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
											
                   					         /*%FiltroContratos*/
											 and case when pListaAgentes<>'' THEN
											   df.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaConceitos<>'' then
											   df.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
											 else
											   true
											 end

											 and case when pListaFiliais<>'' then
											   df.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
											 else
											   true
											 end

											 and case when pListaGruposFiliais<>'' then
											   df.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
											 else
											   true
											 end
									
									
									   ORDER BY df.numero
						) AS faturados
			WHERE pdf.dadofiscal = faturados.dadofiscal
			  and coalesce(pdf.vendedor, faturados.vendedor) = u.codigo
			  and not coalesce(pdf.brinde,false)

			
                                 /*%FiltroProdutosDadosFiscais
                                 and case when pListaVendedores<>'' then
                                   coalesce(pdf.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
			

			ORDER BY pdf.produto

		   )
		) as vendas
			join (produtos p
				   join (caracteristicas c
							
							 join classes cl
						on c.classe = cl.codigo)
						
				   on p.caracteristica = c.codigo)
			on p.codigo = vendas.produto

			left join comissoesusuariosgrupos cug
			on cug.usuario = vendas.vendedor and cug.grupo = c.grupo

			left join comissoesusuariosclasses cuc
			on cuc.usuario = vendedor and cuc.classe = cl.codigo
			
		   left join


			(
		 SELECT pc.contrato, pc.grupo, gc.comissao, gc.tipocomissao
		FROM ((
			SELECT pc.contrato, pc.grupo, pc.total, (
				SELECT gc.numero
				FROM gruposcomissoes gc
				WHERE ((gc.grupo = pc.grupo) AND (gc.limite >= pc.total))
				ORDER BY gc.limite
				LIMIT 1
				) AS numero
			FROM (
				SELECT pc.contrato, pc.grupo, sum(((((((pc.quantidade * pc.precovenda)
					+ COALESCE(pc.acrescimo, 0)) + COALESCE(pc.frete,
					0)) + COALESCE(pc.seguro, 0)) -
					COALESCE(pc.valordescontoitem, 0)) -
					COALESCE(pc.desconto, 0))) AS total
				FROM (
					SELECT pc.quantidade, pc.precovenda, pc.acrescimo, pc.frete,
						pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto, pc.produto,
						pc.contrato, pc.caracteristica, pc.grupo
					FROM (
						SELECT pc.quantidade, pc.precovenda, pc.acrescimo, pc.frete,
							pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto, pc.produto,
							pc.contrato, pc.caracteristica, c.grupo
						FROM ((
							SELECT pc.quantidade, pc.precovenda, pc.acrescimo,
								pc.frete, pc.seguro, pc.valordescontoitem, coalesce(pc.desconto,0) as desconto,
								pc.produto, pc.contrato, p.caracteristica
							FROM ((

								SELECT pc.quantidade, pc.precovenda, pc.acrescimo,
									pc.frete, pc.seguro, pc.valordescontoitem,
									coalesce(pc.desconto,0) as desconto, pc.produto, pc.contrato
								FROM produtoscontratos pc join contratos faturados on pc.contrato = faturados.numero
								where pc.contrato = faturados.numero
								  and (faturados.faturamento BETWEEN pdatainicial AND pdatafinal)
								  AND (faturados.origem IS NULL)
								  AND ((faturados.valorvista-(coalesce(faturados.TotalServicos,0)-coalesce(faturados.ImpostoRetido,0)))+
                                  
                                             (coalesce(faturados.desconto,0) + coalesce((select sum(pc2.valordescontoitem) 
                                                              from produtoscontratos pc2 
                                                              where pc2.contrato = faturados.numero),0))
                                  
                                  )<>0						
								  and not pc.brinde
								
                                 /*%FiltroProdutosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(pc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   faturados.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   faturados.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   faturados.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   faturados.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
									

								) pc JOIN produtos p ON ((pc.produto = p.codigo)))
							WHERE (pc.produto = p.codigo)
							) pc JOIN caracteristicas c ON ((pc.caracteristica = c.codigo)))
						WHERE (pc.caracteristica = c.codigo)
						) pc
					) pc
				GROUP BY pc.contrato, pc.grupo
				) pc
			) pc LEFT JOIN gruposcomissoes gc ON (((pc.grupo = gc.grupo) AND (pc.numero
				= gc.numero))))


		 ) as g

		   on c.grupo = g.grupo
		   and g.contrato = vendas.numerodocumento
		   and vendas.tipo = 'CT'

		where c.classe = cl.codigo
		  and p.caracteristica = c.codigo
		  and p.codigo = vendas.produto
		  and (coalesce(cug.comissao, cuc.comissao, c.comissao, g.comissao, cl.comissao) is not null)

		) AS adicionalprodutos_estornos join produtos p on adicionalprodutos_estornos.produto = p.codigo
		where (coalesce(percentual_ou_valor,0) <> 0 or coalesce(percentual_ou_valorindicador,0) <> 0)
		  and adicionalprodutos_estornos.produto = p.codigo
		)

		union all


		 (
		 
			SELECT coalesce(sc.vendedor, faturados.vendedor) as vendedor,
			       ui.codigo as indicador,
				   cast('CT '||faturados.contrato as varchar(25)) as contrato,
				   cast(faturados.servico as bigint) as produto,
				   s.descricao as nomeproduto,
				   faturados.filialvenda,
				   faturados.devolucao,
				
				   CASE WHEN u.tipocomissao = 'V' THEN CAST('ESTORNO ADIC. SERVI?OS $' AS TEXT)
				   ELSE CAST('ESTORNO ADIC. SERVI?OS %' AS TEXT)
				   END AS evento,

				   - CASE WHEN (u.tipocomissao='P') THEN
					   faturados.valorprazo
					 ELSE
					   faturados.valorvista
					 END AS valor,
			 
				  - CASE WHEN (u.tipocomissao='P') THEN
					  faturados.valorprazo
					ELSE
					  faturados.valorvista
					END AS base,
					u.tipocomissao as tipobase,
			

				   - CASE WHEN (ui.tipocomissao='P') THEN
					   faturados.valorprazo
					 ELSE
					   faturados.valorvista
					 END AS valorindicador,
			
				  - CASE WHEN (ui.tipocomissao='P') THEN
					  faturados.valorprazo
					ELSE
					  faturados.valorvista
					END AS baseindicador,					
					
					ui.tipocomissao as tipobaseindicador,
					
					cast(null as integer) as nivelcomissao,
					s.comissao as percentual_ou_valor,
					s.comissaoindicador as percentual_ou_valorindicador,
					
					faturados.quantidade,
					faturados.produtomonstruario,
					s.tipocomissao,
					s.tipocomissaoindicador
					
			FROM servicoscontratos sc, 	 (usuarios u 
										   left join usuarios ui 
										   on u.usuario_indicou = ui.codigo 
										   ), servicos s,
						
						 ((
						   SELECT cv.contrato,
								  ct.filialvenda,
								  cv.servico,
								  cv.filial,
								  coalesce(cv.valorvista,0) + coalesce(cv.impostoretido, 0) as valorvista,
								  coalesce(cv.valorprazo,0) + coalesce(cv.impostoretido, 0) as valorprazo,
								  cv.quantidade,
								  false as produtomonstruario,
								  cv.devolucao,
								  ct.vendedor

						 FROM (contratos ct join contratosdevolvidos cv on ct.numero = cv.contrato)
						 WHERE (cv.devolucao BETWEEN pdatainicial AND pdatafinal) AND
							   cv.tipo='D' and cv.servico is not null

							
                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   ct.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   ct.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   ct.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   ct.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
							
						 )
						 union ALL
						 (
						  select sc.contrato,
								 ct.filialvenda,
								 sc.servico,
								 ct.filialvenda as filial,				
								 (sc.quantidade*sc.valorservico) as valorvista,
								 (sc.quantidade*sc.valorservico) as valorprazo,								
								 sc.quantidade,
								 false as produtomonstruario,
								 cancelados.datapagto as devolucao,
								 coalesce(sc.vendedor,ct.vendedor) as vendedor
								
						  from (select distinct ct.numero, p.datapagto
								from contratos ct, parcelas p
								where ct.numero=p.contrato
								  and ct.situacao='C'
								  and p.datapagto between pdatainicial AND pdatafinal
								
								  and not exists (select p2.numero
												  from parcelas p2
												  where p2.contrato = ct.numero
													and p2.tipopagto<>'E')
													
								
								  and not exists (select cd.contrato
												  from contratosdevolvidos cd
												  where cd.contrato = ct.numero
													and cd.tipo = 'D')
													
							   ) as cancelados, contratos ct, servicoscontratos sc
						  where cancelados.numero = ct.numero
							and cancelados.numero = sc.contrato

                                  /*%FiltroContratos*/
                                 and case when pListaAgentes<>'' THEN
                                   ct.agente in (select * from lista_int(cast('{'||pListaAgentes||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaConceitos<>'' then
                                   ct.cliente IN (SELECT codigo FROM clientes WHERE conceito IN  (select * from lista_int(cast('{'||pListaConceitos||'}' as integer[]))))
                                 else
                                   true
                                 end

                                 and case when pListaFiliais<>'' then
                                   ct.filialvenda IN (select * from lista_int(cast('{'||pListaFiliais||'}' as integer[])))
                                 else
                                   true
                                 end

                                 and case when pListaGruposFiliais<>'' then
                                   ct.filialvenda IN (SELECT fgf.filial FROM filiaisgruposfiliais fgf WHERE fgf.grupo in (select * from lista_int(cast('{'||pListaGruposFiliais||'}' as integer[]))))
                                 else
                                   true
                                 end
							
						 )
						) AS faturados
			WHERE sc.contrato = faturados.contrato
			  and sc.servico = faturados.servico
			  and sc.servico = s.codigo
			  and coalesce(sc.vendedor, faturados.vendedor) = u.codigo
			  and (coalesce(s.comissao,0)<>0 or coalesce(s.comissaoindicador,0)<>0)

								
                                 /*%FiltroServicosContratos
                                 and case when pListaVendedores<>'' then
                                   coalesce(sc.vendedor,faturados.vendedor) in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))
                                 else
                                   true
                                 end
								 */
								

			ORDER BY sc.servico
		 )
		);
		
		  /* DADOS DO VENDEDOR */
		  loop
			fetch refvendas into tabela;
		
			if tabela.vendedor is null then
			  exit;
			end if;
			
            if coalesce(tabela.percentual_ou_valor,0)<>0 then
				if (pListaVendedores='') or
				   (pListaVendedores<>'' and tabela.vendedor in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
			
					  dados.vendedor := tabela.vendedor;		
					  dados.indicador := false;
					  dados.contrato := tabela.contrato;
					  dados.produto := tabela.produto;
					  dados.nomeproduto := tabela.nomeproduto;
					  dados.filialvenda := tabela.filialvenda;
					  dados.faturamento := tabela.faturamento;
					  dados.evento := tabela.evento;
					  dados.valor := tabela.valor;
					  dados.base := tabela.base;
					  dados.tipobase := tabela.tipobase;
					  dados.exibirsomentebase := false;					  
					  dados.nivelcomissao := tabela.nivelcomissao;
					  dados.percentual_ou_valor := tabela.percentual_ou_valor;
					  dados.quantidade := tabela.quantidade;
					  dados.produtomonstruario := tabela.produtomonstruario;
					  dados.tipocomissao := tabela.tipocomissao;			  
					  
					  return next dados;	
				end if;	  
			end if;  
				
		  end loop;
			
		  MOVE first FROM refvendas;
		  MOVE relative -1 FROM refvendas;
		
		  /* DADOS DO INDICADOR */
		  loop
			fetch refvendas into tabela;
		
			if tabela.vendedor is null then
			  exit;
			end if;
			
			if tabela.indicador is not null then
               if coalesce(tabela.percentual_ou_valorindicador,0)<>0 then 
			   
					if (pListaVendedores='') or
					   (pListaVendedores<>'' and tabela.indicador in (select * from lista_int(cast('{'||pListaVendedores||'}' as integer[])))) then 
				   
						dados.vendedor := tabela.indicador;
						dados.indicador := true;
						dados.contrato := tabela.contrato;
						dados.produto := tabela.produto;
						dados.nomeproduto := tabela.nomeproduto;
						dados.filialvenda := tabela.filialvenda;
						dados.faturamento := tabela.faturamento;
						dados.evento := tabela.evento;
						dados.valor := tabela.valorindicador;
						dados.base := tabela.baseindicador;
						dados.tipobase := tabela.tipobaseindicador;
					    dados.exibirsomentebase := false;						
						dados.nivelcomissao := tabela.nivelcomissao;
						dados.percentual_ou_valor := tabela.percentual_ou_valorindicador;
						dados.quantidade := tabela.quantidade;
						dados.produtomonstruario := tabela.produtomonstruario;
						dados.tipocomissao := tabela.tipocomissaoindicador;			  
						dados.vendedorindicado := tabela.vendedor;
						
						return next dados;	
					end if;	
				end if;					
			end if;

		  end loop	;


          


          close refvendas;
		

			
   end if;
   end if;
   end if;			
   end if;		
   end if;
   end if;

END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100 ROWS 1000;

ALTER FUNCTION public.dadoscomissoes (pdescricaoinformacao varchar, pdatainicial date, pdatafinal date, plistavendedores varchar, plistaagentes varchar, plistaconceitos varchar, plistafiliais varchar, plistagruposfiliais varchar, pincluirdevolucoessemcontrato boolean)
  OWNER TO tecsoft;