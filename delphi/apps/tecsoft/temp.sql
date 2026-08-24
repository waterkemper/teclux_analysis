CREATE OR REPLACE FUNCTION public.incluirconferenciadocumentos (
  ptipo varchar,
  pcodigo varchar,
  pfilial integer,
  pdadofiscal integer,
  pcodigousuario integer
)
RETURNS void AS
$body$
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
   
    where case when pTipo = 'ROS' then  /* Neste caso não gerar outras saídas afinal deve assumir o que foi bipado  */
	
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
								   
               when pTipo = 'ROE' then /* Bipar somente o que foi dado saída  */								   

					      exists ( select vdf.tipo, vdf.codigo, vdf.dadofiscal, vdf.numerovolume, vdf.nrvolume
								  from volumesdadosfiscaisconferencia vdf
								  where vdf.tipo = 'ROS'
									and vdf.codigo = vdf_.codigo
									and vdf.dadofiscal = vdf_.Dadofiscal
									and vdf.numerovolume = vdf_.numerovolume
									and vdf.nrvolume = vdf_.nrvolume						
								   )
          end 								   
	
	/* não deve existir a chave abaixo */
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
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.incluirconferenciadocumentos (ptipo varchar, pcodigo varchar, pfilial integer, pdadofiscal integer, pcodigousuario integer)
  OWNER TO tecsoft;