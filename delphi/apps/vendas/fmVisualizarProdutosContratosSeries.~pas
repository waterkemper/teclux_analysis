unit fmvisualizarprodutoscontratosseries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, cpdbgrid, StdCtrls, Buttons, ExtCtrls,
  dmcadastrocontratos, DBCtrls, dbcgrids, Mask, cptexto, biblio, fmajuda,
  ComCtrls, ToolWin, dmBasico, cpdatasource, ctconstantes;

type
  TfrmVisualizarProdutosContratosSeries = class(TfrmAjuda)
    pnlBottom: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    dbgProdutosContratosSeries: TtecDBGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbgProdutosContratosSeriesKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    fExisteProdutosContratosSeriesNaoInformada: TtecFuncaoBoolean;
    fExisteProdutosContratosSeriesDuplicada: TtecFuncaoBoolean;
    { Private declarations }
  protected
{    dtmCadastroContratos : tdtmCadastroContratos;}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; dtm: TdtmBasico; DataSource: TtecDataSource); reintroduce;
    procedure SetDataModulo (Dtm: TdtmBasico; DataSource: TtecDataSource);

    property ExisteProdutosContratosSeriesNaoInformada: TtecFuncaoBoolean read fExisteProdutosContratosSeriesNaoInformada write fExisteProdutosContratosSeriesNaoInformada;
    property ExisteProdutosContratosSeriesDuplicada: TtecFuncaoBoolean read fExisteProdutosContratosSeriesDuplicada write fExisteProdutosContratosSeriesDuplicada;


  end;

var
  frmVisualizarProdutosContratosSeries: TfrmVisualizarProdutosContratosSeries;

implementation

{$R *.dfm}

procedure TfrmVisualizarProdutosContratosSeries.FormCloseQuery(
  Sender: TObject; var CanClose: Boolean);
begin
  CanClose := true;
  if modalresult = mrOK then
  begin
    CanClose := not ExisteProdutosContratosSeriesNaoInformada;
    if not CanClose then
    begin
      MensagemAviso('Informe o número de série do produto.');
      dbgProdutosContratosSeries.SelectedIndex := 3;
      dbgProdutosContratosSeries.setfocus;
    end;

    if canclose then
    begin
      CanClose := not ExisteProdutosContratosSeriesDuplicada;
      if not CanClose then
      begin
        MensagemAviso('Existem números de Série duplicados.');
        dbgProdutosContratosSeries.SelectedIndex := 3;
        dbgProdutosContratosSeries.setfocus;
      end;
    end;
    
  end;
end;

procedure TfrmVisualizarProdutosContratosSeries.FormShow(Sender: TObject);
begin
  dbgProdutosContratosSeries.SelectedIndex := 3;
  self.BringToFront;
end;

procedure TfrmVisualizarProdutosContratosSeries.dbgProdutosContratosSeriesKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
  begin
    dbgProdutosContratosSeries.datasource.dataset.next;
    if dbgProdutosContratosSeries.datasource.dataset.eof then
      btnOK.setfocus;
  end;
end;

constructor TfrmVisualizarProdutosContratosSeries.Create(
  AOwner: TComponent; dtm: TdtmBasico; DataSource: TtecDataSource);
begin
  inherited Create(AOwner);
  SetDataModulo(dtm, DataSource);
  Application.MainForm.SendToBack;
end;

procedure TfrmVisualizarProdutosContratosSeries.SetDataModulo(
  Dtm: TdtmBasico; DataSource: TtecDataSource);
begin
//  dtmCadastroContratos := dtm;
//  dbgProdutosContratosSeries.DataSource := dtmCadastroContratos.dsrProdutosContratosSeries;
  dbgProdutosContratosSeries.DataSource := DataSource;
end;

end.
