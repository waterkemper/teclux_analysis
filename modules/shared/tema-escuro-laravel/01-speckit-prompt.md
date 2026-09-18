# Prompt para /speckit.specify — Tema escuro na plataforma Laravel

/speckit.specify

Crie a especificação funcional, visual, técnica e de testes para disponibilizar tema escuro na plataforma Laravel/ERP tecLUX, usando uma única implementação compartilhada de componentes e páginas. A especificação deve ser autocontida e pronta para execução por outra sessão, sem implementar código durante o /speckit.specify.

## Resultado esperado

Defina um contrato implementável para:

- manter Claro como padrão inicial do produto;
- oferecer os modos Sistema, Claro e Escuro;
- oferecer três presets de paleta para o modo Escuro;
- aplicar a preferência sem flash de tema incorreto;
- migrar a interface de forma incremental, sem duplicar páginas;
- preservar acessibilidade, estados operacionais, impressão, PDFs e artefatos legados;
- entregar testes, rollout reversível, critérios de tela migrada e plano de rollback.

## Decisões já tomadas

### Modo e preferência

Os modos são Sistema, Claro e Escuro. Claro é o fallback obrigatório na primeira visita, quando a preferência está ausente, inválida ou não pode ser lida. Sistema só é aplicado quando escolhido explicitamente pelo usuário; nesse modo, a interface acompanha prefers-color-scheme. Claro e Escuro explícitos ignoram mudanças posteriores do sistema operacional.

A preferência é local ao navegador e não exige backend na primeira entrega. Deve sobreviver a navegação Inertia, logout e troca de usuário. Use uma chave versionada, como teclux-erp-theme-preference-v1. O formato pode ser um objeto com mode e palette; aceite com tolerância uma preferência legada escalar contendo somente o modo e complete a paleta com o padrão.

A paleta padrão é Grafite + turquesa ERP. As três paletas disponíveis para o modo Escuro são:

1. Grafite + turquesa ERP;
2. Azul petróleo + ciano;
3. Grafite quente + âmbar.

A paleta é uma preferência visual separada do modo, mas pode ser persistida no mesmo registro local. Todas as paletas usam os mesmos tokens semânticos; não criar três árvores de componentes.

### Inicialização

O estado efetivo deve ser aplicado em document.documentElement.dataset.theme com valor light ou dark antes da montagem do React. O bootstrap no app.blade.php deve ler e validar a preferência, usar Claro como fallback, resolver Sistema por matchMedia somente quando necessário e tolerar falhas de localStorage/matchMedia sem interromper a aplicação.

Depois da montagem, um controlador/provider global próximo da entrada Inertia deve reconciliar a preferência, expor um hook para o shell e ouvir storage para sincronização entre abas. O modo Sistema deve ouvir alterações do MediaQueryList. O valor deve ser atualizado imediatamente na aba atual.

Defina também color-scheme: light no tema Claro e color-scheme: dark no tema Escuro. Não dependa de SSR de usuário ou de props de backend para a primeira pintura.

### Arquitetura visual

Use custom properties CSS semânticas selecionadas por data-theme e exponha-as como cores/utilitários do Tailwind v4. Não use dark: como mecanismo principal e não remapeie globalmente white, black, slate, stone, gray, red ou amber: essas cores físicas hoje misturam fundo, texto, borda, estados, imagens, gráficos e paridade legada.

O contrato mínimo deve separar:

- superfícies de canvas, painel, painel elevado/modal, sutil, controle e invertida;
- conteúdo principal, secundário, auxiliar, invertido, link e disabled;
- bordas padrão, sutil, forte, foco e separador;
- ações primária, hover, pressed, disabled e seleção;
- estados success, warning, danger e info com texto, superfície e borda;
- overlays, scrim, tooltip, popover e busy;
- seleção de linha, zebra, realce e séries de gráfico.

Nomes de tokens devem representar intenção, não cor física. Variantes de opacidade devem ser compatíveis com o consumo do Tailwind e não podem produzir texto ou estados ilegíveis.

## Seams reais que devem ser analisados antes de especificar tarefas

Leia e cite as evidências atuais destes pontos:

- laravel/backend/resources/views/app.blade.php para o bootstrap pré-React;
- laravel/backend/resources/js/app.tsx para a entrada Inertia e o ponto do provider;
- laravel/backend/resources/css/app.css para Tailwind v4, @theme e camada base;
- laravel/backend/resources/js/Layouts/AppLayout.tsx para header, menu lateral, subheader, #main-content, Toaster e preferências locais;
- laravel/backend/resources/js/Components/Button.tsx;
- laravel/backend/resources/js/Components/Input.tsx;
- laravel/backend/resources/js/Components/SelectField.tsx;
- laravel/backend/resources/js/Components/fields/BrNumericAmountField.tsx;
- componentes de lookup, modal, grid, toast, shell e barras de operação;
- CSS de impressão e relatórios sob laravel/backend/resources/css;
- páginas representativas do shell, cadastro denso, consulta/grid, dashboard, estados semânticos e Ficha Financeira.

Classifique achados como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG ATUAL ou DECISÃO NOVA, sempre com arquivo e evidência.

## Escopo funcional

O controle de aparência deve ficar no shell global, em header, menu de usuário ou configurações globais. Deve mostrar:

- modo atual;
- paleta atual quando o modo Escuro estiver ativo;
- opções operáveis por teclado;
- estado selecionado com semântica de radio/radiogroup ou equivalente;
- rótulo textual, não somente ícone;
- atualização imediata e sincronização entre abas.

O Claro deve permanecer utilizável e visualmente suportado. A implementação não pode alterar regras de negócio, permissões, atalhos, contratos HTTP ou semântica dos estados operacionais.

## Acessibilidade obrigatória

Adote WCAG 2.2 nível AA como baseline:

- texto normal com contraste mínimo de 4,5:1;
- texto grande com 3:1;
- controles, bordas significativas e gráficos necessários para compreensão com 3:1;
- foco visível, com contraste suficiente e não encoberto por header, rail, modal ou toast;
- navegação completa por teclado, sem armadilhas;
- modal e drawer com foco preso, Escape para fechar e retorno ao acionador;
- link de salto para o conteúdo preservado;
- nenhum estado comunicado apenas por cor;
- prefers-reduced-motion reduzindo transições e animações não essenciais;
- aria-busy durante carregamento;
- aria-live polite para atualizações normais;
- aria-live assertive somente para erros bloqueantes ou alertas críticos;
- role alert para erros de validação relevantes.

Sucesso, atenção, erro, informação, seleção, disabled e busy usam tokens semânticos nas três paletas. Cores literais de paridade operacional, como legendas da Ficha Financeira, só permanecem quando representam significado de negócio e devem ter fallback textual.

## Artefatos fora da herança automática

Defina claramente:

- SVGs e ícones da interface usando currentColor ou tokens;
- gráficos usando paleta semântica por série, legenda e rótulo além da cor;
- fotos, logos e imagens de produto sem inversão ou filtro global;
- PDF, impressão, recibos e documentos gerados com estilos independentes, normalmente claros;
- overlays, popovers, tooltips e portals adaptando integralmente ao tema ativo;
- telas de protótipo, componentes legados e exceções com documentação explícita.

## Ordem de implementação

Organize a futura implementação em lotes verificáveis:

1. contrato de preferência, bootstrap, provider, color-scheme e tokens base;
2. shell, header, menu, subheader, #main-content, Toaster e barras de operação;
3. primitives Button, Input, Select, campos numéricos, lookup, FormSection, Dialog/Modal, paginação e busy;
4. grids, filtros, consultas e cadastros representativos;
5. feedback semântico, badges, seleção, tabelas, gráficos e SVGs;
6. expansão por famílias de páginas e tratamento explícito de exceções.

Cada lote deve manter Claro funcionando. A migração deve impedir novos hardcodes de cores adaptáveis, usando revisão e verificação automatizada com allowlist documentada para dados, paridade legada, gráficos, imagens e documentos.

## Rollout e rollback

Defina uma ativação reversível, preferencialmente controlada por configuração de frontend/ambiente na primeira entrega, sem criar dependência de backend:

- desenvolvimento e homologação: tema e três paletas disponíveis para validação;
- primeira liberação produtiva: controle liberado conforme a cobertura dos seams, sempre com Claro como padrão;
- dark desabilitado: esconder o controle ou forçar o tema efetivo Claro sem apagar a preferência armazenada;
- rollback: desativar a configuração, manter dados locais intactos e restaurar o comportamento Claro;
- reativação: reaplicar a preferência salva somente depois de a configuração estar habilitada;
- registrar versão do contrato de preferência para futuras mudanças.

Não introduza telemetria de negócio apenas para o tema. Se houver observabilidade, limite-a a erros técnicos, falhas de bootstrap e regressões detectáveis no ambiente de teste.

## Testes obrigatórios

Especifique testes unitários, de componentes, integração e smoke para:

### Preferência e inicialização

- ausência de storage resulta em Claro;
- JSON inválido, modo inválido ou paleta inválida resulta em Claro + paleta padrão;
- preferência legada somente com modo é migrada com paleta padrão;
- modo Sistema acompanha matchMedia somente quando escolhido;
- Claro e Escuro explícitos ignoram mudanças do sistema;
- storage event sincroniza abas;
- alteração na aba atual é imediata;
- quota, modo privado e matchMedia ausente não quebram a aplicação;
- bootstrap pré-React define data-theme antes do primeiro render;
- navegação Inertia, logout e troca de usuário não apagam a preferência.

### Componentes

- controle global anuncia modo e paleta;
- radio/radiogroup, aria-pressed ou equivalente refletem seleção;
- teclado e foco funcionam;
- color-scheme acompanha o tema;
- Button, Input, Select, lookup, grid, modal, toast, busy, disabled, erro, seleção e barras de operação usam tokens;
- overlays recebem foco e não ficam atrás de shell ou rail.

### Contraste e visual

Monte uma matriz para Claro e para as três paletas Escuras, cobrindo:

- header, menu, subheader e conteúdo;
- cadastro denso e validação;
- consulta/grid, linha selecionada e paginação;
- lookup e modal;
- toast, busy, success, warning, danger e info;
- gráficos, SVGs de interface e estados legados;
- viewport desktop, tablet, estreita, zoom alto e reflow;
- foco, hover, pressed, disabled e texto sobre superfícies.

Use a infraestrutura existente de Vitest/Testing Library e Puppeteer quando adequada. O build npm run build, a suíte npm test e smoke de rotas representativas devem fazer parte do aceite. Não use snapshot frágil de classes Tailwind como única prova.

### Critério de tela migrada

Uma tela só é considerada migrada quando:

- não possui cor física hardcoded em papel adaptável sem justificativa;
- funciona em Claro e nas três paletas Escuras;
- estados e mensagens continuam semanticamente legíveis;
- foco, teclado, leitores de tela e reduced motion foram verificados;
- não há flash de tema incorreto;
- impressão/PDF e artefatos fora da tela não foram alterados indevidamente;
- passou no smoke funcional e na matriz visual correspondente;
- exceções foram registradas com arquivo, motivo e plano de revisão.

## Inventário e divisão de tickets

Antes de criar tarefas de implementação:

- produza inventário reproduzível das ocorrências de cor e dos consumidores dos seams;
- separe shell/primitives, telas representativas, exceções legadas, gráficos/SVGs e documentos;
- crie tarefas pequenas por seam ou família, com dependências explícitas;
- não crie uma tarefa por tela quando a correção pertence a um componente compartilhado;
- inclua uma tarefa de guardrail para impedir novos hardcodes adaptáveis;
- inclua uma tarefa de testes de contraste e smoke visual;
- inclua uma tarefa de rollout e rollback.

## Entregáveis do /speckit.specify

Entregue:

1. diagnóstico baseado nos arquivos atuais;
2. contrato de modo e paleta;
3. contrato de tokens semânticos;
4. arquitetura de bootstrap/provider e persistência;
5. matriz de acessibilidade;
6. tratamento de estados, legado e artefatos;
7. ordem de implementação por seam;
8. inventário e decomposição em tarefas;
9. estratégia de testes e critérios de tela migrada;
10. rollout, rollback, riscos e decisões pendentes.

## Fora de escopo

- implementar o tema durante o /speckit.specify;
- reescrever todas as páginas em uma única tarefa;
- duplicar componentes ou páginas para Claro e Escuro;
- alterar backend, banco, permissões, endpoints ou regras de negócio sem decisão separada;
- inverter imagens, fotos, logos, PDFs ou documentos com filtro global;
- remover o Claro;
- redesenhar toda a identidade visual tecLUX;
- trocar atalhos ou semântica de operações;
- alterar estilos de impressão apenas para acompanhar a tela.
