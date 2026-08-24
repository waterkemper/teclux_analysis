unit fmvisualizarsaldotroca;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmvisualizarsaldotroca, fmnavcontroles, Grids, DBGrids, cpdbgrid,
  StdCtrls, cpnumero, Buttons, DB, cpdatasource, fmcadastropadrao,
  ComCtrls, ExtCtrls, zquery;

type
  TfrmVisualizarSaldoTroca = class(TfrmNavControles)
    dbgSaldoTroca: TtecDBGrid;
    lblSaldoAtual: TLabel;
    edtSaldoAtual: TDBEditNumero;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dsrSaldoTroca: TtecDataSource;
    dsrSaldoAtual: TtecDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
                         TabelaSaldoTroca, TabelaSaldoAtual: TZDataSet);

    destructor  Destroy; override;

  end;

var
  frmVisualizarSaldoTroca: TfrmVisualizarSaldoTroca;

implementation

{$R *.dfm}

{ TfrmVisualizarSaldoTroca }

{ TfrmVisualizarSaldoTroca }


{ TfrmVisualizarSaldoTroca }

constructor TfrmVisualizarSaldoTroca.Create(AOwner: TComponent;
                                            TabelaSaldoTroca,
                                            TabelaSaldoAtual: TZDataset);
begin
  Inherited Create(AOwner);
  dsrSaldoTroca.DataSet := TabelaSaldoTroca;
  dsrSaldoAtual.DataSet := TabelaSaldoAtual;
end;


destructor TfrmVisualizarSaldoTroca.Destroy;
begin
  inherited;
  frmVisualizarSaldoTroca := nil;
end;

end.
