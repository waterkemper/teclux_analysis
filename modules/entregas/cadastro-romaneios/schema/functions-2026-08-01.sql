-- Snapshot somente leitura; definições retornadas por pg_get_functiondef em 2026-08-01.

-- public.atualizar_situacao_romaneio(p_romaneio integer)
CREATE OR REPLACE FUNCTION public.atualizar_situacao_romaneio(p_romaneio integer)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE
  vSituacao varchar;
BEGIN
  vSituacao := situacao_romaneio(p_romaneio);
  update romaneios set situacao_romaneio = vSituacao where romaneios.numero = p_romaneio;
  RETURN vSituacao;
END;
$function$
;

-- public.documentospag_proximonumero()
CREATE OR REPLACE FUNCTION public.documentospag_proximonumero()
 RETURNS integer
 LANGUAGE sql
AS $function$SELECT NEXTVAL('documentospag_proximonumero')::INTEGER;$function$
;

-- public.ehnotafiscalsaidatransferencia(integer)
CREATE OR REPLACE FUNCTION public.ehnotafiscalsaidatransferencia(integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
DECLARE
   CodigoFiscal   ALIAS FOR $1;
   vRetorno Boolean;

BEGIN
    vretorno := CodigoFiscal in (select codigo from codigosfiscais WHERE descricao ilike '%TRANSF%');
    return vRetorno;
END;
$function$
;

-- public.incluirconferenciadocumentos(ptipo character varying, pcodigo character varying, pfilial integer, pdadofiscal integer, pcodigousuario integer)
CREATE OR REPLACE FUNCTION public.incluirconferenciadocumentos(ptipo character varying, pcodigo character varying, pfilial integer, pdadofiscal integer, pcodigousuario integer)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
  j json;
BEGIN
  
   
insert into conferencia
(
  tipo,
  codigo,
  data,
  usuario,
  filial
 )
 values
 (
  pTipo,
  pCodigo,
  (select r.emissao from romaneios r where r.numero = cast(pCodigo as integer)),
  pCodigoUsuario,
  pFilial  
 )
 ON CONFLICT (tipo,  codigo) DO NOTHING;  
 
 
 select json_agg(row_to_json(vdf.*)) into j
 from
 ( select * from volumesdadosfiscais where dadofiscal = pDadofiscal limit 1 ) as vdf;
                
 if not found then
   insert into volumesdadosfiscais (dadofiscal,codigo, incluidosistema) values (pDadofiscal, 1, True);  
   
 end if;
 
  
  insert into volumesdadosfiscaisconferencia 
  
  (
  tipo,
  codigo,
  dadofiscal,
  numerovolume,
  volume,
  nrvolume,
  conferido,
  datahora_inclusao,
  datahora_alteracao,
  conferidodigitado,
  filialregistro,
  usuario
  )
    
  (
   select vdf_.* 
   from
   (
    select pTipo as Tipo,
		  cast(rn.romaneio as varchar(20)) as codigo,
		  rn.dadofiscal,
		  vodf.codigo as numerovolume,
		  coalesce(nullif(vodf.volumes,0),1) as volume,
		  generate_series(1, coalesce(nullif(vodf.volumes,0),1)) as nrvolume,
          true as conferido,
		  
		  case when pTIPO = 'ROS' then df.datahoraemissao 
		                          else coalesce(coalesce(np.datahoraemissao, np.datahoragravacao), df.datahoraemissao)
									  
		  end as datahora_inclusao,
		  
		  case when pTIPO = 'ROS' then df.datahoraemissao 
		                          else coalesce(coalesce(np.datahoraemissao, np.datahoragravacao), df.datahoraemissao)
									  
		  end as datahora_alteracao,
		  
		  true as conferidodigitado,
		  
		  pFilial,
		  pCodigoUsuario
		  
   from romaneiosnotas rn
   	    join volumesdadosfiscais vodf
			 on rn.dadofiscal = vodf.dadofiscal

		join dadosfiscais df
		     join notas n
			 on df.numero = n.dadofiscal
		on rn.dadofiscal = df.numero
		
        join notaspag np
        on rn.dadofiscal = np.dadofiscalreferenciado


   where rn.romaneio = (cast(pCodigo as integer))
	 and df.situacao <> 'C'
	 
	 
   order by rn.romaneio, rn.dadofiscal
   
   ) as vdf_
   
    where case when pTipo = 'ROS' then  /* Neste caso nï¿½o gerar outras saï¿½das afinal deve assumir o que foi bipado  */
	
					  not exists ( select vdf.tipo, vdf.codigo, vdf.dadofiscal, vdf.numerovolume, vdf.nrvolume
								  from volumesdadosfiscaisconferencia vdf
								  where vdf.tipo = vdf_.Tipo
									and vdf.codigo = vdf_.codigo
									and vdf.dadofiscal = vdf_.Dadofiscal
									/*
									and vdf.numerovolume = vdf_.numerovolume
									and vdf.nrvolume = vdf_.nrvolume						
									*/
								   )
								   
               when pTipo = 'ROE' then /* Bipar somente o que foi dado saï¿½da  */								   

					      exists ( select vdf.tipo, vdf.codigo, vdf.dadofiscal, vdf.numerovolume, vdf.nrvolume
								  from volumesdadosfiscaisconferencia vdf
								  where vdf.tipo = 'ROS'
									and vdf.codigo = vdf_.codigo
									and vdf.dadofiscal = vdf_.Dadofiscal
									and vdf.numerovolume = vdf_.numerovolume
									and vdf.nrvolume = vdf_.nrvolume						
								   )
          end 								   
	
	/* nï¿½o deve existir a chave abaixo */
	/*
    and not exists ( select vdf.tipo, vdf.codigo, vdf.dadofiscal, vdf.numerovolume, vdf.nrvolume
	                  from volumesdadosfiscaisconferencia vdf
					  where vdf.tipo = vdf_.Tipo
					    and vdf.codigo = vdf_.codigo
						and vdf.dadofiscal = vdf_.Dadofiscal
						and vdf.numerovolume = vdf_.numerovolume
                        and vdf.nrvolume = vdf_.nrvolume						
                 	)   
					*/
  ) on CONFLICT (tipo, codigo, dadofiscal, numerovolume, nrvolume)
  do update set conferido = true, conferidodigitado = true
  /*
     where (volumesdadosfiscaisconferencia.tipo, 
	        volumesdadosfiscaisconferencia.codigo, 
			volumesdadosfiscaisconferencia.dadofiscal, 
			volumesdadosfiscaisconferencia.numerovolume, 
			volumesdadosfiscaisconferencia.nrvolume) in 
			
	       (EXCLUDED.tipo, 
		    EXCLUDED.codigo, 
			EXCLUDED.dadofiscal, 
			EXCLUDED.numerovolume, 
			EXCLUDED.nrvolume)
	*/		
			;
 
 
end;
$function$
;

-- public.retirabrancoepipeeascii255(character varying)
CREATE OR REPLACE FUNCTION public.retirabrancoepipeeascii255(character varying)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE ---------------------------- Retorna pString retirando os caracteres '|'
   pString  ALIAS FOR $1;         -- e de $00 a $1F,  os espaï¿½os duplos e limita
   vRetorno VARCHAR;              -- o tamanho em 255 caracteres
BEGIN
    vRetorno:= REPLACE(pString, '|', '');	
    FOR vNC IN 1..31 LOOP
        vRetorno:= REPLACE(vRetorno, CHR(vNC), '');	
    END LOOP;
    
    WHILE ((POSITION(cast('  ' as varchar) IN vRetorno)) > 0) LOOP
      vRetorno:= REPLACE(vRetorno, '  ', ' ');
    END LOOP;
    
    RETURN (TRIM(SUBSTRING(TRIM(vRetorno), 1, 255)));
END;
$function$
;

-- public.romaneios_proximonumero()
CREATE OR REPLACE FUNCTION public.romaneios_proximonumero()
 RETURNS integer
 LANGUAGE sql
AS $function$SELECT NEXTVAL('romaneios_proximonumero')::INTEGER;$function$
;

-- public.situacao_romaneio(p_romaneio integer)
CREATE OR REPLACE FUNCTION public.situacao_romaneio(p_romaneio integer)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE
  vSituacao varchar;
BEGIN

  select 

           /* O romaneio esta pago? */  

           case when r.datapagto is not null then cast('FECHADA' as char(20))
		        
				
				when r.tipo = 'N' THEN
				
				               /* Primeiramente Aberto...ao bipar: Confirmado ou Confirmado Parcial...sï¿½ quando confirmado total libera para preencher o usuï¿½rio  */
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
                                            /* nï¿½o entregue e nem parcial, mas com usuario e data de transito */ 

                                          else
											 coalesce((select cast('ABERTA' as char(20))
													   from romaneiosnotas rn
															join dadosfiscais df
															on rn.dadofiscal = df.numero
													   where rn.romaneio = r.numero 
														 and df.situacao = 'N' limit 1),
													  cast('CANCELADO' as char(20)))
										  
                                     end     
							   
				
				               /* Foi liberado a entrega? Para chegar neste ponto jï¿½ foi totalmente bipado */
							   /* Entï¿½o, poderï¿½ assumir: Transito, Entregue, Entregue Parcial */
							 				      
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

                                            /* nï¿½o entregue e nem parcial, mas com usuario e data de transito */ 

                                          else 
										  
										  
											 coalesce((select cast('EM TRï¿½NSITO' as char(20))
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

                /* a saï¿½da do romaneio esta totalmente conferida (bipada) ? */

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

                                 /* esta conferido parcial? (nï¿½o vai ocorrer esta situaï¿½ï¿½o, sï¿½ fazem um volume por NF na transferï¿½ncia. */

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

                                          ) 
										  
										  or
										  
										   (
										     select true 
											 FROM romaneiosnotas rn 
											 where rn.romaneio = r.numero 
                                               and situacao_romaneio_saida(rn.romaneio, rn.dadofiscal) = 'EM TRï¿½NSITO'
                                             limit 1
										   )
										  )
										  
										  
										  ,false)
                                          
                                          
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

                                             /* nï¿½o conferido ou conferido e sem nota  */

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
                                               
                                          where vdfc.tipo='ROP' /* serie um ROE, mas vista que ï¿½ de uma filial de destino diferente ï¿½ ROP Romeaneio de Passagem */

                                            and df.situacao = 'N'       

                                            and vdfc.codigo=cast(r.numero as varchar(20))

                                                                /* Tem um ROP e nï¿½o tem RPS (saï¿½da) */

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
                                else cast('EM TRï¿½NSITO' as char(20))
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
                                            /* nï¿½o entregue e nem parcial, mas com usuario e data de transito */ 

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
$function$
;

-- public.situacao_romaneio_saida(p_romaneio integer, p_dadofiscal integer)
CREATE OR REPLACE FUNCTION public.situacao_romaneio_saida(p_romaneio integer, p_dadofiscal integer)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE

  vSituacao varchar;

BEGIN

  
  

  select 

           case when r.datapagto is not null then cast('FECHADA' as char(20))

           

                when /* Todos OS volumes do tipo 'ROS' (romaneio de saï¿½da) do dadofiscal vinculado ao romaneio estï¿½o CONFIRMADOS? */

                     (

                      select coalesce(



                                  (select false

                                  from volumesdadosfiscaisconferencia vdfc                                      

                                  where vdfc.tipo = 'ROS'

                                    and vdfc.codigo = cast(r.numero as varchar(20))

                                    and vdfc.dadofiscal = rn.dadofiscal                                      

                                    and not coalesce(vdfc.conferido,false) limit 1)

                                   ,



                                  (select true

                                  from volumesdadosfiscaisconferencia vdfc                                  

                                  where vdfc.tipo='ROS'

                                    and vdfc.codigo=cast(r.numero as varchar(20))

                                    and vdfc.dadofiscal = rn.dadofiscal

                                    and coalesce(vdfc.conferido,false) limit 1), false)

                       )

                       

                    then /* em Caso positivo poderï¿½ estar na condiï¿½ï¿½o: CONFIRMADA, EM TRï¿½NSITO, ENTREGUE, ENTREGA Nï¿½O EFETUADA para o tipo N */ 

                     case when r.tipo = 'N' THEN /* tipo Normal (venda) */

                     

                               case when r.usuariotransito is not null and r.datahoratransito is not null then /* teve a autorizaï¿½ï¿½o para trï¿½nsito? */ 



                                    case when rn.data_hora_recebimento is not null and

                                               rn.justificativa_entrega is null          

                                    then cast('ENTREGUE' as char(20))

                                               

                                         when rn.data_hora_recebimento is not null and

                                              rn.justificativa_entrega is not null      

                                    then cast('ENTREGA Nï¿½O EFETUADA' as char(20))

                                    

                                    else cast('EM TRï¿½NSITO' as char(20))

                                    end     

                               else cast('CONFIRMADA' as char(20)) 

                               end

                               

                          when r.tipo = 'T' THEN  /* tipo Transferï¿½ncia (entre filiais) */

                          

                            case when ( /* Existe a confirmaï¿½ï¿½o 'ROE' (confirmaï¿½ï¿½o por romaneio) na filial de destino e a nota de entrada esta registrada? */

                                          select coalesce(

                                           /* nï¿½o existe pelo menos 1? */

                                          (select false

                                          from volumesdadosfiscaisconferencia vdfc

                                               

                                          where vdfc.tipo = 'ROE'

                                            and vdfc.codigo = cast(r.numero as varchar(20))

                                            and vdfc.dadofiscal = df.numero

                                                                                        

                                            and (not coalesce(vdfc.conferido,false) or  

                                                    (coalesce(vdfc.conferido,false) and

                                                     not exists (select np.numero 

                                                                 from notaspag np 

                                                                 where np.dadofiscalreferenciado = vdfc.dadofiscal 

                                                                   and coalesce(np.vendatransferencia,false) 
                                                                   and np.situacao = 'N'))

                                                )   

                                                        

                                            

                                            limit 1)

                                           ,



                                          (select true

                                          from volumesdadosfiscaisconferencia vdfc

                                               join notaspag np

                                               on vdfc.dadofiscal = np.dadofiscalreferenciado and coalesce(np.vendatransferencia ,false)

                                                                                         

                                          where vdfc.tipo = 'ROE'
                                            and np.situacao = 'N'

                                            and vdfc.codigo = cast(r.numero as varchar(20))

                                            and vdfc.dadofiscal = df.numero

                                            and coalesce(vdfc.conferido,false) limit 1), false)

                                            

                                         ) then 

                                         

                                      cast('ENTREGUE' as char(20))

                                      

                                 when ( /* Existe as duas situaï¿½es? */

                                          select coalesce(

                                          

                                           /* Conferido e.... */

                                          (select true

                                           from volumesdadosfiscaisconferencia vdfc                                               

                                                     join notaspag np

                                                     on vdfc.dadofiscal = np.dadofiscalreferenciado and coalesce(np.vendatransferencia ,false)

                                          

                                           where vdfc.tipo = 'ROE'
                                             and np.situacao = 'N'

                                             and vdfc.codigo = cast(r.numero as varchar(20))

                                             and vdfc.dadofiscal = df.numero

                                             and coalesce(vdfc.conferido,false) limit 1                                            

                                          ) 

                                            

                                            and

                                          /* Nï¿½o conferido. */  

                                          (

                                           select true

                                           from volumesdadosfiscaisconferencia vdfc

                                                               join romaneiosnotas rn2

                                                               on vdfc.dadofiscal = rn2.dadofiscal

                                          

                                           where vdfc.tipo = 'ROE'

                                             and vdfc.codigo = cast(r.numero as varchar(20))

                                             and vdfc.dadofiscal = df.numero

                                            

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

--                                      cast('CONFIRMADA' as char(20)) 

                                      

                            else cast('EM TRï¿½NSITO' as char(20))

--                            else cast('CONFIRMADA' as char(20))

                            end

                     end     

                          

                      

                      

                when (



                   /* Possui marcados e desmarcados? */

                  select coalesce(



                  (select true

                  from volumesdadosfiscaisconferencia vdfc                  

                  where vdfc.tipo = 'ROS'

                    and vdfc.codigo = cast(r.numero as varchar(20))

                    and vdfc.dadofiscal = df.numero

                    and coalesce(vdfc.conferido,false) limit 1

                    ) and

                  (

                  select true

                  from volumesdadosfiscaisconferencia vdfc

                  

                  where vdfc.tipo='ROS'

                    and vdfc.codigo=cast(r.numero as varchar(20))

                    and vdfc.dadofiscal = df.numero

                    and not coalesce(vdfc.conferido,false) limit 1



                  ),false)

                  ) then  cast('CONFIRMADA PARCIAL' as char(20))



                else

                  cast('ABERTA' as char(20))

           end as descricaosituacao into vSituacao



  FROM romaneios r

       join romaneiosnotas rn

            join dadosfiscais df

            on rn.dadofiscal = df.numero

       on r.numero = rn.romaneio

       

  WHERE r.numero = p_romaneio
    and rn.dadofiscal = p_dadofiscal
    and df.situacao = 'N';



  RETURN coalesce(vSituacao,'CANCELADA');

END;
$function$
;
