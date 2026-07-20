
unit FLabel;


// Copyright © 2001 by Peric , 14.01.2001




interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,EXtCtrls;
  {$R Flabel.res}
type
  TFLabel = class(TCustomLabel)
  private
    { Private declarations }
    FFlashenabled:boolean;
    FFlashrate:integer;
      Timer:TTimer;
    FCop: string;
    function GetCop: string;
    procedure SetCop(const Value: string);
  protected
    { Protected declarations }
    procedure Setflashenabled(AFlashenabled:boolean);
    procedure Setflashrate(Aflashrate:integer);
    procedure OnTimer(Sedner:Tobject);virtual;
  public

    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
  published
    { Published declarations }
    property Flashenabled:boolean
    read FFlashenabled write Setflashenabled default True;
    property Flashrate:integer
    read  FFlashrate write Setflashrate default 800;
    property Copyright: string read GetCop write SetCop;
    property Align;
    property Alignment;
    property AutoSize;
    property Caption;
    property Color;
    property Enabled;
    property DragCursor;
    property DragMode;
    property FocusControl;
    property Font;
    property ParentColor;
    property ParentShowHint;
    property ParentFont;
    property Transparent;
    property Layout;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;


  end;


//procedure Register;

implementation

constructor TFLabel.Create(AOwner:TComponent);

begin
inherited;
FFlashenabled:=True;
FFlashrate:=800;
Timer:=TTimer.Create(Self);
Timer.Interval:= FFlashrate;
Timer.OnTimer:=OnTimer;
FCop:='Copyright © 2001 by Peric';
 end;

 function TFLabel.GetCop: string;
begin
  Result:=FCop;
end;

procedure TFlabel.SetCop(const Value: string);
begin
  FCop:=FCop;
end;

procedure TFLabel.Setflashenabled(AFlashenabled:boolean);
begin

  FFlashenabled:=AFlashenabled;
  if csDesigning in ComponentState then
    Exit;

  Timer.Enabled := FFlashenabled;

  Visible := FFlashenabled

  {
  if not FFlashenabled then
    Visible:=True;
  }

end;

procedure TFLabel.Setflashrate(Aflashrate:integer);
begin
  FFlashrate:=Aflashrate;
  Timer.interval:=Aflashrate;
end;

 procedure TFLabel.OnTimer(Sedner:Tobject);

 begin
   if csDesigning in ComponentState then
   begin
     Timer.Enabled:=False;
     Exit;
   end;

   Visible := not visible;
 end;

{
procedure Register;
begin
  RegisterComponents('tecSOFT', [TFLabel]);
end;
}

end.

