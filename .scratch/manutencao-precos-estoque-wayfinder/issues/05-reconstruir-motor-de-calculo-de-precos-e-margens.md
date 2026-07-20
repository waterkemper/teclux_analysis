Type: task
Status: resolved
Blocked by: 01, 02

## Question

Como o Delphi calcula e recalcula preço, margem, markup, custo, impostos, comissão, descontos e valores derivados na manutenção interna; quais entradas, arredondamentos, precedências e efeitos de edição existem; e o que diverge dos motores já presentes no Laravel?

Excluir fórmulas exclusivas de Marketplace e produzir casos numéricos reproduzíveis para cada caminho interno confirmado.

## Answer

### Decisão estrutural

**CONFIRMADO** — a Manutenção interna não contém uma fórmula autônoma completa em Pascal. O Delphi delega formação de preço, impostos e markup inverso à função PostgreSQL `formacaoprecovenda`, e resolução de preço por Cargo à função `estoques_preco`; o Pascal coordena entradas, propagação, margem simples, arredondamento por múltiplo e efeitos das edições (`dmmanutencaopreco.dfm:855-910`; `dmmanutencaopreco.pas:974-981,1214-1254`).

**DECISÃO NOVA** — o Laravel não deve reescrever essas funções em PHP nesta migração. O motor interno será um módulo neutro que:

1. resolve dados e Filial efetiva;
2. chama em lote as funções legadas no PostgreSQL;
3. calcula apenas as fórmulas locais comprovadas;
4. devolve uma projeção determinística para o grid/prévia;
5. persiste somente os campos armazenados aprovados no F5.

O fallback SQLite existente serve para testes estruturais, mas não é oráculo de paridade comercial.

### Entradas e valores derivados

| Conceito | Origem/contrato | Classificação e evidência |
|---|---|---|
| Custo da Filial | `estoques.valorultimacompra` do Produto na Filial efetiva. | **CONFIRMADO** — `dmmanutencaopreco.pas:962-974`. É o custo passado a `formacaoprecovenda` e o numerador da margem exibida. |
| Custo médio geral | `sum(estoques.financeiro) / sum(emestoque + reservado + reservaprevia + transito + demonstracao + conserto + danificada)`, ou zero quando o denominador é zero. | **CONFIRMADO** — `dmmanutencaopreco.pas:955-966`. É informativo/read-only, não foi localizado como entrada do recálculo. |
| Preço com/sem ICMS | `estoques.precocomicms` e `estoques.precosemicms` na Filial. | **CONFIRMADO** — `dmmanutencaopreco.pas:967-973`; ambos são read-only (`:2774-2776`). Não são editados nem persistidos por este módulo. |
| Custo com ajuste fiscal | Para CSOSN `101`/`102`, `valorultimacompra + (precocomicms - precosemicms)`; caso contrário, última compra. | **CONFIRMADO** — `dmmanutencaopreco.pas:967-970`. **NÃO LOCALIZADO** — uso desse campo no recálculo interno; a chamada Pascal passa `ultimacompra`, não `ultimacompra_com_icms`. Não convertê-lo em entrada nova. |
| Markup direto | `caracteristicas.markup`, editável e compartilhado por Característica. | **CONFIRMADO** — edição é propagada a todas as linhas da mesma Característica e chama formação de preço (`dmmanutencaopreco.pas:1469-1503,2118-2147`). |
| Preço antes dos impostos | Saída `precovendaantesimpostos` de `formacaoprecovenda`. | **CONFIRMADO** — projetado e read-only (`dmmanutencaopreco.pas:974,2021-2026,2776`). |
| Preço de venda calculado | Saída `precovenda` de `formacaoprecovenda`. | **CONFIRMADO** — projetado/read-only e, ao editar markup, substitui o Valor da Coluna Normal quando a função retorna valor diferente de zero (`dmmanutencaopreco.pas:981,2021-2038,2784`). |
| Markup inverso | Saída `markup_inverso` de `formacaoprecovenda` quando recebe o preço normal informado. | **CONFIRMADO** — ao editar o Valor Normal, o Delphi recalcula somente o derivado e não o persiste como campo próprio (`dmmanutencaopreco.pas:1450-1459,2042-2059,2782`). |
| Margem da coluna | `(1 - custo_ultima_compra / valor_coluna) × 100`; se valor for zero, margem zero. | **CONFIRMADO** — SQL e recálculo Pascal em `dmmanutencaopreco.pas:1074-1080,2027-2030,2063-2074`. Margem é derivada/read-only. |
| Desconto por Cargo | Percentual armazenado em `produtoscargos.markup`; preço do Cargo vem de `estoques_preco(produto, filial, percentual, normal, promocional)`. | **CONFIRMADO** — `dmmanutencaopreco.pas:1200-1254,2456-2533`. Detalhamento completo permanece em **Delimitar preços e descontos por Cargo**. |

**NÃO LOCALIZADO** — comissão editável ou fórmula de comissão no caminho interno. Referências a comissão encontradas no mesmo data module pertencem às projeções Marketplace. Não integrar comissão ao motor interno.

**NÃO LOCALIZADO** — fórmula de impostos dentro de `formacaoprecovenda`; seu corpo não está versionado neste workspace. Paridade deve ser validada chamando a função real, não inferindo alíquotas a partir dos campos exibidos.

### Precedência e Filial efetiva

**CONFIRMADO** — no F6, a Filial efetiva é:

- Filial selecionada, quando “preços diferenciados” está ativo;
- caso contrário, `FilialBase`.

Ela resolve `preconormal`, `precopromocao`, custo e projeções (`dmmanutencaopreco.pas:1018-1036`).

**POSSÍVEL BUG LEGADO** — os recálculos posteriores de markup, markup inverso e Cargo passam novamente `filialbase`, mesmo quando o F6 foi gerado para outra Filial (`dmmanutencaopreco.pas:2006-2010,2044-2049,2521-2529`). Isso pode fazer o grid iniciar com uma Filial e recalcular com outra. Não reproduzir automaticamente.

**DECISÃO NOVA** — o Laravel carrega uma única `filial_efetiva` na revisão da consulta e a usa em resolução, edição, prévia, prova sensível e commit. Trocar a Filial torna o conjunto consultado obsoleto e exige novo F6.

### Efeitos de edição

**CONFIRMADO** — editar Valor ou Validade identifica a célula pela chave `Característica + Faixa + Coluna` e propaga a mudança para todas as linhas que compartilham essa chave (`dmmanutencaopreco.pas:1392-1465,1579-1614`). Isso decorre da identidade de preço já confirmada, não é atualização produto a produto.

**CONFIRMADO** — editar o Valor da Coluna Normal:

- mantém o preço informado como fonte;
- chama `formacaoprecovenda` com esse preço para recalcular markup inverso;
- recalcula a margem simples;
- recalcula preços derivados de Cargo.

Evidência: `dmmanutencaopreco.pas:1450-1459,2042-2115`.

**CONFIRMADO** — editar markup direto:

- propaga o markup para toda a Característica;
- chama `formacaoprecovenda` por Produto/custo;
- se `precovenda` retornado for diferente de zero, substitui o Valor Normal;
- recalcula margem, markup inverso e preços de Cargo.

Evidência: `dmmanutencaopreco.pas:1469-1503,1997-2147`.

**CONFIRMADO** — editar uma coluna que não seja Normal nem Promocional apenas altera o Valor/Validade compartilhado. Não há formação de preço comprovada para ela (`dmmanutencaopreco.pas:1450-1465,1579-1605`).

**CONFIRMADO** — selecionar outra Coluna Promocional recalcula os preços derivados de Cargo para todas as linhas, sem persistir por si só o mapeamento da Filial (`dmmanutencaopreco.pas:2158-2201`).

### Arredondamento e múltiplos

**CONFIRMADO** — aplicação percentual e cópia calculam primeiro a parcela percentual com `RoundTo(..., -2)` e depois aplicam `ArredondarPrecoProduto` ao total (`dmmanutencaopreco.pas:607-635,654-705`).

**CONFIRMADO** — o múltiplo efetivo é o primeiro valor positivo nesta ordem:

1. Característica do Produto (`caracteristicas.multiplo`, chamado de `multiplo_produto` no dataset);
2. Grupo;
3. Classe;
4. parâmetro `MULTIPLO DE PRECO`;
5. nenhum arredondamento.

Evidência: `dmmanutencaopreco.dfm:346-383`; `dmmanutencaopreco.pas:580-597`.

**CONFIRMADO** — `Multiplo` sempre eleva um valor positivo que não seja múltiplo exato para o próximo múltiplo; não escolhe o múltiplo mais próximo (`biblio.pas:2422-2431`).

**DECISÃO NOVA** — o motor trabalha internamente com decimal, registra valor bruto e valor arredondado na prévia e só normaliza para a escala persistida no final. Não usar `float` como representação de domínio nem o `round()` binário do PHP como definição da regra.

### Casos numéricos reproduzíveis

Estes casos são obrigatórios como testes unitários do coordenador local:

| Caso | Entrada | Resultado esperado |
|---|---|---|
| Margem comum | custo `60,00`, preço `100,00` | margem `40,00%`. |
| Custo zero | custo `0,00`, preço `100,00` | margem `100,00%`. |
| Preço zero | custo `60,00`, preço `0,00` | margem `0,00%`, sem divisão. |
| Cargo a partir do preço | preço-base efetivo `100,00`, desconto `10,00%` | preço Cargo `90,00` no stub aritmético; em PostgreSQL, o valor oficial é o retorno de `estoques_preco`. |
| Desconto reverso do Cargo | base `100,00`, preço Cargo informado `90,00` | desconto `10,00%`: `100 - (90 × 100 / 100)`. |
| Promoção no reverso Cargo | normal `100,00`, promocional válida `80,00`, Cargo `72,00` | desconto `10,00%`, pois a base é a promocional. |
| Promoção ausente/zero | normal `100,00`, promocional `0,00`, Cargo `90,00` | desconto `10,00%`, usando a normal. |
| Percentual e múltiplo | origem `100,01`, acréscimo `10%`, múltiplo `0,05` | parcela percentual arredondada `10,00`; subtotal `110,01`; resultado `110,05`. |
| Múltiplo exato | subtotal `110,00`, múltiplo `0,05` | `110,00`. |
| Precedência do múltiplo | Produto `0`, Grupo `0,10`, Classe `0,05`, sistema `1,00`, subtotal `100,01` | `100,10`, usando Grupo. |
| Sem múltiplo | todos os múltiplos `0`, subtotal `100,01` | `100,01`. |

Para `formacaoprecovenda`, criar casos dourados de integração no PostgreSQL real. Cada fixture fixa Produto, Filial, última compra, markup e preço informado e compara todas as saídas (`precovenda`, `precovendaantesimpostos`, `markup_inverso`) diretamente com a função. **DÚVIDA** — sem o corpo da função e sem execução autorizada no banco neste workspace, não há evidência para inventar resultados numéricos de impostos/markup inverso.

### Comparação com o Laravel existente

**CONFIRMADO** — `LegacyProductPriceEngineRepository` já oferece peças reutilizáveis: resolução Normal/Promocional por Filial, validade da Promoção, chamadas em lote a `estoques_preco` e agrupamento por markups. É a base mais próxima do contexto interno.

**DIVERGENTE** — o fallback SQLite desse repositório documenta que aplica `base × (1 - markup/100)` e não replica integralmente PostgreSQL. Ele não pode aprovar paridade de formação de preço.

**DIVERGENTE** — `MarkupMarginConverter`, motores de margem final, frete, comissão e preço de venda Marketplace pertencem ao contexto excluído. Mesmo que alguma fórmula pareça equivalente, não será usada como fonte do motor interno.

**DECISÃO NOVA** — aprofundar `LegacyProductPriceEngineRepository` (ou encapsulá-lo numa interface interna) para expor operações em lote e resultados tipados, mantendo chamadas SQL em um adaptador profundo. UI, service e gravação não conhecem nomes de funções PostgreSQL.

### Lacunas encaminhadas

- **DÚVIDA** — comportamento oficial de `formacaoprecovenda` para custo zero, markup negativo, markup limite, preço informado zero e incidências fiscais; exige casos dourados no banco real.
- **DÚVIDA** — escala física das colunas e política exata de empate do `RoundTo`; o spec deve usar decimal e validar contra amostras Delphi antes do rollout.
- **POSSÍVEL BUG LEGADO** — em `AtualizarDescontoCargos`, a margem divide diretamente pelo preço Cargo sem guarda explícita para zero (`dmmanutencaopreco.pas:2531`). O novo motor retorna margem zero/indisponível conforme contrato explícito, sem reproduzir exceção.
- **DÚVIDA** — Promoção, validade e Cargo serão refinados respectivamente em **Delimitar promoções, percentuais e validade** e **Delimitar preços e descontos por Cargo**.

Esta fatia está suficientemente independente para um `$to-spec` próprio do **motor comercial interno**, mas recomenda-se gerar esse spec depois das decisões de Promoções e Cargo, incorporando-as como consumidores do mesmo motor.
