unit fmimportacaofolhasenior;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, cpdbgrid,
  dmimportacaofolhasenior, fmcadastropadrao, ComCtrls, biblio,
  ctconstantes, clparametrossistema, ToolWin;

type
  TfrmImportacaoFolhaSenior = class(TFrmCadastroPadrao)
    dbgImportacao: TtecDBGrid;
    pnlCabecalho: TPanel;
    lblAnoExercicio: TLabel;
    lblArquivo: TLabel;
    sbnArquivo: TSpeedButton;
    dlgArquivoaImportar: TOpenDialog;
    sbnGerarArquivo: TSpeedButton;
    gbxExercicio: TGroupBox;
    gbxArquivo: TGroupBox;
    gbxNrLote: TGroupBox;
    edtNrLote: TLabel;
    gbxEstiloImportacao: TGroupBox;
    cbEstiloImportacao: TComboBox;
    procedure sbnArquivoClick(Sender: TObject);
    procedure sbnGerarArquivoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AlterarEstadoBotoes; override;
    function  InternoGravar: Boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmImportacaoFolhaSenior: TfrmImportacaoFolhaSenior;

implementation

{$R *.dfm}

procedure TfrmImportacaoFolhaSenior.AlterarEstadoBotoes;
begin
  inherited;
  if not dtmImportacaoFolhaSenior.qryLancamentos.IsEmpty and
    not dtmImportacaoFolhaSenior.fExisteErro then
    sbnSalvar.Enabled := true
  else
    sbnSalvar.Enabled := false;
end;

constructor TfrmImportacaoFolhaSenior.Create(AOwner: TComponent);
begin
  dtmImportacaoFolhaSenior := TdtmImportacaoFolhaSenior.Create(Self);
  inherited;
  lblArquivo.Caption := ExtractFilePath(Application.ExeName) + 'ArquivoImportacao.txt';
  lblAnoExercicio.Caption := inttostr(ParSistema.EXERCICIOCONTABILIDADE);
  DataSet := dtmImportacaoFolhaSenior.qryLancamentos;
end;

function TfrmImportacaoFolhaSenior.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    if dtmImportacaoFolhaSenior.GravarLancamentos then
    begin
      edtNrLote.Caption := inttostr(dtmImportacaoFolhaSenior.NrLote);
      MensagemAviso(ctIMPORTACAOSUCESSO);
    end;
end;

procedure TfrmImportacaoFolhaSenior.sbnArquivoClick(Sender: TObject);
begin
  if dlgArquivoaImportar.Execute then
   lblarquivo.Caption:=trim(dlgArquivoaImportar.FileName);
end;

procedure TfrmImportacaoFolhaSenior.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  if FileExists(lblArquivo.caption) then
  begin
    dtmImportacaoFolhaSenior.importarArquivo(lblArquivo.caption, cbEstiloImportacao.ItemIndex);
    if not dtmImportacaoFolhaSenior.fExisteErro then
      edtNrLote.Caption := inttostr(dtmImportacaoFolhaSenior.NrLote)
    else
      edtNrLote.Caption := 'ERRO';  
    AlterarEstadoBotoes;
  end
  else
    MensagemErro(format(ctARQUIVONAOENCONTRADO,[lblarquivo.caption]));

end;

end.
