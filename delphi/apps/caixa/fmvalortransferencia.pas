unit fmvalortransferencia;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmnavcontroles, Buttons, cpnumero, biblio, dmautenticacoes;

type
  TfrmValorTransferencia = class(TfrmNavControles)
    edtValorTransferencia: TEditNumero;
    lblValorTransferencia: TLabel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FValorTransferencia: Currency;
    procedure setValorTransferencia(const Value: Currency);
    { Private declarations }
  public
    destructor destroy; override;
    procedure setDataModulo(dtm: TdtmAutenticacoes);
    property ValorTransferencia: Currency read FValorTransferencia write setValorTransferencia;
    { Public declarations }
  end;

var
  frmValorTransferencia: TfrmValorTransferencia;

implementation

{$R *.dfm}

{ TfrmValorTransferencia }

procedure TfrmValorTransferencia.setValorTransferencia(
  const Value: Currency);
begin
  FValorTransferencia := Value;
  edtValorTransferencia.Text := Trocar(Trocar(Trim(Format('%11.2m',[Value])),'R',''),'$','');
  edtValorTransferencia.SelectAll;
end;

procedure TfrmValorTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if ModalResult = mrOK then
  begin
    dtmautenticacoes.ValorConfirmadoTransferencia := StrToFloat(edtValorTransferencia.ValorSemFormatacao);
  end
  else
    dtmautenticacoes.ValorConfirmadoTransferencia := 0;
end;

procedure TfrmValorTransferencia.setDataModulo(dtm: TdtmAutenticacoes);
begin
  dtmautenticacoes := dtm;
end;

destructor TfrmValorTransferencia.destroy;
begin
  inherited;
  frmValorTransferencia := nil;
end;

end.
