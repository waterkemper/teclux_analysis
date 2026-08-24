/* qryContratosDevolucoes */
%InicioSomatorio
/*
(
 select  cast(ncontrato as varchar) as ncontrato,
          cast(dadofiscal as integer) as dadofiscal,
          cast(codigonota as integer) as codigonota,
          cast(filialvenda as integer) as filialvenda,
          cast(nomefilialvenda as varchar) as nomefilialvenda,
		  
          cast(tabelapreco as integer) as tabelapreco,
          cast(descricaotabelapreco as varchar(15)) as descricaotabelapreco,
		  
          cast(grupofilialvenda as integer) as grupofilialvenda,
          cast(nomegrupofilialvenda as varchar) as nomegrupofilialvenda,
          cast(cliente as integer) as cliente,
          cast(tipocliente as varchar) as tipocliente,
          cast(nomecliente as varchar) as nomecliente,
          cast(datavenda as date) as datavenda,
          datahoraemissao,
          cast(sum(valorvista) as Numeric) as valorvista,
          cast(sum(valortotal) as numeric) as valortotal,
          cast(sum(vendamercadorias) as numeric) as vendamercadorias,
          cast(sum(vendaservicos) as numeric) as vendaservicos,
          cast(sum(frete_seguro) as numeric) as frete_seguro,
          cast(sum(desconto) as numeric) as desconto,
          cast(contratoavista as boolean) as contratoavista,
          cast(sum(creditotroca) as numeric) as creditotroca,
          cast(sum(valoricmssubstituicao) as numeric) as valoricmssubstituicao,
          cast(sum(entradas) as numeric) as entradas,
          cast(sum(qtparcelas) as integer) as qtparcelas,
          cast(sum(aVista) as numeric) as aVista,
          cast(sum(aPrazo) as numeric) as aPrazo,
          cast(sum(eFinanceiro) as numeric) as eFinanceiro,
          cast(Tipo as varchar) as tipo,
	  cast(TipoA as varchar) as tipoA,
	  cast(sum(valortotalABS) as numeric) as valortotalABS,
          cast(sum(tregistros) as integer) as tregistros
 from
 (
  select *
  from
  (
   select  cast(ncontrato as varchar) as ncontrato,
           cast(dadofiscal as integer) as dadofiscal,
           cast(codigonota as integer) as codigonota,
          cast(filialvenda as integer) as filialvenda,
          cast(nomefilialvenda as varchar) as nomefilialvenda,
		  
          cast(tabelapreco as integer) as tabelapreco,
          cast(descricaotabelapreco as varchar(15)) as descricaotabelapreco,
		  
          cast(grupofilialvenda as integer) as grupofilialvenda,
          cast(nomegrupofilialvenda as varchar) as nomegrupofilialvenda,
	  %cliente
          cast(cliente as integer) as cliente,
	  %tipocliente
          cast(tipocliente as varchar) as tipocliente,
	  %nomecliente
          cast(nomecliente as varchar) as nomecliente,
          cast(datavenda as date) as datavenda,
          datahoraemissao,
          cast(sum(valorvista) as Numeric) as valorvista,
          cast(sum(valortotal) as numeric) as valortotal,
          cast(sum(vendamercadorias) as numeric) as vendamercadorias,
          cast(sum(vendaservicos) as numeric) as vendaservicos,
          cast(sum(frete_seguro) as numeric) as frete_seguro,
          cast(sum(desconto) as numeric) as desconto,
          cast(contratoavista as boolean) as contratoavista,
          cast(sum(creditotroca) as numeric) as creditotroca,
          cast(sum(valoricmssubstituicao) as numeric) as valoricmssubstituicao,
          cast(sum(entradas) as numeric) as entradas,
          cast(sum(qtparcelas) as integer) as qtparcelas,
          cast(sum(aVista) as numeric) as aVista,
          cast(sum(aPrazo) as numeric) as aPrazo,
          cast(sum(eFinanceiro) as numeric) as eFinanceiro,
          cast(Tipo as varchar) as tipo,
	  cast(TipoA as varchar) as tipoA,
	  cast(sum(valortotalABS) as numeric) as valortotalABS,
          cast(sum(tregistros) as integer) as tregistros
  from
 (
  select  cast(null as varchar) as ncontrato,
          cast(null as integer) as dadofiscal,
          cast(null as integer) as codigonota,
          cast(case when :AgruparFilial then filialvenda else null end as integer) as filialvenda,
          cast(case when :AgruparFilial then nomefilialvenda else null end as varchar) as nomefilialvenda,
		  
          cast(case when :AgruparTabelaPreco then tabelapreco else null end as integer) as tabelapreco,
          cast(case when :AgruparTabelaPreco then descricaotabelapreco else null end as varchar(15)) as descricaotabelapreco,
		  
          cast(case when :AgruparGrupoFilial then grupofilialvenda else null end as integer) as grupofilialvenda,
          cast(case when :AgruparGrupoFilial then nomegrupofilialvenda else null end as varchar) as nomegrupofilialvenda,
          cast(case when :MaioresClientes then cliente else null end as integer) as cliente,
          cast(case when :MaioresClientes then tipocliente else null end as varchar) as tipocliente,
          cast(case when :MaioresClientes then nomecliente else 'OUTROS' end as varchar) as nomecliente,
          cast('30/12/1899' as date) as datavenda,
          cast('30/12/1899' as date) as datahoraemissao,
          cast(sum(valorvista) as Numeric) as valorvista,
          cast(sum(valortotal) as numeric) as valortotal,
          cast(sum(vendamercadorias) as numeric) as vendamercadorias,
          cast(sum(vendaservicos) as numeric) as vendaservicos,
          cast(sum(frete_seguro) as numeric) as frete_seguro,
          cast(sum(desconto) as numeric) as desconto,
          cast(null as boolean) as contratoavista,
          cast(sum(creditotroca) as numeric) as creditotroca,
          cast(sum(valoricmssubstituicao) as numeric) as valoricmssubstituicao,
          cast(sum(entradas) as numeric) as entradas,
          cast(sum(qtparcelas) as integer) as qtparcelas,
          cast(sum(aVista) as numeric) as aVista,
          cast(sum(aPrazo) as numeric) as aPrazo,
          cast(sum(eFinanceiro) as numeric) as eFinanceiro,
          cast(Tipo as varchar) as tipo,
	  cast(null as varchar) as tipoA,
	  cast(sum(valortotalABS) as numeric) as valortotalABS,
          cast(sum(tregistros) as integer) as tregistros
   from
%FimSomatorio
*/
(

 select sel.*
 from
 (
 
  (
   select ncontrato,
          dadofiscal,
          cast(null as integer) as codigonota,
            filialvenda,
            f.nome as nomefilialvenda,
            fgf.grupo as grupofilialvenda,
            gf.descricao as nomegrupofilialvenda,
            cliente,
            tipocliente,
            nomecliente,
            datavenda,
            datahoraemissao,
            valorvista,
            valortotal,
            vendamercadorias,
            vendaservicos,
            frete_seguro, desconto,
            contratoavista,
            creditotroca,
	    0.00 as valoricmssubstituicao,
            entradas,
            qtparcelas,
            case when ContratoaVista then valortotal else 0 end as aVista,
            case when ContratoaVista then 0
	                             else valortotal-coalesce(entradas,0) end as aPrazo,
            ValorTotal-VendaMercadorias-Frete_Seguro-Desconto-vendaservicos as EFinanceiro,
            Cast('C' as varchar) as Tipo,
	    case when contratoavista then cast('CT' as varchar)
	                             else cast('CF' as varchar) end as TipoA,
            abs(ValorTotal) as ValorTotalABS,
            - cast(1 as integer) as tregistros,
			
			coalesce(tabelapreco, f.preconormal) as tabelapreco,
			col.descricao as descricaotabelapreco
			
 from (filiais f left join (filiaisgruposfiliais fgf join gruposfiliais gf on fgf.grupo=gf.codigo) on f.codigo=fgf.filial %WhereGruposFiliais), colunas col,
 (
  select contratostipo_d.*,
         -case When contratoavista then 0
                                   else  (select sum(p.valorvencto)
                                          from parcelas p
					  where p.contrato = ncontrato
					    and (p.tipopagto is not null and
					         p.tipopagto in ('D','C','R','E','J'))
   					    and p.datavencto <= faturamento) end as entradas,
						
         cast((select count(*)
	       from parcelas p
	       where p.contrato=ncontrato
	         and (p.tipopagto is not null and
		      p.tipopagto in ('D','C','R','E','J'))) as integer) as qtparcelas
			  
   from
   (
     select contratos_d.*,
           (case when (select count(*)
                       from parcelas p
		               where p.contrato = ncontrato
		                 and p.datavencto > faturamento) = 0 then true
                                                             else false end) as contratoavista
     from 
	      ( 
	        select ct.numero as ncontrato,

                  (select df.numero
                    from dadosfiscais df
                        where df.contrato = ct.numero
                          and df.situacao = 'N' limit 1 ) as dadofiscal,

                   ct.filialvenda,
		           ct.cliente,
		           ct.tipocliente,
		           ct.nome as nomecliente,
                   ct.faturamento,
		           contratosdevolvidos.devolucao as datavenda,
                           contratosdevolvidos.datahoraemissao,
		           -contratosdevolvidos.valorvista as valorvista,
                   -contratosdevolvidos.valortotal as valortotal,
                   contratosdevolvidos.vendamercadorias,
                   contratosdevolvidos.vendaservicos,
                   -(contratosdevolvidos.frete+contratosdevolvidos.seguro) as frete_seguro,
		           contratosdevolvidos.desconto,
		           - contratosdevolvidos.creditotroca as creditotroca,
				   ct.codigotabelapreco as tabelapreco
           from contratos ct left join (usuarios u left join GruposUsuarios gu on u.grupo = gu.codigo)
                            on ct.vendedor = u.codigo,
          (
           (
             select contratosdevolvidos.*,
  	            -(contratosdevolvidos.valorvista + contratosdevolvidos.frete +
		     contratosdevolvidos.seguro + contratosdevolvidos.desconto) as vendamercadorias,
                    0.00 as vendaservicos
             from
             (
	       select cd.contrato,
	              cd.devolucao,
				  
					  
							  (select max(parcelas_log.trigger_changed)
							   from parcelas_log
							   where parcelas_log.contrato = cd.contrato
							     and cast(parcelas_log.trigger_changed  as date) <= cd.devolucao
							   ) as datahoraemissao,
					  
		      sum(cd.valorvista) as valorvista,
		      sum(coalesce(cd.desconto,0)+coalesce(cd.valordescontoitem,0)) as desconto,
		      sum(cd.frete) as frete,
		      sum(cd.seguro) as seguro,
		      sum(cd.valorprazo) as valortotal,
		      sum(-cd.creditotroca) as creditotroca
	       from contratosdevolvidos cd
	       where cd.contrato is not null
	         and cd.devolucao between (:DataInicial) and (:DataFinal)
		 and cd.tipo='D'
               group by cd.contrato, cd.devolucao
	     ) as contratosdevolvidos
           )
	    union all
	  (
	   select contrato,
	          devolucao,
			  datahoraemissao,
		  valorvista,
		  desconto,
		  frete,
		  seguro,
		  valortotal,
		  creditotroca,
                  -totalprodutos as vendamercadorias,
                  -totalservicos as vendaservicos
	  from (select contratoscancelados.*,
	               coalesce((select sum(pc.quantidade*pc.precovenda)
		                 from produtoscontratos pc
			         where pc.contrato = contratoscancelados.contrato
				   and not pc.brinde),0) as totalprodutos,
 		       coalesce((select sum(sc.quantidade * sc.valorservico)
				 from servicoscontratos sc
				 where sc.contrato = contratoscancelados.contrato),0) as totalservicos
		from (select distinct ct.numero as contrato,
		                      p.datapagto as devolucao,
							  (select max(parcelas_log.trigger_changed)
							   from parcelas_log
							   where parcelas_log.contrato = p.contrato
							     and parcelas_log.numero = p.numero) as datahoraemissao,
				      ct.valorvista,

              (coalesce((select sum(pc.valordescontoitem)
                         from produtoscontratos pc
                         where pc.contrato = ct.numero),0) + coalesce(ct.desconto,0)) as desconto,

				      coalesce(ct.frete,0) as frete,
				      coalesce(ct.seguro,0) as seguro,
				      ct.valorprazo as valortotal,
				      -coalesce(ct.creditotroca,0) as creditotroca
     from contratos ct, parcelas p
  		      where ct.numero=p.contrato and ct.situacao='C'
		        and not exists (select p2.numero
			                from parcelas p2
					where p2.contrato = ct.numero
					  and p2.tipopagto<>'E')
 		       and p.datapagto between :datainicial and :datafinal
		       and not exists (select cd.contrato
		                       from contratosdevolvidos cd
				       where cd.contrato = ct.numero
				         and cd.tipo='D')) as contratoscancelados
               ) as contratoscancelados
	  )
        ) as contratosdevolvidos
          where ct.numero=contratosdevolvidos.contrato
            and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end
        %WhereDevolucoes
        %WhereFiliais
        %WhereAgentes
        %WhereConceito
        %WhereRegioes_ct
        %WhereVendedores_ct
        %WhereGrupoVendedores_ct
        %WhereClientes
     ) as contratos_d
	 
	 
	 
	 
    ) as contratostipo_d
    %whereTipodeVenda
   /* %WhereOrdenacao_Devolucoes */

 ) as contratosparcelas_d
   where f.codigo = contratosparcelas_d.filialvenda
     and col.codigo = coalesce(contratosparcelas_d.tabelapreco,f.preconormal)
   
   
 )  
 
 union all
 
 (
  select sel.*,
         col.descricao as descricaotabelapreco
  from 
 
 (
 
 
   select cast(null as varchar(20)) as ncontrato,
          cast(null as integer) as  dadofiscal,
          np.codigo as codigonota,
		  np.filial as filialvenda,
          f.nome as nomefilialvenda,
          fgf.grupo as grupofilialvenda,
          gf.descricao as nomegrupofilialvenda,
          np.fornecedor as cliente,
          np.tipofornecedor as tipocliente,
          np.nome as nomecliente,
          np.emissao as   datavenda,
          np.datahoraemissao,
          - np.valornota as  valorvista,
          - np.valornota as valortotal,
          - np.valorprodutos as vendamercadorias,
          - np.valorservicos as vendaservicos,
          - coalesce(np.freteinterno,0)+ coalesce(np.freteexterno,0)+coalesce(np.seguro,0) as  frete_seguro, 
		  np.desconto,
          true as contratoavista,
		  cast(null as numeric(12,2)) as creditotroca,
		  0.00 as valoricmssubstituicao,
          0.00 as entradas,
          cast(1 as integer) as qtparcelas,
		  
          - np.valornota as aVista,
          0.00 as aPrazo,
          np.valornota-np.valorprodutos-(coalesce(np.freteinterno,0)+ coalesce(np.freteexterno,0)+coalesce(np.seguro,0))-np.desconto-np.valorservicos as EFinanceiro,
          Cast('C' as varchar) as Tipo,
	      cast('NP' as varchar) as TipoA,
          abs(np.valornota) as ValorTotalABS,
          - cast(1 as integer) as tregistros,
		  
		  coalesce(
  		  (select df.codigotabelapreco 
		   from dadosfiscais df
		   where df.numero = np.dadofiscalreferenciado), f.preconormal) as tabelapreco
		  
		  
         from (((notaspag np
                join vfornecedores vf on np.fornecedor = vf.codigo and np.tipofornecedor = vf.tipo)

                join (usuarios u
                      left join GruposUsuarios gu
                      on u.grupo = gu.codigo)
                on np.vendedor=u.codigo)

                join (filiais f left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial %WhereGruposFiliais)
                                          on np.filial=f.codigo) 


         Where (np.data between (:DataInicial) and (:DataFinal) and situacao='N')
           and np.contrato is null
           and ehnotafiscalentradadevolucao(np.codigofiscal)
           and :IncluirDevolucoesSemContrato

         
		 
        /*%WhereDevolucoes*/
        %WhereFiliais_devolucoes
        /*%WhereAgentes*/
        %WhereConceito
        %WhereRegioes_np
        %WhereVendedores_ct
        %WhereGrupoVendedores_ct

        %WhereClientes_devolucoes
        /*%whereTipodeVenda*/
 
 
   ) as sel join colunas col on sel.tabelapreco = col.codigo
   
 )  
 
) as sel

%WhereOrdenacao_Devolucoes

)
%InicioAgrupamentoSomatorio
/*
  as contratossomados_d
  group by nomegrupofilialvenda, grupofilialvenda, nomefilialvenda, filialvenda, descricaotabelapreco, tabelapreco, nomecliente, tipocliente, cliente, tipo
 ) as contratosresomados_d
   group by nomegrupofilialvenda, grupofilialvenda, nomefilialvenda, filialvenda, descricaotabelapreco, tabelapreco, nomecliente, tipocliente, cliente, tipo, ncontrato, dadofiscal, codigonota, datavenda, datahoraemissao, contratoavista, tipoA
 ) as contratosresomados_selecionados_d
   %WhereOrdenacao_Total_Vendas

 ) as contratosresomados_reselecionados_d
   group by nomegrupofilialvenda, grupofilialvenda, nomefilialvenda, filialvenda, descricaotabelapreco, tabelapreco, nomecliente, tipocliente, cliente, tipo, ncontrato, dadofiscal, codigonota, datavenda, datahoraemissao, contratoavista, tipoA
)
%FimAgrupamentoSomatorio
*/



/*
Não retirar apenas para manter compatibilidde entre as macros e fugir de taanto controle tipo se isto então isto...

%WhereFiliais_notas
%WhereRegioes_df
%WhereRegioes_df
%WhereVendedores_df
%WhereGrupoVendedores_df
%WhereClientes_notas
%WhereOrdenacao_Vendas
%WhereOrdenacao_Cancelamentos

:IncluirDevolucoesSemContrato

*/