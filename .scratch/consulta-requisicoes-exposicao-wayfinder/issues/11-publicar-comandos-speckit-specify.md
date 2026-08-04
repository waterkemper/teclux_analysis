# Publicar comandos SpecKit da Consulta de Requisições

Type: task
Status: resolved
Blocked by: 10

## Question

Como redigir e publicar em `modules/interlojas/consulta-requisicoes-exposicao/` comandos `/speckit.specify` autocontidos, ordenados e executáveis que incorporem todas as decisões do mapa e excluam separação, transferência, expedição e recebimento?

## Answer

Foram publicados quatro comandos `/speckit.specify` autocontidos e ordenados:

1. [Fundação e autorização](../../../modules/interlojas/consulta-requisicoes-exposicao/01-speckit-prompt-fundacao-autorizacao.md) — capability/menu próprios, filial ativa autorizada, filtros canônicos e parâmetros.
2. [Leitura, grid e Confirmados](../../../modules/interlojas/consulta-requisicoes-exposicao/02-speckit-prompt-leitura-grid.md) — read repository paginado, projeções, estados React, grid Pedidos e detalhe read-only.
3. [Quantidade e cancelamento](../../../modules/interlojas/consulta-requisicoes-exposicao/03-speckit-prompt-acoes-compartilhadas.md) — adapters estreitos sobre `RequisicaoFiliais`, revisão, auditoria, conflitos e alertas.
4. [Relatório F12](../../../modules/interlojas/consulta-requisicoes-exposicao/04-speckit-prompt-relatorio-f12.md) — leitura completa autorizada e PDF paisagem inline com o contrato visual confirmado.

Cada prompt contém investigação Laravel obrigatória, contrato autoritativo, limites arquiteturais, critérios de aceite, matriz mínima de testes, saída esperada e fora de escopo. Todos preservam o Cadastro e o núcleo existentes e excluem separação, transferência, expedição, recebimento, geração em lote e alteração operacional de `qtderecebida`.

A ordem executável é 01 → 02 → 03, com 04 após o contrato de filtros/leitura de 02 e independente das mutações de 03.
