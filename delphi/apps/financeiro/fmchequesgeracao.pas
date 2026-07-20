unit fmchequesgeracao;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, Windows, DateUtils,
  // Componentes
  cpdata, cpnumero,
  // Biblio
  ctconstantes, biblio,
  // Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  // Terceiros
  ZQuery, FR_Class, FR_DSet, FR_DBSet,
  // Projeto
  dmchequesgeracao, cpdbradiogroup, ComCtrls, ToolWin;

type
  TfrmChequesGeracao = class(TfrmAjudaBt)
    gbxPeriodoVencimento: TGroupBox;
    lblVencimentoTermio: TLabel;
    edttermioPeriodo: TEditData;
    edtInicioPeriodo: TEditData;
    lblVencimentoInicio: TLabel;
    gbxRemessa: TGroupBox;
    lblRemessaData: TLabel;
    edtRemessaData: TEditData;
    lblRemessaNumero: TLabel;
    edNumeroRemessa: TEditNumero;
    sdgGeracao: TSaveDialog;
    pnlFundoJanela: TPanel;
    rgpTipoCheque: TtecDBRadioGroup;
    rbnTodos: TRadioButton;
    rbnVista: TRadioButton;
    rbnPrazo: TRadioButton;
    sbnGerarArquivo: TSpeedButton;
    procedure edttermioPeriodoEnter(Sender: TObject);
    procedure sbnGerarArquivoClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MontaPesquisa;
  public
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

var
  frmChequesGeracao: TfrmChequesGeracao;

implementation

{$R *.dfm}

{ TfrmChequesGeracao }

var
  NomeArquivo : String;

constructor TfrmChequesGeracao.Create(Aowner: Tcomponent);
begin
  inherited;
  dtmChequesGeracao := TdtmChequesGeracao.Create(Self);
  dtmChequesGeracao.Abre(ctChequesVencimentos);
end;

destructor TfrmChequesGeracao.Destroy;
begin
  dtmChequesGeracao.Fecha(ctChequesVencimentos);
  inherited;
  frmChequesGeracao := nil;
end;

procedure TfrmChequesGeracao.edttermioPeriodoEnter(Sender: TObject);
begin
  inherited;
  if (Trim(edtInicioPeriodo.Text) <> '') and edtInicioPeriodo.Criticar(False) then
    edttermioPeriodo.Minimo:= DaysBetween(Date,StrToDate(edtInicioPeriodo.Text));
end;

procedure TfrmChequesGeracao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnGerarArquivo.Click;
  end;
  inherited;
end;

procedure TfrmChequesGeracao.MontaPesquisa;
var
  TpCh: Integer;
begin
  if rbnTodos.Checked then
    TpCh := 0
  else if rbnVista.Checked then
    TpCh := 1
  else
    TpCh := 2;
  dtmChequesGeracao.Fecha(ctChequesDetalhe);
  dtmChequesGeracao.porTipoCheque(TpCh);
  dtmChequesGeracao.porDataRemessa(edtRemessaData.Text);
  dtmChequesGeracao.porRemessa(edNumeroRemessa.Text);
  dtmChequesGeracao.porPeriodo(edtInicioPeriodo.Text,edtTermioPeriodo.Text);
end;


procedure TfrmChequesGeracao.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  if (ActiveControl is TEditData) and TEditData(ActiveControl).Criticar(True) then begin
    MontaPesquisa;
    if dtmChequesGeracao.ExisteCheque then begin
      if sdgGeracao.Execute then begin
        NomeArquivo:= sdgGeracao.Files.CommaText;
        dtmChequesGeracao.MontaArquivoMagnetico(NomeArquivo);
      end;
    end else
      MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO, ['registro']));
  end
end;

end.
