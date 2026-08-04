# Prompt para /speckit.specify — interface, grids e operações

~~~text
/speckit.specify

Crie a especificação funcional e técnica da interface Laravel de Confirmação por Romaneios, consumindo as specs 01–03. A tela é consulta/operação, não Cadastro. Não implemente.

Leia:

- modules/interlojas/confirmacao-por-romaneios/01-speckit-prompt-fundacao-dominio-seguranca.md
- modules/interlojas/confirmacao-por-romaneios/02-speckit-prompt-consulta-f6-cancelavel.md
- modules/interlojas/confirmacao-por-romaneios/03-speckit-prompt-confirmacao-transacional.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-interface-delphi.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md

## Shell e filtros

- Use AppLayout e breadcrumb Interlojas → Confirmação por Romaneios.
- Use ErpConsultaOperationBar, não ErpCadastroShell. Não criar campo de chave primária/situação de cadastro.
- Preserve filtros Delphi. Use radio buttons em escolhas mutuamente exclusivas e campos de data no padrão Laravel.
- Use NfeAccessKey, NfeAccessKeyValid, NfeAccessKeyInput e NfeAccessKeyText; não criar máscara, regex ou DV local.
- Enter nos campos de busca mantém a intenção Delphi; qualquer F9 usa ErpCadastroLookupModal padrão, endpoint próprio, paginação do modal, ordenação allowlist e revalidação de Filial/Permissão.

## Grids e operações

- Grid principal de Romaneios e composição de Produtos/Documentos, Volumes e Conferência conforme operação.
- F6 não tem paginação. Use catálogos próprios, screenKey próprio, exportação, ordenação allowlist, personalização e seleção por IDs canônicos.
- Gerar/F6, Cancelar durante F6, Confirmar/F5, Ctrl+Espaço e Enter devem usar handlers únicos e atalhos sem conflito. Conferir Produtos, Conferir Volumes e Visualizar Conferência são ações distintas.
- Cada botão declara capability, ícone, tooltip, aria-label, disabled/processing, confirmação e efeito transacional.
- Loading, vazio, erro, cancelado, conflito, autorização recusada e resultado por Romaneio são estados explícitos; não depender apenas de cor.
- Exportação reexecuta no servidor o contexto congelado; nunca exportar rows arbitrárias do browser.

Entregue wireflow textual, contrato dos componentes, estados de foco/teclado/modal, acessibilidade, catálogo de colunas e matriz de operações/atalhos/capabilities. Não copie limitações visuais Delphi sem legenda. Não implemente.
~~~

