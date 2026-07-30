# Inventariar as regras e os efeitos financeiros da Quitação em Lote no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Quais dados, validações, permissões, Parâmetros do Sistema, transações e efeitos são executados por `dmquitacaoduplicatas.pas/.dfm`, pela função `QuitarDuplicatas` de `dmcontaspagar.pas` e por outras units alcançáveis, especialmente para autorização vigente, pagamento parcial, nova parcela, desconto obtido, cheque agrupado, `movtosbancos`, `movtosbancoseventos`, Contabilidade, tributos, Auditoria e falhas intermediárias?

## Answer

### Escopo e cadeia alcançável

Inventário baseado em `dmquitacaoduplicatas.pas/.dfm`, `dmcontaspagar.pas`, `clparametrossistema.pas` e nas rotinas diretamente alcançadas de persistência, Contabilidade, impostos retidos, impressão e autorização. A cadeia confirmada é:

`EfetuarQuitacao` → autorização sensível → `QuitarAgrupadas` quando aplicável → loop `QuitarDuplicatas` do data module → `TdtmContasPagar.QuitarDuplicatas` por Duplicata → `ValidarPagamento` → `GravarDuplicatas` → `GravarContasPagar` → `Perpetrar`/reconciliação.

### Elegibilidade e filtros server-side do legado

- `CONFIRMADO`: a consulta seleciona somente Duplicatas com `previsao = false`, `datapagto IS NULL` e `autorizado = true`; logo, exclui previsões, pagas e não autorizadas.
- `CONFIRMADO`: aplica Filiais de emissão, Parte Fornecedora, vencimento, Carteira/Banco em cobrança, Banco específico, DDA e ordenação.
- `CONFIRMADO`: o filtro visual **Com DDA** não restringe a consulta; significa “com todos os registros”. **Sem DDA** exige `not coalesce(dda,false)` e **Só DDA** exige `coalesce(dda,false)`. `DIVERGENTE`: o nome **Com DDA** é semanticamente ambíguo e não deve ser copiado sem correção de linguagem.
- `CONFIRMADO`: Usuário que não é Administrador nem Suporte não vê Documentos marcados como administrativos (`not d.administrador`).
- `CONFIRMADO`: a procura de Tipos de Pagamento exclui o código `3`, usado para pagamento via adiantamento, porque esse fluxo não deve gerar novo movimento bancário.
- `OPORTUNIDADE`: a elegibilidade é garantida na consulta inicial, mas não há prova de revalidação concorrente uniforme imediatamente antes de cada write. O Laravel deve reler e bloquear todos os itens no início da transação.

### Permissão e Autorização

- `CONFIRMADO`: antes de quitar, a rotina exige um Usuário com capacidade `Pagamento`. Se o Usuário logado já a possui, pede senha; caso contrário, pede login/autorização com `ctAUTORIZACAOPAGAMENTO`/`ctAUTORIZADO`.
- `CONFIRMADO`: a Duplicata recebe `usuario := CodigoUsuario` durante a Quitação.
- `DÚVIDA`: o trecho alcançável não demonstra de forma inequívoca se `CodigoUsuario` passa a representar o Autorizador informado no diálogo ou permanece o Usuário da sessão. O Laravel não deve herdar essa ambiguidade: Operador, Autorizador/proof e autor da Auditoria precisam ser persistidos explicitamente.
- `POSSÍVEL BUG LEGADO`: a mensagem de falha diz “autorizar o pagamento de duplicatas”, embora a ação seja Quitar; reforça que Autorizar e Quitar não devem ser confundidos no novo módulo.

### Cálculo da previsão

- `CONFIRMADO`: para pagamento após o primeiro dia útil do vencimento, soma multa e juros. Multa pode ser percentual do valor de vencimento ou valor fixo; juros podem ser percentual diário ou valor diário, multiplicados pelos dias de atraso.
- `CONFIRMADO`: até o primeiro dia útil, subtrai o desconto cadastrado da Duplicata; após essa data, não aplica esse desconto no cálculo inicial.
- `CONFIRMADO`: alterar a data de pagamento força recálculo. Se houver previsões alteradas manualmente, pergunta se elas também devem ser recalculadas; responder negativamente preserva as alterações.
- `CONFIRMADO`: previsão zero é rejeitada com a orientação de usar o Cadastro de Contas a Pagar para desconto de 100%, e o valor volta ao valor de vencimento.
- `OPORTUNIDADE`: cálculo de dias, moeda e arredondamento depende de `DaysBetween` e SQL com `round(...,2)`; a especificação deve exigir um calculador compartilhado e testes de borda, sem duplicar fórmulas no frontend.

### Loop de pagamento parcial

- `CONFIRMADO`: o diálogo é disparado em `GravarDuplicatas` quando `0 < valorpagto < valorvencto - valordesconto`. Ele identifica a Duplicata e mostra valor pago e valor de vencimento.
- `CONFIRMADO`: os três retornos são **Gerar outra parcela**, **Desconto obtido** e **Cancelar**. Na API Delphi, `mrYes` executa **Gerar outra parcela**, `mrNo` representa **Desconto obtido** e `mrCancel` retorna falha.
- `CONFIRMADO`: **Gerar outra parcela** transforma o `valorvencto` da Duplicata atual no valor pago e cria outra Duplicata pelo saldo `valor calculado - valor pago`, com o mesmo vencimento, multa, tipo de multa, juros e tipo de juros.
- `CONFIRMADO`: a nova parcela fica autorizada e recebe data de autorização quando o Parâmetro do Sistema **AUTORIZACAO PAGTO AUTOMATICA** está ativo; caso contrário, nasce não autorizada e sem data de autorização.
- `CONFIRMADO`: **Desconto obtido** não cria parcela. Mantém o valor de vencimento original, persiste o valor pago menor e a diferença é interpretada como desconto pelos getters contábeis. A chamada em lote fornece `ValorDesconto = 0`, portanto o desconto obtido não é gravado explicitamente em `valordesconto` por esse caminho.
- `POSSÍVEL BUG LEGADO`: a nova parcela usa o mesmo vencimento, sem diálogo para escolher nova data. O prompt deve decidir conscientemente se preserva essa regra ou reutiliza o contrato já implementado no Cadastro de Contas a Pagar; não deve inventar vencimento no browser.
- `DIVERGENTE`: o legado pergunta e muta dentro do loop de persistência. A decisão do mapa substitui isso por preview/preflight de todas as escolhas antes de qualquer write.

### Campos persistidos na Duplicata

- `CONFIRMADO`: a Quitação preenche `datapagto`, `valorpagto`, `valordesconto`, `filialpagto`, `tipopagamento`, `usuario`, `observacao`, e, quando há Conta, `contapagto` e opcionalmente `chequepagto`.
- `CONFIRMADO`: quando a integração bancária está vigente, também persiste `sequencia` e `sequenciaevento`; quando a Contabilidade está ativa, persiste a identificação do lote contábil e a conta de crédito aplicável.
- `CONFIRMADO`: após pagamento, copia data, Conta e cheque para campos auxiliares usados no Estorno.
- `CONFIRMADO`: associa à Duplicata o Evento do Documento a Pagar antes de gerar os efeitos bancários.

### Agrupamento e cheque

- `CONFIRMADO`: se há número de cheque, o legado pergunta “Deseja agrupar os pagamentos no cheque ...?”, salvo quando a consulta detectou cheque já existente e reutilizável na mesma Conta/data.
- `CONFIRMADO`: agrupamento bancário reutiliza a `sequencia` de `movtosbancos`; cada Duplicata recebe sua própria `sequenciaevento` e gera um `movtosbancoseventos` individual.
- `CONFIRMADO`: quando o cabeçalho já existe, soma o pagamento ao valor absoluto do cabeçalho, mantém o sinal de saída e, havendo múltiplos pagamentos, troca a observação para `PAGTO DIVERSAS DUPLICATAS` e limpa o Evento do cabeçalho.
- `CONFIRMADO`: sem agrupamento bancário, cada Duplicata aloca sua própria `sequencia`. A opção de impressão **Cheque único** não é, por si só, a prova de que o movimento foi agrupado; a pergunta `vAgruparPagamentosnoLote` é uma decisão separada.
- `DIVERGENTE`: para o destino deste mapa, cheque agrupado deve possuir um único cabeçalho bancário e evento por Duplicata, sem uma segunda pergunta contraditória durante a persistência.
- `POSSÍVEL BUG LEGADO`: as próximas sequências usam padrão `máximo + 1` por consultas abertas/reutilizadas, sem evidência de lock seguro; não copiar no Laravel.

### `movtosbancos` e `movtosbancoseventos`

- `CONFIRMADO`: efeitos bancários só são gerados quando `datapagto >= InicioIntegracaoBancos`, a data configurada é posterior a `01/01/1980`, o Tipo de Pagamento não é adiantamento (`3`) e há valor pago ou desconto integral.
- `CONFIRMADO`: o cabeçalho recebe Conta, data, `sequencia`, compensação na data de pagamento, Evento, origem `P`, documento derivado de `chequepagto`, observação e valor de saída.
- `CONFIRMADO`: o evento recebe Conta, data, `sequencia`, Evento, `sequenciaevento`, observação e valor da Duplicata.
- `CONFIRMADO`: a descrição canônica individual é `[NF|DOC] [complemento] DUP {documentopag}/{numero} - {fornecedor}`; em múltiplos pagamentos, apenas o cabeçalho torna-se genérico, enquanto os eventos preservam a descrição individual.
- `CONFIRMADO`: após gravar, `ValidarValoresDocumentosPag` reconcilia Duplicata e movimento; em divergência executa rollback e reabre o Documento.
- `POSSÍVEL BUG LEGADO`: a alocação de `sequenciaevento` é calculada em mais de um ponto, e o caminho de cabeçalho existente grava diretamente `próxima + 1`; exige teste explícito de que a chave persistida na Duplicata é exatamente a chave do evento criado.

### Contabilidade e impostos retidos

- `CONFIRMADO`: quando **GERARCONTABILIDADE** está ativo, a Conta de pagamento precisa possuir contrapartida contábil; a Quitação cria/associa lote contábil e lançamentos de pagamento.
- `CONFIRMADO`: agrupamento pode reutilizar o prefixo do lote contábil, mas cada Duplicata acrescenta Documento e número à identificação.
- `CONFIRMADO`: despesas financeiras são `max(valorpagto - valorvencto, 0)`; descontos são a diferença positiva quando `valorpagto < valorvencto`, ou o valor integral quando `valorpagto = 0`.
- `CONFIRMADO`: `Verificarimpostosretidos` participa da gravação com origem `PagamentoDuplicatas`, abrangendo vínculos do Documento, Duplicata e vencimentos dos impostos retidos; **GERAÇÃO AUTOMÁTICA DO IMPOSTO RETIDO** condiciona regras adicionais, como fornecedor de ISS.
- `CONFIRMADO`: o histórico contábil pode vir do Fornecedor, do Parâmetro **Histórico padrão pagto duplicata** ou de fallback contábil.

### Parâmetros do Sistema canônicos

Os nomes abaixo vêm de `biblio/clparametrossistema.pas` e, no Laravel, devem ser lidos via `parametros_valor('<texto>')`/serviço equivalente, conforme ADR-0005:

| Propriedade Delphi | Texto canônico |
|---|---|
| `DataContabil` | `DATA CONTABIL` |
| `AutorizacaoPagtoAutomatica` | `AUTORIZACAO PAGTO AUTOMATICA` |
| `InicioIntegracaoBancos` | `Início Integração Bancos` |
| `GerarContabilidade` | `GERARCONTABILIDADE` |
| `GeracaoAutomaticadoImpostoRetido` | `Geração automática do imposto retido` |
| `historicopadraopagtoduplicata` | `Histórico padrão pagto duplicata` |

### Atomicidade, falhas e Auditoria

- `CONFIRMADO`: `TdtmContasPagar.QuitarDuplicatas` usa `Perpetrar` para persistir, por Duplicata, Documento, Duplicata, movimentos bancários, impostos retidos e lançamentos contábeis, seguido de reconciliação e finalização.
- `DIVERGENTE`: o lote externo chama essa função e efetiva uma Duplicata por vez. Não existe uma única transação abrangendo todas as Duplicatas selecionadas.
- `POSSÍVEL BUG LEGADO`: se uma Duplicata falha ou o Operador cancela o diálogo parcial depois de itens anteriores, o loop não desfaz os itens já efetivados e continua para os seguintes. `EfetuarQuitacao` define sucesso ao autorizar a operação e não agrega corretamente o resultado individual.
- `POSSÍVEL BUG LEGADO`: impressão de cheque e recibos ocorre intercalada/depois do processamento sem um outbox ou estado de retry comprovado; falha física de impressão não equivale a rollback financeiro.
- `NÃO LOCALIZADO`: não há uma trilha de Auditoria de negócio explícita e imutável no caminho analisado além dos campos de Usuário e dos mecanismos genéricos de persistência.
- `DECISÃO DO MAPA`: o Laravel deve realizar preview/preflight de todas as escolhas, bloquear os itens em ordem determinística, efetivar o lote inteiro em uma transação, falhar tudo em qualquer divergência e registrar Operador, Autorizador/proof, itens, opções e chaves resultantes em Auditoria persistente.

### Consequências para os próximos tickets

- Reutilizar a Quitação individual como núcleo, mas fornecer uma operação batch verdadeira, não um adapter que apenas execute commits unitários em sequência.
- Tornar explícitas as escolhas `GENERATE_REMAINDER_INSTALLMENT` e `OBTAINED_DISCOUNT` por Duplicata no comando confirmado; `CANCEL` nunca chega ao comando de write.
- Tratar agrupamento bancário como contrato do lote, com uma chave de cabeçalho retornada e uma chave de evento por Duplicata.
- Revalidar Autorização de Pagamento, estado não pago, revisão/versão e compatibilidade sob lock antes de qualquer efeito.
- Manter impressão como efeito pós-commit recuperável, sem decidir o sucesso financeiro pela impressora.
