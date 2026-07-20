# PROTÓTIPO DESCARTÁVEL — Shell do Cadastro de Contratos

Pergunta: qual organização torna um contrato grande operável sem copiar a densidade do form Delphi?

Abrir com um comando:

```powershell
Start-Process '.scratch\cadastro-contratos-wayfinder\07-shell-prototype.html'
```

Use a barra inferior para comparar:

- **A — Abas:** evolução direta do padrão usado no Cadastro de Orçamentos e no detalhe da Consulta de Contratos.
- **B — Áreas laterais:** navegação mais estável quando o número de áreas crescer, mas consome largura do grid.
- **C — Operacional:** Produtos domina a tela e pendências/totais ficam permanentes; favorece a venda, mas reduz a neutralidade do shell para outras tarefas.

Interações simuladas: troca de área, carregamento progressivo, F8/gravação, F9/localização e sinal de alterações não gravadas. Os conteúdos internos são deliberadamente fictícios e não decidem as fatias posteriores.

Fontes que determinaram o protótipo:

- Delphi `fmcadastrocontratos.dfm`: sete abas principais a partir das linhas 2181, 5703, 7487, 8284, 10399, 11404 e 11913; barra com Atendimento F10, Imprimir F7, Copiar F8, transição F11 e envio F12 nas linhas 37–656.
- Delphi `fmcadastrocontratos.pas`: estado e rótulo da transição controlam F11 nas linhas 913–930; atalhos na faixa 2785–2812; troca de aba dispara comportamento em 3612–3618.
- Laravel `Orcamentos/Cadastro.tsx`: `ErpCadastroTabBar`, atalhos F3/F6/F7/F8/F9/F10/F11 e aviso de conflito por revisão.
- Laravel `ConsultaContratosDetalheTabs.tsx`: grids e áreas existentes, com carregamento tardio de Parcelas somente quando a aba se torna ativa.
- Laravel `OrcamentoCommandBar.tsx`: barra de comandos e ações secundárias já reutilizáveis.

Este arquivo e o HTML pertencem somente ao wayfinding; não são base de código de produção.
