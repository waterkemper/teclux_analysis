# Dossiê — Relatório de Situação dos Fornecedores

## 1. Missão e fontes

Este dossiê fixa o contrato para especificar no Laravel uma página completa de **Relatório de Situação dos Fornecedores**, reutilizando o pipeline já implementado do Relatório de Contas a Pagar e criando somente a estratégia funcional necessária. Ele planeja; não implementa.

Fontes primárias:

- `C:/projetos.vcl/apps/contaspagar/fmrelatoriosituacaofornecedores.pas/.dfm`;
- `C:/projetos.vcl/apps/contaspagar/dmrelatoriosituacaofornecedores.pas/.dfm`;
- [Interface e filtros Delphi](pesquisa-interface-filtros-delphi.md);
- [Dados, cálculos e layout Delphi](pesquisa-dados-calculos-layout-delphi.md);
- [Reuso Laravel](pesquisa-reuso-relatorios-laravel.md);
- [Dossiê do Relatório de Contas a Pagar](../relatorio/dossie.md);
- código e testes vigentes sob `laravel/backend` citados na pesquisa de reuso;
- [mapa Wayfinder](../../../../.scratch/relatorio-situacao-fornecedores-wayfinder/map.md).

## 2. Evidência consolidada

`CONFIRMADO`: o legado usa Documento mestre e Duplicatas como vencimentos filhos; une notas de entrada e Documentos sem nota sem duplicá-los.

`CONFIRMADO`: Data inicial limita entrada/lançamento; Data de situação é limite superior e corte financeiro. Pagamentos posteriores permanecem abertos no corte.

`CONFIRMADO`: valor cadastrado do Documento, soma dos vencimentos, valor nominal quitado, pagamento efetivo, juros/descontos, impostos e saldo são medidas diferentes.

`CONFIRMADO`: o Laravel já possui geração assíncrona persistente, fotografia privada, integridade, histórico, cancelamento/retry, autorização por Filiais, HTML, PDF e impressão para Relatório de Contas a Pagar.

`DIVERGENTE`: o legado concatena SQL, possui seletor de data inoperante, filtro que zera o resultado, legenda invertida e condição incorreta para ocultar juros/desconto. Não reproduzir.

`OPORTUNIDADE`: parametrizar o pipeline por `report_type`, sem outra tabela, fila, storage ou máquina de estados.

## 3. Temporalidade e seleção

- `start_date` e `situation_date` são obrigatórias, inclusivas e ordenadas.
- Nota usa `notaspag.data`; Documento sem nota usa `documentospag.datalancto`.
- `situation_date` também define o estado financeiro histórico.
- A posição é reconstruída dos registros persistidos no instante da geração; não se cria razão bitemporal.
- Por padrão entram Documentos quitados e abertos. “Somente vencimentos em aberto” exige saldo positivo no corte.
- O seletor inoperante de emissão não existe na nova página.

## 4. Identidade e filtros

Parte Fornecedora é identificada sempre por `vfornecedores.codigo + vfornecedores.tipo`; código isolado é inválido. Tipos `C`, `F` e `L` vêm selecionados por padrão e são exibidos.

Filtros tipados:

- período;
- Parte Fornecedora e tipo;
- Filiais ou Grupos de Filiais autorizados;
- Naturezas/CFOP;
- previsão `WITH`/`WITHOUT`/`ONLY`;
- vencimentos `WITH`/`WITHOUT`/`BOTH`, padrão `WITH`;
- tipos de fornecimento;
- somente abertos;
- somente Documentos com nota;
- agrupamentos, ordenação, modo de saída e quebra por Parte Fornecedora.

Natureza selecionada exclui Documentos sem nota. “Somente Documentos com nota” inclui apenas o ramo `notaspag`. A opção invisível de Clientes é substituída pelo tipo explícito. Nenhum SQL/macro vem do browser.

## 5. Documento, vencimentos e cálculos

O Documento a Pagar é cabeçalho; Duplicatas são vencimentos ordenados por data e número.

- valor total: valor cadastrado da nota/Documento;
- soma nominal: soma de `valorvencto`;
- saldo no corte: soma nominal dos vencimentos sem pagamento ou pagos após o corte;
- valor pago: soma de `valorpagto` efetivo até o corte;
- valor nominal quitado: soma nominal dos vencimentos pagos até o corte;
- juros/descontos: diferença nominal versus efetivo, preservada separadamente;
- impostos retidos: medida própria.

Juros/descontos não alteram o saldo nominal. Documento sem vencimentos tem `balance_status = NOT_ASSESSABLE`, valor cadastrado preservado e saldo não inferido. Divergência entre valor cadastrado e vencimentos é sinalizada, não bloqueada, salvo impossibilidade de integridade estrutural.

Totais incluem valor de todos os Documentos e separam soma nominal, efetivamente pago, nominal quitado, juros/descontos, impostos, saldo apurável e quantidade/valor não apurável.

## 6. Hierarquia e apresentação

```text
Grupo de Filiais? → Filial? → Parte Fornecedora → Documento → vencimentos
```

Resumo consolida por Parte Fornecedora, com subtotais opcionais anteriores. Modos: detalhe com resumo, somente detalhe e somente resumo. A fotografia sempre guarda Documento e vencimentos completos; o modo altera apenas a apresentação.

Detalhe usa paisagem e resumo usa retrato. Cabeçalho do Documento contém identidade da parte/tipo, Filial, nota/número, entrada/lançamento, emissão quando existente, total, impostos, vencimentos e saldo. O cabeçalho fica com o primeiro vencimento; continuação repete identificação compacta. Cabeçalhos de colunas repetem.

Saldo não apurável e divergências usam texto/ícone, sem depender de cor.

## 7. Pipeline compartilhado

Adicionar discriminador versionado `report_type`; `SUPPLIER_SITUATION` escolhe estratégia/read model e renderers hierárquicos.

```text
request(SupplierSituationReportRequest, OperatorContext): ReportGenerationAccepted
status(ReportGenerationId, OperatorContext): ReportGenerationStatus
cancel(ReportGenerationId, OperatorContext): ReportGenerationStatus
retry(ReportGenerationId, OperatorContext): ReportGenerationAccepted
view(ReportGenerationId, OperatorContext): SupplierSituationReportSnapshot
pdf(ReportGenerationId, OperatorContext): BinaryDocument
```

Reutilizar tabela/repository de gerações, estados, jobs, storage privado, hash, retenção de 7 dias, cancelamento, retry, autorização, Auditoria de Relatório, histórico, shell, Browsershot e impressão. Histórico, URLs e templates discriminam `report_type`.

Fotografia registra `situation_date` funcional e `data_as_of` técnico, critérios, escopo, hierarquia, medidas, totais, versões e hash. Transação PostgreSQL somente leitura usa snapshot consistente. Limite: 100.000 Documentos+vencimentos, sem parcial.

## 8. Página, segurança e acessibilidade

Página própria no hub de Contas a Pagar, reutilizando componentes e lookups. Filtros principais ficam no topo, avançados recolhíveis e configuração de saída separada. Histórico mostra apenas `SUPPLIER_SITUATION`.

Abilities técnicas próprias derivam da consulta de Contas a Pagar. Toda ação revalida ability e acesso atual a todas as Filiais fotografadas; UUID não concede acesso.

Auditar criação, visualização, PDF, impressão, cancelamento e retry com tipo, data de situação, Usuário, geração, instante e Filiais.

Teclado, foco visível, nomes acessíveis, anúncios assíncronos, contraste e semântica Parte → Documento → vencimentos são obrigatórios.

## 9. Matriz mínima de mudanças

| Superfície | Decisão |
|---|---|
| Gerações/jobs/storage/estados | preservar e parametrizar por `report_type` |
| Policy/guard/Auditoria/histórico | preservar; discriminar tipo e criar abilities técnicas |
| Filtros/lookups/UI base | reutilizar componentes; normalizador específico |
| Read model atual de parcelas | não adaptar por agrupamento; criar estratégia histórica Documento/vencimentos |
| Shell/Browsershot/impressão | preservar |
| Templates/view React | criar renderer hierárquico específico sobre shell comum |
| Pipeline paralelo | proibido |

## 10. Testes e gates

- PostgreSQL real: aberto, pago antes/depois, quitado, sem vencimentos, múltiplos vencimentos, limites, fora do período, divergência de valores e totais.
- Identidade: códigos iguais com tipos `C/F/L` diferentes em lookup, filtro, grupo e fotografia.
- Pipeline parametrizado: estados, integridade, retenção, cancel/retry, histórico isolado, autorização em todas as ações e Auditoria.
- Imutabilidade: alteração financeira posterior não muda fotografia/HTML/PDF/impressão.
- Renderização: estrutura, orientação, continuidade, saldo não apurável e divergências sem depender de smoke Browsershot.
- Desempenho: cenário próximo de 100.000 registros, memória/duração e ausência de N+1; excesso falha sem parcial.
- Frontend/acessibilidade: filtros, polling, falhas, teclado, foco, anúncios e contraste.

Fases: (P1) `report_type`/regressão; (P2) read model PostgreSQL; (P3) fotografia/filtros/reconciliação; (P4) página/templates; (P5) segurança, acessibilidade, desempenho e regressão. Rota/menu ficam sob feature flag até gates críticos verdes.

## 11. Fora do escopo

Não alterar Delphi; criar fatos financeiros; exportar Excel/CSV; criar pipeline/tabela/storage paralelos; usar código isolado da Parte; aceitar SQL do browser; consultar dados vivos para saídas; paginar a materialização; publicar parcial; criar razão bitemporal; reproduzir bugs FastReport.
