unit fmImprimirOperacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cpdata, fmnavcontroles, ExtCtrls, Buttons, dmcadastrooperacoes,
  frconsulta, frconsultacodigo, ctconstantes;

type
  TfrmImprimirOperacoes =  class(TfrmNavControles)
    gbxInclusoes: TGroupBox;
    lblACadastro: TLabel;
    edtDataInicialInclusao: TEditData;
    edtDataFinaInclusao: TEditData;
    gbxAlteracoes: TGroupBox;
    Label1: TLabel;
    edtDataInicialAlteracao: TEditData;
    edtDataFinalAlteracao: TEditData;
    gbxListar: TGroupBox;
    ckbListarSetupSim: TCheckBox;
    bbnCancelar: TBitBtn;
    rgpRelatorio: TRadioGroup;
    btnOK: TBitBtn;
    lblRelatorio: TStaticText;
    lblSetup: TStaticText;
    lblPlano: TStaticText;
    lblBloqueia: TStaticText;
    ckbListarPlanoSim: TCheckBox;
    ckbListarBloqueioSim: TCheckBox;
    ckbListarSetupNao: TCheckBox;
    ckbListarPlanoNao: TCheckBox;
    ckbListarBloqueioNao: TCheckBox;
    gbxFluxograma: TGroupBox;
    fraConsultaFluxograma: TfraConsultaCodigo;
    ckbSomenteOperacaoAtual: TCheckBox;
    procedure bbnCancelarClick(Sender: TObject);
    procedure edtDataInicialInclusaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataFinaInclusaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataInicialAlteracaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
        procedure ckbListarSetupSimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure ckbListarSetupSimClick(Sender: TObject);
    procedure ckbListarSetupNaoClick(Sender: TObject);
    procedure ckbListarPlanoSimClick(Sender: TObject);
    procedure ckbListarPlanoNaoClick(Sender: TObject);
    procedure ckbListarBloqueioSimClick(Sender: TObject);
    procedure ckbListarBloqueioNaoClick(Sender: TObject);
    procedure ckbSomenteOperacaoAtualClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmImprimirOperacoes: TfrmImprimirOperacoes;

implementation

{$R *.dfm}

destructor TfrmImprimirOperacoes.Destroy;
begin
  inherited;
  frmImprimirOperacoes := nil;

end;

procedure TfrmImprimirOperacoes.bbnCancelarClick(Sender: TObject);
begin
  inherited;
   close;
end;

procedure TfrmImprimirOperacoes.edtDataInicialInclusaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key =VK_return then
  begin
    edtDataFinaInclusao.SetFocus;
    edtDataFinaInclusao.SelectAll;
  end;

end;

procedure TfrmImprimirOperacoes.edtDataFinaInclusaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataInicialAlteracao.SetFocus;
    edtDataInicialAlteracao.SelectAll;
  end;
end;

procedure TfrmImprimirOperacoes.edtDataInicialAlteracaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
  begin
    edtDataFinalAlteracao.SetFocus;
    edtDataFinalAlteracao.SelectAll;
  end;
end;


procedure TfrmImprimirOperacoes.ckbListarSetupSimKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key =VK_return then
    rgpRelatorio.SetFocus;

end;

procedure TfrmImprimirOperacoes.btnOKClick(Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.imprimir(edtDataInicialInclusao.Text,edtDataFinaInclusao.Text,edtDataInicialAlteracao.Text,
                               edtDataFinalAlteracao.Text, ckbListarSetupSim.Checked, ckbListarSetupNao.Checked,
                               ckbListarPlanoSim.Checked, ckbListarPlanoNao.Checked, ckbListarBloqueioSim.Checked,
                               ckbListarBloqueioNao.Checked, ckbSomenteOperacaoAtual.Checked,
                               rgpRelatorio.ItemIndex, fraConsultaFluxograma.edfCodigo.text);
end;

procedure TfrmImprimirOperacoes.ckbListarSetupSimClick(Sender: TObject);
begin
  inherited;
  if ckbListarSetupSim.Checked then
  ckbListarSetupNao.Checked := False
end;

procedure TfrmImprimirOperacoes.ckbListarSetupNaoClick(Sender: TObject);
begin
  inherited;
  if ckbListarSetupNao.Checked then
  ckbListarSetupSim.Checked := False
end;

procedure TfrmImprimirOperacoes.ckbListarPlanoSimClick(Sender: TObject);
begin
  inherited;
  if ckbListarPlanoSim.Checked then
  ckbListarPlanoNao.Checked := False
end;

procedure TfrmImprimirOperacoes.ckbListarPlanoNaoClick(Sender: TObject);
begin
  inherited;
  if ckbListarPlanoNao.Checked then
  ckbListarPlanoSim.Checked := False
end;

procedure TfrmImprimirOperacoes.ckbListarBloqueioSimClick(Sender: TObject);
begin
  inherited;
  if ckbListarBloqueioSim.Checked then
  ckbListarBloqueioNao.Checked := False
end;

procedure TfrmImprimirOperacoes.ckbListarBloqueioNaoClick(Sender: TObject);
begin
  inherited;
  if ckbListarBloqueioNao.Checked then
  ckbListarBloqueioSim.Checked := False
end;

constructor TfrmImprimirOperacoes.Create(AOwner: TComponent);
begin
  inherited;
  fraConsultaFluxograma.TipoPesquisa := pesFLUXOGRAMA;
end;

procedure TfrmImprimirOperacoes.ckbSomenteOperacaoAtualClick(
  Sender: TObject);
begin
  inherited;
  if ckbSomenteOperacaoAtual.Checked then
    Begin
      gbxInclusoes.Enabled  := False;
      gbxAlteracoes.Enabled := False;
      gbxListar.Enabled     := False;
      gbxFluxograma.Enabled := False;
      edtDataInicialInclusao.Enabled  := False;
      edtDataFinaInclusao.Enabled  := False;
      edtDataInicialAlteracao.Enabled  := False;
      edtDataFinalAlteracao.Enabled  := False;
      lblSetup.Enabled  := False;
      lblPlano.Enabled  := False;
      lblBloqueia.Enabled  := False;
    end
  else
    Begin
      gbxInclusoes.Enabled  := True;
      gbxAlteracoes.Enabled := True;
      gbxListar.Enabled     := True;
      gbxFluxograma.Enabled := True;
      edtDataInicialInclusao.Enabled  := True;
      edtDataFinaInclusao.Enabled  := True;
      edtDataInicialAlteracao.Enabled  := True;
      edtDataFinalAlteracao.Enabled  := True;
      lblSetup.Enabled  := True;
      lblPlano.Enabled  := True;
      lblBloqueia.Enabled  := True;
    end;
end;

end.
