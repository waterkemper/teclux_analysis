# Decidir arquitetura de tokens e migração incremental

Type: grilling
Status: resolved
Blocked by: 01

## Answer

Adotar uma única implementação de componentes, com tokens semânticos em custom properties CSS selecionadas por html[data-theme=light] e html[data-theme=dark]. O Tailwind v4 deve expor esses tokens como cores e utilitários do tema, permitindo que os componentes continuem usando classes compartilhadas. O atributo data-theme é o contrato definido no ticket de preferência; dark: não será o mecanismo principal da migração.

O contrato mínimo de tokens deve separar papéis que hoje estão misturados nas cores físicas:

- superfícies: canvas da aplicação, painel, painel elevado/modal, superfície sutil, superfície de controle e superfície invertida;
- conteúdo: texto principal, secundário, auxiliar, invertido, link e desabilitado;
- bordas e foco: borda padrão, sutil, forte, foco e separador;
- ações: primária, hover, pressionada, desabilitada e destaque de seleção;
- estados: sucesso, atenção, erro e informação, cada um com papéis de texto, superfície e borda quando usados em banners, badges ou validações;
- camadas: scrim de modal, superfície de overlay, tooltip/popover e estados de busy;
- visualização: série de gráfico, grade/zebra, seleção de linha e realce de resultado.

Os nomes devem representar intenção, não a cor física, por exemplo surface-panel, content-primary, border-default e status-danger-surface. Variantes com opacidade devem ser definidas de modo compatível com o consumo pelo Tailwind; não se deve aplicar transparência arbitrária a uma variável hexagonal e esperar que todos os estados permaneçam legíveis. O par claro/escuro de cada token deve ser validado por contraste, inclusive hover, focus, disabled e texto sobre estado.

Não remapear globalmente white, black, slate, stone, gray, red, amber ou equivalentes. A mesma cor física hoje aparece como fundo, texto, borda, estado operacional, imagem, gráfico e saída legada. Cada uso deve ser classificado: papel adaptável, cor de estado, cor de paridade legada, cor de dado/visualização ou artefato fora do tema. Somente os usos adaptáveis migram para tokens semânticos; exceções permanentes devem ser documentadas no componente.

A migração deve ocorrer nesta ordem:

1. fundar os tokens, os dois temas, o bootstrap pré-React e um mecanismo de validação de contraste;
2. migrar shell, layout, cabeçalho, menu lateral, conteúdo principal e barras de operações;
3. migrar primitives compartilhados: Button, Input, Select, campos numéricos, lookup, FormSection, Dialog/Modal, Toast, paginação e estados de carregamento;
4. migrar uma matriz representativa de grids, filtros, cadastros e consultas, corrigindo composições que ainda dependem de fundo branco ou borda clara;
5. migrar feedback semântico, badges, seleção, tabelas, gráficos e SVGs que pertençam à interface;
6. expandir por famílias de páginas, mantendo cada lote verificável por screenshot/contraste e sem obrigar a migração de relatórios de impressão no mesmo lote.

Imagens, logos e fotos não devem ser invertidos por filtro global. Gráficos e SVGs de interface devem consumir uma paleta semântica; SVGs e artefatos que representem dados ou identidade podem manter cores próprias quando a legibilidade for garantida. As classes de paridade visual do ERP, como as da Ficha Financeira, devem ser tratadas explicitamente: preservar a legenda e o significado operacional com tokens de legado ou manter a superfície fora do tema até haver decisão de redesign. Impressão, PDF, recibos e documentos gerados permanecem com seus estilos de saída e não herdam automaticamente o tema da tela.

Depois da fundação dos tokens, novo código de tela não deve introduzir cor física diretamente para papéis adaptáveis. A revisão deve exigir token semântico ou uma exceção justificada; uma verificação automatizada pode detectar classes de cor novas em superfícies migradas, com allowlist para dados, status legados e artefatos. A migração não deve ser uma reescrita global nem duplicar páginas por tema.

## Question

Qual seam permite suportar claro e escuro com uma implementação compartilhada, sem duplicar todas as páginas e sem remapear globalmente `white`/`black` de maneira que quebre texto, botões, imagens ou estados?

Comparar `dark:` espalhado, variáveis CSS semânticas com `data-theme`, remapeamento de paleta Tailwind e migração híbrida. Definir tokens para superfície, texto, borda, foco, primária, estados e overlays, incluindo opacidades. Recomendação inicial: tokens semânticos em CSS/Tailwind, usados primeiro em shell e primitives, com `dark:` somente para exceções locais; não remapear globalmente uma cor física usada tanto como fundo quanto como texto. Definir ordem de migração e regra para não deixar novos hardcodes.
