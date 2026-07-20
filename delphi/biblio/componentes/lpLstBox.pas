unit lpLstBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DesignEditors, DesignIntf, {DSGNINTF,} stdctrls, IDGconst;

type

  TFieldBoxProperty = class (TPropertyEditor)
    function GetAttributes : TPropertyAttributes ; override;
    function GetValue: string; override;
    procedure SetValue(const Value: string);override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  TFieldParamsProperty = class(TClassProperty)
  public
    function GetAttributes : TPropertyAttributes ; override;
    procedure Edit;override;
    procedure SetValue(const Value: string);override;
  end;

  TListItemRec = class(TItemRec)
  private
    FUpdated : boolean;
  public
    property Updated : Boolean read FUpdated write FUpdated;
  end;

  TEventCheckListBox = procedure ( Sender : TObject; Index : Integer; item : TListItemRec ) of object;

  TIDGDBListBox = class(TListBox)
  private
    FNameField : string;
    FFieldCheck : string;
    FFieldID : string;

    FDataLink : TDataLink;
    FFieldList : TList;
    FFieldParams : TFieldParams;

    FDrawCheck: boolean;
    FPictureCheck: TPicture;
    FPictureNone: TPicture;
    FOldStyle : TListBoxStyle;

    FOnCheckListBox : TEventCheckListBox;

    function GetDataField :string;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value : string);
    procedure SetDataSource(Value : TDataSource);
    procedure SetPictureCheck(const Value: TPicture);
    procedure SetPictureNone(const Value: TPicture);
    procedure SetDrawCheck(const Value: boolean);
    procedure SetFieldCheck(const Value: string);
    procedure SetFieldID(const Value: string);

  protected
    procedure CreateWnd;override;
    procedure SetRect( var Rect, LeftRect : TRect );
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

  public
    constructor Create(AOwner : TComponent);override;
    destructor Destroy;override;
    procedure FillList;virtual;
    function CurrentData( FieldName : string ) : TItem;
    function ItemData( Index : Integer; FieldName : string) : TItem;
    function Locate( FieldNames : string; Value : Variant; Options : TLocateOptions ) : Integer;

    procedure Post;

  published
    property FieldsList : TFieldParams read FFieldParams write FFieldParams;
    property FieldName : string read GetDataField write SetDataField;
    property FieldCheck : string read FFieldCheck write SetFieldCheck;
    property FieldID : string read FFieldID write SetFieldID;

    property DataSource : TDataSource read GetDataSource write SetDataSource;

    property DrawCheck : boolean read FDrawCheck write SetDrawCheck;
    property PictureCheck : TPicture read FPictureCheck write SetPictureCheck;
    property PictureNone : TPicture read FPictureNone write SetPictureNone;

    property OnCheckListBox : TEventCheckListBox read FOnCheckListBox write FOnCheckListBox;
  end;

//procedure Register;

implementation

{$R *.res}

uses FldFrm;


//*********************** TFieldParamsProperty ********************************//

function TFieldParamsProperty.GetAttributes : TPropertyAttributes ;
begin
   Result := [paMultiSelect,paDialog, paAutoUpdate];
end;

procedure TFieldParamsProperty.Edit;
var
  dialog : TfmFieldsEdit;
  i : Integer;
  ComboBox : TIDGDBListBox;
  DataSet : TDataSet;
begin

  ComboBox := TIDGDBListBox( GetComponent(0));
  DataSet := ComboBox.DataSource.DataSet;
  if ( Assigned( DataSet ) ) then begin
    dialog := TfmFieldsEdit.CreateForm(Application, DataSet );

    for i := 0 to ComboBox.FFieldParams.Count - 1 do
      dialog.AddStoredField( ComboBox.FFieldParams.Items[i].FieldName );
    dialog.FillList;

    try
      if Dialog.ShowModal = IDOK then begin
        ComboBox.FFieldParams.Clear;
      for i := 0 to dialog.lbStoredField.Items.Count - 1 do begin
        comboBox.FFieldParams.CreateParam(dialog.lbStoredField.Items[i]);
      end;
        SetValue('New');
      end;
    finally
      Dialog.Free;
    end;
  end;
end;

procedure TFieldParamsProperty.SetValue(const Value: string);
begin
  SetStrValue(Value);
end;

//************************ TFieldBoxProperty ***************************************//

function TFieldBoxProperty.GetAttributes : TPropertyAttributes ;
begin
   Result := [paMultiSelect,paValueList];
end;

procedure TFieldBoxProperty.GetValues(Proc: TGetStrProc);
var
   I : Integer;
   DSource : TDataSource;
   FActive : Boolean;
begin
  DSource := TIDGDBListBox( GetComponent(0) ).DataSource ;
  if ( Assigned( DSource ) ) then
    if ( Assigned( DSource.DataSet ) ) then begin
      FActive := DSource.DataSet.Active;
      if not FActive then DSource.DataSet.Active := True;
      for I := 0 to DSource.DataSet.FieldCount - 1 do
        Proc( DSource.DataSet.Fields[I].FieldName );
      DSource.DataSet.Active := FActive;
    end;
end;

function TFieldBoxProperty.GetValue: string;
begin
  Result := GetStrValue;
end;

procedure TFieldBoxProperty.SetValue(const Value: string);
begin
  SetStrValue(Value);
end;

//************************* TIDGDBListBox ***************************************//

function TIDGDBListBox.GetDataField :string;
begin
  Result := FNameField;
end;

function TIDGDBListBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TIDGDBListBox.SetDataField(const Value : string);
begin
  FNameField := Value;
end;

procedure TIDGDBListBox.SetDataSource(Value : TDataSource);
begin
  FDataLink.DataSource := Value;
end;


constructor TIDGDBListBox.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  FFieldParams := TFieldParams.Create;
  FDataLink := TDataLink.Create;
  FFieldList := TList.Create;

  FPictureCheck := TPicture.Create;
  FPictureNone := TPicture.Create;

end;

destructor TIDGDBListBox.Destroy;
begin
  FFieldParams.Free;
  FDataLink.Free;
  FFieldList.Free;

  FPictureCheck.Free;
  FPictureNone.Free;
  inherited Destroy;
end;


procedure TIDGDBListBox.FillList;
var
  FActive : boolean;
  Bookmark : TBookmark;
  id : TListItemRec;
  i : integer;
begin
  FFieldList.Clear;
  Items.Clear;

  Bookmark := nil;
  if ( Assigned( DataSource ) ) then
    if ( Assigned( DataSource.DataSet ) ) then begin
      FActive := DataSource.DataSet.Active;
      if not FActive then DataSource.DataSet.Active := True;
      if FActive then
        Bookmark := DataSource.DataSet.GetBookmark;

      DataSource.DataSet.First;
      while not DataSource.DataSet.EOF do begin
        id := TListItemRec.Create;
        for i := 0 to FFieldParams.Count - 1 do begin
          id.AddParam( FFieldParams.Items[i].FieldName,
                DataSource.DataSet.FieldByName(FFieldParams.Items[i].FieldName).Value );
        end;
        FFieldList.Add(id);
        Items.Add(DataSource.DataSet.FieldByName(FNameField).DisplayText);
        DataSource.DataSet.Next;
      end;
      if FActive then
        DataSource.DataSet.GotoBookmark(bookmark);
      DataSource.DataSet.Active := FActive;
    end;
  if (Items.Count > 0) then
    ItemIndex := 0;

end;

procedure TIDGDBListBox.CreateWnd;
begin
  inherited CreateWnd;
  if not(csDesigning in ComponentState) then begin
    FillList;
  end;
end;

function TIDGDBListBox.CurrentData( FieldName : string ) : TItem;
var
  id : TListItemRec;
begin
//  Result := nil;
  if (Items.Count > 0) and (ItemIndex > -1) then begin
    id := TListItemRec(FFieldList[ItemIndex]);
    Result := id.FieldByName(FieldName);
  end
  else
    raise Exception.Create('Не выбран элемент');
end;

function TIDGDBListBox.ItemData(Index: Integer; FieldName: string): TItem;
var
  id : TListItemRec;
begin
  if (Items.Count > Index ) and ( Index > -1) then begin
    id := TListItemRec(FFieldList[Index]);
    Result := id.FieldByName(FieldName);
  end
  else
    raise Exception.Create('Не выбран элемент');
end;


procedure TIDGDBListBox.SetPictureCheck(const Value: TPicture);
begin
  FPictureCheck.Assign( Value );
  if FPictureCheck.Bitmap.Width = 0 then
    FPictureCheck.Bitmap.LoadFromResourceName( hInstance, 'CHECK');
end;

procedure TIDGDBListBox.SetPictureNone(const Value: TPicture);
begin
  FPictureNone.Assign( Value );
  if FPictureNone.Bitmap.Width = 0 then
    FPictureNone.Bitmap.LoadFromResourceName( hInstance, 'NONE');

end;

procedure TIDGDBListBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  OldColor : TColor;
  pictRect : TRect;
begin
  if FDrawCheck then begin
    SetRect( Rect, pictRect);

    OldColor := Canvas.Brush.Color;
    Canvas.Brush.Color := Color;
    Canvas.FillRect(pictRect);
    Canvas.Brush.Color := OldColor;

    if ( FFieldCheck <> '' ) and ( ItemData( Index, FFieldCheck ).asInteger > 0 ) then
      Canvas.Draw( pictRect.Left, pictRect.Top, FPictureCheck.Graphic )
    else
      Canvas.Draw( pictRect.Left, pictRect.Top, FPictureNone.Graphic );
  end;
  inherited DrawItem( Index, Rect, State );
end;

procedure TIDGDBListBox.SetRect(var Rect, LeftRect: TRect);
var
  pictRect : TRect;
  widthRect : Integer;
begin
  widthRect := Rect.Bottom - Rect.Top;
  LeftRect := Classes.Rect( Rect.Left, Rect.Top, Rect.Left + widthRect + 2, Rect.Bottom );
  Rect.Left := Rect.Left + widthRect + 2;
end;

procedure TIDGDBListBox.SetDrawCheck(const Value: boolean);
begin
   FDrawCheck := Value;
   if FDrawCheck then begin
     FOldStyle := Style;
     Style := lbOwnerDrawVariable;
    if FPictureCheck.Bitmap.Width = 0 then
      FPictureCheck.Bitmap.LoadFromResourceName( hInstance, 'CHECK');
    if FPictureNone.Bitmap.Width = 0 then
      FPictureNone.Bitmap.LoadFromResourceName( hInstance, 'NONE');

   end
   else begin
     Style := FOldStyle;
   end;

   Invalidate;
end;

procedure TIDGDBListBox.SetFieldCheck(const Value: string);
begin
  if ( Assigned( DataSource ) ) and
    ( Assigned( DataSource.DataSet ) ) and
    not ( DataSource.DataSet.FieldByName(Value) is TNumericField ) then
    raise Exception.Create('The field must have a numeric type.');

  FFieldCheck := Value;
end;

procedure TIDGDBListBox.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  index : Integer;
  rect, leftRect : TRect;
  id : TListItemRec;
  item : TItem;
begin
  if FDrawCheck and ( Button = mbLeft ) then begin
    index := ItemAtPos( Point(x, y), true);
    if index > -1 then begin
      rect := ItemRect( index );
      SetRect( rect, leftRect );

      if ( leftRect.Left < X ) and (leftRect.Top < Y) and
        (leftRect.Bottom > Y) and (leftRect.Right > X) then begin
        id := TListItemRec(FFieldList[Index]);
        item := id.FieldByName(FieldCheck);

        if item.AsInteger > 0 then
          item.AsInteger := 0
        else
          item.AsInteger := 1;

        if Assigned( FOnCheckListBox) then
          FOnCheckListBox( self, Index, TListItemRec(FFieldList[Index]) )
        else begin
          if FFieldID = '' then
            raise Exception.Create('Define the property FieldID.');
        end;
        rect := ItemRect( index );
        InvalidateRect( Handle, @rect, true );

        //Помечается для обновления
        id.Updated := true;
      end;
    end;
  end;
  inherited MouseDown(Button, Shift, X, Y );
end;

procedure TIDGDBListBox.SetFieldID(const Value: string);
begin
  FFieldID := Value;
end;

procedure TIDGDBListBox.Post;
var
  i : Integer;
  id : TListItemRec;
  Active : boolean;
begin
  if Assigned(DataSource) and Assigned(DataSource.DataSet ) then begin
    Active := DataSource.DataSet.Active;
    DataSource.DataSet.Open;
    for i := 0 to FFieldList.Count - 1 do begin
      id := TListItemRec(FFieldList[i]);
      if id.Updated then begin
        if DataSource.DataSet.Locate( FFieldID, id.FieldByName(FFieldId).Value, [] ) then begin
          DataSource.DataSet.Edit;
          DataSource.DataSet.FieldByName(FieldCheck).AsInteger := id.FieldByName(FieldCheck).AsInteger;
        end;
      end;
    end;
    DataSource.DataSet.Post;
    DataSource.DataSet.Active := Active;
  end
  else
    raise Exception.Create('Heвозможно выполнить операцию на закрытом DataSet');
end;

function TIDGDBListBox.Locate(FieldNames: string; Value: Variant;
  Options: TLocateOptions): Integer;
var
  Fields : TItemRec;
  i : Integer;
  id : TItemRec;
begin
  Result := -1;
  Fields := TItemRec.Create;
  try
    GetFieldNames( Fields, FieldNames, Value );
    for i := 0 to FFieldList.Count - 1 do begin
      id := FFieldList[i];
      if CompareItemRec( Fields, id, Options ) then begin
        Result := i;
        exit;
      end;
    end;
  finally
    Fields.Free;
  end;
end;


{
procedure Register;
begin
  RegisterComponents('TecSoft', [TIDGDBListBox]);
  RegisterComponentEditor(TIDGDBListBox, TAboutEditor);
  RegisterPropertyEditor(TypeInfo(TFieldParams),TIDGDBListBox,'FieldsList',TFieldParamsProperty);
  RegisterPropertyEditor(TypeInfo(string),TIDGDBListBox,'FieldName',TFieldBoxProperty);
  RegisterPropertyEditor(TypeInfo(string),TIDGDBListBox,'FieldCheck',TFieldBoxProperty);
  RegisterPropertyEditor(TypeInfo(string),TIDGDBListBox,'FieldID',TFieldBoxProperty);
end;

 }


end.
