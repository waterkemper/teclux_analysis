unit fmrelatorioentradaosp;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, cpnumero, Grids, DBGrids, cpdbgrid,
  cpdata, ExtCtrls, biblio, ctconstantes, DB, Buttons, Windows, ToolWin,
  ComCtrls;

type
  Tfrmrelatorioentradaosp = class(TfrmRelatorioPadrao)
    pnlDatas: TPanel;
    sbnGerar: TSpeedButton;
    edtdatainicial: TEditData;
    edtdatafinal: TEditData;
    pnltotal: TPanel;
    pnlGridOSPs: TPanel;
    dbgentradasosp: TtecDBGrid;
    rgpOrdenacao: TRadioGroup;
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    gbxTotal: TGroupBox;
    edttotal: TEditNumero;
    pnlOrdenacao: TPanel;
    procedure sbnGerarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  protected
    procedure internoImpressao; Override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MontarPesquisa;
    function  ValidarCamposSelecao: Boolean;
  end;

var
  frmrelatorioentradaosp: Tfrmrelatorioentradaosp;

implementation
uses
 dmrelatorioentradaosp;
{$R *.dfm}

{ Tfrmrelatorioentradaosp }

constructor Tfrmrelatorioentradaosp.Create(AOwner: TComponent);
begin
  dtmrelatorioentradaosp := TdtmRelatorioentradaOSP.Create(Self);
  inherited;
  sbnImprimir.Enabled:= False;
  edtDataInicial.Text := DateToStr(UltimoDiaMesPassado(1)+1);
  edtDataFinal.Text   := DateToStr(DataLocal);
  edttotal.Text:= '0,00';
end;

destructor Tfrmrelatorioentradaosp.Destroy;
begin
  dtmRelatorioentradaOSP:= nil;
  inherited;
  frmrelatorioentradaosp:= nil;
end;

procedure Tfrmrelatorioentradaosp.MontarPesquisa;
begin
  with dtmRelatorioentradaOSP do
  begin
    DataInicial:= strtodate(edtdatainicial.Text);
    DataFinal:= strtodate(edtdatafinal.Text);
  end;
end;

procedure Tfrmrelatorioentradaosp.sbnGerarClick(Sender: TObject);
begin
  inherited;
  dtmRelatorioentradaOSP.ParametroOrdenacao:= rgpOrdenacao.ItemIndex;
  if ValidarCamposSelecao then
  begin
    try
      MontarPesquisa;
      dtmRelatorioentradaOSP.GerarRelatorio;
      If dtmRelatorioentradaOSP.qryOSP.RecordCount > 0 then
        sbnImprimir.Enabled:= True; 
    finally
      edttotal.Text:= formatfloat('###,###,##0',dtmRelatorioentradaOSP.quantidadeTotal);
    end;
  end;
end;

function Tfrmrelatorioentradaosp.ValidarCamposSelecao: Boolean;
begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if not Result then
   begin
     MensagemAviso(ctDATAINVALIDA);
     edtDataInicial.SetFocus;
   end;
end;

procedure Tfrmrelatorioentradaosp.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key =VK_F6 then
    sbnGerarClick(Self)
  else if Key =VK_F7 then
    sbnImprimirClick(Self);
end;

procedure Tfrmrelatorioentradaosp.internoImpressao;
begin
  inherited;
  with dtmRelatorioentradaOSP do
  begin
   ParametroOrdenacao:= rgpOrdenacao.ItemIndex;
   DefinirOrdenacao;
   if qryOSP.RecordCount > 0  then
   begin
     DataInicial:= strtodate(edtdatainicial.Text);
     DataFInal  := strtodate(edtdatafinal.Text);
     ImprimirRelatorio;
   end
   else
     MensagemAviso(format(ctNENHUMREGISTROSELECIONADO, ['registro']));
   end;
end;

end.
