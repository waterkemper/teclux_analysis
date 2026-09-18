# Prompt corretivo — Cadastro de Inventário Laravel

## Contexto

Revise a implementação existente do Cadastro de Inventário no commit `69a7ccd48` do checkout Laravel, usando como contrato:

- `modules/estoque/cadastro-inventario/01-speckit-prompt-cadastro-inventario.md`;
- `modules/estoque/cadastro-inventario/README.md`;
- `specs/478-cadastro-inventario/`;
- o manifesto e o snapshot em `modules/estoque/cadastro-inventario/schema/`.

Não reabra, peça para verificar ou dependa diretamente dos fontes Delphi. Corrija o código existente; não crie uma segunda implementação paralela.

## Diagnóstico confirmado

A implementação não está pronta para aceite:

1. `InventarioConsultaF6Service` retorna as linhas em uma chamada síncrona. O controller não despacha job, não entrega `poll_url`/`cancel_url` de uma operação e não usa `AbortController`; o botão Cancelar não interrompe a consulta do banco.
2. `InventarioColetaService` aplica evento/arquivo sem validar que a sessão pertence ao Inventário e à Filial informados, sem validar estado `ativa`, sem bloquear sessão finalizada e sem transação única entre idempotência, evento e item.
3. Eventos repetidos do mesmo Produto fazem `upsert` da quantidade recebida e podem sobrescrever a quantidade anterior. Bipagens aceitas devem somar a quantidade no Item.
4. `aplicarArquivo` não recebe/vincula `sessao_id`, não arquiva o arquivo, não cria eventos idempotentes por linha/grupo, faz uma gravação por linha e não retorna erros parciais.
5. `InventarioArquivoColetaParser` descarta linhas inválidas e converte quantidade inválida silenciosamente para zero usando `float`. O contrato exige erro/pêndencia visível por linha, decimal exato e aplicação das linhas válidas.
6. A página `Coleta.tsx` não usa câmera, não possui seleção real de arquivo, não sincroniza a fila offline, não exibe conflitos detalhados e envia arquivo com contrato divergente no placeholder (`; ` em vez de `,`).
7. `InventarioProductFilterCompiler` aceita apenas `produtos`; `Index.tsx` não envia `productRules`/`exceptByTab`. A geração pelos filtros atuais não representa o painel Delphi/Laravel.
8. As migrations e repositórios novos introduzem `Schema::hasTable`, `Schema::hasColumn` e ramificações por `getDriverName`, contrariando o requisito deste módulo. Não testar driver, existência de tabela ou coluna em runtime/migration para decidir o comportamento.
9. O snapshot autoritativo ainda lista as relações legadas principais como ausentes. Não declarar SQL, mapper ou migration legado concluído enquanto não houver nova captura autoritativa compatível.
10. `deleteItem` não recebe usuário, não valida Filial/escopo no controller e não registra a alteração. Toda mutação deve validar o agregado e produzir auditoria conforme o padrão do projeto.

## Objetivo da correção

Entregar o Cadastro de Inventário com comportamento observável equivalente ao Delphi, mantendo as melhorias Laravel de segurança, cancelamento, concorrência, mobile e consultas set-based. A correção deve abranger desktop, tablet e celular no mesmo app Inertia, sem alterar o significado de A/P/T, F6, F8, F9, junção ou Sessão de Coleta.

## Requisitos obrigatórios

### 1. Gate de schema e SQL

- Revalidar o snapshot por ferramenta de captura fora do request. Se `inventario`, suas tabelas filhas, estoque, movimentos, Filial ou parâmetros continuarem ausentes, manter o gate bloqueado e produzir erro/documentação explícita; não inventar DDL, colunas, FKs, joins ou SQL.
- Remover do escopo do módulo todos os testes de driver e chamadas `hasTable`, `hasColumn`/`Schema::has*` usados para decidir execução. Usar contratos/adapters configurados e migrations determinísticas, com fixtures de teste isoladas quando necessário.
- Usar apenas projeção explícita, binds e whitelist. Relações obrigatórias comprovadas como `NOT NULL`/FK devem ser `INNER JOIN`; `LEFT JOIN` só com opcionalidade comprovada.
- Geração e enriquecimento devem ser set-based: `IN`, `ANY(array)` ou `unnest`, conforme o tipo. Proibir query por item, loop de `upsert` e concatenação de SQL.

### 2. F6, relatório e cancelamento

- Antes do primeiro `await`, mudar o estado para `running` e renderizar Cancelar.
- Criar o fluxo padrão do projeto para consulta pesada: `trace_id`, dispatch/poll, `cancel_url`, `AbortController`, descarte de respostas obsoletas e estados `vazio`, `erro`, `timeout`, `cancelado` e `concluído`.
- O cancelamento deve chegar ao servidor e interromper job/consulta no banco quando suportado; abortar somente o navegador não atende ao requisito.
- O relatório acionado por F6 deve usar o mesmo catálogo de colunas, ordenação, agrupamento, totais, exportação e leiaute do grid. Não criar pipeline de relatório paralelo nem usar F7.

### 3. Sessão de Coleta

- Toda operação de pausar, retomar, evento, arquivo e finalizar deve carregar a sessão por `session_id`/`sessao_id` e validar, no servidor, Inventário, Filial, usuário autorizado e transição de estado.
- Permitir vários usuários/dispositivos na mesma sessão, mas bloquear eventos em sessão finalizada e impedir finalizar com pendência, conflito ou fila não sincronizada.
- Processar cada evento dentro de unidade atômica com idempotência durável. O mesmo `event_id` deve devolver o resultado original sem reaplicar quantidade.
- Câmera, manual e arquivo devem passar pelo mesmo resolver de produto e pelos mesmos parâmetros `PesquisaPadraoProdutoCodigoBarras`/`PermitirProdutoAlfanumerico`.
- Bipagens aceitas do mesmo Produto devem acumular quantidade; a edição de lote continua posterior e deve fechar a soma do Item.
- Registrar usuário, dispositivo, canal, horário, código recebido, quantidade, resultado e mensagem. Erros e conflitos também devem ser persistidos e exibidos.

### 4. Importação TXT/arquivo

- Aceitar o formato legado `codigo,quantidade`, sem lote, com decimal conforme o padrão de entrada do sistema. Não usar `float` para regra de negócio.
- Retornar resultado por linha/grupo com número da linha, código, quantidade normalizada, status e mensagem. Linhas válidas podem ser aplicadas; inválidas ficam em erro/pêndencia visível e nunca são descartadas silenciosamente.
- Somar códigos repetidos antes da aplicação, usando decimal exato e eventos com identificador derivado estável de sessão + checksum + código/grupo.
- Receber a sessão explicitamente, calcular checksum, arquivar o arquivo no disk privado e persistir metadados. Reenviar o mesmo arquivo para a mesma sessão deve ser no-op idempotente.
- Aplicar em lote, dentro de transação apropriada, sem N+1. O arquivo não pode contornar autorização, estado ou auditoria da sessão.

### 5. Tela mobile/tablet

- Implementar câmera como ação principal com tratamento de permissão/indisponibilidade e fallback claro para digitação e importação.
- Usar controles grandes, fluxo vertical no celular e duas colunas câmera/lista no tablet quando houver espaço. Exibir último Produto, quantidade, itens aplicados, pendências, conflitos, erro por linha e estado de sincronização.
- Persistir a fila offline com os mesmos `event_id`, sincronizar automaticamente ao reconectar, permitir retry e não oferecer F8/processamento offline.
- Corrigir encoding das mensagens exibidas e usar exatamente o contrato `codigo,quantidade`.

### 6. Cadastro, filtros, grid e autorizações

- Serializar e validar a lista completa de filtros do painel, inclusive exceções e seleções múltiplas; o servidor deve compilar uma whitelist tipada e persistir os filtros do cabeçalho conforme o contrato.
- Preservar F9 no modal padrão, Enter na chave, chave primária protegida após carga, situação em radio buttons e breadcrumb padrão.
- Usar `ErpGridShell`/catálogo vigente com ordenação, paginação, personalização, preferências, foto e exportação. O grid principal não deve permitir edição inline; item/lote continua em modal.
- Toda mutação deve validar Inventário A, Filial autorizada, revisão concorrente e usuário no command/repository. Exclusão, correção de quantidade e redução devem ter confirmação e auditoria; correções que reduzam quantidade exigem motivo.
- Preservar a matriz de acesso do módulo, a permissão própria de finalizar coleta, a autorização contextual do F8 e a junção administrativa apenas entre Inventários A da mesma Filial.

## Testes de aceite obrigatórios

Adicionar ou corrigir testes reais, não apenas testes que verificam booleanos locais:

- Feature: F6 inicia operação assíncrona, exibe Cancelar imediatamente, cancela no servidor, descarta resposta obsoleta e mantém filtros.
- Feature: sessão rejeita sessão/Filial divergente, evento após finalização, transição inválida e finalização com pendência/conflito.
- Feature: dois envios do mesmo `event_id` e dois envios do mesmo arquivo não duplicam quantidade.
- Feature: duas bipagens do mesmo Produto somam; produto inválido e quantidade inválida geram erro auditável sem criar Item.
- Unit/Feature: parser preserva decimal, informa linha inválida, soma repetidos e não converte lixo para zero.
- Feature: arquivo é arquivado e seus eventos são consultáveis por sessão/dispositivo/usuário.
- UI: câmera/fallback manual, input de arquivo, fila offline, retry/sync, pendências/conflitos e layout mobile/tablet.
- Feature: filtros completos chegam ao compiler; geração é deduplicada e não altera quantidades existentes.
- Query budget: leitura de itens/lotes e aplicação de arquivo permanecem set-based e não crescem linearmente em número de itens.
- Segurança: acesso cruzado por número, Filial ou `sessao_id` retorna 403/422 de negócio e não altera dados.

Executar PHP somente pelo mecanismo oficial do repositório (`./scripts/docker-php.sh`) e executar Vitest com a configuração correta do checkout atual. Corrigir primeiro qualquer referência de setup que aponte para outro checkout (`C:\teclux_cloud`) antes de considerar os testes válidos.

## Critério de conclusão

Não marcar a implementação como pronta enquanto qualquer item acima estiver pendente, enquanto o gate do schema continuar bloqueado sem evidência nova, enquanto houver `hasTable`/`hasColumn`/teste de driver no módulo, ou enquanto os testes de F6 e coleta não comprovarem os contratos completos. Ao finalizar, atualizar `specs/478-cadastro-inventario/tasks.md`, registrar os arquivos alterados e anexar a saída dos testes executados.
