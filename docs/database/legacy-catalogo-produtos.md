# Catálogo legado: produtos, características, estoque e filiais

Fonte estrutural: [`postgresql-authoritative-2026-08-06.json`](../../modules/interlojas/transferencia-requisicao-exposicao/schema/postgresql-authoritative-2026-08-06.json).

## Tabelas e colunas canônicas

| Tabela | Alias | Colunas de uso recorrente | Regra |
|---|---|---|---|
| `produtos` | `p` | `codigo`, `descricao`, `caracteristica`, `referencia`, `codigovisual`, `codigobarras` | A referência comercial é `p.referencia`. |
| `caracteristicas` | `c` | `codigo`, `descricao`, `grupo`, `classe`, `unidade`, `grade1`, `grade2` | Não possui `referencia` no schema legado. Não usar `c.referencia`. |
| `estoques` | `e` | `produto`, `filial`, `localizacao`, `emestoque`, `reservado`, `transito`, `futuro`, `reservaprevia` | A chave é composta por `(produto, filial)`. |
| `filiais` | `f` | `codigo`, `nome`, `tipofilial`, `filial_estoque` | Para uma filial lógica tipo `V`, a filial física é `COALESCE(filial_estoque, codigo)`; os demais tipos usam `codigo`. |
| `pedidosfiliais` | `pf` | `codigo`, `produto`, `requisitante`, `requisitada`, `qtdepedida`, `qtderecebida`, `situacao` | `requisitada` identifica a filial requisitada no pedido; não substitui a resolução da filial física do estoque. |

## Exemplos corretos

```sql
SELECT
    p.referencia,
    c.descricao
FROM produtos p
INNER JOIN caracteristicas c ON c.codigo = p.caracteristica;
```

Quando a consulta também precisar da localização, o estoque deve ser ligado
pela filial física além do produto:

```sql
LEFT JOIN estoques e
    ON e.produto = p.codigo
   AND e.filial = :filial_fisica
```

Para estoque da filial requisitada, a consulta deve resolver primeiro a filial
física. A regra compartilhada é:

```sql
CASE
    WHEN UPPER(COALESCE(f.tipofilial, 'L')) = 'V'
        THEN COALESCE(f.filial_estoque, f.codigo)
    ELSE f.codigo
END
```

Depois, use o resultado na chave composta de `estoques`:

```sql
INNER JOIN filiais f ON f.codigo = pf.requisitada
LEFT JOIN estoques e
    ON e.produto = pf.produto
   AND e.filial = CASE
       WHEN UPPER(COALESCE(f.tipofilial, 'L')) = 'V'
           THEN COALESCE(f.filial_estoque, f.codigo)
       ELSE f.codigo
   END
```

Um simples `JOIN` em `pf.requisitada` não é equivalente em todos os cenários.
Quando `filial_estoque` estiver vazia ou inválida, usar o resolver
`LegacyRequisicaoFiliaisFilialFisicaResolver`, que também aplica o fallback
legado documentado no código.

## Não confundir

| Necessidade | Campo correto | Campo incorreto ou insuficiente |
|---|---|---|
| Referência comercial | `p.referencia` | `c.referencia` |
| Identidade interna do produto | `p.codigo` | `p.codigovisual` |
| Código apresentado ao operador | `p.codigovisual` | `p.codigo` como fallback visual |
| Descrição da característica | `c.descricao` | presumir que a referência mora em `caracteristicas` |
| Localização do estoque | `e.localizacao` | omitir a projeção ou buscar em `produtos` |
| Estoque físico de uma filial virtual | filial resolvida por `filial_estoque` | usar apenas `pf.requisitada` |

## Limites

Este catálogo é uma orientação semântica para consultas recorrentes. Para
qualquer coluna que não esteja na tabela acima, consultar o JSON autoritativo.
Uma consulta válida no PostgreSQL ainda precisa ser comparada com a pesquisa
SQL/Delphi do módulo para garantir paridade funcional.
