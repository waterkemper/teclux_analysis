unit fmrelatoriosac;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ExtCtrls, Buttons, dmrelatoriosac, FR_DSet, FR_DBSet,
  FR_Class, cpdbfindcontrols, StdCtrls, Mask, cpdata, DBCtrls, cptexto,
  ZQuery, fmconsultabasica, fmconsultaporcampo, ctconstantes, {Qete,}
  cpdbtext, ComCtrls;

type
  TfrmRelatorioSac = class(TfrmAjudaBt)
    gbxRelatorioSAC: TGroupBox;
    lblQuestionario: TLabel;
    edfQuestionario: TtecDbEditFind;
    dtxQuestionario: TtecDBText;
    sbnQuestionario: TSpeedButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    frDBDataSet2: TfrDBDataSet;
    sbnRelatorio: TSpeedButton;
    Bevel1: TBevel;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    ckbOperador: TCheckBox;
    frDBDataSet3: TfrDBDataSet;
    procedure sbnRelatorioClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
  protected
    dtmRelatorioSAC: TdtmRelatorioSAC;
    TipoPesquisa: TtecTipoConsultaQuestionario;    
    function DadosCompletosRelatorio: Boolean;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure CriarDataModulo; override;
  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

var
  frmRelatorioSac: TfrmRelatorioSac;

implementation

uses
  biblio;
  
{$R *.dfm}

{ TtecTipoConsultaQuestionario}

constructor TfrmRelatorioSac.Create(Aowner: Tcomponent);
begin
  inherited;
  edtDataInicial.Text:=DateToStr(Date - 1);
  edtDataFinal.Text:=DateToStr(Date - 1);
//  dtmRelatorioSAC.frReport1.LoadFromFile('1.frf');
//  dtmRelatorioSAC.frReport2.LoadFromFile('2.frf');
end;

destructor TfrmRelatorioSac.Destroy;
begin
  dtmRelatorioSAC.Fecha(ctRelatorioQuestionario);
  dtmRelatorioSAC.Fecha(ctRelatorioQuestionarioQuestionario);
  inherited;
  frmRelatorioSac := nil;
end;

function TfrmRelatorioSac.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := False;
  if TipoPesquisa = tcqQUESTIONARIO then
    Result := dtmrelatoriosac.ExisteQuestionario(NomeCampo, Value);
end;

function TfrmRelatorioSac.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if edfQuestionario.Focused then begin
      dtmrelatoriosac.Abre(ctRelatorioConsultaQuestionario);
      Result := inherited InternoPesquisar('Questionario');
        if Result = mrOK then
          if TipoPesquisa = tcqQUESTIONARIO then begin
            dtmrelatoriosac.RefazConsultaQuestionarios(dtmrelatoriosac.CodigoQuestionario);
      end;
      dtmRelatorioSAC.Fecha(ctRelatorioConsultaQuestionario);
    end;
  end;
end;

function TfrmRelatorioSac.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmRelatorioSac.TabelaDePesquisa: TZDataSet;
begin
  if TipoPesquisa = tcqQUESTIONARIO then
    Result := dtmrelatoriosac.ConsultaQuestionario
  else
    Result := nil;
end;

function TfrmRelatorioSac.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  if TipoPesquisa = tcqQUESTIONARIO then
    Result:= dtmrelatoriosac.ConsultaQuestionario
  else
    Result:= nil;
end;

procedure TfrmRelatorioSac.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnRelatorio.Click;
  end;
  inherited;
end;

procedure TfrmRelatorioSac.sbnRelatorioClick(Sender: TObject);
var todos: Boolean;
begin
  inherited;
  if DadosCompletosRelatorio then begin
    todos := (edfQuestionario.Text = '');
    dmrelatoriosac.comOperador:= ckbOperador.Checked;
    dmrelatoriosac.Cont:=0;
    dtmRelatorioSAC.DataRelatorio(edtDataInicial.Text, edtDataFinal.Text);
    dtmRelatorioSAC.PreparaSQlDetail;
    dtmRelatorioSAC.PreparaSQL(edtDataInicial.Text, edtDataFinal.Text, todos, False);
    dtmRelatorioSAC.Fecha(ctRelatorioQuestionario);
  end;
end;

function TfrmRelatorioSac.DadosCompletosRelatorio: Boolean;
begin
  result := true;
  if (ActiveControl = edfQuestionario) and (edfQuestionario.Text <> '') then
    result := edfQuestionario.Exist;
  if result then begin
    result := not (DataEmBranco(edtDataInicial.Text) or DataEmBranco(edtDataInicial.Text));
    if result then begin
      result := edtDataInicial.DataValida;
      if result then begin
        result := edtDataFinal.DataValida;
        if result then begin
          result := not (StrToDate(edtDataInicial.Text) > StrToDate(edtDataFinal.Text));
          if not result then begin
            MensagemErro(ctDTINICIALMAIORDTFINAL);
            edtDataInicial.SetFocus;
          end;
        end else
          edtDataFinal.SetFocus;
      end else
        edtDataInicial.SetFocus;
    end else begin
      MensagemErro(ctERRORSEMPERIODO);
      edtDataInicial.SetFocus;
    end;
  end;  
end;

procedure TfrmRelatorioSac.sbnProcurarClick(Sender: TObject);
begin
//  PesquisaSensivelAoControle(edfQuestionario);
end;

procedure TfrmRelatorioSac.CriarDataModulo;
begin
  inherited;
  dtmRelatorioSAC := TdtmRelatorioSAC.Create(Self);
  dtmrelatoriosac.Abre(ctRelatorioQuestionarioQuestionario);
end;

end.
