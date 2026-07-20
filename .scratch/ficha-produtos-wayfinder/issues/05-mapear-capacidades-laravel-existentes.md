Type: task
Status: resolved
Blocked by:

## Question

Qual é o estado atual do Laravel relevante à Ficha de Produtos: rotas e telas, componentes de filtro e grade, lookups, cadastro de produtos, filiais autorizadas, movimentos, lotes, contratos, dimensões de estoque, permissões, auditoria, relatórios, jobs, serviços e repositórios; e quais dessas capacidades podem ser reutilizadas sem duplicação?
## Answer

### Conclusão executiva

O Laravel ainda **não possui rota, tela, controller, policy, serviço, repositório, catálogo ou testes específicos para Ficha de Produtos**, mas já possui quase toda a infraestrutura transversal. O trabalho novo principal é o **read model histórico da Ficha**: snapshots, saldo anterior, perspectiva por lote e detalhe por contrato.

A composição recomendada é usar Análise de Estoques como referência de shell/grade, Movimentação Diária como referência de leitura/auditoria, e os cadastros/lookups atuais de produtos, lotes, filiais, tipos e contratos. Nenhum deles deve virar uma Ficha improvisada.

### Inventário e decisão de reuso

| Capacidade | Estado Laravel | Decisão |
|---|---|---|
| Ficha | Não há rota/página/stack específica | **Lacuna:** módulo próprio |
| Shell | Análise de Estoques tem Parâmetros/Dados, Gerar, stale state, paginação e mensagens | **Reusar composição**, não suas regras |
| Grade | `ErpPreferenceDataGrid` tem leitura, preferências, busca, ordenação, colunas e exportação | **Reuso direto**, catálogo próprio |
| Período/operações | `SimpleDateRangeFieldset`, `ErpConsultaOperationBar` e hooks | **Reusar**; job só se medição justificar |
| Filiais | `UserBranchAccessService` e `AuthorizedFiliaisCheckList` | **Reuso obrigatório**, com escopo vazio seguro |
| Produto | Cadastro tem resolução/lookups | **Reusar**, produto único obrigatório |
| Lote | Cadastro lê por produto; Contratos tem lookup genérico | **Reusar DTO/UI**, restringindo ao produto |
| Tipo | `LegacyTiposMovimentosRepository::listForLookupPaginated()` | **Reuso direto/adaptador read-only** |
| Movimentos | Movimentação Diária já lê `movimentos`, filtros, joins e usuários | **Reusar padrões**, não seu resultado |
| Opening balance/snapshots | Não há endpoint equivalente | **Lacuna central** |
| Por lote | Não há timeline de `movimentoslotes` | **Lacuna** |
| Dimensões | `estoques` já contém as dimensões | Reusar vocabulário/esquema, não posição atual como histórico |
| Contratos | Consulta/Detalhe leem `contratos`/`produtoscontratos` | Reusar fronteira, criar projeção da Ficha |
| Auditoria | Movimentação junta executor/autorizador | Reusar joins/convenções |
| Permissão | Análise tem policy/module access | Reusar desenho, com chave própria |
| Sigilo financeiro | Não há capacidade específica confirmada | **Lacuna:** autorização ou ocultação |
| PDF | Relatório da Movimentação existe | Não reutilizar diretamente |
| Exportação | Infraestrutura existe | Adaptação recomendada, não paridade |
| Jobs | Gerar/status/cancelar existem | Reuso condicional após benchmark |

### Rotas, tela e grade

Não foi encontrada rota/página `ficha-produto(s)`. As superfícies próximas são `/cadastros/estoque/analise-estoques` e `/cadastros/estoque/relatorios/movimentacao-diaria`.

`AnaliseEstoques/Index.tsx` oferece `ErpCadastroShell`, abas Parâmetros/Dados, barra de operação, seções de filtro, filiais, período, aba Dados bloqueada antes de Gerar e resultado obsoleto após mudar filtros. A Ficha deve manter essa linguagem, substituindo rule builders por produto único, filial, tipo, lote e avulsos.

`ErpPreferenceDataGrid` cobre leitura, busca, ordenação, preferências e exportação. A Ficha precisa de catálogos Movimentos/Lotes, grupos alternáveis, tooltips da operação e IDs estáveis. Não duplicar grade nem copiar atalhos físicos Delphi.

### Produtos, estoques e lotes

O Cadastro em `/cadastros/produtos` já concentra identidade e abas Estoques/Lotes. `LegacyProdutoEstoqueRepository` conhece produto + filial e as dimensões, mas sua aba retorna principalmente localização, mínimo/máximo: não é histórico nem saldo anterior.

`LegacyProdutoLoteRepository::listByProdutoForCaracteristica()` valida pertença e lista ID, número, fabricação, validade e flags; serve ao seletor dependente. `ConsultaContratosLoteLookupService` lista lotes de todos os produtos e só inclui o produto no rótulo; para a Ficha deve receber produto obrigatório ou ter wrapper específico.

`ProductFilterPanel` é excessivo para produto único. Reusar modal/serviço de entidade, não o rule builder completo.

### Movimentos, saldos e dimensões

Movimentação Diária é a referência backend mais próxima. Seu SQL/compilador cobrem períodos, produto, filiais, tipos, executor/autorizador, referência, quantidade, parte, valores, paginação, timeout e cancelamento. Define avulsos por `tiposmovimentos.interno`, sem inferir por `usuarioautorizacao`; essa semântica é candidata preferencial à matriz.

Mas não entrega opening balance por snapshot, todas as dimensões acumuladas, custo médio, operação consolidada, moeda/pedidos nem `movimentoslotes`. Seu saldo inicial é financeiro/agregado e **não serve como saldo anterior da Ficha**.

Criar `FichaProdutosConsultaService` e repositório legacy read-only próprios. Compartilhar compilação de período/filial, timeout, cancelamento, sanitização e erros, sem adicionar condicionais ao `LegacyMovimentacaoDiariaRepository`.

### Contratos

`LegacyConsultaContratosRepository` e `LegacyContratoDetalheRepository` confirmam acesso estável a `contratos`/`produtoscontratos`; outras leituras já usam `contratosdevolvidos`. Falta a projeção contextual da Ficha com contratos encontrados, filial, produto direto/composto, quantidade, datas, devolvidos e trocados. Criar projeção read-only própria, reaproveitando convenções/DTOs compatíveis; não acoplar escrita/impressão nem usar a tela completa como painel.

### Permissões e filiais

Criar chave, policy e middleware próprios, repetindo autorização em página, gerar, exportar e lookups.

Dois riscos:

- o serviço observado da Análise verifica acesso direto em `usuariosacessosmodulos`; confirmar concessão por grupo antes de copiá-lo;
- lista vazia pode virar ausência de restrição SQL. Na Ficha, vazio significa **todas as filiais autorizadas materializadas na query**, nunca todas do banco.

O escopo é read-only: sem update, edição inline, supressão de triggers ou correção financeira. Custo, financeiro, preços e moeda exigem autorização explícita; sem regra confirmada, ficam ocultos/negados.

### Jobs, relatórios e corte arquitetural

Produto único + período limitado pode permitir endpoint síncrono paginado. Usar job gerar/status/cancelar somente após teste de volume; exportação grande pode ser assíncrona. PDF da Movimentação tem outra semântica e fica fora. Exportação é adaptação Laravel.

Criar apenas rota/controller/request/policy, `FichaProdutosConsultaService`, repositório para movimentos/opening balance/lotes/contratos, DTO que marque `openingBalance`, catálogos React, lookup de lote dependente, permissão financeira e testes de autorização/filial/período/saldo/lote/contrato/sigilo.

Reutilizar shell, grid/preferências/exportação, produto, filiais, tipos, DTOs de lote e infraestrutura legacy. Evitar usar Cadastro como histórico, transformar Movimentação em repositório multiuso, usar `estoques` atual ou saldo financeiro como opening balance, lotes sem produto, filial vazia sem cláusula, escrita/trigger suppression ou financeiro liberado pelo mero acesso ao módulo.

### Lacunas para a matriz

1. read model de `movimentos`/`movimentoslotes` com snapshots;
2. opening balance correto;
3. contratos, compostos, devolvidos e trocados;
4. autorização financeira;
5. filiais vazias seguras e acesso por grupo;
6. stack/testes específicos;
7. escolha síncrona ou job por desempenho;
8. exportação como adaptação.
