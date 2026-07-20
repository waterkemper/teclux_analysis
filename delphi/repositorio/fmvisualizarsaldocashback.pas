unit fmvisualizarsaldocashback;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmvisualizarsaldocashback, fmnavcontroles, Grids, DBGrids, cpdbgrid,
  StdCtrls, cpnumero, Buttons, DB, cpdatasource, fmcadastropadrao,
  ComCtrls, ExtCtrls, zquery, AdvObj, BaseGrid, AdvGrid, DBAdvGrid;

type
  TfrmVisualizarSaldocashback = class(TfrmNavControles)
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dsrcashback_saldos: TtecDataSource;
    DBAdvGridcashback_saldos: TDBAdvGrid;
    GroupBox3: TGroupBox;
    DBEditNumero1: TDBEditNumero;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
                         TabelaSaldocashback, TabelaSaldoAtual: TZDataSet);

    destructor  Destroy; override;

  end;

var
  frmVisualizarSaldocashback: TfrmVisualizarSaldocashback;

implementation

{$R *.dfm}

{ TfrmVisualizarSaldocashback }

{ TfrmVisualizarSaldocashback }


{ TfrmVisualizarSaldocashback }

constructor TfrmVisualizarSaldocashback.Create(AOwner: TComponent;
                                            TabelaSaldocashback,
                                            TabelaSaldoAtual: TZDataset);
begin
  Inherited Create(AOwner);
  dsrcashback_saldos.DataSet := TabelaSaldocashback;
end;


destructor TfrmVisualizarSaldocashback.Destroy;
begin
  inherited;
  frmVisualizarSaldocashback := nil;
end;

end.
