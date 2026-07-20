# Visualizador compartilhado de Fotos de Produto

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Delphi oferece um botão ao lado de diversos grids de Produtos que abre uma janela compartilhada com foto principal e miniaturas. Embora reutilizado em Orçamentos, Contratos, consultas de Estoque e outros módulos, esse fluxo é limitado: a descoberta depende de um botão separado, a janela não aproveita o contexto e a navegação é restrita.

O Laravel já supera parte dessa limitação ao exibir miniaturas diretamente em vários grids, mas o comportamento está fragmentado. Alguns consumidores abrem apenas a primeira imagem em um modal simples, enquanto a Conferência de Produtos usa uma galeria mais completa. Os componentes atuais não oferecem zoom integrado nem navegação entre os Produtos do grid. A autorização do endpoint genérico também está acoplada aos módulos de Produtos e Listas Padrão, embora fotos já apareçam em contextos de Vendas e Marketplace.

O Usuário precisa de uma experiência única, previsível e reutilizável para consultar todas as fotos do Produto selecionado e percorrer os demais Produtos com fotos no contexto atual, sem perder espaço permanente do grid e sem criar um gerenciador de fotos.

## Solution

Criar uma galeria modal compartilhada para todos os grids Laravel que exibem fotos de Produto. A miniatura na coluna `Foto` será o ponto único de entrada: o clique selecionará a linha e abrirá todas as fotos daquele Produto. Botões separados de visualização serão removidos quando se tornarem redundantes.

O modal mostrará foto principal, miniaturas, contador, código e descrição, zoom e ajuste à tela. Haverá controles claramente distintos para navegar entre fotos do Produto atual e entre Produtos do contexto. A sequência de Produtos seguirá a ordenação e os filtros atuais do grid, eliminará repetições e excluirá Produtos sem fotos.

A galeria carregará as fotos sob demanda, antecipando em segundo plano apenas os Produtos vizinhos. O componente receberá um contexto explícito para autorização, navegação e apresentação, permitindo sua adoção integral em Orçamentos, Contratos, Estoque, Conferências, Vendas e Marketplace sem depender de uma policy alheia.

## User Stories

1. As a Usuário de Orçamentos, I want to clicar na miniatura de uma linha, so that I can visualizar todas as fotos do Produto sem usar um botão separado.
2. As a Usuário de Contratos, I want the same visualizador used in Orçamentos, so that the interaction is predictable across Vendas.
3. As a Usuário de Estoque, I want to inspect Product photos from the current grid, so that I can identify the item without leaving the consultation.
4. As a Usuário de Conferência de Produtos, I want the gallery to use the same shared visual behavior, so that photo inspection is consistent.
5. As a Usuário de Marketplace, I want existing photo previews to adopt the common gallery, so that multiple photos and zoom are available.
6. As a Usuário, I want clicking a thumbnail to select its grid row before opening, so that the context remains clear after closing.
7. As a Usuário, I want photo-cell interaction not to trigger row editing, so that opening a gallery has no accidental side effect.
8. As a Usuário, I want to see the Product code and description in the modal, so that I know which item I am inspecting.
9. As a Usuário, I want to see one large principal photo, so that product details are legible.
10. As a Usuário, I want to see thumbnails for every photo of the current Product, so that I can choose an image directly.
11. As a Usuário, I want previous/next controls for photos, so that I can browse without targeting small thumbnails.
12. As a Usuário, I want a counter such as “2 de 5”, so that I know my position in the gallery.
13. As a Usuário, I want to zoom in and out, so that I can inspect small details.
14. As a Usuário, I want to restore fit-to-screen, so that I can quickly return from zoomed inspection.
15. As a mouse user, I want wheel-assisted zoom, so that inspection is efficient.
16. As a touch user, I want controls suitable for small screens, so that the gallery remains usable on mobile devices.
17. As a keyboard user, I want to close with Escape, so that I can return to the grid quickly.
18. As a keyboard user, I want navigable controls and predictable focus, so that I can operate without a mouse.
19. As a screen-reader user, I want meaningful dialog, image and control labels, so that the gallery is understandable.
20. As a Usuário, I want a separate “Produto anterior” action, so that I do not confuse Product navigation with photo navigation.
21. As a Usuário, I want a separate “Próximo produto” action, so that I can inspect the document sequentially.
22. As a Usuário, I want Product navigation to follow the grid's current ordering, so that modal and grid sequences match.
23. As a Usuário, I want Product navigation to respect active filters, so that hidden rows do not unexpectedly appear.
24. As a Usuário, I want repeated occurrences of the same Product skipped, so that I do not revisit the same gallery.
25. As a Usuário, I want Products without photos excluded from Product navigation, so that every navigation step shows useful content.
26. As a Usuário, I want unsaved but identified Products included, so that current document edits are represented.
27. As a Usuário, I want the photo column to show the number of available photos, so that I know when a gallery exists.
28. As a Usuário, I want rows without photos to have no photo action, so that empty clicks do not open a useless modal.
29. As a Usuário, I want the current Product loaded on demand, so that opening documents does not download every image.
30. As a Usuário, I want adjacent Product galleries prefetched, so that sequential navigation feels immediate.
31. As a Usuário, I want stale requests ignored when navigating quickly, so that the wrong Product never appears.
32. As a Usuário, I want a loading state, so that I understand the gallery is fetching photos.
33. As a Usuário, I want communication failures distinguished from empty galleries, so that I know when retrying can help.
34. As a Usuário, I want a retry action without closing the modal, so that transient failures are recoverable.
35. As a Usuário, I want a broken individual photo skipped or marked without losing the rest, so that one bad file does not block the gallery.
36. As a Usuário, I want closing the modal to return focus to the opening thumbnail, so that I can resume work in the grid.
37. As a Usuário authorized for the originating context, I want to view photos without an unrelated photo permission, so that module permissions remain coherent.
38. As a security administrator, I want the backend to validate the originating context, so that a generic endpoint does not bypass module access.
39. As a maintainer, I want one modal and one data contract, so that fixes apply to every consumer.
40. As a maintainer, I want existing photo ordering and principal-photo rules preserved, so that the migration does not silently change catalog meaning.
41. As a maintainer, I want every existing Laravel photo grid migrated in the same effort, so that parallel preview implementations do not remain.
42. As a maintainer, I want thin context adapters rather than module names embedded in the gallery, so that future grids can reuse it.
43. As a Usuário, I want the modal to adapt to the viewport, so that neither the image nor navigation controls become inaccessible.
44. As a Usuário, I want no explicit edit, delete, upload or download action, so that the visualizer remains a read-only tool.

## Implementation Decisions

- Build one shared modal gallery and retire the single-image modal where a Product gallery is intended.
- Keep the existing photo service, legacy repository, URL builder, deterministic sort and JSON response as the base, extending their contracts instead of duplicating photo access.
- Preserve ordering by the existing position/name rule and use the first ordered photo as principal.
- Introduce a context-neutral gallery contract containing the active Product, the ordered visible Product candidates, labels, photo metadata and authorization context.
- Derive Product candidates from the grid's current row model after filtering and sorting, not from the original unfiltered dataset.
- Deduplicate candidates by Product identity while preserving first visible occurrence.
- Include only candidates with confirmed photos. Add batch photo metadata, including count and first thumbnail, so eligibility and badges do not require one request per row.
- Allow Product candidates representing unsaved document rows when they already contain a valid Product identity and authorized page context.
- Make the photo cell select the row, stop propagation into editing gestures and open the modal for that Product.
- Display a count badge when a Product has multiple photos; no-photo cells remain non-interactive.
- Keep photo navigation and Product navigation as two explicit state dimensions with different labels and controls.
- Load the active gallery lazily and prefetch only the previous and next eligible Product.
- Key cache by every input that can change the response, including Product, Filial/photo-base context and authorization context; do not use a process-global Product-only key.
- Cancel obsolete requests where possible and ignore responses that no longer match the active context.
- Provide explicit loading, retry, empty and partial-image-error states. A failed image must not invalidate other photos.
- Use media-sized images for normal display and the best available source for zoom, with graceful fallback among available variants.
- Implement bounded zoom, zoom controls, fit-to-screen and mouse-wheel support without exposing an explicit download/open-original command.
- Make the modal nearly full-screen on small viewports and centered/bounded on desktop.
- Trap focus while open, restore it to the opening cell, close on Escape and provide accessible names/status announcements.
- Make authorization a registry/capability of the originating context. Existing product/list permissions cannot be the only Gate for Vendas, Estoque and Marketplace consumers.
- The backend must reject unknown/unauthorized contexts and must not accept a client assertion as proof of access.
- Reuse module/page authorization already established for the originating grid; avoid introducing a separate business Permission solely for viewing photos.
- Migrate all current consumers of thumbnail, medium modal, full viewer and photo hook in this effort. A consumer may keep a specialized layout only when it composes the shared gallery primitives rather than reimplementing behavior.
- Remove separate Delphi-style photo buttons from migrated Laravel grids when the photo column supplies the action.
- Preserve the Conferência de Produtos layout where photos are embedded, while ensuring opening its detailed gallery uses the same shared behavior.
- Do not modify photo records, ordering or principal-photo selection through this feature.

## Testing Decisions

- Use HTTP feature tests as the primary seam for photo metadata, ordering, URLs, context authorization, unknown contexts, empty results and batch responses.
- Extend the existing Product Photos controller feature tests as prior art rather than creating a second backend test seam.
- Test the shared modal through externally observable browser/component behavior: opening, row selection, focus, two navigation dimensions, zoom, fit, responsive controls, retry and broken-image handling.
- Test grid-derived Product order after filtering/sorting, stable deduplication, exclusion of no-photo Products and inclusion of unsaved rows.
- Test lazy loading, neighbor prefetch, context-aware caching and cancellation/ignoring of stale responses through request observations rather than internal state assertions.
- Give each migrated consumer a thin integration test proving it supplies the correct context, ordered candidates and opening action. Do not repeat the entire gallery suite per module.
- Keep regression coverage for existing deterministic photo sorting, URL building, Conferência gallery, Orçamento thumbnails, Contrato details and Marketplace previews.
- Verify unauthorized users cannot enumerate photos using another or fabricated context.
- Verify one broken image does not prevent navigation among remaining valid images.
- Verify no explicit photo mutation or download control is rendered.

## Out of Scope

- Uploading, editing, deleting, reordering or selecting the principal photo.
- Explicit download or open-original actions.
- Showing photos from related Products, Characteristics or grade variations automatically.
- Including Products without photos in modal Product navigation.
- Changing the legacy photo storage model or migrating image files.
- Redesigning the business grids beyond the photo column and removal of redundant buttons.
- Implementing changes in this analysis workspace.

## Further Notes

- CONFIRMADO: the Delphi Orçamento button calls the shared image viewer with the current Product; the shared frame loads all rows from `fotosprodutos`, creates thumbnails and displays the first image.
- CONFIRMADO: the same Delphi viewer is reused by multiple modules, so reuse is a migration requirement rather than an Orçamento-only convenience.
- CONFIRMADO: Laravel Orçamentos already render a photo column, but currently open only `foto_media_url` in a single-image modal.
- CONFIRMADO: Laravel already has a full Product photo viewer, a product-photo hook, deterministic sorting, a generic JSON endpoint and reusable thumbnail cells.
- DIVERGENTE: the existing hook caches only by Product id, while photo URLs can depend on Filial/parameters and access context.
- DIVERGENTE: the existing photo Gate recognizes only Product registration or Standard Lists, despite photo components being used by Vendas and Marketplace.
- DIVERGENTE: the current full viewer exposes opening the original image in a new browser tab, while the agreed target has zoom but no explicit download/open-original action.
- DECISÃO NOVA: navigate between Products in the current filtered/sorted grid, skipping duplicates and Products without photos.
- DECISÃO NOVA: adopt the shared solution in all current Laravel consumers in one effort.
