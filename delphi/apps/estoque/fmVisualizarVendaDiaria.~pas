unit fmVisualizarVendaDiaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dmconsultacompras, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  StdCtrls, clparametrossistema;

type
  TfrmVisualizarVendaDiaria = class(TForm)
    AdvStringGrid1: TDBAdvGrid;
    DBAdvGrid1: TDBAdvGrid;
    procedure dbgVisaulizarVendaDiariaGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure AdvStringGrid1GetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;

  end;

var
  frmVisualizarVendaDiaria: TfrmVisualizarVendaDiaria;

implementation

{$R *.dfm}

{ TfrmVisualizarVendaDiaria }

constructor TfrmVisualizarVendaDiaria.Create(AOwner: TComponent);
begin
  inherited;
  {
  with dbgVisaulizarVendaDiaria do
  begin
    FloatingFooter.Visible := False;
    FloatingFooter.Visible := True;

    FloatingFooter.ColumnCalc[ColumnByFieldName['totalvendas'].Index] := acSum;
    FloatingFooter.ColumnCalc[ColumnByFieldName['qtcontrato'].Index] := acSum;

    FloatingFooter.ColumnCalc[ColumnByFieldName['totalinternet'].Index] := acSum;
    FloatingFooter.ColumnCalc[ColumnByFieldName['qtinternet'].Index] := acSum;

    FloatingFooter.ColumnCalc[ColumnByFieldName['totalloja'].Index] := acSum;
    FloatingFooter.ColumnCalc[ColumnByFieldName['qtloja'].Index] := acSum;

//    AutoNumberCol(0);
  end;
  }

  with Advstringgrid1 do
  begin

//    FloatingFooter.Visible := False;
//    FloatingFooter.Visible := True;

                              {
    FloatingFooter.ColumnCalc[ColumnByFieldName['mes'].Index] := acNONE;
    FloatingFooter.ColumnCalc[ColumnByFieldName['data'].Index] := acNONE;
    FloatingFooter.ColumnCalc[ColumnByFieldName['produto'].Index] := acNONE;

    FloatingFooter.ColumnCalc[ColumnByFieldName['totalvendas'].Index] := acSum;
    FloatingFooter.ColumnCalc[ColumnByFieldName['qtcontrato'].Index] := acSum;

    FloatingFooter.ColumnCalc[ColumnByFieldName['totalinternet'].Index] := acSum;
    FloatingFooter.ColumnCalc[ColumnByFieldName['qtinternet'].Index] := acSum;

    FloatingFooter.ColumnCalc[ColumnByFieldName['totalloja'].Index] := acSum;
    FloatingFooter.ColumnCalc[ColumnByFieldName['qtloja'].Index] := acSum;

    FloatingFooter.ColumnCalc[ColumnByFieldName['contrato'].Index] := acNONE;
    FloatingFooter.ColumnCalc[ColumnByFieldName['quantidade'].Index] := acSum;

    FloatingFooter.ColumnCalc[ColumnByFieldName['precotabela'].Index] := acNONE;
    FloatingFooter.ColumnCalc[ColumnByFieldName['precovenda'].Index] := acNONE;
    }

  end;

advstringgrid1.SaveFixedCells := false;
Advstringgrid1.Group(Advstringgrid1.ColumnByFieldName['mes'].Index);
//Advstringgrid1.Group(1);
//Advstringgrid1.SubGroup(1);
Advstringgrid1.SubGroup(Advstringgrid1.ColumnByFieldName['data'].Index-1);

Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['totalvendas'].Index-1);
Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['qtcontrato'].Index-1);

Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['totalinternet'].Index-1);
Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['qtinternet'].Index-1);

Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['totalloja'].Index-1);
Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['qtloja'].Index-1);

//Advstringgrid1.GroupSum(Advstringgrid1.ColumnByFieldName['quantidade'].Index-1);
//Advstringgrid1.GroupAvg(Advstringgrid1.ColumnByFieldName['precotabela'].Index-1);
//Advstringgrid1.GroupAvg(Advstringgrid1.ColumnByFieldName['precovenda'].Index-1);

advstringgrid1.Cells[1,0] :='Mês';
advstringgrid1.Cells[2,0] :='Data/Produto';

//Advstringgrid1.ExpandAll;
Advstringgrid1.ContractAll;



end;

procedure TfrmVisualizarVendaDiaria.dbgVisaulizarVendaDiariaGetCellColor(
  Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState;
  ABrush: TBrush; AFont: TFont);
begin
  if aRow = TDBAdvGrid(sender).datasource.dataset.recordcount+1 then
  begin
    if (ACol in [2,3]) then ABrush.color := $00DED9D1;
    if (ACol in [4,5]) then ABrush.color := $00FFE2C6;
    if (ACol in [6,7]) then ABrush.color := $00D2FFD2;
  end;
end;


procedure TfrmVisualizarVendaDiaria.AdvStringGrid1GetCellColor(
  Sender: TObject; ARow, ACol: Integer; AState: TGridDrawState;
  ABrush: TBrush; AFont: TFont);
begin
{
  if aRow = TDBAdvGrid(sender).datasource.dataset.recordcount+1 then
  begin
    if (ACol in [2,3]) then ABrush.color := $00DED9D1;
    if (ACol in [4,5]) then ABrush.color := $00FFE2C6;
    if (ACol in [6,7]) then ABrush.color := $00D2FFD2;
  end;


  if aRow = TDBAdvGrid(sender).datasource.dataset.recordcount+1 then
  begin
    if (ACol in [2,3]) then ABrush.color := $00DED9D1;
    if (ACol in [4,5]) then ABrush.color := $00FFE2C6;
    if (ACol in [6,7]) then ABrush.color := $00D2FFD2;
  end;

}
end;

end.

