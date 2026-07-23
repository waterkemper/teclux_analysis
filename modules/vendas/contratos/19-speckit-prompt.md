# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **preparação e seleção fiscal** do Contrato (`PrepararSolicitacaoFiscal`) — Etapa 9 (Esforço fiscal posterior), primeiro dos três specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`), `FaturarContrato` (`09-speckit-prompt.md`) e os lotes/conferência (`06-speckit-prompt.md`), cujas obrigações fiscalizáveis este comando seleciona e planeja.

**Esta etapa não bloqueia a primeira liberação do Cadastro até `F`.** O mapa já decidiu isso explicitamente: `P/N`, venda futura, simples faturamento/remessa e emissão fiscal são esforço próprio, posterior ao gate `O → R → F`. Este spec entrega **só a preparação**: seleção de linhas/lote/série, cálculo de restante, resolução de Natureza Padrão/CFOP e rateio financeiro — produzindo uma fotografia imutável e alocações reservadas, **sem transmitir nada e sem criar `dadosfiscais`**. Submissão ao emissor/SEFAZ é o spec 20; autorização, cobertura `P/N`, consumo de estoque e compensação são o spec 21.

Não implemente nesta etapa: transmissão a qualquer emissor/SEFAZ; criação de `dadosfiscais`, nota ou cupom; consumo físico de estoque; derivação de `P/N`. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt, incluindo a matriz dourada, como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar que nenhum planejador fiscal de Contrato existe hoje; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- **identidade estável de obrigação fiscalizável** por linha comercial faturável — nunca `coalesce(numero, primogenito)` nem união implícita por linhagem; Contrato derivado (spec 12) só herda cobertura mediante transferência explícita dessa identidade; `primogenito` permanece metadado, nunca identidade fiscal;
- cálculo de **restante** = obrigação vigente − alocações de documentos autorizados e não cancelados; para produto sem lote, por produto; para produto com lote, por `produto + filial + lote`; só contam documentos com situação válida (autorizados, não cancelados);
- **seleção explícita** de linhas/quantidade/lote/série pelo usuário — o servidor sempre reconstrói o restante, nunca confia em quantidade/saldo/CFOP/impostos enviados pelo navegador; seleção vazia não muda nada; quantidade zero/negativa, acima do restante, série/lote incompatível, item cancelado ou revisão divergente falham antes de gerar a solicitação;
- **`incluirnanotafiscal` como estado de seleção da operação**, não atributo permanente do item — o modelo persistente registra alocações `item/quantidade → documento fiscal` (planejado), não uma flag booleana;
- bloqueio de saldos/lotes/séries selecionados por `revision`, lock das alocações ainda disponíveis e chave idempotente — duas preparações concorrentes não podem alocar a mesma unidade;
- unicidade de `produto + série` entre solicitações ativas/documentos válidos dentro do Contrato (unicidade global entre Contratos permanece `DÚVIDA`, não presumida); quantidade seriada inteira e igual ao número de séries;
- separação de **produto e serviço** como obrigações distintas mesmo em documento conjugado (quando configurado); geração de documento conjugado versus documentos separados conforme parametrização;
- resolução de **Natureza Padrão/CFOP/tipo de movimento/indicador de movimento físico** por um `FiscalDocumentPlanner`, particionando a seleção por perfis fiscais compatíveis; configuração ausente ou ambígua **bloqueia com diagnóstico concreto**, sem fallback silencioso; inclui a escolha do usuário sobre mercadoria sem trânsito quando o parâmetro correspondente estiver ativo;
- **rateio financeiro da preparação**: acréscimo, descontos financeiro/geral/cashback, frete, seguro, IPI e desconto de item rateados proporcionalmente pela quantidade selecionada, com resíduo atribuído deterministicamente à última alocação elegível; vencimentos do documento são fotografia/rateio do compromisso já existente (spec 4/9) — nunca recriam parcela nem mutam retroativamente a proposta faturada;
- detecção de **transferência automática** quando a origem do item difere da filial base e o item permite transferência — planejada como pedido correlacionado, não executada nesta fatia;
- detecção de **simples faturamento** (venda futura + parâmetro ativo) como perfil fiscal próprio, sem consumo físico nesta fase — a remessa vinculada é tratada no spec 21.

Não inclua: submissão ao emissor/SEFAZ (spec 20); autorização, `dadosfiscais` real, consumo de estoque, derivação `P/N`, cancelamento/compensação fiscal (spec 21); cálculo tributário (incidência/alíquota) — a preparação consome Natureza/CFOP já resolvidos, não calcula tributo; qualquer transição de situação do Contrato além do que já existe em `F`.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo a matriz dourada, já foram extraídas no workspace de análise a partir de `dmcadastrocontratos.pas/.dfm` e `fmcadastrocontratos.pas`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar a ausência de qualquer planejador fiscal de Contrato e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- Confirme a ausência: busque por `FiscalDocumentPlanner`, `SolicitarDocumentoFiscal`, `PrepararSolicitacaoFiscal` ou qualquer planejador/emissor fiscal de Contrato no checkout atual antes de prosseguir.
- `App\Services\Vendas\NaturezaVendaService`, `App\Infrastructure\Persistence\Legacy\Vendas\LegacyNaturezaRepository`, `App\Infrastructure\Persistence\Legacy\Configuracoes\LegacyNaturezasPadraoRepository` — já administram `naturezas`/`naturezaspadrao`/CFOP/tipo de movimento como **cadastros de configuração**; são dependência de leitura para o planejador, não implementação suficiente da emissão. Reaproveite a leitura, não recrie os cadastros.
- `App\Support\Vendas\ContratoSituacaoDocumentalMapper`/spec 10 (Documentos fiscais) — já projeta e exibe documentos fiscais existentes (leitura); este spec produz o **plano** que futuramente alimentaria essa mesma projeção, não uma segunda tela de documentos.
- Reserva/lotes (spec 5/6) — `ExecuteContratoEstoqueReservaCommand`, `StockKey`, `LegacyContratoEstoqueRepository::lockStockKeys` — a preparação bloqueia saldos/lotes pela mesma chave e ordem determinística já estabelecidas; não inventa um segundo mecanismo de lock de estoque.
- Séries (spec 6, DÚVIDA preservada) — nenhuma implementação de unicidade global de série existe; confirme que continua `NÃO LOCALIZADO` antes de presumir qualquer garantia entre Contratos.
- `ContratoPropostaFinanceiraService` (spec 4) — reaproveite os valores faturados imutáveis (spec 9) como base do rateio financeiro da preparação; não recalcule o compromisso do zero.

## Evidência Delphi confirmada

### Identidade da obrigação e cobertura

- `CONFIRMADO` — para produtos sem lote, o restante legado é `sum(quantidade - cancelado) - sum(quantidade em produtosdadosfiscais)`; para produtos com lote, a mesma conta por `produto + filial + lote`. Só entram documentos com `dadosfiscais.situacao = 'N'`; nota vinculada e simples faturamento são excluídos. Evidência: `dmcadastrocontratos.dfm:5133-5426`.
- `CONFIRMADO` — o SQL legado tenta considerar o contrato atual e o `primogenito` via `RefazConsultaProdutosEntregar` (`dmcadastrocontratos.pas:12606-12620`; CTE e ramos em `dmcadastrocontratos.dfm:5148-5265,5317-5407`).
- `DIVERGENTE` — `coalesce(numero, primogenito)` e uniões implícitas por linhagem tornam difícil provar qual linha comercial foi coberta; `primogenito` não será usado como identidade fiscal.
- `DECISÃO NOVA` — cada linha comercial faturável recebe identidade estável de obrigação; Contrato derivado só herda cobertura mediante transferência explícita dessa identidade; restante é obrigação vigente menos alocações de documentos autorizados e não cancelados.

### Seleção, lotes e séries

- `CONFIRMADO` — o Delphi persiste marca booleana `incluirnanotafiscal`, impede selecionar item cancelado/já emitido e oferece marcar todos (`dmcadastrocontratos.pas:9762-9838`; evento em `fmcadastrocontratos.pas:3564-3568`).
- `CONFIRMADO` — depois da marcação, o legado calcula o restante e limita a quantidade ao reservado, com `FOR UPDATE` sobre estoque e estoque por lote (`dmcadastrocontratos.pas:10438-10464,10523-10646,10685-10835`).
- `INFERIDO` — a interface marca a linha inteira e o backend escolhe o restante possível; o Laravel precisa de seleção explícita de quantidade parcial arbitrária, porque emissão parcial é requisito do domínio, não cópia da limitação visual.
- `CONFIRMADO` — séries capturadas no faturamento são copiadas para `produtosdadosfiscaisseries` conforme a quantidade selecionada; as já usadas em documento `N` do mesmo contrato são removidas da lista disponível (`dmcadastrocontratos.pas:9554-9578`; SQL `dmcadastrocontratos.dfm:12435-12468`).
- `NÃO LOCALIZADO` — não há prova de unicidade global da série entre contratos; o filtro Delphi restringe a busca ao contrato atual.
- `DECISÃO NOVA` — a preparação bloqueia alocações por identidade de linha/lote/série e garante unicidade de `produto + série` entre solicitações ativas/documentos válidos; quantidade seriada é inteira e igual ao número de séries.

### Produtos, serviços e rateios

- `CONFIRMADO` — o Delphi gera documento conjugado quando configurado; caso contrário, produtos e serviços seguem documentos separados, com séries fiscais e vencimentos próprios (`dmcadastrocontratos.pas:11136-11233`).
- `CONFIRMADO` — acréscimo, descontos financeiro/geral/cashback, frete, seguro, IPI e desconto de item são rateados pela quantidade selecionada; no último lote/documento, o legado aplica o resíduo para fechar o total original (`dmcadastrocontratos.pas:8959-9113`; SQL `dmcadastrocontratos.dfm:9837-9870`).
- `DECISÃO NOVA` — o planejador usa os valores faturados imutáveis, rateia proporcionalmente em precisão fiscal e atribui o resíduo à última alocação elegível; documentos não recriam parcelas; vencimentos são fotografia/rateio do compromisso de `F`.
- `DECISÃO NOVA` — produto e serviço são obrigações separadas mesmo quando materializadas em documento conjugado.

### Natureza Padrão, CFOP e modalidades

- `CONFIRMADO` — o usuário pode informar se os produtos saem da empresa quando `Possuivendasemtransitopeloestabelecimento` está ativo; isso escolhe Natureza Padrão distinta para venda normal/produção própria sem trânsito (`dmcadastrocontratos.pas:2710-2715,9513-9526`).
- `CONFIRMADO` — o Delphi resolve naturezas distintas para venda normal, produção própria, substituto/substituição, brinde, garantia, cortesia, prestação, simples faturamento e simples remessa (`dmcadastrocontratos.pas:9400-9526,11763-11904`).
- `DÚVIDA` — a resposta "não sai da empresa" muda a Natureza, mas o efeito físico final depende de `tipomovimento/ind_mov_fisica` configurados; não presuma que "sem trânsito" sempre baixa ou nunca baixa estoque.
- `DECISÃO NOVA` — `FiscalDocumentPlanner` particiona a seleção por perfis fiscais compatíveis e resolve Natureza Padrão, CFOP, tipo de movimento, indicador de movimento físico, modalidade produto/serviço e vínculos; configuração ausente ou ambígua bloqueia, sem fallback silencioso.
- `DIVERGENTE` — o Laravel possui cadastros/consultas de `naturezas`/`naturezaspadrao`/CFOP/tipo de movimento, mas não um planejador fiscal de Contrato.

### Matriz dourada (linhas de preparação/planejamento)

| Caso | Entrada e seleção | Plano/documentos | Falha |
|---|---|---|---|
| Venda normal total | `F`, produto 10, selecionar 10 | um plano de venda com Natureza/CFOP resolvidos | — |
| Venda normal parcial | `F`, produto 10, selecionar 4 | um plano com alocação 4 | — |
| Parcial por lote | produto 5: L1=3/L2=2; selecionar L1=3 | aloca obrigação e lote L1 | selecionar 4 de L1 falha antes de preparar |
| Produto seriado | quantidade 3; selecionar 2 e séries S1/S2 | duas séries ligadas à alocação | série vazia, repetida ou já alocada falha |
| Produto + serviço não conjugado | produto 100, serviço 50 | documento de produto e documento de serviço ligados à mesma solicitação | — |
| Produto + serviço conjugado | mesma entrada, modalidade conjugada compatível | um documento contendo ambos | — |
| Simples faturamento | item de venda futura e parâmetro ativo | documento de simples faturamento planejado | — |
| Sem trânsito pelo estabelecimento | usuário informa que mercadoria não sai da empresa | natureza padrão específica | ausência/ambiguidade de natureza bloqueia |
| Origem em outra filial | item de filial diferente, transferência automática permitida | venda + pedido de transferência correlacionado planejado | transferência não permitida bloqueia o plano |

As linhas de autorização/movimento/situação resultante desses mesmos casos (consumo de reserva, `N`/`P`, remessa, cancelamento) pertencem ao spec 21, não a este.

## Estado Laravel confirmado

- Cadastros de Natureza/CFOP/tipo de movimento já existem como configuração; nenhum planejador fiscal de Contrato existe.
- Reserva/lotes (specs 5/6) já implementam lock/ordem determinística reaproveitável; nenhuma extensão para alocação fiscal existe ainda.
- Nenhuma persistência de alocação `item/quantidade → documento fiscal` (planejado) existe.

## Decisões obrigatórias

1. Identidade de obrigação fiscalizável é estável por linha comercial; `primogenito` nunca é identidade fiscal, só metadado de linhagem.
2. Restante é sempre recalculado no servidor a partir de alocações de documentos autorizados e não cancelados; nada vindo do navegador (quantidade, saldo, CFOP, impostos) é confiável.
3. `incluirnanotafiscal` é estado de seleção da operação corrente, nunca atributo permanente do item; a persistência é a alocação `item/quantidade → documento`, não uma flag.
4. Seleção vazia não altera nada; quantidade inválida, acima do restante, série/lote incompatível, item cancelado ou revisão divergente falham antes de qualquer preparação ser criada.
5. Lock de saldos/lotes/séries selecionados usa a mesma chave/ordem determinística já estabelecida pela reserva; chave idempotente evita que duas preparações concorrentes aloquem a mesma unidade.
6. Unicidade de `produto + série` é garantida dentro do Contrato; unicidade global entre Contratos permanece `DÚVIDA` registrada, não presumida como garantida.
7. Produto e serviço são obrigações sempre separadas na identidade, mesmo quando o documento final for conjugado.
8. `FiscalDocumentPlanner` resolve Natureza/CFOP/tipo de movimento/indicador físico por perfil fiscal compatível; ausência/ambiguidade de configuração bloqueia com diagnóstico concreto, nunca fallback silencioso.
9. Rateio financeiro da preparação usa os valores já faturados e imutáveis (spec 9); resíduo vai sempre para a última alocação elegível; vencimentos são fotografia, nunca recriam parcela.
10. Transferência automática entre filiais é apenas **planejada** nesta fatia (pedido correlacionado), nunca executada.
11. Simples faturamento é reconhecido como perfil fiscal próprio nesta fase, sem qualquer consumo físico — a remessa vinculada é tratada no spec 21.
12. A preparação nunca cria `dadosfiscais`, nunca transmite, nunca consome estoque e nunca deriva `P/N`.

## Contrato do comando `PrepararSolicitacaoFiscal`

- Entrada: identidade do Contrato, `revision` faturada, filial emissora, modalidade fiscal, seleção explícita de linhas com quantidade (e lote/série quando exigido), resposta do usuário sobre trânsito quando parametrizado, idempotency key.
- Processo: validar `revision`/elegibilidade → recalcular restante por identidade de obrigação → bloquear alocações selecionadas (ordem determinística) → validar quantidade/lote/série contra o restante → resolver perfis fiscais e Natureza/CFOP/tipo de movimento via `FiscalDocumentPlanner` → ratear valores financeiros proporcionalmente com resíduo determinístico → persistir fotografia imutável da preparação (estado `preparada`) com alocações reservadas.
- Saída: identificador da preparação, plano de documento(s) (produto/serviço separados ou conjugados conforme parametrização), alocações reservadas, avisos/bloqueios.
- Falha em qualquer etapa não deixa alocação parcial; nenhuma preparação incompleta fica reservando saldo indefinidamente (expiração pertence ao spec 20/21).

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações/parâmetros já fixada na Fundação; capabilities específicas (`fiscal.prepare`, por exemplo) seguem a mesma precedência.
- Parâmetros fiscais (`Possuivendasemtransitopeloestabelecimento`, `NotasSimplesFaturamentoemVendaFutura`, etc.) são lidos pela mesma infraestrutura de parâmetros já usada pelo restante do Cadastro.

## Testes obrigatórios

1. Toda a matriz dourada de preparação (9 casos) como Feature tests do comando real.
2. Restante recalculado corretamente por identidade de obrigação, nunca por `primogenito`/linhagem.
3. Concorrência: duas preparações disputando a mesma alocação — locks ordenados garantem que só uma reserva a unidade.
4. Natureza/CFOP ausente ou ambígua bloqueia com diagnóstico, nunca fallback silencioso.
5. Rateio: resíduo sempre na última alocação elegível; soma das alocações fecha exatamente o valor faturado selecionado.
6. Séries: unicidade dentro do Contrato garantida; vazio/duplicado/já alocado falha antes de preparar.
7. Autorização server-side: payload manipulado no frontend não altera quantidade, CFOP, imposto ou saldo aceitos pelo servidor.

Prefira Feature tests no comando real; reutilize os helpers de teste de reserva (`ContratoEstoqueReservaTestHelpers`) para os casos de concorrência/lock.

## Entregáveis

- Contrato do comando `PrepararSolicitacaoFiscal` (entrada/processo/saída).
- Matriz de evidência Delphi × Laravel, deixando explícito que nenhum planejador fiscal existe hoje.
- Critérios de aceitação e testes, incluindo a matriz dourada de preparação como suíte obrigatória.
- Riscos, dúvidas (unicidade global de série, efeito físico exato de "sem trânsito") e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- submissão ao emissor/SEFAZ (spec 20);
- autorização, `dadosfiscais` real, consumo de estoque, derivação `P/N`, cancelamento/compensação fiscal (spec 21);
- cálculo de incidência/alíquota tributária;
- qualquer transição de situação do Contrato;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
