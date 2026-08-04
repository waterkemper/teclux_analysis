# Inventariar Interlojas já existente no Laravel

Type: task
Status: resolved
Blocked by:

## Question

O que já está efetivamente implementado no Laravel para Cadastro de Requisição para Exposição e núcleo de Requisição entre Filiais — backend, página React, menu, autorização, parâmetros, comandos, leitura, revisão, auditoria, testes e relatórios — e quais seams podem sustentar a nova Consulta?

## Answer

> **Correção de estado atual (2026-07-30):** o Cadastro passou a possuir a página `resources/js/Pages/Interlojas/RequisicaoParaExposicao/Cadastro.tsx`, hooks, componentes e testes. As referências abaixo à inexistência da UI registram o estado observado na sessão original e não devem orientar as especificações posteriores. A Consulta continua exigindo página própria, mas pode reutilizar/adaptar os diálogos de cancelamento e conflito, o alerta de Reserva Prévia, atalhos e feedback do Cadastro atual.

### Estado entregue

O Cadastro de Requisição para Exposição possui backend funcional e documentado, mas não possui a página React referenciada pelo controller. `RequisicaoExposicaoController::cadastro()` renderiza `Cadastros/Interlojas/RequisicaoExposicao/Cadastro`, porém `resources/js/Pages/Cadastros/Interlojas/RequisicaoExposicao/Cadastro.tsx` não existe. O próprio `specs/293-requisicao-exposicao-cadastro/tasks.md` declara “UI React fora de escopo — apenas props Inertia e JSON”. Assim, não há formulário específico, lookups visuais ou atalhos efetivamente utilizáveis no frontend, embora os endpoints estejam prontos.

### Rotas, menu e autorização

Há um grupo protegido por `interlojas.requisicao_exposicao.module` com rotas para página, incluir, criar, alterar, cancelar, F9 de abertas e lookups/resolvers de requisitantes, requisitadas, produtos e motivos.

A migration cria a folha `Interlojas → Requisição para Exposição`, rota `interlojas.requisicao-exposicao.cadastro`, e replica acessos do pai Interlojas. `InterlojasRequisicaoExposicaoModuleAccessService` permite administrador ou usuário com vínculo em `usuariosacessosmodulos`; concessão da Consulta de Compras não concede este módulo.

`RequisicaoExposicaoAuthorizationService` exige a requisitante em `usuariosfiliais`. A requisitada precisa existir e ser diferente, mas não precisa estar autorizada para o usuário. Toda mutação revalida essas regras no servidor.

### Cadastro, leitura e lookups

O controller e os Form Requests implementam:

- inclusão com requisitante, requisitada, produto, quantidade inteira positiva e observação de até 150 caracteres;
- alteração otimista com identidade `(requisitante, codigo)`, revisão e campos mutáveis;
- cancelamento confirmado, revisão, produto e motivo/texto;
- carga direta por `cadastro?requisitante=&codigo=`;
- F9 paginado somente de abertas de uma requisitante autorizada;
- lookups paginados de filiais, produtos e motivos, com resolve por código.

`LegacyRequisicaoExposicaoReadRepository::findFicha()` já projeta uma ficha unitária com produto, grades, NF, estoque da requisitante/requisitada e situação. `RequisicaoExposicaoCadastroPageService` acrescenta revisão, mutabilidade, parâmetros de UI e a separação `identidade/cabecalho/editaveis/contexto/resultado`.

A leitura F9 não serve diretamente como Consulta Delphi: fixa `situacao = A`, não filtra período, não traz todas as quantidades/saldos/nota/lote/ABC e ordena por data por padrão. Ela é um padrão de paginação, busca normalizada e autorização, não o repositório final da nova tela.

Há uma divergência semântica a corrigir na especificação: o Laravel rotula `F` como `Finalizado` e `D` como `Devolvido`; o Delphi da Consulta define `F` como `Fechado` e `D` como `Confirmado`.

### Núcleo compartilhado de comandos

`RequisicaoFiliaisCommandService` expõe `criar`, `somar`, `alterar`, `cancelar` e `obterRevisao`. Ele já fornece os seams centrais para a Consulta:

- transações únicas e locks de `pedidosfiliais`/estoque;
- advisory lock da tríade produto–requisitante–requisitada quando duplicatas são proibidas;
- resolução da filial física;
- movimentos TEP/TPE/TFR;
- validação de aberta;
- revisão otimista e conflito concorrente;
- alertas estruturados.

`RequisicaoFiliaisStockRelease` já implementa a exceção requerida para reserva prévia divergente: libera no máximo o disponível, destina primeiro `min(futuro, liberável)` ao reservado, manda o restante ao estoque e retorna alerta `reserva_previa_divergente` com esperado, movimentado e diferença. O cancelamento não é bloqueado por `qtderecebida` parcial.

O Cadastro delega criar/alterar a `RequisicaoExposicaoGravarService` e cancelar a `RequisicaoExposicaoCancelarService`; ambos aplicam autorização, contexto de auditoria e remapeiam a ficha atualizada. A Consulta pode reutilizar os serviços para mutações compatíveis ou chamar comandos específicos por uma fachada própria, preservando revisão e alertas.

### Parâmetros

`RequisicaoFiliaisParameterManifest` centraliza descrições literais e resolve por filial ativa via `ParameterService`:

- `Transferir Produtos Compostos`;
- `Permitir requisições de produtos duplicadas`;
- `REQUISICAOSUBTRAIESTOQUE`;
- `Informar o motivo do cancelamento do pedido`;
- `USAR GRADES PRODUTOS`.

A conversão compartilhada trata valor ausente, `NULL`, vazio e booleano inválido como falso. O Cadastro só expõe grades e exigência de motivo em `parametros_ui`; o núcleo consome os demais.

### Auditoria e revisão

As escritas web aplicam `DatabaseAuditContext` dentro da transação. Em PostgreSQL, o trigger `pedidosfiliais_audit_log_trg` escreve INSERT/UPDATE/diff em `pedidosfiliais_log_new`, distinguindo contexto Laravel e alteração externa. `LegacyRequisicaoFiliaisRevisionRepository` usa `max(id)` desse log como token de revisão; se a tabela estiver indisponível, retorna zero. Esse seam deve ser mantido na Consulta para detectar alterações concorrentes do Delphi ou de outros módulos.

### Testes e verificação atual

Existem testes de acesso, filiais, criação, carga, alteração, cancelamento, motivo, duplicidade, F9, lookups, adulteração de payload, limite de observação e conflito de revisão, além de testes do núcleo para movimentos, concorrência, rollback, parâmetros, liberação de estoque e trigger de auditoria.

A execução focal não iniciou neste ambiente: as dependências exigem PHP `>= 8.4.1`, enquanto o executável disponível é 8.2.21. Portanto, a cobertura foi inventariada no código, mas não revalidada nesta sessão.

### Relatórios e seams de interface

Não existe rota, controller, serviço, template ou teste de relatório/impressão específico para Requisição para Exposição. Existem infraestruturas gerais de PDF/relatórios no projeto, mas a escolha do padrão pertence ao ticket de impressão.

Também não existe grid React específico do Cadastro. Para a nova Consulta, estão disponíveis componentes gerais como `ErpPreferenceDataGrid`/`DataGrid`, preferências/exportação, células somente leitura/editáveis, `LookupInput`, `CatalogCodeLookup`, `BaseFormPage` e `FormActions`. Devem ser avaliados como padrões reais, sem presumir que a página 293 possa ser importada.

Seams recomendados para os próximos tickets:

- reutilizar `RequisicaoFiliaisCommandService`, revisão, locks, movimentos, alertas e manifesto sem duplicar regra de estoque;
- reutilizar autorização de requisitante e o padrão de acesso ao módulo, decidindo separadamente se Consulta terá folha/capability própria;
- estender ou criar read repository paginado para período + quatro situações, mantendo `findFicha()` para recarga da linha selecionada;
- reaproveitar o mapeamento de ficha e serviços de alteração/cancelamento onde o contrato coincidir;
- usar o F9 apenas como referência de paginação/busca;
- construir a página React da Consulta sobre os componentes gerais; não depender de uma UI de Cadastro inexistente;
- criar relatório específico sobre o mesmo filtro/ordem da Consulta.
