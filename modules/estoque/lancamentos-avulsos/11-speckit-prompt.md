# Prompt atualizado para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional e técnica completa, verificável e pronta para planejamento/implementação de **Estoques → Lançamentos Avulsos** no ERP tecLUX Laravel.

## Regra sobre fontes

Você não possui acesso ao Delphi nem ao banco PostgreSQL usado no levantamento e não deve solicitar, citar ou criar tarefas para investigá-los. Este briefing é autoritativo e autocontido.

Investigue somente o Laravel atual para localizar nomes concretos, padrões e componentes reutilizáveis. Essa inspeção serve para integração; não reabra requisitos nem faça nova entrevista.

## Natureza do módulo

O módulo é um comando **síncrono, inclusion-only e trigger-aware**. Não é CRUD de Movimentos:

- permite visualizar o contexto e registrar uma intenção manual;
- não pesquisa Movimentos para manutenção;
- não edita, exclui ou estorna genericamente;
- sucesso só aparece depois do INSERT raiz, de todas as triggers e do commit;
- não usa fila/job para gravar.

`movimentos` é o livro cronológico por Produto + Filial. Cada linha contém snapshots posteriores. `estoques` é a projeção corrente. Para Produto gerenciado por Lote, `movimentoslotes` é o livro derivado e `estoqueslotes` a projeção Produto + Filial + Lote.

O Laravel insere exatamente **um Movimento-raiz**. Triggers PostgreSQL:

- geram `numero` e `lancto`;
- releem/aplicam `tiposmovimentos.operacao`;
- bloqueiam projeções;
- calculam Quantidades e Financeiro;
- atualizam Estoques;
- processam Última Compra;
- criam transferências, componentes e compensações negativas;
- criam Movimentos por Lote e atualizam Estoques por Lote;
- recalculam o encadeamento e auditam.

Proíba writes Laravel em `estoques`, `estoqueslotes`, `movimentoslotes` e Movimentos derivados. Não copie cálculos das triggers para PHP.

## Estado atual e reuso

O módulo ainda não existe. Criar página, rotas, Policy/middleware, requests, serviços, repositories e testes próprios.

Reutilize ou extraia núcleos compartilháveis de:

- `UserBranchAccessService`;
- `CatalogCodeLookup`/`CatalogStringCodeLookup` e modal paginado;
- lookup da Ficha de Produtos;
- `LegacyTiposMovimentosRepository`;
- `TipoMovimentoOperacaoMapper`;
- leitura/mappers/grids da Ficha de Produtos;
- ErpGrid;
- permissão financeira do domínio Estoque;
- `SensitiveOperationAuthService`;
- `DatabaseAuditContext`;
- precedente trigger-aware do Marketplace, sem reutilizar seu payload/repository.

Não use endpoints de outras telas como dependência. Crie endpoints locais apoiados em serviços compartilhados.

## Entrada permitida

Aceite somente:

- Filial, Produto, Tipo e Data obrigatórios;
- Quantidade decimal(11,3), condicional;
- Valor, Preço sem ICMS, Preço com ICMS, IPI e Valor da Última Compra, condicionais;
- Referência opcional até 60;
- Filial destino condicional;
- `loteproduto` condicional;
- UUID idempotente;
- token de preparação;
- prova sensível condicional.

Operador vem da sessão e autorizador da prova. Nunca aceite do browser `numero`, `lancto`, `operacao`, saldos, Financeiro calculado, relações derivadas, usuários arbitrários, Grupo, flags de bypass ou timestamps.

## Tipo de Movimento

Tipo elegível:

- existe;
- não está inativo;
- `interno=false`;
- `operacao<>'********************'`;
- possui vetor estruturalmente válido.

O backend relê a linha no POST. O browser envia apenas o código.

Posições do vetor:

1 Em estoque; 2 Reservado; 3 Trânsito; 4 Demonstração; 5 Conserto; 6 Futuro; 7 Danificada; 8 Estoque físico; 9 Reserva prévia; 10 Última entrada; 11 Última compra; 12 Financeiro; 13 venda/Última venda; 14 compra; 15 reservado; 16 Acabados; 17 Semiacabados; 18–20 reservados.

`+` soma, `-` subtrai, `=` substitui, `*` não atua; Financeiro admite `C`, calculado pela trigger. Reutilize o mapper para estrutura/apresentação, nunca para executar a contabilidade em PHP.

Forma dinâmica:

- Quantidade obrigatória quando o vetor a utiliza; em `+`/`-`, maior que zero;
- valores/preços somente quando aplicáveis;
- `C` não aceita Financeiro livre;
- Última Compra somente com posição 11 `=` e Produto não composto;
- destino obrigatório em transferência;
- Lote obrigatório quando o Produto gerencia Lote;
- campo incompatível é limpo e rejeitado no servidor.

## Lookups e resolve exato

Lupa e digitação direta aplicam exatamente os mesmos predicados. Opção existente, porém inelegível, retorna motivo explícito sem vazar Filial não autorizada.

### Filiais

- origem: somente Filiais autorizadas; Código e Nome; sem paginação;
- Administrador vê todas;
- uma única Filial pode ser pré-selecionada;
- destino: autorizado, diferente da origem, Tipo transferencial e Produto elegível.

### Produto

Reutilize as mesmas colunas do lookup da Ficha de Produtos:

1. Código;
2. Descrição/Item;
3. Código de Barras;
4. Linha;
5. Coluna;
6. Situação/Inatividade;
7. Comissão do Grupo;
8. Comissão do Produto;
9. Busca avançada.

Retorne também, como metadados técnicos, ID bigint canônico, código visual, referência/unidade necessárias, `composto`, `gerenciarloteevalidade`, elegibilidade e `estoque_sera_criado`.

Pesquisa e ordenação devem conservar as modalidades da Ficha. Paginação padrão 25, máximo 100. Resolve exato aceita código visual ou código de barras.

Respeite **lançamentos avulsos de produtos compostos**. Produto inativo é identificado e bloqueado.

Produto deve possuir `estoques(produto,filial)`, exceto quando **Incluir Estoque Automático** estiver ativo. Nesse caso:

- lookup marca “Estoque será criado”;
- preparação destaca o efeito;
- Laravel não cria a linha;
- trigger é a única autoridade para criar projeção;
- mudança do parâmetro invalida preparação.

A mesma regra vale para a Filial destino.

### Tipo

Paginação 25, máximo 100. Busca por Código/Descrição. Retorne Código, Descrição, Operação, Transferência, política de negativo e resumo de efeitos.

### Lote

Dependências: Produto, Filial e Tipo.

Colunas:

- Nº Lote;
- Produto visual;
- Código de Barras;
- Descrição;
- Validade;
- Fabricação;
- Inativo;
- Fora de Linha;
- nove Quantidades no contexto da Filial.

Pesquisa por Nº Lote; paginação 25, máximo 100; ordem Validade + ID. Retorno canônico é `loteproduto` bigint.

Regras:

- pertence ao Produto;
- saldo zero permite entrada ou substituição;
- saída é comparada às dimensões afetadas;
- vencido, inativo ou fora de linha aparece identificado, mas bloqueado;
- ausência de projeção só é permitida pela política canônica de criação automática;
- não criar Lote neste módulo.

## Endpoint contextual único

Entrada: Filial, Produto, Lote opcional e Tipo opcional.

Retorno coordenado:

- entidades resolvidas;
- nove Quantidades atuais do Produto;
- Valores atuais quando autorizados;
- nove Quantidades e dados do Lote;
- dez Movimentos mais recentes;
- efeitos do Tipo;
- fingerprint/versão contextual.

Use consultas estreitas e parametrizadas, não SQL monolítico. Diferencie: não selecionado, Produto sem Estoque, projeção que será criada, Lote sem projeção e linha existente zerada.

## Cinco visões

Todas somente leitura, sem paginação, edição, delete ou sorting. Histórico: Produto + Filial, `numero desc`, limite 10. `numero` é row key oculta.

1. **Movimentos**: Data, Tipo, Nº Lote, Referência, Quantidade, Estoque, Valor, Financeiro.
2. **Quantidades históricas**: Data, Tipo, Nº Lote, Estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada.
3. **Valores históricos**: Data, Tipo, Nº Lote, Valor, Financeiro, Preço com ICMS, Preço sem ICMS.
4. **Quantidades atuais do Produto**: Estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Reserva Prévia, Estoque Físico.
5. **Quantidades atuais do Lote**: as mesmas nove dimensões.

Valores atuais em cards: Custo Médio, Financeiro, Preço com ICMS, Preço sem ICMS e Última Compra.

## Segurança financeira

Permissão de criar Lançamento não concede acesso financeiro.

- usuário autorizado recebe campos/colunas financeiros;
- usuário não autorizado não recebe esses dados no JSON;
- ocultação apenas no React é proibida;
- se o Tipo exigir entrada financeira, usuário sem permissão não conclui e recebe orientação para solicitar usuário autorizado;
- comissões do lookup seguem a política financeira já usada pela Ficha de Produtos.

## Invalidação

- mudar Filial limpa Produto, Lote, destino, contexto e preparação;
- mudar Produto limpa Lote, destino dependente, contexto e preparação;
- mudar Tipo limpa preparação, campos incompatíveis e destino se não transferencial;
- mudar Lote limpa contexto de Lote e preparação;
- mudar Data/Quantidade/Referência/valores preserva lookups e invalida preparação;
- descarte respostas assíncronas cuja versão não corresponde à seleção;
- Registrar fica desabilitado sem preparação válida.

## Preparação, autorização e concorrência

`preparar`:

- não escreve e não mantém transação aberta;
- valida acesso, Filiais, Produto, Tipo, Lote, Data e campos;
- relê parâmetros/contexto;
- produz resumo humano;
- informa prova necessária;
- emite token curto ligado ao operador, entidades, parâmetros, payload e fingerprint.

Adicione operação sensível estável para Estoque/Lançamentos Avulsos com perfil `gerenteestoque` e parâmetro **Exigir Senha em Lançamentos Avulsos**:

- não gerente exige Gerente de Estoque;
- parâmetro ativo desafia também gerente conforme framework;
- prova liga operador, Filial, ação e payload;
- POST valida/consome prova;
- operador e autorizador são persistidos separadamente.

POST relê tudo dentro de transação. Contexto/saldos alterados retornam HTTP 409 `contexto_alterado` com novo contexto e zero INSERTs. Mudança de Tipo, entidade, autorização ou parâmetro também invalida.

## Idempotência durável

Persistência com unicidade operador + UUID, hash normalizado, status, Movimento-raiz, timestamps e resultado mínimo.

- mesma chave/hash concluída: mesmo resultado, `replayed=true`, sem novo INSERT/prova;
- mesma chave/outro hash: 409;
- concorrentes convergem para um resultado;
- reserva, INSERT e conclusão são atômicos;
- cache isolado não basta;
- timeout incerto é repetido com a mesma chave.

## Transação e INSERT

Transação curta:

1. reserva/replay idempotente;
2. `DatabaseAuditContext`;
3. releitura/revalidação;
4. prova;
5. um INSERT raiz;
6. triggers e locks;
7. leitura mínima/conclusão idempotente;
8. commit;
9. recarga completa fora da transação.

Allowlist máxima:

- Produto, Filial, Data, Tipo, Quantidade;
- valores/preços/IPI/Última Compra condicionais;
- Referência;
- destino;
- Lote;
- operador e autorizador.

Não use `MAX()+1`, locks aplicativos em ordem concorrente, UPDATE de projeções, UPDATE global de Última Compra ou log SQL local.

## Resultado

Depois do commit:

- identifique Movimento-raiz;
- liste derivados classificados em transferência, componente ou negativo;
- derivado de outra Filial aparece no resumo, não no histórico da origem;
- recarregue todas as cinco visões e Valores;
- destaque a raiz;
- limpe a intenção concluída e gere novo UUID;
- preserve Filial, Tipo, Data e Referência como conveniência;
- não faça atualização otimista de saldos.

## Erros

Contrato: `code`, `message`, `field_errors`, `request_id`, `retryable`.

- 403 para acesso/Filial;
- 422 para validação/regra conhecida;
- 409 para contexto, preparação, prova ou idempotência;
- 503 retryable conforme timeout/deadlock classificado;
- 500 para falha desconhecida/schema ausente.

Não exponha SQL, stack, senha ou prova. Falha reverte raiz, derivados, projeções e idempotência.

## Seams e testes

Seam principal: testes Feature pelos endpoints públicos. Não teste detalhes privados.

Seam PostgreSQL: comando final observando raiz, derivados, projeções e rollback. SQLite não comprova triggers/locks.

Frontend: somente invalidação em cascata, descarte de resposta antiga e bloqueio de Registrar.

Arquitetural: falhar se o módulo escrever diretamente em projeções/derivados.

Cubra:

1. acesso, capabilities e Filiais;
2. todos os lookups, resolve, paginação e motivos;
3. paridade das colunas de Produto com Ficha;
4. Tipo elegível e vetor;
5. Produto composto e Estoque Automático;
6. Lote zero/vencido/inativo;
7. cinco visões e ordem fixa;
8. redaction financeira;
9. preparação, stale e contexto alterado;
10. prova sensível;
11. replay, conflito e concorrência idempotente;
12. `+`, `-`, `=`, `C`;
13. negativo rejeitado/compensado;
14. transferência, componentes e Lote;
15. rollback integral;
16. Auditoria, operador e autorizador;
17. ausência de rotas CRUD;
18. proibição arquitetural de writes em projeções.

## Fora do escopo

Alterar triggers/Delphi; corrigir dados; migrar outros produtores; criar Lote; editar/excluir/reverter genericamente; substituir contabilidade de Estoque; processamento assíncrono.

## Saída esperada

Gere especificação numerada, completa e mensurável com requisitos funcionais, cenários felizes/falhas, entidades, contratos HTTP, capabilities, estados, critérios de sucesso e estratégia de testes. Identifique reuso e novos limites no Laravel atual.

Não crie tarefas para investigar Delphi ou banco legado. Não implemente agora.
```
