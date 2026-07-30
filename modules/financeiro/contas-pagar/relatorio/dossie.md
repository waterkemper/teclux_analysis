# Dossiê — Relatório de Contas a Pagar

## 1. Missão e fontes

Este dossiê fixa o contrato para especificar no Laravel uma página completa de **Relatório de Contas a Pagar**, com paridade funcional deliberada às units Delphi e uma Fotografia de Relatório imutável comum à visualização, PDF e impressão. Ele planeja; não implementa.

Fontes primárias:

- `C:/projetos.vcl/apps/contaspagar/fmrelatorioduplicatas.pas/.dfm`;
- `C:/projetos.vcl/apps/contaspagar/dmrelatorioduplicatas.pas/.dfm`;
- [Interface e parâmetros Delphi](pesquisa-interface-parametros-delphi.md);
- [Dados, layouts e cálculos Delphi](pesquisa-dados-layout-calculos-delphi.md);
- [Infraestrutura Laravel](pesquisa-infraestrutura-laravel.md);
- código e testes vigentes sob `laravel/backend` citados na pesquisa de infraestrutura;
- decisões registradas no [mapa Wayfinder](../../../../.scratch/relatorio-contas-pagar-wayfinder/map.md).

Termos canônicos: **Relatório de Contas a Pagar**, **Geração de Relatório** e **Fotografia de Relatório**. As modalidades são **Contas a Pagar**, **Contas por Competência** e **Pagamentos Efetuados**. “Todas as Duplicatas” descreve parcialmente o conjunto da segunda modalidade, mas não é seu nome.

## 2. Evidência consolidada

### Delphi

`CONFIRMADO`: uma única tela oferece as três modalidades, variando a dimensão do período principal e os filtros habilitados.

`CONFIRMADO`: a consulta une Duplicatas e Adiantamentos e alimenta saídas detalhada com resumo, somente detalhada ou somente resumida. Os agrupamentos independentes são Grupo de Filiais, Filial, Parte Fornecedora, Data e Documento.

`CONFIRMADO`: subtotais e totais preservam cinco medidas distintas: valor no vencimento, desconto cadastrado, valor pago, juros pagos e desconto obtido no pagamento. Valor líquido é derivado.

`CONFIRMADO`: no regime de caixa, a competência efetiva usa vencimento e valor de vencimento.

`DIVERGENTE`: filtros de Evento e Documento são concatenados como expressões SQL e há macros residuais frágeis. A implementação nova deve usar uma árvore tipada, validada e parametrizada.

`DIVERGENTE`: a habilitação de Adiantamentos na modalidade de competência é assimétrica na interface legada. A decisão atual torna a regra explícita.

`NÃO LOCALIZADO`: garantia de identidade entre preview e PDF. O legado consome o dataset corrente e pode carregar overrides `.fr3` externos.

### Laravel atual

`CONFIRMADO`: existem página/hub Inertia de Contas a Pagar, Policies, autorização modular, escopos defensivos de Filial, read models de Duplicatas abertas e pagas, shell corporativo, Blade padrão e PDF via Browsershot.

`CONFIRMADO`: o Relatório de Movimentação Diária é a referência mais próxima para filtros, serviço de montagem, agrupamentos, totais e HTML/PDF pelo mesmo template.

`DIVERGENTE`: os relatórios atuais remontam o view model e reconsultam dados separadamente para HTML e PDF. `GerarJobStore` é cache temporário, não fotografia persistente e autorizável.

`NÃO LOCALIZADO`: read model das três modalidades, envelope persistente de geração, histórico, retenção, cancelamento, PDF derivado e abilities específicas deste relatório.

`OPORTUNIDADE`: aprofundar os seams existentes sem duplicar shell, gerador PDF, resolução de Filiais ou infraestrutura de jobs pesados.

## 3. Modalidades e temporalidade

| Código | Nome | Conjunto | Período principal |
|---|---|---|---|
| `OPEN_PAYABLES` | Contas a Pagar | Duplicatas não pagas | vencimento |
| `ACCRUAL` | Contas por Competência | Duplicatas abertas e pagas | competência efetiva |
| `PAID` | Pagamentos Efetuados | Duplicatas pagas | data do pagamento |

O período principal e o período de emissão são inclusivos. Ao menos um dos dois intervalos é obrigatório; quando informado, cada intervalo deve ser válido e ter início menor ou igual ao fim.

Em regime de caixa, `ACCRUAL` usa vencimento como competência efetiva e valor no vencimento como valor efetivo. A fotografia guarda tanto os dados originais quanto os efetivos, mesmo quando o documento mostra apenas os efetivos.

## 4. Contrato de filtros

O request é tipado, normalizado e validado no servidor. Admite:

- modalidade;
- período principal e período de emissão;
- Filiais ou Grupos de Filiais autorizados;
- Parte Fornecedora ou Grupo de Fornecedores;
- Tipo de Fornecimento `M`, `P` e/ou `T`;
- Banco e Conta;
- Tipo de Pagamento;
- Previsões `WITH`, `WITHOUT`, `ONLY`;
- Autorizadas `YES`, `NO`, `BOTH`;
- Adiantamentos `WITH`, `WITHOUT`, `ONLY`;
- DDA `YES`, `NO`, `BOTH`;
- condições de Evento e Documento;
- agrupamentos, ordenação e nível de detalhe.

Matriz condicional:

- Previsões e Autorizadas existem somente em `OPEN_PAYABLES`.
- Tipo de Pagamento e Adiantamentos existem somente em `ACCRUAL` e `PAID`.
- Adiantamentos têm padrão `WITHOUT`; em `OPEN_PAYABLES` são excluídos e o controle fica oculto.
- Banco significa banco de cobrança em `OPEN_PAYABLES`/`ACCRUAL` e banco da Conta de pagamento em `PAID`.
- Filtros desabilitados não são enviados ocultamente nem persistidos na fotografia.

Evento e Documento usam árvore de condições com campos e operadores permitidos, valores tipados e composição `AND`/`OR`. Nenhum SQL, macro, nome de coluna arbitrário ou fragmento executável vem do browser. O servidor persiste a árvore normalizada e uma descrição legível para impressão.

## 5. Read model, linhas e cálculos

O read model próprio combina Duplicatas e Adiantamentos sem herdar paginação ou limites das telas operacionais. Cada linha discrimina sua origem. Adiantamento é uma linha sintética e não recebe identidade falsa de parcela.

As cinco medidas são preservadas em linha, subtotal e total:

1. valor no vencimento;
2. desconto cadastrado (`valordesconto`);
3. valor pago;
4. juros pagos: `max(valor pago - valor no vencimento, 0)`;
5. desconto obtido no pagamento: `valor no vencimento - valor pago`, somente quando o pagamento for não zero e inferior ao vencimento.

Valor líquido é `valor no vencimento - desconto cadastrado`. Desconto cadastrado e desconto obtido nunca são fundidos. A precisão monetária, arredondamento e formatação seguem o padrão financeiro vigente e são registrados por versão de contrato.

O relatório suporta agrupamentos independentes por Grupo de Filiais, Filial, Parte Fornecedora, Data e Documento, com ordem determinística e subtotais das cinco medidas por nível. Os modos são:

- `DETAIL_WITH_SUMMARY`;
- `DETAIL_ONLY`;
- `SUMMARY_ONLY`.

## 6. Contrato de Application e fotografia

```text
request(AccountsPayableReportRequest, OperatorContext): ReportGenerationAccepted
status(ReportGenerationId, OperatorContext): ReportGenerationStatus
cancel(ReportGenerationId, OperatorContext): ReportGenerationStatus
retry(ReportGenerationId, OperatorContext): ReportGenerationAccepted
view(ReportGenerationId, OperatorContext): AccountsPayableReportSnapshot
pdf(ReportGenerationId, OperatorContext): BinaryDocument
```

Toda solicitação cria uma Geração de Relatório assíncrona. Não existe caminho síncrono alternativo. Situações: `QUEUED`, `RUNNING`, `COMPLETED`, `FAILED`, `CANCELLED` e `EXPIRED`.

O job usa transação PostgreSQL somente leitura com snapshot consistente (`REPEATABLE READ` ou equivalente), registra `data_as_of`, lê no máximo 100.000 linhas e materializa um envelope persistente e imutável com:

- identificador e vínculo opcional com geração anterior;
- versão do contrato e template;
- critérios normalizados e descrição impressa;
- Usuário criador e escopo de Filiais;
- modalidade, linhas tipadas e dados originais/efetivos;
- agrupamentos, ordenação, subtotais, totais e contagens;
- moeda, formatação, orientação e metadados temporais;
- hash/integridade do conteúdo.

`COMPLETED` só ocorre após persistência, reconciliação de linhas/subtotais/totais e verificação de integridade. Exceder 100.000 linhas produz `FAILED`, sem fotografia ou resultado parcial, e orienta o Usuário a refinar os filtros.

Cancelamento é aceito apenas em `QUEUED` ou `RUNNING`, termina em `CANCELLED` e nunca publica fotografia parcial. Nova tentativa cria outro identificador ligado ao anterior; nenhuma geração terminal é sobrescrita.

A fotografia vale 7 dias. Depois, torna-se `EXPIRED` e seu conteúdo/artefatos são removidos conforme a política, preservando os metadados operacionais exigidos.

## 7. Página, visualização e documento

A página entra como item irmão no hub de Contas a Pagar. Filtros principais ficam no topo, filtros avançados em painel recolhível e agrupamentos/saída em seção separada. O formulário acompanha a geração e lista o histórico do Usuário nos últimos 7 dias, com situação, critérios resumidos e ações válidas.

A fotografia concluída abre em rota própria. A tela de filtros permanece disponível para outras solicitações. Erros são acionáveis e não expõem SQL, detalhes internos nem dados não autorizados.

Visualização, PDF e impressão consomem exclusivamente a mesma fotografia. Relatórios detalhados usam paisagem; `SUMMARY_ONLY` usa retrato. O cabeçalho é institucional da empresa e os critérios identificam explicitamente todas as Filiais selecionadas.

O template Laravel é versionado e determinístico, estende o shell corporativo e repete cabeçalhos de colunas. Evita separar grupos/subtotais quando couberem juntos e identifica continuação inevitável. `.fr3` e overrides externos não são dependências de execução.

O PDF é gerado sob demanda pelo Browsershot a partir da fotografia e pode ser guardado como artefato derivado. Falha no PDF não invalida a fotografia. Imprimir usa o navegador sobre a mesma visualização/template; não há integração com impressora do servidor.

## 8. Autorização e Auditoria de Relatório

Abilities específicas de visualizar e gerar o relatório derivam da Permissão de consulta de Contas a Pagar. Cada ação de request, status, histórico, cancelamento, retry, view, PDF e impressão valida a ability correspondente e o acesso atual do Usuário a **todas** as Filiais fotografadas. Conhecer UUID/link não concede acesso. Outro Usuário pode acessar somente se possuir a mesma Permissão e todo o escopo de Filiais.

A criação, visualização, download do PDF, impressão e cancelamento geram Auditoria de Relatório com Usuário, instante, geração e Filiais. É trilha operacional imutável, não Movimento nem fato financeiro. Não persistir credenciais, tokens de sessão ou dados sensíveis desnecessários.

## 9. Acessibilidade e estados

Filtros, histórico, acompanhamento e ações funcionam por teclado, com foco visível e nomes acessíveis. Situação e erro nunca dependem só de cor. Tabelas possuem cabeçalhos semânticos, leitura coerente em ampliação, contraste e hierarquia visual. Atualizações assíncronas importantes são anunciadas sem roubar foco.

A experiência cobre carregamento, fila, processamento, vazio, concluído, falha, cancelamento, expiração, proibição, perda de Filial, limite excedido, PDF em geração e falha de renderização. Polling não dispara geração duplicada.

## 10. Matriz preservar/corrigir/criar

| Superfície | Decisão |
|---|---|
| Hub Inertia de Contas a Pagar | **Preservar/aprofundar** com item de relatório |
| Policies, módulo e dupla defesa de Filiais | **Preservar/aprofundar** com abilities próprias |
| Joins/normalização dos read models aberto/pago | **Reutilizar como evidência**, criando read model analítico próprio |
| Paginação/limite das telas de quitação e estorno | **Não herdar** |
| `ErpReportLayoutService` e Blade padrão | **Preservar** |
| `BrowsershotPdfGenerator` | **Preservar** como renderizador derivado |
| Separação filtro/query/mapeamento/grupos/totais da Movimentação Diária | **Preservar** |
| HTML/PDF com reconsulta independente | **Corrigir/remover** neste relatório |
| Infraestrutura de jobs pesados | **Preservar/aprofundar** |
| `GerarJobStore` como fonte canônica | **Não usar**; cache pode auxiliar, fotografia persistente é canônica |
| Read model das três modalidades | **Criar** |
| Envelope/histórico/retenção/cancelamento/retry | **Criar** |
| Template versionado detalhe/resumo | **Criar** sobre o shell existente |
| Auditoria de Relatório | **Criar/aprofundar** conforme infraestrutura vigente |

## 11. Testes e critérios de aceite

- Unitários: matriz de filtros, estados/transições, orientação, agrupamentos, cinco medidas, valor líquido e descontos separados.
- Integração PostgreSQL: três modalidades/temporalidades, regime de caixa, Duplicatas/Adiantamentos, filtros, grupos, totais, snapshot consistente, concorrência, expiração, limite e ausência de parcial.
- Autorização: criador, outro Usuário autorizado, perda de Permissão, perda de uma Filial e enumeração de UUID em todas as rotas.
- Assíncrono: sucesso, falha, cancelamento, retry com novo ID, polling idempotente e PDF sem reconsulta financeira.
- Contrato: HTML, PDF e impressão recebem o mesmo ID, critérios, linhas, grupos e totais.
- Renderização: Blade determinístico sempre testado; smoke Browsershot valida orientação, cabeçalhos, quebras, rodapés e impressão quando Chromium existir. Regras financeiras não dependem de teste passível de skip.
- Desempenho: cenário próximo de 100.000 linhas registra duração e memória, confirma processamento assíncrono e detecta N+1; a primeira execução estabelece baseline antes de um SLA absoluto.
- Acessibilidade: teclado, foco, nomes, tabela semântica, contraste e situações sem dependência de cor.

Nenhum teste crítico de fotografia, autorização ou cálculo pode ficar `skipped`/`incomplete`.

## 12. Fases e gates

1. **P0 — caracterização:** revalidar schema, código, rotas, Policies, filas, storage e testes; fechar matriz de campos/joins e formatos.
2. **P1 — contrato e leitura:** requests tipados, compilador seguro, read model, cálculos/grupos e testes PostgreSQL das três modalidades.
3. **P2 — fotografia:** envelope persistente, job, snapshot consistente, integridade, limite, retenção, estados, cancelamento/retry e autorização.
4. **P3 — apresentação:** página/filtros/histórico, template versionado, view, PDF derivado, impressão e Auditoria de Relatório.
5. **P4 — endurecimento:** concorrência, desempenho, acessibilidade, falhas, observabilidade, documentação e regressão.

Rota/menu só são liberados após cálculos e filtros estarem provados em PostgreSQL, fotografia/Filiais estarem protegidas em todas as ações e visualização/PDF/impressão demonstrarem identidade de conteúdo. Ativação gradual por feature flag é recomendada se esse padrão já existir no módulo.

## 13. Fora do escopo e proibido

- Alterar Delphi ou reproduzir FastReport pixel a pixel.
- Importar/executar templates `.fr3` ou customizações externas desconhecidas.
- Exportar Excel/CSV.
- Criar ou alterar fatos financeiros.
- Aceitar SQL/macros do browser, confiar em Filiais do payload ou usar UUID como autorização.
- Reconsultar fatos financeiros para view/PDF/impressão ou tratar PDF/cache temporário como fotografia.
- Paginar a seleção de dados da geração; o conjunto é completo até o limite de 100.000 linhas.
- Publicar relatório parcial, esconder falha ou misturar os dois conceitos de desconto.
