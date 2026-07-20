unit fixdbgrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls;

type
  TFixedDBGrid = class(TDBGrid)
  private
    xFixedCols : integer;
  protected
    procedure SetFixedCols(aCol : integer);
  public
    constructor Create(aComponent : TComponent); override;
    function  SelectCell(ACol, ARow: Longint): Boolean; override;
    procedure   DrawCell(aCol, aRow: Longint; Rect: TRect;State: TGridDrawState); override;
    procedure   DrawColumnCell(const Rect: TRect;
                               DataCol: Integer; Column: TColumn;
                               State: TGridDrawState); override;
 published
    property FixedCols read xFixedCols write SetFixedCols;
end;

//procedure Register;

implementation

constructor TFixedDBGrid.Create(aComponent : TComponent);
begin
  inherited;
  Options:=Options-[dgIndicator];
end;

procedure TFixedDBGrid.SetFixedCols(aCol : integer);
begin
  xFixedCols:=aCol;
  Invalidate;
end;


procedure   TFixedDBGrid.DrawColumnCell(const Rect: TRect;
                               DataCol: Integer; Column: TColumn;
                               State: TGridDrawState);
begin
   Options:=Options-[dgIndicator];
   if assigned(DataSource)
   and assigned(DataSource.DataSet)
   and DataSource.DataSet.Active
   then inherited FixedCols:=xFixedCols;


   if (DataCol < xFixedCols)
   or (Row=0)
   or (gdFixed in State) then
   begin
      Canvas.Brush.Color:=FixedColor;
      Canvas.Font.Color:=Font.Color;
   end else
   begin
      if gdSelected in State then
      begin
        Canvas.Brush.Color:=clBlue;
        Canvas.Font.Color:=clWhite;
      end else
      begin
        Canvas.Brush.Color:=Color;
      end;
   end;
   DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure   TFixedDBGrid.DrawCell(aCol, aRow: Longint; Rect: TRect;State: TGridDrawState);
var RA   : TRect;
    S    : string;
    DX   : integer;
    HC   : TColor;
begin
   RA := Rect;
   DX := 0;

   if (aRow = 0)
   and (dgTitles in Options) then
   begin
     RA.Right:=RA.Right+1;
     RA.Bottom:=RA.Bottom+1;
     HC:=Columns[aCol].Title.Color;
     if (dgRowLines in Options)
     and (dgColLines in Options)
       then Frame3D(Canvas,RA,clWhite,clBlack,1);
     S:=Columns[aCol].Title.Caption;
     Canvas.Font:=Columns[aCol].Title.Font;
     case Columns[aCol].Title.Alignment of
     taLeftJustify  : DX:=2;
     taRightJustify : DX:=RA.Right-RA.Left-(Canvas.TextWidth(S)+2);
     taCenter       : DX:=(RA.Right-RA.Left-(Canvas.TextWidth(S))) div 2;
     end;
     Canvas.Brush.Color:=HC;
     Canvas.TextRect(RA,RA.Left+DX,RA.Top+1,S);

   end else inherited DrawCell(aCol,aRow,Rect,State);
end;


function  TFixedDBGrid.SelectCell(ACol, ARow: Longint): Boolean;
begin
  result:=aCol >= xFixedCols;
end;


{

procedure Register;
begin
  RegisterComponents('TecSoft', [TFixedDBGrid]);
end;

}

end.
