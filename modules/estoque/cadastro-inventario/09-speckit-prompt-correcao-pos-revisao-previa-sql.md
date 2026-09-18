# Prompt corretivo — revisão da implementação da prévia e paridade real do F8

## Contexto

Revise a implementação entregue para a spec `485-fix-inventario-previa-processamento` no commit `051fb5e36`, usando o código Laravel, a spec 485, os contratos em `specs/485-fix-inventario-previa-processamento/` e os artefatos deste diretório. Não solicite inspeção direta dos fontes Delphi.

A implementação criou `InventarioProcessingPlan`, endpoint/job de simulação, grids e confronto por hash, mas a auditoria encontrou falhas de comportamento, SQL, persistência e aceite. Corrija in-place sem criar uma segunda fórmula paralela.

### Regra obrigatória de numeração dos movimentos — paridade com o Delphi

Reproduzir exatamente o fluxo de `GerarMovimentos` do Delphi:

1. abrir o dataset live de `movimentos`;
2. para cada efeito, executar `Append`;
3. limpar/deixar nulo `movimentos.numero`;
4. preencher produto, filial, data do Inventário, quantidade, tipo, valor, referência e lote quando aplicável;
5. executar `Post` e aplicar os registros na mesma transação do processamento.

O Delphi não calcula `MAX(numero)`, não chama `nextval` para esse campo e não mantém contador em memória. O número é gerado exclusivamente pelo trigger da tabela `movimentos` no INSERT efetivo. O Laravel deve omitir `numero` ou enviá-lo como `NULL`, conforme o contrato do banco, e não pode usar alocador próprio.

Uma diferença negativa deve gerar os movimentos na ordem `IE-`, `IR-`, `IP-`, quando houver saldo suficiente em cada posição. Cada linha recebe seu próprio número pelo trigger. A prévia interna do Laravel não pode executar INSERT, disparar o trigger ou consumir numeração. No processamento efetivo, assim como no Delphi, os `Post`/INSERTs dos movimentos devem ser aplicados dentro da transação; se a validação pós-processamento falhar, a transação deve ser revertida.

### Regra obrigatória das duas datas do inventário

Preservar a distinção existente no Delphi entre `inventario.data` e `inventario.processamento`:

- ao criar o inventário, `processamento` começa igual a `data`;
- `data` é a data de referência/corte do inventário: o saldo inicial de cada Produto/Lote é o último movimento com `movimentos.data <= inventario.data` ou `movimentoslotes.data <= inventario.data`, escolhido por `data DESC, lancto DESC`;
- `processamento` é o limite superior da projeção: movimentações posteriores entram no intervalo `movimento.data > inventario.data AND movimento.data <= inventario.processamento`;
- o saldo após o processamento e os campos `*processamento` são calculados até `inventario.processamento`;
- os movimentos gerados pelo inventário continuam sendo gravados com `movimentos.data = inventario.data`, e não com a data atual nem automaticamente com `inventario.processamento`;
- quando as duas datas são iguais, o intervalo posterior é vazio;
- `processamento` não pode ser anterior a `data`; qualquer alteração de `data` ou `processamento` deve invalidar a prévia, o hash e os grids derivados, exigindo nova consulta;
- a detecção de alterações concorrentes continua usando o corte do legado `movimento.processamento > inventarioprodutos.datahoraalteracao` e, para lotes, `movimentoslotes.processamento > inventarioprodutoslotes.datahoraalteracao`; isso não deve ser confundido com o intervalo de datas usado para recalcular saldos.

Aplicar exatamente os mesmos cortes para Produtos com lote, substituindo `movimentos` por `movimentoslotes`. A simulação e o F8 devem receber e validar as duas datas no mesmo plano; nunca usar `now()` como substituto da data do inventário ou do processamento.

## Achados que devem ser corrigidos

### P0 — a prévia não é apresentada no fluxo único do Delphi

Em `Index.tsx`, `processar()` chama a simulação e somente faz `setPrevia(atual)` quando existem bloqueios. Quando a prévia está válida e sem bloqueios, ela não é exibida antes da senha; o código passa diretamente para `SensitiveOperationAuthService`. O comportamento correto do Delphi é um fluxo único: o comando de processamento faz a prévia internamente e segue para a autorização somente depois das validações. Não criar um comando ou botão separado de simulação.

Corrigir para:

- manter somente o comando `Processar` no fluxo operacional; a simulação deve ser uma etapa interna e automática desse comando;
- sempre armazenar e exibir a prévia pronta, inclusive quando não há bloqueios;
- apresentar o painel atual antes da confirmação/senha do F8;
- permitir que o operador leia efeitos, resumo, posteriores e avisos antes de autorizar;
- somente após a prévia ser apresentada e aceita, abrir a autorização sensível, usando a prévia da mesma tela, Inventário, Filial, revisão, usuário e validade;
- se expirar ou houver mudança, simular novamente e não abrir a autorização com plano velho;
- manter Cancelar visível durante a simulação e não apagar uma prévia válida enquanto outra consulta ainda está concorrente.

Adicionar testes de UI para: `Processar` disparando a simulação interna, prévia sem bloqueio visível antes da senha, prévia com bloqueio sem senha e TTL/reconsulta.

### P0 — cálculo posterior não reproduz os SQLs do módulo

`LegacyInventarioProcessingReadRepository` deve ser corrigido porque:

- escolhe o último movimento por `MAX(numero)`, mas a regra do módulo usa o último movimento por data e lançamento (`data DESC, lancto DESC`) até a data do Inventário;
- agrega posteriores com `m.tipomovimento LIKE '%+'`, enquanto a regra legada usa posições da coluna `operacao` e separa estoque, reserva, reserva prévia e demais saldos;
- soma todo o posterior em `posteriores_liquido` e o `ProcessingPlanBuilder` aplica o resultado somente em `emEstoque`, sem ajustar separadamente `reservado` e `reservaprevia`;
- não constrói o snapshot equivalente de `movimentoslotes` para Produtos controlados por lote;
- a consulta de posteriores não restringe explicitamente `i.filial = $filial` no mesmo conjunto mestre;
- o caminho por lote usa os valores persistidos em `inventarioprodutoslotes`, em vez da fotografia histórica de `movimentoslotes` até a data e dos posteriores por lote.

Implementar um snapshot set-based, com orçamento fixo de queries, contendo por Produto e por Lote:

1. último movimento até `inventario.data`, escolhido por `(data DESC, lancto DESC)`;
2. saldos separados: estoque, reserva, reserva prévia, trânsito, demonstração, conserto e danificada;
3. agregações posteriores por posição de `operacao`, com o mesmo corte `processamento > datahoraalteracao` e até o instante projetado;
4. custo médio, financeiro, valor de custo e fallback do último movimento elegível;
5. movimentos posteriores detalhados com Produto, lote, operação, tipo, data, processamento, quantidade e valor;
6. equivalentes para `movimentos` e `movimentoslotes`, sem buscar último movimento em `foreach`.

Usar `DISTINCT ON`/window function/CTE/agregação conforme PostgreSQL e o schema confirmado. Não substituir a semântica de `operacao` por inferência textual de `tipomovimento`.

### P0 — diferença e saldo após processamento estão incorretos

O builder calcula `diferenca` como `quantidade - emEstoque`, ignorando reserva, reserva prévia e movimentado posterior. Também inicializa `saldoApos` apenas com estoque e atualiza somente efeitos `IE+`/`IE-`.

Corrigir o plano para usar a fórmula do domínio:

- diferença baseada no saldo recalculado completo exigido pelo módulo;
- diferença positiva gera somente `IE+`;
- diferença negativa abate `IE-`, depois `IR-`, depois `IP-`;
- trânsito não é abatido;
- `saldo_antes` e `saldo_depois` devem ser calculados por efeito e aparecer no DTO/grid;
- `saldo_apos_processamento` deve considerar todas as posições previstas pelo legado, não apenas estoque;
- resumo deve conter também financeiro/custo de processamento e status de bloqueio;
- não somar a quantidade do inventário de lote ao saldo global de cada lote nem reutilizar saldo de produto em todos os lotes.

O resultado do plano deve ser determinístico e idêntico antes do INSERT no modo simulação e no modo F8.

### P0 — persistência não é equivalente ao movimento efetivo

`LegacyInventarioMovimentoWriteRepository::persistirPlano` atualmente:

- grava todos os efeitos em `movimentos`, mesmo quando o efeito possui lote;
- não grava o conjunto de campos necessários para preservar `operacao`, `processamento`, data do Inventário, lote e demais defaults/triggers confirmados;
- atribui `movimentos.numero` por `InventarioMovimentoNumeroAllocator`, embora no legado esse campo seja gerado pelo trigger da tabela `movimentos`;
- usa `now()->toDateString()` em vez da data/regra temporal do plano;
- força `financeiro = '0.00'` sem prova do schema, embora a regra de preenchimento de `financeiro` deva vir do writer/triggers compartilhados;
- atualiza somente `emestoqueprocessamento`, `financeiroprocessamento` e `customedioprocessamento`, deixando de atualizar as demais colunas `*processamento` previstas;
- não atualiza os campos de processamento de `inventarioprodutoslotes` quando o plano tem lote.

Corrigir usando o mesmo writer/contrato de movimento do domínio de estoque. O Laravel não deve informar, calcular, reservar ou alocar `movimentos.numero`: deve omitir o campo ou enviá-lo como nulo conforme o contrato de persistência, deixando exclusivamente o trigger de `movimentos` gerar o número no INSERT efetivo. A prévia não pode executar INSERT nem disparar o trigger. Antes de escolher `movimentos` ou `movimentoslotes`, confirmar o snapshot de schema e a semântica autoritativa. Não inventar defaults e não preencher `financeiro` por conveniência. A prévia deve exibir exatamente o valor que o INSERT efetivo usará.

Adicionar teste real de persistência por lote e comparar, antes do INSERT, a lista do plano com os registros efetivamente gravados.

### P0 — invariantes F8 ainda não são aplicadas

`ProcessarInventarioCommand` valida situação, escopo, coleta e posterior, mas a versão revisada ainda não aplica no mesmo plano/transação todos os bloqueios previstos:

- `confirmar_zerar` é aceito no request, mas não é encaminhado nem validado;
- quantidade não inventariada/`selecionadosistema` não é contada nem exige confirmação explícita;
- limite de dias para processamento não é revalidado;
- soma de lotes não é revalidada no F8;
- saldos negativos posteriores e residual devem ser apresentados/aplicados conforme a matriz 478/485;
- a atualização “antes” e a atualização “após” do processamento não podem ser confundidas.

O F8 deve bloquear o Inventário na transação, reconstruir o plano, revalidar todas as invariantes e só então persistir movimentos, campos `*processamento` e situação `P`. Falha mantém `A` sem escrita parcial.

### P1 — identidade da prévia e segurança

O confronto por `plan_hash` não basta sozinho. O F8 deve verificar que `previa_id` pertence ao usuário autenticado, ao Inventário, à Filial e à revisão enviados, está em estado `ready`, não expirou e contém o mesmo hash do plano recalculado. Uma prévia de outro Inventário/usuário não pode ser aceita por coincidência de hash.

Invalidar o blob após sucesso ou conflito terminal. Não aceitar resultado `failed`, `cancelled`, inexistente ou de outra operação.

### P1 — teste proibido e evidência insuficiente

Remover `getDriverName()`/teste condicional de driver de `CadastroInventarioPreviaF8ParityPostgresTest.php`. A regra do projeto é: nunca testar driver. O teste PostgreSQL deve ser marcado pelo grupo/harness da suíte e testar diretamente a paridade real, sem `if` que transforme ausência de PostgreSQL em falsa aprovação.

Não marcar paridade PostgreSQL como concluída apenas com um teste que verifica o driver. Registrar evidência somente de execução efetiva da consulta/INSERT, usando o comando padrão do projeto.

## Regras SQL e arquitetura

- Um `ProcessingPlanBuilder` único para simulação e F8.
- Snapshot set-based com teto fixo de statements, independente da quantidade de Produtos/Lotes.
- `IN`, `= ANY(array)` ou `unnest` para conjuntos; nenhum SELECT por Produto, Lote ou efeito.
- `INNER JOIN` quando relação e campos obrigatórios `NOT NULL` forem comprovados; `LEFT JOIN` somente para ausência funcionalmente permitida.
- Sem concatenação de SQL, fragments vindos do navegador, teste de driver, `hasTable`/`Schema::has*` ou introspecção de schema em runtime.
- Filtros de colunas somente por whitelist de catálogo.
- Não criar fallback vazio quando o schema não confirmar objeto obrigatório; falhar de forma observável e manter o gate.

## Aceite obrigatório

- O fluxo `Processar`, sem bloqueio, exibe a prévia antes da senha.
- O fluxo `Processar`, com posterior, altera os saldos corretos por posição e mostra a causa detalhada.
- Com `data = processamento`, nenhuma movimentação posterior é incluída no cálculo.
- Com `processamento > data`, somente o intervalo `(data, processamento]` é incluído; o movimento gerado mantém `data = inventario.data`.
- Alterar qualquer uma das duas datas invalida a prévia e força recálculo antes da autorização.
- Simulação de Produto com lote usa histórico e movimentos de lote.
- Diferença atravessando estoque, reserva e reserva prévia gera `IE-`, `IR-`, `IP-` na ordem.
- A prévia interna não grava nem dispara o trigger nem consome numeração de `movimentos`; o processamento efetivo grava os movimentos dentro da transação, como no Delphi.
- F8 sem confirmação de zerar é recusado quando necessário.
- Mudança entre prévia e F8 gera 409, mantém `A` e grava zero movimentos.
- Paridade simulação × F8 compara tipo, operação, lote, quantidade, custo, valor, data e campos de processamento.
- Query budget permanece constante em N Produtos/Lotes.
- Testes de PHP/JS executam no ambiente suportado; falha de ambiente deve ser reportada, não convertida em evidência `pass`.

## Entrega

Produzir a especificação corretiva, atualizar contratos/testes/evidências e gerar tasks implementáveis. Não alterar código de produção nesta etapa e não executar `/speckit.specify` dentro deste prompt.
