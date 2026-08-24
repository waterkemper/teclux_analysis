CREATE OR REPLACE FUNCTION public.estoques_produtoempromocao (
  pProduto bigint,
  pFilial integer,
  pColunaPreco INTEGER 
)
RETURNS boolean AS
$body$
DECLARE
  vpromocao INTEGER;
  vvalidade DATE;
  vResultado Boolean;
BEGIN
  vvalidade='1980-01-01';
  vResultado := False;
  
  SELECT precopromocao INTO vpromocao
     FROM filiais	 
     WHERE codigo = pFilial
	   and precopromocao = pColunaPreco ;

  IF FOUND THEN
     IF vpromocao IS NOT NULL THEN
        SELECT validade INTO vvalidade
           FROM colunasprecos, produtos
        WHERE (produtos.codigo = pProduto) AND
              (produtos.caracteristica = colunasprecos.caracteristica) AND
              (produtos.preco  = colunasprecos.preco) AND
              (colunasprecos.coluna = vpromocao) /*AND
              (colunasprecos.validade >= current_date) */;
     END IF;
  END IF;

  vResultado := vvalidade is not null and vvalidade > '1980-01-01';
  
  if not vResultado then
    vResultado := (select estoques_produtoempromocao(pProduto, pFilial));
  END IF;
  
  
  RETURN vResultado;
END;
$body$
LANGUAGE 'plpgsql';

ALTER FUNCTION public.estoques_produtoempromocao (bigint, integer, integer)
  OWNER TO tecsoft;