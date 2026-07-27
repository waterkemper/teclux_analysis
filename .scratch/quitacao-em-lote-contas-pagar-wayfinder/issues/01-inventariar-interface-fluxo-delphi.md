# Inventariar a interface e o fluxo da Quitação em Lote no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Qual é o fluxo completo alcançável em `fmquitacaoduplicatas.pas/.dfm`: entrada no módulo, filtros, pesquisas, colunas, seleção e marcação, edição de previsão/valores, agrupamento por cheque, confirmações, loop de pagamento parcial, mensagens, atalhos, totalizadores e estados de loading, vazio e erro?

## Answer

### Escopo e evidências

Inventário baseado em `C:/projetos.vcl/apps/contaspagar/fmquitacaoduplicatas.pas/.dfm`, seguindo chamadas ao data module somente até o nome e a intenção necessários para explicar a interface. Cálculos, SQL, transação, loop interno de pagamento parcial e efeitos financeiros pertencem a [Inventariar as regras e os efeitos financeiros da Quitação em Lote no Delphi](02-inventariar-regras-efeitos-delphi.md).

### Entrada e jornada principal

- `CONFIRMADO`: a janela chama-se **Quitação de Duplicatas**, abre na aba **Parâmetros**, com foco no vencimento inicial. Vencimento inicial, vencimento final e data de pagamento começam na data do servidor; a Filial de Pagamento começa na Filial base.
- `CONFIRMADO`: **Gerar F6** valida os parâmetros, consulta somente Duplicatas elegíveis segundo o data module e abre **Registros Selecionados**. Se nada for encontrado, permanece nos parâmetros, informa “Nenhum registro foi selecionado! (As duplicatas foram autorizadas para pagamento?)” e devolve o foco ao vencimento inicial.
- `CONFIRMADO`: na aba de resultados, o Operador marca as Duplicatas, informa os dados comuns de pagamento e aciona **Confirma F5**. O botão só é habilitado quando há ao menos um item marcado na visão ativa.
- `CONFIRMADO`: após uma Quitação bem-sucedida, a tela pode mandar o Cadastro de Contas a Pagar aberto recarregar o Documento, limpa cheque e contadores, atualiza os totais e posiciona o foco no cheque. A lista quitada permanece disponível para impressão de recibo enquanto o data module mantiver sua identificação.
- `CONFIRMADO`: `Esc` em **Registros Selecionados** volta para **Parâmetros**; não há confirmação explícita no form para descartar a seleção.

### Parâmetros da consulta

- `CONFIRMADO`: período de vencimentos inicial/final; ao menos uma das datas precisa estar preenchida e ambas precisam ser válidas.
- `CONFIRMADO`: escopo por uma ou mais Filiais por meio de `fraListaFiliais`.
- `CONFIRMADO`: Duplicatas em **Carteira** e/ou **Banco**, ambas marcadas inicialmente; pelo menos uma é obrigatória. Quando Banco está desmarcado, o filtro “Banco em cobrança” é desabilitado e limpo.
- `CONFIRMADO`: filtros opcionais por Parte Fornecedora e Banco em cobrança, ambos com pesquisa; o rótulo muda entre **Fornecedor**, **Cliente Fornecedor** e **Filial Fornecedor** conforme o tipo.
- `CONFIRMADO`: filtro DDA com opções **Com DDA** (padrão), **Sem DDA** e **Só DDA**.
- `CONFIRMADO`: ordenação por **Vencimento** (padrão), **Fornecedor** ou **Valor**.
- `CONFIRMADO`: operação **Só quitação** (padrão) ou **Imprimir cheque**.
- `CONFIRMADO`: nominal do cheque **Em branco**, **Fornecedor** (padrão) ou **Empresa**. A escolha também controla se a coluna de nome na grade pode ser editada; os controles de nominal só ficam habilitados em **Imprimir cheque**.
- `CONFIRMADO`: agrupamento **Documento**, **Fornecedor** (padrão) ou **Sem Agrupamento**; os controles de agrupamento e cidade, bem como a alternância F11, só ficam habilitados/visíveis para **Imprimir cheque**.
- `CONFIRMADO`: ao selecionar **Imprimir cheque**, a cidade recebe a cidade da Filial base.

### Visão detalhada e visão agrupada

- `CONFIRMADO`: a visão inicial após gerar depende do modo determinado pelo data module. Há duas apresentações sincronizadas e alternáveis por **F11** quando a operação imprime cheque.
- `CONFIRMADO`: a grade **Detalhada** mostra código/nome da Parte Fornecedora, Documento, número da Duplicata, série/número da nota, vencimento, atraso, valor de vencimento, previsão, Evento e checkbox `OK`; abaixo, permite consultar/editar as observações da Duplicata.
- `CONFIRMADO`: a grade **Agrupada** mostra Parte Fornecedora, Documento, vencimento, atraso, valor, previsão, total a pagar, quantidade de Duplicatas e checkbox `OK`.
- `CONFIRMADO`: F11 preserva as previsões digitadas ao trocar entre detalhado e agrupado e recompõe a outra visão por Documento ou Fornecedor.
- `CONFIRMADO`: **Documento/Fornecedor/Sem Agrupamento** define a formação/apresentação dos grupos para cheque. **Cheque único** é outra opção, visível somente em **Imprimir cheque**, e não deve ser tratada como sinônimo do agrupamento da grade.
- `CONFIRMADO`: a coluna `previsao` é editável e uma previsão alterada manualmente aparece em vermelho; um indicador “Previsão alterada manualmente” também fica visível. O botão de recálculo força nova apuração pela data de pagamento.
- `CONFIRMADO`: linhas marcadas recebem destaque de fundo. Observação não vazia deixa a fonte da linha detalhada em negrito.

### Marcação e totalizadores

- `CONFIRMADO`: duplo clique ou `Ctrl+Espaço` alterna a marcação da linha na grade ativa. **Marcar todas as duplicatas** marca/desmarca toda a visão ativa e reflete automaticamente se todos os itens já estiverem selecionados.
- `CONFIRMADO`: os contadores mudam conforme a visão ativa: **Selecionadas** exibe quantidade e soma da previsão; **Marcadas** exibe quantidade e valor da Quitação.
- `CONFIRMADO`: alternar detalhada/agrupada recalcula os totalizadores da visão exibida.

### Dados comuns da Quitação

- `CONFIRMADO`: são obrigatórios na validação visual **Filial de Pagamento**, **Tipo de Pagamento** e **Data de Pagamento**; Filial e Tipo precisam existir.
- `CONFIRMADO`: a tela também recebe **Conta**, número do cheque e, quando a Contabilidade está ativa, apresenta a conta contábil de crédito derivada da Conta escolhida.
- `CONFIRMADO`: a Conta torna-se obrigatória quando há integração bancária, geração contábil ou impressão de cheque. Em **Imprimir cheque**, exige ainda modelo de cheque configurado e número do cheque.
- `CONFIRMADO`: cheque já usado na mesma Conta e mesma data pode ser reutilizado mediante confirmação; se já usado em outra data, a tela bloqueia.
- `CONFIRMADO`: data de pagamento futura exige confirmação. O limite inferior é condicionado à data contábil; ao sair do campo, a data válida passa a dirigir o cálculo da previsão, e uma data inválida restaura a data do servidor para cálculo.
- `CONFIRMADO`: a tela oferece impressão automática de recibos após a Quitação **por Documento** e/ou **por Fornecedor**, além de reimprimir recibos da última lista quitada.

### Pagamento parcial e interação ainda interna

- `CONFIRMADO`: o Operador pode reduzir a coluna **Previsão** abaixo do **Valor de Vencimento**, tanto na visão detalhada quanto na agrupada; a mudança alimenta o total da Quitação e é preservada entre as visões.
- `NÃO LOCALIZADO NO FORM`: as opções **Cancelar**, **Gerar outra parcela** e **Desconto Obtido** não são construídas em `fmquitacaoduplicatas`; a interface delega a sequência a `EfetuarQuitacao`. O próximo inventário deve localizar o diálogo/loop no data module ou em units chamadas e fixar seu comportamento exato.

### Estados, mensagens e atalhos

- `CONFIRMADO`: atalhos globais: `F5` confirma quando habilitado, `F6` gera quando nos parâmetros, `F11` alterna as visões quando aplicável e `Esc` volta aos parâmetros.
- `CONFIRMADO`: mensagens explícitas cobrem ausência de registros, Conta obrigatória/inexistente, modelo de cheque ausente, cheque não informado, cheque reutilizado, Conta bancária/contábil ausente e data futura.
- `NÃO LOCALIZADO`: não há estado visual dedicado de loading, progresso por item, retry ou erro parcial no form. O processamento é síncrono e o feedback de falhas internas é delegado ao data module/componentes herdados.
- `POSSÍVEL BUG LEGADO`: `ValidarCamposSelecao` exige que ao menos uma data esteja preenchida, mas usa uma condição `OR`; isso não prova que intervalos parcialmente preenchidos sejam semanticamente válidos, apenas que o form não os bloqueia nessa expressão.

### Consequências para a especificação

- Preservar dois estágios claros: filtros/geração e revisão/confirmação.
- Não confundir agrupamento visual por Documento/Fornecedor com **Cheque único**.
- Permitir editar previsão por Duplicata e mostrar diferença entre valor original, previsão calculada e Quitação marcada.
- Coletar todo o diálogo de pagamento parcial antes de persistir, conforme a decisão do mapa; o legado não apresenta progresso transacional seguro no form.
- Reutilizar os padrões atuais de UI do ERP em vez de copiar limitações visuais, bloqueios somente client-side ou processamento síncrono opaco do Delphi.
