# Prompt para `/speckit.specify` — Reposição ECC: hardening da orquestração

```text
/speckit.specify

Crie uma especificação funcional e técnica para corrigir dois riscos operacionais residuais encontrados após a implementação dos prompts 12 a 15 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/. Não implemente código nesta etapa. Consuma a fundação já criada e preserve todas as decisões funcionais dos prompts anteriores.

## Validação de timezone na rotina

`cloud_estoque_reposicao_ecc_rotinas.timezone` pode ser preenchido com qualquer texto não vazio, embora o cálculo de janela dependa de um timezone IANA válido. Defina validação fail-closed na criação, edição e ativação da rotina:

- valor ausente continua significando fallback explícito documentado;
- valor preenchido deve ser aceito somente se `DateTimeZone` conseguir carregá-lo;
- erro deve ser apresentado como configuração inválida antes de ativar/agendar;
- o valor efetivo usado no snapshot e no dispatcher deve ser o mesmo valor validado;
- inclua testes para timezone válido, vazio/nulo e identificador inválido.

## Recuperação após reserva de idempotência

`ReposicaoEccDispatchService::enqueueCalculo()` reserva a chave de idempotência antes de criar a execução, snapshot e job. Defina uma transação/compensação segura para falhas depois da reserva:

- falha ao criar execução, snapshot ou despachar o job não pode deixar a chave como pendente indefinidamente;
- a execução operacional e a janela devem registrar estado de falha recuperável, com mensagem segura e request/idempotency key;
- retry do mesmo vencimento deve poder retomar ou reproduzir o dispatch sem duplicar execução, snapshot, lote ou job;
- a reserva deve ser completada somente depois do snapshot/job estarem consistentemente registrados, ou deve ser marcada como falha com lease/retry explícito;
- o caminho de lote bloqueado por pendência deve manter a semântica atual e não criar novo lote;
- inclua teste de erro em cada etapa posterior à reserva e teste de retry/replay.

Não introduza configuração padrão de cliente, envio externo ou confirmação automática de `pedidosfiliais`. O job continua somente gerando proposta; a confirmação continua na tela e no núcleo existente.

## Aceite mínimo

- [ ] Rotina com timezone inválido não pode ser ativada.
- [ ] Fallback de timezone é explícito, auditável e coberto por teste.
- [ ] Erro pós-reserva não deixa idempotência nem execução sem recuperação.
- [ ] Retry não duplica snapshot, execução, lote ou job.
- [ ] Falhas aparecem como alerta/execução operacional, não como exceção de estoque.

## Fontes obrigatórias

- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/12-speckit-prompt-reposicao-ecc-fundacao-orquestracao.md`;
- `/mnt/c/teclux_analysis/modules/estoque/consulta-compras/15-speckit-prompt-reposicao-ecc-excecoes-indicadores.md`;
- `specs/427-reposicao-ecc-fundacao/spec.md`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccRotinaService.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccDispatchService.php`;
- `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccIdempotencyGuard.php`;
- contratos de `OperationalExecution`, janelas e jobs no checkout Laravel.
```

