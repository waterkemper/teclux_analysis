unit fmetiquetasreservas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, cpdata, frconsulta,
  frconsultacodigo, clparametrossistema, ctconstantes, biblio, ToolWin,
  ComCtrls{Qete,};

type
  TfrmEtiquetasReservas = class(TFrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    edtInicio: TEditData;
    edtFim: TEditData;
    ckbImpressas: TCheckBox;
    fraConsultaFilial: TfraConsultaCodigo;
    fraConsultaVendedor: TfraConsultaCodigo;
    lblA: TLabel;
    gbxFilial: TGroupBox;
    gbxVendedor: TGroupBox;
    procedure ckbImpressasClick(Sender: TObject);
    procedure fraConsultaVendedoredfCodigoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function VerificaCamposConsulta: Boolean;
    procedure LimpaControles;

    { Public declarations }
  end;

var
  frmEtiquetasReservas: TfrmEtiquetasReservas;

implementation

uses dmetiquetasreservas;

{$R *.dfm}

procedure TfrmEtiquetasReservas.ckbImpressasClick(Sender: TObject);
begin
  inherited;
  if ckbImpressas.Checked then
  begin
    edtInicio.Clear;
    edtFim.Clear;
  end
  else
  begin
    edtInicio.Text := DateToStr( IncMonth(Date, -1) );
    edtFim.Text := DateToStr(Date);
    if edtInicio.CanFocus then
      edtInicio.SetFocus;
  end;

end;

constructor TfrmEtiquetasReservas.Create(AOwner: TComponent);
begin
  inherited;
  dtmEtiquetasReservas:= TdtmEtiquetasReservas.Create(Self);
  fraConsultaFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaVendedor.TipoPesquisa := pesVENDEDORES;
end;

destructor TfrmEtiquetasReservas.Destroy;
begin
  dtmEtiquetasReservas:=nil;
  inherited;
  frmEtiquetasReservas := nil;
end;

procedure TfrmEtiquetasReservas.fraConsultaVendedoredfCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  fraConsultaVendedor.edfCodigoKeyDown(Sender, Key, Shift);
  if TeclaEnterOuReturn(Key) and (Shift = []) then
    InternoImpressao;
end;

procedure TfrmEtiquetasReservas.InternoImpressao;
begin
  inherited;
    if VerificaCamposConsulta then
    with dtmEtiquetasReservas do
    begin
      ParametroImpressas := ckbImpressas.Checked;
      ParametroDataInicial := edtInicio.Text;
      ParametroDataFinal := edtFim.Text;
      ParametroFilial := Trim(fraConsultaFilial.edfCodigo.Text);
      ParametroVendedor := Trim(fraConsultaVendedor.edfCodigo.Text);
      AbreEtiquetasReserva;
    end;

end;

procedure TfrmEtiquetasReservas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
   VK_ESCAPE: LimpaControles;
  end;
  inherited;
end;

procedure TfrmEtiquetasReservas.LimpaControles;
begin
  with dtmEtiquetasReservas do
    Fecha(ctEtiquetasReservas);
end;

function TfrmEtiquetasReservas.VerificaCamposConsulta: Boolean;
begin
  Result := (edtInicio.DataValida and edtFim.DataValida);
  if Result then
  begin
   if (not dataembranco(edtinicio.text) and not dataembranco(edtfim.text)) then
     Result:=StrToDate(edtInicio.Text) <= StrToDate(edtFim.Text);
   if result then
   begin
     Result:=(not dataembranco(edtinicio.text) or not dataembranco(edtfim.text));
     if Result then
       Result:=OperadorTernario(Trim(fraConsultaFilial.edfCodigo.Text) <> '',
               (fraConsultaFilial.edfCodigo.Exist), True)
               and
               OperadorTernario(Trim(fraConsultaVendedor.edfCodigo.Text) <> '',
               (fraConsultaVendedor.edfCodigo.Exist), True)
     else
     begin
      MensagemAviso(ctDATAINVALIDA);
      edtInicio.SetFocus;
     end;
   end
   else
   begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtInicio.SetFocus;
   end;
  end;

end;

end.
