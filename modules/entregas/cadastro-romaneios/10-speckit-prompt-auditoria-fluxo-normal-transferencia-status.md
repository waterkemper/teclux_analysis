# Prompt para `/speckit.specify` — auditoria do fluxo Normal/Transferência e situações

```text
/speckit.specify

Este é um prompt novo, autocontido e pós-implementação. O prompt 04 já foi executado e não deve ser reexecutado. O prompt 09 também já foi executado e tratou a correção específica da conferência por chave versus chave + volume. Analise o checkout Laravel atual e especifique somente os ajustes ainda necessários para o fluxo completo do Cadastro de Romaneios nos tipos Normal e Transferência. Não implemente nesta execução.

Não consultar, não exigir e não mandar o Cursor procurar o código-fonte Delphi. As conclusões do legado já foram pesquisadas por esta auditoria e estão consolidadas nos documentos de autoridade abaixo. O Cursor deve usar esses documentos como evidência pronta, conferir o snapshot versionado e comparar com o checkout Laravel atual.

## Objetivo

Produzir uma especificação corretiva que feche a paridade funcional entre:

1. cadastro do mestre e inclusão unitária/múltipla de Documentos Fiscais;
2. distinção entre Romaneio Normal (`romaneios.tipo = 'N'`) e Transferência (`romaneios.tipo = 'T'`);
3. conferência de Documentos Fiscais (“conferência de notas”);
4. conferência da unidade de volume, já detalhada no prompt 09;
5. cálculo, apresentação, capabilities e transições da Situação do Romaneio;
6. efeitos de ROS, RPS, ROE e ROP no PostgreSQL compartilhado.

A especificação deve corrigir o Laravel atual sem criar uma segunda fonte de verdade, sem portar a máquina de estados para PHP e sem copiar bugs ou limitações do legado.

## Autoridades obrigatórias

- `/home/tecsoft/projects/teclux_cloud/modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md`;
- `/home/tecsoft/projects/teclux_cloud/modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md`;
- `/home/tecsoft/projects/teclux_cloud/modules/entregas/cadastro-romaneios/modelo-dominio-coexistencia-transacoes.md`;
- `/home/tecsoft/projects/teclux_cloud/modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md`;
- `/home/tecsoft/projects/teclux_cloud/modules/entregas/cadastro-romaneios/schema/README.md`, JSON do snapshot e `functions-2026-08-01.sql`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Application/Entregas/Romaneios/Commands/Handlers/CreateRomaneioHandler.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Application/Entregas/Romaneios/Commands/Handlers/UpsertRomaneioItemHandler.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Application/Entregas/Romaneios/Commands/Handlers/IncluirMultiplosItensHandler.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Application/Entregas/Romaneios/CadastroRomaneiosElegibilidadeService.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Application/Entregas/Romaneios/CadastroRomaneiosOperacoesGuard.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Infrastructure/Persistence/Legacy/Entregas/LegacyRomaneioSituacaoGateway.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Infrastructure/Persistence/Legacy/Entregas/LegacyRomaneioAggregateReadRepository.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosInclusaoMultiplaRomaneioContextService.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosAuthorizationService.php`;
- `/home/tecsoft/projects/teclux_cloud/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx`;
- `/home/tecsoft/projects/teclux_cloud/backend/resources/js/Pages/Entregas/Romaneios/components/RomaneioCabecalhoForm.tsx`;
- `/home/tecsoft/projects/teclux_cloud/backend/resources/js/Pages/Entregas/Romaneios/hooks/useCadastroRomaneiosOperacoes.ts`;
- `/home/tecsoft/projects/teclux_cloud/docs/architecture/entregas-cadastro-romaneios-operacoes.md`.

As evidências consolidadas nos documentos `modules/` são suficientes. Se o checkout divergir delas, classifique o achado como `DIVERGENTE`, `POSSÍVEL BUG ATUAL`, `NÃO LOCALIZADO` ou `DECISÃO NOVA`; não peça investigação adicional do Delphi.

## Contrato funcional consolidado

### Regras comuns

- O agregado canônico é `romaneios` + `romaneiosnotas` e os documentos fiscais compartilhados. Não criar tabelas Cloud paralelas para mestre, item, situação ou conferência.
- O tipo é `N` Normal ou `T` Transferência. Depois do primeiro item o tipo fica imutável, no frontend e no backend.
- Um Romaneio precisa ter ao menos um item para ser gravado. O documento fiscal cancelado não pode ser incluído nem conferido.
- A identidade do item é `(romaneio, dadofiscal)`. O Documento Fiscal é a unidade da conferência de notas; a unidade da conferência de volumes é expandida a partir de `volumesdadosfiscais`.
- A classificação de Transferência usa a autoridade PostgreSQL `ehnotafiscalsaidatransferencia(codigofiscal)`. Não substituir essa regra por texto, código fiscal hard-coded ou apenas um filtro de tela.
- A Situação do Romaneio deve ser obtida/recalculada por `Atualizar_situacao_romaneio(numero)`, que delega a `situacao_romaneio(numero)`. A Situação por Documento deve usar `situacao_romaneio_saida(numero, dadofiscal)`. PHP pode proteger pré-condições da operação, mas não pode inventar uma máquina de estados concorrente.

### Normal (`tipo = 'N'`)

- Representa a saída para entrega ao cliente. Na inclusão nova, o frete inicia como Emitente (`frete = '0'`). O backend deve aplicar o mesmo default se o campo não vier no payload; não usar Destinatário como fallback para Normal.
- Só aceita Documento Fiscal que não seja classificado como saída de Transferência.
- A conferência de notas seleciona Documentos Fiscais ativos do Romaneio. A leitura de volume usa a chave NF-e (`dadosfiscais.chv_nfe`) e consome uma unidade pendente por leitura, conforme o contrato do prompt 09.
- A conferência usa `ptipo = 'ROS'`, exceto quando a Situação corrente for `PASSAGEM`, caso em que usa `ptipo = 'RPS'`. `ptipo` é o tipo do registro de conferência; não é o mesmo conceito que `romaneios.tipo`.
- Sem trânsito, a função canônica distingue `ABERTA`, `CONFIRMADA PARCIAL` e `CONFIRMADA` conforme existam Documentos/volumes não conferidos e conferidos.
- Com usuário e data de trânsito, a função distingue `EM TRÂNSITO`, `ENTREGUE PARCIAL` e `ENTREGUE` conforme os itens tenham recebimento ou justificativa. Por Documento, `situacao_romaneio_saida` também pode retornar `ENTREGA NÃO EFETUADA` quando houver justificativa.
- `Liberar entrega` é permitido somente para Normal em `CONFIRMADA`; `Reter entrega` somente para Normal em `EM TRÂNSITO`. Recebimento e justificativa são operações de item de Normal, nas situações devolvidas pela função canônica.

### Transferência (`tipo = 'T'`)

- Representa saída entre Filiais. Na inclusão nova, o frete inicia como Destinatário (`frete = '1'`).
- Só aceita Documento Fiscal classificado pela função de Transferência.
- Todos os Documentos Fiscais do mesmo Romaneio devem manter a mesma Filial de origem (`dadosfiscais.filialemissao`) e o mesmo destino/cliente. Essa regra vale para criação com vários itens, inclusão unitária e inclusão múltipla; não basta validá-la somente na modal F6.
- A primeira inclusão estabelece as âncoras de origem e destino/cliente. Inclusões posteriores devem ser rejeitadas atomicamente se divergirem delas, tanto no lookup quanto no comando final sob lock.
- A saída é conferida como `ROS`; a chegada em outra Filial pode produzir `ROE`. Quando a rota passa por outra Filial, o domínio pode produzir `ROP` e `RPS`. O prompt 09 continua sendo a autoridade para a composição da chave de leitura de volume de Transferência: `chv_nfe || lpad(nrvolume, 3, '0') || lpad(volume, 3, '0')`.
- Na função canônica, Transferência não deve ser tratada como Normal: antes da saída completa aparecem `ABERTA`/`CONFIRMADA PARCIAL`; após a saída, a situação global deriva das conferências `ROE`, das entradas de Transferência ativas em `notaspag` e das situações por Documento. Os resultados observados são `EM TRÂNSITO`, `PASSAGEM`, `ENTREGUE PARCIAL` e `ENTREGUE`, além de `FECHADA` quando existe pagamento. `CONFIRMADA` não deve ser presumida como etapa de liberação de Transferência só porque existe na matriz de Normal.
- `Liberar entrega`, `Reter entrega`, recebimento e justificativa de entrega do fluxo de venda não são operações de Transferência. A UI deve ocultar/desabilitar capabilities incorretas e o backend deve rejeitá-las de forma explícita, sem depender apenas de erro posterior.

### Fechamento comum

- `FECHADA` tem precedência quando o Romaneio está quitado/pago, conforme `situacao_romaneio`; mestre, itens, conferência e efeitos financeiros ficam protegidos pelas regras de editabilidade.
- Os estados `CANCELADO`/ausência de documento ativo não podem ser apresentados como um fluxo normal de conferência; documente o comportamento real do snapshot e trate documento cancelado como inelegível.
- Cada comando mutável é uma transação única, idempotente, auditável, com revisão otimista e locks determinísticos. Após os efeitos, reler situação e capabilities do PostgreSQL.

## Comparação obrigatória com o Laravel atual

Registrar arquivo, linha/componente, evidência, classificação e correção para pelo menos estes achados:

1. `CreateRomaneioHandler.php:79-83` usa fallback de frete `'1'` para qualquer tipo; isso diverge do default Emitente de Normal quando o cliente omite o campo.
2. `CreateRomaneioHandler.php:86-108` valida elegibilidade dos itens iniciais sem passar âncoras de Transferência; uma criação `T` com vários itens pode não impor mesma origem/cliente dentro do lote.
3. `UpsertRomaneioItemHandler.php:71-77` chama a elegibilidade sem `filialAncora`/`clienteAncora`; a inclusão unitária de um segundo item `T` fica menos restrita que a inclusão múltipla.
4. `IncluirMultiplosItensHandler.php:62-103` já obtém âncoras e valida o lote; preservar essa proteção, mas extrair um contrato único para criação, inclusão unitária, F6 e gravação final, evitando três regras diferentes.
5. `CadastroRomaneiosOperacoesGuard.php:65-75,178-185` e `LegacyRomaneioSituacaoGateway.php` misturam leitura de `romaneios.situacao_romaneio`, derivação de `ptipo` e autorização. A especificação deve revalidar a Situação canônica sob lock antes de decidir a operação; `RPS` só decorre de `PASSAGEM` e não deve ser confundido com tipo `T`.
6. `CadastroRomaneiosAuthorizationService.php` expõe `confirmar_recebimento` como verdadeiro para qualquer Romaneio existente, embora o guard restrinja o fluxo a Normal. Capability deve representar o contrato efetivo por tipo e situação.
7. `LegacyRomaneioAggregateReadRepository.php` lê a situação persistida diretamente e conta linhas de `volumesdadosfiscais`, não a quantidade expandida por `coalesce(nullif(volumes,0),1)`/`generate_series`. Corrigir a leitura set-based e não usar contagem de linhas como total de volumes.
8. O agregado busca o conferente apenas em `conferencia.tipo = 'ROS'`; a leitura deve considerar o tipo efetivamente aplicável ao Romaneio e não perder RPS/ROE/ROP no histórico de Transferência.
9. A implementação atual da modal e do handler de Conferência continua sujeita aos achados detalhados no prompt 09: Enter não interpreta a leitura, o estado é incrementado pelo primeiro Documento pendente, o payload não carrega a unidade `(dadofiscal,numerovolume,nrvolume)`, a gravação chama a função que marca todos os volumes e a conferência parcial é rejeitada. O prompt 10 deve integrar a correção 09 ao fluxo N/T, sem reexecutar o prompt 09 como se fosse novo.
10. `docs/architecture/entregas-cadastro-romaneios-operacoes.md` ainda descreve `incluirconferenciadocumentos` como escritor canônico da conferência interativa. Atualizar a especificação/contrato para separar inicialização comprovada da função e gravação individual de unidades, conforme o prompt 09 e o schema.

## Contratos que a especificação deve produzir

### Bootstrap e conferência de notas

O bootstrap deve devolver, em uma consulta set-based e com escopo de Filial revalidado:

- número, revisão, tipo `N`/`T`, Situação canônica e `ptipo` efetivo;
- documentos ativos elegíveis, `dadofiscal`, Filial, série/número, chave de apresentação, cancelamento e situação por Documento;
- âncoras de Transferência (origem/cliente) quando aplicável;
- contadores separados de Documentos completos/parciais e unidades conferidas/não conferidas.

A conferência de notas não pode selecionar ou marcar Documento cancelado, fora do Romaneio ou incompatível com o tipo. A chave exibida redigida é somente apresentação; matching usa a autoridade segura de chave.

### Conferência de volumes

Manter o contrato corrigido no prompt 09: uma linha por unidade esperada, chave exata por modo N/T, gravação parcial, recomeço/cancelamento distintos, payload versionado por unidade, idempotência, locks, trigger-awareness e testes PostgreSQL reais. Integrar o modo e o tipo no bootstrap; nunca inferir o modo apenas de texto redigido ou da posição da linha.

### Situação e capabilities

Produzir uma matriz explícita `tipo × situação × operação`, com origem de cada célula (`situacao_romaneio`, `situacao_romaneio_saida`, interface consolidada ou decisão nova). A matriz deve distinguir:

- edição do mestre;
- inclusão unitária e múltipla;
- conferência de notas;
- conferência de volumes;
- liberar/reter;
- recebimento/justificativa;
- impressão/histórico;
- fechamento e documento financeiro.

Capabilities são apenas uma projeção da autorização real: a UI não substitui guard, e o guard não pode anunciar operação que rejeitará para todo tipo T.

## Aceite obrigatório

Incluir testes frontend, request/handler, integração e PostgreSQL real para:

- criação N sem frete informado, criação T sem frete informado e troca de tipo antes/depois do primeiro item;
- N com documento normal, N rejeitando documento de Transferência, T rejeitando documento normal;
- criação T com itens de origens/clientes diferentes, inclusão unitária T divergente e inclusão múltipla T divergente, todos rejeitados atomicamente;
- mesma origem/cliente em T, inclusive concorrência entre dois comandos;
- matriz de estados N: ABERTA, CONFIRMADA PARCIAL, CONFIRMADA, EM TRÂNSITO, ENTREGUE PARCIAL, ENTREGUE, ENTREGA NÃO EFETUADA e FECHADA;
- matriz de estados T: ABERTA, CONFIRMADA PARCIAL, EM TRÂNSITO, PASSAGEM, ENTREGUE PARCIAL, ENTREGUE e FECHADA, validando ROS/ROE/ROP/RPS e `notaspag` de Transferência;
- conferência parcial/completa de notas e volumes, unidade repetida, chave desconhecida, documento cancelado e volume inválido;
- modo N por chave NF-e e modo T por chave + volume exatamente como no prompt 09;
- capabilities honestas: nenhuma operação de venda disponível para Transferência e nenhuma liberação/retenção indevida em situação incompatível;
- `Atualizar_situacao_romaneio` e `situacao_romaneio_saida` como autoridade, sem máquina de estados PHP paralela;
- histórico RPS/ROS/ROE/ROP, reler pós-commit, revisão obsoleta, idempotência, rollback e concorrência Delphi-equivalente/Laravel;
- query budget, ausência de N+1, cardinalidade de volumes e segurança de escopo por Filial.

## Fora de escopo

- reexecutar os prompts 04 ou 09;
- pedir acesso ou investigação do código Delphi;
- implementar código nesta execução;
- alterar PAS, DFM, funções/triggers ou migrations aplicadas;
- criar uma máquina de estados PHP ou uma segunda fonte de conferência/situação;
- corrigir bugs legados sem decisão explícita de paridade.
```
