unit fmImprimirfalhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cpdata, fmnavcontroles, ExtCtrls, Buttons, dmcadastrofalha;

type
  TfrmImprimirfalhas =  class(TfrmNavControles)
    gbxInclusoes: TGroupBox;
    lblACadastro: TLabel;
    edtDataInicialInclusao: TEditData;
    edtDataFinaInclusao: TEditData;
    gbxAlteracoes: TGroupBox;
    Label1: TLabel;
    edtDataInicialAlteracao: TEditData;
    edtDataFinalAlteracao: TEditData;
    gbxListar: TGroupBox;
    ckbListarOperacao: TCheckBox;
    bbnCancelar: TBitBtn;
    rgpOrdenacao: TRadioGroup;
    btnOK: TBitBtn;
    StaticText1: TStaticText;
    procedure bbnCancelarClick(Sender: TObject);
    procedure edtDataInicialInclusaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataFinaInclusaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataInicialAlteracaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edtDataFinalAlteracaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbListarOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  frmImprimirfalhas: TfrmImprimirfalhas;

implementation

{$R *.dfm}

destructor TfrmImprimirfalhas.Destroy;
begin
  inherited;
  frmImprimirfalhas := nil;

end;

procedure TfrmImprimirfalhas.bbnCancelarClick(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmImprimirfalhas.edtDataInicialInclusaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key =VK_return then
  begin
    edtDataFinaInclusao.SetFocus;
    edtDataFinaInclusao.SelectAll;
  end;

end;

procedure TfrmImprimirfalhas.edtDataFinaInclusaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataInicialAlteracao.SetFocus;
    edtDataInicialAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirfalhas.edtDataInicialAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataFinalAlteracao.SetFocus;
    edtDataFinalAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirfalhas.edtDataFinalAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
    ckbListarOperacao.SetFocus;

end;

procedure TfrmImprimirfalhas.ckbListarOperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
    rgpOrdenacao.SetFocus;

end;

procedure TfrmImprimirfalhas.btnOKClick(Sender: TObject);
begin
  inherited;
  dtmCadastroFalha.imprimir(edtDataInicialInclusao.Text,edtDataFinaInclusao.Text,edtDataInicialAlteracao.Text,
                               edtDataFinalAlteracao.Text, ckbListarOperacao.Checked, rgpOrdenacao.ItemIndex );

end;

end.
