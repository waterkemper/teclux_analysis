# Definir o contrato de dados e do saldo histórico do Relatório de Situação dos Fornecedores

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual contrato de domínio e Application deve fixar o intervalo, a seleção histórica de Documentos, o Documento principal como cabeçalho, seu valor total, o Saldo Devedor na Data de Situação, os vencimentos e a Fotografia de Relatório sem duplicar a arquitetura de Contas a Pagar?

## Answer

### Temporalidade e universo

- `start_date` e `situation_date` são obrigatórias, inclusivas e `start_date <= situation_date`.
- A data inicial limita a entrada da nota (`notaspag.data`) ou o lançamento do Documento sem nota (`documentospag.datalancto`). A data de situação é simultaneamente o limite superior de inclusão e o corte financeiro.
- O seletor legado de tipo de data não será exposto: ele é inoperante e a consulta efetiva não usa emissão.
- A posição é reconstruída na geração a partir dos registros financeiros atualmente persistidos e de suas datas efetivas. A fotografia registra a data funcional de situação e o instante técnico da geração; não se cria um razão bitemporal para reconstruir fatos depois alterados ou estornados.
- Por padrão entram todos os Documentos do intervalo, inclusive os quitados até o corte. O filtro “Somente vencimentos em aberto” restringe a Documentos com Saldo Devedor na Data de Situação positivo.

### Documento, vencimentos e medidas

- O Documento a Pagar é a identidade/cabeçalho mestre; suas Duplicatas formam a lista de vencimentos, ordenada por data e número.
- “Valor total do documento” é o valor cadastrado da nota/Documento (`valornota`/`documentospag.valor`). A soma nominal dos vencimentos é uma medida separada e nunca substitui o total cadastrado.
- O Saldo Devedor na Data de Situação é a soma nominal de `valorvencto` dos vencimentos sem pagamento ou pagos depois do corte. Juros, descontos e diferença do pagamento não reduzem nem aumentam esse saldo nominal.
- “Valor pago” soma o `valorpagto` efetivo. “Valor nominal quitado” soma o valor nominal dos vencimentos pagos até o corte. Juros/descontos preservam separadamente a diferença entre nominal e efetivo, com sinal e rótulo claros.
- Documento sem vencimentos conserva seu valor total, recebe `balance_status = NOT_ASSESSABLE` e exibe “Saldo não apurável — sem vencimentos”; não recebe saldo zero nem total integral inferido e não entra no filtro de abertos.
- A fotografia guarda valores originais e medidas derivadas necessárias à reconciliação.

### Filtros tipados

- Preservar: período; Parte Fornecedora; tipo da parte `C`/`F`/`L`; Filiais/Grupos; Naturezas; previsão `WITH`/`WITHOUT`/`ONLY`; existência de vencimentos `WITH`/`WITHOUT`/`BOTH`; tipos de fornecimento; somente abertos; somente Documentos com nota; agrupamentos; ordenação; modo de saída; quebra de página por Parte Fornecedora.
- O filtro legado “Só notas” passa a se chamar “Vencimentos”, com “Com vencimentos” como padrão.
- “Somente documentos com notas” passa a incluir apenas o ramo com `notaspag`, corrigindo o `and FALSE` que zerava todo o resultado.
- Natureza/CFOP selecionada inclui somente Documentos com nota correspondente; Documentos sem nota não possuem o atributo e são excluídos.
- Clientes, Fornecedores e Filiais podem ocupar o papel de Parte Fornecedora. Os três tipos vêm selecionados por padrão e o tipo é exibido para desambiguar identidades.
- A opção invisível “listar notas de clientes” é eliminada, substituída pelo filtro explícito de tipo da parte.
- Todas as condições são validadas e parametrizadas; não há SQL, macro ou coluna arbitrária proveniente do browser.

### Agrupamento e totais

- Hierarquia determinística: Grupo de Filiais opcional → Filial opcional → Parte Fornecedora obrigatória → Documento → vencimentos.
- Resumo consolida por Parte Fornecedora, mantendo subtotais opcionais por Filial e Grupo de Filiais.
- Modos: detalhe com resumo, somente detalhe e somente resumo. A Fotografia de Relatório sempre preserva todos os Documentos e vencimentos; o modo muda apenas a apresentação.
- Subtotais e total geral preservam separadamente: valor cadastrado dos Documentos; soma nominal dos vencimentos; valor pago efetivo; valor nominal quitado; juros/descontos; impostos retidos; saldo devedor apurável; quantidade e valor dos Documentos com saldo não apurável.
- O valor cadastrado de todos os Documentos incluídos participa dos totais, inclusive quando não há vencimentos.

### Reuso do pipeline e contrato de Application

O pipeline atual recebe um discriminador versionado `report_type`; `SUPPLIER_SITUATION` seleciona somente a estratégia/read model histórico e os renderers hierárquicos específicos. Não se duplica tabela de gerações, estados, jobs, storage, hash, histórico, autorização, Auditoria de Relatório, cancelamento, retry, shell, PDF ou impressão.

```text
request(SupplierSituationReportRequest, OperatorContext): ReportGenerationAccepted
status(ReportGenerationId, OperatorContext): ReportGenerationStatus
cancel(ReportGenerationId, OperatorContext): ReportGenerationStatus
retry(ReportGenerationId, OperatorContext): ReportGenerationAccepted
view(ReportGenerationId, OperatorContext): SupplierSituationReportSnapshot
pdf(ReportGenerationId, OperatorContext): BinaryDocument
```

- A geração usa a mesma transação PostgreSQL somente leitura e snapshot consistente do Relatório de Contas a Pagar.
- A fotografia diferencia `situation_date` funcional de `data_as_of` técnico e incorpora `report_type`, critérios, hierarquia, medidas, totais, versões e integridade ao hash.
- Histórico, autorização e templates discriminam o tipo do relatório para não misturar modalidades de Contas a Pagar com Situação dos Fornecedores.
- O limite compartilhado é de 100.000 registros materializados, contando Documentos e vencimentos. Excesso falha sem fotografia parcial e orienta refinar filtros.

### Correções deliberadas do legado

Não reproduzir o seletor de data inoperante, `and FALSE`, legenda invertida de Clientes, ocultação de juros/desconto pelo literal `1`, nomes enganosos, somas nulas implícitas ou concatenação SQL. As correções acima alteram somente a apresentação/consulta do relatório e não fatos financeiros.
