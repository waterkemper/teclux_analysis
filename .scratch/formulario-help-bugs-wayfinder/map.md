# Mapa: Formulário de Help/envio de bugs — escopo prático para o v1

## Destination

Decidir o escopo prático do formulário de Help / reporte de bugs (barra superior, spec `laravel/specs/161-erp-help-zendesk/spec.md`, já implementado em código) para a primeira versão do ERP tecLUX liberada a usuários reais — o que manter, simplificar, cortar ou adicionar antes do lançamento. O destino é a decisão de escopo em si, não uma reescrita completa da spec original.

## Notes

- Spec de referência já implementada: `laravel/specs/161-erp-help-zendesk/` (spec.md, data-model.md, contracts/, tasks.md). Consultar antes de redescobrir do zero.
- Código: frontend em `laravel/backend/resources/js/Components/erp/help/` (`HelpForm.tsx`, `HelpShellTrigger.tsx`, `useHelpClientContext.ts`, `useHelpScreenshot.ts`); backend em `laravel/backend/app/{Http/Controllers,Http/Requests,Services,Mail}/Support/...`; config em `laravel/backend/config/help.php`.
- Usuários-alvo: funcionários das empresas-cliente operando o ERP internamente (não consumidores finais) — isso pesa contra burocracia de consentimento tipo LGPD pesada e a favor de um formulário enxuto.
- Envio é só por e-mail para `suporte@tecsoft.com.br` (sem API de ticketing obrigatória); isso não muda neste mapa.
- Ao resolver tickets de UI/UX, usar `/prototype` para rascunhos visuais antes de fechar o desenho.

## Decisions so far

- [Confirmar campos existentes mantidos](issues/01-confirmar-campos-existentes-mantidos.md) — Impacto, CC e screenshot automático ficam como estão; nenhuma mudança de escopo nesses três.
- [Simplificar consentimento LGPD](issues/03-simplificar-consentimento-lgpd.md) — 2 checkboxes bloqueantes viram 1 aviso não bloqueante no rodapé; screenshot vira opt-in puro; backend não muda (frontend sempre envia `true`).
- [Guia de descrição + descoberta do botão Help](issues/04-guia-descricao-e-descoberta-botao-help.md) — placeholder com estrutura (fez/esperava/aconteceu) na descrição; botão Help vira pílula que se expande sozinha nos primeiros acessos após o lançamento.

## Not yet specified

_(vazio — a fronteira atual cobre os pontos práticos identificados nesta rodada de grilling; novos pontos podem surgir ao resolver os tickets abertos.)_

## Out of scope

- [Histórico de chamados no app](issues/02-historico-de-chamados-no-app.md) — uma tela "Meus chamados" com status dos pedidos fica fora do v1; único canal permanece e-mail + `reference_code`.
