# Prompt para `/speckit.specify` — Reposição ECC: contratos parcelar e falhas técnicas

```text
/speckit.specify

Crie uma especificação corretiva incremental para fechar as pendências encontradas na auditoria do spec 18 em  /mnt/c/teclux_analysis/modules/estoque/consulta-compras/ da Reposição ECC. Não implemente código nesta etapa. Consuma os prompts 16–18 /mnt/c/teclux_analysis/modules/estoque/consulta-compras/, as specs 431–433 e o checkout atual.

## Diagnóstico obrigatório

O spec 18 implementou redistribuição multifonte, persistência de parcelas, exceções parciais, isolamento por parcela, projeção compartilhada, UI de parcelas e parte dos testes de recuperação. Ainda existem quatro gaps:

1. `ReposicaoEccExcecaoMaterializer::materialize()` reutiliza exceção vigente apenas por `item_id + motivo`; como `parcela_id` está somente nos fatos JSON, uma parcela pode sobrescrever os fatos de outra.
2. O `catch (Throwable)` do caminho parcelar de confirmação transforma qualquer falha técnica do núcleo em exceção de saldo insuficiente.
3. A confirmação devolve `confirmados[]` plano, mas o contrato 431/433 exige `confirmados[].parcelas[]` para preservar a identidade operacional.
4. Os testes de dispatch cobrem somente falha ao persistir snapshot; faltam falhas ao criar `OperationalExecution` e ao despachar/enfileirar o job.

Preserve as decisões já fechadas sobre concentração, prefixos, filtros congelados, gerente de vendas, pedidosfiliais, idempotência, OCC, timezone e tela própria.

## 1. Identidade de exceção por parcela

Defina e implemente no contrato uma chave de reuso sem perder fatos:

- exceção parcelar: mesma exceção somente quando lote/item/motivo/parcela forem a mesma identidade operacional, conforme o modelo existente;
- parcelas diferentes do mesmo item devem manter exceções distintas ou uma estrutura explicitamente agregada que preserve todos os vínculos;
- exceção agregada de saldo insuficiente deve ter identidade diferente da exceção de uma parcela;
- retry do mesmo caso deve atualizar fatos sem duplicar a exceção;
- cada parcela afetada deve continuar com `excecao_id` consultável;
- os fatos devem manter original, confirmada, pendente, fonte, etapa e evidência da revalidação/falha.

Não usar uma leitura genérica por item + motivo que apague a parcela anterior. Se o banco não tiver coluna de parcela, documente uma consulta segura sobre os fatos JSON ou uma migração mínima compatível com os bancos suportados, incluindo índice/concorrência necessários.

## 2. Classificação de falha do núcleo

Separe explicitamente:

- saldo insuficiente ou fonte inelegível: exceção de negócio persistente, com `quantidade_original`, `quantidade_confirmada` e `quantidade_pendente`;
- duplicidade/idempotência já existente: resultado idempotente ou exceção de duplicidade conforme contrato;
- indisponibilidade, timeout, erro de banco ou falha técnica de `somarWithinTransaction`: falha técnica da parcela, sem registrar `saldo_insuficiente`.

Para falha técnica por parcela:

- preserve parcelas seguras do mesmo item/escopo;
- mantenha a parcela falha fora de `pedidosfiliais` e com estado consultável;
- materialize fatos com código estável, etapa, exceção original e indicação de retry;
- retorne o código correto no resultado parcial e nos indicadores;
- defina claramente se a confirmação HTTP permanece 200 parcial, 409/503 ou outro status, sem quebrar a idempotência;
- retry da mesma chave não pode criar segundo efeito para parcelas já confirmadas.

Não capture `Throwable` e classifique tudo como estoque alterado/saldo insuficiente.

## 3. Contrato de confirmação parcelar

Atualize o serviço, controller, result de idempotência, tipos TypeScript e testes para que a confirmação devolva:

- `confirmados[]` agrupável por item;
- dentro de cada item, `parcelas[]` com `parcela_id`, fonte, ordem quando disponível, quantidade confirmada e código de `pedidosfiliais`;
- todos os códigos de todos os pedidos criados;
- `excecoes[]` com `item_id`, `parcela_id` quando aplicável, código, texto e fatos/identidade suficientes para a UI;
- replay da mesma chave devolvendo exatamente o mesmo envelope e todos os códigos;
- compatibilidade explícita para item legado sem parcelas, caso esse caminho ainda exista.

O contrato não pode depender apenas de uma lista plana de confirmações para reconstruir parcelas. A tela deve conseguir distinguir tentativas de fonte, parcelas confirmadas, parcelas em exceção e códigos gerados.

## 4. Testes obrigatórios

Crie testes de comportamento, sem mocks frágeis dos repositórios finais, para:

- duas parcelas do mesmo item falhando em fontes diferentes, mantendo duas identidades/fatos de exceção;
- parcela de saldo insuficiente e parcela confirmada do mesmo item, preservando original/confirmada/pendente;
- falha técnica do núcleo em uma parcela sem criar motivo `saldo_insuficiente`;
- falha técnica em A e confirmação segura em B;
- retry idempotente após confirmação parcial sem novo `pedidosfiliais`;
- resposta `confirmados[].parcelas[]` com todos os códigos e replay idêntico;
- falha depois do reserve ao criar `OperationalExecution`;
- falha ao persistir snapshot;
- falha ao despachar/enfileirar o job;
- retry dos três cenários sem segunda execução, snapshot, lote ou job.

Use trigger/stub controlado somente onde o contrato do teste exigir uma falha específica e documente quais cenários dependem de SQLite versus PostgreSQL.

## Aceite mínimo

- Exceções de parcelas distintas não sobrescrevem os fatos umas das outras.
- Falha técnica do núcleo não aparece como saldo insuficiente.
- Cada confirmação parcelar tem `parcela_id` e código correspondente.
- `confirmados[].parcelas[]` é preservado na resposta original e no replay idempotente.
- Os três pontos de falha pós-reserve possuem regressão executável.
- Nenhum retry duplica execução, snapshot, lote, job ou pedidofilial.

## Arquivos prioritários

- `backend/app/Application/Estoque/ReposicaoEcc/ReposicaoEccExcecaoMaterializer.php`;
- `backend/app/Infrastructure/Persistence/Cloud/Estoque/ReposicaoEcc/CloudReposicaoEccExcecaoRepository.php`;
- `backend/app/Services/Estoque/ReposicaoEcc/ReposicaoEccConfirmarService.php`;
- `backend/app/Http/Controllers/Estoque/ReposicaoEccController.php`;
- `backend/resources/js/types/reposicaoEcc.ts`;
- `backend/resources/js/Pages/Cadastros/Estoque/ReposicaoEcc/Index.tsx`;
- `backend/tests/Feature/Estoque/ReposicaoEcc/`;
- `backend/tests/Unit/Estoque/ReposicaoEcc/`.
```
