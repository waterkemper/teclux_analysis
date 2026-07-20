Type: task
Status: resolved
Blocked by: 01, 02

## Question

Confrontando UI Delphi e triggers PostgreSQL, qual modelo de domínio descreve Tipo de Movimento, string `operacao`, Movimento principal/relacionado, transferência, composto, Lote e efeitos em cada saldo/valor; qual é a fronteira transacional; e quais regras são invariantes do banco, validações antecipáveis no Laravel ou legado a não reproduzir?

## Answer

### Decisão de domínio

O módulo deve ser modelado como o comando **Registrar Lançamento Avulso**, e não como CRUD de `movimentos`. O usuário declara uma intenção por meio de um **Movimento-raiz**; o PostgreSQL resolve o Tipo, calcula a linha cronológica, atualiza as projeções e pode criar um grafo de Movimentos relacionados. A unidade de sucesso é esse grafo inteiro dentro de uma única transação.

Para Lançamentos Avulsos, a operação funcional é somente **inclusão**. Movimento confirmado é imutável pela interface. Alteração e exclusão herdadas do formulário Delphi não fazem parte do contrato. Eventual correção futura deve ser outro Movimento compensatório/estorno com Tipo explícito, nunca UPDATE/DELETE retroativo genérico.

### Vocabulário

- **Tipo de Movimento**: regra cadastrada em `tiposmovimentos`; define `operacao`, eventual Tipo/contrapartida de transferência e política de negativo.
- **Operação**: vetor posicional de 20 caracteres. É configuração server-side do Tipo, não dado informado pelo usuário.
- **Movimento-raiz**: única linha que a aplicação pede para inserir em `movimentos`.
- **Movimento relacionado**: linha criada/mantida pelas triggers por composição, negativo ou transferência, ligada ao Movimento originador pelas FKs `cmpmovimento`, `negmovimento` ou `trfmovimento`.
- **Livro de Movimentos**: sequência por Produto + Filial ordenada por Data + `lancto`; cada linha contém os saldos resultantes após aquele evento, além dos dados de entrada.
- **Projeção de Estoque**: `estoques`, estado corrente por Produto + Filial, derivado do último elo do livro.
- **Livro por Lote**: `movimentoslotes`, derivado de `movimentos` quando o Produto gerencia lote.
- **Projeção por Lote**: `estoqueslotes`, estado corrente por Produto + Filial + Lote.

### Movimento-raiz: dados declarados e dados derivados

O comando pode declarar:

| Grupo | Dados aceitos |
|---|---|
| Identidade operacional | Produto, Filial, Tipo de Movimento, Data |
| Magnitude | Quantidade e, quando aplicável, Valor, Preço sem ICMS, Preço com ICMS, Valor da última compra |
| Contexto | Referência, Lote, Filial de destino de transferência |
| Auditoria | Usuário logado e, quando exigido, Usuário autorizador |
| Controle da requisição | chave idempotente/request ID, fora do contrato livre da tabela |

O banco deriva ou controla: `numero`, `lancto`, `operacao`, Grupo, saldos de quantidade, Financeiro, datas/valores de última entrada/compra/venda, agregados vendido/comprado, custo, movimentos relacionados, movimentos de lote e projeções. A aplicação não envia snapshots, deltas por coluna, `operacao`, relações derivadas ou flags de bypass.

`naoprocessartriggers` e `naoprocessartriggersdepois` são mecanismos internos/legados e ficam proibidos no fluxo normal. `comexcecaosenegativo` também não é uma permissão livre do request.

### Contrato posicional de `operacao`

| Pos. | Alvo/efeito confirmado |
|---:|---|
| 1 | `emestoque` |
| 2 | `reservado` |
| 3 | `transito` |
| 4 | `demonstracao` |
| 5 | `conserto` |
| 6 | `futuro` |
| 7 | `danificada` |
| 8 | `estoquefisico` |
| 9 | `reservaprevia` |
| 10 | última entrada, quando `=` |
| 11 | última compra: data, quantidade, preços, IPI e valor |
| 12 | `financeiro` |
| 13 | última venda e agregado vendido |
| 14 | compra e agregado comprado |
| 15 | reservado/sem efeito confirmado |
| 16 | `acabados` |
| 17 | `semiacabados` |
| 18–20 | reservados/sem efeito confirmado |

Semântica confirmada para saldos quantitativos: `+` soma o valor absoluto da Quantidade ao saldo anterior; `-` subtrai; `=` substitui o saldo; `*` mantém/não atua. A trigger absolutiza Quantidade antes de aplicar o sinal, por isso o contrato público exige Quantidade não negativa.

No Financeiro, as triggers interpretam `+`, `-`, `=`, `*` e `C`; `C` representa cálculo por custo médio, não um valor financeiro livre. Nas posições 10 e 11, `=` aciona a atualização do respectivo conjunto de dados. Nas posições 13/14, o sinal alimenta os agregados de venda/compra. Símbolos fora do conjunto válido para a posição tornam o Tipo inconsistente e devem impedir seu uso.

O Laravel pode usar `TipoMovimentoOperacaoMapper` para apresentar/validar a configuração, mas a trigger continua sendo a interpretação executável. Há divergência documental antiga sobre “15–20 reservadas”; a base confirma 16/17 ativos, então o contrato correto é o quadro acima.

### Elegibilidade e forma dinâmica

Um Tipo é elegível quando existe, não está inativo, não é interno, sua operação não é `********************` e o vetor é estruturalmente válido. O servidor relê isso no momento do comando.

A forma deriva do Tipo:

- Quantidade é requerida quando alguma posição quantitativa atuante depende dela; para `+`/`-`, deve ser maior que zero.
- Valor/preços aparecem somente quando a posição financeira ou última compra os utiliza; `C` não autoriza valor financeiro arbitrário.
- Valor da última compra é editável somente quando a posição 11 é `=` e o Produto não é composto.
- Filial de destino é obrigatória quando o Tipo possui transferência.
- Lote é obrigatório quando a característica do Produto gerencia lote/validade.

Habilitação da UI é conveniência; o servidor valida a combinação completa e ignora/rejeita campos incompatíveis para evitar payload ambíguo.

### Grafo de efeitos

```text
Movimento-raiz
├── atualiza cadeia Produto + Filial ──► estoques
├── se há Lote ──► movimentoslotes ──► estoqueslotes
├── se Produto composto ──► movimentos de componentes ──► estoques dos componentes
├── se política de negativo ──► movimento de compensação
└── se transferência ──► movimento de contrapartida na Filial destino
```

O Movimento relacionado é efeito do banco, não segundo INSERT do Laravel. Relações de composição, negativo e transferência devem ser descobertas pelas FKs do grafo, sem inferir números ou quantidade de filhos no cliente.

#### Transferência

O usuário informa origem, destino e Tipo-raiz. Origem e destino devem ser diferentes, ambas autorizadas, e o Produto deve possuir Estoque coerente nas duas. A trigger resolve o Tipo de contrapartida e cria/atualiza o Movimento relacionado na Filial destino. O Laravel não cria manualmente “saída + entrada”; isso duplicaria o efeito.

#### Produto composto

O parâmetro **“lançamentos avulsos de produtos compostos”** decide se o Produto pode ser selecionado. Quando permitido, a trigger gera Movimentos dos componentes, rateia valores/preços e recalcula a disponibilidade do composto pelo mínimo disponível dos componentes dividido pela quantidade de composição. O Laravel não explode a composição. Última compra permanece não editável para composto.

#### Negativo

Quando `emestoque` ficaria negativo e o Tipo permite `quandoestoquenegativo`, a trigger retém a parcela em `qtdnegativa`, mantém `emestoque` em zero e gera a compensação relacionada. Nos demais casos protegidos, saldo ou Financeiro negativo lança exceção quando `comexcecaosenegativo` está ativo. Isso é política do banco/Tipo, não autorização implícita para o usuário forçar negativo.

#### Lote

Para Produto gerenciado por lote, o banco exige `loteproduto`. O AFTER de `movimentos` cria/atualiza `movimentoslotes`; a trigger desse livro bloqueia e atualiza `estoqueslotes`. A atomicidade é a mesma do Movimento-raiz. Lote deve pertencer ao Produto e ser consultado no contexto Produto + Filial; o saldo agregado não substitui a validação do saldo do lote.

### Ordem cronológica e concorrência

`lancto` é sequência diária por Produto + Filial e `numero` é identidade global canônica, ambos atribuídos pelo banco. A linha anterior é buscada por Data + `lancto`; inserir, atualizar ou excluir no passado pode forçar recálculo dos elos seguintes e de seus derivados.

As triggers executam `FOR UPDATE` nas projeções de Estoque/Lote, serializando concorrência por chave materializada. A aplicação não usa `MAX()+1`, não mantém um snapshot como autoridade e não transforma uma pré-validação de saldo em garantia. Exceção, deadlock ou conflito faz rollback; retry automático só pode ocorrer sob a mesma chave idempotente e com política explícita.

### Fronteira transacional

A transação de negócio começa antes de reservar a intenção idempotente e termina somente depois de:

1. validar/consumir a autorização aplicável;
2. fixar contexto de auditoria;
3. reler Tipo, Produto, Filiais e Lote;
4. inserir o Movimento-raiz;
5. as triggers concluírem todos os Movimentos relacionados e projeções;
6. capturar a identidade e o resultado mínimo para resposta.

Qualquer falha reverte Movimento-raiz, relacionados, livros de lote, projeções, agregados e reserva idempotente. A leitura completa da tela pode ocorrer após commit em nova consulta, evitando transação longa. Não existe commit parcial aceitável.

### Identidades expostas pela API

O resultado canônico deve sempre expor `movimento_raiz.numero`. Para rastreabilidade e testes, o backend deve consultar o grafo após a inserção e poder retornar uma lista de relacionados com `numero`, espécie (`componente`, `negativo`, `transferencia`), Produto, Filial e vínculo ao originador. Essa lista é informativa; o consumidor não depende de quantidade fixa nem grava esses registros.

As projeções devolvidas são snapshots lidos após o processamento, identificados por Produto + Filial e, no lote, Produto + Filial + Lote. Elas não fazem parte do payload de escrita.

### Classificação das regras

#### Invariantes garantidos pelo banco

- identidade e ordenação `numero`/`lancto`;
- `operacao` e transferência carregadas do Tipo cadastrado;
- bloqueio da projeção concorrente;
- cálculo dos saldos da linha e atualização de `estoques`;
- criação/manutenção de relacionados de composto, negativo e transferência;
- cadeia `movimentoslotes` → `estoqueslotes`;
- recálculo cronológico e rollback atômico em exceção;
- exigência de Lote para característica gerenciada;
- política efetiva de negativos e Financeiro;
- auditoria/timestamps das tabelas por triggers.

#### Validações antecipáveis e obrigatórias no Laravel

- permissão do módulo, Filiais autorizadas e autorização sensível;
- Tipo elegível e vetor estruturalmente válido;
- Produto permitido, relação de Estoque origem/destino e parâmetro de composto;
- Lote coerente com Produto + Filial quando exigido;
- campos requeridos/permitidos conforme Tipo;
- Quantidade não negativa e maior que zero quando aplicável;
- destino diferente da origem;
- data dentro da política contábil;
- comprimentos, escalas monetárias e referência;
- idempotência e coerência da repetição;
- prévia de saldo/custo apenas para mensagem/decisão de UX, nunca como garantia concorrente.

#### Legado que não será reproduzido

- UPDATE direto de `estoques.valorultimacompra` sem Filial;
- escrita direta em `estoques`, `estoqueslotes` ou filhos derivados;
- Filiais globais sem escopo do usuário;
- número por `MAX()+1` no PostgreSQL;
- `operacao`, saldos ou flags de bypass vindos do cliente;
- validação negativa apenas em memória e somente posições 1–7;
- transação HTTP aberta esperando confirmação de custo;
- edição/exclusão por herança técnica do cadastro;
- SQL de diagnóstico gravado em `c:\lancamentosprodutos.sql`;
- habilitação contraditória de campos como regra de domínio.

### Consequência para o desenho Laravel

O limite de escrita deve aceitar uma intenção pequena, inserir uma única raiz e tratar o banco como autoridade do resultado. O próximo desenho de fluxo deve decidir como obter confirmação prévia de efeitos financeiros/custo sem transação longa, como materializar idempotência e como traduzir exceções, preservando este contrato imutável e trigger-aware.
