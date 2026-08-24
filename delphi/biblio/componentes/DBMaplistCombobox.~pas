unit DBMaplistCombobox;

interface

uses Variants, Windows, SysUtils, Messages, Controls, Forms, Classes, 
     Graphics, Menus, StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, DB,DbCtrls,Dialogs,
     ctconstantes;

type
  TDBMaplistCombobox = class(TCustomComboBox)
  private
    FDataLink: TFieldDataLink;
    FPaintControl: TPaintControl;
    FItemValues : Tstrings;
    procedure SetItemValues(const value:Tstrings);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetComboText: string;
    function GetDataField: String;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetComboText(const Value: string);
    procedure SetDataField(const Value: String);
    procedure SetDataSource(Value: TDataSource);
    procedure SetEditReadOnly;
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
  protected
    procedure Change; override;
    procedure Click; override;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
      ComboProc: Pointer); override;
    procedure CreateWnd; override;
    procedure DropDown; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetItems(const Value: TStrings); override;
    procedure SetStyle(Value: TComboboxStyle); override;
    procedure WndProc(var Message: TMessage); override;
    procedure DoEnter; override;
    procedure DoExit; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    property Field: TField read GetField;
    property Text;
  published
    property Style; {Must be published before Items}
    property Align;
    property Anchors;
    property AutoComplete;
    property AutoDropDown;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property CharCase;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField: String read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropDownCount;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property Items write SetItems;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
//    property OnMouseEnter;
//    property OnMouseLeave;
    property OnStartDock;
    property OnStartDrag;
    property ItemValues:TStrings read FItemValues write SetItemValues;
  end;

//procedure Register;

implementation

constructor TDBMaplistCombobox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnEditingChange := EditingChange;
  FPaintControl := TPaintControl.Create(Self, 'COMBOBOX');
  FItemValues:=TStringList.Create;
end;

destructor TDBMaplistCombobox.Destroy;
begin
  FPaintControl.Free;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TDBMaplistCombobox.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBMaplistCombobox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TDBMaplistCombobox.CreateWnd;
begin
  inherited CreateWnd;
  SetEditReadOnly;
end;

procedure TDBMaplistCombobox.SetComboText(const Value: string);
var
  I: Integer;
  Redraw: Boolean;
begin
  if Value <> GetComboText then
  begin
    if Style <> csDropDown then
    begin
      Redraw := (Style <> csSimple) and HandleAllocated;
      if Redraw then SendMessage(Handle, WM_SETREDRAW, 0, 0);
      try
        if Value = '' then I := -1 else I := Items.IndexOf(Value);
        ItemIndex := I;
      finally
        if Redraw then
        begin
          SendMessage(Handle, WM_SETREDRAW, 1, 0);
          Invalidate;
        end;
      end;
      if I >= 0 then Exit;
    end;
    if Style in [csDropDown, csSimple] then Text := Value;
  end;
end;

function TDBMaplistCombobox.GetComboText: string;
var
  I: Integer;
begin
  if Style in [csDropDown, csSimple] then Result := Text else
  begin
    I := ItemIndex;
    if I < 0 then Result := '' else Result := Items[I];
  end;
end;

procedure TDBMaplistCombobox.Change;
begin
  FDataLink.Edit;
  inherited Change;
  FDataLink.Modified;
end;

procedure TDBMaplistCombobox.Click;
begin
  FDataLink.Edit;
  inherited Click;
  FDataLink.Modified;
end;

procedure TDBMaplistCombobox.DropDown;
begin
  inherited DropDown;
end;

function TDBMaplistCombobox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBMaplistCombobox.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBMaplistCombobox.GetDataField: String;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBMaplistCombobox.SetDataField(const Value: String);
begin
  FDataLink.FieldName := Value;
end;

function TDBMaplistCombobox.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBMaplistCombobox.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBMaplistCombobox.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBMaplistCombobox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if Key in [VK_BACK, VK_DELETE, VK_UP, VK_DOWN, 32..255] then
  begin
    if not FDataLink.Edit and (Key in [VK_UP, VK_DOWN]) then
      Key := 0;

    if key in [VK_BACK, vk_delete] then
    begin
      itemindex := -1;
      DataSource.DataSet.FieldByName(DataField).clear;
    end;
  end;
end;

procedure TDBMaplistCombobox.KeyPress(var Key: Char);
begin
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
      end;
  end;
end;

procedure TDBMaplistCombobox.EditingChange(Sender: TObject);
begin
  SetEditReadOnly;
end;

procedure TDBMaplistCombobox.SetEditReadOnly;
begin
  if (Style in [csDropDown, csSimple]) and HandleAllocated then
    SendMessage(EditHandle, EM_SETREADONLY, Ord(not FDataLink.Editing), 0);
end;

procedure TDBMaplistCombobox.WndProc(var Message: TMessage);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_COMMAND:
        if TWMCommand(Message).NotifyCode = CBN_SELCHANGE then
          if not FDataLink.Edit then
          begin
            if Style <> csSimple then
              PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
            Exit;
          end;
      CB_SHOWDROPDOWN:
        if Message.WParam <> 0 then FDataLink.Edit else
          if not FDataLink.Editing then DataChange(Self); {Restore text}
      WM_CREATE,
      WM_WINDOWPOSCHANGED,
      CM_FONTCHANGED:
        FPaintControl.DestroyHandle;
    end;
  inherited WndProc(Message);
end;

procedure TDBMaplistCombobox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
  ComboProc: Pointer);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_LBUTTONDOWN:
        if (Style = csSimple) and (ComboWnd <> EditHandle) then
          if not FDataLink.Edit then Exit;
    end;
  inherited ComboWndProc(Message, ComboWnd, ComboProc);
end;

procedure TDBMaplistCombobox.CMEnter(var Message: TCMEnter);
begin
  inherited;
  if SysLocale.FarEast and FDataLink.CanModify then
    SendMessage(EditHandle, EM_SETREADONLY, Ord(False), 0);
end;

procedure TDBMaplistCombobox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBMaplistCombobox.WMPaint(var Message: TWMPaint);
var
  S: string;
  R: TRect;
  P: TPoint;
  Child: HWND;
begin
  if csPaintCopy in ControlState then
  begin
    if FDataLink.Field <> nil then S := FDataLink.Field.Text else S := '';
    if Style = csDropDown then
    begin
      SendMessage(FPaintControl.Handle, WM_SETTEXT, 0, Longint(PChar(S)));
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
      Child := GetWindow(FPaintControl.Handle, GW_CHILD);
      if Child <> 0 then
      begin
        Windows.GetClientRect(Child, R);
        Windows.MapWindowPoints(Child, FPaintControl.Handle, R.TopLeft, 2);
        GetWindowOrgEx(Message.DC, P);
        SetWindowOrgEx(Message.DC, P.X - R.Left, P.Y - R.Top, nil);
        IntersectClipRect(Message.DC, 0, 0, R.Right - R.Left, R.Bottom - R.Top);
        SendMessage(Child, WM_PAINT, Message.DC, 0);
      end;
    end else
    begin
      SendMessage(FPaintControl.Handle, CB_RESETCONTENT, 0, 0);
      if Items.IndexOf(S) <> -1 then
      begin
        SendMessage(FPaintControl.Handle, CB_ADDSTRING, 0, Longint(PChar(S)));
        SendMessage(FPaintControl.Handle, CB_SETCURSEL, 0, 0);
      end;
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
    end;
  end else
    inherited;
end;

procedure TDBMaplistCombobox.SetItems(const Value: TStrings);
begin
  inherited SetItems(Value);
  DataChange(Self);
end;

procedure TDBMaplistCombobox.SetStyle(Value: TComboboxStyle);
begin
//  if (Value = csSimple) and Assigned(FDatalink) and FDatalink.DatasourceFixed then
//    DatabaseError(SNotReplicatable);
  inherited SetStyle(Value);
end;

function TDBMaplistCombobox.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TDBMaplistCombobox.CMGetDatalink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

function TDBMaplistCombobox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TDBMaplistCombobox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TDBMaplistCombobox.SetItemValues(const value:Tstrings);
begin
  FItemValues.Assign(value);
end;

procedure TDBMaplistCombobox.DataChange(Sender: TObject);
var
  i:integer;
begin
  if not (Style = csSimple) and DroppedDown then Exit;
  if DataField='' then
  begin
    SetComboText(Items[itemindex]);
  end
  else
  begin
  if FDataLink.Field <> nil then
  begin
    if FItemValues.Count>0 then
    begin
      for i:=0 to FItemValues.Count-1 do
        if FItemValues[i]=FDataLink.Field.Text then
          SetComboText(Items[i]);
    end
    else
    begin
      SetComboText(FDataLink.Field.Text);
    end;
  end
  else
    if csDesigning in ComponentState then
      SetComboText(Name)
    else
      SetComboText('');
  end;
end;

procedure TDBMaplistCombobox.UpdateData(Sender: TObject);
var
  value:string;
  i:integer;
begin
  I := ItemIndex;

  if I < 0 then
    value := ''
  else
  if ItemValues.Count>0 then
    value:=ItemValues[i]
  else
    value := Items[I];

  if value<>'' then
    DataSource.DataSet.FieldByName(DataField).AsString:=value
  else
    DataSource.DataSet.FieldByName(DataField).clear;
end;

{
procedure Register;
begin
  RegisterComponents('tecSOFT', [TDBMaplistCombobox]);
end;
}

procedure TDBMaplistCombobox.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;

end;

procedure TDBMaplistCombobox.DoExit;
begin
  inherited;
  Color:= clWindow;
  

end;

end.
