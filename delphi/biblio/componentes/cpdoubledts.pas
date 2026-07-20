unit cpdoubledts;

interface

uses
  Variants, SysUtils, Types, Graphics, Classes, DB, Controls, DBCtrls,
  {Qete,} Mask, ctconstantes, Windows;

 type

  TtecDoubleDBEdit = class(TCustomMaskEdit)
  private
    FLookupDataLink: TFieldDataLink;
    FDataLink: TFieldDataLink;
    FTextLocked: Boolean;
    FDatasetLocked: Boolean;
    procedure DataChange(Sender: TObject);
    function GetLookupDataField: string;
    function GetLookupDataSource: TDataSource;
    function GetLookupField: TField;
    function GetReadOnly: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure Restore;
    procedure SetLookupDataField(const Value: string);
    procedure SetLookupDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure UpdateData(Sender: TObject);
  protected
    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Resize; override;    
    function EditCanModify: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Reset; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
{ CLX_TO_VCL procedure CutToClipboard; override;}
    function ExecuteAction(Action: TBasicAction): Boolean; override;
{CLX_TO_VCL procedure PasteFromClipboard; override;}
{$IFDEF LINUX}
    procedure Redo; override;
    procedure Undo; override;
{$ENDIF}
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property FieldLookup: TField read GetLookupField;
    property Field: TField read GetField;
  published
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property LookupField: string read GetLookupDataField write SetLookupDataField;
    property LookupSource: TDataSource read GetLookupDataSource write SetLookupDataSource;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragMode;
    property Enabled;
    property Font;
    property MaxLength;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
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
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
 {CLX_TO_VCL   property OnKeyString;}
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

implementation

{ TDoubleDBEdit }

constructor TtecDoubleDBEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  MaxLength := 0;
  ControlStyle := ControlStyle + [csReplicatable];
  FLookupDataLink := TFieldDataLink.Create;
  FLookupDataLink.Control := Self;
  FLookupDataLink.OnDataChange := DataChange;
  FLookupDataLink.OnUpdateData := UpdateData;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  Height := 23;  
end;

destructor TtecDoubleDBEdit.Destroy;
begin
  FLookupDataLink.Free;
  FDataLink.Free;
  inherited Destroy;
end;
{ CLX_TO_VCL
procedure TtecDoubleDBEdit.CutToClipboard;
begin
  if FDataLink.Edit then
    inherited;
end;
}

{ CLX_TO_VCL
procedure TtecDoubleDBEdit.PasteFromClipboard;
begin
  if FDataLink.Edit then
    inherited;
end;
}

{$IFDEF LINUX}
procedure TtecDoubleDBEdit.Redo;
begin
  if FDataLink.Edit then
    inherited;
end;

procedure TtecDoubleDBEdit.Undo;
begin
  if FDataLink.Edit then
    inherited;
end;
{$ENDIF}

procedure TtecDoubleDBEdit.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (AComponent = LookupSource) then
    LookupSource := nil;
  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;
    }
end;

procedure TtecDoubleDBEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_Delete) or ((Key = VK_INSERT) and (ssShift in Shift))
  and not FLookupDataLink.Edit then
     Key := 0;
end;

procedure TtecDoubleDBEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key in [#32..#255]) and (FLookupDataLink.Field <> nil) and
    not FLookupDataLink.Field.IsValidChar(Key) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      begin
        if not FLookupDataLink.Edit then
          Key := #0;
      end;
    #27:
      begin
        FLookupDataLink.Reset;
        SelectAll;
        Key := #0;
      end;
  end;
end;

function TtecDoubleDBEdit.EditCanModify: Boolean;
begin
  Result := FLookupDataLink.Edit;
end;

procedure TtecDoubleDBEdit.Reset;
begin
  FLookupDataLink.Reset;
  FDataLink.Reset;
  SelectAll;
end;

procedure TtecDoubleDBEdit.Change;
begin
  if not FTextLocked then
  begin
    if FDataLink.CanModify then
    begin
      FDataLink.Edit;
      FDataLink.Modified;
    end;
    FDatasetLocked := True;
    try
      FLookupDataLink.Edit;
      FLookupDataLink.Modified;
    finally
      FDatasetLocked := False;
    end;
    inherited Change;
  end;
end;

procedure TtecDoubleDBEdit.DataChange(Sender: TObject);
begin
  if not FDatasetLocked then
  begin
    FTextLocked := True;
    try
      Restore;
    finally
      FTextLocked := False;
    end;
  end;
end;

procedure TtecDoubleDBEdit.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
  // // //Alignment:=taLeftJustify;
end;

procedure TtecDoubleDBEdit.DoExit;
begin
  try
    FLookupDataLink.UpdateRecord;
    FDataLink.UpdateRecord;
    { CLX_TO_VCL
    if Assigned(FLookupDataLink.Field) then
      Alignment := FLookupDataLink.Field.Alignment;
      }
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  inherited;
  Color:= clWindow;
end;

function TtecDoubleDBEdit.GetLookupDataField: string;
begin
  Result := FLookupDataLink.FieldName;
end;

function TtecDoubleDBEdit.GetLookupDataSource: TDataSource;
begin
  Result := FLookupDataLink.DataSource;
end;

function TtecDoubleDBEdit.GetLookupField: TField;
begin
 Result := FLookupDataLink.Field;
end;

function TtecDoubleDBEdit.GetReadOnly: Boolean;
begin
  Result := FLookupDataLink.ReadOnly;
end;

function TtecDoubleDBEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TtecDoubleDBEdit.GetDataSource: TDataSource;
begin
  if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;

end;

function TtecDoubleDBEdit.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TtecDoubleDBEdit.Restore;
begin
  if FLookupDataLink.Field <> nil then
  begin
    if FLookupDataLink.Field.DataType in [ftString, ftWideString] then
    begin
      if MaxLength <> -1 then MaxLength := FLookupDataLink.Field.Size;
    end else
      MaxLength := -1;
    EditMask := FLookupDataLink.Field.EditMask;
    if FLookupDataLink.CanModify then
      Text := FLookupDataLink.Field.Text
    else
      EditText := FLookupDataLink.Field.DisplayText;
    {CLX_TO_VCL
     Alignment := FLookupDataLink.Field.Alignment;}
  end else
  begin
    // // //Alignment:=taLeftJustify;
    EditMask := '';
    if csDesigning in ComponentState then
      EditText := Name else
      EditText := '';
  end;
  Modified := False;
end;

procedure TtecDoubleDBEdit.SetLookupDataSource(Value: TDataSource);
begin
  if not ((csLoading in ComponentState) and FLookupDataLink.DataSourceFixed) then
    FLookupDataLink.DataSource := Value;
end;

procedure TtecDoubleDBEdit.SetLookupDataField(const Value: string);
begin
  FLookupDataLink.FieldName := Value;
end;

procedure TtecDoubleDBEdit.SetReadOnly(Value: Boolean);
begin
  inherited ReadOnly := Value;
  FLookupDataLink.ReadOnly := Value;
end;

procedure TtecDoubleDBEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TtecDoubleDBEdit.SetDataSource(Value: TDataSource);
begin
  if not ((csLoading in ComponentState) and FDataLink.DataSourceFixed) then
    FDataLink.DataSource := Value;
end;

procedure TtecDoubleDBEdit.UpdateData(Sender: TObject);
begin
  if FLookupDataLink.Field <> nil then
  begin
    ValidateEdit;
    FLookupDataLink.Field.Text := Text;
    Modified := False;
  end;
end;

function TtecDoubleDBEdit.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FLookupDataLink <> nil) and
    FLookupDataLink.ExecuteAction(Action);
end;

function TtecDoubleDBEdit.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FLookupDataLink <> nil) and
    FLookupDataLink.UpdateAction(Action);
end;

procedure TtecDoubleDBEdit.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

end.

