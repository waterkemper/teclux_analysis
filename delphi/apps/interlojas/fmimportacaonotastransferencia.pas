
unit fmimportacaonotastransferencia;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, fmajudabt, ComCtrls, Buttons, ExtCtrls, inifiles, ctconstantes,
  ToolWin , FileCtrl;

type
  TfrmImportacaoNotasTransferencia = class(TfrmAjudaBt)
    gbxDiretorioImportacao: TGroupBox;
    sbnDiretorioImportacao: TSpeedButton;
    lblDiretorioImportacao: TLabel;
    sbnImportarDados: TSpeedButton;
    procedure sbnDiretorioImportacaoClick(Sender: TObject);
    procedure sbnImportarDadosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  end;

var
  frmImportacaoNotasTransferencia: TfrmImportacaoNotasTransferencia;

implementation

uses
  dmimportacaonotastransferencia, biblio{Qete,};
  
{$R *.dfm}

constructor TfrmImportacaoNotasTransferencia.Create(AOwner: TComponent);
var
  ArquivoCFG: TIniFile;

begin
  inherited;
  dtmImportacaoNotasTransferencia := TdtmImportacaoNotasTransferencia.Create(Self);

  if FileExists(NomeArquivoCFG) then
  begin
    ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
    try
      lblDiretorioImportacao.Caption := ArquivoCFG.ReadString(ImportacaoNotasTransferenciaSection, 'DirImportaçãoNotasTransferencia'  , '');
    finally
      ArquivoCFG.Free
    end;
  end;

end;

procedure TfrmImportacaoNotasTransferencia.sbnDiretorioImportacaoClick(
  Sender: TObject);
var
  dir: String;
begin
  inherited;
  if SelectDirectory('Selecionar diretório','',dir) then
    lblDiretorioImportacao.Caption := dir
end;

procedure TfrmImportacaoNotasTransferencia.sbnImportarDadosClick(
  Sender: TObject);
var
  ArquivoCFG: TIniFile;
  
begin
  inherited;
  with dtmImportacaoNotasTransferencia do
  begin
    DirImportacao := lblDiretorioImportacao.Caption;
    if ImportarArquivos then
    begin
      if FileExists(NomeArquivoCFG) then
      begin
        ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
        try
          ArquivoCFG.WriteString(ImportacaoNotasTransferenciaSection, 'DirImportaçãoNotasTransferencia', lblDiretorioImportacao.Caption);
        finally
          ArquivoCFG.Free
        end;
      end;
      MensagemAviso('Importacao finalizada com sucesso!')
    end;
  end;
end;

procedure TfrmImportacaoNotasTransferencia.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F5 : sbnImportarDados.Click;
  end;
end;

end.
