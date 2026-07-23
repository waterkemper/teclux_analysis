# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o Fechamento de Caixa — totalização do dia, aba Eventos, geração de PDF e a ação Fechar Caixa (F8) —, construído sobre a Fundação de Caixa já especificada em `modules/caixa/fechamentos/01-speckit-prompt.md` (estado de caixa no Usuário, comando `AbrirCaixa`, ledger `autenticacoes`, leitura de `cheques`/`recebimentos`, reaproveitamento dos Cadastros de Eventos e Tipos de Recebimento).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel, incluindo o que a Fundação de Caixa (spec 01) já deve ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Se o pacote fornecido for insuficiente ou ambíguo, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- a totalização completa do dia (todos os totais da matriz dourada abaixo, incluindo Saldo Atual pela fórmula única), o Resumo por Filial de Venda e o Resumo de Renegociados;
- a aba Eventos: grid com duas colunas editáveis (`evento`, `parametros`), nunca permite criar linha nova, edição em lote com uma única autorização sensível cobrindo todas as linhas alteradas;
- a ação Fechar Caixa (F8) com as 4 guardas, a ordem de execução completa e o disparo condicional do salvamento de Eventos (só quando há pendência real);
- o PDF do Fechamento (Blade + Browsershot), com todas as seções sempre presentes mais as 12 seções condicionais controladas por checkbox/Parâmetro do Sistema.

Não inclua nesta entrega: nenhuma parte da Fundação de Caixa (estado de caixa no Usuário, comando `AbrirCaixa`, schema do ledger `autenticacoes`) — já especificada em `01-speckit-prompt.md`, só consuma; nenhuma tela/fluxo de lançamento (Frente de Caixa, Controle de Recebimentos, Estorno, Cheques/Recebimentos, Depósitos, Transferências, Duplicatas, Perdas, Devoluções, Renegociação, Quitação Extra Caixa); ECF, impressora fiscal, impressora matricial, TEF; `NumeroCopias` (o PDF gerado tem sempre uma via única).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/caixa/dmfechamentocaixa.pas/.dfm` e `apps/caixa/fmfechamentocaixa.pas/.dfm`.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que a Fundação de Caixa (spec 01) já deve ter entregado.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise.

## Investigação Laravel obrigatória

Analise o estado existente antes de desenhar qualquer fluxo novo:

- os artefatos entregues pela Fundação de Caixa (`01-speckit-prompt.md`): campos de caixa no Usuário, `caixaaberto`, comando `AbrirCaixa`, `LegacyAutenticacaoRepository`, leitura de `cheques`/`recebimentos`, lookup de Eventos/Tipos de Recebimento;
- `App\Domain\Vendas\Comercial\MoneyDecimal` (toda a totalização usa decimal, nunca float);
- `App\Services\Authorization\SensitiveOperationAuthService`/`SensitiveOperationProofService`/`ValidateSensitiveOperationProofRequest` (autorização sensível por senha, já usada por Contas a Pagar e Cancelamento de Contratos — reaproveitar para a autorização em lote da aba Eventos e para a ação Fechar Caixa);
- `App\Application\Vendas\Orcamentos\Impressao\OrcamentoImpressaoPdfRenderer`/`OrcamentoImpressaoPreparationService` (stack Blade + Browsershot já estabelecido — não usar FastReport nem comandos ECF);
- `specs/054-configuration-center` (Configuration Center — onde os 15 Parâmetros do Sistema de negócio desta entrega devem ser cadastrados, se ainda não estiverem).

## Evidência Delphi confirmada

### Matriz dourada de totalização

Evidenciada pela query UNION completa de `qryTotalizacoesCaixa` (`dmfechamentocaixa.dfm:397-1045`) e pelo CalcField `qryTotalizacoesCaixaCalcFields` (`dmfechamentocaixa.pas:1689-1716`):

- **SaldoAnterior**: saldo do último lançamento do caixa/filial anterior à data pesquisada (ou 0 se nenhum existir).
- **Juros**: `SUM(a.valor − coalesce(a.valorvenctoparcela, p.valorvencto))` só quando `a.valor > valorvencido`, tipos `P`/`F`.
- **Descontos**: `SUM(valorvencido − a.valor)` só quando `valorvencido > a.valor`, tipos `P`/`F`.
- **Devolucoes**/**DevolucoesSaldo**/**Deposito**/**Perdas**/**ResgateCheque**/**Duplicatas**: soma simples de `a.valor` por tipo (`N`/`A`/`B`/`J`/`R`/`G`).
- **ChequeAVista**/**ChequePre**/**ChequeNaoIdentificado**: soma de `a.valor` tipo `H`, particionada por `cheques.data >= cheques.vencto` / `< vencto` / cheque nulo.
- **DocEntrada**/**DocSaida**: soma de `a.valor` tipo `D`, particionada pela comparação cronológica de `a.saldo` com o lançamento anterior do mesmo caixa/filial (maior = entrada, menor = saída).
- **TransEntrada**: soma tipo `E`. **TransSaida**: soma tipo `S` **só quando `confirmacao = true`** (pendentes ficam fora — ver bloqueio de Fechar Caixa abaixo).
- **Cancelamento**: `count(*)` tipo `C` (não é valor monetário).
- **Prestacoes**: soma de `a.valor` tipos `P`/`F`.
- **AjustSldDevTroca**: soma de `a.valor` tipo `U`.
- **Cartao**/**Pix**: **não** somam `autenticacoes.valor` — somam `recebimentos.valorlancto` via `recebimentos.transacao = autenticacoes.transacao` (tipo `T`), filtrando `tiposrecebimentos.tiporecebimento in ('C','B')` (Cartão) ou `= 'P'` (Pix).
- Todas as somas (exceto Cancelamento) excluem lançamentos cancelados via `Not Exists (select a1.numero from autenticacoes a1 where a.numero = a1.autenticacao)`.

**Saldo Atual — DECISÃO NOVA já resolvida (fórmula única)**: existem três cálculos no Delphi, mas só um é de fato usado (confirmado por ausência de qualquer chamada/exibição dos outros dois — `TdtmFechamentoCaixa.GetSaldoAtual` e a coluna física `saldoatual` são **POSSÍVEL BUG LEGADO/código morto**, não replicar). O único usado, tanto em tela (`dtxSaldoAtual`, `DataField='Saldo_Atual'`, `fmfechamentocaixa.dfm:1022`) quanto no relatório impresso, é:

```
Saldo_Atual = SaldoAnterior
            + (Prestacoes + DocEntrada + TransEntrada + ResgateCheque + AjustSldDevTroca)
            - (Devolucoes + DevolucoesSaldo + DocSaida + TransSaida + Deposito
               + ChequeAVista + ChequePre + ChequeNaoIdentificado + Duplicatas + Cartao + Pix)
```

Toda a totalização usa `MoneyDecimal` (decimal), nunca float, mesmo o Delphi usando `Double`/`TFloatField` na maioria dos campos.

**Resumo por Filial de Venda** (`qryResumoVendas`): agrupa por `contratos.filialvenda`, com Juros/Descontos recalculados **linha a linha** por parcela (`CASE WHEN a.valor > valorvencido THEN ... ELSE 0`) — é um cálculo **independente** do Juros/Descontos da totalização geral acima; ambos devem ser implementados fielmente, sem tentar unificá-los.

**Resumo de Renegociados** (`qryRenegociado`/`qryOrigem`): filtra parcelas cujo contrato tem `primogenito` preenchido; para cada uma, busca a(s) parcela(s) de origem via `parcelas.origempagto` no contrato primogênito — relação 1-para-N, exibida como sub-linhas por origem.

### Aba Eventos

Grid (`dbgEventos`, `fmfechamentocaixa.dfm`) com 5 colunas: `evento` (**editável**, via lookup ou digitação direta do código), `descricao` (somente leitura, auto-derivada do join com `eventos`, ou formatada como "Dupl. X-Y Romaneio Z" quando a autenticação tem `documentopag`/`numeroduplicata`), `valor` (somente leitura), `parametros` (**editável**, texto livre), `alterado` (somente leitura, indicador).

- Só carrega autenticações do dia com `not a.cancelada and e.tipomovimentacao in ('E','S')`.
- `AfterInsert` cancela imediatamente qualquer tentativa de inserção — o grid é só para reclassificar linhas existentes.
- `BeforePost` marca `alterado := true` na linha (qualquer edição de `evento` ou `parametros` conta).
- `AfterOpen` desabilita edição inteira quando o usuário logado não é Gerente de Caixa.
- **DECISÃO NOVA**: edição em lote — o usuário reclassifica várias linhas antes de salvar; uma única ação "Salvar" grava todas as linhas alteradas numa transação, gated por uma única autorização sensível (senha de Gerente de Caixa) cobrindo o lote inteiro.

### Ação Fechar Caixa (F8)

Ordem de execução confirmada (`TfrmFechamentoCaixa.FecharCaixa` + `TdtmFechamentoCaixa.Fecharcaixa`):

1. **Guarda: transferência não confirmada** — bloqueia se existe transferência de saída (`tipo='S'`, `entradapendente=true`, `confirmacao is null`) pendente para este caixa.
2. **Guarda: código do caixa vazio** — bloqueia.
3. **Guarda: data de fechamento em branco** — bloqueia.
4. **Guarda: só fecha o próprio caixa** — comparação direta de código, **sem exceção para Administrador/Suporte/GerenteCaixa** (nenhum papel pode fechar o caixa de outro operador; esses papéis só liberam **selecionar** outro caixa para consulta/impressão).
5. **Geração do PDF** — acontece antes de persistir o fechamento.
6. **Persistência do fechamento** — só grava se a data de fechamento informada bater com a `dataaberturacaixa` vigente (guarda de consistência da Fundação); se não bater, nada é persistido e a UI mostra "data de abertura/fechamento diferem".
7. **Se o usuário é Gerente de Caixa**: dispara o salvamento da aba Eventos — **DECISÃO NOVA**: só quando há de fato ao menos uma linha alterada pendente (no Delphi isso acontece incondicionalmente; ajustado aqui pra eliminar uma fricção de senha sem propósito).

Se a etapa 7 falhar (senha incorreta), o fechamento do caixa em si (etapa 6) **já foi persistido** — a falha em salvar Eventos não desfaz o fechamento.

### PDF do Fechamento

Substituindo ECF/impressora matricial/FastReport (stack Blade + Browsershot, seguindo `orcamentos-impressao`):

- **Cabeçalho**: razão social, "Resumo Geral de Caixa", Filial (código + nome), Caixa (código + nome do operador), data/hora, status Aberto/Fechado, "Referente à movimentação de [data]".
- **Saldo Anterior do Caixa**.
- **Seção Entradas**: Recebimentos (prestações − juros), Recebimentos de Juros, Descontos Concedidos, Documentos de Entrada, Entrada de Transferências, Resgate de Cheques, Ajuste de Saldo de Devolução/Troca — cada linha só aparece se diferente de zero — e o TOTAL.
- **Seção Saídas**: Devoluções de Numerário, Devoluções de Saldo de Troca, Documentos de Saída, Saída de Transferência, Depósitos Bancários, Cheque à Vista, Cheque a Prazo, Cheque não identificado, Duplicatas de Fornecedores, Cartões de Crédito/Débito, Pix — mesma regra de omitir zeros — e o TOTAL.
- **Seção Outros**: Saldo do Caixa no Dia (fórmula única acima), Número de Autenticações Canceladas (se houver), Perdas (se houver).
- **Detalhamento dos Recebimentos**: agrupado por tipo de recebimento, com sub-linhas por descrição de tipo dentro de cada grupo.
- **12 seções condicionais** (cancelamentos, cheques a prazo/à vista, depósitos, devoluções, devoluções de saldo, documentos entrada/saída, duplicatas, perdas, recebimentos, resgate de cheque, resumo de vendas por filial + resumo de renegociados, transferências + pendentes): cada uma lista os lançamentos detalhados do tipo correspondente com total ao final. Controladas por checkbox individual + Parâmetro do Sistema como padrão inicial marcado; um checkbox "Imprimir Detalhes" força todas.
- **Rodapé**: três linhas de assinatura (`Assinatura1/2/3`, Parâmetros do Sistema), data/hora de geração.
- **DECISÃO NOVA**: `NumeroCopias` fica fora desta migração — o PDF gerado tem sempre uma via única; impressão física de múltiplas vias, se necessária, é responsabilidade do diálogo de impressão do navegador/leitor de PDF.

## Decisões obrigatórias

1. Totalização replica a matriz dourada acima integralmente, usando `MoneyDecimal`.
2. Saldo Atual usa exclusivamente a fórmula única confirmada; as duas variantes descartadas (property morta e coluna física não exibida) não são replicadas.
3. Resumo por Filial de Venda e Resumo de Renegociados são cálculos à parte, não reaproveitam a mesma agregação da totalização geral.
4. Aba Eventos: duas colunas editáveis (`evento`, `parametros`); nunca permite inserir linha; edição em lote com uma única autorização sensível cobrindo o lote inteiro.
5. Fechar Caixa segue a ordem de 7 passos evidenciada; nenhum papel pode fechar caixa de outro operador; a segunda autorização (salvar Eventos) só ocorre com pendência real.
6. PDF via Blade + Browsershot, sem FastReport/ECF/impressora matricial/TEF; checkboxes de seção preservados com Parâmetro do Sistema como padrão; `NumeroCopias` não integra o documento gerado.
7. Todos os Parâmetros do Sistema desta entrega (seções do relatório, assinaturas, limite de dias) resolvem via Configuration Center (`specs/054-configuration-center`).

## Critérios de aceite

- [ ] Totalização reproduz a matriz dourada (todos os totais, incluindo Saldo Atual pela fórmula única) usando `MoneyDecimal`.
- [ ] Fechar Caixa bloqueia corretamente nos 4 casos de guarda; nenhum papel consegue fechar caixa alheio.
- [ ] Fechar Caixa gera o PDF antes de persistir o fechamento; se a persistência falhar por incompatibilidade de data, nada muda no Usuário.
- [ ] A segunda autorização (salvar Eventos) só é solicitada quando há ao menos uma linha alterada pendente.
- [ ] A aba Eventos permite editar `evento` e `parametros` em várias linhas, nunca cria linha nova, e salva em lote com uma única autorização sensível cobrindo todas as linhas alteradas.
- [ ] O PDF inclui todas as seções sempre presentes e as 12 seções condicionais respeitando checkboxes/Parâmetros; linhas com valor zero são omitidas.
- [ ] `NumeroCopias`, ECF, impressora matricial e TEF não aparecem em nenhum lugar da implementação.

## Matriz mínima de testes

- **Saldo Atual**: caixa com saldo anterior positivo + mix de entradas/saídas de vários tipos → resultado bate com a fórmula única, não com nenhuma das duas fórmulas descartadas.
- **Tipo D (Documento)**: uma entrada e uma saída no mesmo dia, mesma filial/caixa → classificação correta por comparação cronológica de saldo.
- **Tipo H (Cheque)**: um cheque à vista, um a prazo e um sem `cheque` vinculado → três classificações corretas.
- **Tipo T (Cartão/Pix)**: uma autenticação tipo T com recebimento tipo `C` e outra com tipo `P` → valores creditados nos totais corretos via `recebimentos.valorlancto`.
- **Cancelamento**: uma autenticação cancelada (referenciada por outra tipo `C`) → excluída de todos os totais exceto do contador de Cancelamento.
- **Transferência pendente**: uma transferência de saída com `entradapendente=true` e `confirmacao is null` → bloqueia Fechar Caixa; uma confirmada não bloqueia e entra no total.
- **Fechar caixa de terceiro**: usuário tenta fechar um caixa que não é o seu (mesmo sendo Administrador/Suporte/GerenteCaixa) → bloqueado.
- **Salvar Eventos sem pendência**: Gerente de Caixa fecha o caixa sem ter editado nada na aba Eventos → nenhuma segunda autorização é solicitada.
- **Salvar Eventos com pendência**: mesma situação, mas com 2 linhas editadas → uma única autorização cobre as duas.
- **PDF com seções desmarcadas**: gerar com todos os checkboxes de seção desligados → só cabeçalho/Entradas/Saídas/Outros/Detalhamento aparecem; com "Imprimir Detalhes" ligado → todas as seções aparecem independente dos checkboxes individuais.
- **Renegociação**: uma parcela com `contratos.primogenito` preenchido e múltiplas origens → todas aparecem como sub-linhas do Resumo de Renegociados.
- **Resumo por filial**: duas filiais de venda diferentes no mesmo dia/caixa → juros/descontos calculados linha a linha por parcela, agrupados corretamente (cálculo independente da totalização geral).

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais desta fatia (Fechamento de Caixa), consumindo a Fundação de Caixa (spec 01) sem reespecificá-la;
- identifiquem os arquivos/repositórios/serviços Laravel atuais a estender, após inspecioná-los;
- detalhem o contrato de totalização, o contrato da aba Eventos, a ordem de execução de Fechar Caixa e a estrutura do PDF;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que a Fundação de Caixa, as telas de lançamento, `NumeroCopias` e qualquer integração ECF/impressora física/TEF **não fazem parte** desta entrega;
- não mandem investigar Delphi.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer parte da Fundação de Caixa (estado de caixa no Usuário, comando `AbrirCaixa`, schema do ledger `autenticacoes`) — já especificada em `01-speckit-prompt.md`;
- qualquer tela/fluxo de lançamento que escreva `autenticacoes` (Frente de Caixa, Controle de Recebimentos, Estorno, Cheques/Recebimentos, Depósitos, Transferências, Duplicatas, Perdas, Devoluções, Renegociação de Carnês, Quitação Extra Caixa);
- integração com impressora fiscal ECF, impressora matricial ou TEF;
- `NumeroCopias`/duplicação de conteúdo dentro do PDF;
- Consulta de Fita de Caixa, Relatório de Caixa e Metas de Venda;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
