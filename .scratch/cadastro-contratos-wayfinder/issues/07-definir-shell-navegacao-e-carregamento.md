Type: prototype
Status: resolved
Blocked by: 03, 06

## Question

Qual shell de interface Laravel permite localizar, abrir e editar Contratos grandes sem reproduzir as limitações do form Delphi, preservando atalhos e sinais operacionais relevantes e reutilizando Consulta de Contratos, grids, modais e componentes já existentes?

Validar estrutura de abas/seções, carregamento progressivo, barra de operações, estados de leitura/gravação e apresentação da situação; não desenhar ainda o conteúdo detalhado de cada domínio interno.

## Answer

- `DECISÃO NOVA` — A alternativa A do [protótipo](../07-shell-prototype.html), com abas horizontais, foi validada pelo usuário em 15/07/2026.
- `DECISÃO NOVA` — O shell terá comandos e resumo persistentes, abas horizontais e conteúdo em largura total; não terá navegação ou painel operacional lateral permanente.
- `DECISÃO NOVA` — Áreas: Geral, Cliente, Produtos, Serviços quando parametrizado, Pagamentos, Entrega, Relacionamento e Documentos fiscais. Contatos, Atendimentos e Questionários ficam em Relacionamento.
- `DECISÃO NOVA` — Produtos abre inicialmente em contrato existente ou originado de orçamento; contrato novo sem Cliente abre em Geral.
- `DECISÃO NOVA` — Comandos primários: Novo, Gravar F8, ação F6, Localizar F9 e transição contextual F11. F8 não repetirá o significado Delphi de Copiar.
- `DECISÃO NOVA` — Situação, alterações não gravadas, somente leitura, gravação, conflito de revision e falha parcial serão estados explícitos.
- `DECISÃO NOVA` — F9 reutiliza a Consulta em modo de seleção. A carga inicial traz núcleo, resumo, capabilities, revision e área inicial; outras abas carregam na primeira ativação e mantêm cache por contrato/revision.
- `DECISÃO NOVA` — Trocar de aba não grava. Falha tardia fica isolada; erro de validação marca a aba; aba inaplicável não é renderizada e aba temporariamente indisponível permanece explicada.
- `CONFIRMADO` — Reaproveita ErpCadastroCommandBar, ErpCadastroTabBar e componentes do detalhe da Consulta. Parcelas já usam carregamento tardio em ConsultaContratosDetalheTabs.tsx.
- `CONFIRMADO` — O Delphi possui sete abas principais no DFM (linhas 2181, 5703, 7487, 8284, 10399, 11404 e 11913) e comandos/atalhos no PAS (linhas 913-930, 2785-2812 e 3612-3618).

Esta fatia comporta `$to-spec` próprio para o shell, preferencialmente junto do núcleo. O conteúdo interno permanece nas fatias funcionais.
