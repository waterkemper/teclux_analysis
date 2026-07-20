Type: task
Status: resolved
Blocked by: 02, 08, 09, 10
Unblocks: 12, 13, 17

## Question

Como delimitar faturamento total, faturamento parcial e emissão/consulta de documentos fiscais em relação ao Cadastro de Contratos, incluindo pré-condições, seleção de produtos, CFOP/dados fiscais, efeitos financeiros e transições para `F`, `P` e `N`?

Decidir somente contratos e fronteiras; a implementação fiscal detalhada poderá constituir esforço próprio.

## Resolution

### Vocabulário e fronteira

- `CONFIRMADO` — no legado, **faturar o contrato** e **emitir documento fiscal** são operações diferentes. `R → F` altera o compromisso comercial/financeiro; a emissão posterior parte do contrato faturado e pode produzir `P` ou `N`. Evidências: despacho da ação em `delphi/apps/vendas/fmcadastrocontratos.pas:3089-3095`, faturamento em `:3448-3542` e `:3873-3888`, emissão em `delphi/apps/vendas/dmcadastrocontratos.pas:2641-2761`.
- `CONFIRMADO` — `F` significa **Faturado**, não “NF emitida”. O Delphi chama `AtualizarDataParcela` ao faturar e somente no fluxo documental cria `dadosfiscais`, nota/cupom, itens, vencimentos, movimentos e vínculos. Evidências: `delphi/apps/vendas/dmcadastrocontratos.pas:6142-6145`, `:7718-7738`, `:10218-11238` e `:11303-12170`.
- `DECISÃO NOVA` — haverá dois contratos de aplicação independentes: `FaturarContrato` para `R → F` e `SolicitarDocumentoFiscalContrato` para a operação fiscal posterior. O Cadastro apresenta e comanda ambos, mas não implementa cálculo tributário, numeração, transmissão ou cancelamento fiscal.
- `DECISÃO NOVA` — a primeira entrega do Cadastro termina em `F`. `P/N`, venda futura, simples faturamento/remessa, ECF/NFC-e e emissão parcial serão um esforço fiscal próprio, não condições para colocar o núcleo em produção.

### `FaturarContrato`: limite da primeira entrega

Pré-condições do comando, todas recalculadas no servidor:

- contrato persistido em `R`, `revision` atual e sem outro comando em andamento;
- cliente e fotografia fiscal mínimos válidos;
- pelo menos um produto ou serviço comercial válido;
- proposta financeira coerente com a assinatura comercial e parcelas válidas;
- reserva coerente com a mesma revisão, inclusive lotes quando exigidos;
- séries e conferência atendidas quando a política parametrizada as exigir;
- limites de crédito, cashback/crédito de troca e autorização de analista resolvidos por prova sensível, quando aplicáveis.

- `CONFIRMADO` — antes de faturar, a tela Delphi encadeia observações de produto, séries, cashback, crédito de troca e autorização; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:3873-3884`.
- `CONFIRMADO` — a autorização distingue analista de crédito e admite exceção para contrato integralmente à vista no fluxo em lote; evidências `delphi/apps/vendas/fmcadastrocontratos.pas:3448-3527` e `delphi/apps/vendas/dmoperacoescontratos.pas:551-683`.
- `CONFIRMADO` — limite/pontuação é revalidado na gravação de `F`; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:7718-7737` e `:18349-18361`.
- `DECISÃO NOVA` — `R → F`, consolidação das parcelas/razão financeiro, data de faturamento, consumo lógico da proposta e registro da autorização formam uma transação idempotente. Falha deixa o contrato integralmente em `R`.
- `DECISÃO NOVA` — `FaturarContrato` não cria `dadosfiscais`, não escolhe CFOP e não transmite documento. Também não consome fisicamente estoque; torna a reserva elegível para consumo pelo fluxo fiscal/logístico.
- `DÚVIDA` — o legado exige séries já no faturamento, embora a série seja também usada no documento. A issue “Confirmar casos dourados de reserva, movimentos, lotes, séries e identidade da conferência” deve decidir se a primeira entrega captura séries em `R → F` ou apenas garante que serão exigíveis antes da saída.

### `SolicitarDocumentoFiscalContrato`: esforço posterior

- `DECISÃO NOVA` — a solicitação recebe `contrato`, `revision faturada`, filial emissora, modalidade fiscal e uma seleção explícita de linhas com quantidade. O servidor reconstrói a quantidade restante; não confia em totais, impostos, CFOP ou saldo enviados pelo navegador.
- `CONFIRMADO` — o Delphi marca itens com `incluirnanotafiscal`, exclui itens já documentados/cancelados e considera produtos a entregar; evidências no DFM `delphi/apps/vendas/dmcadastrocontratos.dfm:634-949`, `:8020-8047` e em `delphi/apps/vendas/dmcadastrocontratos.pas:9762-9837`, `:10438-10537`.
- `DECISÃO NOVA` — `incluirnanotafiscal` é estado de seleção da operação, não atributo permanente do item. O modelo persistente registra alocações `item/quantidade → documento fiscal`, permitindo calcular restante e impedir dupla emissão concorrente.
- `DECISÃO NOVA` — seleção vazia não muda situação. Quantidade zero/negativa, acima do restante, série/lote incompatível, item cancelado ou revisão divergente falham antes de gerar a solicitação.
- `CONFIRMADO` — o Delphi bloqueia saldos e lotes com `FOR UPDATE` antes de montar itens fiscais; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:10441-10464`.
- `DECISÃO NOVA` — concorrência será protegida por `revision`, lock das alocações ainda disponíveis e chave idempotente. Duas solicitações não podem consumir a mesma quantidade.

### Estados `P/N`

- `CONFIRMADO` — o legado atribui `P` quando a entrega/documentação não é completa; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:7837-7844`. A Consulta Laravel já reconhece `P` como “NOTA PARCIAL” e `N` como “NOTA FISCAL” em `laravel/backend/app/Support/Vendas/ContratoSituacaoDocumentalMapper.php:12-23`.
- `DECISÃO NOVA` — `P/N` são estados derivados das alocações fiscais **válidas e não canceladas**: `P` quando existe documento autorizado e resta quantidade fiscalizável; `N` quando toda a obrigação fiscalizável foi coberta. O usuário não escolhe diretamente o estado.
- `DECISÃO NOVA` — criação de rascunho, rejeição ou falha de transmissão não altera `F/P/N`. A mudança ocorre somente após confirmação fiscal válida; cancelamento/denegação recalcula a cobertura e pode exigir compensação guardada.
- `DÚVIDA` — a definição exata de “obrigação fiscalizável” para serviços, brindes, itens sem trânsito, entrega futura e documentos conjugados deve ser resolvida no esforço fiscal, por casos dourados.
- `POSSÍVEL BUG LEGADO` — o setter genérico de situação não contém atribuição explícita de `P`, enquanto outro trecho escreve `'P'` diretamente (`delphi/apps/vendas/dmcadastrocontratos.pas:13996-14022` versus `:7843`). Esse acoplamento não será reproduzido.

### Natureza, CFOP e cálculo fiscal

- `CONFIRMADO` — o Delphi resolve Naturezas Padrão conforme modalidade e classificação: venda normal, produção própria, substituto/substituição, brinde, garantia, cortesia, serviço, simples faturamento/remessa e mercadoria sem trânsito. Evidências: `delphi/apps/vendas/dmcadastrocontratos.pas:9472-9526`, `:11147-11227` e `:11763-11904`.
- `DECISÃO NOVA` — o Cadastro informa contexto comercial; um `FiscalDocumentPlanner` resolve natureza, CFOP, tributação, separação produto/serviço, retenções, observações, volumes e vencimentos. CFOP não será codificado na UI nem inferido apenas pelo código do produto.
- `CONFIRMADO` — o Laravel já administra `naturezas`, `naturezaspadrao`, CFOP e tipo de movimento em `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyNaturezaRepository.php:13-74` e `laravel/backend/app/Infrastructure/Persistence/Legacy/Configuracoes/LegacyNaturezasPadraoRepository.php:15-73`.
- `DIVERGENTE` — esses cadastros Laravel existem, mas não foi localizado um planejador/emissor fiscal de Contrato. Eles são dependências de configuração, não implementação suficiente da emissão.
- `DECISÃO NOVA` — ausência ou ambiguidade de Natureza Padrão/CFOP bloqueia a solicitação com diagnóstico concreto; não haverá fallback silencioso.

### Estoque, séries, transferências e simples faturamento

- `CONFIRMADO` — a emissão Delphi liga movimentos, séries e transferências ao `dadofiscal`; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:11941-11984`.
- `DECISÃO NOVA` — após autorização fiscal, o serviço de estoque consome a reserva e registra movimentos referenciando documento e contrato. Lotes/séries são parte da alocação; pedido de transferência entre filiais é efeito durável separado.
- `CONFIRMADO` — o Delphi identifica transferência automática quando a origem do item difere da filial base e o item permite transferência; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:10293-10316` e `:10523-10537`.
- `CONFIRMADO` — simples faturamento e simples remessa têm efeitos diferentes: o legado evita movimentação em uma das fases e vincula o documento posterior ao anterior; evidências `delphi/apps/vendas/dmcadastrocontratos.pas:10180-10211`, `:11763-11774` e campo `dadofiscalsimplesfaturamento` no DFM `:4147-4168`.
- `DECISÃO NOVA` — venda futura/simples faturamento-remessa não será reduzida a uma flag. O esforço fiscal modelará pares documentais vinculados e seus efeitos próprios. Como já acordado, isso não integra a primeira entrega até `F`.

### Financeiro

- `DECISÃO NOVA` — o compromisso do cliente e o razão financeiro nascem em `F`; documentos parciais não recriam parcelas nem alteram o total contratado.
- `CONFIRMADO` — o Delphi inclui vencimentos e rateia valores no documento fiscal, inclusive separando produto e serviço; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:11147-11227`.
- `DECISÃO NOVA` — vencimentos do documento são fotografia/rateio fiscal do compromisso existente. Diferenças de arredondamento ficam no último documento/linha segundo regra fiscal, sem mutar retroativamente a proposta faturada.
- `DÚVIDA` — efeitos de documento fiscal cancelado sobre parcelas, recebimentos e contabilidade precisam de matriz própria na fatia de cancelamento/devolução.

### Consulta e reutilização Laravel

- `CONFIRMADO` — a Ficha Financeira Laravel já consulta notas/cupons de saída e devoluções, com situação e `dadofiscal`, em `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyFichaFinanceiraContratoTabsRepository.php:443-668`; a UI correspondente está em `laravel/backend/resources/js/Components/erp/vendas/fichaFinanceira/FichaFinanceiraContratoDoctosFiscaisPanel.tsx:67-94`.
- `CONFIRMADO` — o detalhe da Consulta também expõe notas fiscais em `laravel/backend/app/Services/Vendas/ConsultaContratosDetalheService.php:73-151`.
- `DECISÃO NOVA` — Cadastro, Consulta e Ficha reutilizam uma única projeção de documentos fiscais. O Cadastro não cria outro grid/repository incompatível; acrescenta comandos somente onde houver capability.
- `NÃO LOCALIZADO` — não foi encontrado no Laravel comando geral para `R → F`, emissão parcial/total, consumo de reserva ou transmissão fiscal de Contrato.

### Atomicidade e integração externa

- `DECISÃO NOVA` — banco e SEFAZ não formarão uma transação distribuída. A operação fiscal terá estados duráveis (`preparada`, `submetida`, `autorizada`, `rejeitada`, `cancelada`) e retomada idempotente.
- `DECISÃO NOVA` — preparação persiste fotografia imutável, seleção/alocações, natureza/CFOP resolvidos e chave idempotente. Transmissão ocorre fora da transação curta. Confirmação autorizada aplica situação, estoque e vínculos por comando idempotente/outbox.
- `DECISÃO NOVA` — falhas de impressão, PDF ou comunicação posterior não desfazem documento autorizado. Impressão é apresentação documental, não critério de sucesso fiscal.
- `POSSÍVEL BUG LEGADO` — o fluxo Delphi mistura gravação, ECF, impressão, contabilidade e emissão numa rotina extensa e usa variáveis defensivamente inicializadas (`delphi/apps/vendas/dmcadastrocontratos.pas:2641-2656`, `:7781-7851`). Esses acoplamentos não são requisitos.

## Spec boundary

Esta decisão comporta um `$to-spec` imediato para **faturar Contrato de `R → F`**, incluindo pré-condições, autorização, consolidação financeira e idempotência, sem documento fiscal.

Não deve ser produzido ainda um spec de emissão fiscal completo. Primeiro é necessário resolver “Confirmar casos dourados de seleção, cobertura e planejamento fiscal”; depois o esforço fiscal deve ser dividido, no mínimo, em preparação/seleção, autorização e confirmação/compensação. Consulta de documentos deve reaproveitar a projeção já existente.

## Follow-up

- [Confirmar casos dourados de seleção, cobertura e planejamento fiscal](17-confirmar-casos-dourados-de-selecao-cobertura-e-planejamento-fiscal.md)
