# Inventariar o fluxo funcional de Quitação de Duplicata no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Qual é o fluxo alcançável completo de pagar, autorizar, quitar parcialmente, quitar com desconto integral, cancelar e refazer uma Duplicata no Delphi, incluindo tela/modal, estados, defaults, campos, validações, mensagens, confirmações, atalhos, permissões, parâmetros e diferenças entre operação interativa, lote e retorno?

## Answer

### Síntese e estados

`CONFIRMADO` — Na tela do Documento, o mesmo comando **Alterar Duplicata / Ctrl+P** escolhe o estado: sem `datapagto`, abre `topPAGAMENTO`; com `datapagto`, abre `topCANCELAR` (`fmcontaspagar.pas:878-883,934-940`). O fluxo funcional é:

```text
aberta → gates → autorização → modal de pagamento → validações
       → decisão parcial/zero → gravação → quitada
quitada → modal de cancelamento → confirmação individual ou do lote → aberta
quitada → Refazer privilegiado → cancelar + reaplicar os dados preservados → quitada
```

Após pagar com sucesso, a própria janela muda para `topCANCELAR`; ao fechar, o foco retorna à grade (`fmcadastroduplicatascontaspagar.pas:426-435`; `fmcontaspagar.pas:575-584`). Autorizar Pagamento, Quitar, Cancelar Quitação e Refazer são, portanto, ações de domínio distintas.

### Entrada, gates e autorização

- O Documento deve estar persistido e fora de edição, deve existir Duplicata, não pode ser previsão e o usuário precisa de `AlterarDadosContabeis` ou `Pagamento`. Pagamento existente só passa pelo gate quando `datapagto > DATA CONTABIL` (`dmcontaspagar.pas:2854-2873`; `fmcontaspagar.pas:590-604`).
- Cancelamento exige Duplicata paga e é bloqueado quando há quitação de imposto retido vinculada (`dmcontaspagar.pas:4767-4783,3871-3915`).
- Se a Duplicata já está autorizada, o modal abre. Senão, operador com perfil `Pagamento` confirma a própria senha; os demais informam login/credencial de um autorizador. Só prossegue se o usuário retornado possui `Pagamento`; caso contrário, há mensagem de não autorizado (`fmcontaspagar.pas:522-545`).
- `DIVERGENTE` — `AlterarDadosContabeis` habilita a entrada, mas não basta para o desafio sensível. A regra nova deve separar abilities de editar, quitar, cancelar e refazer.
- `POSSÍVEL BUG LEGADO` — A comparação de Data Contábil está comentada em `PermiteCancelarDuplicata`, embora exista no gate geral. O Laravel precisa de regra única server-side para período fechado.
- `NÃO LOCALIZADO` — A identidade/prova do autorizador retornado não fica vinculada duravelmente à quitação neste ponto do fluxo.

### Modal, campos e defaults

- `fmcadastroduplicatascontaspagar` abre modal. Em pagamento/cancelamento, Vencimento, Valor de Vencimento, desconto cadastral, Banco de cobrança e comissões ficam somente leitura (`fmcadastroduplicatascontaspagar.pas:136-148`; `fmcontaspagar.pas:561-575`).
- Em `topPAGAMENTO`, são editáveis **Data de Pagamento, Valor Pago, Filial de Pagamento, Tipo de Pagamento, Conta, Nº do Cheque e Observação**; em `topCANCELAR`, ficam visíveis e somente leitura (`fmcadastroduplicatascontaspagar.pas:150-170,533-563`; DFM:71-103,182-301,301-555,691).
- Para uma Duplicata ainda não paga, os defaults são **DataServidor**, `FilialBase` e `calcular_valor_pagar_(true)`; mudar a data recalcula o valor (`dmcontaspagar.pas:2780-2823,3363-3377`).
- A data mínima é a Data Contábil, quando posterior à emissão, ou a data de emissão; há mensagens específicas para ambas (`fmcontaspagar.pas:552-559`; `fmcadastroduplicatascontaspagar.pas:763-770`).
- Tipo `3` é Adiantamento: desabilita Conta/Cheque e passa a exigir conta contábil do fornecedor e saldo (`fmcadastroduplicatascontaspagar.pas:773-790`; `dmcontaspagar.pas:5792-5823`).
- A aba de Contabilidade só aparece com `GERARCONTABILIDADE=true`; o fluxo gera e verifica lançamentos antes de concluir (`fmcadastroduplicatascontaspagar.pas:393-420,725-737`).

### Validações e confirmações

- Data e valor devem ser válidos; desconto não pode superar o vencimento (`fmcadastroduplicatascontaspagar.pas:280-303`; `dmcontaspagar.pas:2714-2721`).
- Valor diferente de zero exige Tipo de Pagamento (`dmcontaspagar.pas:5747-5767`).
- Com Contabilidade ativa, pagamento bancário não zero exige Conta, conta contábil de crédito e contrapartida; Adiantamento exige conta do fornecedor e saldo suficiente (`dmcontaspagar.pas:5769-5823`).
- Lote valida reutilização de Conta/Cheque: permite no mesmo dia mediante confirmação e rejeita em data diferente (`fmquitacaoduplicatas.pas:717-770`). Na tela unitária, `VerificarChequeCadastrado` está comentado (`dmcontaspagar.pas:5751-5754`): `DIVERGENTE`.
- Data futura possui confirmação no lote e callback equivalente na janela, mas a aplicação é heterogênea. A especificação deve uniformizar a política.

### Parcial e desconto integral

`CONFIRMADO` — Se `0 < valorpagto < valorvencto - valordesconto`, o Delphi informa pagamento parcial e oferece (`dmcontaspagar.pas:2727-2743`):

1. **Gerar outra parcela** — reduz a parcela atual ao valor pago e cria residual no mesmo vencimento, herdando juros/multa. A residual segue `AUTORIZACAO PAGTO AUTOMATICA`: autorizada e datada quando true; não autorizada quando false (`dmcontaspagar.pas:2661-2712`).
2. **Desconto obtido** — não cria residual; a diferença vira desconto financeiro.
3. **Cancelar** — aborta a gravação.

`CONFIRMADO` — Ao informar `valorpagto=0`, pergunta “A quitação será com 100% de desconto. Confirma?”. Confirmando, limpa Tipo, Conta e Cheque e atribui ao desconto o valor integral do vencimento; recusando, restaura o valor do vencimento (`dmcontaspagar.pas:3345-3360`). Desconto integral é modalidade explícita de Quitação, não parcela aberta com valor zero.

### Cancelar e refazer

- No modo cancelar, **Excluir** pede confirmação. Se há lote/cheque compartilhado, permite cancelar todo o conjunto ou somente o registro; o conjunto é bloqueado se contém imposto retido quitado (`fmcadastroduplicatascontaspagar.pas:200-260`; `dmcontaspagar.pas:1204-1279`).
- O cancelamento limpa os dados/identificadores de pagamento pertinentes e volta a marcar a Duplicata autorizada na data atual, antes da gravação coordenada (`dmcontaspagar.pas:1146-1185`). `DIVERGENTE` — reautorizar automaticamente após cancelar não deve ser copiado sem decisão explícita.
- “Refazer o pagamento” preserva Data, Valor, Filial, Tipo, Conta e Cheque, cancela, restaura, reaplica e regenera/valida a Contabilidade (`fmcadastroduplicatascontaspagar.pas:217-248,393-410`).
- O motor detecta necessidade de refazer quando Evento/contrapartida mudou e existe quitação (`dmcontaspagar.pas:4850-4857`).
- `CRÍTICO / NÃO REPLICAR` — O checkbox só é visível para login literal `tecsoft`, não por capability (`fmcadastroduplicatascontaspagar.pas:174`; DFM:791-797). O Laravel deve exigir ability privilegiada, proof contextual, motivo e auditoria.

### Tela, lote e retorno

- **Tela do Documento:** modal, autorização, defaults e decisões interativas de parcial, zero e cancelamento.
- **Quitação em lote:** coleta Data, Filial, Tipo, Conta, Cheque, agrupamento/impressão; pergunta se as Duplicatas foram autorizadas; chama o mesmo `QuitarDuplicatas` (`fmquitacaoduplicatas.pas:543-592,717-800`; `dmquitacaoduplicatas.pas:850`).
- **Cancelamento em lote:** filtra/marca pagamentos, exige autorizador com `Pagamento`, trata cheques compartilhados e chama `DesQuitarDuplicatas` (`dmcancelamentoquitacao.pas:224-310,416-571`).
- **Retorno bancário:** `dmLerRetornoPagFor` chama programaticamente `QuitarDuplicatas`/`DesQuitarDuplicatas`, sem modal (`dmLerRetornoPagFor.pas:2703,2773`).
- O motor comum recebe identidade, Data, Valor, Desconto, Filial, Tipo, Conta, Cheque, Observação, conta contábil e agrupamento, aplica validações e grava com `fViaLote_=true` (`dmcontaspagar.pas:3747-3862,3871-3921`).
- `DECISÃO ENCAMINHADA` — Tela, lote e retorno devem consumir um serviço de domínio único, mas com ator/origem, autorização e idempotência próprias; `fViaLote_` não pode equivaler a autorização implícita.

### Parâmetros canônicos

| Delphi | `parametros_valor('texto')` | Efeito |
|---|---|---|
| `AutorizacaoPagtoAutomatica` | `AUTORIZACAO PAGTO AUTOMATICA` | Autoriza novas Duplicatas e residuais (`clparametrossistema.pas:1992,2784`; `dmcontaspagar.pas:2696-2705`). |
| `DataContabil` | `DATA CONTABIL` | Data mínima e gate do período (`clparametrossistema.pas:1969,2608`; `fmcontaspagar.pas:556-559`). |
| `GerarContabilidade` | `GERARCONTABILIDADE` | Ativa geração/validação e requisitos contábeis (`clparametrossistema.pas:2127,7779-7787`). |
| `ExercicioContabilidade` | `EXERCICIOCONTABILIDADE` | Contexto do exercício; efeitos serão detalhados no ticket 03 (`clparametrossistema.pas:2126,4383-4391`). |
| `InicioIntegracaoBancos` | `Início Integração Bancos` | Ativa sequências bancárias a partir da data (`clparametrossistema.pas:2009,4307-4315`; `dmcontaspagar.pas:3782-3803`). |
| `historicopadraopagtoduplicata` | `Histórico padrão pagto duplicata` | Fallback do histórico contábil (`clparametrossistema.pas:2269,5726-5734`; `dmcontaspagar.pas:4860-4866`). |

### Encaminhamento

**Preservar:** Data do servidor, Filial de Pagamento, campos financeiros, gates de Data Contábil/previsão/impostos, autorização delegada, parcial explícito, desconto integral, cancelamento individual/conjunto e motor comum para tela/lote/retorno.

**Redesenhar:** autorização apenas para abrir modal, permissões ambíguas, bypass `tecsoft`, reautorização automática após cancelar, mutação direta e ausência de revisão, idempotência, auditoria e conflito concorrente.

**Reservado ao ticket 03:** tabelas/SQL, ordem transacional, efeitos bancários, contábeis e tributários, lotes, sequências, rollback e reconciliação.
