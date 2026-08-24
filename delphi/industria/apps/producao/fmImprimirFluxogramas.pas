unit fmImprimirfluxogramas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cpdata, fmnavcontroles, ExtCtrls, Buttons, dmcadastrofluxogramas;

type
  TfrmImprimirfluxogramas =  class(TfrmNavControles)
    gbxInclusoes: TGroupBox;
    lblACadastro: TLabel;
    edtDataInicialInclusao: TEditData;
    edtDataFinaInclusao: TEditData;
    gbxAlteracoes: TGroupBox;
    Label1: TLabel;
    edtDataInicialAlteracao: TEditData;
    edtDataFinalAlteracao: TEditData;
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
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
  end;

var
  frmImprimirfluxogramas: TfrmImprimirfluxogramas;

implementation

{$R *.dfm}

destructor TfrmImprimirfluxogramas.Destroy;
begin
  inherited;
  frmImprimirfluxogramas := nil;

end;

procedure TfrmImprimirfluxogramas.bbnCancelarClick(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmImprimirfluxogramas.edtDataInicialInclusaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key =VK_return then
  begin
    edtDataFinaInclusao.SetFocus;
    edtDataFinaInclusao.SelectAll;
  end;

end;

procedure TfrmImprimirfluxogramas.edtDataFinaInclusaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataInicialAlteracao.SetFocus;
    edtDataInicialAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirfluxogramas.edtDataInicialAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataFinalAlteracao.SetFocus;
    edtDataFinalAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirfluxogramas.edtDataFinalAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
    rgpOrdenacao.SetFocus;

end;

procedure TfrmImprimirfluxogramas.btnOKClick(Sender: TObject);
begin
  inherited;
  dtmCadastrofluxogramas.imprimir(edtDataInicialInclusao.Text,edtDataFinaInclusao.Text,edtDataInicialAlteracao.Text,
                               edtDataFinalAlteracao.Text, rgpOrdenacao.ItemIndex );

end;

end.
