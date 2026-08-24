
/* qryFiliaisTipodePlano */

;SELECT * FROM
(
%Inicio_VendasContratoseFrenteCaixa
 (
  select vendasPlanosTotal.*,
         totalvendas.*,
         round((100*(aVista+entradas+parcelas))/(COALESCE(NULLIF(valortotalvendas,0),1)),2) as percentual,
         cast('A_Vendas' as varchar(20)) as Tipo
  from
  (
   select tipoplano,
       nometipoplano,
       sum(fretes) as fretes,
       sum(seguro) as seguro,
       sum(avista) as avista,
       sum(coalesce(entradas,0)) as entradas,
       sum(parcelas) as parcelas,
       sum(creditotroca) as creditotroca
   from
 (
 %Inicio_Vendas_Contratos_1
 (
   select
       ct.plano as tipoplano,
       pl.descricao as nometipoplano,
       coalesce(ct.frete,0) as fretes,
       coalesce(ct.seguro,0) as seguro,
       (case when (select count(*) from parcelas p where
                             p.contrato = ct.numero and
                             p.datavencto > ct.faturamento) = 0 then ct.valorprazo
                                                        else 0 end) as avista,

        (case when (select count(*) from parcelas p where
                   p.contrato = ct.numero and
                   p.datavencto > ct.faturamento) = 0 then 0
                                              else
                           (select sum(p.valorvencto) from parcelas p where
                            p.contrato = ct.numero and
                            p.datavencto <= ct.faturamento
                            )
       end) as entradas,

       (case when (select count(*) from parcelas p where
                            p.contrato = ct.numero and
                            p.datavencto > ct.faturamento) = 0 then 0
                                              else
                           (select sum(p.valorvencto) from parcelas p where
                            p.contrato = ct.numero and
                            p.datavencto > ct.faturamento)
       end) as parcelas,
       - coalesce(ct.creditotroca,0) as creditotroca

  from ((((contratos ct join planos pl on ct.plano=pl.codigo)
                    join vfornecedores vf on ct.cliente = vf.codigo and ct.tipocliente = vf.tipo)

                     join (usuarios u
                           left join GruposUsuarios gu
                           on u.grupo = gu.codigo)

                     on ct.vendedor=u.codigo)

                     join (filiais f left join (filiaisgruposfiliais fgf  left join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial)
                                          on ct.filialvenda=f.codigo)


  where  ct.origem is null and
       ct.faturamento between (:DataInicial) and (:DataFinal)
    and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

  %Filiais
  %Vendedores
  %GruposVendedores
  %Clientes
  %Agrupamento_ct
  

 )
  %Final_Vendas_Contratos_1
  union all
  %Inicio_Vendas_Frente_de_Caixa_1
 (
    select
       df.plano as tipoplano,
       coalesce(pl.descricao, cast('FRENTE DE CAIXA' as varchar)) as nometipoplano,
       coalesce(df.valorfrete,0) as fretes,
       coalesce(df.seguro,0) as seguro,
       df.valortotal as avista,
       0.00 as entradas,
       0.00 as parcelas,
       0.00 as creditotroca

  from ((((dadosfiscais df
          left join planos pl on df.plano=pl.codigo)
         left join vfornecedores vf on df.cliente = vf.codigo and df.tipocliente = vf.tipo)

         left join (usuarios u
               left join GruposUsuarios gu
               on u.grupo = gu.codigo)

         on df.vendedor=u.codigo)

         join (filiais f left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial)
                                          on df.filialvenda=f.codigo)

  Where (df.data between (:datainicial) and (:datafinal)) and df.contrato is null
          and df.situacao='N'
          and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))

    and not coalesce(df.notavinculada,false)

  %Filiais
  %Vendedores
  %GruposVendedores
  %Clientes
  %Agrupamento_df
  
  
  )
  %Final_Vendas_Frente_de_Caixa_1
 ) as VendasPlanos
 group by VendasPlanos.tipoplano,
          VendasPlanos.nometipoplano
) as vendasPlanostotal,

 (
  select sum(valortotalvendas) as valortotalvendas
  from
  (
  %Inicio_Vendas_Contratos_2
   (
    select sum(ct.valorprazo) as valortotalvendas
    from (((contratos ct
          join vfornecedores vf
          on ct.cliente = vf.codigo and ct.tipocliente = vf.tipo)

                     join (usuarios u
                           left join GruposUsuarios gu
                           on u.grupo = gu.codigo)

                     on ct.vendedor=u.codigo)

          join (filiais f left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial)
                                          on ct.filialvenda=f.codigo)




    where ct.origem is null
      and ct.faturamento between (:DataInicial) and (:DataFinal)
      and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end

   %Filiais
   %Vendedores
   %GruposVendedores
   %Clientes
   %Agrupamento_ct

   )
  %final_Vendas_Contratos_2
   union all
  %Inicio_Vendas_Frente_de_Caixa_2
   (

    select sum(df.valortotal) as valortotalvendas

    from (((dadosfiscais df
           left join vfornecedores vf on df.cliente = vf.codigo and df.tipocliente = vf.tipo)

           left join (usuarios u
               left join GruposUsuarios gu
               on u.grupo = gu.codigo)

           on df.vendedor=u.codigo)

           join (filiais f left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial)
                                          on df.filialvenda=f.codigo)

    Where (df.data between (:datainicial) and (:datafinal)) and df.contrato is null
          and df.situacao='N'
          and (eHNotaFiscalSaidaVenda(df.codigofiscal) or mod(df.codigofiscal,1000) in (929))
      and not coalesce(df.notavinculada,false)

   %Filiais
   %Vendedores
   %GruposVendedores
   %Clientes
   %Agrupamento_df
   
   )
  %Final_Vendas_Frente_de_Caixa_2
  ) as totalvendas
 ) as totalvendas
)
%Final_VendasContratoseFrenteCaixa
%Inicio_Devolucoes_Contratos
union all


(
 select tipoplano,
        nometipoplano,
        sum(fretes) as fretes,
        sum(seguro) as seguro,
        sum(aVista) as aVista,
        sum(entradas) as entradas,
        sum(parcelas) as parcelas,
        sum(creditotroca) as creditotroca,
        cast(null as numeric) as valortotalvendas,
        cast(null as numeric) as percentual,
        cast('B_Devolucoes' as varchar(20)) as Tipo
 from
 (

 (
  select tipoplano,
         nometipoplano,
	 -fretes as fretes,
	 -seguro as seguro,
         -case when ContratoaVista then valortotal else 0 end as aVista,
         -entradas as entradas,
         -case when ContratoaVista then 0 else valortotal-coalesce(entradas,0) end as parcelas,
	 creditotroca
 from
  (

   select contratostipo_d.*,
         case When contratoavista then 0
          else  (select sum(p.valorvencto)
                 from parcelas p
		 where p.contrato = ncontrato and
		      (p.tipopagto is not null and p.tipopagto in ('D','C','R','E','J'))  and
                       p.datavencto <= devolucao)
          end as entradas
   from
    ( select contratos_d.*,
           (case when (select count(*)
	               from parcelas p
		       where   p.contrato = ncontrato and
                               p.datavencto > faturamento) = 0 then true
            else false end
	    ) as contratoavista
     from
     ( select
       ct.numero as ncontrato,
       ct.faturamento,
       ct.plano as tipoplano,
       pl.descricao as nometipoplano,
       coalesce(contratosdevolvidos.frete,0) as fretes,
       coalesce(contratosdevolvidos.seguro,0) as seguro,
       contratosdevolvidos.valortotal as valortotal,
       contratosdevolvidos.devolucao as devolucao,
       coalesce(ct.creditotroca,0) as creditotroca
       from ((((contratos ct
	         join planos pl on ct.plano = pl.codigo)
		 join vfornecedores vf on ct.cliente = vf.codigo and ct.tipocliente = vf.tipo)

                 join (usuarios u
                           left join GruposUsuarios gu
                           on u.grupo = gu.codigo)

                     on ct.vendedor=u.codigo)

                 join (filiais f left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial)
                                          on ct.filialvenda=f.codigo),

       (
        (
         select cd.contrato,
                cd.devolucao,
		sum(cd.valorprazo) as valortotal,
		sum(cd.frete) as frete,
		sum(cd.seguro) as seguro
	 from contratosdevolvidos cd
         where cd.contrato is not null and
	      cd.devolucao between (:DataInicial) and (:DataFinal) and
	      cd.tipo='D'
         group by cd.contrato, cd.devolucao
	)
	union all
	(
	 select distinct ct.numero as contrato,
	 		p.datapagto as devolucao,
			ct.valorprazo as valortotal,
			coalesce(ct.frete,0) as frete,
			coalesce(ct.seguro,0) as seguro
	 from contratos ct, parcelas p
	 where ct.numero=p.contrato and
	 	ct.situacao='C' and
		not exists (select p2.numero
			from parcelas p2
			where p2.contrato = ct.numero and
				p2.tipopagto<>'E') and
		p.datapagto between :datainicial and :datafinal and
                                          not exists (select cd.contrato
                                                           from contratosdevolvidos cd
                                                           where cd.contrato = ct.numero and cd.tipo='D')
           and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and ct.os_garantia_status='A') and not coalesce(ct.os_cortesia,false) else true end
        )
       ) as contratosdevolvidos
        where ct.numero=contratosdevolvidos.contrato

  %Devolucoes
  %Filiais
  %Vendedores
  %GruposVendedores
  %Clientes
  %Agrupamento_ct

     ) as contratos_d
   ) as contratostipo_d
            
  ) as contratosentradas_d
  ) 
  union all
  (
  
     select cast(null as integer) as tipoplano,
            cast('DEVOLUÇÃO SEM REFERENCIA DE NF' as varchar(30)) as nometipoplano,
            -coalesce(np.freteinterno,  0) as fretes,
            -coalesce(np.seguro,0) as seguro,
            -np.valornota as aVista,      
            cast(null as numeric(11,2)) as entradas,
            cast(null as numeric(11,2)) as parcelas,
            cast(null as numeric(11,2)) as creditotroca
           

         from (((notaspag np
                join vfornecedores vf on np.fornecedor = vf.codigo and np.tipofornecedor = vf.tipo)

                join (usuarios u
                      left join GruposUsuarios gu
                      on u.grupo = gu.codigo)
                on np.vendedor=u.codigo)

                join (filiais f left join (filiaisgruposfiliais fgf  join gruposfiliais gf on fgf.grupo=gf.codigo)
                                                                                  on f.codigo=fgf.filial)
                                          on np.filial=f.codigo)


         Where (np.data between (:DataInicial) and (:DataFinal) and situacao='N')
           and np.contrato is null
           and ehnotafiscalentradadevolucao(np.codigofiscal)

         %Devolucoes_np
         %Filiais
         %Vendedores
         %GruposVendedores
         %Clientes
         %Agrupamento_np

  )

  
 ) as devolucaoes
 group by nometipoplano, tipoplano
)

%Final_Devolucoes_Contratos

) AS rs

ORDER BY rs.Tipo, rs.Percentual DESC, rs.TipoPlano,
         UPPER(TO_ASCII(rs.NomeTipoPlano,'LATIN1'))