# Prompt para /speckit.specify — Sincronização segura com Contas a Pagar

```text
/speckit.specify

Crie uma especificação corretiva P0 para impedir perda de fatos financeiros ao sincronizar Pedido de Compra com Contas a Pagar. Depende das specs 16 e 17. Gere a spec; não implemente.

LEIA E REVALIDE

- modules/estoque/cadastro-pedidos/08, 16 e 17-speckit-prompt.md
- modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md e artefatos atuais equivalentes
- CONTEXT.md: Documento a Pagar, Duplicata, Autorização de Pagamento e Quitação
- auditorias desta pasta
- DocumentoPagarPedidoAdapter, serviços/repositories de previsão/gravação e implementação vigente de Contas a Pagar.

PROBLEMA

O adapter atual apaga Documento/Duplicatas e recria tudo em cada gravação, sem testar autorização/pagamento. Isso pode destruir fatos protegidos. A regra antiga “recriar do zero” só vale quando a programação financeira mudou e todas as parcelas são elegíveis.

CONTRATO

Normalize as Previsões financeiras e calcule fingerprint versionado (datas, valores/percentuais, identidade/ordem e total). Compare com o último estado financeiro persistido sob locks da spec 16.

- fingerprint inalterado: não tocar Documento/Duplicatas;
- alteração exclusivamente não financeira: não sincronizar;
- fingerprint alterado + todas as Duplicatas não autorizadas e não pagas: reconstrução atômica/idempotente é permitida, preservando exatamente um Documento por Pedido e espelho 1:1 das Previsões;
- qualquer Duplicata autorizada: bloquear com ORDER_FINANCIAL_SCHEDULE_AUTHORIZED;
- qualquer Duplicata paga: bloquear com ORDER_FINANCIAL_SCHEDULE_PAID;
- mistura de estados: regra mais restritiva, zero efeitos;
- cancelamento/exclusão do Pedido segue a mesma proteção; nunca remove fato protegido.

Mensagens devem dizer que as Previsões não podem ser alteradas porque existem parcelas autorizadas ou pagas e orientar a revisar/estornar pelo fluxo financeiro apropriado. Não ofereça bypass administrativo e não faça reparação silenciosa.

ATOMICIDADE E RECONCILIAÇÃO

Na mesma transação do Pedido:
1. reserve idempotência/revisão;
2. bloqueie Pedido, Documento e Duplicatas em ordem canônica;
3. releia fingerprint e situações;
4. execute motores da spec 17 quando requerido;
5. sincronize apenas se elegível;
6. prove 1 Documento, N Duplicatas iguais às N Previsões, somas/datas/Filial/Parte corretas e ausência de órfãos;
7. commit.

Não faça delete antes de provar elegibilidade. Falha no enésimo efeito reverte tudo. Alteração não financeira continua mesmo com Duplicata protegida, desde que não invoque sincronização.

ERROS/OBSERVABILIDADE

Envelope estável com code/message/correlation_id. Além dos códigos acima: ORDER_FINANCIAL_SCHEDULE_DIVERGED e ORDER_FINANCIAL_RECONCILIATION_FAILED. Logs estruturados sem dados sensíveis; nenhuma senha/proof.

TESTES POSTGRESQL REAIS

- gravação sem mudança não executa delete/insert;
- mudança elegível reconstrói exatamente uma vez;
- autorizada bloqueia com mensagem e zero writes;
- paga bloqueia com mensagem e zero writes;
- alteração não financeira com parcela paga conclui sem tocar financeiro;
- mistura paga/autorizada/aberta bloqueia;
- cancelamento/exclusão protegido;
- rollback no enésimo delete/insert;
- duas sessões alterando Previsões;
- replay/mismatch de idempotência;
- somas/arredondamento e 1:1;
- convivência com alteração Delphi entre preview/save;
- ausência de órfãos após falha.

Regressão obrigatória de Pedido, Autorização, Quitação/Estorno e Contas a Pagar. Nenhum crítico skipped/SQLite-only.

SAÍDA

Spec pronta para plan com contratos, fingerprint, estados/elegibilidade, locks, reconciliação, erros/mensagens, testes, rollout e matriz de arquivos mínimos após revalidar o código.

FORA DE ESCOPO

Alterar regras de quitação/autorização; bypass; apagar fato protegido; criar outro Documento; alterar Delphi; reparação automática; sucesso parcial; implementar agora.
```
