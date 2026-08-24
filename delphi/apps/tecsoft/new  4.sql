			UPDATE paf_cabecalho SET cnpj= :vFilial_cnpj,inscricao_estadual=:vFilial_inscricaoestadual,inscricao_municipal=:vFilial_inscricaomunicipal,razao_social=:vFilial_razao,
															 mf_adicional=:vEcf_mfadicional,tipo_ecf=:vEcf_tipo,marca_do_ecf=:vEcf_marca,modelo_do_ecf=:vEcf_modelodescricao,atual=true,
													        data_do_estoque=CURRENT_DATE, hora_do_estoque = CURRENT_TIME
						 WHERE filial= :filial AND numero_fabricacao= :num_fab;
						 

			UPDATE paf_cabecalho SET hash_registro_e1=md5(cnpj || COALESCE(inscricao_estadual,'') || COALESCE(inscricao_municipal,'') || razao_social || numero_fabricacao || mf_adicional 
																                                    || tipo_ecf || marca_do_ecf || modelo_do_ecf || cast(data_do_estoque as varchar) || cast(hora_do_estoque as varchar));
			
			
			/*E2 cnpj,codigo,descricao,unidade,mensuracao,quantidade_em_estoque
			  P2 cnpj,codigo,descricao,unidade,IAT,IPPT,situacao tributaria,aliquota,valor unitario
			  FALTA ADAPTAR PARA CSOSN AQUI e em dmmenufiscal */
			
			
			delete from registro_e2;
			
			
			insert into registro_e2 (cnpj, produto, descricao, unidade, emEstoque, mensuracao, hash_paf_registro_e2)		
			 select f.cnpj, p.codigo, p.descricao, cast(c.unidade as varchar(6)) as unidade, /*u.descricao,*/ e.emestoque, cast('+'  as char) as mensuracao,
			 md5(f.cnpj||e.produto||p.descricao||cast(c.unidade as varchar(6))||cast('+' as char)||e.emestoque) as hash_paf_registro_e2			 
  			 FROM estoques e,filiais f,produtos p,caracteristicas c 
			 WHERE e.filial = :filial
			   AND   f.codigo = :filial
			   AND   e.filial= f.codigo
			   AND   e.produto= p.codigo
			   AND   p.caracteristica=c.codigo;
		
		
			delete from registro_p2;
		
		
			insert into registro_p2 (cnpj, produto, descricao, unidade, iat, ippt, situacaotributaria, aliquota, valorunitario, hash_paf_registro_p2)
			 select produtos.*, md5(cnpj||cast(codigo as varchar)||descricao||unidade||cast(producaopropria as varchar)||situacaotributaria||cast(aliquota as varchar)||cast(precounitario as varchar)) as  hash_paf_registro_p2
			  from
			(
			   SELECT f.cnpj, p.codigo,
					  CAST(p.descricao || coalesce(p.valorgrade1,'') || coalesce(p.valorgrade2,'') AS VARCHAR) AS descricao,
						cast(c.unidade as varchar(6)) as unidade,
						CAST('A' AS CHAR) as IAT,
						CAST(CASE WHEN c.producaopropria THEN 'P'
                                        ELSE 'T'
						END AS CHAR) as producaopropria,

						CAST(CASE WHEN c.incidencia = 5           THEN 'I'
								WHEN c.incidencia in (4,6,7,11) THEN 'N'
								WHEN c.incidencia in (2,9,10)   THEN 'F'
								WHEN c.incidencia in (1,3,8)    THEN 'T'
							END AS CHAR) AS situacaotributaria,

						CAST(COALESCE((SELECT ei.valor FROM estadosicms ei WHERE ei.icms = c.icms AND ei.estado = f.estado),0) AS NUMERIC(4,2)) AS aliquota,

						CAST(estoques_preco(p.codigo, f.codigo) AS NUMERIC(12,2)) AS precounitario

				FROM caracteristicas c JOIN produtos p ON p.caracteristica = c.codigo,
					filiais f, estoques e
				WHERE f.codigo= :filial
					AND e.filial=f.codigo
					AND e.produto=p.codigo
				ORDER BY p.codigo			
			) as produtos;
						
						
			UPDATE hash_inclusao_exclusao set hash_calculado=md5((select cast (count(*) as varchar) from registro_e2)) WHERE nome_registro='ESTOQUE';
			
			
			UPDATE hash_inclusao_exclusao set hash_calculado=md5((select cast (count(*) as varchar) from registro_p2)) WHERE nome_registro='PRODUTOS';