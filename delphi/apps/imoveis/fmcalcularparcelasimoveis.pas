unit fmcalcularparcelasimoveis;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs, {Qete,}
  StdCtrls, fmnavcontroles, frconsulta, frconsultacodigo, cptexto, cpdata,
  cpnumero, cpeditioncontrolvalidation, Buttons, Biblio, ctconstantes,
  dmcontratosimoveis;

type
  TfrmCalcularParcelasImoveis = class(TfrmNavControles)
    gbxParametros: TGroupBox;
    gbxNrParcelas: TGroupBox;
    edtNrParcelas: TEditNumero;
    gbxVencto: TGroupBox;
    edtVencimento: TEditData;
    gbxIntervalo: TGroupBox;
    Label1: TLabel;
    edtIntervalo: TEditNumero;
    gbxTipoParcela: TGroupBox;
    edtTipoParcela: TEditTexto;
    gbxDataBase: TGroupBox;
    edtDataBase: TEditData;
    gbxTaxaJuros: TGroupBox;
    edttaxaJuros: TEditNumero;
    gbxMoeda: TGroupBox;
    fraConsultaMOeda: TfraConsultaCodigo;
    sbnGerarParcelas: TSpeedButton;
    ecvValidacao: TtecEditionControlValidation;
    gbxValorParcela: TGroupBox;
    edtValorParcela: TEditNumero;
    lblPercJuros: TLabel;
    gbxTipoJuros: TGroupBox;
    ckbJurosCompostos: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure sbnGerarParcelasClick(Sender: TObject);
    procedure edtTipoParcelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FTaxaJuros: Real;
    Fintervalo: Integer;
    FNroParcela: Integer;
    FTipoParcela: String;
    FMoeda: String;
    FDataJuros: TDateTime;
    FVencimento: TDateTime;
    FDataBase: TDateTime;
    FValorParcela: Real;
    FJurosCompostos: Boolean;
    { Private declarations }
  protected
    procedure LimparCampos;
    procedure PreencherDataBase;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    { Public declarations }
    property TipoParcela : String read FTipoParcela write FTipoParcela;
    property NroParcela : Integer read FNroParcela write FNroParcela;
    property Vencimento : TDateTime read FVencimento write FVencimento;
    property Intervalo : Integer read Fintervalo write FIntervalo;
    property DataBase : TDateTime read FDataBase write FDatabase;
    property Moeda : String read FMoeda write FMoeda;
    property TaxaJuros : Real read FTaxaJuros write FTaxaJuros;
    property JurosCompostos : Boolean  read FJurosCompostos write FJurosCompostos;
    property DataJuros : TDateTime read FDataJuros write FDataJuros;
    property ValorParcela : Real read FValorParcela write FValorParcela;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCalcularParcelasImoveis: TfrmCalcularParcelasImoveis;
  ControleAtivo: TWinControl;
implementation

uses DB;

{$R *.dfm}

{ TfrmCalcularParcelas }

constructor TfrmCalcularParcelasImoveis.Create(AOwner: TComponent);
begin
  inherited;
  fraConsultaMOeda.TipoPesquisa:= pesMOEDAS;
//  fraConsultaMOeda.OnFound:= PreencherDataBase;
  with dtmContratosImoveis do
  begin
    if qryContratoshabite_se.AsDateTime > 0 then
    begin
      if qryContratosindexadoraposhabitese.AsString <> '' then
      begin
        fraConsultaMOeda.edfCodigo.Text:= qryContratosindexadoraposhabitese.AsString;
        fraConsultaMOeda.edfCodigo.Exist;
        if qryContratosjuros.AsFloat > 0 then
          edttaxaJuros.Text:= FormatFloat('##0.00', qryContratosjuros.AsFloat);
      end;
    end
    else
    begin
      if qryContratosindexadoratehabitese.AsString <> '' then
      begin
        fraConsultaMOeda.edfCodigo.Text:= qryContratosindexadoratehabitese.AsString;
        fraConsultaMOeda.edfCodigo.Exist;
      end;
    end;
    if qryContratosdatabase.AsString <> '' then
      edtDataBase.Text := FormatDateTime('DD/MM/YYYY',qryContratosdatabase.AsdatEtime);
    ckbJurosCompostos.Checked:= qryContratosjuroscompostos.AsBoolean;
  end;
  edtVencimento.Minimo:= dtmContratosImoveis.qryContratosdata.ASvariant;
end;

destructor TfrmCalcularParcelasImoveis.Destroy;
begin
  frmCalcularParcelasIMoveis:= nil;
  inherited;
end;

procedure TfrmCalcularParcelasImoveis.FormShow(Sender: TObject);
begin
  inherited;
  FTipoParcela := '';
  FNroParcela  := 0;
  FVencimento  := 0;
  FIntervalo   := 0;
  FDatabase    := 0;
  FMoeda       := '';
  FTaxaJuros   := 0;
  FDataJuros   := 0;
  FValorParcela:= 0;
  edtTipoParcela.SetFocus;
  edtTipoParcela.SelectAll;
end;

procedure TfrmCalcularParcelasImoveis.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F11: sbnGerarParcelas.Click;
  end;
end;

procedure TfrmCalcularParcelasImoveis.LimparCampos;
begin
    edtNrParcelas.Clear;
    edtVencimento.Clear;
    edtIntervalo.Clear;
    edtTipoParcela.Clear;
    edtDataBase.Clear;
    edttaxaJuros.Clear;
    edtValorParcela.Clear;
    fraConsultaMOeda.edfCodigo.Clear;
    fraConsultaMOeda.edfCodigo.Exist;
end;

procedure TfrmCalcularParcelasImoveis.PreencherDataBase;
begin
  edtDataBase.Text:= DateToStr(Date);
end;

procedure TfrmCalcularParcelasImoveis.sbnGerarParcelasClick(Sender: TObject);
begin
  inherited;
  if edtIntervalo.Text = '' then
    edtIntervalo.Text := '0';
  if ecvValidacao.Verify(gbxParametros, ControleAtivo) then
  begin
    FTipoParcela := edtTipoParcela.Text;
    FVencimento  := strtodate(edtVencimento.Text);
    FNroParcela  := StrToInt(edtNrParcelas.Text);
    FValorParcela:= StrToCurr(edtValorParcela.ValorSemFormatacao);
    Fintervalo   := strtoint(edtIntervalo.Text);
    if (FNroParcela > 1) and (Fintervalo = 0) then
    begin
      MensagemAviso('Informar o nº de dias entre as parcelas');
      edtIntervalo.SetFocus;
      edtIntervalo.SelectAll;
    end
    else
    begin
      if ckbJurosCompostos.Checked then
        FJurosCompostos:= True
      else
        FJurosCompostos:= False;
      if edttaxaJuros.Text <> '' then
        FTaxaJuros:= StrToFloat(edttaxaJuros.Text)
      else
        FTaxaJuros:= 0;
      if fraConsultaMOeda.edfCodigo.Text <> '' then
      begin
        FMoeda := fraConsultaMOeda.edfCodigo.Text;
        FDataBase:= strtodate(edtDataBase.Text);
      end
      else
      begin
        FMoeda := '';
        DataBase := 0;
      end;
      LimparCampos;
      ModalResult:= mrOk;
    end;
  end;
end;

procedure TfrmCalcularParcelasImoveis.edtTipoParcelaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key >= 32) and (Key <= 255) then
    if not isalpha(char(key)) then
      key := 0;
end;

end.
