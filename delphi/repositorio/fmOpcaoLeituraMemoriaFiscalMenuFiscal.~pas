unit fmOpcaoLeituraMemoriaFiscalMenuFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, StdCtrls, ExtCtrls, ComCtrls, Buttons, ToolWin,
  frselecaoaleatoria, fmnavcontroles, dmtecsoft, dmmenufiscal, DB, ctconstantes,
  frconsulta, frconsultacodigo, cpdbfindcontrols, biblio, cpdata, inifiles,cpnumero;

type
  TfrmOpcaoLeituraMemoriaFiscalMenuFiscal = class(TfrmNavControles)
    rgpFonteDados: TRadioGroup;
    gbxFaixas: TGroupBox;
    lblDe: TLabel;
    lblAte: TLabel;
    pnlCupons: TPanel;
    edtCupomInicial: TEditNumero;
    edtCupomFinal: TEditNumero;
    pnlDatas: TPanel;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    rgpDestino: TRadioGroup;
    btnLMFS: TButton;
    btnLMFC: TButton;
    gbxArquivoSaida: TGroupBox;
    lblArquivoSaida: TLabel;
    procedure rbnOpcaoLeituraMemoriaFiscalClick(Sender: TObject);
    procedure bbnOKClick(Sender: TObject);
    procedure btnLMFCClick(Sender: TObject);
    function InformarArquivoSaida(nome:String =  'retorno.txt'): Boolean;
    procedure btnLMFSClick(Sender: TObject);
    procedure rgpFonteDadosClick(Sender: TObject);
  protected


  private
        FArquivoSaida: String;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;

  end;

var
  frmOpcaoLeituraMemoriaFiscalMenuFiscal: TfrmOpcaoLeituraMemoriaFiscalMenuFiscal;

implementation

{$R *.dfm}

procedure TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.rbnOpcaoLeituraMemoriaFiscalClick(Sender: TObject);
begin
  inherited;
{  case rbnOpcaoLeituraMemoriaFiscal.ItemIndex of
  0 :  gbxContasdoEstoqueParcial.Enabled := false;
  1 :  gbxContasdoEstoqueParcial.Enabled := true;
  end;}

end;




constructor TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.Destroy;
begin
  inherited;
  frmOpcaoLeituraMemoriaFiscalMenuFiscal := nil;
end;




procedure TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.bbnOKClick(Sender: TObject);
begin
  inherited;
    ModalResult := mrOK;
end;



procedure TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.btnLMFCClick(
  Sender: TObject);
begin
  inherited;
  if rgpFonteDados.ItemIndex = 0 then // SELECAO POR PERÍODO
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, False)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, FArquivoSaida, False) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
  if rgpFonteDados.ItemIndex = 1 then // SELECAO POR NUMERO DE REDUCOES ;
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, False)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, FArquivoSaida, False) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
    ShowMessage('Fonte de Dados Incorreta!')
end;

function TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.InformarArquivoSaida(
  nome: String): Boolean;
var
  ArqSaida: TIniFile;
  Arquivo: String;
begin
  Result := true;
  Arquivo := ExtractFilePath(Application.ExeName) + nome;
  if FileExists(Arquivo) then
    DeleteFile(Arquivo);
  ArqSaida := TIniFile.Create(Arquivo);
  try
    try
      ArqSaida.UpdateFile;
    except
      Result := False;
    end;
  finally
    ArqSaida.Free;
  end;
  if Result then
  begin
    FArquivoSaida := Arquivo;
    lblArquivoSaida.Caption := Arquivo;
  end;
end;

procedure TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.btnLMFSClick(
  Sender: TObject);
begin
  inherited;
  if rgpFonteDados.ItemIndex = 0 then // SELECAO POR PERÍODO
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, True)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, FArquivoSaida, True) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
  if rgpFonteDados.ItemIndex = 1 then // SELECAO POR NUMERO DE REDUCOES ;
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, True)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, FArquivoSaida, True) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
    ShowMessage('Fonte de Dados Incorreta!')
end;

procedure TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.rgpFonteDadosClick(
  Sender: TObject);
begin
  gbxFaixas.Caption := rgpFonteDados.Items[rgpFonteDados.ItemIndex] + 's';
  case rgpFonteDados.ItemIndex of
    0 : begin
          pnlDatas.BringToFront;
        end;
    1 : begin
          pnlCupons.BringToFront;
        end;
    2 : begin
          pnlCupons.BringToFront;
        end;
  end;
end;
end.
