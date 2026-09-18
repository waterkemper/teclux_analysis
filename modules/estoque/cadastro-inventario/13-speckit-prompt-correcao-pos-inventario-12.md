# Prompt corretivo 13 — revisão pós-inventário 12

## Contexto

Revise a implementação do Cadastro de Inventário no Laravel após o commit 9ee3eb625,
usando laravel/specs/489-fix-inventario-operacao/ e os artefatos de
modules/estoque/cadastro-inventario/. Não solicitar inspeção direta dos fontes Delphi e não
alterar o fluxo funcional já confirmado.

Preservar: trigger/banco como autoridade da máscara e do número dos movimentos, filial e
datas selecionadas, concorrência de lotes, saldo composto, revalidação de negativos, F6
cancelável, F8 transacional, fluxo único Processar e exceção SQLite somente na infraestrutura
dos testes.

## Correções obrigatórias

### 1. Fechar a semântica da máscara persistida

O banco/trigger gera ou normaliza movements.operacao e movimentoslotes.operacao. O Laravel
não deve montar, alterar, substituir ou recalcular a máscara a partir de tipomovimento e não
deve consultar tiposmovimentos para recriar essa regra.

Depois da persistência, usar uma única expressão compartilhada para movimentos e lotes:

- posição 1: + soma e - subtrai;
- posição 2: + soma e - subtrai;
- posição 3: somente - subtrai; + não soma;
- posição 9: + soma e - subtrai;
- janela: data do movimento > Data do Inventário e <= Data do Processamento.

Reproduzir o SQL legado capturado usando ABS(quantidade) antes do sinal, ou comprovar no
schema/domínio que quantidade é sempre não negativa e testar essa invariável. Nunca aplicar
dupla inversão de sinal.

Resolver a divergência entre o contrato que chama movimentado de posição 1 e o SQL legado
capturado, que calcula o campo movimentado pela soma assinada das posições 1, 2, 3 e 9.
Registrar um único contrato autoritativo. Como regra de paridade com o SQL fornecido, o campo
movimentado do inventário deve usar a expressão composta; os campos posteriores_* continuam
separados por posição. Aplicar o mesmo contrato em F6, prévia, plano e F8, em produto e lote.

A concorrência por processamento/datahoraalteracao continua separada e nunca entra novamente
na soma.

### 2. Completar a paridade por lote

Para cada lote pertencente ao inventário, F6 deve expor a mesma fotografia usada pela prévia,
pelo plano e pelo F8:

- saldo inicial e projeção;
- diferença;
- movimentado;
- custo unitário/custo médio;
- financeiro e financeiroprocessamento;
- saldo após processamento e componentes;
- campos inventarioprodutoslotes.*processamento.

O DTO atual de lotes não pode ficar limitado a quantidade e saldos básicos. Buscar custos e
financeiro pelos campos/fallbacks comprovados em movimentoslotes, estoqueslotes e no SQL
capturado, sem copiar o resumo do produto para os lotes.

O plano deve produzir resumo e efeitos por Produto + Filial + Lote. O writer deve atualizar
cada inventarioprodutoslotes com o próprio resumo. Não gravar o mesmo
custo_unitario, financeiroprocessamento ou saldos agregados do produto em todos os lotes.

Totais do produto devem fechar pela soma dos lotes quando o produto for controlado por lote.
F6, relatório, prévia, plano e F8 devem usar a mesma fotografia e os mesmos valores. Usar
consultas set-based, sem consulta por produto ou lote.

### 3. Validar pai/detalhe e identidade

Auditar a deduplicação de posteriores e negativos pela identidade número do movimento +
produto + lote. Quando movimentos e movimentoslotes representarem o mesmo fato, manter uma
única ocorrência, com lote e origem movimento_lote. Isso deve funcionar também quando o pai
já tiver loteproduto preenchido.

A mesma identidade deve ser usada no painel, concorrência, prévia e plano. Criar fixture com
pai e filho do mesmo movimento, produto e lote; comprovar uma ocorrência e uma única contagem
de bloqueio.

### 4. Fortalecer o teste do trigger

Criar teste PostgreSQL autoritativo que:

- insira movimento somente com campos de entrada;
- omita numero e operacao do INSERT;
- leia numero e operacao após o trigger;
- valide as posições 1, 2, 3 e 9, sinais, ABS e datas-limite;
- valide a mesma máscara em movimentoslotes;
- confirme que o lote usa o identificador retornado do movimento pai;
- compare F6, prévia e F8.

Não inserir operacao manualmente no caminho de produção nem gerar máscara alternativa no
Laravel. Em SQLite, o helper pode apenas preparar a infraestrutura ou marcar o teste
PostgreSQL/trigger como não aplicável.

### 5. Remover inspeção textual restante

Substituir testes do módulo que leiam código-fonte para procurar driver, schema, allocator
ou insertGetId. Revisar explicitamente InventarioNumeroAllocatorTest.php e qualquer teste
equivalente.

Os testes devem verificar comportamento com fixtures. A exceção SQLite permite detectar
driver/schema somente no bootstrap/helper para compatibilidade ou para marcar teste
PostgreSQL/trigger como não aplicável; não permite escolher query de negócio, esconder falha
de schema ou substituir teste funcional.

## Aceite mínimo

1. A operação persistida pelo banco é interpretada sem máscara criada no Laravel.
2. A expressão usa posições 1, 2, 3 e 9, sinais corretos, ABS quando exigido pelo SQL e a
   mesma regra em produto e lote.
3. O campo movimentado e os campos por posição não mantêm fórmulas divergentes entre F6,
   prévia, plano e F8.
4. Dois lotes com custos e saldos diferentes permanecem diferentes em todas as superfícies.
5. Campos *processamento dos lotes não recebem o resumo agregado do produto.
6. Pai e detalhe geram uma ocorrência e uma contagem.
7. O trigger fornece numero e operacao e o ID do pai alimenta movimentoslotes.
8. Nenhum teste usa inspeção de fonte para decidir comportamento; SQLite fica isolado na
   infraestrutura.
9. Não há N+1 nem alteração de número/máscara no writer.

Ao concluir, informar arquivos alterados, testes executados e bloqueios ou divergências de
schema. Não criar botão ou rota de Simular processamento.
