unit cppagecontrol;

interface

uses
   Types, Classes, Graphics, ComCtrls, Controls;

type
   TtecPageControl = class(TPageControl)
  protected
    //function DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean): Boolean; override;
    procedure DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean); override;
    constructor Create(AOwner: TComponent); override;
{    procedure Paint; override; CLX_P_VCL }
 end;

implementation

{ TtecPageControl }


//function TtecPageControl.DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean): Boolean;
constructor TtecPageControl.Create(AOwner: TComponent);
begin
  inherited;
  Style := tsTabs;
  parent := TWinControl(AOwner);
end;

procedure TtecPageControl.DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  inherited

{ CLX_P_VCL
  Tabs[TabIndex].Highlighted := False;
  with Canvas do
  begin
    if Enabled then
      Brush.Color := clActiveMidlight
    else
      Brush.Color := clDisabledLight;
    Brush.Style := bsSolid;
    FillRect(Rect);
  end;
  Result := True;
  }
end;

{
procedure TtecPageControl.Paint;
begin
  inherited;
  if Style <> tsTabs then
    Style := tsTabs;
end;
}

end.
