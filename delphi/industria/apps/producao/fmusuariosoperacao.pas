unit fmusuariosoperacao;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmajuda, dmoperacoesosp, DBCtrls, cpdbtext, cpdbfindcontrols,
  Mask, Buttons, Windows, biblio, ctconstantes, cptexto;

type
  TfrmUsuariosOperacao = class(TfrmAjuda)
    btnOK: TBitBtn;
    btncancelar: TBitBtn;
    gbxCodigoUsuario: TGroupBox;
    edfUsuarioOperacao: TtecDbEditFind;
    dtxNomeUsuario: TtecDBText;
    gbxNumero: TGroupBox;
    edfOSP_2: TtecDbEditFind;
    edfLote_2: TtecDbEditFind;
    Label5: TLabel;
    lblLote: TLabel;
    procedure edfUsuarioOperacaoMessage(var Msg: String);
    procedure edfUsuarioOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfUsuarioOperacaoFound(Found: Boolean);
    procedure edfOSP_2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfLote_2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure edfOSP_2Exit(Sender: TObject);
    procedure edfLote_2Exit(Sender: TObject);
    procedure edfOSP_2Enter(Sender: TObject);
    procedure edfLote_2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

  end;

var
  frmUsuariosOperacao: TfrmUsuariosOperacao;

implementation

{$R *.dfm}

procedure TfrmUsuariosOperacao.edfUsuarioOperacaoMessage(var Msg: String);
begin
  inherited;
  msg := 'Código do usuário inativo ou não cadastrado';
end;

procedure TfrmUsuariosOperacao.edfUsuarioOperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edfOSP_2.SetFocus;
    edfosp_2.SelectAll;
  end;
end;

procedure TfrmUsuariosOperacao.edfUsuarioOperacaoFound(Found: Boolean);
begin
  inherited;
  if found then
  begin
    if dtmOperacoesOSP.qryUsuariosturno.IsNull then
      MensagemErro('O usuário não esta vinculado a um turno de trabalho.');

    if dtmOperacoesOSP.qryUsuariosgerenteproducao.AsBoolean then
      dtmOperacoesOSP.TipoLogin := GerenteProducao
    else
      dtmOperacoesOSP.TipoLogin := Operador;

    if dtmOperacoesOSP.AbreOperacaoemAbertoUsuario then
      ModalResult := mrOk;
  end;
end;

procedure TfrmUsuariosOperacao.edfOSP_2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if key =VK_return then
    begin
      edfLote_2.SetFocus;
      edfLote_2.SelectAll;
    end;
end;

procedure TfrmUsuariosOperacao.edfLote_2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if key =VK_return then
      btnOK.SetFocus;

end;

procedure TfrmUsuariosOperacao.btnOKClick(Sender: TObject);
begin
  inherited;
  if edfOSP_2.Text = '' then
    MensagemErro('Indique a OSP e o LOTE de produção.')
  else
  begin
    if edfUsuarioOperacao.Text <> dtmOperacoesOSP.qryUsuarioscodigo.asstring then
    begin
      if edfUsuarioOperacao.Exist then
      begin
        ModalResult := mrOk;
//        close;
      end;
    end
    else
    begin
      ModalResult := mrOk;
//      close;
    end;
  end;
end;

destructor TfrmUsuariosOperacao.Destroy;
begin
  inherited;
  frmUsuariosOperacao := nil;
end;

procedure TfrmUsuariosOperacao.edfOSP_2Exit(Sender: TObject);
begin
  inherited;
  edflote_2.Modified := true;
  {
  if (edfOSP.text<>'') and (edfLote.Text<>'') then
  begin
    with dtmOperacoesOSP do
    begin
      qryOSPLotes.ParamByName('osp').AsString      := edfOSP.Text;
      qryOSPLotes.ParamByName('numero').AsString   := edfLote.Text;
    end;
    edfOSP.Exist;
  end;
  }
end;

procedure TfrmUsuariosOperacao.edfLote_2Exit(Sender: TObject);
begin
  inherited;
  edfosp_2.Modified := true;
  {
  if (edfOSP.text<>'') and (edfLote.Text<>'') then
  begin
    with dtmOperacoesOSP do
    begin
      qryOSPLotes.ParamByName('osp').AsString      := edfOSP.Text;
      qryOSPLotes.ParamByName('numero').AsString   := edfLote.Text;
    end;
    edfOSP.Exist;
  end;
  }
end;

procedure TfrmUsuariosOperacao.edfOSP_2Enter(Sender: TObject);
begin
  inherited;
  dtmOperacoesOSP.qryOSPLotes.ParamByName('numero').AsString   := ifthen_(edfLote_2.Text<>'',edfLote_2.Text,'0');
  //edfUsuarioOperacaoFound(true);

end;

procedure TfrmUsuariosOperacao.edfLote_2Enter(Sender: TObject);
begin
  inherited;
  dtmOperacoesOSP.qryOSPLotes.ParamByName('osp').AsString      := ifthen_(edfOSP_2.Text<>'',edfOSP_2.Text,'0');

end;

end.
