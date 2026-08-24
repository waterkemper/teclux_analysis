unit fmImprimirMaquinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cpdata, fmnavcontroles, ExtCtrls, Buttons, dmcadastromaquinas;

type
  TfrmImprimirMaquinas =  class(TfrmNavControles)
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
  frmImprimirMaquinas: TfrmImprimirMaquinas;

implementation

{$R *.dfm}

destructor TfrmImprimirMaquinas.Destroy;
begin
  inherited;
  frmImprimirMaquinas := nil;

end;

procedure TfrmImprimirMaquinas.bbnCancelarClick(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmImprimirMaquinas.edtDataInicialInclusaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key =VK_return then
  begin
    edtDataFinaInclusao.SetFocus;
    edtDataFinaInclusao.SelectAll;
  end;

end;

procedure TfrmImprimirMaquinas.edtDataFinaInclusaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataInicialAlteracao.SetFocus;
    edtDataInicialAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirMaquinas.edtDataInicialAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataFinalAlteracao.SetFocus;
    edtDataFinalAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirMaquinas.edtDataFinalAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
    ckbListarOperacao.SetFocus;

end;

procedure TfrmImprimirMaquinas.ckbListarOperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
    rgpOrdenacao.SetFocus;

end;

procedure TfrmImprimirMaquinas.btnOKClick(Sender: TObject);
begin
  inherited;
  dtmCadastroMaquinas.imprimir(edtDataInicialInclusao.Text,edtDataFinaInclusao.Text,edtDataInicialAlteracao.Text,
                               edtDataFinalAlteracao.Text, ckbListarOperacao.Checked, rgpOrdenacao.ItemIndex );

end;

end.
