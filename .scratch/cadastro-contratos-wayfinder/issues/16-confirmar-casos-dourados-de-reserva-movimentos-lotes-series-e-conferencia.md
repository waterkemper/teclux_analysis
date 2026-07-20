Type: task
Status: resolved
Blocked by: 10

## Question

Quais casos dourados do Delphi confirmam, sem copiar seus acoplamentos, a precedência das autorizações de falta/venda futura, os deltas de reserva em `R`, a alocação de lotes, o momento e a unicidade das séries e a identidade `numero` versus `primogenito` da conferência `CTR`?

Produzir uma matriz pequena de entradas, movimentos esperados, falhas, compensações e evidências SQL/PAS/DFM que possa alimentar os specs independentes de reserva e conferência.

## Resposta

O recorte confirma dois specs independentes: (1) reserva, movimentos, lotes e autorização de falta; (2) conferência `CTR` reutilizando o motor genérico Laravel. As séries pertencem ao gate de faturamento e devem alimentar a fatia fiscal, não o comando de reserva.

### Precedência da falta e da autorização

- `CONFIRMADO` — Em produto comum, falta só pode prosseguir quando a linha permite venda sem estoque (`vendasemestoque = 'S'`) e o sistema permite venda sem estoque. Depois dessas guardas, `PermitirVendaSemEstoque` exige credencial quando `SolicitarAutorizacaoVendaFutura` estiver ativo ou quando o usuário corrente não tiver o papel indicado por `TipoSenhaVendaSemEstoque`. Evidência: `dmcadastrocontratos.pas:13110-13142`, `13165-13213` e `16799-16825`.
- `CONFIRMADO` — A seleção inicial de produto sem estoque usa guarda distinta: `ProdutoVendaFutura` força autorização; fora disso, o gerente do tipo parametrizado pode prosseguir diretamente. Evidência: `dmcadastrocontratos.pas:16727-16733` e `16772-16796`.
- `DECISÃO NOVA` — O Laravel deve avaliar, nesta ordem: elegibilidade da linha, permissão parametrizada da filial/sistema, saldo bloqueado, necessidade de prova e papel aceito. A prova registra autor, papel, motivo, contrato, item, falta e revisão; falha não produz movimento.
- `DIVERGENTE` — O bypass legado `ViaSite` não será autorização. Canal automatizado deve fornecer decisão auditável. Evidência: `dmcadastrocontratos.pas:13112-13124` e `13168-13180`.
- `CONFIRMADO` — Produto controlado por lote nunca usa venda futura: a falta entra em ramo literal `if true`, exibe erro e encerra. Evidência: `dmcadastrocontratos.pas:13348-13379` e `13407-13424`.

### Casos dourados de reserva e movimentos

Os nomes abaixo expressam intenção de domínio. Os códigos legados `TER/AQU/TEP/TPE/TRE/SQU` são evidência de compatibilidade, não API do novo motor.

| Caso | Entrada | Resultado/movimentos esperados | Falha ou compensação |
|---|---|---|---|
| Reserva integral | `O→R`, quantidade 5, saldo 10 | reservar 5 do estoque presente | retry não duplica |
| Falta total autorizada | quantidade 5, saldo 0, guardas e prova válidas | obrigação futura 5 (`AQU`) | prova negada: zero movimentos |
| Falta parcial autorizada | quantidade 5, saldo 3 | presente 3 (`TER`) e futuro 2 (`AQU`) | a soma deve ser 5 |
| Aumento em `R` | reservado 5, nova quantidade 8 | delta `+3` | se falhar, tudo permanece em 5 |
| Redução em `R` | reservado 5, nova quantidade 2 | liberar 3 | não regravar o total |
| Exclusão em `R` | reservado 5, item removido | liberar 5 e encerrar vínculo | atômico com a exclusão |
| Troca de origem/produto | A/X → B/Y | liberar A/X e reservar B/Y na mesma transação | falha em B/Y restaura A/X |
| Concorrência | dois contratos disputam o último saldo | locks por filial/produto/lote; somente um confirma | perdedor falha sem saldo negativo |

`CONFIRMADO` — O Delphi calcula deltas contra `produtosreservas.saldo`: igualdade não movimenta; redução gera estorno; aumento movimenta só a diferença. Também separa presente e futuro. Evidência: `dmcadastrocontratos.pas:13043-13105` e `13146-13213`. A referência é `CT <numero> [RS <reserva>]`: `12688-12691` e `13047-13051`.

`DECISÃO NOVA` — Persistir operação idempotente por `contrato + revision + comando`, contendo deltas por chave de estoque. Validar revision, bloquear saldos em ordem estável e gravar movimentos, reserva e situação em uma transação. Cancelamento/reversão cria compensações; não apaga histórico.

### Lotes

| Caso | Entrada | Resultado esperado |
|---|---|---|
| Sugestão | produto 5; L1=3, L2=4 | sugerir L1=3 e L2=2 na ordem da consulta |
| Soma inválida em `R` | produto 5; lotes somam 4 ou 6 | bloquear |
| Lote sem saldo | produto 5; lotes totalizam 4 | bloquear; venda futura não se aplica |
| Redistribuição | L1=3/L2=2 → L1=1/L2=4 | liberar 2 de L1 e reservar 2 em L2 atomicamente |
| Reexecução | mesma revisão/alocação | nenhum movimento adicional |

- `CONFIRMADO` — O editor possui grade e botão de sugestão (`fmcadastroprodutoscontrato.dfm:3023-3089`, `3195`, `3533-3864`). A rotina apaga a sugestão anterior e percorre o estoque, consumindo cada saldo até completar a quantidade: `fmcadastroprodutoscontrato.pas:1634-1703`.
- `CONFIRMADO` — Em `R`, a soma deve ser exatamente a quantidade; lote excedente bloqueia. Em `O`, soma inferior pode ficar incompleta, mas superior bloqueia. Evidência: `dmcadastrocontratos.pas:19990-20108`.
- `DECISÃO NOVA` — Sugestão é conveniência. O servidor revalida e calcula delta por `filial + produto + lote`.
- `DÚVIDA` — A rotina não prova se a ordem da consulta é FEFO, FIFO ou outra. Confirmar o SQL do frame antes do spec; não presumir FEFO.

### Séries

| Caso | Entrada | Resultado esperado |
|---|---|---|
| Produto não seriado | qualquer quantidade | não cria slots |
| Produto seriado | quantidade inteira 3 | exatamente 3 slots preenchidos antes de faturar |
| Quantidade alterada | 3 → 2 | remover um slot excedente e preservar dois válidos |
| Vazia/duplicada | slot vazio ou duas iguais | modal não confirma; faturamento não prossegue |

- `CONFIRMADO` — A exigência nasce na característica ou grupo; a rotina cria/remove slots até igualar a quantidade e abre o modal: `dmcadastrocontratos.pas:3104-3175`.
- `CONFIRMADO` — Vazio e duplicidade são validados em `dmcadastrocontratos.pas:18090-18103` e `18611-18617`. O DFM declara query por contrato/produto/filial/série e séries disponíveis: `dmcadastrocontratos.dfm:12369-12520`.
- `CONFIRMADO` — O momento efetivo é `Faturar`, antes de `InternoGravar`: `fmcadastrocontratos.pas:3873-3884`. Série não é movimento de `O→R`.
- `DÚVIDA` — Unicidade global e relação série–lote devem ser fechadas na fatia fiscal; a função local prova apenas duplicidade no dataset corrente.

### Conferência `CTR`: `numero` versus `primogenito`

- `CONFIRMADO` — O Delphi passa tipo `CTR` e usa `primogenito` quando preenchido; senão, `numero`: `fmcadastrocontratos.pas:4102-4115`. Isso compartilha a conferência na linhagem.
- `CONFIRMADO` — O Laravel possui motor genérico com adapter, abertura sem escrita, persistência sob lock e chave `tipo + codigo`; `ORC` carrega a fotografia esperada e proíbe itens imprevistos. Evidência: `ConferenceEngine.php`, `ConferenceVersionToken.php`, `LegacyConferenceRepository.php` e `Adapters/OrcConferenceAdapter.php` sob `laravel/backend/app`.
- `DIVERGENTE` — Compartilhar leituras por `primogenito` pode dar como conferido um derivado com fotografia diferente; não será reproduzido.
- `DECISÃO NOVA` — A identidade operacional será `CTR + numero atual`. `primogenito` fica como linhagem/auditoria. O adapter recalcula itens do contrato atual e inclui a fotografia no token. Leituras legadas do primogênito podem ser histórico, mas não satisfazem automaticamente a conferência atual.
- `DECISÃO NOVA` — Alterar produto, quantidade, grade ou composição invalida o token. Conferência não movimenta estoque.

Casos dourados `CTR`: abrir sem cabeçalho é leitura pura; bip repetido soma 1 e quantidade manual substitui; item estranho é rejeitado; save persiste só `CTR + numero atual`; fotografia alterada causa conflito; contratos com mesmo primogênito ficam independentes; retry não duplica.

## Fronteiras de especificação

- **Pronto para `$to-spec`:** reserva transacional, deltas, venda futura/autorizada, compensações e lotes.
- **Pronto para `$to-spec`:** adapter `CTR` reutilizável, com identidade pelo número atual.
- **Ainda não isoladamente:** séries; levar estes casos ao spec de faturamento/fiscal após confirmar unicidade global e vínculo com lote.

## Próximo passo

Resolver `17-confirmar-casos-dourados-de-faturamento-alocacao-e-emissao-fiscal.md`, levando os gates de séries daqui.
