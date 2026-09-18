# Wayfinder — Leiaute mobile da plataforma Laravel

Label: wayfinder:map

## Destination

Produzir uma especificação funcional, visual e técnica, pronta para /speckit.specify, para tornar a plataforma Laravel/ERP utilizável em telas estreitas sem degradar o desktop.

O destino deve definir shell e navegação mobile, barras de operação, filtros, grids com muitas colunas, formulários densos, acessibilidade, breakpoints, testes, rollout e uma estratégia de migração por seams compartilhados.

## Notes

- Domínio: Plataforma Laravel, shell ERP, cadastros, consultas, filtros avançados, grids editáveis e operações com atalhos.
- Consultar CONTEXT-MAP.md, laravel/CONTEXT.md, ADRs de interação ERP e checklists de shell/listas antes de fechar termos.
- AppLayout já possui header, menu lateral desktop, drawer mobile e #main-content como scroll container; o breakpoint atual do menu usa md.
- O código mistura padrões: filtros em toolbar, formulários que empilham por breakpoint, faixas horizontais com overflow-x-auto, tabelas com muitas colunas e componentes com larguras mínimas.
- ConsultaRuleFilterPanel é compartilhado, mas possui abas, regras, lookup e ações cuja densidade mobile precisa ser definida.
- DataGrid já possui navegação por teclado, seleção, resize/reorder, virtualização opcional e área de scroll; ainda é necessário decidir a experiência de muitas colunas em viewport estreita.
- ErpConsultaOperationBar e ErpCadastroCommandBar possuem layouts full/rail; rail lateral overlay não deve ser presumido como adequado para mobile.
- A primeira entrega deve ser incremental, reversível e compatível com o desktop; não criar uma implementação paralela por tela.
- Classificar achados como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG ATUAL ou DECISÃO NOVA, sempre com arquivo e evidência.

## Decisions so far

<!-- Uma linha por ticket resolvido. Tickets abertos ficam em issues/. -->

- 01-auditar-superficies-mobile: AppLayout centraliza shell e scroll principal; rail de operacoes e desktop; ConsultaRuleFilterPanel e DataGrid sao seams prioritarios. O problema central e contrato de prioridade/apresentacao mobile, nao CSS global. Ver issues/01-auditar-superficies-mobile.md.

## Not yet specified

- Como priorizar conteúdo e ações quando filtros, colunas e comandos não cabem simultaneamente.
- Como tratar relatórios, gráficos, anexos, imagens e telas legadas em viewport estreita.
- Quais breakpoints, dispositivos-alvo e estratégia de rollout serão aceitos como baseline.
- Se o prompt final será um único documento ou terá uma fase de fundação seguida de prompts de migração.

## Out of scope

- Alterar regras de negócio, permissões, atalhos, contratos HTTP ou semântica das operações.
- Remover dados, filtros ou colunas sem um contrato explícito de prioridade e acesso alternativo.
- Resolver o problema apenas com zoom, escala global, user-agent sniffing ou overflow horizontal em toda a página.
- Redesenhar a identidade visual ou criar um aplicativo nativo separado.
- Implementar código neste mapa; a execução partirá do prompt SpecKit.
