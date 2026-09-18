# Auditoria da implementação dos prompts 16 e 17

Data: 2026-08-25

## Refs auditados

- `origin/431-reposicao-ecc-parcelas-fonte` (`8fc31477`), prompt 16;
- `origin/432-reposicao-ecc-ops-hardening` / `origin/main` (`105a4273`), prompt 17;
- ponto anterior: `origin/430-reposicao-ecc-operacao` (`32f8c713`).

## Resultado

O prompt 17 está implementado no núcleo principal: timezone IANA é validado, o fallback é fotografado e falhas pós-reserva marcam idempotência, execução e janela como falhas recuperáveis. A implementação também possui testes de timezone e recuperação por falha de snapshot.

O prompt 16 está somente parcialmente implementado. A persistência de parcelas e a confirmação de duas fontes funcionam no caso feliz A=6/B=4, mas ainda há falhas no caminho de saldo parcial, redistribuição e apresentação.

## Achados P1

### E1 — redistribuição não alcança outra fonte

Em `ReposicaoEccRevalidarService`, cada parcela é revalidada filtrando `fontesAloc` para a filial original antes de chamar o alocador (`:180-194`). Se A perdeu saldo, o alocador recebe somente A e nunca pode escolher B. Isso viola a redistribuição por parcela prevista na spec 431 FR-009 e no teste independente de fonte A perdida.

### E2 — exceção de saldo insuficiente ainda não é persistente

`ReposicaoEccGerarPropostaService` só materializa exceção quando o item inteiro está em `excecao_revisao`; uma alocação parcial continua com status `proposto`. Na confirmação, `confirmarParcelas()` apenas adiciona `SALDO_INSUFICIENTE` ao payload e atualiza agregados (`:455-522`), sem chamar materializador por parcela nem preencher `excecao_id`. A spec 431 deixa T014–T017 pendentes e exige original, confirmada e pendente consultáveis na fila 430.

### E3 — falha de uma parcela ainda pode abortar as demais

Uma exceção de `somarWithinTransaction()` é relançada em `confirmarParcelas()` (`:419-432`). Como a confirmação está em uma transação única, uma corrida/duplicidade no núcleo pode impedir parcelas seguras do mesmo item. FR-014 exige isolamento por parcela e continuidade das demais; isso requer classificação prévia e/ou savepoint compatível com a transação do núcleo.

### E4 — contexto compartilhado ainda usa atalho de estoque

`ReposicaoEccFonteContextoService` continua preenchendo `estoque_snapshot` com `pol['emestoque']` (`:74-91`), não com a projeção de status/reservas do snapshot. A semântica de `sem_venda` também depende de fallback `true` quando a fonte não aparece no preview. O seam foi criado, mas não garante ainda a mesma projeção exigida por 428/431.

## Achados P2

### E5 — contrato de saída e UI ainda não expõem parcelas

`ReposicaoEccItemPolitica` não declara `parcelas`, e `Index.tsx` renderiza somente a tabela de tentativas `fontes`. A spec 431 FR-020 exige mostrar filial fonte, quantidades, estado e código de `pedidosfiliais` separadamente das tentativas. O resultado de confirmação também permanece uma lista plana de parcelas, sem o agrupamento por item descrito no contrato `confirmacao-parcelas.md`.

### E6 — cobertura de testes do prompt 16 está incompleta

Em `specs/431-reposicao-ecc-parcelas-fonte/tasks.md`, T014–T040 ainda estão marcadas como pendentes. Não há os testes dedicados de saldo parcial persistido, tentativa versus parcela, revalidação com redistribuição, idempotência por parcela, duplicidade por fonte, concentradora por parcela e UI.

### E7 — matriz de falhas do prompt 17 não está completa

Os testes de recuperação existentes exercitam principalmente falha de snapshot. Não há evidência equivalente para falha na criação da execução e no dispatch do job. O código possui compensação geral, mas essas etapas devem ter regressão explícita para garantir que nenhuma mudança futura reintroduza chave `pending` órfã.

## Decisão

É necessário o prompt 18, focado no fechamento funcional do prompt 16 e na cobertura residual do prompt 17. Não é necessário reabrir a fundação, os prefixos, a concentração, a autorização ou o fluxo de timezone já implementados.

