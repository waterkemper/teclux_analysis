Type: task
Status: resolved
Blocked by: 02, 08
Unblocks: 11, 12, 13, 16

## Question

Quais efeitos de estoque, reserva, disponibilidade, séries, conferência, filial de venda/montagem, devolução e liberação são comandados pelo Cadastro de Contratos em cada transição, e quais pertencem a módulos externos?

Mapear atomicidade, concorrência e compensações necessárias sem converter acoplamentos ou bugs legados em requisitos.

## Resolution

### Fronteira de domínio

- `CONFIRMADO` — o Cadastro comanda a intenção de reservar e a manutenção da reserva do contrato. No Delphi, o comando da tela muda a situação para `R` e chama a gravação; a gravação, por sua vez, chama `ReservarContrato`. Evidências: `delphi/apps/vendas/fmcadastrocontratos.pas:3058-3073` e `delphi/apps/vendas/dmcadastrocontratos.pas:7698-7717`.
- `CONFIRMADO` — a reserva Delphi produz dados próprios de reservas e movimentos, por produto e filial, e contempla lotes. Evidências: datasets `qryMovimentos`, `qryProdutosReservas`, `qryProdutoEstoque` e `qryProdutosContratosLotes` em `delphi/apps/vendas/dmcadastrocontratos.dfm:3050-3179`, `:7214-7349`, `:7781-7821` e `:12929-13064`; implementação em `delphi/apps/vendas/dmcadastrocontratos.pas:12625`.
- `DECISÃO NOVA` — disponibilidade é uma projeção viva (`emestoque`, `reservado`, `futuro`), nunca uma verdade copiada para o item. O Cadastro a consulta; somente comandos de reserva/liberação alteram o razão de estoque.
- `DECISÃO NOVA` — filial de venda, filial de origem do estoque e filial de montagem são conceitos distintos. A origem do estoque pertence ao item; montagem e entrega ficam para a fatia logística. Trocar a origem em `O/R` equivale a liberar na origem anterior e reservar na nova, não a editar uma coluna isolada.
- `CONFIRMADO` — ao escolher outra filial, o Delphi relê reserva e estoque e atualiza `emestoque`, `reservado`, `futuro` e preço do item. Evidência: `delphi/apps/vendas/dmcadastrocontratos.pas:13836-13869`.
- `INFERIDO` — `FiliaisIndependentes`, `PesquisaSomenteEstoqueFilialBasevendas` e `SoVisualizarEstoqueDeposito` limitam seleção/visualização; não constituem, por si, autoridade para movimentar estoque. A autoridade efetiva deve permanecer no servidor.

### Efeitos por transição no recorte O/R/F/C

| Transição/estado | Responsabilidade do Cadastro | Fora desta fatia |
|---|---|---|
| `O` | Consultar disponibilidade na origem selecionada; não reservar. Alterações comerciais invalidam conferência anterior. | Movimentação física e fiscal. |
| `O → R` | Em uma única unidade atômica: validar revisão e políticas, reler/bloquear saldos, autorizar falta/venda futura quando aplicável, criar reservas/movimentos e gravar situação/data/revisão. | Transferência física e emissão fiscal. |
| edição em `R` | Calcular no servidor o delta contra a reserva persistida; liberar removidos/reduções/origem antiga e reservar inclusões/acréscimos/origem nova na mesma transação. | Ajustes manuais externos ao contrato. |
| `R → F` | Exigir reserva coerente com a revisão comercial; validar lotes/séries e conferência quando parametrizada; entregar comando idempotente ao serviço de faturamento. | Consumo definitivo, transferência e documentos, detalhados na issue 11. |
| `O/R → C` | Liberar integralmente a reserva ativa, por compensação rastreável, junto da transição. | Estorno fiscal de contratos já documentados. |
| `F → R` | Solicitar compensação dos efeitos registrados e só concluir a reversão se as guardas fiscais/financeiras permitirem. | Regras fiscais e devoluções pós-faturamento, issues 11/12. |
| `F/C` | Somente leitura comercial; não recalcular disponibilidade histórica como se fosse saldo do contrato. | Devolução, troca e movimentos posteriores. |

- `CONFIRMADO` — o Delphi permite avançar diretamente de orçado, reservando antes de faturar: `FaturarContratoOrcado` chama `ReservarContrato(false)` e depois `Faturar`; evidência `delphi/apps/vendas/fmcadastrocontratos.pas:4614-4617`.
- `DECISÃO NOVA` — nenhuma transição pode deixar situação alterada sem o respectivo movimento, ou movimento sem a situação. Falha em qualquer guarda, saldo, lote, série ou persistência reverte toda a operação.
- `DECISÃO NOVA` — alterações de produto/filial em `R` serão modeladas explicitamente como liberação + nova reserva. Não será reproduzida uma mutação ambígua do movimento legado.
- `POSSÍVEL BUG LEGADO` — o algoritmo Delphi contém caminhos sensíveis a alterações de produto/filial durante a remontagem de movimentos; isso exige casos dourados, não reprodução automática.

### Concorrência, idempotência e compensação

- `DECISÃO NOVA` — usar concorrência otimista no agregado (`revision`) e bloqueio pessimista apenas nas linhas de saldo necessárias, em ordem determinística por filial/produto/lote.
- `DECISÃO NOVA` — o servidor relê saldos após adquirir os locks; valores exibidos no navegador nunca autorizam reserva.
- `DECISÃO NOVA` — cada comando terá chave idempotente formada por contrato, transição e revisão; movimentos guardam referência ao contrato e ao movimento compensado.
- `DECISÃO NOVA` — liberação/cancelamento cria movimentos inversos; não apaga histórico. Integrações assíncronas só são publicadas após commit, preferencialmente por outbox.
- `CONFIRMADO` — o Laravel possui padrão transacional de planejamento e gravação de movimentos em `laravel/app/Application/Marketplace/LegacyMarketplaceOrderRepository.php:628-633` e `:745`; é referência de infraestrutura, não serviço de domínio reutilizável diretamente pelo Contrato.
- `NÃO LOCALIZADO` — não foi encontrado no Laravel um comando geral de reserva de Contrato. A Consulta apenas projeta `emestoque`, `reservado` e `futuro` em `laravel/app/Infrastructure/Vendas/ConsultaContratos/LegacyContratoDetalheRepository.php:186-248`.

### Falta de estoque, venda futura, lotes e séries

- `CONFIRMADO` — o Delphi possui autorização sensível para venda sem estoque/venda futura, condicionada por `ProdutoVendaFutura`, `SolicitarAutorizacaoVendaFutura`, `TipoSenhaVendaSemEstoque` e perfis gerenciais. Evidências: `delphi/apps/vendas/dmcadastrocontratos.pas:16772-16825` e usos durante a reserva em `:13112-13124`, `:13168-13180`, `:13352-13366`, `:13410-13426`.
- `DÚVIDA` — a precedência exata entre essas flags e a propriedade homônima `PermitirVendaSemEstoque` precisa de casos dourados antes do spec; não se deve traduzir literalmente a ramificação Delphi.
- `CONFIRMADO` — produtos controlados por lote participam da reserva; séries são preparadas/verificadas conforme característica ou grupo e quantidade. Evidências: `delphi/apps/vendas/dmcadastrocontratos.pas:3104` e `:12625`, junto a `qryProdutosContratosLotes` no DFM.
- `DECISÃO NOVA` — lote, quando obrigatório para reservar, integra a chave do saldo e da reserva. Série é validação de unidade no avanço para faturamento; quantidade serializada deve ser integral e cada série única.
- `DÚVIDA` — permanecem por confirmar a precedência de lote automático/manual, o momento exato da escolha da série e os efeitos de composição/kits; ficam na issue 16.

### Conferência reutilizável

- `CONFIRMADO` — o botão Delphi usa a conferência compartilhada com tipo `CTR` e chave `primogenito`, quando existente, senão número do contrato. Evidência: `delphi/apps/vendas/fmcadastrocontratos.pas:4102-4111`.
- `CONFIRMADO` — a gravação fiscal pode alertar/bloquear produtos não conferidos via `MensagemProdutosNaoConferidosnaNF`; evidência `delphi/apps/vendas/dmcadastrocontratos.pas:7764-7779`.
- `CONFIRMADO` — o Laravel já possui motor genérico com abertura sem escrita, token de versão e detecção de conflito em `laravel/app/Application/Cadastros/Conferencia/ConferenceEngine.php:34-38`, `:254-305` e `:586-614`, além do adapter de Orçamento.
- `DECISÃO NOVA` — criar futuramente adapter `CTR` sobre esse motor; não duplicar tela ou engine. A versão esperada deriva dos itens persistidos, origem de estoque, grade/composição e `revision` comercial.
- `DECISÃO NOVA` — conferência comprova contagem; não reserva, não muda saldo e não substitui autorização de falta. Mudança relevante nos itens invalida a conferência.
- `DÚVIDA` — preservar `primogenito` como identidade familiar pode misturar revisões de contratos distintos. A issue 16 deve confirmar se a compatibilidade exige essa chave ou uma identidade canônica por versão.

### Operações externas

- `CONFIRMADO` — o Delphi monta pedidos de transferência entre filial emitente e `FilialBase` em `delphi/apps/vendas/dmcadastrocontratos.pas:8930`; a transferência efetiva é integração logística/fiscal, não parte da reserva básica.
- `DECISÃO NOVA` — devolução após `F`, troca, simples faturamento/remessa e estados `P/N` não pertencem a esta primeira fatia. Serão comandados por operações próprias, com compensações referenciando os movimentos originais.
- `DECISÃO NOVA` — a reserva não chama APIs externas dentro da transação. Pedidos de transferência e demais integrações nascem como efeitos duráveis após commit.

## Spec boundary

Esta resolução comporta `$to-spec` próprio para **reserva e disponibilidade do Contrato em `O/R`, incluindo delta, concorrência, autorização de falta e liberação em cancelamento**.

A conferência `CTR` pode ser um segundo `$to-spec`, reaproveitando o motor genérico, depois de resolver a identidade na issue 16. Consumo de reserva, documentos, devolução e `P/N` não devem entrar nesses specs; pertencem às fatias fiscal e de operações transversais.

## Follow-up

- [Issue 16 — confirmar casos dourados de reserva, movimentos, lotes, séries e identidade da conferência](16-confirmar-casos-dourados-de-reserva-movimentos-lotes-series-e-conferencia.md)
