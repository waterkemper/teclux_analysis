# Wayfinder — Remediação integral do tema escuro Laravel

Label: wayfinder:map

## Destination

Produzir um prompt canônico e autocontido para executar no `/speckit.specify`, orientado à especificação da remediação do tema escuro em toda a interface Laravel, exceto relatórios, até que as telas tematizáveis atendam ao contrato semântico e ao contraste WCAG 2.2 AA sem criar implementações paralelas por tema.

O prompt deve autorizar mudanças na camada visual (`Pages`, `Components`, `Layouts`, CSS), testes visuais e guardrails, mas preservar backend, banco, regras de negócio, permissões, atalhos, contratos HTTP e semântica operacional.

## Notes

- Continuação corretiva do mapa concluído [Tema escuro na plataforma Laravel](../tema-escuro-laravel-wayfinder/map.md), sem reescrever suas decisões históricas.
- Evidência inicial obrigatória: [Auditar implementação e contraste pós-entrega](../tema-escuro-laravel-wayfinder/issues/07-auditar-implementacao-e-contraste-pos-entrega.md) e as capturas em `../tema-escuro-laravel-wayfinder/images/`.
- Escopo positivo: toda superfície interativa renderizada pelo frontend Laravel, incluindo autenticação, dashboard, hubs, cadastros, consultas, operações, modais, drawers, lookups, grids, toasts, estados e componentes compartilhados.
- Escopo negativo confirmado pelo usuário: relatórios por completo — telas de filtro/consulta em famílias `Relatorios`, visualizações, impressão, PDF e CSS de relatório. Manter em allowlist explícita e não alterar.
- “Sistema todo” não inclui backend nem mudança funcional; significa a interface Laravel tematizável fora da exclusão de relatórios.
- Corrigir seams compartilhados antes de páginas consumidoras. Não criar branches condicionais Claro/Escuro nem remapear globalmente cores físicas.
- Claro e as três paletas escuras existentes devem continuar usando a mesma árvore de componentes e os tokens `--erp-*` definidos pelo ADR 491.
- Nenhuma tela pode ser declarada migrada por herança presumida: exigir inventário, captura real, contraste, estados interativos e prova reproduzível.
- O artefato final esperado é `modules/shared/tema-escuro-laravel/02-speckit-prompt-remediacao-integral.md`, seguindo o padrão do `01-speckit-prompt.md`: título, comando `/speckit.specify` e instrução autocontida.
- O `/speckit.specify` deve produzir a especificação, decisões técnicas, critérios de aceite e plano de testes; não deve implementar as correções no Laravel.
- Este mapa produz o prompt e as decisões que o sustentam; não executa o SpecKit nem implementa as correções.

## Decisions so far

<!-- Uma linha por ticket resolvido. Tickets abertos ficam em issues/. -->

- [Inventariar a superfície tematizável integral](issues/01-inventariar-superficie-tematizavel-integral.md) — fora de relatórios há 2.048 arquivos, 159 superfícies Inertia e 12.994 candidatos em 758 arquivos; 730 arquivos candidatos não foram tocados pelo commit, exigindo correção por seams e famílias com inventário verificável.
- [Decidir estratégia de correção dos seams compartilhados](issues/02-decidir-estrategia-de-correcao-dos-seams.md) — corrigir tokens, estruturas, primitives e seams em profundidade antes das páginas, bloquear sobrescritas físicas e exigir validação dos estados, dos consumidores, do tema claro e das três paletas escuras.
- [Decidir lotes e critérios por família de interface](issues/03-decidir-lotes-e-criterios-por-familia.md) — usar lote-base e gate-piloto antes de nove famílias consumidoras, com manifesto integral, validação das quatro aparências, gate sem dívida transferida e revalidação quando um seam compartilhado mudar.
- [Definir guardrail e matriz visual real](issues/04-definir-guardrail-e-matriz-visual-real.md) — combinar scan estático autodiscoverável e allowlist fechada com Puppeteer sobre rotas reais, quatro aparências, dois viewports, contraste computado e evidências versionadas que não possam ser aprovadas automaticamente.
- [Decidir exceções não relacionadas a relatórios](issues/06-decidir-excecoes-nao-relacionadas-a-relatorios.md) — tematizar a rota Welcome e todo chrome, limitando exceções a scaffold órfão, protótipos locais isolados, identidade/fotos, séries centrais de gráficos e amostras reais de cor ou TColor com fallback textual e allowlist específica.
- [Produzir prompt canônico de remediação para o /speckit.specify](issues/05-produzir-prompt-canonico-para-cursor.md) — consolidado em `modules/shared/tema-escuro-laravel/02-speckit-prompt-remediacao-integral.md`, com escopo integral fora de relatórios, execução por seams e famílias, guardrails, matriz visual real e gates contra conclusão parcial.

## Not yet specified

<!-- Nenhuma decisão restante: todos os tickets do mapa foram resolvidos. -->

## Out of scope

- Alterar telas de relatório, filtros próprios de relatório, previews, impressão, PDF, recibos, documentos gerados ou CSS de relatório.
- Alterar backend, banco, regras de negócio, permissões, atalhos, contratos HTTP ou semântica dos estados operacionais.
- Redesenhar a identidade visual, remover o tema claro ou criar versões duplicadas de páginas/componentes.
- Executar o `/speckit.specify` ou implementar as correções durante o Wayfinder; essas etapas ocorrerão depois, a partir do prompt final.
