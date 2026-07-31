# Publicar os comandos SpecKit do Cadastro de Requisições

Type: task
Status: resolved
Blocked by: 09

## Question

Como dividir e redigir comandos `/speckit.specify` autocontidos, ordenados e executáveis, e em qual pasta de `modules/` publicá-los, incorporando todas as decisões e evidências do mapa sem incluir consulta geral, separação, transferência, expedição ou recebimento?

## Answer

Publicados três comandos autocontidos e executáveis em ordem sob `modules/interlojas/requisicao-para-exposicao/`:

1. [Núcleo compartilhado](../../../modules/interlojas/requisicao-para-exposicao/01-speckit-prompt-nucleo-compartilhado.md) — aprofunda parâmetros literais, persistência, duplicidade, locks, TEP/TPE/TFR, Venda Futura, auditoria em `pedidosfiliais_log_new`, revisão comum Delphi–Laravel e regressão da Consulta de Compras.
2. [Backend do Cadastro](../../../modules/interlojas/requisicao-para-exposicao/02-speckit-prompt-backend-cadastro.md) — especifica módulo/autorização, ficha, CRUD, cancelamento, projeções, pesquisas F9, lookups e contratos HTTP próprios.
3. [Interface e integração](../../../modules/interlojas/requisicao-para-exposicao/03-speckit-prompt-interface-integracao.md) — especifica página Inertia/React, modos, campos, atalhos, dependências, modais, feedbacks, menu e smoke test.

Cada prompt delimita investigação Laravel, contrato confirmado, critérios de aceite, matriz de testes, saída esperada e fora de escopo. Os prompts não mandam implementar durante `/speckit.specify`, não dependem de abrir Delphi e excluem consulta histórica geral, separação, transferência, expedição e recebimento.

Validação documental confirmou um comando principal por arquivo, blocos Markdown fechados e presença das decisões críticas sobre descrições literais de parâmetros, filial ativa, filiais autorizadas, `pedidosfiliais_log_new`, Venda Futura, PostgreSQL real e menu **Interlojas → Requisição para Exposição**.
