Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual deve ser o modelo de domínio canônico para preço interno no Laravel: identidade por Produto/Filial/coluna, preço normal, preço promocional, validade, margem, markup, custo e demais valores exibidos; quais dados são persistidos, calculados ou apenas projetados; e qual é a relação com cadastro/configuração de colunas de preço?

Confrontar o vocabulário do usuário com schema, PAS/DFM e consumidores existentes antes de fixar nomes e invariantes.

## Answer

### Modelo canônico aprovado

```text
Característica de Produto
    └── Faixa de Preço (`precos`, identidade característica + código)
          └── Valor de Preço (`colunasprecos`, identidade característica + faixa + coluna)
                └── Coluna de Preço (`colunas`)

Produto ──seleciona──> Faixa de Preço
Filial ──configura──> Coluna normal + Coluna promocional

Produto + Filial + data
    └── resolve Preço Efetivo na Filial
          └── aplica Desconto por Cargo quando houver contexto de Cargo
```

- `CONFIRMADO` — `produtos.preco` seleciona uma Faixa de Preço do Produto; a Faixa pertence à Característica e é identificada em `precos` pela Característica + código. Evidências: join `precos pr ... pr.caracteristica = c.codigo` em `delphi/apps/estoque/dmmanutencaopreco.pas:984-991`; leitura/gravação de `produtos.preco` em `dmmanutencaopreco.dfm:1229-1261` e `dmmanutencaopreco.pas:1518-1532`, `:1746-1761`.
- `CONFIRMADO` — o valor monetário não está em `produtos` nem em `filiais`: `colunasprecos` usa a chave Característica + Faixa + Coluna e mantém `valor` e `validade`. Evidências: `dmmanutencaopreco.dfm:102-160`; SQL de inserção/alteração em `dmmanutencaopreco.pas:1621-1634`, `:4051-4071`.
- `CONFIRMADO` — `filiais.preconormal` e `filiais.precopromocao` apontam para o catálogo `colunas`; a Filial escolhe o papel das Colunas, mas não possui uma cópia própria de cada valor. Evidências: `dmmanutencaopreco.dfm:247-275`; `delphi/apps/adminsistema/fmcadastrofiliais.dfm:2981-3216`.
- `CONFIRMADO` — o Laravel existente já resolve a mesma forma física em `LegacyProductPriceEngineRepository::resolveForItemFiliaisBatch`, carregando as Colunas da Filial e depois os valores de `colunasprecos`. Evidência: `laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyProductPriceEngineRepository.php:48-150`.

### Vocabulário decidido

| Termo | Significado canônico | Representação legada |
| --- | --- | --- |
| Faixa de Preço | opção escolhida pelo Produto dentro da Característica | `precos` + `produtos.preco` |
| Coluna de Preço | referência compartilhada que uma Filial pode usar como normal/promocional | `colunas` |
| Valor de Preço | valor e validade da combinação Característica + Faixa + Coluna | `colunasprecos` |
| Preço Efetivo na Filial | projeção resolvida para Produto + Filial + data | funções `estoques_preco*`/resolver Laravel |
| Desconto por Cargo | percentual por Produto + Cargo aplicado ao preço comercial | `produtoscargos.markup` |

`DECISÃO NOVA` — esses termos foram aprovados e registrados no `CONTEXT.md`. “Preço da Filial” não deve sugerir que a Filial possui um valor independente; ela configura Colunas compartilhadas.

### Compartilhamento e identidade

- `CONFIRMADO` — Produtos da mesma Característica que selecionam a mesma Faixa compartilham os mesmos Valores de Preço. O Delphi, ao editar uma linha, rastreia por `caracteristica + preco + coluna` e propaga valores equivalentes no dataset. Evidências: `dmmanutencaopreco.pas:1397-1443`, `:1579-1612`.
- `DECISÃO NOVA` — esse compartilhamento será preservado. A prévia deve destacar todas as linhas/Produtos afetados por uma alteração do Valor de Preço e informar a cardinalidade; a interface não pode fingir que a edição pertence apenas à linha clicada.
- `CONFIRMADO` — reatribuir `produtos.preco` muda a Faixa usada por um Produto sem alterar os Valores compartilhados. Evidências: `dmmanutencaopreco.pas:1518-1532`, `:1746-1761`.
- `DECISÃO NOVA` — **Reatribuir Faixa de Preço do Produto** é operação distinta na prévia e Auditoria, embora possa participar do mesmo lote F5.
- `CONFIRMADO` — várias Filiais podem apontar para a mesma Coluna. Evidência: FKs/catálogo em `LegacyColunasPrecoCatalogRepository.php:13-17` e configuração por Filial no Delphi citada acima.
- `DECISÃO NOVA` — a Filial escolhida é contexto de resolução, não proprietária do Valor. A prévia deve listar todas as Filiais potencialmente afetadas quando compartilham uma Coluna alterada.

### Normal, promocional, validade e Promoção

- `CONFIRMADO` — `validade` está fisicamente em qualquer registro de `colunasprecos`, e as operações Delphi permitem aplicar/copiar validade em qualquer Coluna. Evidências: `dmmanutencaopreco.dfm:102-156`; `dmmanutencaopreco.pas:601-702`.
- `CONFIRMADO` — os consumidores localizados usam a validade da Coluna promocional para decidir vigência; o normal permanece referência. Evidências: consultas em `delphi/apps/estoque/dmemissaoetiquetas.pas:5963-5989`; resolver Laravel em `LegacyProductPriceEngineRepository.php:173-230`.
- `DECISÃO NOVA` — Validade do Valor de Preço permanece propriedade geral por compatibilidade, mas a regra comercial inicial de substituição usa a validade da Coluna promocional. Não haverá expiração inventada para o normal.
- `DECISÃO NOVA` — uma promoção vencida permanece armazenada e visível; apenas deixa de participar do Preço Efetivo na Filial.
- `CONFIRMADO` — há dois mecanismos distintos: `precos.promocao` vincula opcionalmente uma Promoção e `colunasprecos` mantém valor/validade. Evidências: `dmmanutencaopreco.dfm:1270-1313`; `dmmanutencaopreco.pas:1536-1571`, `:1764-1790`.
- `DECISÃO NOVA` — o vínculo ao Cadastro de Promoção é classificação/campanha opcional para identificação e filtros. Um preço promocional pode estar vigente sem campanha vinculada; sua vigência depende do Valor promocional e validade.

### Precedência do Preço Efetivo na Filial

1. usar o Valor da Coluna promocional quando existir e estiver vigente na data de referência;
2. caso contrário, usar o Valor da Coluna normal;
3. se nenhum existir, retornar **preço não configurado**, nunca zero;
4. quando o contexto comercial possuir Cargo aplicável, calcular o preço após o Desconto por Cargo.

- `CONFIRMADO` — o resolver Laravel já projeta normal, promocional, validade, situação da promoção e preço efetivo com fallback ao normal. Evidência: `LegacyProductPriceEngineRepository.php:13-31`, `:173-230`.
- `DECISÃO NOVA` — ausência e zero possuem a mesma consequência persistente no legado, mas a UI usará “não configurado”/“Limpar valor”, não R$ 0,00. Gravar valor zero remove a combinação de `colunasprecos`. Evidências: `dmmanutencaopreco.pas:1687-1694`, `:4051-4058`.

### Persistido versus calculado

| Informação | Natureza aprovada |
| --- | --- |
| seleção da Faixa pelo Produto | persistida em `produtos.preco` |
| vínculo opcional com Promoção | persistido em `precos.promocao` |
| Valor de Preço e validade | persistidos em `colunasprecos` |
| Colunas normal/promocional da Filial | persistidas em `filiais` |
| markup da Característica | persistido em `caracteristicas.markup` |
| Desconto por Cargo | persistido por Produto + Cargo em `produtoscargos.markup` |
| custo/última compra/custo médio | projeções provenientes de Estoque/Entradas |
| margem, markup inverso e preço de formação | projeções calculadas |
| Preço Efetivo na Filial | projeção calculada por Produto + Filial + data/contexto |
| preço e margem resultantes do Cargo | projeções calculadas |

- `CONFIRMADO` — o grid torna custo, margem, markup inverso e preço calculado somente leitura, enquanto markup e Valores/validade são editáveis. Evidência: `dmmanutencaopreco.pas:2726-2804`.
- `DECISÃO NOVA` — valor armazenado e valor calculado/proposto serão apresentados separadamente. Uma projeção somente vira novo Valor de Preço por ação explícita do Usuário e aparece como mudança na prévia.

### Desconto por Cargo

- `CONFIRMADO` — a chave física é Produto + Cargo; o campo persistido chama-se `markup`, mas o Delphi o apresenta como “DESCONTO” e calcula preço/margem derivados. Evidências: `fmcadastrocaracteristicas.dfm:8508-8582`; `dmmanutencaopreco.dfm:1066-1110`; `dmmanutencaopreco.pas:2456-2663`.
- `DECISÃO NOVA` — o termo do negócio permanece **Desconto por Cargo**. Não renomear a linguagem do Usuário para “Ajuste” ou “Markup”; o nome físico legado fica encapsulado na persistência.
- `DECISÃO NOVA` — percentual é persistido, preço e margem são projeções. A fórmula e o comportamento em casos-limite serão confirmados em **Delimitar preços e descontos por Cargo**.

### Fronteira do Cadastro de Colunas

- `CONFIRMADO` — a Manutenção Delphi apenas pesquisa `colunas` e inclui/altera/exclui Valores em `colunasprecos`; não abre nem mantém o catálogo. Evidências: `fmmanutencaopreco.pas:1342-1347`; `dmmanutencaopreco.dfm:7-53`, `:160-176`; ausência de `fmcadastrocolunasprecos` nas uses/clicks.
- `CONFIRMADO` — o Cadastro de Colunas existe separadamente e é alcançado pelo Cadastro de Características/Produtos. Evidências: `delphi/apps/estoque/fmcadastrocolunasprecos.dfm:5-320`; `fmcadastrocaracteristicas.pas:771`.
- `DECISÃO NOVA` — o Laravel manterá essa fronteira: Manutenção seleciona Colunas existentes e manipula Valores, mas não inclui, renomeia ou exclui a Coluna do catálogo.

### Invariantes para os próximos tickets

- Valor de Preço é único por Característica + Faixa + Coluna.
- Produto deve selecionar uma Faixa válida dentro da própria Característica.
- Colunas normal e promocional são papéis configurados pela Filial sobre o catálogo compartilhado.
- Promoção vigente tem precedência sobre normal; vencida não é apagada.
- ausência de Valor não é zero e impede inventar preço.
- reatribuição de Faixa e alteração de Valor são comandos conceitualmente distintos.
- impacto compartilhado em Produtos e Filiais deve aparecer antes do F5.
- projeções nunca são persistidas implicitamente.

`CONFIRMADO` — esta modelagem desbloqueia **Reconstruir motor de cálculo de preços e margens** junto das demais dependências, mas ainda não recebe `$to-spec` isolado. Ela compõe o spec futuro do núcleo de consulta/simulação/gravação após filtros, cálculos, operações e concorrência estarem resolvidos.
