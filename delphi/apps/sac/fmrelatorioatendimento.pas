unit fmrelatorioatendimento;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ExtCtrls, Buttons, FR_DSet, FR_DBSet,dmrelatorioatendimento,
  StdCtrls, Mask, cpdata, ctconstantes, dateutils, {Qete,} biblio, DBCtrls,
  cpdbtext, cpdbfindcontrols, fmconsultabasica, fmconsultaporcampo, ZQuery,
  Grids, DBGrids, cpdbgrid;

type
  TfrmRelatorioAtendimento = class(TfrmAjudaBt)
    frDBAtendimentos: TfrDBDataSet;
    gbxPeriodo: TGroupBox;
    lblVencimentoTermino: TLabel;
    dedTerminoPeriodo: TEditData;
    dedInicioPeriodo: TEditData;
    lblVencimentoInicio: TLabel;
    sbnRelatorio: TSpeedButton;
    rgpTipo: TRadioGroup;
    gbxOpcao: TGroupBox;
    edfTipo: TtecDbEditFind;
    dtxTipo: TtecDBText;
    lblTipo: TLabel;
    sbnProcurarTipo: TSpeedButton;
    frDBAtendimentoTipo: TfrDBDataSet;
    procedure sbnRelatorioClick(Sender: TObject);
    procedure rgpTipoClick(Sender: TObject);
    procedure sbnProcurarTipoClick(Sender: TObject);
  protected
    dtmRelatorioAtendimento: TdtmRelatorioAtendimento;
    tipoPesquisa:TtecTipoConsultaAtendimento;
    function PreparaPeriodo: Boolean;
    function VerificaPeriodo: Boolean;
    function InternoPesquisar(Titulo:String) : integer;    override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure PreparaTipo;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure CriarDataModulo; override;
  public
    constructor Create(Aowner:Tcomponent);override;
    destructor Destroy; override;
  end;

var
  frmRelatorioAtendimento: TfrmRelatorioAtendimento;

implementation

{$R *.dfm}

{ TfrmRelatorioAtendimento }

constructor TfrmRelatorioAtendimento.Create(Aowner: Tcomponent);
begin
  inherited;
  dedInicioPeriodo.Text := DateToStr(Date - 1);
  dedTerminoPeriodo.Text := DateToStr(Date - 1);
  rgpTipoClick(Self);
end;

destructor TfrmRelatorioAtendimento.Destroy;
begin
  dtmRelatorioAtendimento.Fecha(ctRelatorioAtendimentos);
  dtmRelatorioAtendimento.Fecha(ctRelatorioAtendimentosTipo);  
  inherited;
  frmRelatorioAtendimento := nil;
end;

function TfrmRelatorioAtendimento.InternoPesquisar(Titulo: String): integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if edfTipo.Focused then begin
      dtmRelatorioAtendimento.Abre(ctRelatorioAtendimentosConsultaTipo);
      Result := inherited InternoPesquisar('Tipo');
      if Result = mrOK then
         dtmRelatorioAtendimento.RefazConsultaTipo(dtmRelatorioAtendimento.CodigoTipo);
      dtmRelatorioAtendimento.Fecha(ctRelatorioAtendimentosConsultaTipo);
    end;
  end;
end;

procedure TfrmRelatorioAtendimento.KeyDown(var Key: Word;Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnRelatorio.Click;
  end;
  inherited;
end;

function TfrmRelatorioAtendimento.PreparaPeriodo: boolean;
begin
  result := true;
  if ActiveControl = edfTipo then
    result := edfTipo.Exist;
  if result then begin
    Result := VerificaPeriodo;
    if result then begin
       dtmRelatorioAtendimento.frAtendimentos.Dictionary.Variables.Variable['Data1']:=QuotedStr(dedInicioPeriodo.Text);
       dtmRelatorioAtendimento.frAtendimentos.Dictionary.Variables.Variable['Data2']:=QuotedStr(dedTerminoPeriodo.Text);
       dtmRelatorioAtendimento.frAtendimentoTipo.Dictionary.Variables.Variable['Data1']:=QuotedStr(dedInicioPeriodo.Text);
       dtmRelatorioAtendimento.frAtendimentoTipo.Dictionary.Variables.Variable['Data2']:=QuotedStr(dedTerminoPeriodo.Text);
       dtmRelatorioAtendimento.Periodo(dedInicioPeriodo.Text,dedTerminoPeriodo.Text);
    end;
  end else
    edfTipo.SetFocus;
end;

procedure TfrmRelatorioAtendimento.PreparaTipo;
var tipo:string;
begin
   dtmRelatorioAtendimento.PreparaTipo(tipo);
end;

procedure TfrmRelatorioAtendimento.sbnRelatorioClick(Sender: TObject);
var semTipo: Boolean;
begin
  inherited;
  if PreparaPeriodo then begin
    semTipo := dtmRelatorioAtendimento.ConfereTipo;
    dtmRelatorioAtendimento.Abre(ctRelatorioAtendimentos);
    if semTipo then
      dtmRelatorioAtendimento.frAtendimentos.ShowReport
    else begin
      dtmRelatorioAtendimento.frAtendimentoTipo.ShowReport;
//      dtmRelatorioAtendimento.RefazConsultaTipoAtendimento; //verificar a necessidade deste procedimento
    end;
    dtmRelatorioAtendimento.Fecha(ctRelatorioAtendimentos);
  end;
end;

function TfrmRelatorioAtendimento.VerificaPeriodo: boolean;
begin
  result := not (DataEmBranco(dedInicioPeriodo.Text) or DataEmBranco(dedTerminoPeriodo.Text));
  if result then begin
    result := dedInicioPeriodo.DataValida;
    if result then begin
      result := dedTerminoPeriodo.DataValida;
      if result then begin
        result := not (StrToDate(dedInicioPeriodo.Text) > StrToDate(dedTerminoPeriodo.Text));
        if not result then begin
          MensagemErro(ctDTINICIALMAIORDTFINAL);
          dedInicioPeriodo.SetFocus;
        end;
      end else
        dedTerminoPeriodo.SetFocus;
    end else
      dedInicioPeriodo.SetFocus;
  end else begin
    MensagemErro(ctERRORSEMPERIODO);
    dedInicioPeriodo.SetFocus;
  end;
end;

procedure TfrmRelatorioAtendimento.rgpTipoClick(Sender: TObject);
begin
  inherited;
  case rgpTipo.ItemIndex of
    0: dtmRelatorioAtendimento.PreparaTipo('R');
    1: dtmRelatorioAtendimento.PreparaTipo('V');
    2: dtmRelatorioAtendimento.PreparaTipo('C');
  end;
end;

function TfrmRelatorioAtendimento.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmRelatorioAtendimento.ExisteTipo(NomeCampo, Value)
end;

function TfrmRelatorioAtendimento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:=false;
end;

function TfrmRelatorioAtendimento.TabelaDePesquisa: TZDataSet;
begin
   Result:= dtmRelatorioAtendimento.ConsultaTipo
end;

function TfrmRelatorioAtendimento.TabelaDoParametro(
  Parametro: Integer): TZDataSet;
begin
   Result:= dtmRelatorioAtendimento.ConsultaTipo
end;

procedure TfrmRelatorioAtendimento.sbnProcurarTipoClick(Sender: TObject);
begin
//  PesquisaSensivelAoControle(edfTipo);
end;

procedure TfrmRelatorioAtendimento.CriarDataModulo;
begin
  inherited;
  dtmRelatorioAtendimento := TdtmRelatorioAtendimento.Create(Self);
  dtmRelatorioAtendimento.Abre(ctRelatorioAtendimentosTipo);
  dtmRelatorioAtendimento.PreparaTipo('R');
end;

end.
