unit cpdbedittext;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, DB, ctconstantes, clParametrosSistema,
  Windows;

type
  TDBEditText = class(TCustomEdit)
  private
    FAlignment: TAlignment;
    FOpcional: Boolean;
    FMaximo: Word;
    FMinimo: Word;
    FAdicional: Word;
    FDataBase: TDateTime;
    FDataLink: TFieldDataLink;
    FTextLocked: Boolean;
    FDatasetLocked: Boolean;
    FAnoExercicio: String;
    FMensagemPadronizada: TtecProcedure;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: tDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure Restore;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: tDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    function  GetDataBase: TDateTime;
    procedure SetDataBase(const Value: TDateTime);
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);
  protected
    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Resize; override;
    function  EditCanModify: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Reset;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Click; override;



  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property DataBase: TDateTime read GetDataBase write SetDataBase;
    property MensagemPadronizada: TtecProcedure read FMensagemPadronizada write FMensagemPadronizada;

  published
    property Alignment: TAlignment read GetAlignment write SetAlignment;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: tDataSource read GetDataSource write SetDataSource;
    property DragMode;
    property Enabled;
    property Font;
    property MaxLength;
    property Maximo: Word read FMaximo write FMaximo;
    property Minimo: Word read FMinimo write FMinimo;
    property Adicional: Word read FAdicional write FAdicional;
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
// CLX_TO_CL    property OnKeyString;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property Opcional: Boolean read FOpcional write FOpcional;
    property AnoExercicio: String read FAnoExercicio write FAnoExercicio;
  end;

implementation

uses {Qete,} biblio;

function TDBEditText.GetDataBase: TDateTime;
begin
  Result := FDataBase;
end;

procedure TDBEditText.SetDataBase(const Value: TDateTime);
begin
  FDataBase := Value;
end;

procedure TDBEditText.DoExit;
begin
  try
    FDataLink.UpdateRecord;
    if Assigned(FDataLink.Field) then
      Alignment := FDataLink.Field.Alignment;
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBEditText.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
end;

procedure TDBEditText.Change;
begin
  if not FTextLocked then
  begin
    FDatasetLocked := True;
    try
      FDataLink.Edit;
      FDataLink.Modified;
    finally
      FDatasetLocked := False;
    end;
    inherited Change;
  end;
end;

constructor TDBEditText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  MaxLength := 0;
  FMinimo := 37353;
  FMaximo := 0;
  FOpcional := True;
  FDataBase := Date;
  Height := 23;
end;

procedure TDBEditText.DataChange(Sender: TObject);
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

destructor TDBEditText.Destroy;
begin
  FDataLink.Free;
  inherited Destroy;
end;

procedure TDBEditText.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
  // // //Alignment:=taLeftJustify;
end;

function TDBEditText.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

function TDBEditText.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TDBEditText.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBEditText.GetDataSource: tDataSource;
begin
  if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;
end;

function TDBEditText.GetField: TField;
begin
 Result := FDataLink.Field;
end;

function TDBEditText.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBEditText.KeyPress(var Key: Char);
begin
  if key=#13 then
    key:=#0;

  inherited KeyPress(Key);
end;

procedure TDBEditText.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;
    }
end;

procedure TDBEditText.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TDBEditText.Restore;
begin
  if FDataLink.Field <> nil then begin
    MaxLength := -1;
    { CLX_TO_VCL
    Aignment := FDataLink.Field.Alignment;}
      Text := copy(FDataLink.Field.Text,1,5);
{
    if FDataLink.CanModify then
      Text := copy(FDataLink.Field.Text,1,5)
    else
      Text := FDataLink.Field.DisplayText;}
  end
  else begin
    // // //Alignment:=taLeftJustify;
    if csDesigning in ComponentState then
      Text := Name else
      Text := '';
  end;
  Modified := False;
end;

procedure TDBEditText.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBEditText.SetDataSource(Value: tDataSource);
begin
  if not ((csLoading in ComponentState) and FDataLink.DataSourceFixed) then
    FDataLink.DataSource := Value;
end;

procedure TDBEditText.SetReadOnly(Value: Boolean);
begin
  inherited ReadOnly := Value;
  FDataLink.ReadOnly := Value;
end;

function TDBEditText.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TDBEditText.UpdateData(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    FDataLink.Field.Text := Text;
    Modified := False;
  end;
end;


procedure TDBEditText.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;


function TDBEditText.GetAlignment: TAlignment;
begin
   Result := FAlignment
end;

procedure TDBEditText.SetAlignment(const Value: TAlignment);
begin
    if FAlignment <> Value then
    begin
      FAlignment := Value;
      RecreateWnd
    end
end;

procedure TDBEditText.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case FAlignment of
    taLeftJustify  : Params.Style  := Params.Style or ES_LEFT;
    taRightJustify : Params.Style := Params.Style or ES_RIGHT;
    taCenter       : Params.Style := Params.Style or ES_CENTER;
  end;

end;

procedure TDBEditText.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

end.
