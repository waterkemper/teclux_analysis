unit fmcadastrobancos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms,  Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, {Qete,} DB,
  //Componentes
  cpdbfindcontrols, cptexto, cpdbdata,
  //Biblio
  ctconstantes, biblio, clparametrossistema,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo, dmbasico,
  //Terceiros
  ZQuery, ComCtrls, cppagecontrol, cpnumero, cpdbmemo, ActnList, Grids,
  DBGrids, cpdbgrid, dmcadastrobancos, cpdbtext, ZPgSqlQuery, cpquery,
  ToolWin;

type
  TfrmCadastroBancos = class(TfrmCadastroPadrao)
    edfCodigoProcura: TtecDbEditFind;
    edtNome: TDBEditTexto;
    edtInativo: TDBEditData;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    edtSigla: TDBEditTexto;
    gbxAgencias: TGroupBox;
    dbgAgencias: TtecDBGrid;
    flkModeloCheque: TtecDBFindLookup;
    dtxModeloNota: TtecDBText;
    sbnProcurarModeloCheque: TSpeedButton;
    gbxRemessa: TGroupBox;
    edtDiasUteis: TDBEditNumero;
    lblDiasUteis: TLabel;
    lblValorLimite: TLabel;
    edtValorLimite: TDBEditNumero;
    lblQtdeChequeVista: TLabel;
    edtQtdeChequeVista: TDBEditNumero;
    lblQtdeChequePrazo: TLabel;
    edtQtdeChequePrazo: TDBEditNumero;
    gbxContas: TGroupBox;
    plnAgencias: TPanel;
    sbnExcluirAgencias: TSpeedButton;
    sbnIncluirAgencias: TSpeedButton;
    Panel1: TPanel;
    sbnExcluirContas: TSpeedButton;
    sbnIncluirContas: TSpeedButton;
    dbgContas: TtecDBGrid;
    gbxBanco: TGroupBox;
    gbxCodigoBanco: TGroupBox;
    gbxSigla: TGroupBox;
    gbxInativo: TGroupBox;
    gbxNomeBanco: TGroupBox;
    gbxModeloCheque: TGroupBox;
    procedure dbgAgenciasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgAgenciasDblClick(Sender: TObject);
    procedure edtInativoExit(Sender: TObject);
    procedure sbnProcurarModeloChequeClick(Sender: TObject);
    procedure sbnIncluirAgenciasClick(Sender: TObject);
    procedure sbnExcluirAgenciasClick(Sender: TObject);
    procedure sbnIncluirContasClick(Sender: TObject);
    procedure sbnExcluirContasClick(Sender: TObject);
    procedure dbgContasDblClick(Sender: TObject);
    procedure dbgContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgAgenciasCellClick(Column: TColumn);
    procedure dbgAgenciasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  protected
     dtmcadastrobancos: Tdtmcadastrobancos;
     function  AcionaCadastroAgencias(Editar: Boolean):boolean;
     function  AcionaCadastroContas(Editar: Boolean): boolean;
     procedure CriticarDataInativa(datainativa: TDBEditData);
     function  TabelaDePesquisa: TZDataSet; override;
     function  InternoIncluir: Boolean; override;
     function  InternoExcluir: Boolean; override;
     function  InternoGravar: Boolean; Override;
     function  InternoPesquisar(Titulo:String): Integer; override;
     function  JanelaPesquisa: TfrmConsultaBasica; override;
     function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;

  public
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
     Function    ValidaControles: Boolean;
     procedure   RefazDbgContas;
  end;

var
  frmCadastroBancos: TfrmCadastroBancos;
  TipoPesquisa: TtecCadastroBancos;

implementation

uses fmcadastroagencias, fmcadastrocontas;

{$R *.dfm}

function TfrmCadastroBancos.AcionaCadastroAgencias(Editar: Boolean): boolean;
begin
  frmCadastroAgencias:=TfrmCadastroAgencias.Create(frmCadastroAgencias);
  frmCadastroAgencias.SetDataModulo(dtmCadastroBancos);
  frmCadastroAgencias.DataSet:= dtmCadastroBancos.TabelaAgencias;
  Result := dtmCadastroBancos.IncluirAgencias(Editar);
//  frmCadastroAgencias.edtCodigo.SetFocus;
  frmCadastroAgencias.ShowModal;
  frmCadastroAgencias.free;

end;

function TfrmCadastroBancos.AcionaCadastroContas(Editar: Boolean): boolean;
begin
  frmCadastroContas := TfrmCadastroContas.Create(frmCadastroContas);
  frmCadastroContas.gbxContaContabil.Visible := parsistema.GERARCONTABILIDADE;
  frmCadastroContas.SetDataModulo(dtmCadastroBancos);
  frmCadastroContas.DataSet:= dtmCadastroBancos.TabelaContas;
  Result := dtmCadastroBancos.IncluirContas(Editar);
//  frmCadastroContas.edtConta.SetFocus;
  frmCadastroContas.ShowModal;
  frmCadastroContas.free;

end;

constructor TfrmCadastroBancos.Create(AOwner: TComponent);
begin
try
  dtmcadastrobancos := Tdtmcadastrobancos.Create(Self);
  inherited;
  dtmcadastrobancos.Abre(ctTabelas);
  DataSet:= dtmcadastrobancos.TabelaBancos;
  dbgContas.Columns[6].Visible := ParSistema.GerarContabilidade;
  edfCodigoProcura.SetFocus;

except
     on E: Exception do ShowMessage(E.Message);
end;
end;

procedure TfrmCadastroBancos.dbgAgenciasDblClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroAgencias(True)
end;

procedure TfrmCadastroBancos.dbgAgenciasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) then
    case key of
      TeclaEditarRegistro : AcionaCadastroAgencias(True);
      TeclaInserirRegistro: AcionaCadastroAgencias(False);
    end;
end;

destructor TfrmCadastroBancos.Destroy;
begin
  dtmCadastroBancos:=nil;
  inherited;
  frmCadastroBancos:= nil;
end;

function TfrmCadastroBancos.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    tcbBANCOS       : Result:= dtmcadastrobancos.ExisteBanco(NomeCampo, Value);
    tcbMODELOSCHEQUE: Result:= dtmcadastrobancos.ExisteModeloCheque(NomeCampo, Value);
    else              Result:= False;
  end;
end;

function TfrmCadastroBancos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastrobancos.ExcluirBancos;
  end;
end;

function TfrmCadastroBancos.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmcadastrobancos.GravarBancos;
end;

function TfrmCadastroBancos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastrobancos.IncluirBancos;
  end;
end;

function TfrmCadastroBancos.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrOK;
  if CtrlOn then begin
    if ActiveControl = flkModeloCheque then begin
      TipoPesquisa:= tcbMODELOSCHEQUE;
      Titulo:= 'Modelos Cheques';
    end
    else TipoPesquisa:= tcbNENHUM;
  end
  else begin
    TipoPesquisa:= tcbBANCOS;
    Titulo:= 'Bancos';
  end;
  if TipoPesquisa <> tcbNENHUM then begin
    dtmcadastrobancos.AbrirTabelas(TipoPesquisa);
    Result:= inherited InternoPesquisar(ctBANCO);
    if Result = mrOK then
       dtmcadastrobancos.Selecionar(TipoPesquisa);
    dtmcadastrobancos.FecharTabelas(TipoPesquisa);
  end;
end;

function TfrmCadastroBancos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroBancos.TabelaDePesquisa: TZDataSet;
begin
  case TipoPesquisa of
    tcbBANCOS       : Result:= dtmcadastrobancos.TabelaConsultarBanco;
    tcbMODELOSCHEQUE: Result:= dtmcadastrobancos.TabelaConsultarModeloCheque;
    else              Result:= nil;
  end;
end;

procedure TfrmCadastroBancos.edtInativoExit(Sender: TObject);
begin
  inherited;
  CriticarDataInativa(edtInativo);
end;

procedure TfrmCadastroBancos.sbnProcurarModeloChequeClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkModeloCheque.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmCadastroBancos.CriticarDataInativa(datainativa: TDBEditData);
begin
  if not dataembranco(datainativa.Text) and datainativa.Criticar(false) then
   if strtodate(datainativa.Text)>dtmcadastrobancos.DataServidor then
    if MensagemConfirmacao(ctDATASUPERIORAATUAL)=smbCancel then
      datainativa.SetFocus;
end;

procedure TfrmCadastroBancos.sbnIncluirAgenciasClick(Sender: TObject);
begin
  inherited;
  if not ValidaControles then
     Exit;
  AcionaCadastroAgencias(False)
end;


Function TfrmCadastroBancos.ValidaControles: Boolean;
begin
  Result:=False;
  Result := dtmCadastroBancos.qryBancos.CheckRequiredFields;
end;


procedure TfrmCadastroBancos.sbnExcluirAgenciasClick(Sender: TObject);
begin
  inherited;
  dtmCadastroBancos.ExcluirAgencia;
end;

procedure TfrmCadastroBancos.sbnIncluirContasClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroContas(False)
end;

procedure TfrmCadastroBancos.sbnExcluirContasClick(Sender: TObject);
begin
  inherited;
  dtmCadastroBancos.ExcluirContas;
end;

procedure TfrmCadastroBancos.dbgContasDblClick(Sender: TObject);
begin
  inherited;
  AcionaCadastroContas(True)
end;

procedure TfrmCadastroBancos.dbgContasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) then
    case key of
      TeclaEditarRegistro : AcionaCadastroContas(True);
      TeclaInserirRegistro: AcionaCadastroContas(False);
    end;
end;


procedure TfrmCadastroBancos.dbgAgenciasCellClick(Column: TColumn);
begin
  inherited;
  RefazDbgContas;
end;

procedure TfrmCadastroBancos.dbgAgenciasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  RefazDbgContas;
end;

procedure TfrmCadastroBancos.RefazDbgContas;
begin
  with dtmCadastroBancos do
    if (qryBancos.State in [dsedit, dsinsert]) then
       MensagemAviso('Falta gravar bancos')
    else
       ReFazConsulta(qryContas,[0,1],[qryAgenciasBanco.AsInteger, qryAgenciasCodigo.AsInteger]);
end;


end.
