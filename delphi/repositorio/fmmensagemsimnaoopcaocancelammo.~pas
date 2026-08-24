unit fmmensagemsimnaoopcaocancelammo;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, fmmensagemsimnaoopcaocancela;

type
  TfrmMensagemSimNaoopcaocancelammo = class(TfrmMensagemSimNaoOpcaoCancela)
    gbxMensagemmmo: TGroupBox;
    mmoMensagem: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;


  end;

var
  frmMensagemSimNaoopcaocancelammo: TfrmMensagemSimNaoopcaocancelammo;
  DigitarTextommo : boolean;

implementation

{$R *.dfm}

destructor TfrmMensagemSimNaoopcaocancelammo.Destroy;
begin
  inherited;
  frmMensagemSimNaoopcaocancelammo := nil;

end;

procedure TfrmMensagemSimNaoopcaocancelammo.FormShow(Sender: TObject);
begin
  inherited;
  if not btnCancelar.Visible then
    if assigned(frmMensagemSimNaoopcaocancelammo) then
    begin
      if DigitarTextommo then
      begin
        frmMensagemSimNaoopcaocancelammo.mmoMensagem.SetFocus;
        frmMensagemSimNaoopcaocancelammo.mmoMensagem.selectall;
      end
      else
        frmMensagemSimNaoopcaocancelammo.btnSim.SetFocus;
    end;
end;

procedure TfrmMensagemSimNaoopcaocancelammo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := true;
  if modalResult = mrYes then
  begin
    CanClose := not DigitarTextommo or (DigitarTextommo and (mmoMensagem.text<>''));
    if not canclose then
    begin
      messagedlg('Texto obrigatório.', mtInformation, [mbOk], 0);
      mmoMensagem.setfocus;
      mmoMensagem.selectall;
    end;
  end;
end;

end.
