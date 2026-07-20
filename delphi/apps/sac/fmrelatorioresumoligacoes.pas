unit fmrelatorioresumoligacoes;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, {Qete,} DateUtils,
  //Terceiros
  FR_DSet, FR_DBSet, ZQuery,
  //Biblio
  ctconstantes, biblio,
  //Projeto
  dmrelatorioresumoligacoes,
  //Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  //Componentes
  cpdata, cpdbtext, cpdbfindcontrols;

type
  TfrmRelatorioResumoLigacoes = class(TfrmAjudaBt)
    frDBResumoLigacoes: TfrDBDataSet;
    gbxFiltrosac: TGroupBox;
    edfFiltroSac: TtecDbEditFind;
    dtxFiltroSac: TtecDBText;
    lblFiltro: TLabel;
    gbxPeriodo: TGroupBox;
    lblVencimentoTermino: TLabel;
    dedTerminoPeriodo: TEditData;
    dedInicioPeriodo: TEditData;
    lblVencimentoInicio: TLabel;
    sbnRelatorio: TSpeedButton;
    procedure sbnRelatorioClick(Sender: TObject);
    procedure edfFiltroSacFound(Found: Boolean);
  protected
    dtmRelatorioResumoLigacoes: TdtmRelatorioResumoLigacoes;
    function InternoPesquisar(Titulo:String) : integer;    override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    function PreparaPeriodo:boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure PreparaFiltroSac;
    procedure CriarDataModulo; override;
  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

var
  frmRelatorioResumoLigacoes: TfrmRelatorioResumoLigacoes;
  tipoPesquisa              : TtecPesquisa;

implementation

{$R *.dfm}

{ TfrmRelatorioResumoLigacoes }

constructor TfrmRelatorioResumoLigacoes.Create(Aowner: Tcomponent);
begin
  inherited;
  dedInicioPeriodo.Text  := DateToStr(Date-1);
  dedTerminoPeriodo.Text := DateToStr(Date-1);
  edfFiltroSac.SetFocus;  
end;

destructor TfrmRelatorioResumoLigacoes.Destroy;
begin
  dtmRelatorioResumoLigacoes.Fecha(ctRelatorioResumoLigacoes);
  inherited;
  frmRelatorioResumoLigacoes := nil;
end;

function TfrmRelatorioResumoLigacoes.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmRelatorioResumoLigacoes.ExisteFiltroSac(NomeCampo, Value)
end;

function TfrmRelatorioResumoLigacoes.InternoPesquisar(Titulo: String): integer;
begin
  dtmRelatorioResumoLigacoes.Abre(ctRelatorioResumoLigacoesConsulta);
  Result := inherited InternoPesquisar('Questionário');
  if Result = mrOK then
    dtmRelatorioResumoLigacoes.RefazConsultaFiltro;
  dtmRelatorioResumoLigacoes.Fecha(ctRelatorioResumoLigacoesConsulta);
end;

function TfrmRelatorioResumoLigacoes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmRelatorioResumoLigacoes.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnRelatorio.Click;
  end;
  inherited;
end;

procedure TfrmRelatorioResumoLigacoes.PreparaFiltroSac;
begin
  dtmRelatorioResumoLigacoes.FiltroSac((edfFiltroSac.Text <> ''), edfFiltroSac.Text);
end;

function TfrmRelatorioResumoLigacoes.PreparaPeriodo: boolean;
var comPeriodo: Boolean;
begin
  comPeriodo := true;
  result := true;
  if (ActiveControl = edfFiltroSac) and (Trim(edfFiltroSac.Text) <> '') then
    result := edfFiltroSac.Exist;
  if result then begin
    if (Trim(edfFiltroSac.Text) = '') then
      result := not (DataEmBranco(dedInicioPeriodo.Text) or DataEmBranco(dedTerminoPeriodo.Text))
    else begin
      comPeriodo := not (DataEmBranco(dedInicioPeriodo.Text) and DataEmBranco(dedTerminoPeriodo.Text));
      result := comPeriodo or (DataEmBranco(dedInicioPeriodo.Text) and DataEmBranco(dedTerminoPeriodo.Text));
    end;
    if result then begin
      result := dedInicioPeriodo.DataValida;
      if result then begin
        result := dedTerminoPeriodo.DataValida;
        if result then begin
          if comPeriodo then
            result := not (StrToDate(dedInicioPeriodo.Text) > StrToDate(dedTerminoPeriodo.Text));
          if result then begin
            PreparaFiltroSac;
            dtmRelatorioResumoLigacoes.Periodo(comPeriodo, dedInicioPeriodo.Text, dedTerminoPeriodo.Text);
            dtmRelatorioResumoLigacoes.frResumoLigacoes.Dictionary.Variables.Variable['Data1']:=QuotedStr('Período de '+dedInicioPeriodo.Text+' até '+dedTerminoPeriodo.Text);
          end else begin
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
end;

procedure TfrmRelatorioResumoLigacoes.sbnRelatorioClick(Sender: TObject);
begin
  inherited;
   dtmRelatorioResumoLigacoes.Fecha(ctRelatorioResumoLigacoesRelatorio);
   if PreparaPeriodo then begin
     dtmRelatorioResumoLigacoes.Abre(ctRelatorioResumoLigacoesRelatorio);
     dtmRelatorioResumoLigacoes.frResumoLigacoes.ShowReport;
   end;
end;

function TfrmRelatorioResumoLigacoes.TabelaDePesquisa: TZDataSet;
begin
   Result:= dtmRelatorioResumoLigacoes.ConsultaFiltroSac;
end;

function TfrmRelatorioResumoLigacoes.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
   Result:= dtmRelatorioResumoLigacoes.ConsultaFiltroSac;
end;

procedure TfrmRelatorioResumoLigacoes.edfFiltroSacFound(Found: Boolean);
begin
{  inherited;
  if found then begin
    dedInicioPeriodo.Text  := DateToStr(IncYear(Date, -1));
    dedTerminoPeriodo.Text := DateToStr(Date-1);
  end;}
end;

procedure TfrmRelatorioResumoLigacoes.CriarDataModulo;
begin
  inherited;
  dtmRelatorioResumoLigacoes := TdtmRelatorioResumoLigacoes.Create(Self);
  dtmRelatorioResumoLigacoes.Abre(ctRelatorioResumoLigacoes);
end;

end.
