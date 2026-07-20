unit fmleituramemoriafiscalreducao;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, cpnumero, Buttons, ExtCtrls, {Qete,} fmnavcontroles, biblio,
  ctconstantes;

type
  TfrmLeituraMemoriaFiscalReducao = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblReducaoInicial: TLabel;
    lblReducaoFinal: TLabel;
    edtReducaoInicial: TEditNumero;
    edtReducaoFinal: TEditNumero;
    btnOK: TButton;
    btnCancelar: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure edtReducaoInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReducaoFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    function getReducaoFinal: String;
    function getReducaoInicial: String;
    function ControlesPreenchidos: Boolean;
    { Private declarations }
  public
    destructor destroy; override;
    property ReducaoInicial: String read getReducaoInicial;
    property ReducaoFinal: String read getReducaoFinal;
    { Public declarations }
  end;

var
  frmLeituraMemoriaFiscalReducao: TfrmLeituraMemoriaFiscalReducao;

implementation

{$R *.dfm}

{ TfrmLeituraMemoriaFiscalReducao }

function TfrmLeituraMemoriaFiscalReducao.getReducaoFinal: String;
begin
  Result := edtReducaoFinal.Text;
end;

function TfrmLeituraMemoriaFiscalReducao.getReducaoInicial: String;
begin
  Result := edtReducaoInicial.Text;
end;

procedure TfrmLeituraMemoriaFiscalReducao.btnOKClick(Sender: TObject);
begin
  if ControlesPreenchidos then
    ModalResult := mrOk;
end;

function TfrmLeituraMemoriaFiscalReducao.ControlesPreenchidos: Boolean;
begin
  Result := True;
  if trim(edtReducaoInicial.Text) = '' then
  begin
    MensagemAviso(ctCODIGONECESSARIO);
    edtReducaoInicial.SetFocus;
    Result := False;
  end
  else if trim(edtReducaoFinal.Text) = '' then
  begin
    MensagemAviso(ctCODIGONECESSARIO);
    edtReducaoFinal.SetFocus;
    Result := False;
  end
  else if StrToInt(edtReducaoInicial.Text) > StrToInt(edtReducaoFinal.Text) then
  begin
    MensagemAviso('Valor inicial MENOR que o final');
    edtReducaoInicial.SetFocus;
    Result := False;
  end

end;

procedure TfrmLeituraMemoriaFiscalReducao.edtReducaoInicialKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : edtReducaoFinal.SetFocus;

    VK_ESCAPE : ModalResult := mrAbort;
  end;
end;

procedure TfrmLeituraMemoriaFiscalReducao.edtReducaoFinalKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Return : if ControlesPreenchidos then
                   btnOK.Click;

    VK_ESCAPE : ModalResult := mrAbort;
  end;
end;

destructor TfrmLeituraMemoriaFiscalReducao.destroy;
begin
  inherited;
  frmLeituraMemoriaFiscalReducao := nil;
end;

procedure TfrmLeituraMemoriaFiscalReducao.FormShow(Sender: TObject);
begin
  inherited;
  edtReducaoInicial.SetFocus;
end;

end.
