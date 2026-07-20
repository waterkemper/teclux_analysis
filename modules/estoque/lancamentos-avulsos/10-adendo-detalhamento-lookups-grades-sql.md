# Lançamentos Avulsos — adendo de lookups, grades e SQL

## Autoridade e precedência

Este documento complementa `dossie.md` e `09-speckit-prompt.md` e é autocontido para implementar os lookups, contexto, grades e SQLs de **Estoques → Lançamentos Avulsos**. Não é necessário consultar Delphi, Wayfinder ou banco de pesquisa.

Em caso de conflito, este adendo prevalece nestes pontos:

1. Produto sem linha em `estoques` pode ser elegível quando o parâmetro canônico **Incluir Estoque Automático** estiver ativo; a trigger cria a projeção, nunca o Laravel.
2. Dados financeiros exigem permissão própria. Permissão para registrar Lançamento Avulso não concede automaticamente acesso a Valor, Financeiro, Custo Médio, Preços ou Última Compra.
3. O lookup de Produto deve conservar as mesmas colunas e possibilidades do lookup da Ficha de Produtos.

Continuam obrigatórios: fluxo síncrono, inclusion-only, preparação sem escrita, idempotência durável, autorização sensível, um único INSERT raiz e autoridade integral das triggers.

## Estado do Laravel e reuso

O módulo ainda não existe. Criar rotas, página, Policy/middleware, requests, serviços de aplicação, repository de contexto, repository de comando e testes próprios.

Reutilizar:

- `UserBranchAccessService`;
- `CatalogCodeLookup`/`CatalogStringCodeLookup` e modal paginado;
- núcleo do lookup da Ficha de Produtos;
- `LegacyTiposMovimentosRepository` e `TipoMovimentoOperacaoMapper`, envolvidos por elegibilidade específica;
- convenções/mappers da Ficha de Produtos para Movimentos;
- ErpGrid e catálogo de colunas, com catálogo novo e fixo;
- permissão financeira do domínio Estoque, explicitamente aplicada ao novo módulo;
- `SensitiveOperationAuthService`;
- `DatabaseAuditContext`.

Não reutilizar como comando:

- `LegacyProdutoLoteRepository`, que é CRUD de Lotes;
- `LegacyMarketplaceOrderRepository`, cujo payload é de venda;
- endpoints de Ficha de Produtos ou Consulta de Estoques diretamente. Extrair serviços compartilháveis ou criar providers locais.

## Rotas e respostas

Sob o middleware/ability do módulo:

| Método | Rota lógica | Finalidade |
|---|---|---|
| GET | `/cadastros/estoque/lancamentos-avulsos` | página e capabilities |
| GET | `.../lookups/filiais` | Filiais autorizadas |
| GET | `.../lookups/produtos` | lupa de Produto |
| GET | `.../lookups/produtos/resolve` | código visual/barra exato |
| GET | `.../lookups/tipos-movimentos` | Tipos elegíveis |
| GET | `.../lookups/tipos-movimentos/resolve` | Tipo exato e efeitos |
| GET | `.../lookups/lotes` | Lotes do Produto |
| GET | `.../lookups/lotes/resolve` | Lote exato |
| GET | `.../contexto` | snapshots, valores e histórico |
| POST | `.../preparar` | validação/resumo sem escrita |
| POST | `.../lancamentos` | INSERT raiz síncrono |

Lookups paginados retornam `data` e `meta.current_page/per_page/total/last_page`. Resolve exato retorna uma entidade canônica ou erro estruturado. Uma opção existente, mas inelegível, deve ser distinguida de “não encontrada”, sem vazar dados de Filial não autorizada.

## Contratos de lookup

### Filial de origem

| Item | Contrato |
|---|---|
| Dependência | usuário autenticado |
| Pesquisa | Código ou Nome |
| Colunas | Nome, Código |
| Retorno | `codigo: int`, `nome: string` |
| Filtro | somente `UserBranchAccessService` |
| Ordem | Nome normalizado, Código |
| Paginação | não; conjunto autorizado completo |

Administrador recebe todas as Filiais existentes. Usuário comum recebe somente `usuariosfiliais`. Uma única Filial pode ser pré-selecionada.

### Filial de destino

Mesmo shape da origem, acrescido dos filtros:

- Tipo é transferencial;
- destino diferente da origem;
- usuário autorizado no destino;
- Produto possui `estoques(produto, filial)`, ou **Incluir Estoque Automático** está ativo.

Se a projeção será criada pela trigger, retornar `estoque_sera_criado=true`. Mudar origem, Produto ou Tipo invalida destino.

### Tipo de Movimento

Predicados obrigatórios:

```sql
where codigo = :codigo -- somente no resolve
  and not interno
  and operacao <> '********************'
  and (inativo is null or inativo > current_date)
```

Adequar o predicado de `inativo` ao tipo real da coluna, preservando a semântica usada no cadastro.

| Item | Contrato |
|---|---|
| Pesquisa | Código, Descrição |
| Colunas | Descrição, Código |
| Retorno | Código, Descrição, Operação, Transferência, política de negativo, resumo dos efeitos |
| Paginação | 25 padrão; máximo 100 |
| Ordem | Descrição normalizada, Código |

O browser nunca envia `operacao` como autoridade. O POST relê o Tipo. `TipoMovimentoOperacaoMapper` valida estrutura e apresenta efeitos; as triggers executam o vetor.

### Produto

Reutilizar as mesmas colunas da Ficha de Produtos:

1. Código;
2. Descrição/Item;
3. Código de Barras;
4. Linha;
5. Coluna;
6. Situação/Inatividade;
7. Comissão do Grupo;
8. Comissão do Produto;
9. Busca avançada.

Metadados técnicos adicionais: `codigo` bigint canônico, `codigovisual`, referência, unidade/máscara aplicável, `composto`, `gerenciarloteevalidade`, elegibilidade e `estoque_sera_criado`.

Pesquisa: todas as modalidades da Ficha, incluindo Código interno/visual, Barras, Descrição, Linha, Coluna e avançada. Paginação 25, máximo 100. Resolve exato aceita código visual ou código de barras e aplica os mesmos filtros da lupa.

Elegibilidade:

- respeitar **lançamentos avulsos de produtos compostos**;
- Produto inativo aparece com situação, mas não é selecionável;
- deve possuir Estoque na Filial, salvo **Incluir Estoque Automático** ativo;
- Filial deve estar autorizada.

Comissões permanecem colunas do lookup, mas são protegidas conforme as permissões já aplicadas pela Ficha de Produtos.

### Lote

Dependências: Produto, Filial e Tipo já resolvidos.

| Coluna | Campo |
|---|---|
| Nº Lote | `lotes.nrlote` |
| Produto | código visual |
| Código de Barras | do Produto |
| Descrição do Produto | descrição |
| Validade | data |
| Fabricação | data |
| Inativo | situação/data |
| Fora de Linha | situação/data |
| Quantidades | nove dimensões de `estoqueslotes`, no contexto |

Pesquisa por Nº Lote; paginação 25, máximo 100; ordem Validade, ID. Retorno canônico usa `loteproduto` bigint e mantém `nrlote` como apresentação.

Regras:

- Lote pertence ao Produto;
- contexto é Produto + Filial + Lote;
- saldo zero não impede entrada ou substituição;
- para saída, preparação compara dimensões afetadas;
- inativo, fora de linha ou vencido aparece identificado, porém bloqueado;
- ausência de projeção pode ser permitida somente quando a política canônica permitir que a trigger a crie;
- não criar Lote neste módulo.

## Invalidação no cliente

| Mudança | Efeito |
|---|---|
| Filial | limpa Produto, Lote, destino, contexto e preparação |
| Produto | limpa Lote, destino dependente, contexto e preparação |
| Tipo | limpa preparação, campos incompatíveis e destino se deixar de ser transferência |
| Lote | limpa contexto de Lote e preparação |
| Data/Quantidade/Referência/valores | preserva lookups e invalida preparação |

Toda resposta contextual carrega uma versão de seleção. O cliente descarta resposta atrasada cuja versão não coincide. Registrar permanece desabilitado sem preparação válida.

## Endpoint contextual único

Entrada: `filial`, `produto`, `lote` opcional, `tipomovimento` opcional.

Saída:

- Filial/Produto/Lote/Tipo resolvidos;
- nove Quantidades atuais do Produto;
- Valores atuais quando autorizados;
- nove Quantidades do Lote quando selecionado;
- últimos dez Movimentos;
- efeitos do Tipo;
- fingerprint/context version.

As consultas internas permanecem estreitas e parametrizadas; não criar SQL monolítico. Diferenciar:

- contexto ainda não selecionado;
- Produto sem linha em Estoques;
- projeção que será criada;
- Lote sem `estoqueslotes`;
- linha existente com saldos zero.

## Cinco visões e colunas

Todas são somente leitura. Não há paginação, edição, delete ou reordenação. Histórico sempre `numero desc limit 10`.

### 1 — Movimentos

| Ordem | Campo | Título | Formato |
|---:|---|---|---|
| 1 | `data` | DATA | DD/MM/YYYY |
| 2 | `tipomovimento` | TIPO | texto 3 |
| 3 | `nrlote` | Nº LOTE | texto |
| 4 | `referencia` | REFERÊNCIA | texto 60 |
| 5 | `quantidade` | QTDE | 3 decimais conforme máscara |
| 6 | `emestoque` | ESTOQUE | 3 decimais |
| 7 | `valor` | VALOR | moeda/2 decimais |
| 8 | `financeiro` | FINANCEIRO | moeda/2 decimais |

`numero` integra a row key e pode ficar oculto.

### 2 — Quantidades históricas

Data, Tipo, Nº Lote, Estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro e Danificada, nessa ordem. Cada quantidade é snapshot posterior ao Movimento.

### 3 — Valores históricos

Data, Tipo, Nº Lote, Valor, Financeiro, Preço com ICMS e Preço sem ICMS, nessa ordem.

### 4 — Quantidades atuais do Produto

Estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Reserva Prévia e Estoque Físico, nessa ordem.

### 5 — Quantidades atuais do Lote

As mesmas nove colunas do Produto, para Produto + Filial + Lote.

### Valores atuais

Cards: Custo Médio, Financeiro, Preço com ICMS, Preço sem ICMS e Última Compra.

Usuário sem permissão financeira não recebe do backend Valor, Financeiro, Custo Médio, Preços, Última Compra nem colunas equivalentes. Se o Tipo exigir entrada financeira, ele não pode concluir e deve solicitar usuário autorizado.

## SQLs de referência

Parâmetros e shapes são normativos; a escrita em Query Builder pode variar.

### Snapshot do Produto

```sql
select e.emestoque, e.reservado, e.transito, e.demonstracao,
       e.conserto, e.futuro, e.danificada, e.reservaprevia,
       e.estoquefisico, e.precocomicms, e.precosemicms,
       e.financeiro, e.valorultimacompra
from estoques e
where e.produto = :produto
  and e.filial = :filial
```

Cardinalidade 0..1, sem lock na leitura. Custo Médio deve usar o cálculo canônico já aceito no domínio e nunca atualizar projeção.

### Snapshot do Lote

```sql
select el.emestoque, el.reservado, el.transito, el.demonstracao,
       el.conserto, el.futuro, el.danificada, el.reservaprevia,
       el.estoquefisico
from estoqueslotes el
where el.produto = :produto
  and el.filial = :filial
  and el.lote = :lote
```

Cardinalidade 0..1, sem lock na leitura.

### Últimos dez Movimentos

```sql
select m.numero, m.data, m.tipomovimento, m.referencia,
       m.quantidade, m.emestoque, m.reservado, m.transito,
       m.demonstracao, m.conserto, m.futuro, m.danificada,
       m.valor, m.financeiro, m.precocomicms, m.precosemicms,
       l.nrlote
from movimentos m
left join lotes l on l.lote = m.loteproduto
where m.produto = :produto
  and m.filial = :filial
order by m.numero desc
limit 10
```

Cardinalidade 0..10, sem lock. Não aplicar filtro de Lote ao histórico agregado do Produto+Filial.

### INSERT raiz

```sql
insert into movimentos (
  produto, filial, data, tipomovimento, quantidade,
  valor, precosemicms, precocomicms, aliquotaipi,
  referencia, trffilial, loteproduto,
  usuariologado, usuarioautorizacao, valorultimacompra
) values (
  :produto, :filial, :data, :tipomovimento, :quantidade,
  :valor, :precosemicms, :precocomicms, :aliquotaipi,
  :referencia, :trffilial, :loteproduto,
  :usuariologado, :usuarioautorizacao, :valorultimacompra
)
returning numero
```

É allowlist máxima. Campos condicionais incompatíveis são omitidos/nulos. Nunca enviar `operacao`, `lancto`, saldos, Financeiro calculado, Grupo, derivados, flags de bypass ou timestamps.

## Preparação e concorrência

`POST preparar`:

- valida capabilities, Filiais, Produto, Tipo, Lote, Data e campos;
- relê parâmetros;
- carrega contexto;
- monta resumo de efeitos declarados;
- informa necessidade de prova;
- emite token curto ligado a operador, payload, identidades, parâmetros e fingerprint;
- não escreve, não bloqueia e não abre transação duradoura.

`POST lancamentos` relê tudo dentro da transação. Se saldos/contexto mudaram, retorna HTTP 409 `contexto_alterado` com contexto novo e não grava. Mudança de Tipo, autorização, entidade ou parâmetro também invalida.

Idempotência: unicidade operador + UUID e hash do payload normalizado. Mesma chave/hash concluída retorna o mesmo resultado com `replayed=true`; outro hash retorna 409. Reserva, INSERT e conclusão são atômicos.

## Transação trigger-aware

Ordem:

1. iniciar transação curta;
2. reservar/reconhecer idempotência;
3. aplicar `DatabaseAuditContext`;
4. reler/revalidar entidades, parâmetros, contexto e prova;
5. inserir uma linha raiz;
6. deixar triggers bloquearem `estoques` e `estoqueslotes`, calcularem e criarem derivados;
7. ler identificação mínima e concluir idempotência;
8. commit;
9. fora da transação, recarregar contexto completo.

Não adicionar locks aplicativos em ordem diferente. Não usar `MAX()+1`. Não escrever em `estoques`, `estoqueslotes`, `movimentoslotes` ou Movimentos derivados.

Resposta identifica raiz e derivados classificados como `transferencia`, `componente` ou `negativo`. Derivado em outra Filial aparece no resumo, não no histórico da origem. A raiz recém-criada recebe destaque após recarga.

## Critérios de aceite

1. Lupa e resolve exato aplicam os mesmos predicados.
2. Nenhuma Filial não autorizada aparece nem é aceita no servidor.
3. Produto conserva as colunas do lookup da Ficha.
4. Produto/Filial sem projeção só é elegível com Estoque Automático ativo e é marcado.
5. Tipo interno, inativo ou sentinela é rejeitado.
6. Lote pertence ao Produto; vencido/inativo/fora de linha é bloqueado; saldo zero permite entrada.
7. As cinco visões possuem exatamente as colunas e ordem definidas.
8. Histórico é imutável, últimos dez por Produto+Filial, `numero desc`.
9. Backend omite dados financeiros para usuário sem permissão.
10. Contexto diferencia ausência, criação futura e saldo zero.
11. Mudança dependente invalida preparação e respostas atrasadas são descartadas.
12. Contexto concorrente alterado retorna 409 sem INSERT.
13. Mesmo UUID/payload produz um único Movimento.
14. Laravel insere somente a raiz; triggers produzem projeções/derivados.
15. Após commit, todas as visões são relidas do servidor.
16. Não existem rotas de editar, excluir ou estornar.

## Testes obrigatórios

### Unitários

- elegibilidade de Filial, Produto, Tipo e Lote;
- operação posicional e forma dinâmica;
- allowlist/normalização/hash;
- invalidação do estado React;
- mappers e catálogos das cinco visões;
- redaction financeira;
- classificação de erros SQLSTATE.

### Feature

- página/Policy/capabilities;
- cada lookup, paginação, resolve e motivo de inelegibilidade;
- paridade de colunas com Ficha de Produtos;
- Filiais origem/destino;
- contexto completo e sem contexto;
- usuário com/sem permissão financeira;
- preparação, stale e `contexto_alterado`;
- prova sensível;
- replay e conflito idempotente;
- ausência de rotas CRUD.

### Integração PostgreSQL real

- `+`, `-`, `=` e `C`;
- transferência;
- Produto composto;
- negativo rejeitado e compensado;
- Produto/Lote com criação automática permitida;
- `movimentoslotes` e `estoqueslotes`;
- rollback integral em erro;
- concorrência/idempotência;
- Auditoria, operador e autorizador;
- teste arquitetural provando ausência de writes aplicativos nas projeções.

SQLite pode apoiar testes de HTTP/mapeamento, mas não comprova triggers, locks ou atomicidade do legado.
