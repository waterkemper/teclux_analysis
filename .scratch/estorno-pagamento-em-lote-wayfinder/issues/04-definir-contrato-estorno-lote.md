# Definir o contrato transacional do Estorno de Pagamento em Lote

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual contrato de domínio e Application deve garantir seleção múltipla atômica, transição `PAID -> AUTHORIZED`, motivo obrigatório e reversão/reconstrução exata de todos os efeitos individuais e compartilhados, inclusive estorno parcial de uma quitação original com cheque único?

## Answer

O Estorno de Pagamento em Lote é uma única intenção financeira atômica sobre uma ou várias Duplicatas. Sua superfície de Application deve espelhar a Quitação em Lote sem chamar commands individuais em loop:

```text
preview(BatchPaymentReversalDraft, OperatorContext): BatchPaymentReversalPreview
confirm(BatchPaymentReversalConfirmation, OperatorContext): BatchPaymentReversalResult

preflight(PaymentReversalIntent, LockedPaymentContext): PaymentReversePlan
apply(PaymentReversePlan[], SharedTransactionContext): PaymentReversalEffectManifest
```

O núcleo interno de `preflight/apply` é compartilhado pelos Estornos individual e em lote. Controllers, Requests e UI não manipulam repositories, locks, writers ou transações.

### Intenção, autoridade e histórico

- O lote recebe uma seleção explícita de identidades/revisões/`payment_id`, um único motivo obrigatório e uma idempotency key própria.
- Usa a mesma Permissão/perfil funcional `Pagamento` exigida para quitar. A prova sensível é específica para a intenção de Estorno em Lote e vinculada ao preview, motivo, seleção e efeitos; Operador e eventual Autorizador são persistidos separadamente.
- O motivo comum integra hash, proof, manifesto de lote, manifesto de cada item e Auditoria. Itens que exigem motivos distintos pertencem a lotes distintos.
- Cada item faz somente `PAID -> AUTHORIZED`, restaura a autorização original e preserva identidade e dados originais da Duplicata.
- Manifestos de Quitação são históricos imutáveis. Cada Estorno cria manifesto próprio ligado ao `payment_id` revertido. O envelope da Quitação em Lote original conserva a fotografia e expõe situação derivada `PAID`, `PARTIALLY_REVERSED` ou `REVERSED`.

### Preview, confirmação e atomicidade

- `preview` é estritamente somente leitura: normaliza/deduplica a seleção, resolve dependências, adota logicamente legados, calcula a ordem causal e canônica, materializa before/after e efeitos compartilhados, devolvendo token/hash expirável e revisões.
- `confirm` reserva idempotência batch e, em uma única transação, bloqueia em ordem canônica Documentos, Duplicatas, residuais, tributos e agregados bancários/contábeis; repete todo o preflight sob lock antes da primeira escrita.
- Pagamento legado sem manifesto só é elegível quando as chaves persistidas permitem reconstruir e validar deterministicamente um manifesto completo, sem parse de histórico ou heurística de valor. A adoção é apenas planejada no preview e persistida na transação do confirm. Ambiguidade rejeita o lote inteiro.
- Qualquer item inexistente, não pago, já estornado, fora da Filial, com revisão alterada, vínculo incompleto, período fechado, movimento conciliado/integrado externamente ou dependência não reversível rejeita tudo antes das escritas.
- Mesma idempotency key e mesmo hash retornam replay; conteúdo diferente retorna conflito. Reserva `pending` usa lease/ownership recuperável para consulta ou retomada após timeout, sem repetir efeitos.

### Dependências, parcial e desconto

- O preview calcula um fechamento de dependências, mas nunca adiciona efeitos silenciosamente. Pagamentos tributários derivados e pagamentos posteriores de residuais devem aparecer e ser explicitamente confirmados na seleção.
- Uma residual aberta e inalterada criada pela Quitação estornada é excluída e a Duplicata original é integralmente restaurada.
- Se a residual foi posteriormente quitada, seu pagamento deve integrar o mesmo lote; a cadeia é estornada em ordem causal inversa. Alteração externa da residual, dependência ausente ou ciclo/ambiguidade bloqueiam tudo.
- Em `PARTIAL_AS_DISCOUNT`/Desconto Obtido, restaura-se exatamente o `valordesconto` anterior registrado no manifesto, desfazendo apenas o delta daquela Quitação. Legado sem snapshot só pode ser adotado se o valor anterior for comprovável deterministicamente.
- Tributo retido pago só pode ser revertido junto quando estiver explicitamente incluído e seu período/vínculo permitir; caso contrário, rejeita o lote.

### Efeitos compartilhados

- Os `PaymentReversePlan` são agrupados por agregado bancário e contábil. O motor remove todos os efeitos selecionados e calcula uma única fotografia final por agregado, em vez de reconstruí-lo repetidamente por item.
- Para `SINGLE_CHECK`, remove os eventos exatos por vínculo completo. Se restarem eventos, preserva identidade, cheque e vínculos do cabeçalho e recalcula valor/caracterização pela soma persistida dos remanescentes; sem eventos, exclui o cabeçalho.
- A mesma regra de fotografia final vale para créditos/lotes contábeis compartilhados. Contabilidade, tributos, Duplicatas, residuais, banco, manifestos, envelope e Auditoria mudam na mesma transação.
- Movimento bancário conciliado ou integrado externamente não é reaberto nem compensado por esta feature: bloqueia o lote e exige fluxo próprio fora da tela.

### Reconciliação e resultado

Antes do commit, o reconciliador prova contra o manifesto: todas e somente as transições planejadas; autorização e snapshots restaurados; residuais/descontos; dependências; eventos removidos; somas, sinais e cardinalidades dos cabeçalhos restantes; Contabilidade; tributos; manifestos/envelopes; Auditoria; revisões; e ausência de efeitos fora do conjunto. Divergência causa rollback.

O resultado retorna `batch_reversal_id`, replay, correlação/idempotência, motivo, Operador/Autorizador, itens `AUTHORIZED`, dependências, revisões, estados dos lotes originais, manifestos de Estorno, fotografias bancária/contábil/tributária, residuais/descontos restaurados, Auditoria e warnings.

Esta decisão aprofunda ADR-0247/0255 e ADR-0277: PAID continua imutável fora do Estorno, enquanto o lote adiciona atomicidade e reconstrução parcial determinística dos agregados compartilhados.
