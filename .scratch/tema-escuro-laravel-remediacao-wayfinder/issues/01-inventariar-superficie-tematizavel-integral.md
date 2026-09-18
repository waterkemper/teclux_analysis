# Inventariar a superfície tematizável integral

Type: task
Status: resolved

## Question

Quais arquivos, rotas, componentes compartilhados e famílias de páginas compõem toda a interface Laravel tematizável fora de relatórios, e onde permanecem cores físicas, contrastes indevidos ou ilhas claras?

Produzir inventário reproduzível de `backend/resources` e dos consumidores relevantes, separando shell/layout, primitives, cadastros, consultas, operações, grids, modais, lookups, estados, autenticação, dashboard e exceções legítimas. Excluir explicitamente toda família de relatórios, impressão, PDF e documentos. Registrar contagens por padrão e por seam, cobertura atual do commit `2e078019f`, arquivos nunca migrados e contradições entre `tasks.md`, `inventory-colors.md`, testes e capturas.

## Answer

O inventário reproduzível foi registrado em [Inventário da superfície tematizável integral](../artifacts/01-inventario-superficie-tematizavel.md).

Fora de relatórios, a superfície contém 2.048 arquivos-fonte e 159 componentes Inertia únicos. Foram encontrados 12.994 candidatos de cor em 758 arquivos: 9.074 utilitários físicos, 3.316 usos dos aliases físicos `teclux-*` e 604 literais. O commit `2e078019f` tocou somente 28 dos 758 arquivos candidatos; 730 arquivos e 11.916 candidatos ficaram fora da migração.

A concentração confirma a ordem correta para o prompt: seams compartilhados primeiro (`Button`, `Input`, `AppLayout`, lookups, `ErpCadastroShell`, barras, filtros, grids e dialogs), depois famílias consumidoras. `Pages/Cadastros/Estoque` concentra 2.808 candidatos, seguido por componentes compartilhados, Vendas, Marketplaces, Admin, Interlojas, Contas a Pagar e demais famílias.

O guardrail atual não representa o escopo: cobre 14 arquivos e quatro padrões. O smoke atual também não renderiza telas nem mede contraste. Welcome, protótipos, imagens, SVGs, swatches e cores operacionais de paridade ficaram como decisão explícita, sem serem liberados ou convertidos automaticamente. Relatórios, impressão e PDF permanecem excluídos conforme decisão do usuário.
