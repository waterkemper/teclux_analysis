unit fmVisualizarProdutosObservacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, cpdbgrid, StdCtrls, Buttons, ExtCtrls,
  {dmcadastrocontratos,} DBCtrls, dbcgrids, dmBasico, cpdatasource;

type
  TfrmVisualizarProdutosObservacoes = class(TForm)
    pnlBottom: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    DBCtrlGrid1: TDBCtrlGrid;
    dbCodigoVisual: TDBText;
    DBDescricao: TDBText;
    dbmmoobservacoesvenda: TDBMemo;
    pnlCabecalho: TPanel;
    gbxProduto: TGroupBox;
    gbxObservacoes: TGroupBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
{    dtmCadastroContratos : tdtmCadastroContratos;}

  public
    { Public declarations }

    constructor Create(AOwner: TComponent; dtm: TdtmBasico; DataSource: TtecDataSource); reintroduce;
    procedure  SetDataModulo (Dtm: TdtmBasico; DataSource: TtecDataSource);

  end;

var
  frmVisualizarProdutosObservacoes: TfrmVisualizarProdutosObservacoes;

implementation

{$R *.dfm}

{ TfrmVisualizarProdutosObservacoes }

constructor TfrmVisualizarProdutosObservacoes.Create(AOwner: TComponent;
  dtm: TdtmBasico; DataSource: TtecDataSource);
begin
  inherited Create(AOwner);
  SetDataModulo(dtm, DataSource);
  Application.MainForm.SendToBack;

end;

procedure TfrmVisualizarProdutosObservacoes.SetDataModulo(
  Dtm: TdtmBasico; DataSource: TTecDataSource);
begin
//  dtmCadastroContratos := dtm;
//  DBCtrlGrid1.DataSource := dtmCadastroContratos.dsrProdutosContratosObservacoes;
//  dbCodigoVisual.DataSource := dtmCadastroContratos.dsrProdutosContratosObservacoes;
//  DBDescricao.DataSource := dtmCadastroContratos.dsrProdutosContratosObservacoes;

//  dtmCadastroContratos := dtm;
  DBCtrlGrid1.DataSource := DataSource;
  dbCodigoVisual.DataSource := DataSource;
  DBDescricao.DataSource := DataSource;

end;

procedure TfrmVisualizarProdutosObservacoes.FormShow(Sender: TObject);
begin
  self.BringToFront;
end;

end.
