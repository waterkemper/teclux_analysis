unit fmmensagemtemporizada;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type
  {
  TFecharForm = Class(TThread)
  private
    Inicio,
    Tempo: Integer;
  protected
    procedure Execute; override;
  end;
   }
  TfrmMensagemTemporizada = class(TForm)
    lblMensagem: TLabel;
//    procedure bbnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FFechar: Boolean;
    function GetMensagem: String;
    procedure SetMensagem(const Value: String);
  protected
//    FecharForm: TFecharForm;
//    procedure Terminado(Sender: TObject);
  public
    constructor Create(AOwner: TComponent; Msg: String); reintroduce;
    destructor  Destroy; override;
    procedure FreeInstance; override;
    property Fechar: Boolean read FFechar write FFechar;
    property Mensagem: String read GetMensagem write SetMensagem; 
  end;

var
  frmMsg: TfrmMensagemTemporizada;

implementation

Uses
  IdGlobal;

{$R *.dfm}

{ TFecharForm }
{
procedure TFecharForm.Execute;
begin
  inherited;
  while Inicio < Tempo do
    Inicio := GetTickCount;
end;

procedure TfrmMensagemTemporizada.bbnOKClick(Sender: TObject);
begin
  Close;
end;
 }
constructor TfrmMensagemTemporizada.Create(AOwner: TComponent; Msg: String);
begin
  inherited Create(AOwner);
  lblMensagem.Caption := Msg;
  Fechar := True;
{  FecharForm := TFecharForm.Create(True);
  FecharForm.OnTerminate := Terminado;}
end;

destructor TfrmMensagemTemporizada.Destroy;
begin
{  FecharForm.Terminate;
  if Assigned(FecharForm) then begin
    FecharForm.Free;
    FecharForm := nil
  end;}
  inherited;
end;

procedure TfrmMensagemTemporizada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Fechar then
    Action := caHide
  else
    Action := caNone
end;

procedure TfrmMensagemTemporizada.FormShow(Sender: TObject);
begin
  inherited;
{  FecharForm.Inicio := 0;
  FecharForm.Tempo  := 7000 + GetTickCount;
  FecharForm.Resume;}
end;

procedure TfrmMensagemTemporizada.FreeInstance;
begin
  inherited;
  frmMsg := nil
end;

{procedure TfrmMensagemTemporizada.Terminado(Sender: TObject);
begin
  Close;
end;
 }

function TfrmMensagemTemporizada.GetMensagem: String;
begin
  Result := lblMensagem.Caption
end;

procedure TfrmMensagemTemporizada.SetMensagem(const Value: String);
begin
  lblMensagem.Caption := Value
end;

initialization
  frmMsg := nil;

end.
