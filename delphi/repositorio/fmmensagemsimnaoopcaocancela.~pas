unit fmmensagemsimnaoopcaocancela;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Windows;

type
  TfrmMensagemSimNaoOpcaoCancela = class(Tform)
    btnCancelar: TBitBtn;
    btnSim: TBitBtn;
    btnNao: TBitBtn;
    btnOpcao: TBitBtn;
    lblMensagem: TStaticText;
    imgMensagem: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnOpcaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
{    constructor Create(AOwner: TComponent); override;}
    destructor Destroy; override;

    procedure AjustarTamanhos;

  end;

var
  frmMensagemSimNaoOpcaoCancela: TfrmMensagemSimNaoOpcaoCancela;



implementation

{$R *.dfm}

procedure TfrmMensagemSimNaoOpcaoCancela.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMensagemSimNaoOpcaoCancela.btnSimClick(Sender: TObject);
begin
  ModalResult := mrYes;
end;

procedure TfrmMensagemSimNaoOpcaoCancela.btnNaoClick(Sender: TObject);
begin
  ModalResult := mrNo;
end;

procedure TfrmMensagemSimNaoOpcaoCancela.btnOpcaoClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMensagemSimNaoOpcaoCancela.AjustarTamanhos;
var
  Total: integer;
  procedure Alinhar(inicio:integer);
  var
   posicao : integer;
  begin
   posicao := inicio;
   if btnCancelar.Visible then
   begin
     btnCancelar.Left := posicao;
     posicao := posicao + btnCancelar.width + 30;
   end;

   btnSim.left := posicao;
   posicao := posicao + btnSim.width + 30;

   btnNao.left := posicao;
   posicao := posicao + btnNao.width + 30;

   if btnOpcao.Visible then
     btnOpcao.Left := posicao;
     
  end;
begin
   Total := 0;

   if btnCancelar.Visible then
   begin
     if btnCancelar.Constraints.minWidth < length(btnCancelar.Caption)*9 then
       btnCancelar.Width := length(btnCancelar.Caption)*9;

     Total := total + btnCancelar.Width;
   end;

   if btnSim.Constraints.minwidth < length(btnSim.Caption)*9 then
     btnSim.Width := length(btnSim.Caption)*9;

   Total := total + btnSim.Width;

   if btnNao.Constraints.minWidth < length(btnNao.Caption)*9 then
     btnNao.Width := length(btnNao.Caption)*9;

   Total := total + btnNao.Width;

   if btnOpcao.Visible then
   begin
     if btnOpcao.Width < length(btnOpcao.Caption)*9 then
        btnOpcao.Width := length(btnOpcao.Caption)*9;
     Total := total + btnOpcao.Width;
   end;

   if total <= lblMensagem.Width then
     alinhar(lblMensagem.Left)
   else
     alinhar(lblMensagem.Left-30)

end;

procedure TfrmMensagemSimNaoOpcaoCancela.FormShow(Sender: TObject);
begin
  if not btnCancelar.Visible then
    if assigned(frmMensagemSimNaoOpcaoCancela) then
      frmMensagemSimNaoOpcaoCancela.btnSim.SetFocus;
end;

destructor TfrmMensagemSimNaoOpcaoCancela.Destroy;
begin
  inherited;
  frmMensagemSimNaoOpcaoCancela := nil;

end;

procedure TfrmMensagemSimNaoOpcaoCancela.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    modalresult := mrCancel;
    
end;

end.
