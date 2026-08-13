# Prompt de implementação — Gates, testes e conformidade final

```text
/speckit.implement

Implemente R5 de `laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md` depois dos prompts 04–07.

Complete o schema gate de testes/CI para todas as tabelas e colunas realmente utilizadas pela plataforma e pela ponte. Não inclua tabelas de efeitos financeiros fora do escopo e não use Schema::has*, information_schema ou pg_catalog no caminho de request.

Remova os acessos SQL que permanecerem fora de Infrastructure/Persistence, elimine fallback silencioso de schema, centralize a construção duplicada dos eventos fiscais e atualize o binding/assert de produção. Preserve o Fake apenas em testes/dry-run explícito.

Execute a matriz completa Unit + Feature + PostgreSQL: durabilidade/restart, numeração concorrente/rollback, fotografia imutável, filial física, autorização e replay, capability, projeção idempotente de Transferencia, Delphi e estados distintos. Inclua testes que comprovem que VendaTransferencia e DevolucaoTransferencia são rejeitadas. Registre no relatório qualquer teste bloqueado por ambiente; não mascarar falha de dependência.

Atualize ADR, runbook e documentação de suporte apenas após o comportamento estar comprovado pelos testes.
```
