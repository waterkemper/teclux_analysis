# Decidir lotes e critérios por família de interface

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Como o prompt para o `/speckit.specify` deve dividir toda a interface tematizável em lotes verificáveis, garantindo cobertura completa sem uma tarefa por tela e sem incluir relatórios?

Agrupar por seam e família consumidora, definir dependências, checkpoints e critério de conclusão por lote. Incluir explicitamente autenticação, dashboard, hubs, cadastros, consultas, operações e overlays. Cada lote deve preservar o Claro, validar as três paletas escuras e impedir que arquivos ainda físicos sejam declarados migrados por simples herança.

## Answer

O prompt para o `/speckit.specify` deve exigir uma execução em grafo: primeiro um lote-base obrigatório, depois lotes consumidores por família de domínio. Famílias independentes podem avançar em paralelo, mas nenhuma começa antes da aprovação do lote-base e nenhuma superfície é considerada migrada por simples herança.

### Lote-base e gate-piloto

O lote-base cobre tokens `--erp-*`, aliases, `AppLayout`, superfícies estruturais, primitives e todos os seams definidos em [Decidir estratégia de correção dos seams compartilhados](02-decidir-estrategia-de-correcao-dos-seams.md).

Após o lote-base, executar um gate-piloto obrigatório nas três superfícies já documentadas pelas capturas da auditoria:

- Cadastro de Produtos;
- Inventário;
- Ligar para Clientes.

Os lotes consumidores só ficam liberados quando as três superfícies passam no tema claro e nas três paletas escuras, sem ilhas claras, contraste indevido nem regressão funcional ou visual.

### Lotes consumidores

1. Autenticação, dashboard, hubs e navegação.
2. Administração e configuração: `Admin`, `SystemParameters`, `Configuracoes`, usuários, filiais e grupos.
3. Cadastros gerais: clientes, endereços, bancos, serviços e demais cadastros menores.
4. Estoque e compras: todo `Pages/Cadastros/Estoque` e `Pages/Estoque` fora de relatórios.
5. Vendas e comercial: `Pages/Vendas` e `Pages/Cadastros/Vendas`.
6. Financeiro e cobrança: `Financeiro`, `Caixa`, `ContasPagar` e `CobrancaSac`, excluindo relatórios.
7. Marketplaces.
8. Interlojas e entregas.
9. Componentes auxiliares e superfícies residuais não atribuídos aos lotes anteriores.

Relatórios permanecem excluídos mesmo quando fisicamente aninhados nessas árvores. Cada arquivo, rota e superfície deve ter um único lote proprietário no manifesto; componentes compartilhados podem ter vários consumidores, mas uma única origem de correção.

### Cobertura obrigatória

- Toda rota e superfície do lote deve constar em manifesto de cobertura.
- Cada superfície deve ser aberta e validada no tema claro e nas três paletas escuras; não há aprovação por amostragem de telas.
- Estados e variantes de componentes podem usar casos representativos, desde que a matriz demonstre cobertura de todas as variantes.
- Superfícies inacessíveis por dados, permissão ou ambiente ficam como impedimento explícito e não podem ser contadas como aprovadas.
- O inventário do lote deve terminar sem candidato de cor física não classificado.

### Gate de conclusão por lote

Cada lote deve entregar manifesto atualizado; varredura sem candidato físico não classificado; capturas nas quatro aparências; verificação de contraste e estados; testes relacionados e build; allowlist fechada; registro de impedimentos; e evidências identificadas pelo lote. Falha em qualquer item mantém o lote incompleto, embora lotes independentes possam prosseguir.

Não se transfere dívida visual para o lote seguinte. Se um lote consumidor revelar defeito em componente compartilhado, a correção retorna à origem compartilhada e todos os lotes já aprovados que o consomem devem ser revalidados; é proibido contornar o problema somente na página local.
