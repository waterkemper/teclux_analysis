# Prompt para `/speckit.specify` — Barra de operações recolhível

```text
/speckit.specify

Crie a especificação funcional e técnica para corrigir a experiência da barra de operações nas telas Laravel do ERP tecLUX.

## Problema

Nas telas que usam o shell compartilhado, a barra de operações completa fica sticky no topo no início da página. Depois que o usuário rola o `#main-content`, o shell troca essa barra por um rail vertical fixo no lado direito da viewport. Em várias situações esse rail fica por cima de campos, grids, mensagens, botões locais e conteúdo operacional, dificultando leitura e interação.

A especificação deve introduzir uma opção explícita para recolher/esconder o rail e reexibi-lo sob demanda, mantendo as operações disponíveis, sem alterar sua semântica de negócio, autorização, atalhos ou efeitos de backend.

Não implemente a solução durante `/speckit.specify`. Produza somente a especificação, decisões técnicas, contratos, critérios de aceite e plano de testes.

## Evidências confirmadas no Laravel atual

Analise os arquivos atuais antes de propor mudanças:

- `laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroShell.tsx` calcula o layout `full`/`rail` a partir de `useMainScrollPast`, reserva a altura da faixa e renderiza a barra completa sticky ou o rail.
- `laravel/backend/resources/js/Components/erp/cadastro/useMainScrollPast.ts` observa o scroll de `#main-content`, usa histerese e `requestAnimationFrame`, e determina quando o rail compacto é ativado.
- `laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroCommandBar.tsx` possui os layouts `full` e `rail`; no rail usa `position: fixed`, `right-*`, `top-1/2`, `z-40`, ícones, atalhos e `trailingActions`.
- `laravel/backend/resources/js/Components/erp/consulta/ErpConsultaOperationBar.tsx` possui a mesma ideia para consultas, com ações genéricas, estado busy, variantes primary/secondary/danger e rail fixo.
- `laravel/backend/resources/js/Layouts/AppLayout.tsx` define `#main-content` como o scroll container vertical principal.
- `laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroCommandBar.test.tsx` cobre apenas parte do layout completo e do botão Atualizar; não assuma que há cobertura do ciclo scroll → rail → recolhido.

Baseline da auditoria inicial, a ser recalculado e documentado na especificação:

- aproximadamente 101 arquivos consumidores do `ErpCadastroShell`, excluindo testes e a própria definição;
- aproximadamente 38 consumidores diretos do `ErpConsultaOperationBar`, excluindo testes e a própria definição;
- dezenas de consumidores de `ErpCadastroCommandBar`, incluindo wrappers de domínio.

O inventário final deve ser reproduzível por busca no código e deve separar definições, testes, consumidores diretos e wrappers.

## Superfície a inventariar

Audite todos os arquivos TypeScript/TSX sob `laravel/backend/resources/js`, incluindo:

1. consumidores de `ErpCadastroShell`;
2. consumidores de `ErpCadastroCommandBar`;
3. consumidores de `ErpConsultaOperationBar`;
4. componentes que recebem `layout` e repassam a uma barra própria;
5. ocorrências de rail/fixed/right/top/z-index que possam reproduzir o mesmo problema sem usar os componentes compartilhados;
6. telas que usam `enableCompactRail={false}`, `compactRailScrollPx`, `commandBarWrapperClassName` ou `trailingActions`;
7. testes de comportamento, responsividade, atalhos, busy/loading, modais e acessibilidade.

Inclua explicitamente como casos de risco, sem limitar o inventário a eles:

- `Pages/Entregas/Romaneios/Cadastro.tsx` e `RomaneioCommandBar.tsx`, que adicionam a operação Liberar/Reter entrega;
- `Pages/Interlojas/RequisicaoParaExposicao/Cadastro.tsx` e `RequisicaoExposicaoCommandBar.tsx`, que renomeiam a operação de exclusão para Cancelar requisição;
- `Pages/Vendas/FichaFinanceira/Index.tsx` e `Components/erp/vendas/fichaFinanceira/FichaFinanceiraToolbar.tsx`, que possuem ações complementares além da barra genérica;
- `Pages/Vendas/Orcamentos/Cadastro.tsx` e `OrcamentoCommandBar.tsx`, com ações contextuais e anexos/buscas;
- consultas e relatórios com `ErpConsultaOperationBar`, operação longa, Cancelar, exportação ou tela cheia;
- qualquer tela que tenha grid, modal, painel flutuante, foco em campo ou scroll interno.

Para cada consumidor, informe: componente usado, layout, ações visíveis, atalhos, `trailingActions`, scroll container, overlays, autorização/disabled/busy, teste existente, necessidade de adaptação local e classificação da evidência (`CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG ATUAL` ou `DECISÃO NOVA`).

## Alternativas que a especificação deve comparar

Compare pelo menos estas opções em profundidade, com impacto de layout, acessibilidade, manutenção e regressão:

### A. Manter somente a barra sticky no topo

Remove o rail lateral e mantém as operações sempre no topo. É simples e elimina a sobreposição, mas obriga o usuário a voltar ao topo para operar em formulários longos e pode piorar fluxos de conferência/consulta.

### B. Rail expandível com estado recolhido — recomendada

Depois do scroll, o shell mostra por padrão somente um handle estreito e acessível na borda direita. O usuário pode expandir o rail para executar uma operação e recolhê-lo novamente. O rail expandido continua temporário e não deve ser considerado uma reserva de espaço para os campos.

Esta é a recomendação inicial porque preserva a operação próxima do conteúdo, reduz a obstrução no estado normal e concentra o comportamento no seam compartilhado. Confirme a recomendação contra o inventário real.

### C. Reservar uma coluna lateral no conteúdo

O shell reduz a largura útil e reserva espaço permanente para a barra. Elimina sobreposição, mas muda a geometria de todos os grids/formulários, pode introduzir scroll horizontal e não é adequado como default sem medir os consumidores.

### D. Rail overlay sempre expandido com botão de fechar

Mantém o comportamento atual e adiciona fechar/reabrir. É uma mudança menor, mas deixa a primeira entrada ainda obstruindo o conteúdo e pode continuar problemática em telas estreitas.

A especificação deve declarar a alternativa escolhida e por que as outras não são o default. Não implemente combinações sem explicitar o contrato por breakpoint.

## Contrato funcional obrigatório

Defina uma máquina de estados ou tabela equivalente, no mínimo com:

- `full_top`: barra completa sticky no topo enquanto o scroll está no início;
- `rail_collapsed`: após o limiar de scroll, somente o handle de reexibição fica disponível;
- `rail_expanded`: rail de operações visível sob demanda;
- `disabled_or_busy`: os controles respeitam os estados existentes sem serem removidos silenciosamente;
- `overlay_suppressed`: rail/handle não compete com modal, diálogo ou overlay que deva receber foco.

Defina claramente:

1. quando a transição `full_top → rail_collapsed` ocorre;
2. se a entrada no rail começa recolhida ou preserva a última escolha;
3. como expandir, recolher e reabrir;
4. o que acontece ao voltar ao topo;
5. se a preferência é apenas local ao componente, por tela, por sessão ou persistida; não crie configuração de servidor sem necessidade comprovada;
6. como o estado é invalidado na navegação, unmount, logout e troca de tela;
7. como `trailingActions` e ações customizadas participam do mesmo estado, sem ficarem presas na barra antiga;
8. como manter os atalhos F3/F6/F7/F8/F9/F10/etc. mesmo com o rail recolhido;
9. como preservar `disabled`, `saving`, `processing`, `hideRefresh`, `onBack`, autorização e tooltips/labels atuais;
10. como impedir que o handle expandido ou recolhido cubra um campo essencial, botão de grid, mensagem, popup ou região de foco.

O botão de reexibição deve ter nome acessível explícito, estado `aria-expanded`, relação `aria-controls` quando houver painel identificável e tooltip visível para mouse/teclado. Não dependa apenas de cor, ícone ou hover.

## Responsividade e interação

Defina o comportamento para desktop, tablet, viewport estreita, zoom alto e orientação móvel. A recomendação inicial é evitar rail vertical overlay em telas pequenas e usar a barra horizontal sticky, uma faixa recolhida no topo ou outro padrão que não cubra campos; confirme com o inventário e com os testes responsivos existentes.

Defina também:

- ordem de tabulação e foco ao expandir/recolher;
- foco retornando ao handle sem saltar o usuário para o topo;
- Escape, click-outside e foco fora do painel, se o modelo escolhido usar painel overlay;
- `prefers-reduced-motion` e ausência de animação obrigatória;
- contraste, tamanho mínimo de alvo e leitura dos atalhos;
- interação com modais, menus, toasts, popovers, fullscreen e z-index;
- comportamento em nested scroll e quando `#main-content` não existe durante montagem/teste;
- não impedir seleção, edição, arraste, resize ou navegação dos grids.

## Interface compartilhada e seam

Prefira um módulo profundo no seam de `ErpCadastroShell`/barra, com uma interface pequena e explícita. A mudança deve evitar props duplicadas e lógica de recolhimento espalhada por dezenas de páginas.

Avalie se:

- `ErpCadastroShell` deve ser o dono do estado de visibilidade e entregar `layout`/contexto para a barra;
- `ErpCadastroCommandBar` e `ErpConsultaOperationBar` devem compartilhar um submódulo visual para handle, painel, foco e acessibilidade;
- `ErpCadastroCommandBar` deve continuar aceitando `trailingActions` sem exigir adaptação em cada tela;
- consumidores especiais precisam apenas repassar uma prop/contrato ou realmente divergem;
- o tipo atual `ErpCadastroCommandBarLayout = 'full' | 'rail'` precisa ser ampliado, e como evitar quebrar wrappers existentes;
- `enableCompactRail={false}` continua significando sem transformação lateral e permanece compatível;
- a solução deve ser testável através da interface pública do shell e das barras, não por refs ou nomes de state privados.

Não altere a semântica das operações, chamadas HTTP, permissões, atalhos ou contratos de negócio para resolver um problema visual.

## Testes e critérios de aceite

Especifique testes que atravessem a interface pública e observem resultados externos:

1. no topo, a barra completa continua igual;
2. após o limiar de scroll, o estado padrão não encobre campos nem grids;
3. o usuário consegue expandir o rail e executar cada ação exatamente como antes;
4. recolher e reabrir preservam a ação, label, tooltip, disabled/busy e autorização;
5. voltar ao topo restaura o contrato definido sem flicker ou mudança de `scrollHeight` inesperada;
6. atalhos continuam funcionando com rail recolhido, expandido e em operação busy;
7. nenhuma ação de `trailingActions` some, duplica ou permanece fora do painel;
8. telas com ações danger/primary, Cancelar, Imprimir, F10, tela cheia e operação longa continuam acessíveis;
9. modais/popovers recebem foco e não ficam atrás do rail/handle;
10. teclado e leitor de tela anunciam o estado e permitem operar sem mouse;
11. viewport móvel/tablet não cobre inputs nem cria overflow horizontal indevido;
12. `enableCompactRail={false}` continua sem rail lateral;
13. a histerese de `useMainScrollPast` continua evitando oscilação;
14. respostas assíncronas e re-render não resetam o estado de modo surpreendente;
15. consumidores representativos de cadastro simples, cadastro longo, consulta/grid, relatório, operação longa, modal e custom toolbar passam em smoke visual e funcional;
16. uma busca automatizada confirma que não ficou outro rail equivalente sem contrato ou justificativa.

Inclua uma matriz de testes por componente/representante e explique quais dezenas de telas são cobertas por composição do seam compartilhado. Não exija snapshot frágil de classes Tailwind como única prova.

## Entregáveis esperados da especificação

Antes de decompor tarefas, entregue:

- diagnóstico do problema e mapa dos consumidores;
- comparação das alternativas e decisão recomendada;
- máquina de estados e transições;
- contrato da interface/seam compartilhado;
- comportamento desktop/mobile/acessível;
- inventário de exceções e plano de migração;
- matriz de testes e critérios de aceite;
- riscos, dúvidas e decisões novas com evidência;
- fora de escopo explícito.

## Fora de escopo

- implementar código, testes, CSS ou alterar arquivos;
- redesenhar o AppLayout, grids ou formulários;
- alterar regras de negócio, endpoints, permissões, atalhos e contratos de gravação/pesquisa/exclusão;
- remover operações para “simplificar” o rail;
- criar persistência de preferência no backend sem decisão explícita;
- tratar apenas uma tela como correção suficiente;
- reproduzir limitações visuais do Delphi.
```
