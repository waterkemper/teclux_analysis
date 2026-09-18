# Consolidar dossiê e prompts /speckit.specify da Curva ABC

Type: task
Status: resolved
Blocked by: 06

## Question

Como consolidar as pesquisas e decisões em um dossiê rastreável, README/índice e prompts `/speckit.specify` autocontidos em `modules/estoque/relatorio-curva-abc/`, citando o baseline Laravel, as evidências Delphi consolidadas, o contrato persistente, os seams de `heavy-reports`, testes, critérios de aceite, observabilidade, rollout, rollback e fora de escopo, sem pedir nova investigação vaga nem implementar durante o SpecKit?
## Answer

Publicados e validados em modules/estoque/relatorio-curva-abc:

- README.md com ordem, autoridades, decisoes e regras comuns.
- dossie.md com evidencia Delphi/Laravel, contrato decidido, lacunas e fora de escopo.
- 01-speckit-prompt-geracao-curva-abc.md para F6, grade, heavy-reports efemero, polling, cancelamento, autorizacao e testes.
- 02-speckit-prompt-gravacao-classificacao-abc.md para Gravar, modos por Produto, autorizacao global, transacao, concorrencia, triggers, auditoria e testes PostgreSQL.

Os prompts sao autocontidos, sequenciais e nao implementam durante /speckit.specify. A validacao confirmou os caminhos do pacote, os contratos decididos e git diff --check sem erros. O proximo passo e executar o prompt 01 no checkout Laravel e, somente depois, o prompt 02.
