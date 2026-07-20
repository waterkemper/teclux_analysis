unit fmparcelaquitacaoextra;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, fmcadastropadrao, ComCtrls, Buttons,
  dmquitacaoextracaixa, cpnumero, DBCtrls, cpdbmemo, Mask,
  cpdbfindcontrols, cpdbdata, ActnList, cpdbtext,
  fmconsultabasica, fmconsultaporcampo, ZQuery, ctconstantes, biblio, DateUtils,
  ToolWin;

type
  TfrmParcelaQuitacaoExtra = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxAlterarParcelas: TGroupBox;
    gbxVencimento: TGroupBox;
    gbxDataVencto: TGroupBox;
    edtDataVencto: TDBEditData;
    gbxValorVencto: TGroupBox;
    edtValorVencto: TDBEditNumero;
    gbxLiquido: TGroupBox;
    gbxDesconto: TGroupBox;
    dtsLiquido: TtecDBText;
    edtDescontoSugerido: TDBEditNumero;
    gbxPagamento: TGroupBox;
    gbxDataPagto: TGroupBox;
    edtDataPagto: TDBEditData;
    gbxValorPagto: TGroupBox;
    edtValorPagto: TDBEditNumero;
    ckbPagamentoParcial: TCheckBox;
    gbxConta: TGroupBox;
    sbnProcurarConta: TSpeedButton;
    dtxDigito: TtecDBText;
    Label1: TLabel;
    gbxSiglaBanco: TGroupBox;
    dtxSigla: TtecDBText;
    gbxNomeAgencia: TGroupBox;
    dtxNomeAgencia: TtecDBText;
    gbxObservacoesBoleto: TGroupBox;
    mmoObservacao: TtecDBMemo;
    flkConta: TtecDBFindLookup;
    gbxEvento: TGroupBox;
    dtxEvento: TtecDBText;
    Bevel1: TBevel;
    sbnEvento: TSpeedButton;
    flkEvento: TtecDBFindLookup;
    procedure sbnProcuraBancoClick(Sender: TObject);
    procedure sbnProcuraAgenciaClick(Sender: TObject);
    procedure edtDataVenctoEnter(Sender: TObject);
    procedure edtDataPagtoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtValorPagtoEnter(Sender: TObject);
    procedure sbnProcurarContaClick(Sender: TObject);
    procedure ckbPagamentoParcialClick(Sender: TObject);
    procedure sbnEventoClick(Sender: TObject);
  private
    FParcelaAlterada: Boolean;
    procedure SetParcelaAlterada(const Value: Boolean);
  public
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property  ParcelaAlterada: Boolean read FParcelaAlterada write SetParcelaAlterada;
  end;

var
  frmParcelaQuitacaoExtra: TfrmParcelaQuitacaoExtra;
  TipoConsulta: TtecQuitacaoExtraCaixa;

implementation

{$R *.dfm}

{ TfrmParcelaQuitacaoExtra }

constructor TfrmParcelaQuitacaoExtra.Create(AOwner: TComponent);
begin
   with dtmQuitacaoExtraCaixa do begin
      inherited;
      DataSet:= TabelaParcelas;
      TipoConsulta:= qecNENHUM;
      RefazConsulta(qryContas, [0],
                   [qryParcelasContaBoleto.AsVariant]);
   end;
end;

destructor TfrmParcelaQuitacaoExtra.Destroy;
begin
  inherited;
  frmParcelaQuitacaoExtra:= nil;
end;

function TfrmParcelaQuitacaoExtra.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if dtmQuitacaoExtraCaixa.ExcluirParcela then
      FParcelaAlterada:= True;
  end;
end;

function TfrmParcelaQuitacaoExtra.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then begin
    if dtmQuitacaoExtraCaixa.GravarParcela(ckbPagamentoParcial.Checked) then
    begin
      FParcelaAlterada:= True;
      dtmQuitacaoExtraCaixa.ParcelaAlterada := True;
    end;
  end;
  ckbPagamentoParcial.Checked:= False;
end;

function TfrmParcelaQuitacaoExtra.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    dtmQuitacaoExtraCaixa.IncluirParcela;
end;

procedure TfrmParcelaQuitacaoExtra.sbnProcuraBancoClick(Sender: TObject);
begin
{  inherited;
  CtrlOn:= True;
  flkBanco.SetFocus;
  InternoPesquisar(''); }
end;

procedure TfrmParcelaQuitacaoExtra.sbnProcuraAgenciaClick(Sender: TObject);
begin
{  inherited;
  CtrlOn:= True;
  flkAgencia.SetFocus;
  InternoPesquisar(''); }
end;

function TfrmParcelaQuitacaoExtra.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
   case TipoConsulta of
      qecCONTA  : Result := dtmQuitacaoExtraCaixa.ExisteConta(NomeCampo, Value);
      qecEVENTO : Result := dtmQuitacaoExtraCaixa.ExisteEvento(NomeCampo, Value)
      else      Result:= False;
   end;
end;

function TfrmParcelaQuitacaoExtra.InternoPesquisar(Titulo: String): Integer;
begin
   Result:= mrNone;
   if CtrlOn then begin
      if ActiveControl = flkConta then
      begin
         TipoConsulta:= qecCONTA;
         Titulo := 'Contas';
      end
      else
      if ActiveControl = flkEvento then
      begin
        TipoConsulta := qecEVENTO;
        Titulo := 'Eventos'
      end
      else TipoConsulta:= qecNENHUM;

      if TipoConsulta <> qecNENHUM then
      begin
         dtmQuitacaoExtraCaixa.AbrirTabelasConsulta(TipoConsulta);
         Result:= inherited InternoPesquisar(Titulo);
         if Result = mrOk then
           dtmQuitacaoExtraCaixa.Selecionar(TipoConsulta);
         dtmQuitacaoExtraCaixa.FecharTabelasConsulta(TipoConsulta);
      end;
   end;
end;

function TfrmParcelaQuitacaoExtra.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmParcelaQuitacaoExtra.TabelaDePesquisa: TZDataSet;
begin
   with dtmQuitacaoExtraCaixa do
      case TipoConsulta of
         qecCLIENTE: Result := ConsultarCliente;
         qecCONTA  : Result := ConsultaContas;
         qecEVENTO : Result := ConsultaEventos;
      end;
end;


procedure TfrmParcelaQuitacaoExtra.edtDataVenctoEnter(Sender: TObject);
begin
  inherited;
  with dtmQuitacaoExtraCaixa do
    if not DataEmBranco(edtDataVencto.Text) then
      edtDataVencto.Minimo := DaysBetween(DataServidor,DataContrato);
end;

procedure TfrmParcelaQuitacaoExtra.edtDataPagtoEnter(Sender: TObject);
begin
  inherited;
{  with dtmQuitacaoExtraCaixa do
    if not DataEmBranco(edtDataVencto.Text) then
      edtDataPagto.Minimo := DaysBetween(DataServidor,DataContrato);}
end;

procedure TfrmParcelaQuitacaoExtra.SetParcelaAlterada(const Value: Boolean);
begin
  if FParcelaAlterada <> Value then
    FParcelaAlterada:= Value;
end;

procedure TfrmParcelaQuitacaoExtra.FormShow(Sender: TObject);
begin
  inherited;
  FParcelaAlterada:= False;
  edtDataVencto.ReadOnly      := (dtmQuitacaoExtraCaixa.ParcelaCarta or
                                  dtmQuitacaoExtraCaixa.ParcelaSPC);
  edtValorVencto.ReadOnly     := (dtmQuitacaoExtraCaixa.ParcelaCarta or
                                  dtmQuitacaoExtraCaixa.ParcelaSPC);
  edtDescontoSugerido.ReadOnly := (dtmQuitacaoExtraCaixa.ParcelaCarta or
                                  dtmQuitacaoExtraCaixa.ParcelaSPC);
end;

procedure TfrmParcelaQuitacaoExtra.edtValorPagtoEnter(Sender: TObject);
begin
  inherited;
  dtmQuitacaoExtraCaixa.AtribuirValorPagto;
end;

procedure TfrmParcelaQuitacaoExtra.sbnProcurarContaClick(Sender: TObject);
begin
   inherited;
   InternoPesquisar(flkConta, ctCONTAS);
end;

procedure TfrmParcelaQuitacaoExtra.ckbPagamentoParcialClick(
  Sender: TObject);
begin
  inherited;
  dtmQuitacaoExtraCaixa.qryParcelas.Edit;
end;

procedure TfrmParcelaQuitacaoExtra.sbnEventoClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(flkEvento, ctEVENTO)
end;

end.
