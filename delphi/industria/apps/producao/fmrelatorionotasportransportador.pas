unit fmrelatorionotasportransportador;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, CheckLst, cpdata,
  biblio, ctconstantes, DB, Windows, Grids, DBGrids, cpdbgrid, ToolWin,
  ComCtrls;

type
  Tfrmrelatorionotasportransportador = class(TfrmRelatorioPadrao)
    pnldatas: TPanel;
    gbxPeriodo: TGroupBox;
    edtdatainicial: TEditData;
    edtdatafinal: TEditData;
    lblA: TLabel;
    gbxTransportadoras: TGroupBox;
    sbnMarcarTransportadoras: TSpeedButton;
    sbnDesmarcarTransportadoras: TSpeedButton;
    dbgTransportadoras: TtecDBGrid;
    procedure sbnDesmarcarTransportadorasClick(Sender: TObject);
    procedure sbnMarcarTransportadorasClick(Sender: TObject);
    procedure dbgTransportadorasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgTransportadorasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTransportadorasDblClick(Sender: TObject);
    procedure edtdatainicialExit(Sender: TObject);
    procedure edtdatafinalExit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure internoImpressao; Override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MontarPesquisa;
  end;

var
  frmrelatorionotasportransportador: Tfrmrelatorionotasportransportador;

implementation

uses dmrelatorionotasportransportador;

const
  FiltroTransportadoras = 'df.fornecedortransporte in (%s) and';

{$R *.dfm}

{ Tfrmnotasportransportador }

constructor Tfrmrelatorionotasportransportador.Create(AOwner: TComponent);
begin
  dtmrelatorionotasportransportador:= Tdtmrelatorionotasportransportador.Create(Self);
  inherited;
  edtDataInicial.Text := DateToStr(DataLocal);
  edtDataFinal.Text   := DateToStr(DataLocal);
end;

destructor Tfrmrelatorionotasportransportador.Destroy;
begin
  dtmrelatorionotasportransportador:= nil;
  inherited;
  frmrelatorionotasportransportador:= nil;
end;

procedure Tfrmrelatorionotasportransportador.internoImpressao;
begin
  inherited;
  with dtmrelatorionotasportransportador do
  begin
     try
       MontarRegistrosImpressao;

       if NumeroSelecionadas = 0 then
       begin
         sbnMarcarTransportadorasClick(Self);
         MontarRegistrosImpressao;
       end;

       MontarPesquisa;

       qrynotastransportador.Close;
       qrynotastransportador.MacroByName('WhereTransportadoras').AsString:=
         Format(FiltroTransportadoras,[ListaTransportadorasImpressao]);
       qrynotastransportador.ParamByName('datainicial').AsDateTime:= DataInicial;
       qrynotastransportador.ParamByName('datafinal').AsDateTime  := DataFinal;
       qrynotastransportador.Open;
       if not qrynotastransportador.IsEmpty then
         ImprimirRelatorio
       else
         MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
     finally
       sbnDesmarcarTransportadorasClick(Self);
     end;
  end;
end;

procedure Tfrmrelatorionotasportransportador.MontarPesquisa;
begin
  with dtmrelatorionotasportransportador do
  begin
    DataInicial:= strtoDate(edtdatainicial.Text);
    DataFinal  := strtoDate(edtdatafinal.Text);
  end;
end;

procedure Tfrmrelatorionotasportransportador.sbnDesmarcarTransportadorasClick(
  Sender: TObject);
begin
  inherited;
  dtmrelatorionotasportransportador.SelecionarTransportadoras(False,True);
end;

procedure Tfrmrelatorionotasportransportador.sbnMarcarTransportadorasClick(
  Sender: TObject);
begin
  inherited;
  dtmrelatorionotasportransportador.SelecionarTransportadoras(True,True);
end;

procedure Tfrmrelatorionotasportransportador.dbgTransportadorasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if not (gdFocused in State) then
  begin
    if dbgTransportadoras.DataSource.DataSet.FieldByName('selecionado').AsBoolean then  begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color  := clBlack;
    end;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrmrelatorionotasportransportador.dbgTransportadorasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if (Key =VK_Space) and
     (Shift = [ssCtrl]) then
    dtmrelatorionotasportransportador.SelecionarTransportadoras(false, false);
end;

procedure Tfrmrelatorionotasportransportador.dbgTransportadorasDblClick(
  Sender: TObject);
begin
  inherited;
  dtmrelatorionotasportransportador.SelecionarTransportadoras(false, false);
end;

procedure Tfrmrelatorionotasportransportador.edtdatainicialExit(
  Sender: TObject);
begin
  inherited;
  if edtdatainicial.Text<>'' then
    dtmrelatorionotasportransportador.DataInicial := strtodate(edtdatainicial.Text);
end;

procedure Tfrmrelatorionotasportransportador.edtdatafinalExit(
  Sender: TObject);
begin
  inherited;
  if edtdatafinal.Text<>'' then
    dtmrelatorionotasportransportador.DataFinal := strtodate(edtdatafinal.Text);
end;

end.
