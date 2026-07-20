unit cpdbradiogroup;

interface

uses Classes, StdCtrls, DBCtrls, DB, Forms, {Qete,} Controls, cpdbfindcontrols, biblio, ctconstantes;

type

  TtecRadioButton = class(TRadioButton)
  private
    FValue: String;
    FReadOnly: Boolean;
    FMensagemClick: TtecProcedure;
    ExibirMSG : boolean;

  protected
//    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OnClickButtom(Sender: TObject);
  public
//    vBloquear : boolean;
    constructor Create(AOwner: TComponent); override;
    procedure Click; override;
    procedure SetChecked(Value: Boolean); override;
    property MensagemClick: TtecProcedure read FMensagemClick write FMensagemClick;

  published
    property Value: String read FValue write FValue;
    property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
  end;

  TtecDBRadioGroup = class(TGroupBox)
  private
    FOnClickItem: TNotifyEvent;
    FDataLink: TFieldDataLink;
    FValue: String;
    FOnChange: TNotifyEvent;
    fReadOnly: Boolean;
    procedure DataChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetItemIndex: Integer;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetValue(const Value: string);
    procedure SetItemIndex(const Value: Integer);
    function GetReadOnlyField: Boolean;
    procedure SetReadOnlyField(const Value: Boolean);
  protected
    function CanModify: Boolean;
    procedure Change; dynamic;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property DataLink: TFieldDataLink read FDataLink;
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Enter(Sender: TObject);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property Value: string read FValue write SetValue;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property ReadOnlyField: Boolean read GetReadOnlyField write SetReadOnlyField default False;

  published
    property OnClickItem: TNotifyEvent read FOnClickItem write FOnClickItem;
    property Align;
    property Anchors;
    property Caption;
    property Color;
    property Constraints;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read fReadOnly write fReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnStartDrag;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

{ TtecRadioButton }

procedure TtecRadioButton.Click;
var
  cnt: Integer;
begin
  if Parent.InheritsFrom(TtecDBRadioGroup) then
  begin
    if not TtecDBRadioGroup(parent).ReadOnlyField and not self.readonly then
    begin
      inherited;
        TtecDBRadioGroup(Parent).SetValue(Self.Value);
        TtecDBRadioGroup(Parent).UpdateData(Self);
        if Assigned(TtecDBRadioGroup(Parent).FOnClickItem) then
          TtecDBRadioGroup(Parent).FOnClickItem(Self);
    end;
  end;

  (*
    else

    begin
//      if not vBloquear then
      begin
//        vBloquear := true;
        if Assigned(TtecDBRadioGroup(Parent).FOnClickItem) then
          if TtecDBRadioGroup(Parent).datasource.dataset.recordcount <> 0 then
             TtecDBRadioGroup(Parent).FOnClickItem(Self);

        self.Checked := false;
        {
        for cnt := 0 to TtecDBRadioGroup(Parent).ControlCount - 1 do
        begin
          if TtecDBRadioGroup(Parent).value = TtecRadioButton(TtecDBRadioGroup(Parent).Controls[cnt]).value then
          begin
            TtecRadioButton(TtecDBRadioGroup(Parent).Controls[cnt]).checked := true;
            break;
          end;
        end;
        exit;
        }
      end;

    end;
  end;
  *)

end;


constructor TtecRadioButton.Create(AOwner: TComponent);
begin
  inherited;
//  self.OnMouseMove := MouseMove;
  self.OnClick := OnClickButtom;
  ExibirMSG := true;
  self.Checked := false;

end;

  {
procedure TtecRadioButton.MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  self.ReadOnly := TtecDBRadioGroup(Parent).ReadOnly;
end;
}

procedure TtecRadioButton.OnClickButtom(Sender: TObject);
begin
//  if self.enabled then
//    mensagemaviso('Este atendimento refere-se a um orçamento.');
end;

procedure TtecRadioButton.SetChecked(Value: Boolean);
var
  Parent: TCustomForm;
  Control: TWinControl;

begin
  Control:= nil;
  Parent := GetParentForm(Self);
//  if Parent.Active then begin
    if (Parent <> nil) then
      if not (Parent.ActiveControl is TtecRadioButton) then
        Control:= Parent.ActiveControl;

    inherited;


    try
      if Assigned(Parent) and (Control <> nil) and (Control.CanFocus) then
        Parent.FocusControl(Control)
    except
    end;
//  end;  
end;

{ TtecDBRadioGroup}

function TtecDBRadioGroup.CanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

procedure TtecDBRadioGroup.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

constructor TtecDBRadioGroup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  self.OnMouseMove := MouseMove;
  self.OnEnter := Enter;
end;

procedure TtecDBRadioGroup.DataChange(Sender: TObject);
var
  cnt: Integer;
begin
  if FDataLink.Field <> nil then
  begin
    SetValue(FDataLink.Field.Text);
    Change;
    for cnt := 0 to ControlCount - 1 do
//      if Controls[cnt].InheritsFrom(TtecRadioButton) and (TtecRadioButton(Controls[cnt]).Value = Value) then
      if Controls[cnt].InheritsFrom(TtecRadioButton) then
        if (TtecRadioButton(Controls[cnt]).Value = Value) then
//        if TtecRadioButton(Controls[cnt]).CanFocus then
           TtecRadioButton(Controls[cnt]).Checked := True
        else
//        if TtecRadioButton(Controls[cnt]).CanFocus then
          TtecRadioButton(Controls[cnt]).Checked := False;
  end
  else
    SetValue('');
end;

destructor TtecDBRadioGroup.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TtecDBRadioGroup.Enter(Sender: TObject);
var i: integer;
begin
  if self.enabled and not self.readonly then
  begin
    for i:= 0 to self.ControlCount -1 do
    begin
      if readonly or TtecRadioButton(self.Controls[i]).readonly or readonlyfield then
      begin
        if self.Controls[i] is TtecRadioButton then
          if not TtecRadioButton(self.Controls[i]).Checked then

//           TtecRadioButton(self.Controls[i]).readonly := true;
          self.Controls[i].Enabled := false;
//          self.enabled := false;
      end
      else
      begin
        if self.Controls[i] is TtecRadioButton then
          if not TtecRadioButton(self.Controls[i]).Checked then
//            TtecRadioButton(self.Controls[i]).readonly := false;
          self.Controls[i].Enabled := true;
//           self.enabled := true;
      end;
    end;
  end;

end;

function TtecDBRadioGroup.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := ((inherited ExecuteAction(Action) or (DataLink <> nil)) and
    DataLink.ExecuteAction(Action));

    {
  if self.DataSource.DataSet.FieldByName(self.DataField).ReadOnly then
    self.Enabled := false
  else
    self.Enabled := true;
    }
end;

function TtecDBRadioGroup.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TtecDBRadioGroup.GetDataSource: TDataSource;
begin
    if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;

end;

function TtecDBRadioGroup.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TtecDBRadioGroup.GetItemIndex: Integer;
var
  cnt: Integer;
begin
  Result := -1;
  for cnt := 0 to ControlCount - 1 do
  begin
    if Controls[cnt].InheritsFrom(TtecRadioButton) and (TtecRadioButton(Controls[cnt]).Checked) then
    begin
      Result := TtecRadioButton(Controls[cnt]).TabOrder;
      Break;
    end;
  end;
end;

function TtecDBRadioGroup.GetReadOnlyField: Boolean;
begin
  Result := FDataLink.ReadOnly;

  if not result then
    if fdatalink.field <> nil then
      result :=  fdatalink.field.ReadOnly;

  if not result then
    if assigned(self.DataSource) then
      if assigned(self.DataSource.DataSet) then
        result := self.DataSource.DataSet.FieldByName(self.DataField).ReadOnly

end;

procedure TtecDBRadioGroup.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  case Key of
    #8, ' ': FDataLink.Edit;
    #27: FDataLink.Reset;
  end;
end;


procedure TtecDBRadioGroup.MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var i: integer;
begin
  if self.enabled and not self.readonly then
  begin
    for i:= 0 to self.ControlCount -1 do
    begin
      if ReadOnly or TtecRadioButton(self.Controls[i]).readonly or readonlyfield then
      begin
        if self.Controls[i] is TtecRadioButton then
          if not TtecRadioButton(self.Controls[i]).Checked and TtecRadioButton(self.Controls[i]).enabled then
          begin
//            TtecRadioButton(self.Controls[i]).readonly := true;
            self.Controls[i].Enabled := false;
//              self.enabled := false;
          end;
      end
      else
      begin
        if self.Controls[i] is TtecRadioButton then
          if not TtecRadioButton(self.Controls[i]).Checked and TtecRadioButton(self.Controls[i]).enabled then
          begin
//            TtecRadioButton(self.Controls[i]).readonly := false;
            self.Controls[i].Enabled := true;
//              self.enabled := true;
          end;
      end;
    end;
  end;  
end;


procedure TtecDBRadioGroup.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  {
  if(Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
    }
end;

procedure TtecDBRadioGroup.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TtecDBRadioGroup.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then
    Value.FreeNotification(Self);
end;

procedure TtecDBRadioGroup.SetItemIndex(const Value: Integer);
var
  cnt: Integer;
begin
  for cnt := 0 to ControlCount - 1 do
  begin
    if Controls[cnt].InheritsFrom(TtecRadioButton) and (TtecRadioButton(Controls[cnt]).TabOrder = Value) then
      if TtecRadioButton(Controls[cnt]).CanFocus then
        TtecRadioButton(Controls[cnt]).Checked := True
    else
      if TtecRadioButton(Controls[cnt]).CanFocus then
        TtecRadioButton(Controls[cnt]).Checked := False;
  end;
end;

procedure TtecDBRadioGroup.SetReadOnlyField(const Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
  enabled := not Value;
end;

procedure TtecDBRadioGroup.SetValue(const Value: string);
begin
  if Value <> FValue then
    FValue := Value;
end;

function TtecDBRadioGroup.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := ((inherited UpdateAction(Action) or (DataLink <> nil)) and
    DataLink.UpdateAction(Action));

end;

procedure TtecDBRadioGroup.UpdateData(Sender: TObject);
var
  vOldValue: Variant;
begin
  if FDataLink.Field <> nil then
    if FDataLink.CanModify then
    begin
      vOldValue := FDataLink.Field.OldValue;

      if (value <> FDataLink.Field.Value) and not ReadOnly and not ReadOnlyField then
      {
         (not FDataLink.ReadOnly and
          not fdatalink.field.ReadOnly and
          not self.DataSource.DataSet.FieldByName(self.DataField).ReadOnly
          ) then
          }
      begin
         FDataLink.Field.Text := Value;
         FDataLink.DataSet.Edit;
         FDataLink.Field.Text := Value;
      end;
    end;
end;


end.
