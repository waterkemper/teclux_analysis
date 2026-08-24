CREATE OR REPLACE FUNCTION public.situacao_romaneio (
  p_romaneio integer
)
RETURNS varchar AS
$body$
DECLARE
  vSituacao varchar;
BEGIN

  select 

           /* O romaneio esta pago? */  

           case when r.datapagto is not null then cast('FECHADA' as char(20))
		        
				
				when r.tipo = 'N' THEN
				
				               /* Primeiramente Aberto...ao bipar: Confirmado ou Confirmado Parcial...só quando confirmado total libera para preencher o usuário  */
                               case when r.usuariotransito is null and 
							             r.datahoratransito is  null then 


                                     case when (
                                                  select coalesce(
                                                  (select false
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
														  
                                                  where rn.romaneio = r.numero and
												    not coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N' limit 1)
                                                   ,

                                                  (select true
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
													   
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and 
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
														  
                                                  where rn.romaneio = r.numero and
                                                    coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N'
                                                    limit 1), false)
                                               ) then                                                                                             
                                                 cast('CONFIRMADA' as char(20))
                                                 

                                          /* Esta parcialmente confirmada? */

                                          when (
                                                  select coalesce(
                                                  
                                                  (select true
                                                  from  romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero

                                                       left join volumesdadosfiscaisconferencia vdfc
                                                        on vdfc.dadofiscal = rn.dadofiscal and 
														   vdfc.tipo = 'ROS' and
														   vdfc.codigo=cast(rn.romaneio as varchar(20))
                                                  
                                                  where rn.romaneio = r.numero                                                    
												    and not coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N'
													
                                                  limit 1
                                                    ) and
                                                  (
                                                  select true
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
													   
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and 
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
                                                 
                                                  where rn.romaneio = r.numero
												    and coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N'
													
                                                  limit 1),false)
                                               ) then                                                 
                                                 cast('CONFIRMADA PARCIAL' as char(20))
                                            /* não entregue e nem parcial, mas com usuario e data de transito */ 

                                          else
											 coalesce((select cast('ABERTA' as char(20))
													   from romaneiosnotas rn
															join dadosfiscais df
															on rn.dadofiscal = df.numero
													   where rn.romaneio = r.numero 
														 and df.situacao = 'N' limit 1),
													  cast('CANCELADO' as char(20)))
										  
                                     end     
							   
				
				               /* Foi liberado a entrega? Para chegar neste ponto já foi totalmente bipado */
							   /* Então, poderá assumir: Transito, Entregue, Entregue Parcial */
							 				      
                                    when r.usuariotransito is not null and 
							             r.datahoratransito is  not null then  

                                     case when (
                                                  select coalesce(
                                                  (select false
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
														  
                                                  where rn.romaneio = r.numero
                                                    and df.situacao = 'N'
                                                    and rn.data_hora_recebimento is null 
                                                    and rn.justificativa_entrega is null limit 1)
                                                   ,

                                                  (select true
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
													   
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and 
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
														  
                                                  where rn.romaneio = r.numero

                                                    and df.situacao = 'N'
                                                    and (rn.data_hora_recebimento is not null or
                                                         rn.justificativa_entrega is not null) limit 1), false)
                                               ) then                                                                                             
                                                 cast('ENTREGUE' as char(20))
                                                 

                                          /* Esta parcialmente entregue? */

                                          when (
                                                  select coalesce(
                                                  
                                                  (select true
                                                  from  romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero

                                                       left join volumesdadosfiscaisconferencia vdfc
                                                        on vdfc.dadofiscal = rn.dadofiscal and 
														   vdfc.tipo = 'ROS' and
														   vdfc.codigo=cast(rn.romaneio as varchar(20))
                                                  
                                                  where rn.romaneio = r.numero                                                    
                                                    and df.situacao = 'N'
                                                    and (rn.data_hora_recebimento is not null  or
                                                         rn.justificativa_entrega is not null) limit 1
                                                    ) and
                                                  (
                                                  select true
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
													   
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and 
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
                                                 
                                                  where rn.romaneio = r.numero
                                                    and df.situacao = 'N'
                                                    and rn.data_hora_recebimento is null 
                                                    and rn.justificativa_entrega is null limit 1),false)
                                               ) then                                                 
                                                 cast('ENTREGUE PARCIAL' as char(20))

                                            /* não entregue e nem parcial, mas com usuario e data de transito */ 

                                          else 
										  
										  
											 coalesce((select cast('EM TRÂNSITO' as char(20))
													   from romaneiosnotas rn
															join dadosfiscais df
															on rn.dadofiscal = df.numero
													   where rn.romaneio = r.numero 
														 and df.situacao = 'N' limit 1),
													  cast('CANCELADO' as char(20)))
										  
                                    end     

                                    /* sem usuario e data de transito */

                               end
				
				
				
                when r.tipo = 'T' THEN 				

                /* a saída do romaneio esta totalmente conferida (bipada) ? */

                    case when (

                               select coalesce(
					  					               
                                  (select false
                                   from romaneiosnotas rn
                                       join dadosfiscais df
                                       on rn.dadofiscal = df.numero
									   left join volumesdadosfiscaisconferencia vdfc
                                       on vdfc.dadofiscal = rn.dadofiscal and 
                                          vdfc.tipo='ROS' and 
                                          vdfc.codigo=cast(rn.romaneio as varchar(20))									   
										  
                                   where  df.situacao = 'N'
                                     and not coalesce(vdfc.conferido,false)                                    
                                     and rn.romaneio = r.numero
                                     limit 1)
									
                                   ,
								   
                                  (select true
                                   from romaneiosnotas rn
                                       join dadosfiscais df
                                       on rn.dadofiscal = df.numero
									   left join volumesdadosfiscaisconferencia vdfc
                                       on vdfc.dadofiscal = rn.dadofiscal and 
                                          vdfc.tipo='ROS' and 
                                          vdfc.codigo=cast(rn.romaneio as varchar(20))									   
										  
                                   where  df.situacao = 'N'
                                     and coalesce(vdfc.conferido,false)                                    
                                     and rn.romaneio = r.numero
                                     limit 1), false))
                         then 

                                 /* esta conferido parcial? (não vai ocorrer esta situação, só fazem um volume por NF na transferência. */

                           case  when (
                                          select coalesce(
                                          (select true
                                          from volumesdadosfiscaisconferencia vdfc
                                               join romaneiosnotas rn
                                               on vdfc.dadofiscal = rn.dadofiscal
                                               
                                               join dadosfiscais df
                                                     join notaspag np
                                                     on df.numero = np.dadofiscalreferenciado and coalesce(np.vendatransferencia ,false)
                                               on vdfc.dadofiscal = df.numero
                                               
                                          
                                          where vdfc.tipo='ROE'

                                            and df.situacao = 'N'

                                            and np.situacao = 'N'
                                            and vdfc.codigo=cast(r.numero as varchar(20))
                                            and coalesce(vdfc.conferido,false) limit 1
                                            ) and
                                          (
                                          select true
                                          from volumesdadosfiscaisconferencia vdfc
                                                               join romaneiosnotas rn

                                                                   join dadosfiscais df

                                                                   on rn.dadofiscal = df.numero

                                                               
                                                               on vdfc.dadofiscal = rn.dadofiscal
                                          
                                          where vdfc.tipo='ROE'

                                            and df.situacao = 'N'       

                                            and vdfc.codigo=cast(r.numero as varchar(20))
                                            and (not coalesce(vdfc.conferido,false) or
                                                    (coalesce(vdfc.conferido,false) and
                                                     not exists (select np.numero 
                                                                 from notaspag np 
                                                                 where np.dadofiscalreferenciado = vdfc.dadofiscal 
                                                                   and coalesce(np.vendatransferencia,false)

                                                                   and np.situacao = 'N'))
                                                ) limit 1

                                          ),false)
                                          
                                          
                                       ) then  
                                       
                                      cast('ENTREGUE PARCIAL' as char(20)) 
--                                      cast('CONFIRMADA' as char(20))                                   /* Foi dado a entrada em outra filial diferente da do destino? Registro ROP */ 



                            /* o ROE esta totalmente conferido? */

                                 when (
                                          select coalesce(

                                          (select false
                                          from volumesdadosfiscaisconferencia vdfc
                                               join romaneiosnotas rn                                                    
                                                    join dadosfiscais df
                                                    on rn.dadofiscal = df.numero
                                               on vdfc.dadofiscal = rn.dadofiscal
                                          where vdfc.tipo='ROE'

                                            and df.situacao = 'N'

                                            and vdfc.codigo=cast(r.numero as varchar(20))

                                             /* não conferido ou conferido e sem nota  */

                                            and (not coalesce(vdfc.conferido,false) or
                                                    (coalesce(vdfc.conferido,false) and
                                                     not exists (select np.numero 
                                                                 from notaspag np 
                                                                 where np.dadofiscalreferenciado = vdfc.dadofiscal 
                                                                   and coalesce(np.vendatransferencia,false)))
                                                )   
                                                        
                                            
                                            limit 1)
                                           ,

                                          (select true
                                          from volumesdadosfiscaisconferencia vdfc
                                               join romaneiosnotas rn
                                               on vdfc.dadofiscal = rn.dadofiscal
                                               join dadosfiscais df

                                               
                                                     join notaspag np
                                                     on df.numero = np.dadofiscalreferenciado and coalesce(np.vendatransferencia ,false)
                                               on vdfc.dadofiscal = df.numero
                                               
                                          
                                          where vdfc.tipo='ROE'

                                            and df.situacao = 'N'

                                            and np.situacao = 'N'

                                            and vdfc.codigo=cast(r.numero as varchar(20))
                                            and coalesce(vdfc.conferido,false) limit 1), false)
                                            
                                         ) then 
                                         
                                      cast('ENTREGUE' as char(20))

                                     


                                 when (
                                          select coalesce(

                                          (select true
                                          from volumesdadosfiscaisconferencia vdfc
                                               join romaneiosnotas rn

                                                    join dadosfiscais df

                                                    on rn.dadofiscal = df.numero
                                               on vdfc.dadofiscal = rn.dadofiscal
                                               
                                          where vdfc.tipo='ROP' /* serie um ROE, mas vista que é de uma filial de destino diferente é ROP Romeaneio de Passagem */

                                            and df.situacao = 'N'       

                                            and vdfc.codigo=cast(r.numero as varchar(20))

                                                                /* Tem um ROP e não tem RPS (saída) */

                                            and not exists (select vdfc_rps.codigo

                                                            from volumesdadosfiscaisconferencia vdfc_rps

                                                            where vdfc_rps.tipo = 'RPS'

                                                              and vdfc_rps.codigo = vdfc.codigo

                                                              and vdfc_rps.dadofiscal = vdfc.dadofiscal

                                                              and vdfc_rps.numerovolume = vdfc.numerovolume 

                                                              and vdfc_rps.nrvolume = vdfc.nrvolume

                                                              and vdfc_rps.datahora_inclusao >= vdfc.datahora_inclusao)
                                            limit 1),false)
                                         ) then 
                                         
                                      cast('PASSAGEM' as char(20)) 
                                else cast('EM TRÂNSITO' as char(20))
                            end     
                          
                      

                /* o romaneio esta parcialmente conferido? */
				
				/*
				
                         when (
                                                  select coalesce(
                                                  (select false
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
														  
                                                  where rn.romaneio = r.numero and
												    not coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N' limit 1)
                                                   ,

                                                  (select true
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
													   
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and 
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
														  
                                                  where rn.romaneio = r.numero and
                                                    coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N'
                                                    limit 1), false)
                                               ) then                                                                                             
                                                 cast('CONFIRMADA' as char(20))
												 */
                                                 

                                          /* Esta parcialmente confirmada? */

                             when (
                                                  select coalesce(
                                                  
                                                  (select true
                                                  from  romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero

                                                       left join volumesdadosfiscaisconferencia vdfc
                                                        on vdfc.dadofiscal = rn.dadofiscal and 
														   vdfc.tipo = 'ROS' and
														   vdfc.codigo=cast(rn.romaneio as varchar(20))
                                                  
                                                  where rn.romaneio = r.numero                                                    
												    and not coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N'
													
                                                  limit 1
                                                    ) and
                                                  (
                                                  select true
                                                  from romaneiosnotas rn
                                                       join dadosfiscais df
                                                       on rn.dadofiscal = df.numero
													   
                                                       left join volumesdadosfiscaisconferencia vdfc
                                                       on vdfc.dadofiscal = rn.dadofiscal and 
													      vdfc.tipo = 'ROS' and 
														  vdfc.codigo=cast(rn.romaneio as varchar(20))
                                                 
                                                  where rn.romaneio = r.numero
												    and coalesce(vdfc.conferido,false)  
                                                    and df.situacao = 'N'
													
                                                  limit 1),false)
                                               ) then                                                 
                                                 cast('CONFIRMADA PARCIAL' as char(20))
                                            /* não entregue e nem parcial, mas com usuario e data de transito */ 

                             else
											 coalesce((select cast('ABERTA' as char(20))
													   from romaneiosnotas rn
															join dadosfiscais df
															on rn.dadofiscal = df.numero
													   where rn.romaneio = r.numero 
														 and df.situacao = 'N' limit 1),
													  cast('CANCELADO' as char(20)))
										  
                             end     
				

                  
           end as descricaosituacao into vSituacao

  FROM romaneios r
  WHERE r.numero = p_romaneio;

  RETURN vSituacao;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.situacao_romaneio (p_romaneio integer)
  OWNER TO tecsoft;