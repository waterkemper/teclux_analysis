unit fmselecionarquantidades;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, ExtCtrls, Buttons, Biblio, ctconstantes{Qete,};

type
  Tfrmselecionarquantidades = class(TForm)
    pnlFundo: TPanel;
    rgpquantidade: TRadioGroup;
    btnSelecionar: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  end;

var
  frmselecionarquantidades: Tfrmselecionarquantidades;

implementation

{$R *.dfm}

{ Tfrmselecionarquantidades }

constructor Tfrmselecionarquantidades.Create(AOwner: TComponent);
begin
  inherited;
  Top  := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;
end;

procedure Tfrmselecionarquantidades.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    btnSelecionarClick(Sender)
  else
  if Key = VK_ESCAPE then
    ModalResult := mrAbort;
end;

procedure Tfrmselecionarquantidades.btnSelecionarClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

destructor Tfrmselecionarquantidades.Destroy;
begin
  inherited;
  frmselecionarquantidades := nil;

end;

end.
