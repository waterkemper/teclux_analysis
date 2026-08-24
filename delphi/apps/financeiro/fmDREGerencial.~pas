unit fmDREGerencial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, cppagecontrol,
  frintervalodatas, frintervalodatasparametros, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, dmDREGerencial, biblio, ctconstantes, Menus,
  AdvMenus, tmsAdvGridExcel, AsgFindDialog, tmsUFlxFormats{, tmsiwUFlxFormats};

type
  TfrmDREGerencial = class(TfrmAjudaBt)
    pgcDREGerencial: TtecPageControl;
    tstParametrosDREGerencial: TTabSheet;
    tstDadosDREGerencial: TTabSheet;
    fraIntervaloDatasParametros1: TfraIntervaloDatasParametros;
    dbgDREGerencial: TDBAdvGrid;
    sbnGerar: TSpeedButton;
    Panel1: TPanel;
    AdvGridFindDialog1: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    procedure sbnGerarClick(Sender: TObject);
    procedure dbgDREGerencialGetFloatFormat(Sender: TObject; ACol,
      ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
    procedure dbgDREGerencialGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure AdvGridExcelIO1CellFormat(Sender: TAdvStringGrid;
      const GridCol, GridRow, XlsCol, XlsRow: Integer;
      const Value: WideString; var Format: TFlxFormat);

  private
    { Private declarations }
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure KeyDown(var Key: Word; Shift: TShiftState);override;

  end;

var
  frmDREGerencial: TfrmDREGerencial;

implementation

{$R *.dfm}

{ TForm2 }

constructor TfrmDREGerencial.Create(AOwner: TComponent);
begin
  inherited;
  dtmDREGerencial := TdtmDREGerencial.Create(Self);
  self.visible := true;
  fraIntervaloDatasParametros1.dbcFormaSelecao.itemindex := 3;
  fraIntervaloDatasParametros1.dbcFormaSelecaoChange(fraIntervaloDatasParametros1.dbcFormaSelecao);

end;

destructor TfrmDREGerencial.Destroy;
begin

  inherited;
end;

procedure TfrmDREGerencial.KeyDown(var Key: Word; Shift: TShiftState);
begin

  case Key of
       VK_F6 : if sbnGerar.Enabled then sbnGerarClick(Self);
       VK_X : if (Shift = [ssCtrl]) then  ExportarExcel1Click(dbgDREGerencial);
  end;

  inherited;

end;

procedure TfrmDREGerencial.sbnGerarClick(Sender: TObject);
begin
  inherited;

  if fraIntervaloDatasParametros1.edtDataInicial.text = '' then
  begin
    MensagemAviso('Informe a data inicial.');
    fraIntervaloDatasParametros1.edtDataInicial.setfocus;
  end
  else
  if fraIntervaloDatasParametros1.edtDataFinal.text = '' then
  begin
    MensagemAviso('Informe a data final.');
    fraIntervaloDatasParametros1.edtDataFinal.SetFocus;
  end
  else
  begin
    dtmDREGerencial.abrirConsulta(
      fraIntervaloDatasParametros1.edtDataInicial.text,
      fraIntervaloDatasParametros1.edtDataFinal.text);
   if dtmDREGerencial.qryDREGerencial.recordcount > 0 then
   begin
     dbgDREGerencial.ColumnByFieldName['tipoconta'].Width := 0;
{     dbgDREGerencial.ColumnByFieldName['totalizar'].Width := 0;}

     pgcDREGerencial.ActivePage := tstDadosDREGerencial;
   end
   else
     MensagemAviso(ctNENHUMREGISTROENCONTRADO);
  end;

end;

procedure TfrmDREGerencial.dbgDREGerencialGetFloatFormat(Sender: TObject;
  ACol, ARow: Integer; var IsFloat: Boolean; var FloatFormat: String);
begin
  inherited;
  FloatFormat := '%.2n';
end;

procedure TfrmDREGerencial.dbgDREGerencialGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
  inherited;
  if (TDBAdvGrid(Sender).Cells[2,Arow] = 'T') or
     (TDBAdvGrid(Sender).Cells[2,Arow] = 'RT') or
     (TDBAdvGrid(Sender).Cells[2,Arow] = 'DT') then
  begin
    AFont.style := [fsBold];

    if (TDBAdvGrid(Sender).Cells[2,Arow] = 'RT') then
      ABrush.color := clSilver
    else
    if (TDBAdvGrid(Sender).Cells[2,Arow] = 'DT') then
      ABrush.color := $00ADDAC2;

  end
  else
  begin
    AFont.style := [];
  end;

end;

procedure TfrmDREGerencial.Pesquizar1Click(Sender: TObject);
begin
  inherited;
   AdvGridFindDialog1.Execute;
end;

procedure TfrmDREGerencial.ExportarExcel1Click(Sender: TObject);
begin
  inherited;
  AdvGridExcelIO1.XLSExport(ExtractFilePath(Application.ExeName) + 'Saidas\DRE_Gerencial.xls', 'DRE Gerencial');
end;


procedure TfrmDREGerencial.AdvGridExcelIO1CellFormat(
  Sender: TAdvStringGrid; const GridCol, GridRow, XlsCol, XlsRow: Integer;
  const Value: WideString; var Format: TFlxFormat);
begin
  inherited;
  if (GridCol >= 3) then
    Format.Format:='###,###,##0.00';

end;

end.
