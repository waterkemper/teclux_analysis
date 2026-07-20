{------------------------------------------------------------------------------}
{                                                                              }
{  TBiDiDBNavigator v1.1                                                       }
{  by Kambiz R. Khojasteh                                                      }
{                                                                              }
{  kambiz@delphiarea.com                                                       }
{  http://www.delphiarea.com                                                   }
{                                                                              }
{------------------------------------------------------------------------------}

unit BiDiDBNavigator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls;

type

{ TBiDiDBNavigator }

  TBiDiDBNavigator = class(TDBNavigator)
  private
    fTransparent: Boolean;
    procedure SwapButtons;
    procedure SwapGlyphs;
    function Swaped: Boolean;
    procedure SetTransparent(Value: Boolean);
    procedure SetGlyphs(Index: TNavigateBtn; Glyph: TBitmap);
    function GetGlyphs(Index: TNavigateBtn): TBitmap;
  protected
    procedure Paint; override;
    procedure Loaded; override;
    procedure WMSize(var Msg: TWMSize); message WM_SIZE;
    procedure CMBiDiModeChanged(var Msg: TMessage); message CM_BIDIMODECHANGED;
  public
    property Glyphs[Index: TNavigateBtn]: TBitmap read GetGlyphs write SetGlyphs;
  published
    property BiDiMode;
    property ParentBiDiMode;
    property GlyphFirst: TBitmap index nbFirst read GetGlyphs write SetGlyphs;
    property GlyphPrior: TBitmap index nbPrior read GetGlyphs write SetGlyphs;
    property GlyphNext: TBitmap index nbNext read GetGlyphs write SetGlyphs;
    property GlyphLast: TBitmap index nbLast read GetGlyphs write SetGlyphs;
    property GlyphInsert: TBitmap index nbInsert read GetGlyphs write SetGlyphs;
    property GlyphDelete: TBitmap index nbDelete read GetGlyphs write SetGlyphs;
    property GlyphEdit: TBitmap index nbEdit read GetGlyphs write SetGlyphs;
    property GlyphPost: TBitmap index nbPost read GetGlyphs write SetGlyphs;
    property GlyphCancel: TBitmap index nbCancel read GetGlyphs write SetGlyphs;
    property GlyphRefresh: TBitmap index nbRefresh read GetGlyphs write SetGlyphs;
    property Transparent: Boolean read fTransparent write SetTransparent default False;
  end;

//procedure Register;

implementation

type
  TParentControl = class(TWinControl);

{ This procedure is copied from RxLibrary VCLUtils }
procedure CopyParentImage(Control: TControl; Dest: TCanvas);
var
  I, Count, X, Y, SaveIndex: Integer;
  DC: HDC;
  R, SelfR, CtlR: TRect;
begin
  if (Control = nil) or (Control.Parent = nil) then Exit;
  Count := Control.Parent.ControlCount;
  DC := Dest.Handle;
{$IFDEF WIN32}
  with Control.Parent do ControlState := ControlState + [csPaintCopy];
  try
{$ENDIF}
    with Control do begin
      SelfR := Bounds(Left, Top, Width, Height);
      X := -Left; Y := -Top;
    end;
    { Copy parent control image }
    SaveIndex := SaveDC(DC);
    try
      SetViewportOrgEx(DC, X, Y, nil);
      IntersectClipRect(DC, 0, 0, Control.Parent.ClientWidth,
        Control.Parent.ClientHeight);
      with TParentControl(Control.Parent) do begin
        Perform(WM_ERASEBKGND, DC, 0);
        PaintWindow(DC);
      end;
    finally
      RestoreDC(DC, SaveIndex);
    end;
    { Copy images of graphic controls }
    for I := 0 to Count - 1 do begin
      if Control.Parent.Controls[I] = Control then Break
      else if (Control.Parent.Controls[I] <> nil) and
        (Control.Parent.Controls[I] is TGraphicControl) then
      begin
        with TGraphicControl(Control.Parent.Controls[I]) do begin
          CtlR := Bounds(Left, Top, Width, Height);
          if Bool(IntersectRect(R, SelfR, CtlR)) and Visible then begin
{$IFDEF WIN32}
            ControlState := ControlState + [csPaintCopy];
{$ENDIF}
            SaveIndex := SaveDC(DC);
            try
              SetViewportOrgEx(DC, Left + X, Top + Y, nil);
              IntersectClipRect(DC, 0, 0, Width, Height);
              Perform(WM_PAINT, DC, 0);
            finally
              RestoreDC(DC, SaveIndex);
{$IFDEF WIN32}
              ControlState := ControlState - [csPaintCopy];
{$ENDIF}
            end;
          end;
        end;
      end;
    end;
{$IFDEF WIN32}
  finally
    with Control.Parent do ControlState := ControlState - [csPaintCopy];
  end;
{$ENDIF}
end;

{ TBiDiDBNavigator }

procedure TBiDiDBNavigator.Paint;
begin
  if fTransparent and Flat then
    CopyParentImage(Self, Canvas)
  else
   inherited Paint;
end;

procedure TBiDiDBNavigator.Loaded;
begin
  inherited Loaded;
  if UseRightToLeftAlignment and not Swaped then
    SwapButtons;
end;

procedure TBiDiDBNavigator.WMSize(var Msg: TWMSize);
begin
  inherited;
  if not (csLoading in ComponentState) and UseRightToLeftAlignment and not Swaped then
    SwapButtons;
end;

procedure TBiDiDBNavigator.CMBiDiModeChanged(var Msg: TMessage);
var
  B: TNavigateBtn;
begin
  for B := Low(Buttons) to High(Buttons) do
    Buttons[B].BidiMode := BiDiMode;             // for right to left hint
  if UseRightToLeftAlignment <> Swaped then
  begin
    SwapButtons;
    if not (csReading in ComponentState) and not (csLoading in ComponentState) then
      SwapGlyphs;
  end;
end;

procedure TBiDiDBNavigator.SwapButtons;
var
  X: Integer;
  LB, RB: TNavigateBtn;
begin
  LB := Low(Buttons);
  RB := High(Buttons);
  repeat
    while not (LB in VisibleButtons) and (LB < High(Buttons)) do Inc(LB);
    while not (RB in VisibleButtons) and (RB > Low(Buttons)) do Dec(RB);
    if LB < RB then
    begin
      X := Buttons[LB].Left;
      Buttons[LB].Left := Buttons[RB].Left;
      Buttons[RB].Left := X;
      Inc(LB);
      Dec(RB);
    end;
  until LB >= RB;
end;

procedure TBiDiDBNavigator.SwapGlyphs;
var
  Glyph: TBitmap;
begin
  Glyph := TBitmap.Create;
  try
    Glyph.Assign(Buttons[nbLast].Glyph);
    Buttons[nbLast].Glyph.Assign(Buttons[nbFirst].Glyph);
    Buttons[nbFirst].Glyph.Assign(Glyph);
    Glyph.Assign(Buttons[nbNext].Glyph);
    Buttons[nbNext].Glyph.Assign(Buttons[nbPrior].Glyph);
    Buttons[nbPrior].Glyph.Assign(Glyph);
  finally
    Glyph.Free;
  end;
end;

function TBiDiDBNavigator.Swaped: Boolean;
var
  LB, RB: TNavigateBtn;
begin
  LB := Low(Buttons);
  RB := High(Buttons);
  while not (LB in VisibleButtons) and (LB < High(Buttons)) do Inc(LB);
  while not (RB in VisibleButtons) and (RB > Low(Buttons)) do Dec(RB);
  Result := Buttons[LB].Left > Buttons[RB].Left;
end;

procedure TBiDiDBNavigator.SetTransparent(Value: Boolean);
var
  B: TNavigateBtn;
begin
  if fTransparent <> Value then
  begin
    fTransparent := Value;
    for B := Low(Buttons) to High(Buttons) do
      Buttons[B].Transparent := fTransparent;
  end;
end;

procedure TBiDiDBNavigator.SetGlyphs(Index: TNavigateBtn; Glyph: TBitmap);
begin
  Buttons[Index].Glyph.Assign(Glyph);
end;

function TBiDiDBNavigator.GetGlyphs(Index: TNavigateBtn): TBitmap;
begin
  Result := Buttons[Index].Glyph;
end;

{
procedure Register;
begin
  RegisterComponents('Delphi Area', [TBiDiDBNavigator]);
end;
}

end.
