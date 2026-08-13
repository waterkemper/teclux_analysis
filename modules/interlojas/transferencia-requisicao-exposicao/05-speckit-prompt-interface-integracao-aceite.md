# Prompt para `/speckit.specify` — interface, integração e aceite

````text
/speckit.specify

Crie a especificação final de interface e integração Laravel para **Interlojas → Transferência de Requisição para Exposição**, consumindo os prompts 01 a 04. Não implemente código. A interface deve preservar o comportamento funcional do Delphi, usando padrões já existentes do Laravel para shell, modal, grid, atalhos, mensagens, acessibilidade e consulta cancelável.

## Shell e filtros

Use Breadcrumb padrão e a folha/menu **Interlojas → Transferência**. Derive filial e autorização no servidor. A tela deve iniciar com filial requisitada informativa, período padrão e situação Aberta, respeitando os parâmetros resolvidos no backend.

Filtros:

- Situação em radio buttons: Aberta, Fechada, Confirmada e Cancelada;
- Curva ABC A/B/C/Não Definido em seleção múltipla;
- Requisitante pelo modal padrão F9, com validação de filial autorizada;
- Período com as validações Delphi;
- alternância Produto/Código de Barras por F11 quando habilitada;
- seleção de lotes em checkbox, sem seleção significando sem filtro.

Não recriar as grades/painéis Delphi de compras, grupos ou filiais. Não criar semântica nova para emissão fiscal ou venda entre filiais.

## Barra de operações e comportamento

Implementar command bar Laravel com ícones, tooltips e atalhos quando existentes no Delphi, mantendo handlers compartilhados entre botão e teclado:

- Gravar F5 separado de Confirmar F8;
- Cancelar/Reabrir F6;
- Gerar consulta F7;
- Confirmar F8;
- Requisitante F9 no modal padrão;
- alternar Produto/Código de Barras F11;
- Imprimir F12.

A grade principal só é editável como no Delphi para requisições abertas, nos campos quantidade recebida e observação. F8 é o único caminho de confirmação e sempre chama validação server-side. Gerar Lote e Conferir processam todas as linhas marcadas e refletem o estado real retornado pelo servidor.

Enquanto a consulta estiver gerando, o botão Cancelar deve aparecer imediatamente, ficar habilitado mesmo antes do primeiro await e executar o cancelamento PostgreSQL real do prompt 02. Desabilitar ações conflitantes durante busy, impedir duplo submit e tratar resposta tardia. Mensagens de vazio, conflito, saldo, cancelamento e erro devem ser estruturadas e acessíveis.

## Grid e apresentação

Usar `ErpPreferenceDataGrid`/`ErpGridShell` com catálogo específico, ordenação server-side, exportação segura e personalização persistida. Não usar paginação. O catálogo operacional inclui produto, descrição, referência, situação/ABC, estoque, reserva, quantidades pedida/recebida, lote, seleção, observação e grades de produto quando `USAR GRADES PRODUTOS` estiver ativo; manter demais campos Delphi somente quando houver uso e autorização explícitos.

Estados devem preservar a semântica visual do Delphi com texto e ícone sempre disponíveis; cor é apenas reforço para aberta, parcial, confirmada, cancelada, fechada e origem. Nunca depender somente de cor. Colunas editáveis, seleção, foco, teclado, leitor de tela, `aria-label`, tooltip e mensagens devem ser testados.

## Chave NF-e compartilhada

Reutilizar exclusivamente `NfeAccessKey`, `NfeAccessKeyValid`, `NfeAccessKeyInput` e `NfeAccessKeyText` quando uma referência de chave for necessária. Manter valor canônico de 44 dígitos separado da máscara visual, normalizar colagem e validar no componente/value object compartilhado. Não criar regex, cálculo de DV ou máscara local. Isso estabelece o padrão para o restante do sistema, mas esta tela não implementa emissão fiscal.

## Integração e aceite final

Especifique rotas, Form Requests, policies/middleware, payloads, eventos de grid/exportação, `screenKey`, trace/cancelamento e componentes a reutilizar. Separe consulta de comandos transacionais; preferências do grid não autorizam SQL nem colunas. Todas as decisões de filial, parâmetro, situação, quantidade, lote e revisão são server-side.

Critérios de aceite:

- [ ] Jornada F7 → editar aberta → gerar/conferir lote → F8 → F12 reproduz a sequência Delphi dentro do escopo não fiscal.
- [ ] F5 e F8 são operações distintas; F6 alterna cancelar/reabrir; F9 é modal padrão; F11 alterna busca; F12 imprime o relatório operacional.
- [ ] Grade sem paginação tem sort/export/personalização e nenhum N+1.
- [ ] Cancelar da consulta termina a query PostgreSQL e não apenas o request do navegador.
- [ ] Filtros, lotes, estados, atalhos, busy e acessibilidade têm testes.
- [ ] Chave NF-e usa componente compartilhado e não existe máscara local.
- [ ] Testes de PostgreSQL real cobrem SQL, locks, rollback e cancelamento; não há testes de driver, `hashtablefs` ou `hastablefs`.
- [ ] Schema gate valida o snapshot/checksum em CI/teste, sem introspecção no caminho de negócio.

## Limite com a ponte fiscal

A emissão fiscal continua fora da implementação operacional deste prompt. A tela deve consumir somente o módulo complementar de emissão fiscal da transferência: não aceitar linhas, totais ou status fiscais como autoridade, não projetar destino manualmente e não criar um segundo fluxo de NF-e. Estados fiscais exibidos na interface devem vir do contrato complementar e permanecer distintos dos estados operacionais.

## Fora de escopo

Emissão/transmissão/consulta/impressão/cancelamento de NF-e, XML, DANFE, impostos, séries, duplicatas, contratos, crédito, venda entre filiais, grades obsoletas de compras/grupos/filiais, alterações Delphi e implementação durante o `/speckit.specify`.
````
