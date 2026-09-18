# Prompt corretivo 14 - revisao pos-inventario 13

## Contexto

Revisar a implementacao do Cadastro de Inventario no Laravel no commit
0eba12e42, comparando com laravel/specs/489-fix-inventario-operacao/ e seus
contratos. Nao alterar o fluxo funcional ja confirmado: banco/trigger como
autoridade de numero e operacao, fluxo unico Processar, F6 cancelavel, F8
transacional, duas datas, saldo composto, concorrencia separada da projecao e
excecao SQLite apenas na infraestrutura de testes.

A soma assinada das posicoes 1, 2, 3 e 9 com ABS ja foi implementada. Nao
reverter essa regra e nao voltar a usar apenas posteriores_emestoque.

## Correcoes obrigatorias

### 1. Unificar identidade e escopo de lote

As consultas de projecao, negativos, concorrencia e posteriores devem usar a
mesma identidade de lote:

- Produto + Filial fisica + lote pertencente a inventarioprodutoslotes;
- para movimentoslotes, lote efetivo = COALESCE(loteproduto, lote);
- movimentos de lote fora do conjunto do inventario nao podem influenciar F6,
  previa, plano, F8, negativos ou bloqueio.

Corrigir as agregacoes que ainda relacionam somente ipl.lote = ml.lote,
especialmente f6NegativosAgg e negativosAgg. Aplicar o mesmo criterio ao
movimento pai que possui loteproduto: se o produto for controlado por lote,
restringir o pai ao lote do inventario; nao exibir nem bloquear por lote externo.

A deduplicacao pai/detalhe deve ser deterministica independentemente da ordem
das fontes. Para o mesmo numero do movimento, produto e lote, manter uma
ocorrencia, preferindo a origem movimento_lote e o lote preenchido. Comprovar
isso no painel de negativos, na lista de posteriores e na contagem de
concorrencia.

Criar testes para:

- dois lotes no inventario e um terceiro lote externo;
- pai com loteproduto preenchido e filho movimentoslotes;
- pai sem lote e filho com lote;
- pai e filho apresentados em ordens diferentes;
- movimento somente no lote externo, que nao deve afetar o inventario.

### 2. Corrigir financeiro e custo por lote

Cada linha de lote deve calcular e publicar seus proprios valores, sem copiar
o resumo agregado do produto:

- custo unitario;
- custo medio;
- financeiro;
- financeiro_processamento;
- saldo e componentes apos processamento;
- campos inventarioprodutoslotes.*processamento.

Revisar InventarioFotografiaCampos::mapear. O valor
financeiro_processamento nao pode ser simplesmente o financeiro bruto de
estoqueslotes ou movimentoslotes. Reproduzir a formula do SQL capturado:
quando a quantidade inventariada for diferente de zero, usar o custo unitario
vigente do lote multiplicado pela quantidade inventariada do lote; usar os
fallbacks de ultimo movimento/estoqueslotes somente conforme a evidencia
documentada; quando a quantidade for zero, preservar o fallback financeiro
legado aplicavel.

Manter financeiro, custo unitario e financeiro_processamento como conceitos
distintos. O writer deve persistir o resumo da propria identidade
Produto + Lote em inventarioprodutoslotes, tanto para custos quanto para
campos de processamento.

Testar com quantidade inventariada diferente do saldo atual e com dois lotes
de custos e quantidades diferentes. Verificar numericamente F6, previa, plano,
F8 e registros persistidos; nao testar apenas que os valores sao diferentes.

### 3. Negativo deve ser por lote quando a linha for de lote

O agregado negativo atual e o builder nao podem propagar uma flag negativa do
produto pai para todos os lotes. Retornar a flag negativa por Produto + Lote
para linhas de lote e usar a flag do produto somente para produtos sem lote.

Um lote positivo deve permanecer positivo mesmo que outro lote do mesmo produto
tenha saldo negativo. O painel e as acoes de excluir/copiar devem continuar
revalidando o conjunto no servidor e nao podem incluir lote fora do inventario.

Criar fixture com dois lotes do mesmo produto, apenas um negativo, e comprovar
que somente a linha negativa recebe a flag e pode ser selecionada.

### 4. Fortalecer o teste PostgreSQL do trigger

CadastroInventarioOperacaoMascaraPostgresTest deve validar comportamento do
banco, nao uma mascara fornecida pelo teste:

- inserir movimento omitindo numero e operacao;
- ler numero e operacao depois do trigger;
- validar a mascara persistida nas posicoes 1, 2, 3 e 9, sinais, ABS e
  limites da janela;
- inserir o movimento de lote sem operacao e validar a operacao persistida no
  registro de movimentoslotes;
- confirmar que movimentoslotes.movimento usa o numero retornado do pai;
- comparar os valores persistidos com F6, previa interna e plano/F8.

Remover o INSERT manual de operacao atualmente usado como cenario principal e
nao usar fallback que aceite a operacao do pai quando a operacao do lote for
nula. O teste deve falhar se o banco nao persistir a mascara do lote.

SQLite pode detectar driver/schema somente no helper de infraestrutura para
preparar o ambiente ou marcar o teste PostgreSQL como nao aplicavel. Nao criar
mascara alternativa em PHP, inclusive no SQLite.

### 5. Remover qualquer introspeccao textual restante

Manter o teste comportamental do allocator ja corrigido. Revisar todo o escopo
de testes do Cadastro de Inventario para garantir que nenhum teste leia fonte
da aplicacao para procurar allocator, insertGetId, driver ou schema.

Schema::hasTable, Schema::hasColumn e deteccao de driver continuam permitidos
somente em InventarioSqliteTestSchema ou bootstrap equivalente, exclusivamente
para compatibilidade da infraestrutura SQLite. Nao usar isso para escolher
query de negocio, esconder falha de schema ou substituir teste funcional.

### 6. Tipagem e duplicacao

Adicionar tipo explicito ao parametro rows de
LegacyInventarioReadRepository::mapPosterioresNegativos, conforme as regras
PHP do backend.

O envelope F6 atualmente combina listItens com loadSnapshot. Consolidar a
fotografia de produto e lote em uma fonte autoritativa compartilhada, ou
garantir explicitamente uma leitura consistente unica com a mesma Filial,
datas, joins, corte e formulas. F6 nao pode publicar produto de uma consulta e
lote de outra fotografia que tenha sido alterada entre as leituras. A previa,
o plano e o F8 devem reutilizar o mesmo mapper e a mesma semantica.

Extrair para uma regra/mapper compartilhado a soma de saldos por lote que hoje
aparece separadamente em InventarioConsultaF6Service e
InventarioProcessingPlanBuilder. O mapper compartilhado deve ser a unica fonte
para o fechamento dos totais do produto por lote, sem introduzir uma camada
generica sem consumidor real.

## Aceite minimo

1. Projecao, negativos, concorrencia e posteriores usam a mesma identidade e o
   mesmo escopo de lote.
2. Lote externo nao altera nenhuma superficie do inventario.
3. Cada lote preserva custo, financeiro e campos de processamento proprios,
   com formula numericamente conferida.
4. Produto com dois lotes nao propaga flag negativa para lote positivo.
5. O teste PostgreSQL omite numero e operacao e valida os valores persistidos
   pelo trigger em movimentos e movimentoslotes.
6. Nenhum teste do modulo inspeciona fonte; a excecao SQLite fica isolada no
   helper de infraestrutura.
7. F6, previa, plano e F8 usam uma fotografia consistente e o mesmo mapper.
8. O parametro rows esta tipado e a soma de lotes nao permanece duplicada em
   dois servicos.
9. Nao criar botao, rota ou atalho de Simular processamento.

Ao concluir, informar arquivos alterados, testes executados, resultado dos
testes PostgreSQL e qualquer divergencia observada no schema autoritativo.
