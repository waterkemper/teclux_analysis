# Definir interface Laravel, grids, modais e operações

Type: grilling
Status: resolved
Blocked by: 01, 04, 05, 06, 07

## Answer

As decisões de interface foram confirmadas em entrevista HITL. A tela permanece uma consulta/operação com paridade funcional Delphi e composição pelos padrões Laravel.

- **Shell:** usar `AppLayout`, breadcrumb `Interlojas → Confirmação por Romaneios` e `ErpConsultaOperationBar`; não usar `ErpCadastroShell` nem campos de chave primária/situação de cadastro.
- **Filtros:** preservar os filtros funcionais Delphi; usar radio buttons em escolhas mutuamente exclusivas, período por datas, `NfeAccessKeyInput` para chave NF-e e pesquisas F9 pelo modal padrão. Filtros são revalidados no backend.
- **Grids:** manter grid principal de Romaneios e composição de Produtos/Documentos, Volumes e Conferência conforme operação; usar catálogos próprios, exportação, ordenação allowlist e personalização Laravel. A F6 não terá paginação.
- **Seleção e detalhes:** seleção envia IDs canônicos; detalhes são carregados em lote, sem query por linha, `AfterScroll` ou N+1.
- **Operações:** Gerar/F6, Cancelar durante a F6, Confirmar/F5, seleção Ctrl+Espaço, localizar por Enter e F9 modal quando aplicável; Conferir Produtos, Conferir Volumes e Visualizar Conferência são ações distintas. Cada ação usa ícone, tooltip, `aria-label`, estado de processamento e capability própria.
- **Cancelamento e feedback:** Cancelar aparece antes do primeiro `await`, cancela a sessão PostgreSQL real e preserva o último resultado válido; loading, vazio, erro, conflito e resultado por Romaneio são estados explícitos, sem depender apenas de cor.
- **Confirmação:** toda operação mutável exige autorização/capability, confirmação visual quando aplicável, idempotência e resultado por unidade atômica; atalhos não podem conflitar com o shell.
- **NF-e:** a máscara, normalização, validação e apresentação usam exclusivamente `NfeAccessKey`, `NfeAccessKeyValid`, `NfeAccessKeyInput` e `NfeAccessKeyText`; não criar regra privada.
- **Exportação:** reexecuta no servidor a query direta com filtros, ordenação e Filial congelados; nunca exporta linhas arbitrárias recebidas do browser.

Nenhum componente, rota, query ou módulo foi implementado nesta decisão.

## Question

Como traduzir a tela para o padrão Laravel: breadcrumb, filtros, radio buttons, modal F9, abas ou composição equivalente, grids de romaneios/produtos, máscara NF-e compartilhada, seleção, estados, feedback, acessibilidade, exportação, personalização, ícones e atalhos? Definir contratos de F6 Gerar/Cancelar, F5 Confirmar e conferências, além de distinguir consulta de cadastro; se houver cadastro, aplicar o padrão de chave primária e situação do Cadastro de Requisições.

Não copiar limitações de layout ou colorização sem legenda do Delphi. Toda operação mutável deve declarar capability, confirmação, idempotência e efeito transacional.
