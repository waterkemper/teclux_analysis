# Consolidar o prompt SpecKit dos grids ERP

Type: task
Status: resolved
Blocked by: 06

## Question

Como consolidar todas as decisões deste mapa em um prompt `/speckit.specify` autocontido para o Cursor, publicado em `modules/erp/grids/01-speckit-prompt.md`, seguindo rigorosamente o padrão de diretório, nomenclatura e seções dos prompts existentes no repositório e deixando explícita a fronteira exclusiva de `ErpPreferenceDataGrid` e consumidores atuais?

## Answer

O prompt autocontido foi publicado em [modules/erp/grids/01-speckit-prompt.md](../../../modules/erp/grids/01-speckit-prompt.md), seguindo o padrão dos demais módulos: título Prompt para /speckit.specify, comando em bloco textual e seções de limite, investigação Laravel obrigatória, evidências confirmadas, decisões obrigatórias, critérios de aceite, matriz de testes, rollout/observabilidade/documentação, saída esperada e fora de escopo.

O conteúdo consolida todas as resoluções do mapa, inclui os contratos e mensagens literais necessários para não depender do histórico desta conversa e delimita explicitamente ErpPreferenceDataGrid e consumidores atuais. O prompt manda o Cursor apenas especificar, investigar o checkout Laravel e registrar divergências; não autoriza implementação nem investigação Delphi.

A validação final verifica estrutura, fechamento do bloco textual, presença das decisões críticas e git diff --check. Nenhum ticket adicional surgiu e não resta névoa no mapa.
