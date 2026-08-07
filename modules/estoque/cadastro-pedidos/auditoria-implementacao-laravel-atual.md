# Auditoria da implementação Laravel atual — Cadastro de Pedidos

## Escopo e método

Auditoria estática do checkout `laravel/backend` contra os limites e critérios dos 15 prompts em `modules/estoque/cadastro-pedidos/01-speckit-prompt.md` a `15-speckit-prompt.md`. Foram usadas apenas fontes primárias do checkout: código, migrations, views e testes. Nenhum teste foi executado e nenhum código de implementação foi alterado.

Classificações:

- **IMPLEMENTADO**: código e testes locais provam o núcleo do contrato.
- **PARCIAL**: há implementação relevante, mas falta parte material do contrato ou sua prova.
- **DIVERGENTE**: o comportamento acessível contradiz requisito explícito ou introduz risco incompatível.
- **SEM PROVA**: não foi localizada implementação/prova suficiente.

## Resultado executivo

| Prompt | Tema | Situação |
|---|---|---|
| 01 | Motor de Custo | **PARCIAL** |
| 02 | Orquestração fiscal e ICMS normal | **IMPLEMENTADO** no domínio; **PARCIAL** na integração |
| 03 | ICMS-ST | **IMPLEMENTADO** no domínio |
| 04 | IPI e PIS/COFINS | **IMPLEMENTADO** no domínio; UI **PARCIAL** |
| 05 | Rateio e produtos compostos | **IMPLEMENTADO** no domínio |
| 06 | Cabeçalho, situação e previsões | **IMPLEMENTADO** funcionalmente; concorrência **SEM PROVA** |
| 07 | Ciclo do item e vínculo fornecedor | **IMPLEMENTADO**; atomicidade concorrente **SEM PROVA** |
| 08 | Grade, formação, financeiro, e-mail e relatório | **DIVERGENTE** no financeiro; demais majoritariamente implementados |
| 09 | Menu e autorização própria | **IMPLEMENTADO** |
| 10 | Lookup F9 | **IMPLEMENTADO** |
| 11 | Abas Fornecedor, Notas e Contatos | **IMPLEMENTADO** |
| 12 | Notas Pendentes de Entrada | **SEM PROVA** |
| 13 | Cores, reordenação e marcar todos | **IMPLEMENTADO** |
| 14 | Produtos Similares completos | **DIVERGENTE** |
| 15 | Formulário fiscal completo do item | **PARCIAL** |

O módulo é substancialmente funcional, mas ainda não está seguro para considerar os 15 prompts encerrados. As maiores lacunas são: consistência fiscal/custo na gravação, proteção da integração com Contas a Pagar, concorrência, aba SEFAZ pendente, painel completo de similares, fidelidade do formulário fiscal e testes PostgreSQL não puláveis.

## Auditoria por prompt

### 01 — Motor de Custo: PARCIAL

O prompt exige cálculo de custo, preço sugerido com markup em três níveis, propagação por característica e autocadastro de preço (`01-speckit-prompt.md:10-19`). Esses conceitos existem em classes dedicadas: `CalcularCustoFormula`, `CalcularPrecoVendaFormula`, `MarkupTresNiveis`, `PropagarPrecoAtribuido`, `MotorCustoService`, repositórios de markup e escrita de preço. A origem Pedido de Compra também é explícita em `MotorCustoOrigemDocumento`.

Há ampla suíte unitária em `tests/Unit/Estoque/MotorCusto/` e manifestos de parâmetros em `app/Support/Estoque/MotorCustoParameterManifest.php`.

Porém, a integração do Cadastro de Pedidos não é autoritativa: `PedidoCompraMotoresSyncService` chama o motor, mas captura qualquer `Throwable`; com `strict=false`, registra warning e devolve apenas o valor mercadoria (`laravel/backend/app/Services/Estoque/PedidoCompra/PedidoCompraMotoresSyncService.php:51-119`). `GravarPedidoCompraService` usa exatamente `strict: false` e ignora o resultado do motor após persistir pedido, itens, previsões e financeiro (`GravarPedidoCompraService.php:119-153`). Logo, a existência do motor está provada, mas não que toda gravação válida aplique custo/preço/propagação/autocadastro sem sucesso silenciosamente degradado.

### 02 — Orquestração fiscal e ICMS normal: IMPLEMENTADO no domínio; PARCIAL na integração

O contrato pede preparação, rateio, laço por item, classificação fiscal, ICMS normal, reduções, crédito e FCP (`02-speckit-prompt.md:12-20`). Existem `MotorImpostosOrchestrator`, `ClassificacaoFiscalEfetivaResolver`, `IcmsBaseCalculoFormula`, `IcmsNormalCalculator`, `IcmsReducaoBaseParalela`, `IcmsFcpCalculator` e portas de tabela de alíquota. O orquestrador possui totalizadores e execução por documento (`laravel/backend/app/Domain/Estoque/MotorImpostos/MotorImpostosOrchestrator.php:15-156`).

O Cadastro monta `MotorImpostosDocumentoInput` com origem Pedido, Filial, fornecedor e linhas, executa impostos antes do custo (`PedidoCompraMotoresSyncService.php:62-103`). Testes unitários do motor cobrem classificação, ICMS, FCP e orquestração.

A integração permanece **PARCIAL** pelo mesmo fallback permissivo e porque a gravação do cabeçalho não persiste/sincroniza o resultado fiscal retornado; apenas o item individual persiste alguns campos de entrada e depois recalcula (`PedidoCompraItemGravarService.php:135-175`). Não há prova de que falha fiscal impeça gravação financeira/cadastral.

### 03 — ICMS-ST: IMPLEMENTADO no domínio

O prompt limita-se ao ramo `BaseDupla=false`, MVA/equalização, redução, valor, FCP-ST e pares oficial/custo (`03-speckit-prompt.md:10-14`). Existem `IcmsStBaseCalculoFormula`, `IcmsStEqualizacao`, `IcmsStCalculator`, `IcmsStAjustesFinosPedidos` e `IcmsStResultado`. A suíte contém casos explícitos para Base Dupla ausente, valores retidos ausentes e ajustes finos (`tests/Unit/Estoque/MotorImpostos/IcmsStBaseDuplaAusentePedidosTest.php`, `IcmsStSemValoresRetidosPedidosTest.php`, `IcmsStAjustesFinosPedidosTest.php`).

Não foi localizada implementação de `BaseDupla=true` ou retidos como caminho de Pedido, alinhado ao fora de escopo. A ressalva é a integração permissiva já descrita, não a fórmula isolada.

### 04 — IPI e PIS/COFINS: IMPLEMENTADO no domínio; UI PARCIAL

O prompt exige bases, valores, gating/importação e editabilidade do IPI (`04-speckit-prompt.md:10-19`). Existem `IpiBaseCalculoFormula`, `PisCofinsBaseCalculoFormula`, `IpiPisCofinsCstGating`, `IpiPisCofinsCalculator`, `IpiResultado` e `PisCofinsResultado`; testes cobrem ausência de serviços e editabilidade (`tests/Unit/Estoque/MotorImpostos/IpiPisCofinsSemServicosPedidosTest.php`, `IpiEditabilidadePedidosTest.php`).

O formulário expõe bases, alíquotas e valores básicos de IPI/PIS/COFINS (`resources/js/Pages/Cadastros/Estoque/PedidosCompra/components/PedidoCompraItemFiscalTabs.tsx:57-106`), mas não apresenta toda a matriz de CSTs e campos prevista no prompt 15. Portanto, domínio implementado e apresentação parcial.

### 05 — Rateio proporcional e compostos: IMPLEMENTADO no domínio

O prompt pede um algoritmo para desconto, frete e despesas e redistribuição do kit-pai aos componentes (`05-speckit-prompt.md:10-14`). Existem `RateioProporcionalAlgoritmo`, `RateioProporcionalCampo`, `RateioDocumentoCalculator`, `RateioCompostoRedistribuicao`, `RateioPapelKit` e `RateioCampoSoltar`; o orquestrador recebe a porta de rateio. Testes do motor cobrem proporcionalidade, restos e compostos em `tests/Unit/Estoque/MotorImpostos/`.

Não foi localizada UI específica para comandos manuais de rateio, mas isso não fazia parte do limite do prompt 05.

### 06 — Cabeçalho, situação e previsões: IMPLEMENTADO; concorrência SEM PROVA

O prompt exige incluir/gravar/excluir, quatro validações, máquina de situação e previsões totalizando 100% com resto na primeira (`06-speckit-prompt.md:10-18`). Existem serviços separados para inclusão, gravação, exclusão e previsão; `AtualizarSituacaoPedido`, `PodeExcluirAlterarPedido`, `PrevisaoPercentualGuard` e `PrevisaoEntregaRateio` modelam as regras. `GravarPedidoCompraService` valida total, monta datas, grava tudo em transação e sincroniza previsão/financeiro (`GravarPedidoCompraService.php:90-153`). Há testes feature de gravação, exclusão/situação e previsão, além de unitários de rateio/percentual.

Não há controle otimista (`revision`/versão) nem `lockForUpdate` localizado nas mutações. A edição lê a situação e depois atualiza dentro da transação, mas sem bloquear o registro (`GravarPedidoCompraService.php:119-140`; `LegacyPedidoCompraRepository.php:38-66`). Duas sessões podem sobrescrever cabeçalho, itens e previsões. O allocator usa sequence PostgreSQL, mas captura qualquer falha e cai em `MAX(numero)+1`, inseguro sob concorrência (`LegacyPedidoCompraNumeroAllocator.php:11-28`).

### 07 — Itens, vínculo, quantidade mínima e similares: IMPLEMENTADO com ressalvas

Existem incluir/gravar/excluir/wipe, resolução de produto, confirmação de vínculo fornecedor e painel de similares. O serviço de gravação cria o vínculo na mesma transação e persiste flags fiscais/operacionais (`PedidoCompraItemGravarService.php:108-167`). Há `QuantidadeMinimaEntregueGuard`, `PedidoCompraProdutoFornecedorLinkService`, `PedidoCompraItensWipeService` e testes feature para ciclo, troca, vínculo, mínimo e filtros.

O painel consulta quando o item ativo muda e é somente leitura (`PedidoCompraItensPanel.tsx:71-127`, `:637+`). Porém, o conteúdo completo do prompt 14 não está entregue, conforme seção própria. Também não há prova de lock/revisão contra gravação/exclusão simultânea do mesmo item.

### 08 — Grade, formação, financeiro, e-mail e relatório: DIVERGENTE no financeiro

Grade e formação têm serviços/domínio/React próprios: abrir/sincronizar, matrix builder, divergência, orientação, IPI total e modal de formação. Rotas estão publicadas (`routes/web.php:2099-2104`) e existem testes feature/unitários de paridade, sync, divergência e orientação.

E-mail usa o componente compartilhado `DocumentEmailModal`, composer/adapter e endpoints de contexto, prévia, envio e status (`Cadastro.tsx:4`, `:95-115`, `:407-425`, `:516-525`; `routes/web.php:2105-2112`). O relatório PDF tem service/Blade/Browsershot e teste (`PedidoCompraRelatorioService.php:21-139`; `PedidoCompraRelatorioTest.php`). Exportação estruturada não foi localizada; como o prompt aceitava “Relatório/Exportação” sem layout aprofundado, a entrega é ao menos parcial nesse ponto.

A integração financeira é **DIVERGENTE e crítica**. `DocumentoPagarPedidoAdapter::sincronizar` sempre remove documentos existentes e recria cabeçalho/duplicatas a partir das previsões (`DocumentoPagarPedidoAdapter.php:25-115`). A remoção apaga todas as Duplicatas e o Documento sem testar pagamento, autorização ou proteção financeira (`:123-138`). Isso pode destruir parcelas quitadas/autorizadas ao regravar um Pedido e contradiz as invariantes atuais de Contas a Pagar. A geração 1:1 existe, mas não é segura.

### 09 — Menu e autorização própria: IMPLEMENTADO

A migration cria/reusa a folha da rota `estoque.pedidos-compra.cadastro` (`database/migrations/2026_07_24_000001_acessosmodulos_pedidos_compra.php:16+`). `EstoquePedidoCompraModuleAccessService` consulta `acessosmodulos` e `usuariosacessosmodulos` (`app/Services/Authorization/EstoquePedidoCompraModuleAccessService.php:13-42`); middleware próprio existe e o alias está registrado (`app/Http/Middleware/EnsureEstoquePedidoCompraModuleAccess.php:12-32`; `bootstrap/app.php:123`). Todo o grupo usa `estoque.pedidos_compra.module`, não o módulo de Consulta de Compras (`routes/web.php:2059-2114`). Há testes de acesso, migration e serviço.

### 10 — Lookup F9: IMPLEMENTADO

Há rota/endpoint próprio (`routes/web.php:2063-2064`), `PedidoCompraLookupService`, `LegacyPedidoCompraLookupRepository`, modal React com infraestrutura de catálogo e armazenamento de sessão, e integração em `Cadastro.tsx` (`Cadastro.tsx:19`, `:533+`). A suíte cobre busca, paginação, ordenação e carregamento (`tests/Feature/Estoque/PedidoCompra/PedidoCompraLookupTest.php`).

Parte desses testes pode ser pulada quando stubs faltam (`PedidoCompraLookupTest.php:94,140,184,236`), portanto a prova em CI depende da configuração do banco.

### 11 — Abas informativas: IMPLEMENTADO

As abas Fornecedor, Notas Fiscais e Contatos existem como componentes somente leitura e são montadas na página (`Cadastro.tsx:466-491`). `PedidoCompraCadastroPageService` devolve resumo do fornecedor, notas por Pedido e contatos serializados (`PedidoCompraCadastroPageService.php:28-44`). Há repositórios dedicados e `PedidoCompraAbasInfoTest`.

A prova é frágil porque vários cenários chamam `markTestSkipped` quando os stubs não existem (`PedidoCompraAbasInfoTest.php:39,71,119,195`).

### 12 — Notas Pendentes de Entrada: SEM PROVA

O prompt exige uma quarta aba baseada em `nsus`/`nsus_prod`, filtrada pelo fornecedor e produtos do Pedido (`12-speckit-prompt.md:10-14`). Não foi localizado componente, endpoint, service/repository ou teste de Notas Pendentes no namespace de Pedido de Compra. `PedidoCompraCadastroPageService` retorna somente fornecedor, notas recebidas e contatos (`PedidoCompraCadastroPageService.php:28-44`). Ocorrências de NFe na UI de Pedido restringem-se à preferência de contato.

### 13 — Cores, reordenação e marcar todos: IMPLEMENTADO

Há mapeador de situação/estilo (`pedidoCompraItemRowStyles.ts`), reordenação por teclado/botões e endpoint transacional, e checkbox tri-state para atualizar preço de todos (`PedidoCompraItensPanel.tsx:88-198`, `:482-527`; rotas `2087-2090`). `PedidoCompraItemReorderService` e `LegacyPedidoCompraItemRepository::renumberSequencial` suportam a operação (`LegacyPedidoCompraItemRepository.php:206-237`). Testes unitários cobrem situação e feature tests cobrem reorder/marcação dentro das suítes de item.

Falta prova de concorrência na renumeração; a transação não bloqueia o conjunto antes de renumerar.

### 14 — Produtos Similares completos: DIVERGENTE

O prompt exige Código, Descrição, Linha, Coluna, Filial, Estoque, Reserva, Pedida, Valor, relação e Produto (`14-speckit-prompt.md:10-14`). O service reutiliza apenas o mapa de códigos da Consulta de Compras e depois consulta `produtos`, retornando somente `produto`, `codigo_visual` e `descricao` (`PedidoCompraSimilaresReadService.php:11-43`). A UI não pode exibir dimensões de grade nem situação de estoque/reserva/pedida/valor que não chegam no payload. O teste existente prova essa forma reduzida, não o contrato do prompt.

### 15 — Formulário fiscal completo: PARCIAL

Foram implementados: filtro de produto por fornecedor persistido em sessão, confirmação de vínculo, lookup Natureza/CFOP, identificação/NCM/CST-CSOSN, quantidade/preço, descontos/frete, unidade NF, data de entrega, abas fiscais básicas e painel de totais (`PedidoCompraItemForm.tsx:57-65`, `:166-203`, `:240-407`; `PedidoCompraItemFiscalTabs.tsx:57-106`; `PedidoCompraItemTotaisPanel.tsx:9-17`). Backend persiste Natureza, CFOP, NCM, CST/CSOSN, unidades, fator, desconto, frete e flags digitadas (`PedidoCompraItemGravarService.php:135-163`).

Porém, a UI fiscal é uma projeção reduzida: não foram localizados todos os CST empresa/nota, reduções oficial/custo, valores de redução, MVA, ICMS SN, ST Retida Anterior e todos os campos monetários/conversão exigidos em `15-speckit-prompt.md:12-22`. Muitos campos exibidos estão sempre desabilitados, enquanto o prompt exige editabilidade condicionada. A suíte de form fiscal prova shape/persistência parcial, não a matriz visual completa.

## Auditoria transversal

### Frontend

**IMPLEMENTADO/PARCIAL.** Existe página operacional rica, lookup, cabeçalho, previsões, itens, grade, formação, abas, e-mail e relatório. Não existe a aba do prompt 12; similares e formulário fiscal estão abaixo do contrato. Não foram localizados testes React/TypeScript específicos da página de Pedido de Compra; a prova frontend é predominantemente indireta via features PHP e unitários de domínio.

### Backend e migrations

**IMPLEMENTADO/PARCIAL.** Há controller, requests, serviços focados, domínio e adapters legados. A maioria das migrations de shape do Pedido é `sqlite_*_stubs`, destinada a teste, enquanto produção depende do schema legado. A migration funcional de menu existe. A compatibilidade do schema PostgreSQL real para todos os campos recentes não está demonstrada por uma suíte dedicada.

### Autorização

**IMPLEMENTADO no perímetro de módulo.** Middleware próprio protege todas as rotas. Não há Policies/abilities distintas por ação (visualizar, gravar, excluir, financeiro, e-mail); qualquer usuário com acesso ao módulo alcança toda a superfície. Os prompts exigiam principalmente o módulo próprio, então isto não é divergência direta, mas é lacuna de defesa em profundidade para ações sensíveis.

### Integrações fiscal e financeira

- Fiscal/custo: **DIVERGENTE por degradação silenciosa** na gravação do cabeçalho (`strict:false`).
- Contas a Pagar: **DIVERGENTE e destrutiva** ao remover/recriar fatos sem gate de parcelas protegidas.
- E-mail/relatório: implementados, com testes que podem ser pulados conforme stubs/renderer.
- SEFAZ pendente: sem prova.

### Concorrência e consistência

**SEM PROVA.** Transações existem em gravação, itens, grade, wipe e exclusão, mas não foram localizados locks de linha, revisão esperada, idempotência ou testes concorrentes PostgreSQL. `updateOrInsert`, `replaceAll` e delete+insert permitem lost update. O fallback `MAX+1` do allocator é inseguro. A integração financeira delete+recreate amplia o risco.

### Observabilidade e Auditoria

**PARCIAL.** Há warnings para falha de motores/recalcular/formação (`PedidoCompraMotoresSyncService.php:104-110`; `PedidoCompraItemRecalcularService.php:136+`) e `report($e)` no controller (`PedidoCompraController.php:596,602,782`). Não foi localizada instrumentação padronizada de início/sucesso/falha, trace ID, métricas ou auditoria imutável das mutações do Pedido. A migration/trigger `pedidosfiliais_log_new` refere-se a Requisições de Filiais, não ao Cadastro de Pedidos em `pedidos`/`produtospedidos`.

### Testes

Foram localizados cerca de 153 métodos/casos PHP nos namespaces de Pedido de Compra e Motor de Impostos, cobrindo muito do domínio e endpoints. Contudo:

- não há matriz explícita PostgreSQL/concurrency para gravação do Pedido;
- pelo menos 16 testes usam `markTestSkipped` por ausência de stubs;
- não há prova automatizada da aba SEFAZ, contrato completo de similares ou UI fiscal completa;
- não há teste de proteção contra Documento/Duplicata pago/autorizado na reconstrução financeira;
- não há teste que obrigue falha fiscal/custo a abortar a gravação.

## Lacunas prioritárias identificadas

1. Impedir remoção/reconstrução de Documento a Pagar quando houver Duplicata paga/autorizada; definir reconciliação e atomicidade com o Pedido.
2. Tornar motor fiscal/custo obrigatório para gravação ou definir explicitamente um estado de pendência recuperável; não aceitar fallback silencioso.
3. Adicionar revisão/locks e testes PostgreSQL de concorrência para cabeçalho, itens, grade, previsões, exclusão e financeiro.
4. Implementar a aba Notas Pendentes de Entrada reutilizando `nsus`/`nsus_prod`.
5. Completar Produtos Similares com grade e saldos pedidos no prompt 14.
6. Completar o formulário fiscal e a matriz de editabilidade do prompt 15.
7. Tornar testes críticos não puláveis e acrescentar observabilidade/auditoria operacional.

## Fontes primárias

Todos os caminhos citados pertencem a `modules/estoque/cadastro-pedidos/` ou `laravel/backend` no checkout atual. Não foram consultadas fontes externas ou secundárias.
