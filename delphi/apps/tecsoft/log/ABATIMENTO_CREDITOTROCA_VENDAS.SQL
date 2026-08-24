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
			
		   )

           UNION all

          (
		  
				 
			SELECT vendedor,
				   nota as contrato,
				   filialvenda,
				   data as faturamento,
				   CASE WHEN avista = 't' THEN 'ABATIMENTO CREDITO TROCA - VENDA A VISTA'
						WHEN ( avista = 'f' AND datavencto>(data /*faturamento*/+coalesce(toleranciaentrada,0)) ) THEN 'ABATIMENTO CREDITO TROCA - VENDA A PRAZO'
				   ELSE 'ABATIMENTO CREDITO TROCA - VENDA ENTRADA' END AS evento,
				   SUM(valorvencto) AS valor
				 
				 			 
				 
          FROM
            (
            SELECT vendas.vendedor,
                   vendas.nota,
                   vendas.data,
                   vendas.filialvenda,
                   round(((vendas.valorvista * vendas.percvendedor)/100),2) as valorvista,
                   round(((vendas.valortotal * vendas.percvendedor)/100),2) as valorprazo,
				   
				   round((( vdf.valorvencto * vendas.percvendedor)/100),2) as valorvencto,
                                                     

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
                                                 
                                                 and case when c.dadofiscal is not null then df.situacao='N' else true end
                                                 
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
							
            WHERE vdf.dadofiscal = vendas.dadofiscal and vdf.formapagamento = 'T'
            ORDER BY vendas.dadofiscal, vdf.datavencto
            ) AS base 			
			GROUP BY vendedor, contrato, filialvenda, faturamento, evento, toleranciaentrada, avista


         		   
		   )	
			
			
		  ) as base join (usuarios u 
						  left join usuarios ui 
						  on u.usuario_indicou = ui.codigo 
						 ) on base.vendedor = u.codigo; 
