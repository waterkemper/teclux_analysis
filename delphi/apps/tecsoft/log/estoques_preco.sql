CREATE OR REPLACE FUNCTION public.estoques_preco (
  pProduto bigint,
  pFilial integer,
  pColunaPreco INTEGER
)
RETURNS numeric AS
$body$
DECLARE
  vValor      NUMERIC(9,2);
  vFatorPreco CHAR(4);
  vFator      NUMERIC(10,4);

BEGIN

   SELECT Valor INTO vValor
   FROM  ColunasPrecos, Produtos
   WHERE (Produtos.Codigo         = pProduto)                     
     AND (Produtos.Caracteristica = ColunasPrecos.Caracteristica) 
     AND (Produtos.Preco          = Colunasprecos.Preco)          
     AND (ColunasPrecos.Coluna    = pColunaPreco)        
     /*AND (ColunasPrecos.Validade >= Current_Date) JR no dia 10/03/203 as 14:51, sexta-feira. deu a seguine declaração: Data de vallidade só interessa para promoção. */ ;
	 
	 
   IF vValor IS NOT NULL THEN
   
     SELECT FatorPreco INTO vFatorPreco
     FROM   Caracteristicas, Produtos
     WHERE (Produtos.Codigo         = pProduto) 
       AND (Produtos.Caracteristica = Caracteristicas.Codigo);

     IF vFatorPreco IS NOT NULL THEN
       SELECT Fator INTO vFator
       FROM   FatoresPrecosFiliais
       WHERE (FatoresPrecosFiliais.Filial     = pFilial) 
         AND (FatoresPrecosFiliais.FatorPreco = vFatorPreco);

       IF vFator IS NOT NULL THEN
                 vValor:= ROUND((vValor * vFator),2);
       ELSE vValor:= 0;
       END IF;
	   
     END IF;

   ELSE
     vValor:= (select estoques_preco(pProduto, pFilial));
   END IF;
	 
   RETURN vValor;
END;
$body$
LANGUAGE 'plpgsql';

ALTER FUNCTION public.estoques_preco (bigint, integer, integer)
  OWNER TO tecsoft;
  