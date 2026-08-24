CREATE OR REPLACE FUNCTION public.Calcular_Saldo_Adiantamento (
  pDocumentoPag integer
)
RETURNS numeric AS
$body$
DECLARE
 vSaldoAdiantamento numeric; 
 vSaldoAbatimento numeric;
BEGIN
  select sum(dp.valor) into vSaldoAdiantamento
  from documentosp dp
  where (dp.fornecedor, dp.tipofornecedor) IN
        (select dp1.fornecedor, dp.tipofornecedor
         from documentospag dp1
         where dp1.numero = pDocumentoPag)
     and coalesce(dp.adiantamento,false);

  select sum(d.valorpagto) into vSaldoAbatimento
  from duplicatas d
       join documentosp dp
       on d.documentopag = dp.numero
  where (dp.fornecedor, dp.tipofornecedor) IN
        (select dp1.fornecedor, dp.tipofornecedor
         from documentospag dp1
         where dp1.numero = pDocumentoPag)
     and d.tipopagamento = 3; --adiantamento		 
	  
	 
  if vSaldoAbatimento > vSaldoAdiantamento then
    raise exception 'O Saldo de adiantamento esta inferior ao saldo de abatimento. Adiantamento:% Abatimento: % Diferença: %', 
	  vSaldoAdiantamento, vSaldoAbatimento, vSaldoAdiantamento - vSaldoAbatimento ;  
	  
  else
      select dp.numero, dp.valor
	  from documentosp dp
	  where (dp.fornecedor, dp.tipofornecedor) IN
			(select dp1.fornecedor, dp.tipofornecedor
			 from documentospag dp1
			 where dp1.numero = pDocumentoPag)
		 and coalesce(dp.adiantamento,false)
		 and dp.
    
	
	select dp.numero, 
  
  end if;  
	 
	 
	   

  if ((select parametros_valor('Preço para clientes')  = 'True') and
      (coalesce((select cp.precocliente
                   from clientesprodutos cp
                  where cp.cliente = vCliente
                    and cp.tipocliente = vTipoCliente
                    and cp.produto = vProduto),0)<>0)) 
  then
    vValor := (select cp.precocliente
               from clientesprodutos cp
               where cp.cliente = vCliente
                 and cp.tipocliente = vTipoCliente
                 and cp.produto = vProduto);
  else
    vValor := (Select estoques_preco(vProduto, vFilial));
  end if;

  RETURN vValor;
END;
$body$
LANGUAGE 'plpgsql';

ALTER FUNCTION public.Calcular_Saldo_Adiantamento (pDocumentoPag integer)
  OWNER TO tecsoft;