# Documentar o fluxo completo da tela de Cancelamento em lote no Delphi

Type: task
Status: resolved
Blocked by:

## Question

Documentar integralmente `TfrmCancelamentoContratos`/`TdtmCancelamentoContratos` (`delphi/apps/vendas/fmcancelamentocontratos.pas`/`.dfm`, `dmcancelamentocontratos.pas`/`.dfm`): abas Orçados/Reservados/Faturados (`rgbOperacao`), filtros (Filial, Vendedor, Cliente, Data de emissão), seleção/contadores/totais, modal de Motivo, alternância Cancelar↔Excluir F7 conforme `parsistema.ExclusaoContrato`, SQL das queries de consulta e do processamento em lote, o que é delegado a `dtmCadastroContratos`/rotinas compartilhadas versus o que é próprio desta tela, e tratamento de erro/sucesso por item durante o lote.

## Answer

### Navegação e teclas

- `CONFIRMADO` — tela MDI standalone, registrada no menu (`rgvendas.pas:34`), instanciada também por `fmcadastrocontratos.pas:2522-2524` e `fmoperacoescontratos.pas:669-671` só para reabrir e chamar `RefazConsulta` (atualizar a lista) depois de uma operação feita em outro lugar — não é o inverso.
- `CONFIRMADO` — `VK_F6` dispara `sbnGerar.Click` (monta a consulta/lista com os filtros atuais); `VK_F7` dispara `sbnCancelar.Click` (executa Cancelar/Excluir sobre os marcados). `fmcancelamentocontratos.pas:266-277`. Ou seja, F6 aqui **não** cancela — é o oposto do F6 do Cadastro de Orçamentos/Contratos, que aciona diretamente cancelamento/exclusão.
- `CONFIRMADO` — `VK_ESCAPE` fecha a consulta corrente e devolve foco a `rgbOperacao`.
- `DIVERGENTE (não ativo)` — o construtor tem, comentado, um bloqueio mútuo com o Cadastro de Contratos (`TfrmCadastroContratos.Referencia` + `ctCANCELAMENTOCONTRATOABERTO = 'O Cadastro de Contratos esta inoperante por que o Cancelamento de Contratos esta aberto.'`, `ctconstantes.pas:1665`). Está desligado hoje (`fmcancelamentocontratos.pas:164-168`); não há impedimento real de uso simultâneo das duas telas sobre o mesmo Contrato.

### Abas e filtros

- `CONFIRMADO` — `rgbOperacao` tem exatamente três itens: `Orçados` (0), `Reservados` (1), `Faturados` (2) — `fmcancelamentocontratos.dfm:373-376`. Trocar de aba fecha a consulta atual (`rgbOperacaoClick` → `FecharConsultaContratos`, `fmcancelamentocontratos.pas:403-407`).
- `CONFIRMADO` — filtros disponíveis: Filial (`edfFilial`), Vendedor (`edfVendedor`), Cliente (`edfCliente`), Data de emissão (`edtDataEmissao`, default `DataServidor - 30`). Motivo (`edfMotivo`) também é um lookup na mesma tela, mas é usado na **operação** de cancelar, não como filtro de listagem.
- `CONFIRMADO` — validação antes de gerar a lista (F6/`sbnGerar`): Data de emissão obrigatória e válida; Filial e Vendedor, se preenchidos, devem existir (`ValidarCampos`, `fmcancelamentocontratos.pas:367-375`). Cliente e Motivo não são validados aqui.
- `CONFIRMADO` — query base única para as três abas (`qryContratos`, `dmcancelamentocontratos.dfm:165-230`):
  ```sql
  Select t.numero, t.filialvenda, t.data, t.valorprazo, t.situacao,
         coalesce(v.razao, v.nome) as nomecliente, u.nome as nomevendedor,
         t.motivo, t.cliente, t.tipocliente, t.creditotroca,
         t.can_data, t.can_usuariologado, t.can_usuarioautorizacao, false as selecionar
  From contratos t, vfornecedores v, usuarios u
  Where (t.cliente = v.codigo) and (t.vendedor = u.codigo)
    and (os IS NULL OR os='false') and (v.tipo = t.tipocliente)
    %situacao %filial %vendedor %emissao %cliente
  Order By t.data
  ```
  `DÚVIDA` — significado exato do campo/flag `os` (`os IS NULL OR os='false'`) não confirmado neste ticket; parece excluir Contratos originados de Ordem de Serviço, mas não há evidência direta aqui.
- `CONFIRMADO` — o macro `%situacao` por aba (`SetSituacao`, `dmcancelamentocontratos.pas:671-685`):
  - Orçados (0): `t.situacao = 'O' and t.vendedor = u.codigo`.
  - Reservados (1): `t.situacao = 'R' and t.vendedor = u.codigo`.
  - Faturados (2): `t.situacao = 'F' and t.vendedor = u.codigo` **e** `(count total de parcelas do contrato) = (count de parcelas com datapagto is null and tipopagto is null)` — ou seja, **só lista Faturados em que nenhuma parcela foi paga ou estornada**.
  - `DECISÃO NOVA candidata` — esse filtro de listagem é, na prática, a única guarda financeira aplicada nesta tela para Faturados; não há checagem equivalente de fiscal (`dadosfiscais`/`notas`) nem de devolução/troca na query nem no código de cancelamento (ver seção Cancelamento). Isso diverge do que o ticket 21 documentou para o Cadastro principal (`AutorizacaoCancelarContratoFaturado`, bloqueio por fiscal autorizado e por devolução/troca).
- `CONFIRMADO` — `edtDataEmissaoExit` também reabastece o parâmetro `dataemissao` das queries de Vendedor (não filtra Contratos, só a lista de Vendedores pesquisáveis).

### Motivo

- `CONFIRMADO` — `qryMotivos`/`qryConsultaMotivos`: `select * from motivos where inativo is null [and codigo=:codigo] order by descricao` — **sem** filtro por `tipomotivo` (`dmcancelamentocontratos.dfm:572-576, 623-626`). Divergente do F6 de Orçamentos, que filtra `tipomotivo = 'V'`.
- `DIVERGENTE` — Motivo é **opcional** aqui: `sbnCancelarClick` só grava `CodigoMotivoCancelamento` se `edfMotivo.Text` não estiver vazio e o código existir (`fmcancelamentocontratos.pas:287-297`; `dmcancelamentocontratos.pas:399-402`). Não há bloqueio se o campo ficar em branco.
- `CONFIRMADO` — não existe campo de descrição/texto complementar nesta tela (nenhum memo), diferente do padrão Motivo+descrição+Atendimento decidido para Orçamentos e para o Cadastro de Contratos (ticket 21).

### Alternância Cancelar × Excluir (F7)

- `CONFIRMADO` — o rótulo/ação do botão único (`sbnCancelar`, F7) depende de `rgbOperacao.ItemIndex` (`actHabilitarUpdate`, `fmcancelamentocontratos.pas:109-137`):
  - aba Orçados (0): rótulo/ação segue `parsistema.ExclusaoContrato` — `excEXCLUIR` → "Excluir F7"; `excCANCELAR` → "Cancelar F7"; `excPERGUNTAR` → "Canc./Exc. F7" (usuário escolhe no clique).
  - abas Reservados (1) e Faturados (2): **sempre** "Cancelar F7" — Exclusão física nunca é oferecida fora de Orçados, independentemente do parâmetro.
- `CONFIRMADO` — resolução em `ConfirmaOperacao` (`dmcancelamentocontratos.pas:432-459`): para `Tipo=0` (Orçados), decide Excluir/Cancelar pelo enum, com `excPERGUNTAR` perguntando via `MensagemConfirmacao(ctCANCELARCONTRATOORCADO)` ("Escolha o botão OK para EXCLUIR o contrato orçado…"); para `Tipo=1,2` (Reservados/Faturados), sempre `CancelarContratos`.
- `CONFIRMADO` — confirmação inicial única antes de processar o lote inteiro: `MensagemConfirmacao(Format(ctOPERACOESCONTRATOS, ['o CANCELAMENTO']))` ou `['a EXCLUSÃO']` (`ctOPERACOESCONTRATOS = 'Confirme ''%s'' do(s) contrato(s).'`) — uma única confirmação para todos os marcados, não por item.

### Cancelamento (`CancelarContratos`, `dmcancelamentocontratos.pas:198-430`)

- `CONFIRMADO` — autorização: se Situação `<> 'O'` e não (`R` e `parsistema.AutorizacaoCancelarContratoFaturado`), exige `ObterAutorizacao` por senha (se o usuário logado já tem `DevolucaoProduto`) ou por login+permissão `DevolucaoProduto` de outro usuário; mesmo padrão citado no ticket 21 para o Cadastro principal.
- `CONFIRMADO` — para cada Contrato marcado (loop com `DisableControls`/bookmark, sem transação única do lote): se Situação `<> 'O'`, gera movimentos de estoque `TPE`/`SQU`/`TRE` por produto (mesma lógica de liberação de reserva/futuro do Cadastro principal), bloqueando estoque via `qryEstoqueBloqueio ... for update`.
- `CONFIRMADO` — se Situação `= 'F'`: estorna crédito de troca quando `creditotroca <> 0` (`AtualizarSaldoCreditoCliente('E')`) e **sempre** chama `ExtornarParcelas`, que marca **todas** as parcelas do Contrato com `valorpagto = valorvencto`, `datapagto = DataServidor`, `filialpagto = FilialBase`, `tipopagto = 'E'` — mesma semântica de encerramento por estorno já decidida no ticket 21, e coerente com o filtro de listagem que só traz Faturados sem parcela paga (logo, aqui "estornar" está sempre zerando parcelas ainda não pagas).
- `CONFIRMADO` — grava `situacao='C'`, `can_data`, `can_usuariologado`; grava `can_usuarioautorizacao` apenas quando `Situacao <> 'O'`; grava `motivo` só se `CodigoMotivoCancelamento <> -1`.
- `NÃO LOCALIZADO` — nenhuma checagem de documento fiscal (`dadosfiscais`/`notas`) nem de devolução/troca existente antes de cancelar um Faturado nesta tela (nem na query, nem no código) — apenas a guarda indireta de "nenhuma parcela paga" do filtro de listagem.
- `DIVERGENTE (desativado)` — `RetiraContratodoOrcamento` (desvincular o Orçamento de origem) está **comentado** tanto em `CancelarContratos` (`dmcancelamentocontratos.pas:405`) quanto em `ExcluirContratos` (`dmcancelamentocontratos.pas:519`) — o vínculo com o Orçamento de origem não é tratado por esta tela hoje.
- `CONFIRMADO` — cada Contrato é persistido (`Perpetrar`) individualmente dentro do loop, não em uma única transação para o lote inteiro: uma falha no meio do lote deixa os itens já processados persistidos e interrompe os restantes, sem relatório estruturado de sucesso/falha por item — só a mensagem final da UI.
- `CONFIRMADO` — sem permissão suficiente, `Result := False` e `MensagemAviso(ctUSUARIOSEMPERMISSAO)`; nenhum Contrato é alterado.

### Exclusão física (`ExcluirContratos`, `dmcancelamentocontratos.pas:477-534`, só alcançável a partir da aba Orçados)

- `CONFIRMADO` — por Contrato marcado: exclui fisicamente Produtos (`qryProdutosContratos`) e Parcelas (`qryParcelas`), depois o cabeçalho (`qryContratos.Delete`), tudo dentro de um único `Perpetrar` por item.
- `NÃO LOCALIZADO` — nenhuma exclusão de Movimentos de estoque, nenhuma checagem de vínculo (Documento Fiscal, Atendimento, etc.) antes de excluir — não há guarda de integridade além da Situação já filtrada pela aba (`O`).
- `DIVERGENTE (desativado)` — mesmo caso do Cancelamento: `RetiraContratodoOrcamento` comentado.
- `CONFIRMADO` — mesma ausência de transação única do lote e de relatório por item que o Cancelamento.

### O que é próprio desta tela vs. compartilhado

- `DIVERGENTE` — `CancelarContratos`/`ExcluirContratos` são implementações **próprias** de `TdtmCancelamentoContratos`, não chamadas a `dtmCadastroContratos`. Reproduzem em paralelo boa parte da lógica de estoque/financeiro descrita no ticket 21 para o Cadastro principal (mesmos códigos de movimento `TPE`/`SQU`/`TRE`, mesma semântica de estorno `E`), mas sem as guardas fiscais/devolução documentadas lá — é caminho de código duplicado, não reuso.
- `CONFIRMADO` — só a navegação de volta é compartilhada: após operar, a tela tenta localizar `TfrmCadastroContratos` e `TfrmOperacoesContratos` abertos (`TfrmCadastroContratos.Referencia`, `TfrmOperacoesContratos.Referencia`) só para repassar a seleção/atualizar a consulta deles — não há chamada de comando de domínio compartilhado.

### Concorrência e integridade

- `CONFIRMADO` — bloqueio de estoque via `SELECT ... FOR UPDATE` (`qryEstoqueBloqueio`, `dmcancelamentocontratos.dfm:501-516`), preenchido em runtime com os produtos/filiais do Contrato corrente.
- `NÃO LOCALIZADO` — qualquer controle de revisão/versão do Contrato (equivalente a `revision`/`expected_revision` já decidido no ticket 21) nesta tela; ela relê o cabeçalho na mesma consulta que preenche a grade, sem recontrole de estado entre a marcação e a execução do F7.

