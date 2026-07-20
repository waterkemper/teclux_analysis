unit fmgerargiaemarquivo;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, Windows,
  //Repositorio
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, CheckLst, Mask,
  Grids, DBGrids, cpdbgrid, ToolWin;

type
  TfrmGerarGIAEmArquivo = class(TfrmAjudaBt)
    sbnGerarArquivo: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    lblArquivo1: TLabel;
    lblArquivo: TLabel;
    sbnArquivo: TSpeedButton;
    lblData: TLabel;
    edtPeriodo: TMaskEdit;
    lblFiliais: TLabel;
    rgpEspelho: TRadioGroup;
    dbgFiliais: TtecDBGrid;
    procedure sbnGerarArquivoClick(Sender: TObject);
  protected
    procedure GerarArquivo;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmGerarGIAEmArquivo: TfrmGerarGIAEmArquivo;

implementation

uses
  //CLX
  {Qete,}
  //Biblio
  ctconstantes, biblio,
  //Projeto
  dmgerargiaemarquivo;

{$R *.dfm}

{ TfrmGerarGIAEmArquivo }

constructor TfrmGerarGIAEmArquivo.Create(AOwner: TComponent);
begin
  inherited;
  dtmGerarGIAEmArquivo := TdtmGerarGIAEmArquivo.Create(Self);
  dtmGerarGIAEmArquivo.Abre(ctLIVTabelaConsultaFiliais);
end;

procedure TfrmGerarGIAEmArquivo.GerarArquivo;
begin
  try
    StrToDate('01/'+ edtPeriodo.Text);
    dtmGerarGIAEmArquivo.GerarArquivo(lblArquivo.Caption, edtPeriodo.Text);
  except
    on E:EConvertError do
      MensagemErro(ctDATAGIAINVALIDA);
  end;
end;

procedure TfrmGerarGIAEmArquivo.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = []) and (Key = VK_F6) then
    GerarArquivo
end;

procedure TfrmGerarGIAEmArquivo.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  GerarArquivo
end;

end.
