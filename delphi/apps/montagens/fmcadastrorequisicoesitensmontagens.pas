unit fmcadastrorequisicoesitensmontagens;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, ExtCtrls, ActnList, StdCtrls, DBCtrls, Mask,
  // Constantes
  ctconstantes, biblio, clusuario,
  // Componente
  cpdbradiogroup, cpdbdata, cpeditioncontrolvalidation, cpdbmemo, cpdbcombobox,
  cpdbtext, cpdbfindcontrols, cpnumero,
  // Terceiros
  zquery,
  // Repositorio
  fmcadastropadrao, fmConsultaPorCampo, fmconsultabasica,
  // Projeto
  dmcadastrorequisicoesmontagens, ToolWin;

type
  Tfrmcadastrorequisicoesitensmontagens = class(TFrmCadastroPadrao)
    gbxRequisicoesItens: TGroupBox;
    lblProduto: TLabel;
    sbnProcurarProduto: TSpeedButton;
    dtxDescricaoProduto: TtecDBText;
    edtQuantidade: TDBEditNumero;
    lblQuantidade: TLabel;
    lblTabeladeMontagem: TLabel;
    flkTabeladeMontagem: TtecDBFindLookup;
    sbnProcuraTabeladeMontagem: TSpeedButton;
    dtxDescricaoTabeladeMontagem: TtecDBText;
    edtDataMontagem: TDBEditData;
    lblDatadeMontagem: TLabel;
    edtValorPagto: TDBEditNumero;
    lblValorPagto: TLabel;
    lblDataPagto: TLabel;
    edtDataPagto: TDBEditData;
    lblFilial: TLabel;
    sbnProcuraFilialProduto: TSpeedButton;
    flkFilialProduto: TtecDBFindLookup;
    dtxFilialProduto: TtecDBText;
    actRequisicoesItens: TActionList;
    aclAbilita: TAction;
    flkProduto: TtecDBFindLookup;
    sbnCancelarPagamento: TSpeedButton;
    ccbTipodeMontagem: TtecDBComboBox;
    lblTipodeMontagem: TLabel;
    mmoObservacoes: TtecDBMemo;
    Label1: TLabel;
    procedure sbnProcurarProdutoClick(Sender: TObject);
    procedure sbnProcuraTabeladeMontagemClick(Sender: TObject);
    procedure sbnProcuraFilialProdutoClick(Sender: TObject);
    procedure aclAbilitaUpdate(Sender: TObject);
    procedure sbnCancelarPagamentoClick(Sender: TObject);
    procedure edtDataMontagemChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure flkProdutoMessage(var Msg: String);
  protected
    dtmCadastroRequisicoesMontagens: TdtmCadastroRequisicoesMontagens;
    function InternoIncluir: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function PermitirProcura: Boolean;
    function TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure  SetDataModulo (Dtm: TdtmCadastroRequisicoesMontagens);
  end;

var
  frmcadastrorequisicoesitensmontagens: Tfrmcadastrorequisicoesitensmontagens;
  ControleValido: TWinControl;
  TipoProcura: TipoProcuraRequisicoes;

implementation

{$R *.dfm}

{ Tfrmcadastrorequisicoesitensmontagens }

function Tfrmcadastrorequisicoesitensmontagens.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmCadastroRequisicoesMontagens do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesItensProdutos        :Result := ExisteProduto(NomeCampo, Value);
    tpRequisicoesItensTabeladeMontagem:result := ExisteTabeladeMontagem(NomeCampo, Value);
    tpRequisicoesItensFilialProduto   :Result := ExisteFilialProduto(NomeCampo, Value);
   end;
end;

function Tfrmcadastrorequisicoesitensmontagens.InternoExcluir: Boolean;
begin
 result := false;
 if not ctrlon then
 begin
   result:= inherited InternoExcluir;
   if result then
     dtmCadastroRequisicoesMontagens.ExcluirRequisicoesItens;
 end;
end;

function Tfrmcadastrorequisicoesitensmontagens.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
   dtmCadastroRequisicoesMontagens.GravarRequisicoesitens;
end;

function Tfrmcadastrorequisicoesitensmontagens.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then
    if Result then
      begin
       dtmCadastroRequisicoesMontagens.IncluirRequisicoesItens;
       flkProduto.SetFocus;
      end;
end;

function Tfrmcadastrorequisicoesitensmontagens.InternoPesquisar(
  Titulo: String): Integer;
begin
 if PermitirProcura then
 begin
  with dtmCadastroRequisicoesMontagens do
  begin
    AbreTabelaPesquisa(tipoprocura);
    Titulo := TituloPesquisa(tipoprocura);
    result:=inherited internopesquisar(Titulo);
    if Result = mrOK then
     Selecionar(tipoProcura);
    FechaTabelaPesquisa(tipoprocura);
  end;
 end
 else
  Result := mrNone
end;

function Tfrmcadastrorequisicoesitensmontagens.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:=TfrmConsultaPorCampo.Create(nil);
  if tipoprocura = tpRequisicoesItensProdutos then
       TfrmConsultaPorCampo(result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := false;
end;

function Tfrmcadastrorequisicoesitensmontagens.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if flkProduto.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesItensProdutos;
    end;
    if flkFilialProduto.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesItensFilialProduto;
    end;
    if flkTabeladeMontagem.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesItensTabeladeMontagem;
    end;
  end;
end;

function Tfrmcadastrorequisicoesitensmontagens.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmCadastroRequisicoesMontagens do
  Case tipoprocura of
   tpRequisicoesItensProdutos         :result := ConsultaProdutos;
   tpRequisicoesItensTabeladeMontagem :result := ConsultaTabeladeMontagens;
   tpRequisicoesItensFilialProduto    :result := ConsultaFilialProduto;
  end;
end;

function Tfrmcadastrorequisicoesitensmontagens.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesItensProdutos        : result := ctITEMPRODUTO;
   tpRequisicoesItensTabeladeMontagem: result := ctTABELADEMONTAGEM;
   tpRequisicoesItensFilialProduto   : result := ctFILIAL;
  end;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.sbnProcurarProdutoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkProduto, ctPRODUTO)
end;

procedure Tfrmcadastrorequisicoesitensmontagens.sbnProcuraTabeladeMontagemClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkTabeladeMontagem, ctTABELADEMONTAGEM)
end;

destructor Tfrmcadastrorequisicoesitensmontagens.Destroy;
begin
  inherited;
  frmcadastrorequisicoesitensmontagens := nil;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.sbnProcuraFilialProdutoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkFilialProduto, ctFILIAL)
end;

constructor Tfrmcadastrorequisicoesitensmontagens.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.aclAbilitaUpdate(Sender: TObject);
var
  DadoFiscalExistente: Boolean;
begin
  inherited;
  with dtmCadastroRequisicoesMontagens do begin
    DadoFiscalExistente:= RequisicoesDadoFiscal <> 0;

    sbnIncluir.Enabled:= not DadoFiscalExistente;
    sbnExcluir.Enabled:= not DadoFiscalExistente and not PermiteAlterarRequisicaoItem;
    sbnCancelarPagamento.Enabled:=PermiteAlterarRequisicaoItem;

    flkProduto.Enabled:= not DadoFiscalExistente;
    flkFilialProduto.Enabled:= not DadoFiscalExistente;
    edtQuantidade.Enabled:= not DadoFiscalExistente;

    sbnProcuraTabeladeMontagem.Enabled:= not PermiteAlterarRequisicaoItem;
    if DadofiscalExistente then begin
      sbnProcurarProduto.Enabled:=false;
      sbnProcuraFilialProduto.Enabled:=false;
    end
    else begin
      sbnProcurarProduto.Enabled:= not PermiteAlterarRequisicaoItem;
      sbnProcuraFilialProduto.Enabled:= not PermiteAlterarRequisicaoItem;
    end;
  end;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.sbnCancelarPagamentoClick(Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
  CancelarPagamentoRequisicao: Boolean;
begin
  inherited;
  if UsuarioLogin.GerenteEstoque then
    CancelarPagamentoRequisicao := True
  else begin
    try
      UsuarioAut := dtmCadastroRequisicoesMontagens.ObterAutorizacao(taLOGIN,ctGERENTEESTOQUE,ctAUTORIZADO);
      try
        if Assigned(UsuarioAut) then
          CancelarPagamentoRequisicao := UsuarioAut.GerenteEstoque
        else begin
          CancelarPagamentoRequisicao := False;
          MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']))
        end
      finally
        if Assigned(UsuarioAut) then
          UsuarioAut.Free;
      end
    except
      CancelarPagamentoRequisicao := False
    end
  end;
  if CancelarPagamentoRequisicao then begin
    if MensagemConfirmacao(format(ctCONFIRMECANCELAR, ['este pagamento']))= smbOK then
      dtmCadastroRequisicoesMontagens.CancelarPagamentoRequisicoes;
  end else begin
    MensagemAviso(Format(ctUSUARIONAOAUTORIZADO, [format(ctCONFIRMECANCELAR, ['este pagamento'])]));
    if Assigned(ActiveControl) then
         ActiveControl.SetFocus
    else flkProduto.SetFocus;
  end;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.edtDataMontagemChange(Sender: TObject);
begin
  inherited;
  if dtmCadastroRequisicoesMontagens.DataMontagemAnterior='' then
    dtmCadastroRequisicoesMontagens.DataMontagemAnterior:= edtDataMontagem.Text;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.FormShow(Sender: TObject);
begin
  inherited;
  if (dtmCadastroRequisicoesMontagens.RequisicoesDadoFiscal<>0) then
       flkTabeladeMontagem.SetFocus
  else flkProduto.SetFocus;
end;

procedure Tfrmcadastrorequisicoesitensmontagens.flkProdutoMessage(var Msg: String);
begin
  inherited;
  Msg := 'O código '+ QuotedStr(flkProduto.Text)+' não foi encontrado. Verifique se:' + #13#10 +
         'foi cadastrado no estoque desta filial, ' + #13#10 +
         'se está ativo, se é montável, ' + #13#10 +
         'ou se já está incluído nesta requisição.'
end;

procedure Tfrmcadastrorequisicoesitensmontagens.SetDataModulo(
  Dtm: TdtmCadastroRequisicoesMontagens);
begin
  dtmCadastroRequisicoesMontagens := Dtm;
end;

end.
