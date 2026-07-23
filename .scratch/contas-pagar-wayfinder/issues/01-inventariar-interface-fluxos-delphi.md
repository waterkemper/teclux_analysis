# Inventariar interface, estados e fluxos Delphi de Contas a Pagar

Type: task
Status: resolved
Blocked by:

## Question

Qual é a composição funcional completa de `fmcontaspagar.pas/.dfm` e `dmcontaspagar.pas/.dfm`, incluindo herança, inicialização, abas, grids, campos, filtros, defaults, validações, estados visíveis/habilitados, atalhos, ações, mensagens, navegação, seleção, ciclos de consulta e gravação e fluxos auxiliares alcançáveis?

## Answer

### Síntese e limite funcional

`CONFIRMADO` — `TfrmContasPagar` é um cadastro mestre–detalhe herdado de `TfrmCadastroPadrao`, com `TdtmContasPagar` próprio herdado de `TdtmBasico`. O registro mestre é um **Documento a Pagar**; suas linhas são **Duplicatas**, que também concentram vencimento, autorização, pagamento/cancelamento e impressão. O mesmo shell abre um modo especial de **Adiantamento a Fornecedor**. Fontes centrais: `fmcontaspagar.pas:24,407-519`, `dmcontaspagar.pas:22-41` e `fmcontaspagar.dfm:1-148`.

`DECISÃO DE ESCOPO` — Reinf 2010/2040 existe no DFM e possui handlers residuais, porém não integra o fluxo alcançável atual: `actHabilitarUpdate` força `tstReinf.TabVisible := FALSE`, a carga dos datasets está comentada e o construtor também deixou comentada parte da configuração (`fmcontaspagar.pas:512-514,625-629`; `dmcontaspagar.pas:3641-3660`). Portanto não é paridade obrigatória de Contas a Pagar. Fica como `NÃO ALCANÇÁVEL/LEGADO DESATIVADO`; eventual reativação exige esforço próprio.

### Inicialização, defaults e entrada

- `CONFIRMADO` — O form cria primeiro o data module, associa `qryDocumentosPag` como dataset do cadastro herdado, inicia em Duplicatas, registra callbacks de abertura e cálculo de impostos, configura frames de pesquisa/contabilidade e põe foco inicial em Número (`fmcontaspagar.pas:407-509`).
- `CONFIRMADO` — Novo Documento começa com emissão e lançamento na data atual, Filial Base, tipo de fornecedor `F`, `Só previsão=false`, `Administrador=false`, `Adiantamento=false` e `Regime de Caixa=false` (`dmcontaspagar.pas:2909-2920`).
- `CONFIRMADO` — Inclusão comum abre um registro, posiciona foco em Número e depois Fornecedor, mantém a perspectiva Valores e marca `adiantamento=false` (`fmcontaspagar.pas:798-810`; `dmcontaspagar.pas:2771-2778`).
- `CONFIRMADO` — F7/Adiantamento abre novo registro com `adiantamento=true`, bloqueia Valores/impostos, troca a subaba para Adiantamento e muda o título da primeira aba (`fmcontaspagar.pas:909-912,1394-1405`; `dmcontaspagar.pas:4608-4615`).
- `CONFIRMADO` — O checkbox Administrador só é visível para Usuário Administrador ou Suporte (`fmcontaspagar.pas:434-440`). O significado da flag e sua autorização ficam em **Inventariar Permissões, Autorizações e Parâmetros Delphi de Contas a Pagar**.

### Estrutura visível

1. Cabeçalho do Documento: Número, Emissão, Fornecedor, Série/Número da Nota, Pedido da Nota Fiscal, Lançamento, Filial, Evento, Valor Bruto, Valor Líquido calculado, Referência, Só previsão, Administrador, Regime de Caixa e Data de Referência (`fmcontaspagar.dfm:8542-10012`).
2. Perspectiva Valores: impostos retidos IRRF, INSS, ISSQN, PIS, COFINS, CSLL e composição PIS/COFINS/CSLL; quando o documento deriva de outro, a página troca para Origem, exibindo documento, série/nota, vencimento, duplicata e fato gerador somente leitura (`fmcontaspagar.dfm:8593-9234`; `fmcontaspagar.pas:619-623,996-998`).
3. Aba **1 – Duplicatas**: subaba normal com comandos Pagar/Cancelar, Excluir, Gerar, Inserir, imprimir autorização, imprimir recibo, log, documento/complemento, grade de duplicatas, totais e observação; ou subaba Adiantamento com tipo de pagamento, conta, cheque, banco e agência (`fmcontaspagar.dfm:130-2328`).
4. Aba **2 – Contabilidade**: frame compartilhado de lançamentos, visível somente quando a geração contábil está habilitada e o Documento não é Só previsão (`fmcontaspagar.pas:414-416,1000-1002,1077-1082`; `fmcontaspagar.dfm:2328-2427`).
5. Aba **3 – PIS/COFINS**: alíquotas, valores, bases, CST/tributação e Natureza da Base, com ações para recalcular PIS e COFINS. A aba é ocultada quando há Nota de origem (`fmcontaspagar.pas:625-627,1470-1480`; `fmcontaspagar.dfm:2427-3014`).

### Pesquisa e navegação

- `CONFIRMADO` — Fora de edição, a pesquisa procura Documentos a Pagar. Em edição e com Ctrl/F9, pesquisa Filial, Fornecedor, Evento, Tipo de Pagamento ou Conta conforme o controle ativo e sua editabilidade (`fmcontaspagar.pas:813-865,943-978`).
- `CONFIRMADO` — Evento é restringido a evento ativo, tipo `A`, movimentação `S`; ao editar, o evento já gravado também permanece localizável (`fmcontaspagar.pas:1907-1919`).
- `CONFIRMADO` — `OperacaoPadrao([numero])` abre diretamente o Documento informado, suportando navegação externa ao cadastro (`fmcontaspagar.pas:1884-1891`; `dmcontaspagar.pas:5732-5735`).
- `CONFIRMADO` — Foco inicial é Número; após incluir, vai a Fornecedor; após operar Duplicata volta à grade. A busca obrigatória de fornecedor para ISS retorna foco e seleção ao valor de ISS (`fmcontaspagar.pas:509,552-583,798-810,1274-1281`).

### Ciclo mestre–detalhe e estados de edição

- `CONFIRMADO` — Ao trocar o Documento, o data module recarrega Duplicatas, impostos retidos, Nota de origem, quitações e saldo de adiantamento; recalcula editabilidade e requisitos, preserva a tentativa de posição da duplicata e notifica o form/contabilidade (`dmcontaspagar.pas:3588-3677`; `fmcontaspagar.pas:1192-1220`).
- `CONFIRMADO` — Documento fica editável somente depois do fechamento contábil, sem quitação, por Usuário com capacidade contábil ou de pagamento e sem documento de origem. Campos específicos também bloqueiam quando há Nota ou quitação de imposto (`dmcontaspagar.pas:1327-1398,2825-2835`). A matriz completa pertence ao ticket de Permissões/Autorizações.
- `CONFIRMADO` — Duplicata ainda não paga permite alterar vencimento, valor, desconto, juros, multa e banco de cobrança; dados de pagamento só ficam editáveis quando a operação de pagamento/cancelamento é permitida (`dmcontaspagar.pas:2875-2898,4246-4267`).
- `CONFIRMADO` — Duplo clique ou Ctrl+Editar na grade insere se vazia e edita se houver linha; Ctrl+Inserir inclui quando habilitado (`fmcontaspagar.pas:636-658,2010-2035`). A implementação possui handlers duplicados para uma grade antiga e `DBAdvGridDuplicatas`, um `POSSÍVEL RESÍDUO LEGADO`.
- `CONFIRMADO` — Observação da Duplicata é persistida ao sair do memo, fora do botão Gravar principal (`fmcontaspagar.pas:1230-1234`; `dmcontaspagar.pas:4844`). Isso precisa ser tratado como escrita explícita/autosave na futura matriz.
- `CONFIRMADO` — O grid agrupa visualmente colunas de Vencimento e Pagamento; linhas com observação recebem fonte em negrito (`fmcontaspagar.pas:1951-2008,2037-2048`).

### Fluxos de Duplicata e pagamento

- **Inserir/Editar** — abre modal `fmcadastroduplicatascontaspagar`, injeta o mesmo data module, valida Filial/Conta/Tipo de Pagamento e ajusta datas mínimas pela emissão e fechamento contábil (`fmcontaspagar.pas:522-588`).
- **Pagar/Cancelar** — o mesmo botão abre `topPAGAMENTO` quando não paga e `topCANCELAR` quando já paga. Pagamento não autorizado exige autenticação/autorização adicional; detalhes ficam no ticket de Autorizações (`fmcontaspagar.pas:522-543,882,934-940`).
- **Gerar parcelas** — Ctrl+G ou botão abre `fmcalcularduplicatas` para quantidade, primeiro vencimento, intervalo, tipos/valores de juros e multa. Ao confirmar, substitui as parcelas existentes; exige valor de Documento maior que zero e impostos inferiores ao bruto e apresenta barra de progresso (`fmcontaspagar.pas:884-897,1041-1071`; `dmcontaspagar.pas:1563-1605,5830-5848`).
- **Defaults de nova Duplicata** — autorização automática segue parâmetro; juros e multa iniciam em tipo `V` e zero. Ao iniciar pagamento sem valor, Data de Pagamento recebe Data do Servidor, Filial de Pagamento recebe Filial Base e o valor é calculado (`dmcontaspagar.pas:2780-2823`).
- **Validação de pagamento** — exige Tipo de Pagamento quando houver valor; quando há contabilidade exige Conta/contrapartida coerente; pagamento por adiantamento exige conta contábil do fornecedor e saldo suficiente (`dmcontaspagar.pas:5747-5827`).
- **Excluir Duplicata** — exige confirmação e só está habilitado quando não paga, com capacidade apropriada e sem quitação de imposto vinculada (`fmcontaspagar.pas:590-603,927-932`; `dmcontaspagar.pas:1464-1472,2884-2898`).

### Gravação e exclusão do Documento

- `CONFIRMADO` — Antes de gravar, valida campos obrigatórios, saldo de Adiantamento, impostos ≤ valor bruto, existência de ao menos uma Duplicata (exceto Adiantamento), igualdade entre líquido e total de Duplicatas e fornecedor específico para ISS. Em Regime de Caixa, diferença pode ser confirmada e altera o bruto; fora dele, bloqueia (`dmcontaspagar.pas:2132-2208`).
- `CONFIRMADO` — O form valida os lançamentos contábeis, refaz/cancela pagamentos quando necessário, grava o Documento e, nos fluxos via lote/refazer pagamento, reaplica operações às Duplicatas pagas; em sucesso retorna à aba Valores (`fmcontaspagar.pas:698-795`). Os efeitos transacionais pertencem a **Inventariar dados, regras e integrações Delphi de Contas a Pagar**.
- `CONFIRMADO` — Excluir Documento é bloqueado se houver pagamento, quitação de imposto, documento de origem ou data de lançamento fechada; caso permitido, exige confirmação e desvincula eventual Nota antes de excluir (`dmcontaspagar.pas:1400-1462`).
- `CONFIRMADO` — Datas possuem limites e mensagens distintas: Emissão respeita dias retroativos; Lançamento deve superar Data Contábil e não anteceder Emissão (`fmcontaspagar.pas:434-438,980-994,1236-1272`).

### Impostos, contabilidade e modos condicionais

- `CONFIRMADO` — A disponibilidade de cada imposto retido é configurada por Filial. Em geração automática, PIS/COFINS/CSLL individuais e o campo conjunto são mutuamente exclusivos quando possuem valor; ISS pode exigir seleção de um Fornecedor específico (`fmcontaspagar.pas:1094-1190,1274-1392`).
- `CONFIRMADO` — Ao entrar na aba Contabilidade, lançamentos são gerados se ainda não existem. Ctrl+G gera lançamentos e Ctrl+R gera lançamentos por Regime de Caixa (`fmcontaspagar.pas:893-907,1192-1209,1330-1340,1442-1457`).
- `CONFIRMADO` — Marcar Só previsão oculta Contabilidade. Clicar no texto “de Caixa” alterna `regimedecaixa` após colocar o Documento em edição (`fmcontaspagar.pas:1077-1082,1482-1487`).
- `CONFIRMADO` — Documento de origem força a página somente leitura Origem e impede exclusão local; Documento normal mostra Valores (`fmcontaspagar.pas:619-623`; `dmcontaspagar.pas:1423-1427`).

### Impressão, logs e integrações de borda

- `CONFIRMADO` — Imprimir autorização só habilita com Duplicata em aberto; exige autorização de pagamento e permite Registro Atual ou Todas as possíveis. Imprimir recibo só habilita com quitação e também permite atual/todas (`fmcontaspagar.pas:590-596,1426-1440,1937-1949`; `dmcontaspagar.pas:4625-4688,5851-5907`).
- `CONFIRMADO` — Há visualização de log do Documento (`documentospag_log`, chave Número) e da Duplicata (`duplicatas_log`, chaves Documento, Número e Vencimento) (`fmcontaspagar.pas:1922-1935`).
- `LIMITE` — Cadastro/modal detalhado de Duplicata, calculadora de parcelas, frame contábil, relatórios e visualizador de log são dependências alcançáveis. Seus contratos de entrada/saída devem ser documentados, mas sua migração interna integral está fora deste mapa.

### Atalhos e feedback essenciais

- `F7`: novo Adiantamento; `Ctrl+P`: pagar/cancelar Duplicata; `Ctrl+G`: gerar Duplicatas na aba 1 ou lançamentos na Contabilidade; `Ctrl+R`: lançamentos de Regime de Caixa; `Esc`: encerra edição dos campos/revalida Evento; Ctrl+Editar/Ctrl+Inserir operam a grade (`fmcontaspagar.pas:878-925`).
- Confirmações explícitas existem para exclusão de Documento/Duplicata, cancelamento de pagamento, diferenças de totais, impressão em lote e vários cenários financeiros. O prompt final deve preservar o significado, não necessariamente o texto literal.

### Questões encaminhadas

- SQL, transações, contabilização, movimentos bancários, impostos gerados, lotes e efeitos de pagamento/cancelamento: **Inventariar dados, regras e integrações Delphi de Contas a Pagar**.
- Gates completos, autenticação sensível, Filial, fechamento contábil e textos canônicos dos parâmetros: **Inventariar Permissões, Autorizações e Parâmetros Delphi de Contas a Pagar**.
- Equivalentes e reusos: **Inventariar o Laravel atual e os ativos reutilizáveis para Contas a Pagar**.
