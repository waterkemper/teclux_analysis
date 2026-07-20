unit fmrelatorioestatisticoanalitico;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ExtCtrls, Buttons, FR_DSet, FR_DBSet, FR_Class, cpdbfindcontrols, StdCtrls, Mask, cpdata, DBCtrls, cptexto,
  ZQuery, fmconsultabasica, fmconsultaporcampo, ctconstantes, {Qete,} biblio,
  cpdbtext, dmrelatorioestatisticoanalitico, cpdbmemo, ComCtrls;

type
  TfrmRelatorioEstatisticoAnalitico = class(TfrmAjudaBt)
    sbnRelatorio: TSpeedButton;
    gbxDados: TGroupBox;
    lblQuestionario: TLabel;
    lblPergunta: TLabel;
    lblOpcao: TLabel;
    sbnQuestionario: TSpeedButton;
    sbnPergunta: TSpeedButton;
    sbnOpcao: TSpeedButton;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    dedInicioPeriodo: TEditData;
    lblDataFinal: TLabel;
    dedTerminoPeriodo: TEditData;
    edfQuestionario: TtecDbEditFind;
    edfPergunta: TtecDbEditFind;
    edfOpcao: TtecDbEditFind;
    frDBEstatisticoAnalitico: TfrDBDataSet;
    dtxOpcao: TtecDBText;
    dtxDescricaoQuestionario: TtecDBText;
    dtxEnunciadoPergunta: TtecDBText;
    procedure edfQuestionarioFound(Found: Boolean);
    procedure edfPerguntaFound(Found: Boolean);
    procedure sbnRelatorioClick(Sender: TObject);
    procedure sbnQuestionarioClick(Sender: TObject);
    procedure sbnPerguntaClick(Sender: TObject);
    procedure sbnOpcaoClick(Sender: TObject);
  protected
    { Private declarations }
    dtmRelatorioEstatisticoAnalitico: TdtmRelatorioEstatisticoAnalitico;
    TipoPesquisa: TtecTipoConsultaOpcaoResposta;
    function VerificaPeriodo: Boolean;
    function DadosValidos: Boolean;
    function PermitirProcura: boolean;
    function GetTitulo: String;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure CriarDataModulo; override;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

var
  frmRelatorioEstatisticoAnalitico: TfrmRelatorioEstatisticoAnalitico;

implementation

{$R *.dfm}

{ TfrmRelatorioEstatisticoAnalitico }

constructor TfrmRelatorioEstatisticoAnalitico.Create(Aowner: Tcomponent);
begin
  inherited;
  dedInicioPeriodo.Text := DateToStr(Date - 1);
  dedTerminoPeriodo.Text := DateToStr(Date - 1);
end;

procedure TfrmRelatorioEstatisticoAnalitico.CriarDataModulo;
begin
  inherited;
  dtmRelatorioEstatisticoAnalitico := TdtmRelatorioEstatisticoAnalitico.Create(Self);
  dtmRelatorioEstatisticoAnalitico.Abre(ctRelatorioEstatisticoAnalitico);
end;

destructor TfrmRelatorioEstatisticoAnalitico.Destroy;
begin
  dtmRelatorioEstatisticoAnalitico.Fecha(ctRelatorioEstatisticoAnalitico);
  inherited;
  frmRelatorioEstatisticoAnalitico := nil;  
end;

function TfrmRelatorioEstatisticoAnalitico.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    tcoQUESTIONARIO: Result := dtmRelatorioEstatisticoAnalitico.ExisteQuestionario(NomeCampo, Value);
    tcoPERGUNTA    : Result := dtmRelatorioEstatisticoAnalitico.ExistePergunta(NomeCampo, Value);
    tcoOPCAO       : Result := dtmRelatorioEstatisticoAnalitico.ExisteOpcao(NomeCampo, Value);
  else
    result := false;
  end;
end;

function TfrmRelatorioEstatisticoAnalitico.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result:= mrNone;
  if PermitirProcura then begin
    dtmRelatorioEstatisticoAnalitico.Abre(ctRelatorioEstatisticoAnaliticoConsulta);
    Result := inherited InternoPesquisar(GetTitulo);
    if Result = mrOK then
      dtmRelatorioEstatisticoAnalitico.Selecionar(TipoPesquisa);
    dtmRelatorioEstatisticoAnalitico.Fecha(ctRelatorioEstatisticoAnaliticoConsulta);
  end;
end;

function TfrmRelatorioEstatisticoAnalitico.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:=false;
end;

procedure TfrmRelatorioEstatisticoAnalitico.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnRelatorio.Click;
  end;
  inherited;
end;

function TfrmRelatorioEstatisticoAnalitico.TabelaDePesquisa: TZDataSet;
begin
  if TipoPesquisa = tcoQUESTIONARIO then
    Result:= dtmRelatorioEstatisticoAnalitico.ConsultaQuestionario
  else if TipoPesquisa = tcoPERGUNTA then
    Result:= dtmRelatorioEstatisticoAnalitico.ConsultaPergunta
  else if TipoPesquisa = tcoOPCAO then
    Result:= dtmRelatorioEstatisticoAnalitico.ConsultaOpcao
  else
    Result:= nil;
end;

function TfrmRelatorioEstatisticoAnalitico.TabelaDoParametro(
  Parametro: Integer): TZDataSet;
begin
  if TipoPesquisa = tcoQUESTIONARIO then
    Result:= dtmRelatorioEstatisticoAnalitico.ConsultaQuestionario
  else if TipoPesquisa = tcoPERGUNTA then
    Result:= dtmRelatorioEstatisticoAnalitico.ConsultaPergunta
  else if TipoPesquisa = tcoOPCAO then
    Result:= dtmRelatorioEstatisticoAnalitico.ConsultaOpcao
  else
    Result:= nil;
end;

procedure TfrmRelatorioEstatisticoAnalitico.edfQuestionarioFound(
  Found: Boolean);
begin
  inherited;
  dtmRelatorioEstatisticoAnalitico.SetQuestionarioEmPerguntas;
end;

procedure TfrmRelatorioEstatisticoAnalitico.edfPerguntaFound(
  Found: Boolean);
begin
  inherited;
  dtmRelatorioEstatisticoAnalitico.SetPerguntaEmOpcao;
end;

procedure TfrmRelatorioEstatisticoAnalitico.sbnRelatorioClick(
  Sender: TObject);
begin
  inherited;
  if DadosValidos and VerificaPeriodo then begin
    dtmRelatorioEstatisticoAnalitico.frEstatisticoAnalitico.Dictionary.Variables.Variable['Data1']:=QuotedStr(dedInicioPeriodo.Text);
    dtmRelatorioEstatisticoAnalitico.frEstatisticoAnalitico.Dictionary.Variables.Variable['Data2']:=QuotedStr(dedTerminoPeriodo.Text);
    dtmRelatorioEstatisticoAnalitico.SetParametros(dedInicioPeriodo.Text,dedTerminoPeriodo.Text);
    dtmRelatorioEstatisticoAnalitico.Abre(ctRelatorioEstatisticoAnaliticoRelatorio);
    dtmRelatorioEstatisticoAnalitico.frEstatisticoAnalitico.ShowReport;
    dtmRelatorioEstatisticoAnalitico.Fecha(ctRelatorioEstatisticoAnaliticoRelatorio);
  end
end;

function TfrmRelatorioEstatisticoAnalitico.VerificaPeriodo: boolean;
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

procedure TfrmRelatorioEstatisticoAnalitico.sbnQuestionarioClick(
  Sender: TObject);
begin
//  PesquisaSensivelAoControle(edfQuestionario);
end;

procedure TfrmRelatorioEstatisticoAnalitico.sbnPerguntaClick(
  Sender: TObject);
begin
//  PesquisaSensivelAoControle(edfPergunta);
end;

procedure TfrmRelatorioEstatisticoAnalitico.sbnOpcaoClick(Sender: TObject);
begin
//  PesquisaSensivelAoControle(edfOpcao);
end;

function TfrmRelatorioEstatisticoAnalitico.DadosValidos: Boolean;
begin
  if not ((edfQuestionario.Text = '') or (edfPergunta.Text = '') or (edfOpcao.Text = '')) then begin
    if ActiveControl = edfQuestionario then begin
      result := edfQuestionario.Exist
    end else if ActiveControl = edfPergunta then begin
      result := edfPergunta.Exist
    end else if ActiveControl = edfOpcao then begin
      result := edfOpcao.Exist
    end else
      result := true;
  end else begin
    result := false;
    MensagemAviso(ctERRORQUESTIONARIOPERGUNTAOPCAOEMBRANCO);
  end;
end;

function TfrmRelatorioEstatisticoAnalitico.PermitirProcura: boolean;
begin
  Result := False;
  if CtrlOn then begin
    if ActiveControl.ClassType = TtecDBEditFind then begin
      if edfQuestionario.Focused then
        TipoPesquisa := tcoQUESTIONARIO
      else if edfPergunta.Focused then
        TipoPesquisa := tcoPERGUNTA
      else if edfOpcao.Focused then
        TipoPesquisa := tcoOPCAO;
      Result := True;
    end;
  end;
end;

function TfrmRelatorioEstatisticoAnalitico.GetTitulo: String;
begin
  case TipoPesquisa of
    tcoQUESTIONARIO: result := 'Questionário';
    tcoPERGUNTA    : result := 'Pergunta';
    tcoOPCAO       : result := 'Opção';
  else
    result := '';  
  end;
end;

end.
