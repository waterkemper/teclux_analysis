Type: task
Status: resolved
Blocked by: 01

## Question

Qual é o estado atual implementado no Laravel para Lançamentos Avulsos e quais componentes/endpoints/repositories/testes de lookup, contexto, grades e SQL já existem, podem ser reutilizados ou divergem do inventário autoritativo?

## Answer

### Estado atual

Lançamentos Avulsos **ainda não está implementado** no Laravel atual. Não foram encontrados:

- rota, item de menu ou página React/Inertia;
- Model/Policy/ability/middleware específicos;
- Controller, FormRequest, serviço de preparação/comando ou repository de escrita;
- endpoints de Tipo, destino, contexto, preparar ou registrar;
- configuração de operação sensível para este módulo;
- armazenamento de idempotência próprio;
- testes unitários, feature ou PostgreSQL do fluxo.

As únicas referências a “avulsos” pertencem à Ficha de Produtos como filtro de consulta. Nenhum código encontrado deve ser confundido com o comando de inclusão.

### Matriz de reaproveitamento

| Necessidade | Estado existente | Decisão de reaproveitamento |
|---|---|---|
| Filiais autorizadas | `UserBranchAccessService` retorna códigos/opções, memoiza por request e trata Administrador | **Reutilizar diretamente** no novo serviço; criar endpoints do módulo |
| Lookup Produto | Ficha de Produtos possui lookup paginado e resolve exato por código visual/barra; Consulta de Estoques possui lookup contextual rico | **Extrair/reutilizar núcleo**, sem chamar endpoint de outra tela |
| Lookup Lote | Ficha de Produtos possui lookup paginado por Produto | **Reutilizar padrão/mapper**, ampliar contrato e criar resolve exato |
| Lookup Tipo | `LegacyTiposMovimentosRepository`, `TipoMovimentoService` e componentes de código curto existem | **Criar provider específico** com predicados de elegibilidade |
| Operação posicional | `TipoMovimentoOperacaoMapper` e testes unitários cobrem as 20 posições | **Reutilizar diretamente** para apresentação/forma; trigger segue autoridade |
| Histórico | `LegacyFichaProdutosRepository`, service, row mapper e grid catalog leem Movimentos/Lotes | **Reutilizar conceitos/mapper**, preferir query estreita dedicada aos últimos dez |
| Snapshot Produto/Lote | Consulta de Estoques e Ficha possuem várias leituras, mas não o shape exato do comando | **Criar repository de contexto dedicado** |
| Grid React | infraestrutura ErpGrid e catalogs de Ficha/Consulta já existem | **Reutilizar componente/base**, com catálogo fixo do módulo |
| Segurança financeira | abilities `visualizar_financeiro` em Ficha/Consulta | **Definir ability do módulo ou política compartilhada explícita** |
| Filial no browser | lookups/props de Ficha e Consulta já carregam autorizadas | **Reutilizar serviço**, nunca confiar no código enviado |
| Auditoria | `DatabaseAuditContext` e auditoria por trigger já existem | **Reutilizar diretamente** no POST |
| Autorização sensível | framework de prova, catálogo, cache e validação de perfil existe | **Adicionar definição Lançamentos Avulsos/Gerente de Estoque** |
| Escrita trigger-aware | Marketplace possui precedente de INSERT em `movimentos` e ADR | **Usar como precedente arquitetural**, não reutilizar payload/repository de venda |
| Idempotência | há implementações locais em Marketplace/Device Gateway/Help | **Não há serviço genérico adequado**; criar persistência durável específica/compartilhável |

### Produto: aderências e divergências

O endpoint da Ficha de Produtos já oferece:

- paginação de 1..100;
- Código interno/visual, Descrição, Código de Barras, Linha e Coluna;
- busca por Código, Barras, Descrição, grades, busca avançada e todos;
- resolve exato por código visual ou código de barras;
- ID bigint canônico e flag `controla_lote_validade`;
- sanitização de encoding e metadados de paginação.

Divergências para Lançamentos Avulsos:

- lookup da Ficha exclui inativos por padrão, enquanto o Delphi apenas exibe situação; a política final deve ser explícita;
- não aplica o parâmetro `lancamentos_avulsos_de_produtos_compostos`;
- não devolve `composto`, referência, unidade e todos os metadados exigidos pela forma;
- não valida Produto+Filial/`estoques`;
- busca usa combinações de `LIKE`/`p.busca`, não replica exatamente o ranking full-text Delphi;
- as colunas de comissão são específicas da Ficha e não pertencem a Lançamentos Avulsos.

O lookup rico da Consulta de Estoques inclui contexto de Filial, Estoque e preços, mas possui regras próprias de consolidação, situação e manifestação de colunas. Deve fornecer código reutilizável somente após separar um contrato de Produto genérico do contrato específico daquela tela.

### Lote: aderências e divergências

`FichaProdutosController::lookupLotes` já:

- exige Produto;
- pagina;
- pesquisa `nrlote`;
- retorna ID interno, Produto, Nº Lote, fabricação e validade.

Faltam:

- resolve exato por Produto + Nº Lote/ID;
- colunas Inativo e Fora de Linha;
- ordenação por Validade seguida de chave estável (hoje ordena por `lote`);
- vínculo com Filial/`estoqueslotes` e as nove quantidades;
- estado “lote existe, mas não há projeção nessa Filial”;
- garantia server-side de que o Lote recebido pertence ao Produto.

`LegacyProdutoLoteRepository` é CRUD do cadastro e contém geração de PK por `MAX(lote)+1`; não deve ser reutilizado no comando. Lançamentos Avulsos é somente consumidor de Lote.

### Tipo de Movimento: aderências e divergências

`LegacyTiposMovimentosRepository` resolve código normalizado, retorna Descrição, Transferência, Inativo, Interno, política de negativo e Operação de 20 posições. O lookup genérico é paginado e pesquisável por Código/Descrição. `TipoMovimentoOperacaoMapper` já interpreta o vetor.

Porém:

- o lookup genérico não filtra `not interno`;
- não exclui a sentinela `********************`;
- não devolve efeitos/transferência no row da lupa;
- `assertCanUseInNewMovimento` verifica apenas inexistência e Inativo, não Interno/sentinela;
- o cadastro permite finalidades mais amplas que a lupa de Lançamentos Avulsos.

Logo, criar query/service específico do módulo sobre o repository ou extrair um resolver elegível compartilhado. O POST deve reler a linha completa, não aceitar Operação enviada pelo browser.

### Contexto, grades e SQL

`LegacyFichaProdutosRepository` já seleciona:

- `numero, lancto, data, processamento`, Tipo e Descrição;
- Filial/Nome, Lote/Nº Lote;
- Quantidade, Operação, Referência;
- nove snapshots;
- Valor, Financeiro, preços e IPI;
- executor e autorizador.

É mais rico que as três grades Delphi e possui mappers, catálogo e proteção de campos financeiros. Entretanto, é relatório paginado por período, Filiais e perspectiva, com ordem crescente `filial, produto, data, lancto, numero`. Não deve ser chamado com parâmetros artificiais para simular “últimos dez”. Criar método/repository estreito por Produto+Filial, `numero desc limit 10`, podendo compartilhar row mapper e convenções.

Não existe leitura única que devolva exatamente:

- snapshot atual do Produto;
- snapshot do Lote;
- Valores atuais;
- últimos dez Movimentos;
- metadados de Produto/Tipo;
- versão/fingerprint de preparação.

O novo endpoint de contexto deve compor essas leituras sem N+1. Os grids devem ter catálogo próprio com ordem fixa; Ficha de Produtos permite extrato amplo e não é substituta da UI do comando.

### Autorização, auditoria e idempotência

- `UserBranchAccessService` é a fonte correta para origem e destino, inclusive Administrador.
- O framework de operação sensível suporta perfil legado, prova, auditoria e vínculo contextual, mas a configuração atual só usa `gerenteestoque` em outra operação. Deve ser registrada uma definição própria para Lançamentos Avulsos.
- `DatabaseAuditContext::applyForWebRequest()` é o precedente correto antes da escrita.
- Não há componente durável genérico de idempotência adequado ao comando. Caches de Help e outboxes de Marketplace não satisfazem atomicidade com `movimentos`.
- O INSERT de Marketplace confirma que o projeto aceita escrita trigger-aware em PostgreSQL, mas possui payload e fallback SQLite específicos. Lançamentos Avulsos precisa de repository próprio, sem `MAX()+1` no PostgreSQL e sem writes nas projeções.

### UI reutilizável

Podem ser reutilizados:

- `CatalogCodeLookup`/`CatalogStringCodeLookup` para resolve digitado + lupa;
- convenções de modal paginado da Ficha/Consulta;
- ErpGrid e manifests/catalogs;
- formatação e sanitização já usadas em Estoque;
- padrões de abort/cancelamento de requests e recarga síncrona.

Não há página-base de Lançamentos Avulsos pronta. O novo formulário precisa administrar invalidação em cascata Filial → Produto → Lote/contexto e Tipo → destino/campos, preparação explícita, confirmação e POST sem edição posterior.

### Testes existentes aproveitáveis

Há bons precedentes:

- `FichaProdutosProdutoLookupTest`;
- `FichaProdutosLotesPerspectivaTest`;
- testes de Filiais/Produto da Consulta de Estoques;
- `TipoMovimentoOperacaoMapperTest`;
- testes de access services;
- testes de auditoria por trigger;
- testes de idempotência do Marketplace.

Nenhum cobre o novo módulo. Serão necessários testes específicos de rota/Policy, lookups e resolve, autorização de Filiais, shapes das cinco visões, invalidação do frontend, preparação, prova sensível, replay idempotente e integração PostgreSQL real observando raiz, derivados, projeções e rollback.

### Estado real de partida

O módulo parte de **zero na orquestração**, mas não de zero na infraestrutura. O maior reaproveitamento seguro está em Filiais autorizadas, componentes de lookup/grid, interpretação do Tipo, leitura/mapeamento de Movimentos, segurança financeira, prova sensível e Auditoria. O que precisa ser novo é o limite de aplicação: endpoints próprios, contrato contextual, elegibilidade de lookup, preparação, idempotência e repository trigger-aware de uma única linha raiz.
