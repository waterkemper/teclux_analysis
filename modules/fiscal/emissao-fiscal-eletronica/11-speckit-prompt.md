# Prompt para /speckit.specify — Carta de Correção Eletrônica

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para emitir Carta de Correção Eletrônica de NF-e, reutilizando o pipeline de Eventos Fiscais de `10-speckit-prompt.md`.

Não implemente. Inspecione o checkout Laravel e mantenha validações regulatórias versionadas no servidor.

## Limite desta entrega

- capability de CC-e somente para NF-e autorizada e elegível;
- validação do texto e das matérias que não podem ser corrigidas por CC-e;
- sequência controlada atomicamente, sem colisão concorrente;
- Evento Fiscal imutável com XML, Tentativas, protocolo e reconciliação;
- consulta cronológica de todas as CC-e na Central;
- custódia dos Artefatos e auditoria do ator/texto resumido/resultado;
- manutenção da Situação Fiscal AUTORIZADA após CC-e autorizada.

Não inclua editar a Fotografia autorizada, substituir NF-e, cancelamento ou distribuição por e-mail.

## Testes obrigatórios

- primeira e próximas CC-e com sequência correta;
- concorrência não duplica sequência;
- texto inválido/matéria vedada, nota cancelada e usuário sem permissão são recusados;
- autorização, rejeição, ambiguidade e replay idempotente;
- próxima CC-e fica bloqueada enquanto evento anterior estiver ambíguo;
- projeção não marca a nota como cancelada e histórico original permanece imutável.

Produza spec, plano, regras de elegibilidade, contrato do evento e testes. Não implemente durante `/speckit.specify`.
```
