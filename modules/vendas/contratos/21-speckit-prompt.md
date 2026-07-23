# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **confirmação do resultado fiscal, cobertura `P/N` e compensações** do Contrato (`ConfirmarResultadoFiscal`) — Etapa 9 (Esforço fiscal posterior), terceiro e último spec dessa etapa e da série completa do Cadastro de Contratos, construído sobre a preparação (`19-speckit-prompt.md`), a submissão (`20-speckit-prompt.md`) e a reserva (`05-speckit-prompt.md`/`06-speckit-prompt.md`), cujo saldo este comando finalmente consome.

Este é o comando que aplica efeitos reais: quando o emissor autoriza um documento, é aqui que o estoque é consumido de fato, os vínculos (`dadofiscal`, séries, transferências) são gravados, e a situação documental do Contrato passa a refletir `P` ou `N` como **projeção derivada** — nunca uma escolha direta do usuário. É também aqui que cancelamento de documento fiscal autorizado gera compensações, sem nunca apagar histórico.

Não implemente nesta etapa: seleção/planejamento (spec 19) ou submissão/transmissão (spec 20), já definidos; devolução/troca física pós-entrega (fatia própria, fora desta série); qualquer cálculo tributário nesta confirmação — a base fiscal já veio resolvida da preparação. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt, incluindo a matriz dourada, como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar a ausência de qualquer comando de confirmação/consumo fiscal para Contrato; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- o comando `ConfirmarResultadoFiscal`: recebe o resultado de uma submissão em estado `autorizada` (spec 20) e aplica, **numa única vez e de forma idempotente**, os efeitos correspondentes: consumo da reserva/estoque planejado (spec 5/6), gravação de vínculos (documento ↔ item ↔ lote/série ↔ transferência quando aplicável) e projeção derivada da situação;
- **`P/N` como projeção, nunca escolha**: `F` sem cobertura autorizada; `P` com cobertura parcial das obrigações fiscalizáveis; `N` com cobertura integral. Rascunho, submissão ou rejeição (spec 20) nunca alteram a situação — só autorização efetivamente confirmada aqui;
- **consumo por perfil fiscal**: venda normal consome reserva e vincula movimento; simples faturamento **não** consome fisicamente, apenas cria o vínculo para a remessa posterior; simples remessa (documento autorizado com saldo disponível) consome reserva/estoque e séries/lotes selecionados, referenciando o documento de simples faturamento anterior; transferência automática planejada na preparação vira pedido de transferência efetivo e idempotente;
- **compensação de cancelamento fiscal**: documento autorizado cobrindo parte da obrigação, ao ser cancelado, marca as alocações correspondentes como inválidas/canceladas, gera movimentos compensatórios e eventual recomposição de reserva; a situação recalcula (`P → F` se nenhuma cobertura restar) sem nunca apagar o histórico do documento original;
- efeitos externos (contabilização, integrações) publicados como **outbox** após o commit local — nunca dentro da transação curta que aplica o consumo;
- projeção read-only atualizada para o spec 10 (Documentos fiscais) e para a Consulta/Ficha Financeira consumirem — este comando é a única autoridade de escrita sobre a cobertura fiscal; nenhuma tela edita `dadosfiscais`/cobertura diretamente.

Não inclua: seleção/planejamento (spec 19) ou submissão/transmissão a emissor (spec 20); cálculo de incidência/alíquota tributária; devolução/troca física após entrega executada (fatia própria); qualquer nova UI de documentos fiscais além do já entregue pelo spec 10 (este spec só alimenta essa projeção, não a redesenha).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo, incluindo a matriz dourada, já foram extraídas no workspace de análise a partir de `dmcadastrocontratos.pas/.dfm`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar a ausência de qualquer comando de confirmação fiscal e construir a matriz de lacunas.

## Investigação Laravel obrigatória

- Confirme a ausência: busque por `ConfirmarResultadoFiscal` ou qualquer comando de consumo/confirmação fiscal de Contrato no checkout atual antes de prosseguir.
- `App\Application\Vendas\Contratos\Cadastro\Commands\ExecuteContratoEstoqueReservaCommand`/`StockKey`/`LegacyContratoEstoqueRepository` (spec 5/6) — o consumo definitivo de reserva/estoque desta fatia reaproveita as mesmas chaves, locks e movimentos inversos já definidos ali; não cria um segundo motor de estoque para o momento fiscal.
- `App\Support\Vendas\ContratoSituacaoDocumentalMapper` — já rotula `F/P/N`; este spec é quem finalmente **decide** a transição para `P`/`N` como projeção — o mapper continua só rotulando, não decidindo.
- Spec 10 (Documentos fiscais) — já define a projeção somente leitura de documentos fiscais reaproveitando `FichaFinanceiraService::listDoctosFiscais`; este spec é a fonte de verdade que, uma vez implementado, alimentaria essa mesma projeção — não crie uma segunda leitura.
- `MarketplaceOutboxService` (Fundação) — precedente de outbox genérico para efeitos externos (contabilização, integrações) após commit; reaproveite o mesmo padrão, não construa um outbox paralelo.
- Envelope de auditoria/correlação da Fundação — a confirmação registra before/after de cobertura/estoque/situação vinculado ao mesmo `correlation_id` da preparação/submissão (specs 19/20), fechando a cadeia completa de rastreabilidade de um documento fiscal.

## Evidência Delphi confirmada

### Estados `P/N`

- `CONFIRMADO` — o legado atribui `P` quando a entrega/documentação não é completa. Evidência: `dmcadastrocontratos.pas:7837-7844`. A Consulta Laravel já reconhece `P` como "NOTA PARCIAL" e `N` como "NOTA FISCAL" (`ContratoSituacaoDocumentalMapper.php`).
- `DECISÃO NOVA` — `P/N` são estados derivados das alocações fiscais **válidas e não canceladas**: `P` quando existe documento autorizado e resta quantidade fiscalizável; `N` quando toda a obrigação fiscalizável foi coberta. O usuário não escolhe diretamente o estado.
- `DECISÃO NOVA` — criação de rascunho, rejeição ou falha de transmissão (spec 20) não altera `F/P/N`; a mudança ocorre somente após confirmação fiscal válida; cancelamento/denegação recalcula a cobertura e pode exigir compensação guardada.
- `DÚVIDA` — a definição exata de "obrigação fiscalizável" para serviços, brindes, itens sem trânsito, entrega futura e documentos conjugados precisa de casos dourados adicionais além dos já fixados aqui.
- `POSSÍVEL BUG LEGADO` — o setter genérico de situação não contém atribuição explícita de `P` em um trecho, enquanto outro escreve `'P'` diretamente (`dmcadastrocontratos.pas:13996-14022` versus `:7843`) — esse acoplamento frágil não será reproduzido; a derivação é sempre centralizada neste comando.

### Estoque, séries, transferências e simples faturamento

- `CONFIRMADO` — a emissão Delphi liga movimentos, séries e transferências ao `dadofiscal`. Evidência: `dmcadastrocontratos.pas:11941-11984`.
- `DECISÃO NOVA` — após autorização fiscal, o serviço de estoque consome a reserva e registra movimentos referenciando documento e contrato; lotes/séries são parte da alocação; pedido de transferência entre filiais é efeito durável separado (outbox).
- `CONFIRMADO` — o Delphi identifica transferência automática quando a origem do item difere da filial base e o item permite transferência. Evidência: `dmcadastrocontratos.pas:10293-10316,10523-10537`.
- `CONFIRMADO` — simples faturamento e simples remessa têm efeitos diferentes: o legado evita movimentação numa das fases e vincula o documento posterior ao anterior. Evidências: `dmcadastrocontratos.pas:10180-10211,11763-11774`; campo `dadofiscalsimplesfaturamento` no DFM `:4147-4168`.
- `DECISÃO NOVA` — venda futura/simples faturamento-remessa não é reduzida a uma flag; este comando modela pares documentais vinculados e seus efeitos próprios (simples faturamento não consome; simples remessa consome referenciando o par).

### Matriz dourada (linhas de confirmação/movimento/situação)

| Caso | Autorização | Movimento | Situação e falha/compensação |
|---|---|---|---|
| Venda normal total | documento de venda autorizado, 10 de 10 | consome reserva 10 e vincula movimento | `N`; rejeição (spec 20) conserva `F` e reserva |
| Venda normal parcial | documento autorizado, 4 de 10 | consome 4 após autorização | `P`, restante 6; segundo documento de 6 leva a `N` |
| Parcial por lote | alocação L1=3 autorizada | consome somente reserva de L1 | `P` |
| Produto seriado | duas séries ligadas à alocação, autorizada | consumo das duas unidades na confirmação | `P` |
| Produto + serviço não conjugado | ambos autorizados | estoque somente no produto | cobertura só integral quando ambos autorizados |
| Produto + serviço conjugado | documento conjugado autorizado | estoque somente no produto | autorização cobre ambas as obrigações |
| Simples faturamento | documento autorizado | nenhum consumo físico; cria vínculo para remessa | não cobre a obrigação de saída; rejeição não muda cobertura |
| Simples remessa | documento autorizado referenciando o de simples faturamento, saldo disponível | consome reserva/estoque e séries/lotes selecionados | cobertura de saída progride; cancelamento recalcula e compensa |
| Sem trânsito pelo estabelecimento | autorizado com natureza padrão específica | efeito derivado da natureza configurada, não da resposta isolada | — |
| Origem em outra filial | autorizado com transferência automática permitida | movimento na origem e efeito de transferência idempotente | — |
| Cancelamento fiscal | documento autorizado cobrindo 4 de 10, cancelado | marca alocações inválidas/canceladas; movimentos compensatórios; eventual recomposição de reserva | `P → F` se nenhuma cobertura restar; nunca apagar histórico |

As linhas de seleção/planejamento desses mesmos casos pertencem ao spec 19; o estado durável `autorizada`/`rejeitada` que dispara este comando pertence ao spec 20.

## Estado Laravel confirmado

- Nenhum comando de confirmação/consumo fiscal existe para Contrato; a projeção `F/P/N` hoje é só leitura/rótulo, nunca decidida por um comando de domínio.
- O motor de estoque (spec 5/6) já implementa consumo/movimento/compensação reaproveitáveis; nenhuma extensão para o momento de confirmação fiscal existe ainda.
- O outbox genérico (`MarketplaceOutboxService`) já existe como precedente estrutural para os efeitos externos desta fatia.

## Decisões obrigatórias

1. `P/N` são sempre projeções derivadas de alocações fiscais válidas e não canceladas — nunca escolhidas diretamente pelo usuário nem setadas por um trecho de código isolado da derivação central.
2. Só autorização efetivamente confirmada altera `F/P/N`; rascunho, submissão e rejeição (spec 20) nunca mudam a situação.
3. Consumo de estoque/reserva reaproveita integralmente o motor de estoque do spec 5/6 (mesmas chaves, locks, movimentos inversos); nenhum segundo motor de consumo é criado.
4. Simples faturamento nunca consome fisicamente; simples remessa consome referenciando explicitamente o documento de simples faturamento anterior — os dois nunca são reduzidos a uma flag.
5. Transferência automática planejada na preparação vira efeito durável (outbox) idempotente na confirmação; transferência não permitida bloqueia antes (herdado da preparação, spec 19).
6. Cancelamento de documento fiscal autorizado nunca apaga histórico: marca alocações inválidas, gera movimentos compensatórios, recompõe reserva quando aplicável e recalcula a situação (`P → F` quando nenhuma cobertura resta).
7. Efeitos externos (contabilização, integrações) são sempre outbox pós-commit, nunca dentro da transação curta que aplica consumo/vínculo/situação.
8. Este comando é a única autoridade de escrita sobre cobertura fiscal; nenhuma tela (Cadastro, Consulta, Ficha) edita `dadosfiscais`/cobertura diretamente — todas leem a projeção que este comando produz.
9. Toda aplicação de efeito é idempotente: reprocessar o mesmo resultado de autorização não duplica movimento, vínculo nem muda a situação duas vezes.
10. Auditoria/correlação desta confirmação compartilha `correlation_id` com a preparação e a submissão da mesma solicitação, fechando a cadeia rastreável ponta a ponta.

## Contrato do comando `ConfirmarResultadoFiscal`

- Entrada: identificador da submissão (`autorizada`, spec 20) ou evento de cancelamento de documento já autorizado, contexto de correlação.
- Processo: validar que o resultado ainda não foi aplicado (idempotência) → para autorização: consumir reserva/estoque conforme perfil fiscal (venda normal/simples remessa/etc.), gravar vínculos (documento/item/lote-série/transferência), recalcular cobertura e projetar `F/P/N` → para cancelamento: marcar alocações inválidas, gerar movimentos compensatórios, recompor reserva quando aplicável, recalcular cobertura e projetar a situação resultante → registrar evento de auditoria/domínio correlacionado → agendar outbox para efeitos externos.
- Saída: cobertura/situação documental atualizada, movimentos/vínculos persistidos, nova `revision` quando aplicável.
- Falha em qualquer etapa não deixa efeito parcial; reprocessamento do mesmo resultado é sempre seguro (idempotente).

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações já fixada na Fundação; este comando é acionado pelo resultado do spec 20, não por ação direta de usuário na maior parte dos casos — quando houver ação direta (ex.: cancelar documento fiscal), capability própria segue a mesma precedência.

## Testes obrigatórios

1. Toda a matriz dourada de confirmação/movimento/situação (11 casos) como Feature tests do comando real.
2. `P/N` nunca mudam fora deste comando: teste de regressão em preparação/submissão/rejeição (specs 19/20) confirmando ausência de efeito sobre a situação.
3. Simples faturamento não gera movimento físico; simples remessa consome corretamente referenciando o documento anterior.
4. Cancelamento fiscal: alocações marcadas inválidas, movimentos compensatórios corretos, histórico nunca apagado, situação recalculada (`P → F` quando aplicável).
5. Idempotência: reprocessar o mesmo resultado de autorização não duplica movimento/vínculo nem altera a situação duas vezes.
6. Nenhuma chamada externa ocorre dentro da transação de aplicação; efeitos externos aparecem só como outbox pós-commit.
7. Regressão: nenhuma tela edita `dadosfiscais`/cobertura diretamente — apenas leem a projeção produzida por este comando.

Prefira Feature tests no comando real, com asserts de movimentos/vínculos/situação persistidos juntos; reutilize os helpers de teste de reserva (`ContratoEstoqueReservaTestHelpers`) para os casos de consumo/compensação.

## Entregáveis

- Contrato do comando `ConfirmarResultadoFiscal` (entrada/processo/saída), cobrindo autorização e cancelamento.
- Matriz de evidência Delphi × Laravel, incluindo a matriz dourada de confirmação como suíte obrigatória.
- Critérios de aceitação e testes.
- Riscos, dúvidas (definição exata de "obrigação fiscalizável" para casos ainda não cobertos por caso dourado) e bloqueios que exijam nova investigação Delphi no workspace de análise.
- Nota final de fechamento: com este spec, os 21 `$to-spec` ordenados pelo mapa do Cadastro de Contratos estão todos elaborados; a execução segue a ordem/paralelização já fixada na decisão de rollout.

## Fora de escopo

- implementar durante `/speckit.specify`;
- seleção/planejamento fiscal (spec 19) e submissão/transmissão a emissor (spec 20);
- cálculo de incidência/alíquota tributária;
- devolução/troca física após entrega executada;
- qualquer nova UI de documentos fiscais além da já entregue pelo spec 10;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
