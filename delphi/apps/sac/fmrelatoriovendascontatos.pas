unit fmrelatoriovendascontatos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ExtCtrls, Buttons, StdCtrls, cpnumero, Mask, cpdata,
  FR_DSet, FR_DBSet, ctconstantes, dateutils, {Qete,} biblio, dmrelatoriovendascontatos,
  cpeditioncontrolvalidation;

type
  TfrmRelatorioVendasContatos = class(TfrmAjudaBt)
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dedInicioPeriodo: TEditData;
    dedTerminoPeriodo: TEditData;
    frDBRelatorioVendas: TfrDBDataSet;
    frDBRelatorioVendasTotal: TfrDBDataSet;
    sbnRelatorio: TSpeedButton;
    GroupBox1: TGroupBox;
    lblCarencia: TLabel;
    edtCarencia: TEditNumero;
    frDBRelatorioPagamentoContato: TfrDBDataSet;
    rgpRelatorio: TRadioGroup;
    procedure sbnRelatorioClick(Sender: TObject);
  protected
    { Private declarations }
    dtmRelatorioVendasContatos: TdtmRelatorioVendasContatos;
    procedure CriarDataModulo; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  VerificaPeriodo: boolean;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

var
  frmRelatorioVendasContatos: TfrmRelatorioVendasContatos;

implementation

{$R *.dfm}

{ TfrmRelatorioVendasContatos }

constructor TfrmRelatorioVendasContatos.Create(Aowner: Tcomponent);
begin
  inherited;
  dedInicioPeriodo.Text:=DateToStr(Date - 1);
  dedTerminoPeriodo.Text:=DateToStr(Date - 1);
end;

procedure TfrmRelatorioVendasContatos.CriarDataModulo;
begin
  inherited;
  dtmRelatorioVendasContatos := TdtmRelatorioVendasContatos.Create(Self);
end;

destructor TfrmRelatorioVendasContatos.Destroy;
begin
  dtmRelatorioVendasContatos.Fecha(ctRelatorioVendasContatos);
  frmRelatorioVendasContatos := nil;
  inherited;
end;

procedure TfrmRelatorioVendasContatos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnRelatorio.Click;
  end;
  inherited;
end;

function TfrmRelatorioVendasContatos.VerificaPeriodo: boolean;
begin
  result := not (DataEmBranco(dedInicioPeriodo.Text) or DataEmBranco(dedTerminoPeriodo.Text));
  if result then begin
    result := dedInicioPeriodo.dataValida;
    if result then begin
      result := dedTerminoPeriodo.dataValida;
      if result then begin
        result := not (StrToDate(dedInicioPeriodo.Text) > StrToDate(dedTerminoPeriodo.Text));
        if result then begin
          if Trim(edtCarencia.Text) = '' then
            edtCarencia.Text:= '0';
          dtmRelatorioVendasContatos.Periodo(dedInicioPeriodo.Text, dedTerminoPeriodo.Text, edtCarencia.Text);
        end else begin
          MensagemErro(ctDTINICIALMAIORDTFINAL);
          dedInicioPeriodo.SetFocus;
        end;
      end else
        dedTerminoPeriodo.SetFocus;
    end else
      dedInicioPeriodo.SetFocus;
  end else begin
    MensagemErro('Deve ser especificado um período.');
    dedInicioPeriodo.SetFocus;
  end;
end;

procedure TfrmRelatorioVendasContatos.sbnRelatorioClick(Sender: TObject);
begin
  inherited;
  dtmRelatorioVendasContatos.Fecha(ctRelatorioVendasContatos);
  if VerificaPeriodo then begin
    dtmRelatorioVendasContatos.Abre(ctRelatorioVendasContatos);
    dtmRelatorioVendasContatos.DataRelatorio(dedInicioPeriodo.Text, dedTerminoPeriodo.Text);
    if rgpRelatorio.ItemIndex = 0 then
      dtmRelatorioVendasContatos.frRelatorioVendas.ShowReport
    else
      dtmRelatorioVendasContatos.frRelatorioPagamentoContato.ShowReport;
    dtmRelatorioVendasContatos.Fecha(ctRelatorioVendasContatos);
  end;
end;

end.
