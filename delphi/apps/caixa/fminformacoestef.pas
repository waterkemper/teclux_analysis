unit fminformacoestef;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmInformacoesTEF = class(TForm)
    Memo: TMemo;
    Edit: TEdit;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    ComboBox: TComboBox;
    procedure bbnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FMin: Integer;
    function getTexto: String;
    function getOpcao: Integer;
  public
    destructor destroy; override;
    procedure Cabecalho(Str: String);
    procedure Confirmacao(var Str: String; Min, Max: Integer);
    procedure Opcoes(Str: array of String);
    property Min: Integer read FMin write FMin;
    property Opcao: Integer read getOpcao;
    property Texto: String read getTexto;
  end;

var
  frmInformacoesTEF: TfrmInformacoesTEF;

implementation

Uses
  biblio;

{$R *.dfm}

procedure TfrmInformacoesTEF.bbnOKClick(Sender: TObject);
begin
  if Length(Edit.Text) >= Min then
    ModalResult := mrOk
end;

procedure TfrmInformacoesTEF.Cabecalho(Str: String);
begin
  Memo.Text := Str;
end;

procedure TfrmInformacoesTEF.Confirmacao(var Str: String; Min, Max: Integer);
begin
  Memo.Text := Str;
  Memo.Clear;
  Memo.Lines.Add(Str);
  Edit.Text := '';
  Edit.MaxLength := Max;
  Self.Min := Min;
  Edit.BringToFront;
  Edit.SetFocus;
end;

destructor TfrmInformacoesTEF.destroy;
begin
  inherited;
  frmInformacoesTEF := nil;
end;

procedure TfrmInformacoesTEF.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    if Length(Edit.Text) >= Min then
      ModalResult := mrOk
end;

function TfrmInformacoesTEF.getOpcao: Integer;
begin
  Result := ComboBox.ItemIndex + 1;
end;

function TfrmInformacoesTEF.getTexto: String;
begin
  Result := Edit.Text
end;

procedure TfrmInformacoesTEF.Opcoes(Str: array of String);
var
  a: Integer;
begin
  ComboBox.Items.Clear;
  for a := 0 to High(Str) do
    ComboBox.Items.Add(Str[a]);
  ComboBox.ItemIndex := 0;
  ComboBox.BringToFront;
  ComboBox.SetFocus;
end;

end.
