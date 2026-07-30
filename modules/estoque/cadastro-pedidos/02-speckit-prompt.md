# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o **núcleo de orquestração do Motor de Impostos** (o laço principal de cálculo por item, comum a todas as famílias fiscais) e a família **ICMS normal** (não-substituição) — como serviço próprio e reaproveitável, construído ao lado do Motor de Custo (`modules/estoque/cadastro-pedidos/01-speckit-prompt.md`). Esta é a segunda de 8 fatias do Cadastro de Pedidos de Compra; é fundação para as specs 03-05 (demais famílias fiscais do motor de impostos) e para as specs 06-08 (telas do Cadastro de Pedidos).

Numeração desta família de prompts: 01 = Motor de Custo; 02 = este prompt (orquestração + ICMS); 03 = ICMS-ST; 04 = IPI, PIS/COFINS e Simples Nacional/CSOSN; 05 = rateio de frete/desconto/despesas acessórias e produtos compostos; 06 = Cabeçalho e Previsões; 07 = Itens; 08 = Grade, Cópia de Produtos, Formação de Preço de Venda, Documentos a Pagar e Funcionalidades Acessórias.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que a spec 01 já deve ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- a **orquestração principal**: preparação (zerar totalizadores), decisão de rateio (delegado à spec 05), laço item a item que dispara o cálculo de cada família fiscal, os 2 ajustes finos de ICMS-ST relevantes a Pedidos (fórmula na spec 04, mas o ponto de disparo é orquestrado aqui), sincronização final dos valores calculados de volta ao documento;
- a **classificação fiscal efetiva** por item (regime tributário `crt`, CSOSN vs. CST — de qual fonte usar, ver evidência abaixo) que pilota as ramificações de todas as famílias fiscais (specs 02-05);
- a família **ICMS normal** completa: base de cálculo, alíquota por tabela, valor, as duas reduções de base em paralelo (oficial vs. custo), crédito presumido Simples Nacional, FCP em 3 variantes.

Não inclua nesta entrega: ICMS-ST (spec 03); IPI, PIS/COFINS e Simples Nacional/CSOSN em profundidade (spec 04 — a classificação `crt`/CSOSN/CST **efetiva**, que é transversal, fica documentada aqui, mas os detalhes de cálculo de IPI e PIS/COFINS ficam na spec 04); rateio de frete/desconto/despesas acessórias e produtos compostos (spec 05); nenhuma tela do Cadastro de Pedidos (specs 06-08). DIFAL **não existe** para este módulo — não especifique (ver "Achados a não replicar").

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `repositorio/dmbasico.pas` (`TdtmBasico.CalcularImpostos_`, motor compartilhado, ~6.122 linhas) e `apps/estoque/dmcadastropedidos.pas` (ponto de consumo por Pedidos).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que a spec 01 já deve ter entregado.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- os artefatos entregues pela spec 01 (Motor de Custo) — este serviço roda em paralelo/depois, sobre os mesmos itens do documento;
- tabelas de alíquota de ICMS por produto + UF origem + UF destino + tipo de pessoa + contribuinte + consumidor final (`qryICMSTAbela_` no Delphi — confirmar nome/estrutura equivalente no Laravel, ex.: já usado por Consulta de Compras/Manutenção de Preços);
- cadastro de produto para os campos de classificação fiscal (NCM, CFOP, CSOSN/CST, alíquotas default) e as duas flags por produto `icmssobreipi`/`icmssobredespesasacessorias`;
- `specs/054-configuration-center` — nenhum novo Parâmetro do Sistema além dos já confirmados nas specs 01-02 do mapa anterior (Consulta de Compras) é necessário para esta fatia especificamente (a maior parte da configuração fiscal vem de tabela, não de `ParSistema`).

## Evidência Delphi confirmada

### Assinatura e parâmetros opcionais (CONFIRMADO, `dmbasico.pas:20573-20581`)

`CalcularImpostos_` recebe 16 parâmetros, incluindo `CalcularIPI`, `CalcularTodos`, `Saida`, `Calculos`/`ProdutosCompostos`/`Servicos`/`qrynfe` (opcionais, podem ser `nil`), `OrigemCalculo` (`NotaEntrada`/`CadastroPedidos`/`NotaAvulsa`/`TransferenciaEntrada`), `VendaConsumidorFinal`, `ContribICMS`, `NotaFiscalVinculada`, `msgDifAliquotaICMS`, `ReverAliquota`. A chamada feita por Cadastro de Pedidos passa `CadastroPedidos` como origem e `nil` para `Calculos`/`ProdutosCompostos`/`Servicos`/`qrynfe` — Pedidos só precisa da fatia central de cálculo por item, não do detalhamento por alíquota nem do bloco de serviços (esses dois blocos existem no motor compartilhado mas não são exercitados por Pedidos — ver "Fora de escopo").

### Estrutura da orquestração principal (CONFIRMADO por amostragem estrutural, `dmbasico.pas:23296-26694`)

1. **Preparação**: zera ~35 variáveis totalizadoras (uma por família/base de imposto), detecta se é importação (`HeImportacao`), lê totais pré-agregados do documento quando disponíveis.
2. **Decisão de rateio + laço principal por item**: decide entre rateio completo ou só despesas acessórias (fórmula na spec 06); entra no laço item a item que calcula ICMS/ICMS-ST/IPI/PIS/COFINS (chamando os cálculos das specs 02-05) e credita/debita nos totalizadores.
3. **Ajuste de centavos do ICMS-ST**: se a nota informa um valor de ICMS-ST retido que difere do somado por até R$0,10, ajusta a diferença no último item — explicitamente reconhece `CadastroPedidos` como origem válida.
4. **Rateio fino de base ICMS-ST-custo**: segundo laço por item, também reconhecendo `CadastroPedidos`, redistribuindo a base de cálculo ST de custo quando a soma por item não bate com o total informado.
5. **Sincronização**: grava os valores calculados de volta no dataset real de itens.

Para Cadastro de Pedidos, a execução relevante é: preparação → rateio (se aplicável) → laço principal (ICMS/ICMS-ST/IPI/PIS/COFINS) → os dois ajustes finos de ICMS-ST → sincronização. O quadro `Calculos` (resumo agregado por alíquota) e o bloco de Serviços/ISS existem no motor mas não são exercitados por Pedidos.

### Classificação fiscal efetiva — `crt`, CSOSN/CST (CONFIRMADO, `dmbasico.pas:20701-21004`, `dmcadastropedidos.pas:5013-5018`)

```
crt = 1 (Simples) | 2 (Simples com excesso) | 3 (Normal)
```

Se a operação pertence à própria empresa, usa o regime tributário da própria filial; senão, usa o `crt` declarado no documento da contraparte, ou `3` (Normal) por padrão. Existem **3 fontes** de classificação fiscal por item: `csosn_empresa`/`cst_empresa` (campos próprios do item, sempre); `csosn_nf`/`cst_nf` (o valor **efetivo** usado no cálculo — usa os campos "empresa" se a operação é nossa, senão os campos declarados pela contraparte); `csosn_produto`/`cst_produto` (classificação padrão do produto, fallback/referência, não operante). É a versão `_nf` que pilota as ramificações de todas as famílias fiscais.

**Especificamente em Cadastro de Pedidos**: o campo mostrado ao usuário (CSOSN vs. CST) depende do **regime tributário do fornecedor selecionado** (`crt do fornecedor = 1` → mostra CSOSN), não da filial própria — faz sentido numa compra, pois o campo relevante é o que o fornecedor vai declarar na nota dele.

### ICMS normal — base de cálculo (CONFIRMADO, `IcmsBaseCalculo`, `dmbasico.pas:21221-21373`)

```
base = quantidade × preço unitário − desconto do item + frete + seguro
     + (IPI, se produto tem icmssobreipi=true)
     + (despesas acessórias, se produto tem icmssobredespesasacessorias=true)
```

Duas exceções: (1) importação ou `NotaAcrescimoFinanceiro` usa direto o campo já gravado, sem recalcular; (2) se existe `produtototal` já calculado e o usuário não está em modo de alteração manual de ICMS, reaproveita esse total em vez de recalcular do zero. `icmssobreipi`/`icmssobredespesasacessorias` são flags **por produto**, não regra global.

### ICMS normal — valor, alíquota, reduções, crédito e FCP (CONFIRMADO, `dmbasico.pas:21505-21792`)

- `IcmsValor = base × aliquotaicms / 100` (mesmos bypasses de importação acima).
- `AliquotaICMS` consulta uma tabela parametrizada por **produto + UF origem + UF destino + tipo de pessoa + se cada lado é contribuinte de ICMS + se é venda a consumidor final** — não é uma alíquota fixa por produto.
- **Duas reduções de base distintas em paralelo**: `percentualreducaobase` (oficial, usada no valor do ICMS declarado) e `percentualreducaobase_custo` (percentual separado, só para fins de custo) — não unificar, replicar os dois pares.
- `CredICMSSN = base × pCredSN / 100` — crédito presumido quando o fornecedor é do Simples Nacional.
- FCP calculado sobre 3 bases diferentes (normal, ST, ST retido), cada uma com sua própria alíquota — mecanicamente idênticos entre si, só a base e a alíquota mudam.

### Achados a não replicar

- `IcmsValorCalculadoSimples` — inteiramente código morto (comentado); não usar como referência.
- Versões antigas/simplificadas de `AliquotaICMS` (sem os parâmetros de contribuinte/consumidor final) — comentadas, superadas pela versão atual.
- **DIFAL não se aplica a este módulo**: `Condicao_ICMSUFDest` tem `saida` como primeiro termo de uma cadeia `and`, e Cadastro de Pedidos é sempre entrada (`saida = false`) — a condição inteira é estruturalmente inalcançável. Não especificar DIFAL nesta entrega (nem em nenhuma das demais fatias do Cadastro de Pedidos).

## Decisões obrigatórias

1. A orquestração roda por item, na ordem confirmada (preparação → rateio → laço principal → 2 ajustes ICMS-ST → sincronização); os blocos "quadro Calculos" e "Serviços/ISS" não são implementados nesta entrega (não exercitados por Pedidos).
2. A classificação fiscal efetiva usa sempre a fonte "_nf" (não a "_empresa" nem a "_produto" isoladamente); em Cadastro de Pedidos, o campo mostrado ao usuário depende do regime do fornecedor.
3. Duas reduções de base ICMS em paralelo (oficial vs. custo) — replicar ambas.
4. DIFAL não é implementado — confirmado estruturalmente inaplicável a este módulo.

## Critérios de aceite

- [ ] Orquestração executa as fases na ordem confirmada, incluindo os 2 ajustes finos de ICMS-ST.
- [ ] ICMS: base bate com a fórmula (incluindo as duas exceções de bypass); alíquota resolvida por tabela UF origem/destino/contribuinte/consumidor-final; as duas reduções de base (oficial vs. custo) calculadas em paralelo.
- [ ] Divergência entre a alíquota do cadastro e a resolvida pela tabela dispara o aviso correspondente sem travar o cálculo.
- [ ] CSOSN vs. CST exibido ao usuário segue o regime tributário do fornecedor, não da filial própria.
- [ ] Nenhum cenário de Pedido gera valor de DIFAL.
- [ ] `IcmsValorCalculadoSimples` não é replicado.

## Matriz mínima de testes

- **ICMS — com e sem divergência de alíquota**: item com alíquota do cadastro igual à da tabela UF origem/destino → sem aviso; item com alíquota divergente → aviso disparado, cálculo segue pela alíquota resolvida por tabela.
- **CSOSN vs. CST por regime do fornecedor**: mesmo pedido, um fornecedor do Simples (mostra CSOSN) e um do regime Normal (mostra CST) → campo exibido muda conforme o fornecedor da linha.
- **Reduções de base em paralelo**: item com `percentualreducaobase` e `percentualreducaobase_custo` diferentes → os dois valores de base calculados independentemente, sem um sobrescrever o outro.
- **DIFAL — ausência confirmada**: mesmo simulando fornecedor de outro estado e venda a consumidor final, nenhum valor de DIFAL é gerado.
- **FCP em 3 variantes**: item com FCP normal, FCP-ST e FCP-ST-retido configurados → os 3 valores calculados independentemente, cada um com sua base e alíquota.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais da orquestração principal e da família ICMS normal;
- identifiquem os repositórios/serviços Laravel atuais a estender ou criar, após inspecioná-los;
- detalhem a ordem de execução, as fórmulas de ICMS e a resolução de classificação fiscal acima;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que ICMS-ST, IPI/PIS-COFINS/Simples, rateio/compostos e DIFAL **não fazem parte** desta entrega;
- não mandem investigar Delphi, nem inventem lógica das demais famílias fiscais.

## Fora de escopo

- implementar durante `/speckit.specify`;
- ICMS-ST (spec 03);
- IPI, PIS/COFINS, Simples Nacional/CSOSN em profundidade (spec 04);
- rateio de frete/desconto/despesas acessórias e produtos compostos (spec 05);
- DIFAL — confirmado estruturalmente inalcançável para este módulo, não especificar em nenhuma fatia;
- o quadro `Calculos` (detalhamento por alíquota) e o bloco de Serviços/ISS do motor compartilhado — não exercitados por Pedidos;
- qualquer tela do Cadastro de Pedidos de Compra (specs 06-08);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
