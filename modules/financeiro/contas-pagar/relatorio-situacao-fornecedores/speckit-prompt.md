# Prompt Spec Kit — Relatório de Situação dos Fornecedores

Copie o bloco abaixo como entrada de `/speckit.specify`.

```text
CONTEXTO E MISSÃO

Crie uma especificação para implementar no Laravel a página Relatório de Situação dos Fornecedores. Gere a spec; não implemente nesta etapa. Faça somente as mudanças necessárias e reutilize rigorosamente o pipeline já implementado do Relatório de Contas a Pagar.

Leia e revalide o checkout vigente antes de propor arquivos:

- modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/dossie.md
- modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-interface-filtros-delphi.md
- modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-dados-calculos-layout-delphi.md
- modules/financeiro/contas-pagar/relatorio-situacao-fornecedores/pesquisa-reuso-relatorios-laravel.md
- modules/financeiro/contas-pagar/relatorio/dossie.md
- CONTEXT.md
- C:/projetos.vcl/apps/contaspagar/fmrelatoriosituacaofornecedores.pas e .dfm
- C:/projetos.vcl/apps/contaspagar/dmrelatoriosituacaofornecedores.pas e .dfm
- implementação e testes atuais de ContasPagar/Relatorio em laravel/backend

REGRA CENTRAL

Crie uma página própria Situação dos Fornecedores no hub de Contas a Pagar. Não a trate como modalidade da tela Relatório de Contas a Pagar. O pipeline compartilhado recebe report_type versionado; SUPPLIER_SITUATION seleciona somente estratégia/read model histórico, normalização e renderers específicos.

Não crie outra tabela de gerações, jobs paralelos, storage, estados, histórico, mecanismo de autorização, shell ou gerador PDF. Reutilize geração assíncrona, Fotografia de Relatório, integridade, retenção, cancel/retry, Auditoria, Browsershot e impressão já existentes.

TEMPORALIDADE

Exija start_date e situation_date, inclusivas, com start_date <= situation_date. Para nota, filtre notaspag.data; para Documento sem nota, documentospag.datalancto. situation_date também é o corte financeiro.

Reconstrua a posição dos registros persistidos no instante da geração: pagamento posterior ao corte permanece aberto; pagamento até o corte está quitado. Registre situation_date funcional e data_as_of técnico. Não crie razão bitemporal nem exponha o seletor legado de data inoperante.

IDENTIDADE DA PARTE

Parte Fornecedora é sempre vfornecedores.codigo + vfornecedores.tipo. Código isolado é inválido em DTO, request, lookup, filtro, agrupamento, fotografia ou rota. Aceite C/Cliente, F/Fornecedor e L/Filial, selecionados por padrão, e exiba tipo para desambiguar.

FILTROS

Especifique período; Parte/tipo; Filiais/Grupos autorizados; Naturezas; previsão WITH/WITHOUT/ONLY; vencimentos WITH/WITHOUT/BOTH (padrão WITH); tipos de fornecimento; somente abertos; somente Documentos com nota; agrupamentos; ordenação; modo de saída; quebra por Parte.

Natureza selecionada exclui Documento sem nota. “Somente documentos com notas” inclui somente notaspag. Substitua “Só notas” por “Vencimentos”. Remova a opção invisível de Clientes, pois o tipo da Parte é explícito. Use filtros tipados, allowlists e bindings; nunca SQL/macros do browser.

MODELO E CÁLCULOS

Documento a Pagar é cabeçalho; Duplicatas são vencimentos filhos ordenados por data/número.

- valor total do Documento = valor cadastrado da nota/Documento;
- soma nominal dos vencimentos = SUM(valorvencto);
- saldo no corte = SUM(valorvencto sem pagamento ou pago depois do corte);
- valor pago = SUM(valorpagto efetivo até o corte);
- valor nominal quitado = SUM(valorvencto pago até o corte);
- juros/descontos = diferença nominal versus efetivo, separada e com sinal claro;
- impostos retidos = medida separada.

Juros/descontos não alteram saldo nominal. Documento sem vencimentos usa balance_status NOT_ASSESSABLE, preserva total e não recebe saldo zero/total inferido. Não entra em “somente abertos”. Divergência entre total cadastrado e vencimentos é fotografada/sinalizada; só bloqueia se impedir integridade estrutural.

Totais somam todos os Documentos, inclusive sem vencimentos, e mantêm separadas todas as medidas e quantidade/valor não apurável.

HIERARQUIA E SAÍDA

Grupo de Filiais opcional → Filial opcional → Parte Fornecedora obrigatória → Documento → vencimentos. Resumo consolida por Parte, com subtotais opcionais. Modos: detalhe+resumo, detalhe, resumo. A fotografia sempre guarda Documentos e vencimentos completos; modo altera apenas apresentação.

Detalhe paisagem; resumo retrato. Cabeçalho do Documento contém Parte/tipo, Filial, nota/número, entrada/lançamento, emissão se houver, total, impostos, soma dos vencimentos e saldo. Detalhe contém parcela, vencimento, nominal, pagamento/data até corte, nominal quitado, juros/descontos e dias.

Mantenha cabeçalho com primeiro vencimento; repita identificação compacta em continuação e cabeçalhos de colunas. Saldo não apurável/divergência usam texto e ícone, não só cor.

APPLICATION E FOTOGRAFIA

Especifique superfície equivalente:

request(SupplierSituationReportRequest, OperatorContext): ReportGenerationAccepted
status(ReportGenerationId, OperatorContext): ReportGenerationStatus
cancel(ReportGenerationId, OperatorContext): ReportGenerationStatus
retry(ReportGenerationId, OperatorContext): ReportGenerationAccepted
view(ReportGenerationId, OperatorContext): SupplierSituationReportSnapshot
pdf(ReportGenerationId, OperatorContext): BinaryDocument

Reutilize estados QUEUED/RUNNING/COMPLETED/FAILED/CANCELLED/EXPIRED, retenção 7 dias, retry com novo ID, transação PostgreSQL somente leitura/snapshot consistente, storage privado, hash e PDF derivado.

Hash/fotografia incluem report_type, versões, critérios, situation_date, data_as_of, Operador, Filiais, identidade composta, hierarquia, medidas, totais e integridade. Limite 100.000 Documentos+vencimentos; exceder falha sem parcial.

Página, histórico, URLs, templates e ações discriminam report_type. Histórico da página mostra apenas SUPPLIER_SITUATION. PDF e impressão consomem a mesma fotografia e nunca reconsultam fatos.

SEGURANÇA E AUDITORIA

Crie abilities técnicas próprias derivadas da Permissão de consulta de Contas a Pagar. Em request/status/history/cancel/retry/view/PDF/print, revalide ability e acesso atual a todas as Filiais fotografadas. UUID não é autorização. Preserve resolução de escopo na aplicação e restrição obrigatória no repository.

Audite criação, visualização, PDF, impressão, cancelamento e retry com report_type, situation_date, Usuário, geração, instante e Filiais, sem dados sensíveis.

UX E ACESSIBILIDADE

Reutilize componentes/lookups/polling/estados. Filtros principais no topo, avançados recolhíveis e saída separada. Cubra loading, vazio, limite, falha, cancelado, expirado, forbidden, saldo não apurável, divergência e falha do PDF.

Teclado, foco visível, nomes acessíveis, anúncios assíncronos sem roubar foco, contraste e estrutura semântica Parte→Documento→vencimentos são obrigatórios.

TESTES OBRIGATÓRIOS

PostgreSQL real: aberto no corte, pago antes/depois, quitado, sem vencimentos, múltiplos vencimentos, limites inclusivos, fora do período, total diferente das parcelas, Natureza/nota, filtros, saldos/totais por níveis.

Identidade: mesmo código com tipos C/F/L diferentes em lookup, filtro, agrupamento e fotografia.

Pipeline parametrizado: regressão do relatório atual, estados, hash, retenção, cancel/retry, histórico isolado, autorização em todas as ações, Auditoria e limite sem parcial.

Imutabilidade: mudança financeira pós-COMPLETED não altera fotografia/HTML/PDF/print; nova geração usa outro ID.

Renderização determinística: orientação, hierarquia, continuidade, cabeçalhos, saldo não apurável e divergências. Regra crítica não depende de Browsershot passível de skip.

Desempenho: perto de 100.000 registros, medir memória/duração, provar carga em lote sem N+1. Frontend: filtros, polling, estados, teclado, foco, anúncios e contraste.

FASES E GATES

P1 report_type/estratégia e regressão do relatório atual.
P2 read model histórico e PostgreSQL real.
P3 fotografia hierárquica, filtros, medidas e reconciliação.
P4 página e templates sobre componentes/shell existentes.
P5 segurança, Auditoria, acessibilidade, desempenho, observabilidade e regressão.

Mantenha rota/menu sob feature flag até PostgreSQL, identidade composta, imutabilidade, integridade, autorização de todas as Filiais e regressão estarem verdes. Não crie fallback síncrono/paralelo.

CORREÇÕES DELIBERADAS

Não reproduza: seletor de data inoperante; and FALSE; legenda invertida; condição literal 1 para juros/desconto; nomes enganosos; somas nulas implícitas; concatenação SQL; total nominal rotulado como pagamento real.

FORA DO ESCOPO

Não alterar Delphi; criar/alterar fatos financeiros; exportar Excel/CSV; criar pipeline/tabela/storage paralelo; usar código sem tipo; consultar dados vivos para saídas; paginar materialização; publicar parcial; criar razão bitemporal; reproduzir FastReport pixel a pixel.

SAÍDA ESPERADA

Produza spec autocontida pronta para /speckit.clarify e /speckit.plan, sem decisão funcional aberta. Inclua jornadas priorizadas, requisitos numerados, entidades/estados/invariantes, contratos HTTP/Application, filtros, cálculos, fotografia, segurança/Filiais/Auditoria, UX/acessibilidade, falhas, critérios mensuráveis, matriz de testes, matriz preservar/parametrizar/criar, fases/gates e lista mínima de arquivos atuais afetados/novos após revalidar o checkout.
```
