# Definir o contrato de dados e da fotografia do Relatório de Contas a Pagar

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Qual contrato de domínio/Application deve fixar as três modalidades, filtros, cálculos, agrupamentos, totais e uma fotografia imutável e autorizada que produza conteúdo idêntico no preview, PDF e impressão?

## Answer

O caso de uso é estritamente somente leitura e possui uma única superfície profunda de geração/consulta:

```text
request(AccountsPayableReportRequest, OperatorContext): ReportGenerationAccepted
status(ReportGenerationId, OperatorContext): ReportGenerationStatus
view(ReportGenerationId, OperatorContext): AccountsPayableReportSnapshot
pdf(ReportGenerationId, OperatorContext): BinaryDocument
```

### Modalidades e dimensão temporal

- `OPEN_PAYABLES` / **Contas a Pagar**: somente Duplicatas não pagas; período principal por vencimento.
- `ACCRUAL` / **Contas por Competência**: Duplicatas abertas e pagas; período principal pela competência efetiva.
- `PAID` / **Pagamentos Efetuados**: somente Duplicatas pagas; período principal por data de pagamento.

Em regime de caixa, Competência filtra/agrupa por vencimento e usa valor de vencimento. A fotografia guarda dados originais e competência/valor efetivos, ainda que o layout mostre apenas os efetivos por padrão.

### Filtros tipados e condicionais

O request normaliza e valida período principal e período de emissão inclusivos; ao menos um intervalo é obrigatório. Também admite Filiais ou Grupos de Filiais autorizados, Parte Fornecedora ou Grupo, Tipo de Fornecimento, Banco, Conta, DDA, Evento, Documento, agrupamentos, ordenação e nível de detalhe.

Habilitação:

- Previsões e Autorizadas: somente `OPEN_PAYABLES`;
- Tipo de Pagamento e Adiantamentos: somente `ACCRUAL` e `PAID`;
- Banco: cobrança em `OPEN_PAYABLES`/`ACCRUAL`, Conta de pagamento em `PAID`;
- DDA, emissão, Filiais, Parte Fornecedora, Eventos e Documentos: quando aplicáveis ao ramo consultado.

Adiantamentos oferecem `WITH`, `WITHOUT`, `ONLY`, com padrão `WITHOUT`. Em Contas a Pagar o controle não aparece e Adiantamentos são excluídos. Filtros desabilitados não entram ocultamente no request/snapshot.

Eventos e Documentos preservam operadores/listas e composição `AND/OR`, representados por árvore tipada, validada e parametrizada. É proibido SQL/macros vindos do browser. A fotografia guarda a árvore normalizada e sua descrição legível.

### Linhas, medidas, agrupamentos e layouts

O read model combina Duplicatas e Adiantamentos com discriminação explícita; Adiantamento é linha sintética sem identidade falsa de parcela.

Cinco medidas financeiras permanecem distintas em linhas/subtotais/totais:

1. valor no vencimento;
2. desconto cadastrado (`valordesconto`);
3. valor pago;
4. juros pagos (`max(valorpagto - valorvencto, 0)`);
5. desconto obtido no pagamento (`valorvencto - valorpagto` quando pagamento não zero e inferior).

Valor líquido é derivado como valor no vencimento menos desconto cadastrado. Desconto cadastrado e obtido nunca são fundidos.

Agrupamentos independentes: Grupo de Filiais, Filial, Parte Fornecedora, Data e Documento, com ordem determinística e subtotal das cinco medidas por nível. Níveis de detalhe: `DETAIL_WITH_SUMMARY`, `DETAIL_ONLY`, `SUMMARY_ONLY`.

### Fotografia imutável

Toda solicitação cria `report_generation_id` e job; não existe caminho síncrono alternativo. Estados: `QUEUED`, `RUNNING`, `COMPLETED`, `FAILED`, `EXPIRED`.

O job abre transação PostgreSQL somente leitura com snapshot consistente (`REPEATABLE READ` ou equivalente), registra `data_as_of` e materializa em envelope persistente e imutável:

- versão do contrato/template;
- filtros normalizados e descrição impressa;
- escopo de Filiais e identidade do Operador;
- linhas tipadas e dados originais/efetivos;
- árvore/ordem de agrupamentos;
- subtotais/totais e contagens;
- moeda/formatação e metadados de geração;
- integridade/hash do conteúdo.

Preview HTML, PDF e impressão consomem somente a mesma fotografia; nunca reconsultam o legado. Template Laravel versionado é único para a versão da fotografia. Overrides `.fr3` não são importados nem executados.

A fotografia é retida por 7 dias e depois marcada `EXPIRED`/removida conforme política. Em cada status/view/PDF/impressão, revalidar Permissão de relatório e acesso a todas as Filiais fotografadas. O criador ou outro Usuário igualmente autorizado pode acessar; possuir ID/link não concede acesso.

### Limites, integridade e falhas

Limite de 100.000 linhas. Ao exceder, o job falha e não publica fotografia parcial, preview ou PDF; orienta refinar filtros. Consultas são parametrizadas, respeitam ADR-0007 e falham explicitamente diante de schema incompatível.

O gerador calcula linhas e agregados no servidor e reconcilia contagens, subtotais e totais antes de concluir. `COMPLETED` só ocorre depois de fotografia persistida, hash verificado e invariantes satisfeitos. Falha nunca altera fatos financeiros.

Este contrato corrige fragilidades legadas: não replica macro administrativa residual, `Autorizado_Adiantamento_nonononon`, concatenação SQL ou customizações FastReport desconhecidas.
