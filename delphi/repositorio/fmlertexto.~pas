unit fmlerTexto;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, biblio,
  //Repositorio
  fmlernumero,
  //Componentes
  cpnumero, fmnavcontroles, cpdata, cptexto;

type
  TfrmLerTexto = class(TfrmNavControles)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    gbxTexto: TGroupBox;
    edtTexto: TEditTexto;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    lblTitulo: TStaticText;
    lblTexto: TStaticText;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbnOKClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; Caption: String); reintroduce;
    destructor destroy; override;
  end;

var
frmLerTexto: TfrmLerTexto;

implementation

{$R *.dfm}

{ TfrmLerTexto }

constructor TfrmLerTexto.Create(AOwner: TComponent; Caption: String);
begin
  inherited Create(AOwner);
  Self.Caption := Caption;
end;

destructor TfrmLerTexto.Destroy;
begin
  inherited;
  frmLerTexto := nil;
end;

procedure TfrmLerTexto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := (ModalResult = mrOK) or (ModalResult = mrCancel);
end;

procedure TfrmLerTexto.bbnOKClick(Sender: TObject);
begin
  inherited;
  if edtTexto.Text<>'' then
    modalresult := mrOK
  else
  begin
    edttexto.SetFocus;
    mensagemaviso('Informe o conteúdo do campo '+gbxTexto.Caption);
  end;
end;

end.
