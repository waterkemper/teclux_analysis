unit fmexportacaoprodutos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, ctconstantes,
  StdCtrls, fmajudabt, cpdata, ComCtrls, Buttons, ExtCtrls, Windows, IniFiles,
  ToolWin, FileCtrl;

type
  TfrmExportacaoProdutos = class(TfrmAjudaBt)
    gbxPeriodo: TGroupBox;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    gbxDiretorioExportacao: TGroupBox;
    sbnDiretorioExportacao: TSpeedButton;
    edtDiretorioExportacao: TEdit;
    sbnGerarArquivos: TSpeedButton;
    ckbExportarColunadePrecos: TCheckBox;
    lblA: TLabel;
    procedure sbnDiretorioExportacaoClick(Sender: TObject);
    procedure sbnGerarArquivosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  frmExportacaoProdutos: TfrmExportacaoProdutos;

implementation

uses
  dmexportacaoprodutos, biblio;

{$R *.dfm}

constructor TfrmExportacaoProdutos.Create(AOwner: TComponent);
var
  ArquivoCFG: TIniFile;
begin
  inherited;
  dtmExportacaoProdutos  := TdtmExportacaoProdutos.Create(Self);
//  edtPeriodoInicial.Text := DateToStr(DataLocal-30);
  edtPeriodoInicial.Text := '01/01/2006';
  edtPeriodoFinal.Text   := DateToStr(DataLocal);

  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
      edtDiretorioExportacao.Text := ArquivoCFG.ReadString(ExportacaoProdutosSection, 'DirExportaçãoProdutos'  , '');
    finally
      ArquivoCFG.Free
    end;
  end;

end;

procedure TfrmExportacaoProdutos.sbnDiretorioExportacaoClick(
  Sender: TObject);
var
  dir: String;
begin
  inherited;
  if SelectDirectory('Selecionar diretório','',dir) then
    edtDiretorioExportacao.Text := dir
end;

procedure TfrmExportacaoProdutos.sbnGerarArquivosClick(Sender: TObject);
var
  ArquivoCFG: TIniFile;
begin
  inherited;
  if dtmExportacaoProdutos.GerarExportacao(edtPeriodoInicial.Text,edtPeriodoFinal.Text,edtDiretorioExportacao.Text, ckbExportarColunadePrecos.Checked) then
  begin
    if FileExists(NomeArquivoCFG) then
    begin
      ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
      try
        ArquivoCFG.WriteString(ExportacaoProdutosSection, 'DirExportaçãoProdutos', edtDiretorioExportacao.Text);
      finally
        ArquivoCFG.Free
      end;
    end;
    MensagemAviso('Arquivos gerados com sucesso na pasta "' + edtDiretorioExportacao.Text + '"')
  end
  else
    MensagemAviso('Ocorreu um erro na geração dos arquivos')
end;

procedure TfrmExportacaoProdutos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F6 : sbnGerarArquivos.Click;
  end;
end;

end.
