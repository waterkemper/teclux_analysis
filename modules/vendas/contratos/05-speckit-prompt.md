# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a reserva e os movimentos de estoque do Cadastro de Contratos — Etapa 3 (Estoque e reserva), primeiro dos dois specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`) e sobre o motor comercial (`03-speckit-prompt.md`), cujos itens/quantidades já estabilizados são a entrada desta fatia.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt, incluindo as matrizes douradas, como o pacote funcional legado autoritativo — trate-as como contrato de aceitação. Inspecione somente o checkout Laravel; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- um comando transacional de **reserva/delta/liberação** por chave de estoque (produto + filial, e opcionalmente lote — ver fronteira com o spec 6 abaixo), cobrindo `O → R`, edição em `R`, `O/R → C` e a compensação de `F → R`;
- **disponibilidade como projeção viva** (`emestoque`/`reservado`/`futuro`), nunca copiada como verdade para o item;
- **autorização de falta/venda futura** com a precedência exata já evidenciada;
- **concorrência, idempotência e compensação**: lock ordenado por chave de estoque, `revision` no agregado, chave idempotente por `contrato + transição + revision`, movimentos inversos em vez de apagar histórico;
- a distinção entre **filial de venda, filial de origem do estoque e filial de montagem**, com troca de origem modelada como liberação + nova reserva.

Não inclua: a mecânica de alocação/sugestão/redistribuição de **lotes** e a validação de **séries** (spec 6 — este spec 5 só precisa aceitar uma decomposição por lote como entrada opcional, ver "Fronteira com lotes/séries" abaixo), a conferência `CTR` (spec 6), consumo definitivo/transferência física/documentos fiscais (Etapa 5 — Faturamento), devolução/troca pós-`F` e regularização de `P/N` (fatias transversais e fiscal).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo as matrizes douradas, já foram extraídas no workspace de análise a partir de `fmcadastrocontratos.pas/.dfm` e `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- `App\Infrastructure\Persistence\Legacy\Vendas\LegacyContratoDetalheRepository` (linhas ~225-248) — já projeta `emestoque`/`reservado`/`futuro` para a Consulta de Contratos; reutilize a mesma leitura de disponibilidade, não crie uma segunda query divergente.
- `App\Infrastructure\Persistence\Legacy\Marketplace\LegacyMarketplaceOrderRepository` — referência de **infraestrutura** transacional de planejamento/gravação de movimentos com lock; não é serviço de domínio reutilizável diretamente pelo Contrato, só padrão a seguir.
- `App\Services\Vendas\Orcamentos\OrcamentoConferenciaDisponibilidadeService` — verifique se algo do gate de conferência do Orçamento (que não reserva) é reaproveitável na leitura de disponibilidade; não assuma que resolve reserva.
- Confirme que **não existe** hoje nenhum comando geral de reserva de Contrato no Laravel (o estado anterior mapeado era `NÃO LOCALIZADO`) — se algo surgiu, trate como achado divergente a reconciliar, não ignore.
- O spec do motor comercial (`03-speckit-prompt.md`) — este spec de reserva consome as linhas de produto (identidade, quantidade, filial) já estabilizadas por ele; não duplique a identidade de linha.
- O spec da Fundação (`01-speckit-prompt.md`) — seam autoritativo, `revision`, envelope de auditoria/outbox; a reserva é uma seção/comando desse seam, nunca um segundo gravador.

## Evidência Delphi confirmada

### Fronteira de domínio

- O Cadastro comanda a intenção de reservar e a manutenção da reserva do Contrato: o comando da tela muda a situação para `R` e chama a gravação, que chama `ReservarContrato` (`fmcadastrocontratos.pas:3058-3073`; `dmcadastrocontratos.pas:7698-7717`). O Delphi permite avançar direto de Orçado, reservando antes de faturar (`FaturarContratoOrcado` chama `ReservarContrato(false)` e depois `Faturar`: `fmcadastrocontratos.pas:4614-4617`).
- A reserva produz dados próprios de reservas e movimentos, por produto e filial, contemplando lotes (`qryMovimentos`, `qryProdutosReservas`, `qryProdutoEstoque`, `qryProdutosContratosLotes`: `dmcadastrocontratos.dfm:3050-3179,7214-7349,7781-7821,12929-13064`; `dmcadastrocontratos.pas:12625`).
- Disponibilidade é projeção viva (`emestoque`, `reservado`, `futuro`), nunca verdade copiada para o item; o Cadastro só a consulta — somente comandos de reserva/liberação alteram o razão de estoque.
- Filial de venda, filial de origem do estoque e filial de montagem são conceitos distintos; a origem do estoque pertence ao item, montagem/entrega ficam na fatia logística. Trocar a origem em `O/R` equivale a liberar na origem anterior e reservar na nova, nunca a editar uma coluna isolada. Ao escolher outra filial, o Delphi relê reserva e estoque e atualiza `emestoque`/`reservado`/`futuro`/preço (`dmcadastrocontratos.pas:13836-13869`).
- `FiliaisIndependentes`, `PesquisaSomenteEstoqueFilialBasevendas` e `SoVisualizarEstoqueDeposito` limitam seleção/visualização, mas não são, por si, autoridade para movimentar estoque — a autoridade efetiva permanece sempre no servidor.

### Efeitos por transição

| Transição/estado | Responsabilidade deste spec | Fora desta fatia |
|---|---|---|
| `O` | Consultar disponibilidade na origem selecionada; não reservar. Alterações comerciais invalidam conferência anterior (spec 6). | Movimentação física e fiscal. |
| `O → R` | Numa única unidade atômica: validar `revision`/políticas, reler/bloquear saldos, autorizar falta/venda futura quando aplicável, criar reservas/movimentos, gravar situação/data/revisão. | Transferência física e emissão fiscal. |
| edição em `R` | Calcular no servidor o delta contra a reserva persistida; liberar removidos/reduções/origem antiga e reservar inclusões/acréscimos/origem nova na mesma transação. | Ajustes manuais externos ao contrato. |
| `R → F` | Exigir reserva coerente com a revisão comercial; entregar comando idempotente ao serviço de faturamento (spec 9). | Consumo definitivo, transferência e documentos (Etapa 5). |
| `O/R → C` | Liberar integralmente a reserva ativa, por compensação rastreável, junto da transição. | Estorno fiscal de contratos já documentados. |
| `F → R` | Solicitar compensação dos efeitos registrados; só concluir a reversão se as guardas fiscais/financeiras (fatias posteriores) permitirem. | Regras fiscais e devoluções pós-faturamento. |
| `F/C` | Somente leitura comercial; não recalcular disponibilidade histórica como se fosse saldo do Contrato. | Devolução, troca e movimentos posteriores. |

Nenhuma transição pode deixar situação alterada sem o respectivo movimento, ou movimento sem a situação — falha em qualquer guarda, saldo ou persistência reverte toda a operação. Alterações de produto/filial em `R` são modeladas explicitamente como liberação + nova reserva; **não** reproduza a mutação ambígua do movimento legado (`POSSÍVEL BUG LEGADO`: o algoritmo Delphi tem caminhos sensíveis a essas trocas durante a remontagem de movimentos — exige casos dourados, não reprodução automática).

### Precedência de falta e autorização de venda futura

- Em produto comum, falta só prossegue quando a linha permite venda sem estoque (`vendasemestoque='S'`) **e** o sistema permite venda sem estoque. Depois dessas guardas, `PermitirVendaSemEstoque` exige credencial quando `SolicitarAutorizacaoVendaFutura` está ativo ou quando o usuário corrente não tem o papel de `TipoSenhaVendaSemEstoque` (`dmcadastrocontratos.pas:13110-13142,13165-13213,16799-16825`).
- A seleção inicial de produto sem estoque usa guarda distinta: `ProdutoVendaFutura` força autorização; fora disso, o gerente do tipo parametrizado pode prosseguir diretamente (`dmcadastrocontratos.pas:16727-16733,16772-16796`).
- Ordem de avaliação no Laravel: elegibilidade da linha → permissão parametrizada da filial/sistema → saldo bloqueado → necessidade de prova → papel aceito. A prova registra autor, papel, motivo, contrato, item, falta e revisão; falha não produz movimento.
- O bypass legado `ViaSite` **não** será autorização — canal automatizado deve fornecer decisão auditável (`dmcadastrocontratos.pas:13112-13124,13168-13180`).
- **Produto controlado por lote nunca usa venda futura**: a falta entra em ramo literal (`if true`), exibe erro e encerra (`dmcadastrocontratos.pas:13348-13379,13407-13424`) — quando a decomposição por lote (spec 6) não cobrir a quantidade, a falta bloqueia a linha, sem fallback de venda futura.

### Matriz dourada de reserva e movimentos

Os códigos legados `TER/AQU/TEP/TPE/TRE/SQU` são evidência de compatibilidade, não API do novo motor.

| Caso | Entrada | Resultado/movimentos esperados | Falha ou compensação |
|---|---|---|---|
| Reserva integral | `O→R`, quantidade 5, saldo 10 | reservar 5 do estoque presente | retry não duplica |
| Falta total autorizada | quantidade 5, saldo 0, guardas e prova válidas | obrigação futura 5 (`AQU`) | prova negada: zero movimentos |
| Falta parcial autorizada | quantidade 5, saldo 3 | presente 3 (`TER`) e futuro 2 (`AQU`) | a soma deve ser 5 |
| Aumento em `R` | reservado 5, nova quantidade 8 | delta `+3` | se falhar, tudo permanece em 5 |
| Redução em `R` | reservado 5, nova quantidade 2 | liberar 3 | não regravar o total |
| Exclusão em `R` | reservado 5, item removido | liberar 5 e encerrar vínculo | atômico com a exclusão |
| Troca de origem/produto | A/X → B/Y | liberar A/X e reservar B/Y na mesma transação | falha em B/Y restaura A/X |
| Concorrência | dois contratos disputam o último saldo | locks por filial/produto(/lote); só um confirma | perdedor falha sem saldo negativo |

O Delphi calcula deltas contra `produtosreservas.saldo`: igualdade não movimenta; redução gera estorno; aumento movimenta só a diferença; presente e futuro são separados (`dmcadastrocontratos.pas:13043-13105,13146-13213`). Referência textual do movimento: `CT <numero> [RS <reserva>]` (`:12688-12691,13047-13051`).

### Fronteira com lotes/séries (spec 6)

- Lote, quando obrigatório para reservar, **integra a chave do saldo e da reserva** — mas a decomposição de quanto reservar em qual lote (sugestão, redistribuição) é mecânica do spec 6, não deste.
- Este spec define um ponto de extensão: o comando de reserva aceita, por linha que exija controle de lote, uma **decomposição já resolvida** (`lote → quantidade`) fornecida pelo chamador; quando o produto não exige lote, a chave de reserva é só `(produto, filial)`.
- Enquanto o spec 6 não existir, reservar uma linha que exija lote é uma operação **bloqueada explicitamente** (mensagem clara de decomposição de lote ainda não suportada) — não implemente uma alocação FIFO/FEFO improvisada aqui; a ordem de consulta do Delphi não está comprovada como FEFO (`DÚVIDA` preservada do ticket de casos dourados).
- Séries não são movimento de `O → R` no Delphi (o momento efetivo é `Faturar`, antes de `InternoGravar`) — ficam inteiramente fora deste spec e do spec 6 propriamente ditos; são gate de faturamento/fiscal.

### Conferência (referência, não escopo)

- O botão Delphi usa a conferência compartilhada tipo `CTR` (chave `primogenito` quando existente, senão número do contrato: `fmcadastrocontratos.pas:4102-4111`); a gravação fiscal pode alertar/bloquear produtos não conferidos (`dmcadastrocontratos.pas:7764-7779`). Isso pertence ao spec 6 — aqui só é preciso saber que a reserva **não** movimenta saldo nem substitui essa conferência.

### Operações externas

- O Delphi monta pedidos de transferência entre filial emitente e `FilialBase` (`dmcadastrocontratos.pas:8930`); a transferência efetiva é integração logística/fiscal, fora da reserva básica.
- Devolução após `F`, troca, simples faturamento/remessa e estados `P/N` não pertencem a esta fatia — operações próprias, com compensações referenciando os movimentos originais.
- A reserva não chama APIs externas dentro da transação; pedidos de transferência e demais integrações nascem como efeitos duráveis após commit (outbox, herdado do envelope da Fundação).

## Estado Laravel confirmado

- Não existe hoje nenhum comando geral de reserva de Contrato — a Consulta apenas projeta `emestoque`/`reservado`/`futuro` (`LegacyContratoDetalheRepository`).
- Existe um padrão transacional de planejamento/gravação de movimentos com lock em `LegacyMarketplaceOrderRepository` — referência de infraestrutura, não de domínio.
- Não há serviço Laravel de autorização de venda futura/venda sem estoque equivalente ao Delphi — precisa ser construído, generalizando o padrão de prova sensível já fixado na Fundação.
- `OrcamentoConferenciaDisponibilidadeService` existe mas é do gate de conferência do Orçamento (que não reserva) — não confundir com um serviço de reserva.

## Decisões obrigatórias

1. Disponibilidade (`emestoque`/`reservado`/`futuro`) é sempre projeção viva lida no momento do comando; nunca copiada/persistida como verdade no item do Contrato.
2. `O → R`, edição em `R`, `O/R → C` e a compensação de `F → R` são cada um uma única unidade transacional: validar `revision`/políticas, reler e bloquear saldos na ordem determinística `filial → produto (→ lote)`, autorizar falta/venda futura quando aplicável, gravar movimentos + reserva + situação juntos. Nenhuma parte comita isoladamente.
3. Delta é sempre calculado contra a reserva persistida: igualdade não movimenta; redução libera exatamente a diferença (nunca "regrava o total"); aumento reserva só a diferença; presente e futuro (falta autorizada) são sempre grandezas separadas.
4. Troca de origem de estoque ou de produto em `R` é liberação da chave antiga + reserva da chave nova, na mesma transação; falha na nova reserva restaura a antiga integralmente — nunca uma mutação in-place do movimento.
5. Falta/venda futura segue a precedência: elegibilidade da linha → permissão parametrizada da filial/sistema → saldo bloqueado → necessidade de prova → papel aceito; prova é vinculada a contrato/item/falta/revision, autor e papel são registrados, falha não produz movimento; `ViaSite`/canal automatizado nunca é autorização silenciosa.
6. Produto controlado por lote nunca cai no fallback de venda futura; se a decomposição por lote (fornecida externamente, ver spec 6) não cobre a quantidade, a linha bloqueia com falta explícita.
7. Reservar uma linha que exige controle de lote sem uma decomposição já resolvida é **bloqueado nesta entrega** com mensagem clara — não inventar alocação FIFO/FEFO/automática aqui (decisão simétrica ao bloqueio de troca de Cliente populado no spec 02, até o spec 06 fechar a mecânica de lote).
8. Concorrência: `revision` otimista no agregado do Contrato + lock pessimista só nas linhas de saldo necessárias, em ordem determinística; o servidor sempre relê saldos **depois** de adquirir os locks — valores exibidos no navegador nunca autorizam reserva.
9. Cada comando tem chave idempotente por `contrato + transição + revision`; retry não duplica movimento nem reserva. Liberação/cancelamento sempre cria movimentos inversos, nunca apaga histórico.
10. Nenhuma chamada externa (transferência entre filiais, integrações) ocorre dentro da transação curta de reserva; efeitos duráveis nascem como outbox após commit, herdando o envelope da Fundação.
11. `R → F` só entrega ao serviço de faturamento (spec 9, fatia futura) um comando idempotente já com reserva coerente à revisão comercial vigente — este spec não implementa o consumo definitivo.
12. `F → R` só libera/compensa os efeitos de reserva depois que as guardas fiscais/financeiras de fatias posteriores permitirem — este spec expõe o comando de compensação, não decide sozinho quando ele pode rodar.

## Contrato do comando de reserva

- Entrada: identidade/`revision` do Contrato, lista de linhas comerciais estabilizadas (do spec 3) com `produto`, `filial de origem`, `quantidade`, e — quando exigido — a decomposição por lote já resolvida (extensão do spec 6); contexto do ator; prova sensível quando a precedência de falta exigir.
- Processo: validar `revision` → resolver chaves de saldo (filial+produto[+lote]) em ordem determinística → bloquear → reler saldo autoritativo → calcular delta contra reserva persistida → aplicar guardas de falta/venda futura → persistir movimentos + reserva + situação/`revision` do Contrato numa transação → agendar outbox para efeitos externos.
- Saída: fotografia autoritativa de reserva por linha (`presente`/`futuro`), disponibilidade projetada atualizada, avisos, e nova `revision`.
- Falha em qualquer etapa não deixa reserva parcial; a transação inteira reverte.

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações/parâmetros já fixada na Fundação; parâmetros próprios desta fatia: `ProdutoVendaFutura`, `SolicitarAutorizacaoVendaFutura`, `TipoSenhaVendaSemEstoque`, `PermitirVendaSemEstoque`, `FiliaisIndependentes`, `PesquisaSomenteEstoqueFilialBasevendas`, `SoVisualizarEstoqueDeposito`.
- A prova sensível de venda futura/venda sem estoque reusa a infraestrutura de prova de uso único já fixada na Fundação — não crie um mecanismo de senha paralelo.

## Testes obrigatórios

1. Toda a matriz dourada de reserva/movimentos (8 casos) como Feature tests do comando transacional.
2. Precedência completa de falta/venda futura: cada camada (elegibilidade, permissão, saldo, prova, papel) rejeitando isoladamente; `ViaSite` não bypassa.
3. Produto controlado por lote nunca cai em venda futura; decomposição de lote ausente bloqueia com mensagem explícita, sem alocação improvisada.
4. Delta: igualdade não gera movimento; redução libera exatamente a diferença; aumento reserva só o delta; teste explícito de que "regravar o total" nunca acontece.
5. Troca de origem/produto: liberar+reservar atômico; falha na nova reserva restaura a reserva antiga integralmente.
6. Concorrência: dois comandos disputando o mesmo saldo — locks ordenados garantem que só um confirma e o perdedor falha sem saldo negativo; nenhuma leitura pré-lock autoriza reserva.
7. Idempotência: retry com a mesma chave (`contrato+transição+revision`) não duplica movimento nem reserva.
8. Liberação em `O/R → C`: reserva ativa é liberada integralmente por movimento inverso rastreável, nunca por exclusão de histórico.
9. `F → R`: comando de compensação só é aceito quando guardas externas (mockadas nesta fatia) permitem; movimentos compensatórios referenciam os originais.
10. Nenhuma chamada externa ocorre dentro da transação de reserva; efeitos de transferência aparecem só como outbox pós-commit.
11. Disponibilidade lida sempre reflete projeção viva; nenhum teste assume valor de disponibilidade copiado/cache no item além do TTL de leitura de tela.

Prefira Feature tests no comando transacional real, com asserts de movimentos/reserva/situação/`revision` persistidos juntos; testes de concorrência usam duas transações reais disputando o mesmo saldo, não apenas mocks de lock.

## Entregáveis

- Contrato do comando de reserva/delta/liberação (entrada/processo/saída, conforme acima).
- Matriz de evidência Delphi × Laravel para reserva, movimentos e autorização de falta/venda futura.
- Ponto de extensão explícito para decomposição de lote, a ser satisfeito pelo spec 6.
- Critérios de aceitação e testes, incluindo a matriz dourada como suíte obrigatória.
- Riscos, dúvidas (precedência exata `PermitirVendaSemEstoque` vs. flags homônimas, ordem de consulta de lote não comprovada como FEFO) e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- alocação/sugestão/redistribuição de lotes e validação de séries (spec 6);
- conferência `CTR` (spec 6);
- consumo definitivo de estoque, transferência física e documentos fiscais no faturamento (Etapa 5);
- devolução, troca e regularização de `P/N` pós-faturamento;
- cálculo comercial (spec 3) e financeiro (spec 4) — este spec só consome suas saídas já estabilizadas;
- alterar o schema Delphi.
```
