;
select * from
(
select contrato, numeroparcela, parcelaorigem, cliente, tipocliente, nomecliente,
       filial, nomefilialemissao, codigotiporecebimento, descricaoTiporecebimento,
       formaderecebimento, descricaoformaderecebimento, agrupadorformaderecebimento,
	   faturamento,
       datavencto, sum(valorvencto) as valorvencto,
       sum(valorlancto) as valorlancto,
       numerocheque,
	   vendedor, nomevendedor, 
	   sum(juros) as juros,
       pDesagio, 
	   sum(ValorDesagio) as ValorDesagio, 
	   confirmado
	   
from
(	   

select *
from
(
   (
	Select case when :ClienteUsaContrato then CAST(StrTrocar(TRIM(TO_CHAR(cast(ct.numero as integer),'999,999,999')),',','.') as varchar(20)) else

			cast(coalesce(
            (select CAST(StrTrocar(TRIM(TO_CHAR(N.numero,'999,999,999')),',','.') as varchar(20)) from notas n
             where n.dadofiscal = (select df.numero
   					 				              from dadosfiscais df
 									                where df.contrato = ct.numero
                                    and not coalesce(df.notavinculada,false)
                                  limit 1)),
            (select CAST(StrTrocar(TRIM(TO_CHAR(c.numero,'999,999,999')),',','.') as varchar(20)) from cupons c
             where c.dadofiscal = (select df.numero
   					 				              from dadosfiscais df
 									                where df.contrato = ct.numero
                                    and not coalesce(df.notavinculada,false)
                                  limit 1))) as varchar(20))
		   end as contrato,

		   p.numero as numeroparcela,
		   p.parcelaorigem,
		   ct.cliente,
		   ct.tipocliente,
		   coalesce(vf.razao,vf.nome) as nomecliente,
		   ct.filialvenda as filial,
		   f.nome as nomefilialemissao,
		   p.tiporecebimento as codigotiporecebimento,
           tr.descricao as descricaoTiporecebimento,
           tr.tiporecebimento as formaderecebimento,
           fr.descricao as descricaoformaderecebimento,
           fr.agrupador as agrupadorformaderecebimento,
           ct.faturamento,
		   p.datavencto,
		   p.valorvencto,
		   p.valorvencto as valorlancto,
		   cast(null as varchar(06)) as numerocheque,
		   ct.vendedor,
		   (select u.nome
			from usuarios u
			where u.codigo = ct.vendedor) as nomevendedor,
		   calcularjuros(p.valorvencto,p.datavencto,current_date, ct.filialvenda) as juros,

		   cast(null as numeric(5,2)) as pDesagio,
		   cast(null as numeric(15,2)) as ValorDesagio,
		   false as confirmado


	from contratos ct
		 join (parcelas p
               left join (tiposrecebimentos tr join formasderecebimento fr on tr.tiporecebimento = fr.codigo)
               on p.tiporecebimento = tr.codigo)
		 on ct.numero = p.contrato
		 join filiais f
		 on ct.filialvenda = f.codigo
		 join vfornecedores vf
		 on vf.codigo = ct.cliente
		   and vf.tipo = ct.tipocliente

	Where ct.situacao in ('F','N','P')

	  %SQLContratoDataVencto
      %SQLContratoDataRecebimento
	  %SQLContratoDataEmissao

	  and p.datapagto is null and p.tipopagto is null
	  and case when ct.os then ct.tipoequipamento in (1,2) and not (coalesce(ct.os_garantia,false) and coalesce(ct.os_garantia_status,'')='A') and not coalesce(ct.os_cortesia,false) else true end
	  /*and (p.tiporecebimento is null or
		   p.tiporecebimento in (select tr.codigo
								from tiposrecebimentos tr
								where tr.tiporecebimento='D'
								and numerorecebimentos=1
								and diasuteis=0))*/


	  %Filial_Contrato
	  %TipoRecebimento_Parcelas
	  %Cliente_Contrato
	  %Vendedor_Contrato
	  %Confirmados_Nao_Recebimentos
	  %FormadeRecebimentoemDinheiro
      %ListadeCargosContratos
   )

	union all

   (

	Select case when :ClienteUsaContrato then CAST(StrTrocar(TRIM(TO_CHAR(cast(r.contrato as integer),'999,999,999')),',','.') as varchar(20)) else

			cast(coalesce(
            (select CAST(StrTrocar(TRIM(TO_CHAR(N.numero,'999,999,999')),',','.') as varchar(20)) 
             from notas n
             where n.dadofiscal = (select df.numero
   					 				              from dadosfiscais df
 									                where df.contrato = r.contrato
                                    and not coalesce(df.notavinculada,false)
                                  limit 1)),
            (select CAST(StrTrocar(TRIM(TO_CHAR(c.numero,'999,999,999')),',','.') as varchar(20)) 
            from cupons c
             where c.dadofiscal = (select df.numero
   					 				              from dadosfiscais df
 									                where df.contrato = r.contrato
                                    and not coalesce(df.notavinculada,false)
                                  limit 1))) as varchar(20))
		   end as contrato,

           case when :ClienteUsaContrato then r.numero else  cast(null as integer) end as numeroparcela,
		   case when :ClienteUsaContrato then r.parcelaorigem else cast(null as varchar(7)) end as parcelaorigem,
       
       
		   r.cliente,
		   r.tipocliente,
		   r.nomecliente,
		   r.filial,
		   r.nomefilialemissao,
		   r.codigotiporecebimento,
		   r.descricaoTiporecebimento,
           r.formaderecebimento,
           r.descricaoformaderecebimento,
           r.agrupadorformaderecebimento,
           r.faturamento,
		   r.datavencto,
		   r.valorvencto,
		   r.valorlancto,
		   cast(substr(r.cheque,12,06) as varchar(6)) as numerocheque,
		   r.vendedor,
		   (select u.nome
		  	from usuarios u
			 where u.codigo = r.vendedor) as nomevendedor,
			 r.juros,
		   r.pDesagio,
		   r.ValorDesagio,
		   r.confirmado

	from
	(

	select r.*,

					case when total_recebimentos_transacao <> 0 then
					valorvencto_r*(total_parcelas_transacao/total_recebimentos_transacao)
					else 0.00 end  as valorvencto,

					case when total_recebimentos_transacao <> 0 then
					  valorlancto_r*(total_parcelas_transacao/total_recebimentos_transacao)
					else 0.00 end  as valorlancto,
                    
					case when total_recebimentos_transacao <> 0 then
					  ValorDesagio_r*(total_parcelas_transacao/total_recebimentos_transacao)
					else 0.00 end  as ValorDesagio


	from (

	 Select /*jr em 06/09/2018  distinct*/ 
             r.datavencto,
			 r.valorvencto as valorvencto_r,
			 r.valorlancto as valorlancto_r,
			 r.tiporecebimento as codigotiporecebimento,
			 ct.faturamento,
			 p.contrato,
             p.numero,
             p.parcelaorigem,
			 /*ct.faturamento, */
			 tr.descricao as descricaotiporecebimento,            
             tr.tiporecebimento as formaderecebimento,
             fr.descricao as descricaoformaderecebimento,             
             fr.agrupador as agrupadorformaderecebimento,
			 r.cheque,
			 r.desagio as pDesagio,
       /* REVER COM JR -> a comparacao deveria ser com o valor pago, o que e juros e o que e desagio pois podem ter os dois !! */

             r.valorlancto-r.valorvencto as ValorDesagio_r,
             
             0.00 as juros,
       
             p.valorpagto as total_parcelas_transacao,

/*			 (select sum(valorpagto) from parcelas where transacao=r.transacao and contrato=p.contrato) as total_parcelas_transacao,*/
			 (select sum(valorlancto) from recebimentos where transacao=r.transacao AND situacao='N') as total_recebimentos_transacao,
			 r.confirmado,
			 r.transacao,
             
		   ct.cliente,
		   ct.tipocliente,
		   coalesce(vf.razao,vf.nome) as nomecliente,
		   ct.filialvenda as filial,
		   f.nome as nomefilialemissao,
           ct.vendedor
             


	  from ((recebimentos r
		     join (tiposrecebimentos tr join formasderecebimento fr on tr.tiporecebimento = fr.codigo)
		     on r.tiporecebimento = tr.codigo)

			 join (parcelas p
			       join ((contratos ct
				          join filiais f
				          on ct.filialvenda = f.codigo)
                          
				          join vfornecedores vf
				          on vf.codigo = ct.cliente
				          and vf.tipo = ct.tipocliente)
                
				   on p.contrato = ct.numero)
			 on p.transacao = r.transacao)

	  where r.tiporecebimento = tr.codigo
        and p.contrato=ct.numero
	    and p.transacao=r.transacao

	   %SQLRecebimentosDataVencto
       %SQLRecebimentosDataRecebimento

	   %SQLRecebimentosDataEmissao

		and r.situacao = 'N'
		%TipoRecebimento_Recebimentos
		%Confirmados
		%FormadeRecebimento
        

	%Filial_Contrato
	%Cliente_Contrato
	%Vendedor_Contrato
	%ListadeCargosContratos
        
        

	) as r  
    
    ) as r

   )

	union all
    
   (	
    select r.contrato,r.numeroparcela, r.parcelaorigem, r.cliente, r.tipocliente, r.nomecliente, r.filial, r.nomefilialemissao,
	       r.codigotiporecebimento, r.descricaoTiporecebimento, r.formaderecebimento,
           r.descricaoformaderecebimento, 
           r.agrupadorformaderecebimento,
		   r.faturamento,
           r.datavencto, r.valorvencto, r.valorlancto, r.numerocheque, 
		   r.vendedor, r.nomevendedor, r.juros, r.pDesagio, r.ValorDesagio,


       r.confirmado
	from
   (
    select
     coalesce((select cast(/*'NF'||*/cast(n.numero as varchar) as varchar(20)) from notas n where n.dadofiscal = df.numero),
              (select cast(/*'CF'||*/cast(c.numero as varchar) as varchar(20)) from cupons c where c.dadofiscal = df.numero)) as contrato,
			  
     cast(null as integer) as numeroparcela,
     cast(null as varchar(7)) as parcelaorigem,
     df.cliente,
     df.tipocliente,
     coalesce(coalesce(vf.razao,vf.nome), cast('CLIENTE FRENTE DE CAIXA' as varchar(60))) as nomecliente,
     df.filialvenda as filial,
     f.nome as nomefilialemissao,
     r.tiporecebimento as codigotiporecebimento,
     tr.descricao as descricaoTiporecebimento,
     tr.tiporecebimento as formaderecebimento,
     fr.descricao as descricaoformaderecebimento,    
     fr.agrupador as agrupadorformaderecebimento,
	 df.data as faturamento,
     r.datavencto,
     r.valorvencto,
     r.valorlancto,
     cast(substr(r.cheque,12,06) as varchar(6)) as numerocheque,
     df.vendedor,
     (select u.nome
     from usuarios u
     where u.codigo = df.vendedor) as nomevendedor,
     r.desagio as pDesagio,
       /* REVER COM JR -> a comparacao deveria ser com o valor pago, o que e juros e o que e desagio pois podem ter os dois !! */
     r.valorlancto-r.valorvencto as ValorDesagio,
     0.00 as juros,


     r.confirmado

     from recebimentos r, (tiposrecebimentos tr join formasderecebimento fr on tr.tiporecebimento = fr.codigo), (dadosfiscais df left join vfornecedores vf on df.cliente = vf.codigo and df.tipocliente = vf.tipo), filiais f

     where not exists (select p.contrato from parcelas p where p.transacao = r.transacao)
      and r.tiporecebimento = tr.codigo
      
	  and df.numero in
	     (
	      (select distinct vdf.dadofiscal from venctosdadosfiscais vdf where vdf.transacao = r.transacao order by vdf.dadofiscal desc limit 1)
		  union all
		  (select df2.numero from dadosfiscais df2 where df2.contrato = (select a.contrato from autenticacoes a where a.transacao = r.transacao and a.contrato is not null limit 1))
		 )
	  
      and df.filialvenda = f.codigo
      and r.situacao = 'N'
      and not coalesce(df.notavinculada,false)

	   %SQLRecebimentosDataVencto
     %SQLRecebimentosDataRecebimento

	   %SQLDadosFiscaisDataEmissao
	   %TipoRecebimento_Recebimentos
	   %Confirmados
	   %FormadeRecebimento
	   %Filial_DadoFiscal
	   %Cliente_DadoFiscal
	   %Vendedor_DadoFiscal
	   %ListadeCargosDadosFiscais


   ) as r
   
   )

	union all

   (
	  Select cast(null as varchar(20)) as contrato,
			 cast(null as integer) as numeroparcela,
			 cast(null as varchar(7)) as parcelaorigem,
			 ch.cliente,
			 ch.tipocliente,
			 coalesce(vf.razao,vf.nome) as nomecliente,
			 ch.filial,
			 f.nome as nomefilialemissao,
			 cast(999 as integer) as codigotiporecebimento,
			 cast('CHEQUES AVULSOS' as varchar(100)) as descricaoTiporecebimento,
             
             CAST('H' as char(1)) as formaderecebimento,
             cast('CHEQUES' as varchar(50)) as descricaoformaderecebimento,    
             cast(null as varchar(50)) as agrupadorformaderecebimento,
             ch.data as faturamento,                          
			 ch.vencto as datavencto,
			 ch.valor as valorvencto,
			 ch.valor as valorlancto,
			 cast(substr(ch.numero,12,06) as varchar(6)) as numerocheque,
			 cast(null as integer) as vendedor,
			 cast('CHEQUES AVULSOS' as varchar(40)) as nomevendedor,
			 0.00 as juros,
			cast(null as numeric(5,2)) as pDesagio,
			cast(null as numeric(15,2)) as ValorDesagio,
		
			false as confirmado


	  from cheques ch
		   join vfornecedores vf
		   on ch.cliente = vf.codigo
		   and ch.tipocliente = vf.tipo
		   join filiais f
		   on ch.filial = f.codigo

	  where :SelecionouChequesAvulsos

		 %SQLChequesDataVencto
     %SQLChequesDataRecebimento

		%SQLChequesDataEmissao

		and not exists  (select cheque from recebimentos where cheque=ch.numero)

		%Filial_ChequesAvulsos
		%Cliente_ChequesAvulsos
		%Vendedor_ChequesAvulsos
		%Confirmados_Nao_Recebimentos
		%FormadeRecebimentoemCheque
		%ListadeCargosCheques
   )
) as selecao



) as selecao

group by

contrato, numeroparcela, parcelaorigem, cliente, tipocliente, nomecliente,
filial, nomefilialemissao, codigotiporecebimento, descricaoTiporecebimento,
formaderecebimento, descricaoformaderecebimento, agrupadorformaderecebimento,
faturamento,
datavencto, numerocheque, vendedor, nomevendedor, pDesagio, confirmado
)  as selecao
%Ordenacao