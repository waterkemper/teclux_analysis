{---------------------------------------------------------------------

 (c) freeware  9/Set/98  Mairon Benevides
 mairon@goldennet.com.br  maironbenevides@zipmail.com.br

 (c) Copyleft or copyright under terms of GNU General Public License
 2003  Jordi March i Nogu?   march_ribot@teleline.es
 Need modified, WMPaint(var Message: TWMPaint)
 for not hint (by buttons) ciphers when text is in right alignment

----------------------------------------------------------------------}

unit cpdbspinedit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Db, DBCtrls, Spin, ctconstantes;

type
  TFieldDataLink = class(TDataLink)
  { identical as TFieldDataLink, but with FModified as protected }
  private
    FField: TField;
    FFieldName: string;
    FControl: TComponent;
    FEditing: Boolean;
    FOnDataChange: TNotifyEvent;
    FOnEditingChange: TNotifyEvent;
    FOnUpdateData: TNotifyEvent;
    FOnActiveChange: TNotifyEvent;
    function GetCanModify: Boolean;
    procedure SetEditing(Value: Boolean);
    procedure SetField(Value: TField);
    procedure SetFieldName(const Value: string);
    procedure UpdateField;
    procedure UpdateRightToLeft;
  protected
    FModified: Boolean; {Now is proteected}
    procedure ActiveChanged; override;
    procedure EditingChanged; override;
    procedure FocusControl(Field: TFieldRef); override;
    procedure LayoutChanged; override;
    procedure RecordChanged(Field: TField); override;
    procedure UpdateData; override;
  public
    constructor Create;
    function Edit: Boolean;
    procedure Modified;
    procedure Reset;
    property CanModify: Boolean read GetCanModify;
    property Control: TComponent read FControl write FControl;
    property Editing: Boolean read FEditing;
    property Field: TField read FField;
    property FieldName: string read FFieldName write SetFieldName;
    property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
    property OnEditingChange: TNotifyEvent read FOnEditingChange write FOnEditingChange;
    property OnUpdateData: TNotifyEvent read FOnUpdateData write FOnUpdateData;
    property OnActiveChange: TNotifyEvent read FOnActiveChange write FOnActiveChange;
  end;

  TDBSpinEdit = class(TCustomMaskEdit)
  private
    FDataLink: TFieldDataLink;
    FCanvas: TControlCanvas;
    FAlignment: TAlignment;
    FFocused: Boolean;
    {SpinEdit}
    FMinValue: LongInt;
    FMaxValue: LongInt;
    FIncrement: LongInt;
    FButton: TSpinButton;
    FEditorEnabled: Boolean;
    {end SpinEdit}
    procedure ActiveChange(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    function GetTextMargins: TPoint;
    procedure ResetMaxLength;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMUndo(var Message: TMessage); message WM_UNDO;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    {SpinEdit}
    function GetMinHeight: Integer;
    function GetValue: LongInt;
    function CheckValue (NewValue: LongInt): LongInt;
    procedure SetValue (NewValue: LongInt);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    {end SpinEdit}
  protected
    procedure DoEnter; override;
    procedure DoExit; override;

    procedure Change; override;
    function  EditCanModify: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure Reset; override;
    {SpinEdit}
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function  IsValidChar(Key: Char): Boolean; virtual;
    procedure UpClick (Sender: TObject); virtual;
    procedure DownClick (Sender: TObject); virtual;
    procedure CreateParams(var Params: TCreateParams); override;
    {end SpinEdit}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    property Field: TField read GetField;
    {SpinEdit}
    property Button: TSpinButton read FButton;
    {end SpinEdit}
  published
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
   {SpinEdit}
    property EditorEnabled: Boolean read FEditorEnabled write FEditorEnabled default True;
    property Increment: LongInt read FIncrement write FIncrement default 1;
    property MaxValue: LongInt read FMaxValue write FMaxValue;
    property MinValue: LongInt read FMinValue write FMinValue;
    property Value: LongInt read GetValue write SetValue;
    {end SpinEdit}
  end;

//procedure Register;

implementation

{--------------------------------------}

constructor TFieldDataLink.Create;
begin
  inherited Create;
  VisualControl := True;
end;

procedure TFieldDataLink.SetEditing(Value: Boolean);
begin
  if FEditing <> Value then
  begin
    FEditing := Value;
    FModified := False;
    if Assigned(FOnEditingChange) then FOnEditingChange(Self);
  end;
end;

procedure TFieldDataLink.SetFieldName(const Value: string);
begin
  if FFieldName <> Value then
  begin
    FFieldName :=  Value;
    UpdateField;
  end;
end;

procedure TFieldDataLink.SetField(Value: TField);
begin
  if FField <> Value then
  begin
    FField := Value;
    EditingChanged;
    RecordChanged(nil);
    UpdateRightToLeft;
  end;
end;

procedure TFieldDataLink.UpdateField;
begin
  if Active and (FFieldName <> '') then
  begin
    if Assigned(FControl) then
      SetField(GetFieldProperty(DataSource.DataSet, FControl, FFieldName)) else
      SetField(DataSource.DataSet.FieldByName(FFieldName));
  end else
    SetField(nil);
end;

procedure TFieldDataLink.UpdateRightToLeft;
var
  IsRightAligned: Boolean;
  AUseRightToLeftAlignment: Boolean;
begin
  if Assigned(FControl) and (FControl is TWinControl) then
    with FControl as TWinControl do
      if IsRightToLeft then
      begin
        IsRightAligned :=
          (GetWindowLong(Handle, GWL_EXSTYLE) and WS_EX_RIGHT) = WS_EX_RIGHT;
        AUseRightToLeftAlignment :=
          DBUseRightToLeftAlignment(TControl(FControl), Field);
        if (IsRightAligned and (not AUseRightToLeftAlignment)) or
           ((not IsRightAligned) and AUseRightToLeftAlignment) then
          Perform(CM_RECREATEWND, 0, 0);
      end;    
end;

function TFieldDataLink.Edit: Boolean;
begin
  if CanModify then inherited Edit;
  Result := FEditing;
end;

function TFieldDataLink.GetCanModify: Boolean;
begin
  Result := not ReadOnly and (Field <> nil) and Field.CanModify;
end;

procedure TFieldDataLink.Modified;
begin
  FModified := True;
end;

procedure TFieldDataLink.Reset;
begin
  RecordChanged(nil);
end;

procedure TFieldDataLink.ActiveChanged;
begin
  UpdateField;
  if Assigned(FOnActiveChange) then FOnActiveChange(Self);
end;

procedure TFieldDataLink.EditingChanged;
begin
  SetEditing(inherited Editing and CanModify);
end;

procedure TFieldDataLink.FocusControl(Field: TFieldRef);
begin
  if (Field^ <> nil) and (Field^ = FField) and (FControl is TWinControl) then
    if TWinControl(FControl).CanFocus then
    begin
      Field^ := nil;
      TWinControl(FControl).SetFocus;
    end;
end;

procedure TFieldDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) or (Field = FField) then
  begin
    if Assigned(FOnDataChange) then FOnDataChange(Self);
    FModified := False;
  end;
end;

procedure TFieldDataLink.LayoutChanged;
begin
  UpdateField;
end;

procedure TFieldDataLink.UpdateData;
begin
  if FModified then
  begin
    if (Field <> nil) and Assigned(FOnUpdateData) then FOnUpdateData(Self);
    FModified := False;
  end;
end;

{--------------------------------------}

procedure TDBSpinEdit.ResetMaxLength;
var
  F: TField;
begin
  if (MaxLength > 0) and Assigned(DataSource) and Assigned(DataSource.DataSet) then
  begin
    F := DataSource.DataSet.FindField(DataField);
    if Assigned(F) and (F.DataType in [ftString, ftWideString]) and (F.Size = MaxLength) then
      MaxLength := 0;
  end;
end;

constructor TDBSpinEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnActiveChange := ActiveChange;
  FButton := TSpinButton.Create (Self);
  FButton.Width := 15;
  FButton.Height := 17;
  FButton.Visible := True;
  FButton.Parent := Self;
  FButton.FocusControl := Self;
  FButton.OnUpClick := UpClick;
  FButton.OnDownClick := DownClick;
  Text := '0';
  ControlStyle := ControlStyle - [csSetCaption];
  FIncrement := 1;
  FEditorEnabled := True;
end;

destructor TDBSpinEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  FCanvas.Free;
  FButton := nil;
  inherited Destroy;
end;

procedure TDBSpinEdit.Loaded;
begin
  inherited Loaded;
  ResetMaxLength;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBSpinEdit.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
    }
end;

function TDBSpinEdit.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TDBSpinEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then UpClick (Self)
  else if Key = VK_DOWN then DownClick (Self);
  inherited KeyDown(Key, Shift);
  if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
    FDataLink.Edit;
end;

procedure TDBSpinEdit.KeyPress(var Key: Char);
begin
  if not IsValidChar(Key) then
  begin
    Key := #0;
    MessageBeep(0)
  end;
  if Key <> #0 then  begin
    inherited KeyPress(Key);
    if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
      not FDataLink.Field.IsValidChar(Key) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
    case Key of
      ^H, ^V, ^X, #32..#255:
        FDataLink.Edit;
      #27:
        begin
          FDataLink.Reset;
          SelectAll;
          Key := #0;
        end;
    end;
  end;
end;

function TDBSpinEdit.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TDBSpinEdit.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TDBSpinEdit.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then
  begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) and not IsMasked then Invalidate;
    FDataLink.Reset;
  end;
end;

procedure TDBSpinEdit.Change;
begin
  FDataLink.Modified;
  inherited Change;
end;

function TDBSpinEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBSpinEdit.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBSpinEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBSpinEdit.SetDataField(const Value: string);
begin
  if not (csDesigning in ComponentState) then
    ResetMaxLength;
  FDataLink.FieldName := Value;
end;

function TDBSpinEdit.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBSpinEdit.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBSpinEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBSpinEdit.ActiveChange(Sender: TObject);
begin
  ResetMaxLength;
end;

procedure TDBSpinEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    if FAlignment <> FDataLink.Field.Alignment then
    begin
      EditText := '';  {forces update}
      FAlignment := FDataLink.Field.Alignment;
    end;
    EditMask := FDataLink.Field.EditMask;
    if not (csDesigning in ComponentState) then
    begin
      if (FDataLink.Field.DataType in [ftString, ftWideString]) and (MaxLength = 0) then
        MaxLength := FDataLink.Field.Size;
    end;
    if FFocused and FDataLink.CanModify then
      Text := FDataLink.Field.Text
    else
    begin
      EditText := FDataLink.Field.DisplayText;
      if FDataLink.Editing and FDataLink.FModified then
        Modified := True;
    end;
  end else
  begin
    FAlignment := taLeftJustify;
    EditMask := '';
    if csDesigning in ComponentState then
      EditText := Name else
      EditText := '';
  end;
end;

procedure TDBSpinEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TDBSpinEdit.UpdateData(Sender: TObject);
begin
  ValidateEdit;
  FDataLink.Field.Text := Text;
end;

procedure TDBSpinEdit.WMUndo(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TDBSpinEdit.WMPaste(var Message: TMessage);
begin
  if not FEditorEnabled or ReadOnly then Exit;
  FDataLink.Edit;
  inherited;
end;

procedure TDBSpinEdit.WMCut(var Message: TMessage);
begin
  if not FEditorEnabled or ReadOnly then Exit;
  FDataLink.Edit;
  inherited;
end;

procedure TDBSpinEdit.CMEnter(var Message: TCMEnter);
begin
  if AutoSelect and not (csLButtonDown in ControlState) then
    SelectAll;
  SetFocused(True);
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    inherited ReadOnly := False;
end;

procedure TDBSpinEdit.CMExit(var Message: TCMExit);
begin
  if CheckValue (Value) <> Value then
    SetValue (Value);
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  SetFocused(False);
  CheckCursor;
  DoExit;
end;

procedure TDBSpinEdit.WMPaint(var Message: TWMPaint);
const
  AlignStyle : array[Boolean, TAlignment] of DWORD =
   ((WS_EX_LEFT, WS_EX_RIGHT, WS_EX_LEFT),
    (WS_EX_RIGHT, WS_EX_LEFT, WS_EX_LEFT));
var
  Left: Integer;
  Margins: TPoint;
  R: TRect;
  DC: HDC;
  PS: TPaintStruct;
  S: string;
  AAlignment: TAlignment;
  ExStyle: DWORD;
begin
  AAlignment := FAlignment;
  if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
  if ((AAlignment = taLeftJustify) or FFocused) and
    not (csPaintCopy in ControlState) then
  begin
    if SysLocale.MiddleEast and HandleAllocated and (IsRightToLeft) then
    begin { This keeps the right aligned text, right aligned }
      ExStyle := DWORD(GetWindowLong(Handle, GWL_EXSTYLE)) and (not WS_EX_RIGHT) and
        (not WS_EX_RTLREADING) and (not WS_EX_LEFTSCROLLBAR);
      if UseRightToLeftReading then ExStyle := ExStyle or WS_EX_RTLREADING;
      if UseRightToLeftScrollbar then ExStyle := ExStyle or WS_EX_LEFTSCROLLBAR;
      ExStyle := ExStyle or
        AlignStyle[UseRightToLeftAlignment, AAlignment];
      if DWORD(GetWindowLong(Handle, GWL_EXSTYLE)) <> ExStyle then
        SetWindowLong(Handle, GWL_EXSTYLE, ExStyle);
    end;
    inherited;
    Exit;
  end;
{ Since edit controls do not handle justification unless multi-line (and
  then only poorly) we will draw right and center justify manually unless
  the edit has the focus. }
  if FCanvas = nil then
  begin
    FCanvas := TControlCanvas.Create;
    FCanvas.Control := Self;
  end;
  DC := Message.DC;
  if DC = 0 then DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;
  try
    FCanvas.Font := Font;
    with FCanvas do
    begin
      R := ClientRect;
      R.Right := R.Right - FButton.Width; {NewJMN}
      if not (NewStyleControls and Ctl3D) and (BorderStyle = bsSingle) then
      begin
        Brush.Color := clWindowFrame;
        FrameRect(R);
        InflateRect(R, -1, -1);
      end;
      Brush.Color := Color;
      if not Enabled then
        Font.Color := clGrayText;
      if (csPaintCopy in ControlState) and (FDataLink.Field <> nil) then
      begin
        S := FDataLink.Field.DisplayText;
        case CharCase of
          ecUpperCase: S := AnsiUpperCase(S);
          ecLowerCase: S := AnsiLowerCase(S);
        end;
      end else
        S := EditText;
      if PasswordChar <> #0 then FillChar(S[1], Length(S), PasswordChar);
      Margins := GetTextMargins;
      case AAlignment of
        taLeftJustify: Left := Margins.X;
        taRightJustify: Left := (ClientWidth - FButton.Width{NewJMN}) - TextWidth(S) - Margins.X - 1;
      else
        Left := ((ClientWidth - FButton.Width{NewJMN}) - TextWidth(S)) div 2;
      end;
      if SysLocale.MiddleEast then UpdateTextFlags;
      TextRect(R, Left, Margins.Y, S);
    end;
  finally
    FCanvas.Handle := 0;
    if Message.DC = 0 then EndPaint(Handle, PS);
  end;
end;

procedure TDBSpinEdit.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

function TDBSpinEdit.GetTextMargins: TPoint;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  if NewStyleControls then
  begin
    if BorderStyle = bsNone then I := 0 else
      if Ctl3D then I := 1 else I := 2;
    Result.X := SendMessage(Handle, EM_GETMARGINS, 0, 0) and $0000FFFF + I;
    Result.Y := I;
  end else
  begin
    if BorderStyle = bsNone then I := 0 else
    begin
      DC := GetDC(0);
      GetTextMetrics(DC, SysMetrics);
      SaveFont := SelectObject(DC, Font.Handle);
      GetTextMetrics(DC, Metrics);
      SelectObject(DC, SaveFont);
      ReleaseDC(0, DC);
      I := SysMetrics.tmHeight;
      if I > Metrics.tmHeight then I := Metrics.tmHeight;
      I := I div 4;
    end;
    Result.X := I;
    Result.Y := I;
  end;
end;

function TDBSpinEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TDBSpinEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

{--------------------------------------}

procedure TDBSpinEdit.GetChildren(Proc: TGetChildProc; Root: TComponent);
begin
end;

function TDBSpinEdit.IsValidChar(Key: Char): Boolean;
begin
  Result := (Key in [DecimalSeparator, '+', '-', '0'..'9']) or
    ((Key < #32) and (Key <> Chr(VK_RETURN)));
  if not FEditorEnabled and Result and ((Key >= #32) or
      (Key = Char(VK_BACK)) or (Key = Char(VK_DELETE))) then
    Result := False;
end;

procedure TDBSpinEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
{  Params.Style := Params.Style and not WS_BORDER;  }
  Params.Style := Params.Style or ES_MULTILINE or WS_CLIPCHILDREN;
end;

procedure TDBSpinEdit.WMSize(var Message: TWMSize);
var
  MinHeight: Integer;
begin
  inherited;
  MinHeight := GetMinHeight;
    { text edit bug: if size to less than minheight, then edit ctrl does
      not display the text }
  if Height < MinHeight then   
    Height := MinHeight
  else if FButton <> nil then
  begin
    if NewStyleControls and Ctl3D then
      FButton.SetBounds(Width - FButton.Width - 5, 0, FButton.Width, Height - 5)
    else FButton.SetBounds (Width - FButton.Width, 1, FButton.Width, Height - 3);
  end;
end;

function TDBSpinEdit.GetMinHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  I: Integer;
  SysMetrics, Metrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  I := SysMetrics.tmHeight;
  if I > Metrics.tmHeight then I := Metrics.tmHeight;
  Result := Metrics.tmHeight + I div 4 + GetSystemMetrics(SM_CYBORDER) * 4 + 2;
end;

procedure TDBSpinEdit.UpClick (Sender: TObject);
begin
  if ReadOnly then MessageBeep(0)
  else Value := Value + FIncrement;
  EditCanModify;
end;

procedure TDBSpinEdit.DownClick (Sender: TObject);
begin
  if ReadOnly then MessageBeep(0)
  else Value := Value - FIncrement;
  EditCanModify;
end;

function TDBSpinEdit.GetValue: LongInt;
begin
  try
    Result := StrToInt (Text);
  except
    Result := FMinValue;
  end;
end;

procedure TDBSpinEdit.SetValue (NewValue: LongInt);
begin
  Text := IntToStr (CheckValue (NewValue));
  EditText := Text; { for?a update }
end;

function TDBSpinEdit.CheckValue (NewValue: LongInt): LongInt;
begin
  Result := NewValue;
  if (FMaxValue <> FMinValue) then
  begin
    if NewValue < FMinValue then
      Result := FMinValue
    else if NewValue > FMaxValue then
      Result := FMaxValue;
  end;
end;

{
procedure Register;
begin
  RegisterComponents('Data Controls', [TDBSpinEdit]);
end;
}

procedure TDBSpinEdit.DoEnter;
begin
  inherited;
  if Self.Focused then
  begin
    Color:= CorFundoControle;
    self.SetFocus;
  end;
end;

procedure TDBSpinEdit.DoExit;
begin
  inherited;
  Color:= clWindow;

end;

end.

(*





unit cpdbspinedit;


TDBSpinEdit,(c) 2000-2005 Brad Prendergast (bradp@bpsoftware.com),
            http://www.bpsoftware.com/products/delphi.htm

Version: 1.5.2.0, Aug 05, 2005

TDBSpinEdit is a data-aware descendant of native TSpinEdit control.


New:
  Properties -
    DataField: String - Specifies the field which the DBSpinEdit control displays data.
    DataSource: TDataSource - Links the DBSpinEdit to the dataset that contains the
                              field it represents.


There is no guarantee or warranty, expressed or implied, concerning the applicability of
code and techniques included in this example.  This example code is supplied AS IS.  If
you wish to use this code or technique, it is your responsibility to test and certify
the code in your project.

interface

uses
  Controls, ComCtrls, classes,
  StdCtrls, DB, DBCtrls, Types, Variants,
  Forms, Dialogs, ctconstantes, {Qete,} Graphics, Spin;

type
  TDBSpinEdit = class(TSpinEdit)
  private
    { Private declarations }
    fDataLink : TFieldDataLink;
    Function GetDataField: string;
    Function GetDataSource: TDataSource;
    Procedure SetDataField(const Value: string);
    Procedure SetDataSource(Value: TDataSource);
    Procedure DataChange(Sender: TObject);
    Procedure DataUpdate(Sender: TObject);
    function getModified: Boolean;
{    Procedure CMExit(var Message: TWMNoParams); message CM_EXIT;}
  protected
    { Protected declarations }
    ValorAnterior: integer;
{CLX_TO_VCL  procedure Change(AValue: Integer); override;}
    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;

    property Modified: Boolean read getModified;

{    procedure UpClick (Sender: TObject); override;
    procedure DownClick (Sender: TObject); override;}
  public
    { Public declarations }
    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;
  published
    { Published declarations }
    Property DataField: string read GetDataField write SetDataField;
    Property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

//procedure Register;

implementation

Constructor TDBSpinEdit.Create(AOwner: TComponent);
Begin
  inherited Create(AOwner);
  fDataLink:= TFieldDataLink.Create;
  fDataLink.Control:= Self;
  fDataLink.OnDataChange:= DataChange;
  fDataLink.OnUpdateData:= DataUpdate;
End;

Destructor TDBSpinEdit.Destroy;
Begin
  fDataLink.OnDataChange:= nil;
  fDataLink.OnUpdateData:= nil;
  fDataLink.Free;
  fDataLink:= nil;
  inherited;
End;

Function TDBSpinEdit.GetDataField: string;
Begin
  Result:= fDataLink.FieldName;
End;

Function TDBSpinEdit.GetDataSource: TDataSource;
Begin
  Result:= fDataLink.DataSource;
End;

Procedure TDBSpinEdit.SetDataField(const value: string);
Begin
  fDataLink.FieldName:= Value;
End;

Procedure TDBSpinEdit.SetDataSource(Value: TDataSource);
Begin
  fDataLink.DataSource:= Value;
End;

Procedure TDBSpinEdit.DataChange(Sender: TObject);
Begin
{  if fDataLink.DataSource.State = dsBrowse then
    if (fDataLink.Field.AsInteger <> null) then}
   if assigned(fDataLink.Field) then
      Value:= fDataLink.Field.AsInteger
{    else
      Value:= 0;}
End;

Procedure TDBSpinEdit.DataUpdate(Sender: TObject);
Begin
  if fDataLink.CanModify then
    fDataLink.Field.AsInteger:= Value;
End;

CLX_TO_VCL Procedure TDBSpinEdit.Change(AValue: Integer);
Procedure TDBSpinEdit.Change;
Begin
  if modified  then
  begin
    if not(fDataLink.Editing) then
      fDataLink.Edit;
    fDatalink.Modified;
// CLX_TO_VCL   inherited Change(AValue);
    inherited Change;
    DataUpdate(self);
  end;
End;


procedure TDBSpinEdit.CMExit(var Message: TWMNoParams);
begin
   try
      fDataLink.UpdateRecord;
   except
      on Exception do SetFocus;
   end;
   inherited;
end;


{
procedure TDBSpinEdit.UpClick (Sender: TObject);
begin
  Inherited UpClick(Sender);
     if not(fDataLink.Editing) then
        fDataLink.Edit;
      fDatalink.Modified;
end;

procedure TDBSpinEdit.DownClick (Sender: TObject);
begin
  Inherited DownClick(Sender);
  if not(fDataLink.Editing) then
    fDataLink.Edit;
  fDatalink.Modified;
end;




procedure Register;
begin
  RegisterComponents('BPComponents', [TDBSpinEdit]);
end;


procedure TDBSpinEdit.DoEnter;
begin
  inherited;
  ValorAnterior := Value;
  if Self.Focused then
  begin
    Color:= CorFundoControle;
    self.SetFocus;
  end;

end;

procedure TDBSpinEdit.DoExit;
begin
  inherited;
  Color:= clWindow;
end;

function TDBSpinEdit.getModified: Boolean;
begin
  if assigned(fDataLink.DataSet) then
    result := (Value <> fDataLink.Field.AsInteger) and
              ((fDataLink.DataSet.State in [dsedit, dsinsert])
               or (fDataLink.DataSet.RecordCount<>0))
  else
    Result := False;

end;


end.

*)

