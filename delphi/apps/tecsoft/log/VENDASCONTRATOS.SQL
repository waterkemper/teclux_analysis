/* qryContratosVendas */
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
          cast(Tipo as varchar) as tipo, cast(TipoA as varchar) as tipoA, cast(sum(valortotalABS) as numeric) as valortotalABS,
          cast(sum(tregistros) as numeric) as tregistros
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
          cast(Tipo as varchar) as tipo, cast(TipoA as varchar) as tipoA, cast(sum(valortotalABS) as numeric) as valortotalABS,
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
          cast(Tipo as varchar) as tipo, cast(null as varchar) as tipoA, 
          cast(sum(valortotalABS) as numeric) as valortotalABS,
          cast(sum(tregistros) as integer) as tregistros
   from
%FimSomatorio
*/
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
            (valorvista-coalesce(vendaservicos,0)-frete-seguro-desconto) as vendamercadorias,
            vendaservicos,
            (frete+seguro) as frete_seguro,  desconto,
            contratoavista,
            - creditotroca as creditotroca,
            - valoricmssubstituicao as valoricmssubstituicao,
            entradas,
            qtparcelas,
            case when ContratoaVista then valortotal else 0 end as aVista,
            case when ContratoaVista then 0 else valortotal-coalesce(entradas,0) end as aPrazo,
            ValorTotal-ValorVista as EFinanceiro,
            Cast('V' as varchar) as Tipo, case when contratoavista then cast('VT' as varchar) else cast('VF' as varchar) end as TipoA, abs(ValorTotal) as ValorTotalABS,
            cast(1 as integer) as tregistros,
			coalesce(tabelapreco, f.preconormal) as tabelapreco,
			col.descricao as descricaotabelapreco
			
     from (filiais f 
	       left join (filiaisgruposfiliais fgf 
		              join gruposfiliais gf 
					  on fgf.grupo=gf.codigo %WhereGruposFiliais)
           on f.codigo=fgf.filial), colunas col,
     (
       select contratostipo_v.*,
          case when contratoavista then 0
                                               else (select sum(p.valorvencto)
                                                       from parcelas p where p.contrato = ncontrato and p.datavencto <= datavenda)
          end as entradas,
          (select sum(quantidade*valorservico) from servicoscontratos sc Where sc.contrato=ncontrato) as vendaservicos,
          (select cast(substr(p.parcelaorigem,strpos(p.parcelaorigem,'/')+1,length(p.parcelaorigem)-((strpos(p.parcelaorigem,'/')-1))) as integer) from parcelas p where p.contrato=ncontrato limit 1) as qtparcelas

      from
      (
        select contratos_v.*,
         case when (select count(*) from parcelas p where
                   p.contrato = ncontrato and
                   p.datavencto > datavenda) = 0 then true
                                              else false
          end as contratoavista
       from
       (
      
        select
         ct.numero as ncontrato,

        (select df.numero
          from dadosfiscais df
              where df.contrato = ct.numero
                and df.situacao = 'N' limit 1 ) as dadofiscal,

         ct.filialvenda,
         ct.cliente,
         ct.tipocliente,
         ct.nome as nomecliente,
         ct.faturamento as datavenda,

        coalesce(
		
        (select df.datahoraemissao
          from dadosfiscais df
              where df.contrato = ct.numero
                and df.situacao = 'N' limit 1 ),

         (select max(contratos_log.trigger_changed)
          from contratos_log
          where contratos_log.numero = ct.numero
            and contratos_log.situacao in ('F','N'))) as datahoraemissao,

         ct.valorvista, coalesce(ct.frete,0) as frete, coalesce(ct.seguro,0) as seguro,

        - (coalesce((select sum(pc.valordescontoitem)
                     from produtoscontratos pc
                     where pc.contrato = ct.numero),0) + coalesce(ct.desconto,0)) as desconto,

         ct.valorprazo as valortotal,
         ct.creditotroca,
         ct.valoricmssubstituicao,
		 ct.codigotabelapreco as tabelapreco
		 
        from contratos ct
             left join (usuarios u left join GruposUsuarios gu on u.grupo = gu.codigo)
             on ct.vendedor = u.codigo

        Where ct.origem is null and ct.faturamento between (:DataInicial) and (:DataFinal)
          and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end
        %WhereFiliais
        %WhereAgentes
        %WhereConceito
        %WhereRegioes_ct
        %WhereVendedores_ct
        %WhereGrupoVendedores_ct

        %WhereClientes


      union all


      select
         df.contrato as ncontrato
       , df.numero as dadofiscal
       , df.filialvenda
       , df.cliente
       , df.tipocliente
       , df.nome as nomecliente
       , df.data as datavenda
       , df.datahoraemissao
       , df.valorvista
       , coalesce(df.valorfrete,0)  as frete
       , coalesce(df.seguro,0) as seguro

       , - (coalesce(
                      (
                         select
                            sum(pdf.valordescontoitem)
                         from
                            produtosdadosfiscais pdf
                         where
                            pdf.dadofiscal = df.numero
                     )
                     ,0) + coalesce(df.desconto,0)) as desconto

       , df.valortotal
       , df.creditotroca
       , df.totalvaloricmssubstituicao as valoricmssubstituicao
	   , df.codigotabelapreco as tabelapreco

      from
         dadosfiscais df
         left join
            (usuarios u
            left join
               GruposUsuarios gu
               on
                  u.grupo = gu.codigo)
            on
               df.vendedor = u.codigo

      Where df.data between :DataInicial and :DataFinal
        and df.contrato is null
            and df.situacao='N'
            and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
            and not coalesce(df.notavinculada,false)

        %WhereFiliais_notas
        %WhereAgentes
        %WhereConceito
        %WhereRegioes_df
        %WhereVendedores_df
        %WhereGrupoVendedores_df

        %WhereClientes_notas



       ) as contratos_v
      ) as contratostipo_v
      %whereTipodeVenda
     ) as contratosparcelas_v
       where f.codigo = contratosparcelas_v.filialvenda
	     and col.codigo = coalesce(contratosparcelas_v.tabelapreco,f.preconormal)
       %WhereOrdenacao_Vendas


   )

%InicioAgrupamentoSomatorio
/*
  as contratossomados_v
  group by nomegrupofilialvenda, grupofilialvenda, nomefilialvenda, filialvenda, descricaotabelapreco, tabelapreco, nomecliente, tipocliente, cliente, tipo
 ) as contratosresomados_v
   group by nomegrupofilialvenda, grupofilialvenda, nomefilialvenda, filialvenda, descricaotabelapreco, tabelapreco, nomecliente, tipocliente, cliente, tipo, ncontrato, dadofiscal, codigonota, datavenda, datahoraemissao, contratoavista, tipoA
 ) as contratosresomados_selecionados_v
   %WhereOrdenacao_Total_Vendas

 ) as contratosresomados_reselecionados_v
   group by nomegrupofilialvenda, grupofilialvenda, nomefilialvenda, filialvenda, descricaotabelapreco, tabelapreco, nomecliente, tipocliente, cliente, tipo, ncontrato, dadofiscal, codigonota, datavenda, datahoraemissao, contratoavista, tipoA
)
%FimAgrupamentoSomatorio
*/



/*
Não retirar apenas para manter compatibilidde entre as macros e fugir de taanto controle tipo se isto então isto...

%WhereClientes_devolucoes
%WhereDevolucoes
%WhereOrdenacao_Devolucoes
%WhereOrdenacao_Cancelamentos
%WhereFiliais_devolucoes
%WhereRegioes_np

:IncluirDevolucoesSemContrato

*/