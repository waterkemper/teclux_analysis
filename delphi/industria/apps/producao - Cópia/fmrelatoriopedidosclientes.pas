unit fmrelatoriopedidosclientes;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta,
  frconsultacodigo, cpnumero, Windows, ComCtrls, Spin, ToolWin, DateUtils,
  cpeditioncontrolvalidation;

type
  TfrmRelatorioPedidosClientes = class(TfrmRelatorioPadrao)
    gbxEntrada: TGroupBox;
    gbxCliente: TGroupBox;
    gbxOSP: TGroupBox;
    gbxSemanaEntrada: TGroupBox;
    gbxOSPInicial: TGroupBox;
    gbxOSPFinal: TGroupBox;
    fraConsultaOSPinicial: TfraConsultaCodigo;
    fraConsultaOSPfinal: TfraConsultaCodigo;
    fraConsultaCliente: TfraConsultaCodigo;
    edtSemanaEntrada: TSpinEdit;
    edtSemanaEntrega: TSpinEdit;
    gbxAnoEntrada: TGroupBox;
    edtAnoEntrada: TSpinEdit;
    gbxEntrega: TGroupBox;
    gbxSemanaEntrega: TGroupBox;
    gbxAnoEntrega: TGroupBox;
    edtAnoEntrega: TSpinEdit;
    ecvValida: TtecEditionControlValidation;
    procedure edtSemanaEntradaExit(Sender: TObject);
    procedure edtAnoEntradaExit(Sender: TObject);
    procedure edtAnoEntregaExit(Sender: TObject);
    procedure edtSemanaEntregaExit(Sender: TObject);
  private
    procedure limparCamposPesquisa;
    { Private declarations }
  protected
    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  frmRelatorioPedidosClientes: TfrmRelatorioPedidosClientes;
  ControleValido : TWinControl;

implementation

uses
  dmrelatoriopedidosclientes, ctconstantes, biblio;

{$R *.dfm}

{ TfrmRelatorioPedidosClientes }

constructor TfrmRelatorioPedidosClientes.Create(AOwner: TComponent);
begin
  dtmRelatorioPedidosClientes := TdtmRelatorioPedidosClientes.Create(Self);
  inherited;
  fraConsultaCliente.TipoPesquisa:= pesCLIENTES;
  fraConsultaCliente.TipoCliente := 'C';
  fraConsultaOSPInicial.TipoPesquisa:= pesOSP;
  fraConsultaOSPFinal.TipoPesquisa  := pesOSP;
  edtAnoEntrada.Text:= FStr(YearOf(DataLocal)-1,$41);
  edtAnoEntrega.Text:= FStr(YearOf(DataLocal),  $41);

end;

procedure TfrmRelatorioPedidosClientes.InternoImpressao;
begin
  inherited;

  if ecvValida.Verify(pnlFundoJanela, ControleValido) then
  begin

    edtSemanaEntradaExit(nil);
    edtAnoEntradaExit(nil);
    edtSemanaEntregaExit(nil);
    edtAnoEntregaExit(nil);

    {
    if (trim(edtSemanaEntrada.Text) <> '') or
       (trim(edtSemanaEntrega.Text) <> '') or
       (trim(fraConsultaOSPInicial.edfCodigo.Text) <> '') or
       (trim(fraConsultaOSPFinal.edfCodigo.Text) <> '') or
       (trim(fraConsultaCliente.edfCodigo.Text) <> '') then

    begin
    }
      if not dtmRelatorioPedidosClientes.ImprimirRelatorio(

           trim(edtSemanaEntrada.Text),
           trim(edtAnoEntrada.text),

           trim(edtSemanaEntrega.Text),
           trim(edtAnoEntrega.Text),

           fraConsultaOSPInicial.edfCodigo.Text,
           fraConsultaOSPFinal.edfCodigo.Text,
           fraConsultaCliente.edfCodigo.Text,
           fraConsultaCliente.TipoCliente) then
        MensagemAviso(format(ctNENHUMREGISTROSELECIONADO, ['registro']));
  {
    end
    else
    begin
      MensagemAviso('Ao menos um dos controles de edição deve ser preenchido!');
      edtSemanaEntrada.SetFocus;
    end;
    }
  end;
end;

procedure TfrmRelatorioPedidosClientes.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key =VK_escape then
  begin
    limparCamposPesquisa;
    edtSemanaEntrada.SetFocus;
  end;
end;

procedure TfrmRelatorioPedidosClientes.limparCamposPesquisa;
begin
{
  edtSemanaEntrada.Clear;
  edtSemanaEntrega.Clear;
  }
  fraConsultaOSPinicial.edfCodigo.Clear;
  fraConsultaOSPfinal.edfCodigo.Clear;
  fraConsultaCliente.edfCodigo.Clear;
end;

procedure TfrmRelatorioPedidosClientes.edtSemanaEntradaExit(Sender: TObject);
begin
  inherited;
  if (edtSemanaEntrada.Text='') then
  begin
      edtSemanaEntrada.Text := '0';
  end;
  edtSemanaEntregaExit(nil);
end;
{begin
  inherited;
  if trim(edtSemanaEntrada.Text)='' then
    while edtAnoEntrada.Value <> 2000 do
//    edtAnoEntrada.StepDown;

end;}

procedure TfrmRelatorioPedidosClientes.edtAnoEntradaExit(Sender: TObject);
begin
  inherited;
  if (edtAnoEntrada.Text<>'') and
     (edtAnoEntrada.Text<>'0') then
  begin
    edtSemanaEntrada.MaxValue := WeeksInAYear(strtoint(edtAnoEntrada.Text));
    if (edtSemanaEntrada.Text <> '') and
       (strtoint(edtSemanaEntrada.Text) > edtSemanaEntrada.MaxValue) then
      edtSemanaEntrada.Text := inttostr(edtSemanaEntrada.MaxValue);
  end;
    if (edtAnoEntrada.Text='') then
  begin
      edtAnoEntrada.Text := '0';
  end;
  edtSemanaEntregaExit(nil);
  edtAnoEntregaExit(nil);

end;
{begin
  inherited;
  if trim(edtAnoEntrada.Text)='' then
    while edtSemanaEntrada.Value <> 0 do
//    edtSemanaEntrada.StepDown;
end;}

procedure TfrmRelatorioPedidosClientes.edtAnoEntregaExit(Sender: TObject);
begin
   inherited;
    if (edtAnoEntrega.Text<>'') and
     (edtAnoEntrega.Text<>'0') then
   begin
     edtSemanaEntrega.MaxValue := WeeksInAYear(strtoint(edtAnoEntrega.Text));
     if (edtSemanaEntrega.Text <> '') and
        (strtoint(edtSemanaEntrega.Text) > edtSemanaEntrega.MaxValue) then
       edtSemanaEntrega.Text := inttostr(edtSemanaEntrega.MaxValue);

     if (StrToInt(edtAnoEntrega.Text)) < (StrToInt(edtAnoEntrada.Text)) then
         edtAnoEntrega.Text := edtAnoEntrada.Text;
   end;

    if (edtAnoEntrega.Text='') then
   begin
      edtAnoEntrega.Text := '0';
   end;
 end;
{begin
  inherited;
  if trim(edtAnoEntrega.Text)='' then
    while edtSemanaEntrega.Value <> 0 do
//    edtSemanaEntrega.StepDown;
end;}

procedure TfrmRelatorioPedidosClientes.edtSemanaEntregaExit(Sender: TObject);
begin
  inherited;

  if (edtSemanaEntrega.Text='') then
    edtSemanaEntrega.Text := '0';

  if (edtAnoEntrega.Text<>'') and
     (edtAnoEntrega.Text<>'0') then
  begin
   if (edtAnoEntrada.Text<>'') and
      ((strtoint(edtAnoEntrada.Text)) = (StrToInt(edtAnoEntrega.Text))) and
      ((StrToInt(edtSemanaEntrada.Text)) >= (StrToInt(edtSemanaEntrega.Text))) then
          edtSemanaEntrega.Text := edtSemanaEntrada.Text;
  end;


end;

{begin
  inherited;
  if trim(edtSemanaEntrega.Text)='' then
    while edtAnoEntrega.Value <> 2000 do
//    edtAnoEntrega.StepDown;
end;}

end.
