unit fmleituramemoriafiscaldata;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cpdata, ExtCtrls, Buttons, {Qete,} fmnavcontroles, biblio,
  ctconstantes, Windows;

type
  TfrmLeituraMemoriaFiscalData = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    btnOK: TButton;
    btnCancelar: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtDataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function ControlesPreenchidos: Boolean;
    function getDataFinal: String;
    function getDataInicial: String;
    { Private declarations }
  public
    destructor destroy; override;
    property DataInicial: String read getDataInicial;
    property DataFinal: String read getDataFinal;
    { Public declarations }
  end;

var
  frmLeituraMemoriaFiscalData: TfrmLeituraMemoriaFiscalData;

implementation

{$R *.dfm}

{ TfrmLeituraMemoriaFiscalData }

function TfrmLeituraMemoriaFiscalData.getDataFinal: String;
begin
  Result := edtDataFinal.Text;
end;

function TfrmLeituraMemoriaFiscalData.getDataInicial: String;
begin
  Result := edtDataInicial.Text;
end;

procedure TfrmLeituraMemoriaFiscalData.btnOKClick(Sender: TObject);
begin
  if ControlesPreenchidos then
    ModalResult := mrOk;
end;

procedure TfrmLeituraMemoriaFiscalData.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrAbort;
end;

procedure TfrmLeituraMemoriaFiscalData.edtDataInicialKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : edtDataFinal.SetFocus;

    VK_ESCAPE : ModalResult := mrAbort;
  end;
end;

function TfrmLeituraMemoriaFiscalData.ControlesPreenchidos: Boolean;
begin
  Result := True;
  if trim(edtDataInicial.Text) = '' then
  begin
    MensagemAviso(ctDATAINVALIDA);
    edtDataInicial.SetFocus;
    Result := False;
  end
  else if trim(edtDataFinal.Text) = '' then
  begin
    MensagemAviso(ctDATAINVALIDA);
    edtDataFinal.SetFocus;
    Result := False;
  end
  else if StrToDate(edtDataInicial.Text) > StrToDate(edtDataFinal.Text) then
  begin
    MensagemAviso(ctDATAINVALIDA);
    edtDataInicial.SetFocus;
    Result := False;
  end
end;

procedure TfrmLeituraMemoriaFiscalData.edtDataFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : if ControlesPreenchidos then
                   btnOK.Click;

    VK_ESCAPE : ModalResult := mrAbort;
  end;
end;

destructor TfrmLeituraMemoriaFiscalData.destroy;
begin
  inherited;
  frmLeituraMemoriaFiscalData := nil;
end;

end.
