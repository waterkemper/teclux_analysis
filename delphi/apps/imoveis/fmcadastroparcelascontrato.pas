unit fmcadastroparcelascontrato;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls,
  dmcontratosimoveis, cpdbdata, cpnumero, Mask, DBCtrls, cptexto,
  frconsulta, frconsultacodigo, Biblio, ctconstantes, cpdbmemo, ToolWin;

type
  TfrmCadastroParcelasContrato = class(TFrmCadastroPadrao)
    gbxDados: TGroupBox;
    gbxTipoParcela: TGroupBox;
    gbxNrParcelas: TGroupBox;
    gbxVencto: TGroupBox;
    gbxDataBase: TGroupBox;
    gbxTaxaJuros: TGroupBox;
    gbxMoeda: TGroupBox;
    fraConsultaMOeda: TfraConsultaCodigo;
    gbxValorParcela: TGroupBox;
    edtTipo: TDBEditTexto;
    edtNroParcelas: TDBEditNumero;
    edtValor: TDBEditNumero;
    edtJurosValor: TDBEditNumero;
    edtVencto: TDBEditData;
    edtDataBase: TDBEditData;
    gbxObserVencimento: TGroupBox;
    mmoobsvencto: TtecDBMemo;
    gbxTipoJuros: TGroupBox;
    lblPercJuros: TLabel;
    ckbJurosCompostos: TDBCheckBox;
    procedure edtTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  protected
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    procedure PreencherDataBase;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroParcelasContrato: TfrmCadastroParcelasContrato;

implementation

uses DB;

{$R *.dfm}

{ TfrmCadastroParcelasContrato }

constructor TfrmCadastroParcelasContrato.Create(AOwner: TComponent);
begin
  inherited;
  DataSet:= dtmContratosImoveis.qryParcelasContrato;
  fraConsultaMOeda.TipoPesquisa:= pesMOEDAS;
end;

destructor TfrmCadastroParcelasContrato.Destroy;
begin
  inherited;
  frmCadastroParcelasContrato:= nil;
end;


function TfrmCadastroParcelasContrato.InternoExcluir: Boolean;
begin
  if (dtmContratosImoveis.qryParcelasContratodatapagto.AsString = '') then
  begin
    dtmContratosImoveis.ExcluirParcelasContrato(False);
    Result:= True;
  end
  else
    MensagemAviso('Não foi possível editar a parcela.'+#10#13+
                  '- A parcela já foi quitada.');
end;

function TfrmCadastroParcelasContrato.InternoGravar: Boolean;
begin
  if ((edtTipo.Text = '')        or
      (edtNroParcelas.Text = '') or
      (edtValor.Text = '')       or
      (edtVencto.Text = ''))    then
  begin
    MensagemAviso(ctVALIDARCONTROLES);
    Result:= False
  end
  else
  begin
    dtmContratosImoveis.GravarParcelaContrato;
    Result:= True;
    edtTipo.SetFocus;
  end;
end;

function TfrmCadastroParcelasContrato.InternoIncluir: Boolean;
begin
  dtmContratosImoveis.IncluirParcela;
end;

procedure TfrmCadastroParcelasContrato.PreencherDataBase;
begin
  dtmContratosImoveis.qryParcelasContratodatabase.AsDateTime:= Date;
end;

procedure TfrmCadastroParcelasContrato.edtTipoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key >= 32) and (Key <= 255) then
    if not isalpha(char(key)) then
      key := 0;

end;

end.
