
unit fmfechamentorequisicoesitensmontagens;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  DBCtrls, cpdbmemo, cpnumero, cpdbdata, cpdbradiogroup, Mask,
  cpdbfindcontrols, cpdbtext, ComCtrls, Buttons, ExtCtrls,
  dmfechamentorequisicoesmontagens,
  fmajudabt, fmcadastropadraonavegacao, fmconsultabasica, fmconsultaporcampo,
  zquery,
  ctconstantes, cpdbcombobox, cpeditioncontrolvalidation, biblio, ToolWin;


type
  TfrmFechamentoRequisicoesItensMontagens = class(TfrmCadastroPadraoNav)
    pnlFundoJanela: TPanel;
    gbxRequisicoesItens: TGroupBox;
    sbnProcuraTabeladeMontagem: TSpeedButton;
    lblProduto: TLabel;
    dtxDescricaoProduto: TtecDBText;
    lblQuantidade: TLabel;
    lblTabeladeMontagem: TLabel;
    flkTabeladeMontagem: TtecDBFindLookup;
    dtxDescricaoTabeladeMontagem: TtecDBText;
    edtDataMontagem: TDBEditData;
    lblDatadeMontagem: TLabel;
    edtValorPagto: TDBEditNumero;
    lblValorPagto: TLabel;
    lblDataPagto: TLabel;
    edtDataPagto: TDBEditData;
    lblFilial: TLabel;
    gbxObservacoesItens: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    dtxFilialProduto: TtecDBText;
    ckbMarcar: TDBCheckBox;
    flkProduto: TtecDBFindLookup;
    flkFilialProduto: TtecDBFindLookup;
    edtQuantidade: TDBEditNumero;
    ccbTipodeMontagem: TtecDBComboBox;
    lblTipodeMontagem: TLabel;
    procedure sbnProcuraTabeladeMontagemClick(Sender: TObject);
    procedure ckbMarcarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function PermitirProcura: Boolean;
    function TituloPesquisa(Tipo: TipoProcuraRequisicoes): String;
  public
    { Public declarations }
    tipoprocura: TipoProcuraRequisicoes;

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  ControleValido: TWinControl;
  frmFechamentoRequisicoesItensMontagens: TfrmFechamentoRequisicoesItensMontagens;

implementation

{$R *.dfm}

{ TfrmFechamentoRequisicoesItensMontagens }

constructor TfrmFechamentoRequisicoesItensMontagens.Create(
  AOwner: TComponent);
begin
  inherited;
  DataSet := dtmFechamentoRequisicoesMontagens.TabelaItensRequisicoes;
  flkTabeladeMontagem.SetFocus;
end;

destructor TfrmFechamentoRequisicoesItensMontagens.Destroy;
begin
  inherited;
  frmFechamentoRequisicoesItensMontagens := nil
end;

function TfrmFechamentoRequisicoesItensMontagens.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  result := false;
  with dtmFechamentoRequisicoesMontagens do
  if CtrlOn then
   case tipoprocura of
    tpRequisicoesItensTabeladeMontagem:result := ExisteTabeladeMontagem(NomeCampo, Value);
   end;
end;

function TfrmFechamentoRequisicoesItensMontagens.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
   dtmFechamentoRequisicoesMontagens.GravarItensRequisicoes;
end;

function TfrmFechamentoRequisicoesItensMontagens.InternoPesquisar(
  Titulo: String): Integer;
begin
  if PermitirProcura then
  begin
   with dtmFechamentoRequisicoesMontagens do
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

function TfrmFechamentoRequisicoesItensMontagens.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:=TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := false;
end;

function TfrmFechamentoRequisicoesItensMontagens.PermitirProcura: Boolean;
begin
  Result := False;
  if CtrlOn then
  begin
    if flkTabeladeMontagem.Focused then begin
      Result := True;
      tipoProcura := tpRequisicoesItensTabeladeMontagem;
    end;
  end;

end;

function TfrmFechamentoRequisicoesItensMontagens.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmFechamentoRequisicoesMontagens do
  Case tipoprocura of
   tpRequisicoesItensTabeladeMontagem :result := ConsultaTabeladeMontagens;
  end;
end;

function TfrmFechamentoRequisicoesItensMontagens.TituloPesquisa(
  Tipo: TipoProcuraRequisicoes): String;
begin
  Case tipo of
   tpRequisicoesItensTabeladeMontagem: result := ctTABELADEMONTAGEM;
  end;
end;

procedure TfrmFechamentoRequisicoesItensMontagens.sbnProcuraTabeladeMontagemClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkTabeladeMontagem, ctFILIAISMONTAGEM);
end;

procedure TfrmFechamentoRequisicoesItensMontagens.ckbMarcarClick(
  Sender: TObject);
begin
  inherited;
  dtmFechamentoRequisicoesMontagens.MarcarSelecionados(false, False);
end;

end.
