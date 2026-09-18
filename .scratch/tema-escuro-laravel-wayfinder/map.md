# Wayfinder — Tema escuro na plataforma Laravel

Label: wayfinder:map

## Destination

Produzir uma especificação funcional, visual e técnica, pronta para `/speckit.specify`, para oferecer um modo de interface escuro na plataforma Laravel sem criar uma segunda implementação paralela de cada tela.

O destino deve definir preferência do usuário, contrato de tema, tokens semânticos, migração incremental, acessibilidade, telas especiais, testes e rollout. Não implementar o tema neste mapa.

## Notes

- Domínio: Plataforma Laravel, design system ERP, shell, formulários, grids, modais, relatórios e estados operacionais.
- Consultar `CONTEXT-MAP.md`, `laravel/CONTEXT.md` e ADRs Laravel relevantes antes de fechar termos.
- A base usa Tailwind CSS 4 via `resources/css/app.css` e `@theme`, mas ainda não possui `dark:`/`prefers-color-scheme`/`color-scheme`/`data-theme`.
- `app.css` declara apenas quatro tokens `teclux-*`; grande parte da UI usa diretamente utilitários de `white`, `gray`, `slate`, `stone`, `red`, `amber`, `green` etc.
- Auditoria inicial encontrou aproximadamente 8 mil ocorrências de utilitários de cor em TS/TSX, além de cores definidas em CSS, SVG, gráficos, imagens, relatórios e estados semânticos.
- `resources/views/app.blade.php` ainda não inicializa um tema antes do carregamento do React; qualquer preferência persistida precisa evitar flash de tema incorreto.
- `AppLayout.tsx` já possui precedente de preferência local: `teclux-erp-shell-sidebar-hidden` em `localStorage` e classe no elemento `<html>`.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG ATUAL` ou `DECISÃO NOVA`, sempre com arquivo e evidência.
- A primeira entrega deve ser reversível, observável e compatível com usuários que preferem o tema claro; não introduzir dependência de backend sem necessidade comprovada.

## Decisions so far

<!-- Uma linha por ticket resolvido. Tickets abertos ficam em issues/. -->

- [Auditar superfície visual e tokens existentes](issues/01-auditar-superficie-visual-e-tokens.md) — a UI ERP não possui contrato global de tema; há quatro tokens próprios, um piloto isolado com `dark:` e uma superfície ampla de utilitários hardcoded. O caminho seguro é tokenizar shell/primitives primeiro e manter impressão/documentos fora da herança automática.

- [Decidir modelo de preferência e inicialização do tema](issues/02-decidir-modelo-de-preferencia-e-inicializacao.md) — modos Sistema/Claro/Escuro; Claro como padrão inicial; preferência local versionada em localStorage; data-theme pré-React; Sistema somente quando escolhido; sem backend na primeira entrega.
- [Decidir arquitetura de tokens e migração incremental](issues/03-decidir-arquitetura-de-tokens-e-migracao.md) — tokens semânticos CSS/Tailwind sob data-theme, sem remapeamento global de cores físicas; migração por shell, primitives e famílias de telas; estados, legado, gráficos e documentos tratados explicitamente.
- [Prototipar páginas representativas em tema escuro](issues/04-prototipar-paginas-representativas.md) — protótipo com shell real e componentes críticos; três presets de paleta escura (grafite/turquesa, azul/ciano e grafite/âmbar), com Claro como padrão inicial.
- [Definir acessibilidade, estados e artefatos não temáticos](issues/05-definir-acessibilidade-estados-e-artefatos.md) — WCAG 2.2 AA, foco e teclado previsíveis, feedback assistivo, estados sem dependência exclusiva de cor e separação explícita para imagens, gráficos, SVGs, impressão e documentos.

- [Definir rollout, testes e prompt SpecKit do tema escuro](issues/06-definir-rollout-testes-e-prompt-speckit.md) — prompt canônico criado em modules/shared/tema-escuro-laravel/01-speckit-prompt.md, com rollout reversível, Claro padrão, testes por seam, matriz visual e critérios de tela migrada.
- [Auditar implementação e contraste pós-entrega](issues/07-auditar-implementacao-e-contraste-pos-entrega.md) — a infraestrutura central existe, mas capturas e código confirmam migração visual incompleta, contrastes abaixo de AA, uma família não migrada e guardrails/smoke insuficientes; recomenda-se um Wayfinder separado de remediação.

## Not yet specified

<!-- O caminho até o prompt SpecKit está decidido; a implementação futura parte do artefato compartilhado. -->

## Out of scope

- Implementar código, trocar classes de todas as telas ou alterar o backend neste mapa.
- Redesenhar a identidade visual inteira do tecLUX ou mudar a cor primária sem decisão separada.
- Aplicar filtro global/inversão de cores em imagens, PDFs ou documentos para simular tema escuro.
- Alterar regras de negócio, permissões, atalhos, contratos HTTP ou semântica dos estados operacionais.
- Fazer o tema escuro obrigatório ou remover o tema claro.
