unit fmcadastroparcelasrenegociacao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask, DateUtils,
  cpdbfindcontrols, cpnumero, cpdbdata, dmrenegociacao, 
  fmconsultabasica, fmconsultaporcampo, ZQuery, DBCtrls,
  cpdbtext, ctconstantes, biblio, clparametrossistema, ToolWin, frconsulta,
  frconsultacodigo;

type
  TfrmCadastroParcelasRenegociacao = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxParcelasDevolucao: TGroupBox;
    edtDataVencto: TDBEditData;
    edtValorVencto: TDBEditNumero;
    gbxTipoRecebimento: TGroupBox;
    fraConsultaTipoRecebimentos: TfraConsultaCodigo;
    gbxValor: TGroupBox;
    gbxVencimento: TGroupBox;
    procedure edtDataVenctoEnter(Sender: TObject);
  protected
    dtmRenegociacao: TdtmRenegociacao;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure ExibirMensagemPadronizadaDataVencto;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function   ValidarCamposSelecao: Boolean;
    procedure  SetDataModulo(Dtm: TdtmRenegociacao);
  end;
var
  frmCadastroParcelasRenegociacao: TfrmCadastroParcelasRenegociacao;

implementation

{$R *.dfm}

{ TfrmCadastroParcelaDevolucao }

constructor TfrmCadastroParcelasRenegociacao.Create(AOwner: TComponent);
begin
  inherited;
  edtDataVencto.MensagemPadronizada := ExibirMensagemPadronizadaDataVencto;
  fraConsultaTipoRecebimentos.TipoPesquisa := pesTIPORECEBIMENTO;
end;

destructor TfrmCadastroParcelasRenegociacao.Destroy;
begin
  inherited;
  frmCadastroParcelasRenegociacao:= nil;
end;

procedure TfrmCadastroParcelasRenegociacao.edtDataVenctoEnter(Sender: TObject);
begin
  inherited;
  if Assigned(dtmRenegociacao) then
    with dtmRenegociacao do
      edtDataVencto.Minimo:= DaysBetween(DataServidor, DataFaturamento);
end;

procedure TfrmCadastroParcelasRenegociacao.ExibirMensagemPadronizadaDataVencto;
begin
  if dtmRenegociacao.Operacao = tpALTERACAO then
    MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['de vencimento',
                 edtDataVencto.Text, 'emissão', dtmRenegociacao.qryContratosPorClientedata.asstring]))
  else
    MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['de vencimento',
                 edtDataVencto.Text, 'emissão', datetostr(date)]));
end;

function TfrmCadastroParcelasRenegociacao.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    dtmRenegociacao.ExcluirParcelas;
end;

function TfrmCadastroParcelasRenegociacao.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if ValidarCamposSelecao then
      Result:= dtmRenegociacao.GravarParcelas;
end;

function TfrmCadastroParcelasRenegociacao.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if (dtmRenegociacao.Operacao <> tpALTERACAO) or
       ((dtmRenegociacao.Operacao = tpALTERACAO) and ParSistema.PermitirAlterarQuantidadeParcelas) then
      Result:= dtmRenegociacao.IncluirParcelas(False)
    else begin
      MensagemAviso(ctPARCELASNAOPODEINSERIR);
      Result:= False;
    end;
  end;  
end;

procedure TfrmCadastroParcelasRenegociacao.SetDataModulo(Dtm: TdtmRenegociacao);
begin
  dtmRenegociacao:= dtm;
end;

function TfrmCadastroParcelasRenegociacao.ValidarCamposSelecao: Boolean;
begin
  Result:= edtDataVencto.DataValida and (edtValorVencto.Text <> '');
end;

end.
