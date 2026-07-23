# Inventariar o pós-pagamento e o estorno no Delphi

Type: task
Status: resolved
Blocked by:

## Answer

### Operações alcançáveis após a quitação

- `CONFIRMADO` — Na navegação normal, uma Duplicata com `datapagto` abre `topCANCELAR`; a ação passa a **Cancelar F6**. Vencimento, valor, descontos, banco de cobrança, comissões e dados de pagamento ficam somente leitura nesse modo (`fmcontaspagar.pas:934-940`; `fmcadastroduplicatascontaspagar.pas:136-174,815-823`).
- `CONFIRMADO` — Alteração do Documento e geração/alteração cadastral ficam bloqueadas quando existe quitação; `PermiteAlterarVencimento` exige `datapagto = 0`. `PermiteAlterarPagamento` habilita a entrada no fluxo pagar/cancelar, não edição livre (`dmcontaspagar.pas:2825-2885,4249-4267`).
- `DIVERGENTE` — Há um **Refazer Pagamento** técnico, visível somente para o login literal `tecsoft`: guarda os dados, cancela e paga novamente. Esse bypass contradiz a nova regra e não deve ser reproduzido no Laravel (`fmcadastroduplicatascontaspagar.pas:174,204-256`; `fmcontaspagar.pas:704-755`).
- `CONFIRMADO` — `DesQuitarDuplicatas`, usado por rotinas em lote/retorno, define `topCANCELAR` e reutiliza `CancelarQuitacao`; com `fViaLote_`, dispensa confirmação interativa (`dmcontaspagar.pas:3871-3921`).

### Estado resultante da Duplicata

- `CONFIRMADO` — São sempre limpos `datapagto`, `filialpagto`, `contapagto`, `chequepagto`, `tipopagamento`, `contacredito` e, ao final de `GravarContasPagar(topCANCELAR)`, `valorpagto`, `datapagtoaux`, `contapagtoaux` e `chequepagtoaux`.
- `CONFIRMADO` — Quando o vínculo bancário é localizado, também são limpos `evento`, `sequencia` e `sequenciaevento`. No cancelamento de todo o cheque/lote, `Cancelar(True)` limpa ainda `nrlotecontabil` e esses vínculos em cada Duplicata associada.
- `CONFIRMADO` — O estado final é **autorizado e não pago**: `autorizado = True` e `dataautorizacaopagto = now`.
- `CONFIRMADO` — Permanecem os dados originais da obrigação: vencimento, `valorvencto`, `valordesconto`, juros, multa, banco de cobrança e observações. Não foi localizada limpeza explícita do usuário/auditoria cadastral.
- `POSSÍVEL BUG LEGADO` — No cancelamento individual, `nrlotecontabil` não é limpo por `Cancelar(False)`. `evento`/`sequencia`/`sequenciaevento` só são limpos no ramo de integração bancária quando `movtosbancos` é encontrado; registros antigos, adiantamentos ou vínculos ausentes podem conservar chaves históricas. O contrato novo deve exigir limpeza determinística, sem copiar essa dependência.

### Bancos, Contabilidade, impostos e agrupamentos

- `CONFIRMADO` — Adiantamento (`tipopagamento = 3`) não gera nem estorna `movtosbancos`, pois seu movimento pertence ao adiantamento.
- `CONFIRMADO` — O cabeçalho bancário é localizado por `(conta,data,sequencia)` e o evento por `(conta,data,sequencia,evento,sequenciaevento)`. Se exclusivo, o cabeçalho é excluído; se agregado, o valor é reduzido e apenas os eventos selecionados são excluídos. Se resta uma associação, observação/evento do cabeçalho são recompostos; ao cancelar todos, cabeçalho e eventos são eliminados (`dmcontaspagar.pas:2423-2488`).
- `CONFIRMADO` — Com Contabilidade habilitada, o estorno localiza lançamentos por origem `P`, lote e exercício. Cancela todos os lançamentos do lote ou, no individual, remove os da Duplicata e recompõe crédito/saldo do agrupamento (`dmcontaspagar.pas:1868-1935`).
- `CONFIRMADO` — Impostos retidos vinculados já pagos impedem o estorno. No cancelamento total há validação/gravação dos datasets tributários do lote.
- `CONFIRMADO` — Duplicata, bancos, eventos, impostos, lote e Contabilidade aplicável participam da mesma chamada `Perpetrar`, seguida de `ValidarValoresDocumentosPag(..., True)`, evidenciando intenção atômica e reconciliação pós-gravação (`dmcontaspagar.pas:2527-2604`).
- `CONFIRMADO` — Quando há agrupamento, o usuário escolhe cancelar todo o cheque/lote ou somente a Duplicata; o total percorre todas as Duplicatas vinculadas e limpa também o espelho de lote.

### Regra extraída

O comportamento aproveitável é: uma Duplicata paga não recebe edição direta; o estorno desfaz atomicamente a quitação e seus efeitos bancários/contábeis aplicáveis, retornando a obrigação a **autorizada e não paga**. A especificação nova deve remover Refazer Pagamento e limpar explicitamente todas as chaves de quitação, inclusive diante de dados históricos sem movimento bancário localizável. A política para vínculos históricos ausentes ou ambíguos permanece para os tickets de contrato e migração.

## Question

No Delphi alcançável, quais operações permanecem disponíveis após a Quitação, quais campos de `duplicatas` são limpos/preservados por `CancelarQuitacao`/`DesQuitarDuplicatas` e como são eliminados ou recompostos bancos, Contabilidade, impostos, lote e agrupamentos?
