# `AtribuirDadosProdutos` e geração da entrada — reavaliação Delphi × Laravel

## Conclusão executiva

`AtribuirDadosProdutos` **não é uma trigger** e não é dispensável. Na confirmação por nota, o Delphi a chama explicitamente uma vez por item, com `OrigemCalculo = TransferenciaEntrada`. A rotina consulta a linha fiscal de saída e o cadastro do produto/estoque, materializa atributos fiscais e comerciais em `produtosnotaspag` e chama o cálculo fiscal com a natureza de entrada. Depois, `ConfirmaTransferencia` ainda chama `CalcularImpostos` para o conjunto inteiro. Só após esse processamento o Delphi insere os movimentos-raiz `STC` e `FTR`; as triggers de `movimentos` completam operação, saldos, financeiro e projeções.

O Laravel atual implementa apenas uma aproximação parcial: copia diretamente alguns campos de `produtosdadosfiscais`, força outros para zero/default e grava movimentos-raiz. Isso preserva parte da intenção de estoque, mas não reproduz a preparação fiscal/cadastral de `AtribuirDadosProdutos` nem prova o cálculo agregado de `CalcularImpostos`.

## Cadeia real do Delphi

Fontes primárias:

- `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas:400-450` — ordem de `ConfirmaTransferencia`;
- `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas:690-708` — construção do item e chamada explícita;
- `C:\projetos.vcl\repositorio\dmbasico.pas:14836-16230` — implementação de `AtribuirDadosProdutos`;
- `C:\projetos.vcl\repositorio\ctcontantesdmbasico.pas:899-1346` — `SQLDadosProdutosNotasSaidas`;
- `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas:530-615` — `STC`/`FTR`.

Para cada nota selecionada, a ordem é:

1. reler `dadosfiscais`, `produtosdadosfiscais` e vencimentos aplicáveis;
2. inicializar datasets cached-update;
3. incluir cabeçalho `notaspag` e resolver natureza padrão de entrada;
4. para cada item, preparar suas chaves e chamar `AtribuirDadosProdutos(..., TransferenciaEntrada, EstadoFilialBase)`;
5. incluir documento/duplicatas quando `vendatransferencia`;
6. executar `CalcularImpostos` sobre todos os itens e cabeçalho;
7. bloquear estoques, inserir `STC`/`FTR`, atualizar pedidos e aplicar o conjunto;
8. registrar ROS/ROE e recalcular romaneio.

## SQL selecionado por `AtribuirDadosProdutos`

Como o item contém `dadofiscal` e `numeroprodutotabela`, `CondicaoTransferenciaEntrada` seleciona `SQLDadosProdutosNotasSaidas`, não o SQL genérico nem o de nota de entrada.

Binds efetivos:

```sql
:dadofiscal       = produtosnotaspag.dadofiscal
:NumeroProduto    = produtosnotaspag.numeroprodutotabela
:produto          = produtosnotaspag.produto
:FilialBase       = filial destino/base
:codigonota       = novo notaspag.codigo
:fornecedor       = notaspag.fornecedor
:tipofornecedor   = 'L'
:EstadoFilialBaseCalculoPreco = UF da filial base
```

Núcleo relacional da consulta:

```sql
FROM produtosdadosfiscais pdf
JOIN produtos p                 ON p.codigo = pdf.produto
JOIN estoques e                 ON e.produto = p.codigo
JOIN caracteristicas c          ON p.caracteristica = c.codigo
LEFT JOIN tributosicms ti       ON c.incidencia = ti.codigo
JOIN grupos g                   ON c.grupo = g.codigo
JOIN classes cl                 ON c.classe = cl.codigo
JOIN precos pr                  ON pr.caracteristica = p.caracteristica
                                AND pr.codigo = p.preco
LEFT JOIN lotes l               ON l.lote = pdf.lote
CROSS JOIN filiais f
WHERE pdf.dadofiscal = :dadofiscal
  AND pdf.numero = :NumeroProduto
  AND p.codigo = :produto
  AND e.filial = :FilialBase
  AND f.codigo = :FilialBase
```

A projeção completa está na constante citada. Ela combina a fotografia fiscal de saída com cadastro atual, estoque destino, tributação, grupo/classe/preço, lote, NCM/IBPT e custo. Também calcula quantidade fiscal ainda disponível e valores já apropriados por outras entradas `N`.

O Laravel não deve reproduzir essa consulta por item. A equivalência precisa ser uma projeção set-based para todos os pares `(dadofiscal, numero, produto)`, com cardinalidade exatamente 1:1 e falha para zero ou múltiplas linhas.

## Lógica materializada

Para `TransferenciaEntrada`, a função:

- garante no Delphi a existência de `estoques(produto, FilialBase)`, criando linha zerada se ausente;
- copia quantidade/preço; define `qtdeestoque` e `fatorconversao = 1`;
- preserva vínculos da origem fiscal;
- copia IPI, PIS, COFINS, ICMS/ST/retido, descontos, reduções, frete, seguro, despesas e crédito SN;
- separa CST/CSOSN da nota de saída (`cst_nf`/`csosn_nf`) dos valores cadastrais;
- materializa descrição, unidades, NCM, EAN, origem, composição, grade, lote, pesos/dimensões e fotografias correlatas;
- executa `AtribuirDadosCalculosImpostos(..., TransferenciaEntrada, reverNatureza=true, EstadoDestino)` e `AtribuirDadosNotasRelacionadas`;
- só atribui quando a consulta retorna exatamente uma linha.

Em seguida, `CalcularImpostos` fecha os impostos/totais do documento. Logo, “triggers calculam os impostos de `produtosnotaspag`” não foi demonstrado e contradiz a ordem explícita do Delphi.

## Movimentos de entrada

Em duas passagens (não composto antes de composto), cada item gera `STC` com produto, `filial_estoque`, destino como cliente `L`, quantidade, `round(quantidade * precounitario, 2)`, referência `NF-{numero} S-{serie} TRANSFERENCIA`, nota e número do item. Se `estoques.futuro > 0`, gera `FTR` com `min(futuro, quantidade)` e valor proporcional.

`NovoMovimento` obtém `movimentos_proximonumero()` e preenche a intenção. As triggers PostgreSQL interpretam o tipo e completam saldos, financeiro, projeções e derivados. A divisão correta é:

- aplicação: materializar fiscalmente o item e escolher/preencher `STC`/`FTR`;
- triggers de `movimentos`: operação, saldos posteriores, financeiro/projeções e derivados;
- aplicação Delphi, não trigger: cálculo fiscal por item e fechamento do documento.

## Comparação com o Laravel atual

| Área | Delphi | Laravel atual | Avaliação |
|---|---|---|---|
| Fonte do item | SQL enriquecido | `produtosdadosfiscais` + `produtos` | Parcial |
| Cálculo fiscal | cálculo por item + agregado | cópia direta; ADR atribui a triggers | Lacuna crítica |
| Cabeçalho | totais/CRT/modelo/ICMS/ST reais | modelo `55`, CRT `3`, ICMS/ST zero | Divergente |
| Item | fotografia ampla, NF/cadastro separados | allowlist curta e defaults | Parcial |
| Estoque ausente | cria linha zerada | rejeita | Divergente |
| Filiais do item | `filial = FilialBase`; `filial_estoque = FilialEstoque` | somente `filial = filialEstoque` | Provável erro |
| Origem | derivada | força `origem = 0` | Divergente |
| Composição | ordem explícita | loop único | Sem prova |
| STC/FTR | intenção; trigger completa | intenção; trigger completa | Conceito correto |

Pontos concretos: `loadProdutos` não implementa a projeção enriquecida; `applyProdutoFiscalFields` declara paridade parcial, força origem e defaults; `mapProdutosNotaPag` omite `filial_estoque`; `mapNotaPag` fixa valores fiscais; `inserirMovimentos` reproduz o esqueleto `STC`/`FTR`, mas depende do item parcial. Os testes não fazem equivalência fiscal campo a campo nem exercitam as triggers PostgreSQL reais.

## Correções exigidas na etapa 4

1. Criar um oráculo explícito equivalente ao ramo `TransferenciaEntrada`.
2. Caracterizar DDL/ordem das triggers de `notaspag`, `produtosnotaspag` e `movimentos`.
3. Usar projeção set-based 1:1 e mapear todos os campos fiscalmente relevantes.
4. Decidir a divergência estoque ausente: criação concorrente compatível ou rejeição deliberada.
5. Corrigir/provar `filial` versus `filial_estoque`.
6. Provar cálculo por item e fechamento agregado contra nota-oráculo Delphi.
7. Testar PostgreSQL real para STC/FTR, composto, futuro, valores, saldos e rollback.
8. Corrigir a ADR 304: impostos só podem ser atribuídos a triggers com DDL e teste completo de paridade.
