# Definir interface, operações e componentes compartilhados

Type: grilling
Status: resolved
Blocked by: 01, 04, 05, 06, 07

## Question

Como organizar a experiência Laravel do Cadastro de Romaneios — filtros, grids, formulário, operações, relatórios, feedback, ícones, atalhos, acessibilidade e chave NF-e compartilhada — preservando paridade funcional sem copiar a interface Delphi?

## Answer

O Cadastro usa uma página mestre–detalhe com `ErpCadastroShell`, resumo financeiro e grid de Itens. Por decisão do usuário, todas as superfícies auxiliares seguem o padrão de modal Laravel: localização, Item unitário, inclusão múltipla, conferência, justificativa, movimentações, assinatura e impressão.

O padrão de botões/atalhos Laravel prevalece: F3 Novo, **F8 Gravar**, F6 Excluir, F9 Localizar e F7 Imprimir; F10 alterna contextualmente Liberar/Reter. O modal ativo suspende os atalhos da página; F6 significa Gerar/Cancelar apenas no modal de inclusão múltipla. Não manter F5 como alias de gravação.

Grids reutilizam `ErpPreferenceDataGrid`, com catálogo próprio por grade, personalização, ordenação, exportação e acessibilidade. Não há persistência inline: Item abre modal, seleção múltipla aplica rascunhos em lote e conferência grava uma vez com F8. Todas as mutações usam capacidades backend e Comandos de Romaneio.

Entrada/exibição de chave NF-e reutiliza obrigatoriamente `NfeAccessKeyInput`, `NfeAccessKey` e `NfeAccessKeyValid`. Relatórios reutilizam layout/auditoria compartilhados e queries set-based. Feedback cobre validação, conflito de revisão, dirty state, cancelamento neutro e falhas que o Delphi ocultava.

O contrato completo de composição, operações, modais, grids, relatórios, acessibilidade e aceite está em [interface-operacoes-componentes.md](../../../modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md).
