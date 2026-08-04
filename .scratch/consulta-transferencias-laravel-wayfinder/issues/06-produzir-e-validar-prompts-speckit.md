# Produzir e validar os prompts SpecKit da Consulta de Transferências

Type: task
Status: resolved
Blocked by: 05

## Question

Com o fatiamento decidido, produzir em `modules/interlojas/consulta-transferencias/` os prompts autoritativos e verificar rastreabilidade de cada filtro, SQL, parâmetro, autorização, coluna, operação, atalho, padrão Laravel e cenário de teste até a evidência ou decisão correspondente.

## Comments

## Answer

Foram produzidos e validados:

- [Fundação, acesso e filtros](../../../modules/interlojas/consulta-transferencias/01-speckit-prompt-fundacao-acesso-filtros.md);
- [Consulta, grid e exportação](../../../modules/interlojas/consulta-transferencias/02-speckit-prompt-consulta-grid-exportacao.md).

O primeiro prompt cobre migration/capability/menu, filial ativa, escopo de `usuariosfiliais` para ambos os papéis, os seis parâmetros literais, filtros, período reativo de 180 dias, validações server-side, composição Inertia e Gerar/F6. O segundo cobre SQL parametrizado e set-based, projeção completa, 32 colunas, paginação/ordenação server-side com padrão de 200 registros, `ErpPreferenceDataGrid`, preferências, Observações, estados e exportação integral autorizada.

A validação automática confirmou presença dos filtros, parâmetros, acesso, F6, paginação 200, grid e exportação; confirmou exatamente 32 itens na lista de colunas, pares de fences Markdown e `git diff --check` sem erros. Cada prompt manda inspecionar o Laravel atual, trata as pesquisas como evidência Delphi autoritativa, separa critérios de aceite/matriz de testes e proíbe implementação durante `/speckit.specify`.
