unit fmmemoriacredito;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajudabt, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  cpdbgrid, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, dmmemoriacredito,
  ctconstantes, fmconsultabasica, fmconsultaporcampo, DB, ZQuery,
  ZPgSqlQuery, cpquery, cpnumero, {Qete,} biblio, ToolWin;
    
type            
  TfrmMemoriaCredito = class(TfrmAjudaBt)
    Panel1: TPanel;
    gbxCliente: TGroupBox;
    sbnProcuraCliente: TSpeedButton;
    edfCodigoCliente: TtecDbEditFind;
    dtxNomeCliente: TtecDBText;
    gbxParametros: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    tecDBText1: TtecDBText;
    tecDBText2: TtecDBText;
    tecDBText3: TtecDBText;
    tecDBText4: TtecDBText;
    tecDBText5: TtecDBText;
    tecDBText6: TtecDBText;
    tecDBText7: TtecDBText;
    tecDBText8: TtecDBText;
    tecDBText9: TtecDBText;
    tecDBText10: TtecDBText;
    tecDBText11: TtecDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox3: TGroupBox;
    tecDBText12: TtecDBText;
    Label16: TLabel;
    GroupBox4: TGroupBox;
    tecDBText14: TtecDBText;
    tecDBText16: TtecDBText;
    tecDBText18: TtecDBText;
    tecDBText20: TtecDBText;
    tecDBText22: TtecDBText;
    tecDBText24: TtecDBText;
    tecDBText26: TtecDBText;
    tecDBText28: TtecDBText;
    tecDBText30: TtecDBText;
    tecDBText32: TtecDBText;
    tecDBText34: TtecDBText;
    gbxRendas: TGroupBox;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    tecDBText36: TtecDBText;
    tecDBText37: TtecDBText;
    tecDBText38: TtecDBText;
    tecDBText39: TtecDBText;
    tecDBText40: TtecDBText;
    Label28: TLabel;
    tecDBText41: TtecDBText;
    tecDBText42: TtecDBText;
    tecDBText43: TtecDBText;
    Panel2: TPanel;
    Panel4: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    tecDBText13: TtecDBText;
    tecDBText15: TtecDBText;
    tecDBText17: TtecDBText;
    tecDBText19: TtecDBText;
    tecDBText21: TtecDBText;
    tecDBText23: TtecDBText;
    tecDBText25: TtecDBText;
    tecDBText27: TtecDBText;
    tecDBText29: TtecDBText;
    tecDBText31: TtecDBText;
    tecDBText33: TtecDBText;
    tecDBText35: TtecDBText;
    gbxComposicao: TGroupBox;
    gbxAVencer: TGroupBox;
    tecDBText59: TtecDBText;
    tecDBText60: TtecDBText;
    tecDBText63: TtecDBText;
    gbxPontualidade: TGroupBox;
    gbxMaiorAtraso: TGroupBox;
    gbxDataMaiorAtraso: TGroupBox;
    gbxValorMaiorAtraso: TGroupBox;
    tecDBText49: TtecDBText;
    tecDBText50: TtecDBText;
    GroupBox5: TGroupBox;
    gbxDataUltimoAtraso: TGroupBox;
    tecDBText54: TtecDBText;
    gbxValorUltimoAtraso: TGroupBox;
    tecDBText53: TtecDBText;
    GroupBox9: TGroupBox;
    tecDBText55: TtecDBText;
    tecDBText56: TtecDBText;
    tecDBText57: TtecDBText;
    tecDBText62: TtecDBText;
    lblAtraso30: TLabel;
    lblAtraso60: TLabel;
    lblAtrasoMais60: TLabel;
    lblAtrasoTotal: TLabel;
    lblDebitoTotal: TLabel;
    gbxDebitoTotal: TGroupBox;
    tecDBText64: TtecDBText;
    tecDBText48: TtecDBText;
    lblDiasMaior: TLabel;
    tecDBText52: TtecDBText;
    Label36: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    tecDBText58: TtecDBText;
    tecDBText45: TtecDBText;
    tecDBText44: TtecDBText;
    tecDBText46: TtecDBText;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    Label32: TLabel;
    tecDBText47: TtecDBText;
    gbxAtrasoHoje: TGroupBox;
    Label37: TLabel;
    tecDBText51: TtecDBText;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure edfCodigoClienteFound(Found: Boolean);
  private
    { Private declarations }
  protected
    TipoConsulta: TtecPesquisa;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy;override;
  end;

var
  frmMemoriaCredito: TfrmMemoriaCredito;

implementation

{$R *.dfm}

constructor TfrmMemoriaCredito.Create(AOwner: TComponent);
begin
  dtmMemoriaCredito := TdtmMemoriaCredito.Create(Self);
  inherited Create(AOwner);
  dtmMemoriaCredito.Abre(ctTabelas);
end;

destructor TfrmMemoriaCredito.Destroy;
begin
  dtmMemoriaCredito:=nil;
  inherited;
  frmMemoriaCredito := nil;
end;

function TfrmMemoriaCredito.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmMemoriaCredito.ExisteClientes(Parametro, NomeCampo, Value)
end;

function TfrmMemoriaCredito.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  with dtmMemoriaCredito do begin
    if CtrlOn then begin
      if ActiveControl = edfCodigoCliente then begin
        Titulo      := ctCLIENTES;
        TipoConsulta:= pesCLIENTES;
      end;
    end;

    if TipoConsulta <> pesNENHUMA then begin
      if TipoConsulta = pesCLIENTES then
        AbreTabelasMemoriaCredito(TipoConsulta);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        SelecionaTabelasMemoriaCredito(TipoConsulta);
      FechaTabelasConsulta(TipoConsulta);
    end;
  end;
end;

function TfrmMemoriaCredito.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmMemoriaCredito.sbnProcuraClienteClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfCodigoCliente.SetFocus;
  InternoPesquisar('');
end;

function TfrmMemoriaCredito.TabelaDePesquisa: TZDataSet;
begin
  case TipoConsulta of
    pesCLIENTES : Result := dtmMemoriaCredito.TabelaConsultaClientes;
    else          Result := nil;
  end;
end;

procedure TfrmMemoriaCredito.edfCodigoClienteFound(Found: Boolean);
begin
  inherited;
  if Found then
    dtmMemoriaCredito.CalculaCredito
  else
    dtmMemoriaCredito.LimparCampos;
end;

procedure TfrmMemoriaCredito.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [] then
    if Key = VK_ESCAPE then
      dtmMemoriaCredito.LimparCampos;
end;

end.
