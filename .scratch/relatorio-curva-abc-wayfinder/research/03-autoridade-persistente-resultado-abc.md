# Pesquisa — autoridade persistente do resultado da Curva ABC

- Ticket: `.scratch/relatorio-curva-abc-wayfinder/issues/03-mapear-autoridade-persistente-do-resultado-abc.md`
- Data da pesquisa: 2026-09-09
- Escopo: fontes primárias do checkout Laravel/SQL e Delphi, sem implementação.

## Classificações usadas

- **CONFIRMADO**: comportamento diretamente observado em código, migration, SQL ou snapshot de banco versionado.
- **INFERÊNCIA/RISCO**: consequência técnica derivada das fontes, mas que ainda precisa de decisão ou validação operacional.
- **LACUNA**: o checkout não contém evidência suficiente para estabelecer um contrato; não foi inventado contrato de banco.

## Conclusão executiva

1. **CONFIRMADO** — A autoridade persistente compartilhada é a coluna `public.produtos.resultadocurvaabc`: o Delphi grava nela e diversos fluxos Laravel a leem. O gerador Laravel atual não grava essa coluna; ele apenas calcula linhas pela função PostgreSQL e mantém o resultado operacional do job em cache/checkpoint.
2. **CONFIRMADO** — O único escritor explícito encontrado no checkout é `TdtmRelatorioCurvaABC.AtualizarResultadoCurvaABC`, que primeiro limpa globalmente os resultados não nulos e depois executa updates por `codigo`.
3. **CONFIRMADO** — `veiodatriggercaracteristicas` é um sinal de controle do caminho de trigger, não o resultado ABC. A trigger `produtos_antesinseriratualizar` usa o valor `true` para evitar uma propagação derivada e o redefine para `false` antes de retornar a linha.
4. **CONFIRMADO** — Alterações em `produtos` atravessam triggers derivadas e auditoria. O snapshot possui tanto a trigger legada `produtos_log` quanto `produtos_audit_log_trg`; a coexistência precisa ser considerada na gravação.
5. **INFERÊNCIA/RISCO** — Não há contrato demonstrado de lock, versionamento, mutex entre Delphi e Laravel ou atualização condicional. A sequência Delphi de limpeza global seguida de updates pode ser observada parcialmente por leitores se não estiver protegida por uma transação efetiva.
6. **LACUNA** — O checkout não prova se `perpetrar([])` efetiva um commit transacional, nem se o multi-statement de `ExecSql` é atômico no adaptador usado. Isso deve ser resolvido antes de implementar a persistência Laravel.
7. **INFERÊNCIA/RISCO** — Os modos de fornecedor/grupo/marca retornam `produto = 0` nas funções auxiliares SQL versionadas, enquanto a rotina Delphi grava esse campo como `codigo` de produto. A gravação desses modos não pode ser tratada como segura sem confirmar a definição implantada de `abc_prod` e decidir se somente modos por produto podem persistir.

## 1. Contrato persistente observado no PostgreSQL

### 1.1 Colunas e chave

**CONFIRMADO** — O snapshot autoritativo versionado em `modules/entregas/relatorio-entregas/schema/postgresql-authoritative-2026-08-19.json` identifica o banco `andra`, schema `public`, PostgreSQL `9.5.25` e uma coleta em transação somente leitura (`:1-12`). Na relação `produtos`:

- `veiodatriggercaracteristicas`: `boolean`, anulável, default `false` (`:5131-5149`);
- `resultadocurvaabc`: `character(1)`, anulável, sem default (`:5131-5149`);
- chave primária `pkprodutos_codigo` em `codigo` (`:9894-9910`).

Os consumidores Laravel tratam o valor persistido como `A`, `B`, `C` ou não definido. `CurvaAbcInclusionFilter` aceita `A/B/C/ND`, e `ND` corresponde a `NULL` ou vazio (`laravel/backend/app/Domain/Estoque/ConsultaCompras/CurvaAbcInclusionFilter.php:7-34`). Portanto, **INFERÊNCIA/RISCO**: uma nova gravação deve preservar o alfabeto de um caractere e a semântica de nulo/vazio já esperada pelos leitores; não há evidência para introduzir outro estado.

### 1.2 Triggers sobre `produtos`

**CONFIRMADO** — O snapshot lista, entre outras, as seguintes triggers da relação `produtos`:

- `produtos_antesinseriratualizar`, `BEFORE INSERT OR UPDATE` (`.../postgresql-authoritative-2026-08-19.json:11073-11079`);
- `produtos_log`, `AFTER INSERT OR DELETE OR UPDATE` (`:11128-11134`);
- `produtos_audit_log_trg` (`:11095-11103`);
- `trg_produtos_fill_derived_cols` e demais triggers derivadas (`:11139-11155`).

Na definição de `produtos_antesinseriratualizar`, quando `NOT NEW.VeioDaTriggerCaracteristicas`, o banco atualiza características e marcações derivadas; ao final, define `NEW.VeioDaTriggerCaracteristicas := FALSE`, preenche `NEW.Data` quando necessário e retorna a linha (`:11073-11079`). A rotina também possui caminho para produtos de grade e cópia de campos relacionados.

Logo, **CONFIRMADO**: o Delphi fornece o sinal `true` para controlar esse caminho, mas o valor armazenado ao final deve voltar a `false`. **INFERÊNCIA/RISCO**: uma futura escrita Laravel não deve assumir que o flag seja uma coluna de negócio persistente nem deixar `true` exposto como resultado final.

### 1.3 Auditoria legada e nova

**CONFIRMADO** — A definição de `produtos_log` no snapshot evita registrar update sem diferença e insere snapshots antigo/novo em `Produtos_Log`, incluindo `VeioDaTriggerCaracteristicas` e `ResultadoCurvaABC`, além de metadados do trigger (`.../postgresql-authoritative-2026-08-19.json:11128-11134`).

As migrations Laravel também definem uma trilha append-only nova:

- `2026_05_08_100001_create_produtos_log_new_table.php:9-65` cria `produtos_log_new` com código do produto, modo do trigger, usuário de banco/aplicação, login, nome, origem, request id, filial, preços efetivos e diff JSON;
- `2026_05_08_100003_produtos_audit_trigger_pgsql.php:9-24` instala `produtos_audit_log_trg` e sua função somente em PostgreSQL;
- `:26-48` define a função e ignora apenas `created_at`, `updated_at` e `cloud_row_version`;
- `:49-91` captura usuário do banco e settings de sessão (`app.user_id`, login, nome, origem, request id e filial);
- `:93-185` registra snapshots de insert/delete e diffs de update;
- `:189-192` cria o trigger `AFTER INSERT OR UPDATE OR DELETE`.

**CONFIRMADO** — Como `resultadocurvaabc` e `veiodatriggercaracteristicas` não estão na lista de ignorados da migration, a auditoria nova pretende observar essas alterações. **CONFIRMADO no snapshot / LACUNA operacional** — o snapshot também contém a trigger legada e a nova; não está demonstrado neste ticket se todas as migrations estão aplicadas exatamente em cada ambiente, nem se a aplicação deliberada produz duas trilhas em todos os casos.

## 2. Fluxo Delphi: leitura e gravação

### 2.1 Geração

**CONFIRMADO** — O DFM do relatório chama a função legada `abc_prod` e junta o resultado com `produtos` para obter código de barras (`delphi/apps/estoque/dmrelatoriocurvaabc.dfm:18-50`):

```sql
select abc.*, codigobarras(produtos.codigo) as codigo_barras
from abc_prod(...) as abc
left join produtos on (abc.codigo = produtos.codigo)
```

O dataset expõe, entre outros, `codigo` e `tipo` (`delphi/apps/estoque/dmrelatoriocurvaabc.pas:13-47`). A rotina configura tipos de curva de lucro, quantidade, faturamento, fornecedor, grupo/classe/marca e marca (`:188-297`).

### 2.2 Persistência atual

**CONFIRMADO** — A rotina `AtualizarResultadoCurvaABC` está em `delphi/apps/estoque/dmrelatoriocurvaabc.pas:690-707` e executa este fluxo:

1. monta `update produtos set resultadocurvaabc = null, veiodatriggercaracteristicas = true where resultadocurvaabc is not null;`;
2. percorre as linhas calculadas;
3. para cada linha, monta `update produtos set resultadocurvaabc = <tipo>, veiodatriggercaracteristicas = true where codigo = <codigo>;`;
4. executa o comando acumulado e chama `perpetrar([])`.

Consequências confirmadas:

- a limpeza não é limitada por período, filial, usuário ou filtro; ela é global para todos os produtos com resultado não nulo;
- o valor persistido vem de `qryVendastipo`, normalmente `A`, `B` ou `C`;
- a identidade da linha de escrita é `produtos.codigo`;
- o flag é enviado como `true` em cada update para acionar o comportamento esperado da trigger;
- o Delphi não grava diretamente uma tabela de resultado separada.

O componente `qryAtualizarProdutos` é `TtecQuery`, com `CachedUpdates=True` e `RequestLive=True`, no mesmo DFM de conexão/transação (`delphi/apps/estoque/dmrelatoriocurvaabc.dfm:1996-2007`). **LACUNA**: a implementação de `perpetrar` e a semântica exata do commit não foram encontradas nas fontes consultadas; por isso não se pode afirmar que todo o lote seja atômico.

### 2.3 Ação da tela

**CONFIRMADO** — A tela habilita salvar após geração e o botão/F5 chama a rotina de persistência (`delphi/apps/estoque/fmrelatoriocurvaabc.pas:118-156` e `:297-313`). Não existe, nesse fluxo, uma autorização adicional por produto, uma confirmação de escopo global ou um controle visível de concorrência.

### 2.4 Risco nos modos agregados

**CONFIRMADO nas fontes SQL Laravel equivalentes / INFERÊNCIA de compatibilidade** — A função de seleção por produto retorna `tabela.produto` (`laravel/backend/resources/sql/estoque/teclux_selecionar_vendas_lucros.sql:24-35`), mas as auxiliares:

- fornecedores usam `cast(0 as bigint) as produto` (`..._fornecedores.sql:24-34`);
- grupos usam `cast(0 as bigint) as produto` (`..._grupos.sql:24-32`);
- marcas usam `cast(0 as bigint) as produto` (`..._marcas.sql:25-33`).

Como o Delphi reutiliza `qryVendascodigo` como alvo do `where codigo = ...`, os modos agregados podem não produzir códigos de produto graváveis. Isso é **INFERÊNCIA/RISCO**, não uma afirmação sobre a definição implantada de `abc_prod`: o DFM chama a função legada e o checkout não contém uma prova de que sua implementação implantada seja idêntica às funções `teclux_*`. A especificação da persistência deve decidir explicitamente entre:

- permitir gravação somente nos modos que retornam produto;
- derivar uma classificação por produto para modos agregados; ou
- preservar o comportamento legado, depois de confirmar a função implantada.

## 3. Fluxo Laravel e heavy-reports

### 3.1 Endpoints e autorização atual

**CONFIRMADO** — As rotas são GET `/cadastros/estoque/relatorios/curva-abc`, POST `/gerar`, status e cancelamento (`laravel/backend/routes/web.php:2538-2553`). O controller apenas autoriza visualização, despacha a geração e consulta/cancela o job (`laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php:43-138`). Não existe endpoint de persistência em `produtos`.

`CurvaAbcPolicy` possui `viewAny`, `gerar` e `view`, todos baseados em acesso ao módulo (`laravel/backend/app/Policies/CurvaAbcPolicy.php:17-32`). O serviço de acesso aceita administradores ou usuários autorizados no módulo (`laravel/backend/app/Services/Authorization/EstoqueCurvaAbcModuleAccessService.php:17-39`), e o request autoriza a capacidade `gerar` (`laravel/backend/app/Http/Requests/Estoque/GerarCurvaAbcRequest.php:32-35`).

**INFERÊNCIA/RISCO** — O direito de gerar um relatório não estabelece, por si só, autorização para alterar o cadastro global de produtos. A futura gravação precisa de uma capacidade/ação explícita e de escopo autorizado; não se deve reutilizar automaticamente `gerar` como contrato de mutação.

### 3.2 Geração e resultado operacional

**CONFIRMADO** — `CurvaAbcService::gerar` valida filiais autorizadas, chama `fetchRows`, enriquece/mapeia as linhas, registra sucesso e devolve `rows`/metadados (`laravel/backend/app/Services/Estoque/CurvaAbcService.php:57-175`).

`LegacyCurvaAbcRepository` apenas executa `DB::select` da função configurada e trata timeout/cancelamento (`laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyCurvaAbcRepository.php:12-18`, `:50-145`). O config documenta que `teclux_abc_prod` tem 23 parâmetros e `abc_prod` legado tem 22, usando `teclux_abc_prod` por padrão (`laravel/backend/config/teclux.php:204-218`).

`GerarCurvaAbcJob` usa `ShouldBeUnique`, fila `redis-heavy`/`heavy-reports` e timeout, mas somente gera e marca o resultado pronto (`laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:23-92`). O concern de heavy report persiste checkpoint/resultados para a operação do job (`laravel/backend/app/Jobs/Concerns/IsManagedHeavyReport.php:14-64`; `laravel/backend/app/Support/Database/GerarJobStore.php:13-35`, `:43-65`, `:161-197`).

**CONFIRMADO** — Esse resultado persistido em cache/checkpoint é operacional e temporário; não é a autoridade de `produtos.resultadocurvaabc` e não substitui uma gravação relacional auditada.

### 3.3 Funções e migrations SQL

**CONFIRMADO** — A migration `2026_06_29_120002_create_teclux_curva_abc_functions.php:9-69` deixa explícito que as funções Cloud não substituem `abc_prod`/`selecionar_vendas_lucros`; em PostgreSQL ela aplica somente os SQLs com marcador de DDL pronto.

`teclux_abc_prod.sql` define a função e retorna `SETOF tp_abc_vendas_lucros` (`:1-6`), atribui `dados.codigo` a partir da tabela de cálculo (`:238-251`) e classifica cada linha com `dados.tipo = 'A'/'B'/'C'` (`:296-301`). Não há ocorrência de `resultadocurvaabc` ou `veiodatriggercaracteristicas` nesse SQL: a função calcula dados transitórios e não atualiza `produtos`.

O script de build deriva a função Cloud do export legado `abc_prod.sql` e injeta o parâmetro de vendedor (`laravel/backend/resources/sql/estoque/build_teclux_curva_abc_sql.php:69-102`; `.../_export/abc_prod.sql:1-4`). **LACUNA**: isso demonstra a origem do artefato versionado, não prova que a função implantada em todos os ambientes é idêntica.

A migration SQLite `2026_07_21_211000_sqlite_produtos_consulta_compras_motor_columns.php:15-35` adiciona `resultadocurvaabc` apenas ao schema SQLite de teste/consulta. Ela não constitui contrato de persistência PostgreSQL.

## 4. Usos downstream de `resultadocurvaabc`

**CONFIRMADO** — O campo é um read model compartilhado por módulos além do relatório:

- sugestões da consulta de compras selecionam `p.resultadocurvaabc` e mapeiam nulo/aparado (`laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaComprasSugestaoRepository.php:203-213`, `:319-321`), usado pelo serviço em `:649-742`;
- consulta de transferências entre lojas filtra nulo/vazio como “não definido” e seleciona a curva (`laravel/backend/app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConsultaTransferenciasReadRepository.php:152-163`, `:181-186`);
- consulta de requisições seleciona o campo (`.../LegacyConsultaRequisicoesReadRepository.php:232-235`, `:378-381`);
- manutenção de preços seleciona a curva em PostgreSQL (`.../LegacyManutencaoPrecosConsultaRepository.php:70-73`).

**INFERÊNCIA/RISCO** — Uma limpeza global ou gravação parcial afeta decisões operacionais de outros módulos. O contrato da próxima implementação precisa explicitar se a atualização é uma substituição global compatível com Delphi ou uma atualização escopada; não se pode assumir que filtros do relatório delimitem automaticamente o conjunto persistido.

## 5. Concorrência, atomicidade, idempotência e auditoria

### 5.1 Autoridade compartilhada

| Operação | Autoridade observada | Evidência | Classificação |
|---|---|---|---|
| Calcular ABC no Delphi | Função legada `abc_prod` | `dmrelatoriocurvaabc.dfm:18-50` | CONFIRMADO |
| Calcular ABC no Laravel | `teclux_abc_prod` por padrão, ou função configurada | `LegacyCurvaAbcRepository.php:12-18`, `:131-145`; `config/teclux.php:204-218` | CONFIRMADO |
| Gravar classificação | `public.produtos` via updates do Delphi | `dmrelatoriocurvaabc.pas:690-707` | CONFIRMADO |
| Ler classificação | `public.produtos.resultadocurvaabc` | repositórios Laravel citados na seção 4 | CONFIRMADO |
| Resultado do job Laravel | Cache/checkpoint do heavy report | `GerarJobStore.php:43-65`, `:161-197` | CONFIRMADO; não é autoridade relacional |
| Coordenação Delphi/Laravel | Nenhum mecanismo explícito encontrado | fontes acima; job `ShouldBeUnique` em `GerarCurvaAbcJob.php:23-43` | LACUNA / INFERÊNCIA DE RISCO |

### 5.2 Concorrência

**CONFIRMADO** — `ShouldBeUnique` evita duplicação do mesmo job Laravel por sua chave/ID e por sua janela de unicidade (`IsManagedHeavyReport.php:14-28`), mas não coordena com o Delphi nem bloqueia outro escritor PostgreSQL.

**INFERÊNCIA/RISCO** — Como a rotina Delphi limpa todas as linhas e só depois reaplica classificações, dois salvamentos concorrentes podem intercalar limpeza e updates; leitores também podem observar um estado intermediário se não houver uma transação efetiva. Não foi encontrado lock advisory, `SELECT ... FOR UPDATE`, versão de linha, `WHERE` com valor anterior ou mutex compartilhado.

### 5.3 Atomicidade

**LACUNA** — O Delphi acumula vários `UPDATE`s em `qryAtualizarProdutos`, chama `ExecSql` e depois `perpetrar([])` (`dmrelatoriocurvaabc.pas:690-707`; DFM `:1996-2007`). O checkout consultado não fornece a implementação de `perpetrar`, portanto não é possível afirmar se:

- o lote completo é uma única transação;
- o commit acontece antes/depois de triggers e auditoria;
- falha em um update desfaz todos os anteriores;
- o driver PostgreSQL trata o comando multi-statement como uma unidade útil para esse componente.

Não se deve copiar a sequência de limpeza global para Laravel antes de resolver essa lacuna. **INFERÊNCIA/RISCO** — A forma segura a especificar deve ser uma substituição atômica/set-based ou transação explicitamente delimitada, com política definida para falha e concorrência.

### 5.4 Idempotência

**CONFIRMADO** — A auditoria legada evita registrar `UPDATE` quando `NEW` não é distinto de `OLD` (`.../postgresql-authoritative-2026-08-19.json:11128-11134`); a auditoria nova só grava diff quando há diferença relevante (`2026_05_08_100003_produtos_audit_trigger_pgsql.php:137-185`).

**INFERÊNCIA/RISCO** — Isso favorece repetir um resultado sem gerar auditoria de alteração quando nada muda, mas triggers derivadas podem modificar outros campos (`Data`, nomes, características etc.). A idempotência precisa ser verificada com execução real e deve incluir a identidade da geração, escopo e política de auditoria; não é garantida apenas pelo `ShouldBeUnique` do job.

## 6. Invariantes e decisões necessárias para a próxima especificação

Sem implementar, as fontes sustentam estes invariantes/decisões:

1. **Identidade** — só `produtos.codigo` é chave de atualização confirmada; linhas agregadas com código zero não podem ser gravadas como produtos sem regra adicional.
2. **Domínio do valor** — preservar `A`, `B`, `C` e nulo/vazio como “não definido”; não criar valores novos sem alterar todos os leitores.
3. **Flag de trigger** — enviar/usar `veiodatriggercaracteristicas` somente conforme o contrato da trigger e garantir que o estado final não fique artificialmente `true`.
4. **Efeitos derivados** — aceitar e auditar os efeitos das triggers de `produtos`; uma gravação não é apenas uma alteração isolada da coluna ABC.
5. **Escopo** — decidir explicitamente se salvar significa substituir globalmente a classificação (compatibilidade Delphi) ou atualizar apenas um conjunto autorizado. Filial, período e filtros de cálculo não demonstram, sozinhos, escopo de persistência.
6. **Autorização** — separar “gerar relatório” de “persistir classificação global” e registrar usuário, origem, request/job e escopo.
7. **Atomicidade** — definir transação, isolamento, comportamento de falha e visibilidade para os leitores.
8. **Concorrência** — definir autoridade em caso de disputa Delphi/Laravel, incluindo lock/versionamento ou política de última gravação rejeitada/aceita.
9. **Modos de cálculo** — confirmar a função legada implantada e decidir se fornecedor/grupo/marca são somente consulta ou possuem uma transformação explícita para produtos.
10. **Auditoria** — confirmar se a instalação corrente mantém `Produtos_Log`, `produtos_log_new` ou ambos e qual trilha é a fonte oficial de auditoria.

## 7. Gaps que permanecem abertos

- Implementação e semântica transacional de `perpetrar`/`TtecQuery` não localizadas.
- Definição implantada de `abc_prod` não confirmada contra os SQLs `teclux_*` versionados.
- Não há contrato Laravel para persistência de `resultadocurvaabc`, endpoint, policy, request, serviço ou job de gravação.
- Não há mecanismo de coordenação global entre job Laravel e o salvamento Delphi.
- O snapshot de 2026-08-19 é evidência de estado observado, não uma garantia de que todos os ambientes estejam no mesmo estado após a coleta.
- Não foi feita execução de banco nem teste de concorrência; esta entrega é pesquisa estática de fontes primárias.

## Referências primárias principais

- `modules/entregas/relatorio-entregas/schema/postgresql-authoritative-2026-08-19.json:1-12,5131-5149,9894-9910,11073-11155`
- `delphi/apps/estoque/dmrelatoriocurvaabc.pas:13-47,188-297,690-707`
- `delphi/apps/estoque/dmrelatoriocurvaabc.dfm:18-50,1996-2007`
- `delphi/apps/estoque/fmrelatoriocurvaabc.pas:118-156,297-313`
- `laravel/backend/routes/web.php:2538-2553`
- `laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php:43-138`
- `laravel/backend/app/Services/Estoque/CurvaAbcService.php:57-175`
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyCurvaAbcRepository.php:12-18,50-145`
- `laravel/backend/app/Jobs/Erp/GerarCurvaAbcJob.php:23-92`
- `laravel/backend/database/migrations/2026_05_08_100001_create_produtos_log_new_table.php:9-65`
- `laravel/backend/database/migrations/2026_05_08_100003_produtos_audit_trigger_pgsql.php:9-204`
- `laravel/backend/database/migrations/2026_06_29_120002_create_teclux_curva_abc_functions.php:9-69`
- `laravel/backend/resources/sql/estoque/teclux_abc_prod.sql:1-6,238-251,296-301`
- `laravel/backend/resources/sql/estoque/teclux_selecionar_vendas_lucros*.sql`
- leitores de `resultadocurvaabc` listados na seção 4.
