unit fmConfirmarRomaneiosSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, Grids, AdvObj,
  BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, Mask, dmConfirmarRomaneiosSaida, biblio,
  frmctrllink, DBCtrls, clusuario, ctconstantes;

type
  TfrmConfirmarRomaneiosSaida = class(TfrmAjudaBt)
    gbxPesquisaNFe: TGroupBox;
    edtNFE: TMaskEdit;
    dbgRomaneiosNotasSaidas: TDBAdvGrid;
    sbnLiberarEntrega: TSpeedButton;
    sbnReterEntrega: TSpeedButton;
    Timer1: TTimer;
    procedure edtNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure dbgRomaneiosNotasSaidasCanClickCell(Sender: TObject; ARow,
      ACol: Integer; var Allow: Boolean);
    procedure sbnLiberarEntregaClick(Sender: TObject);
    procedure sbnReterEntregaClick(Sender: TObject);
  private
    { Private declarations }
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmConfirmarRomaneiosSaida: TfrmConfirmarRomaneiosSaida;

implementation

{$R *.dfm}

{ TfrmConfirmarRomaneiosSaida }

constructor TfrmConfirmarRomaneiosSaida.Create(AOwner: TComponent);
begin
  inherited;
  dtmConfirmarRomaneiosSaida := TdtmConfirmarRomaneiosSaida.Create(Self);

end;

destructor TfrmConfirmarRomaneiosSaida.Destroy;
begin

  inherited;
end;

procedure TfrmConfirmarRomaneiosSaida.edtNFEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
  begin
    if SomenteNumero(edtNFE.Text)<>'' then
      dtmConfirmarRomaneiosSaida.PesquisarNFeVolume(SomenteNumero(edtNFE.Text));

    edtNFE.setfocus;
    edtNFE.selectall;
  end;
end;

procedure TfrmConfirmarRomaneiosSaida.Timer1Timer(Sender: TObject);
begin
  inherited;
   sbnLiberarEntrega.enabled := (dtmConfirmarRomaneiosSaida.qryRomaneiosNotasSaidastipo.asString = 'N') and
                                (dtmConfirmarRomaneiosSaida.qryRomaneiosNotasSaidassituacao_romaneio.asString = 'CONFIRMADA');

   sbnReterEntrega.enabled := (dtmConfirmarRomaneiosSaida.qryRomaneiosNotasSaidastipo.asString = 'N') and
                              (dtmConfirmarRomaneiosSaida.qryRomaneiosNotasSaidassituacao_romaneio.asString = 'EM TRÂNSITO');

end;

procedure TfrmConfirmarRomaneiosSaida.dbgRomaneiosNotasSaidasCanClickCell(
  Sender: TObject; ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;

  if (Acol = dbgRomaneiosNotasSaidas.ColumnByFieldName['conferido'].Index) and (Arow<>0) then
    if dtmConfirmarRomaneiosSaida.qryRomaneiosNotasSaidas.recno <> Arow then
    begin
      dtmConfirmarRomaneiosSaida.qryRomaneiosNotasSaidas.recno := Arow;
      Allow := False;
    end;

end;

procedure TfrmConfirmarRomaneiosSaida.sbnLiberarEntregaClick(
  Sender: TObject);

var
  UsuarioAut: TtecUsuarios;
begin

  try

    UsuarioAut := dtmConfirmarRomaneiosSaida.ObterAutorizacao(taLOGIN, 'LIBERAR ENTREGA', ctAUTORIZADO);
    try
      if Assigned(UsuarioAut) then
      begin
        if dtmConfirmarRomaneiosSaida.LiberarEntrega(UsuarioAut.CodigoUsuario) then
        begin
          self.setfocus;
          dbgRomaneiosNotasSaidas.setfocus;
        end;
      end
      else
        MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']));

    finally
      if Assigned(UsuarioAut) then
        UsuarioAut.Free;
    end

  except
  end;

end;

procedure TfrmConfirmarRomaneiosSaida.sbnReterEntregaClick(
  Sender: TObject);
var
  UsuarioAut: TtecUsuarios;
begin
  try
    UsuarioAut := dtmConfirmarRomaneiosSaida.ObterAutorizacao(taLOGIN, 'RETER ENTREGA', ctAUTORIZADO);
    try
      if Assigned(UsuarioAut) then
      begin
        if dtmConfirmarRomaneiosSaida.ReterEntrega(UsuarioAut.CodigoUsuario) then
        begin
          self.setfocus;
          dbgRomaneiosNotasSaidas.setfocus;
        end;
      end
      else
        MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']));
    finally
      if Assigned(UsuarioAut) then
        UsuarioAut.Free;
    end
  except
  end;
end;

procedure TfrmConfirmarRomaneiosSaida.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F10    : begin
                  if sbnLiberarEntrega.enabled then
                     sbnLiberarEntrega.click
                  else
                  if sbnReterEntrega.enabled then
                    sbnReterEntrega.click;
                end;
  end;

end;

end.
