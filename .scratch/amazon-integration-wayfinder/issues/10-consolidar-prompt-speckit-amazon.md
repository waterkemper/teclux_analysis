# Consolidar o prompt SpecKit da integração Amazon

Type: task
Status: resolved
Blocked by: 09

## Question

Como consolidar as decisões de conexão de conta (03), categorias (04), produtos/catálogo (05), preço/estoque (06), orquestração/rate limit (07), família pai/filho (11), lacunas/riscos (08) e critérios de aceite/testes (09) num prompt autocontido para `/speckit.specify`, publicado em `modules/marketplace/amazon-integration/01-speckit-prompt.md`, adaptando o formato já usado nos demais prompts deste repositório (sem seção de evidência Delphi, já que este esforço é 100% Laravel-nativo) — com uma seção de "Evidência Laravel/API Amazon confirmada" no lugar?

## Answer

Consolidado em [`modules/marketplace/amazon-integration/01-speckit-prompt.md`](../../../modules/marketplace/amazon-integration/01-speckit-prompt.md), adaptando o formato dos demais prompts do repositório (sem seção de evidência Delphi — substituída por "Evidência Laravel/API Amazon confirmada", com fontes primárias da pesquisa SP-API e do checkout Laravel). Cobre conexão de conta por Filial, vínculo por product type, checagem proativa de restrição, preço com dedução de taxa de referral, família pai/filho nativa (estendendo a spec 202) e rate limit por operação. Declara pedidos/Ads/FBA fora de escopo e registra as DÚVIDAs de categorias gated/GTIN/Brand Registry como pendências de validação com conta real, não bloqueios.

Com este ticket, o mapa está concluído — o prompt SpecKit da integração Amazon está publicado e pronto para o Cursor.
