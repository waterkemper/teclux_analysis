unit cpdbmesano;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, DB, ctconstantes, windows;

type
  TDBEditmesano = class(TCustomEdit)
  private
    FAlignment: TAlignment;
    FDataValida: Boolean;
    FOpcional: Boolean;
    FMaximo: Word;
    FMinimo: Word;
    FAdicional: Word;
    FDataBase: TDateTime;
    FDataLink: TFieldDataLink;
    FTextLocked: Boolean;
    FDatasetLocked: Boolean;
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure Restore;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    function  GetDataBase: TDateTime;
    procedure SetDataBase(const Value: TDateTime);
    function GetDataValida: Boolean;
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
    function Criticar(Mensagem: Boolean): Boolean;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property DataBase: TDateTime read GetDataBase write SetDataBase;
    property DataValida: Boolean read GetDataValida;
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
    property DataSource: TDataSource read GetDataSource write SetDataSource;
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
{CLX_TO_VCL    property OnKeyString;}
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property Opcional: Boolean read FOpcional write FOpcional;
  end;

implementation

uses {Qete,} biblio;

function TDBeditmesano.GetDataBase: TDateTime;
begin
  Result := FDataBase;
end;

procedure TDBeditmesano.SetDataBase(const Value: TDateTime);
begin
  FDataBase := Value;
end;

procedure TDBeditmesano.DoExit;
begin
  Color:= clWindow;
  if not ReadOnly and not GetDataValida then begin
     if CanFocus then SetFocus;
  end;
  try
    FDataLink.UpdateRecord;
    { CLX_TO_VCL
    if Assigned(FDataLink.Field) then
      Alignment := FDataLink.Field.Alignment;}
  except
    SelectAll;
    SetFocus;
    raise;
  end;
  inherited;
end;

procedure TDBeditmesano.KeyDown(var Key: Word; Shift: TShiftState);
var
  Novo: String;
begin
  inherited KeyDown(Key, Shift);

  if FDataLink.CanModify then
  begin
  {
    if (Key = VK_Delete) or ((Key = VK_INSERT) and (ssShift in Shift)) then
      FDataLink.Edit;
  }
    if (Key in [32..255]) and
       ((GetCharFromVirtualKey(Key)<>'') and
        (GetCharFromVirtualKey(Key)[1] in ['0'..'9'])) then
    begin
//      Key := 0;
//      MessageBeep(0);
//    end
//    else
//    begin
//      Novo:= Trim(Text);

      if (Length(Text) = 2) and (SelLength=0) then
      begin
        Text := Text + '/';
        self.SelStart := length(Text);
      end;

      {
      if (Length(Novo) < 7) or ((Length(Novo) = 7) and (SelLength = 7)) then
        Text:= Novo
      else
      begin
        Key:= 0;
        MessageBeep(0);
      end;
      }
    end;
  end;
end;

procedure TDBeditmesano.Change;
var
  NC:    byte;
  Novo:  String;
begin
  if FDataLink.CanModify then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if (Char(Text[NC]) in ['0'..'9',{DateSeparator} '/']) then
          Novo := Novo + Text[NC];
       Inc(NC);
    end;
    Text := Novo;
  end;

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

constructor TDBeditmesano.Create(AOwner: TComponent);
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
  Width  := 60;
end;

procedure TDBeditmesano.DataChange(Sender: TObject);
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

destructor TDBeditmesano.Destroy;
begin
  FDataLink.Free;
  inherited Destroy;
end;

procedure TDBeditmesano.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
  // // //Alignment:=taLeftJustify;
end;

function TDBeditmesano.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

function TDBeditmesano.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TDBeditmesano.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBeditmesano.GetDataSource: TDataSource;
begin
  if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;

end;

function TDBeditmesano.GetField: TField;
begin
 Result := FDataLink.Field;
end;

function TDBeditmesano.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBeditmesano.KeyPress(var Key: Char);
begin
//  inherited KeyPress(Key);
  if FDataLink.CanModify then begin
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
    end
  end
  else
    Key:= #0;

  if key=#13 then
    key:=#0;
    
  inherited KeyPress(Key);
end;

procedure TDBeditmesano.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;
    }
end;

procedure TDBeditmesano.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TDBeditmesano.Restore;
begin
  if FDataLink.Field <> nil then begin
    MaxLength := -1;
     Alignment := FDataLink.Field.Alignment;
    if FDataLink.CanModify then
      Text := FDataLink.Field.Text
    else
      Text := FDataLink.Field.DisplayText;
  end
  else begin
    // // //Alignment:=taLeftJustify;
    if csDesigning in ComponentState then
      Text := Name else
      Text := '';
  end;
  Modified := False;
end;

procedure TDBeditmesano.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBeditmesano.SetDataSource(Value: TDataSource);
begin
  if not ((csLoading in ComponentState) and FDataLink.DataSourceFixed) then
    FDataLink.DataSource := Value;
end;

procedure TDBeditmesano.SetReadOnly(Value: Boolean);
begin
  inherited ReadOnly := Value;
  FDataLink.ReadOnly := Value;
end;

function TDBeditmesano.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TDBeditmesano.UpdateData(Sender: TObject);
begin
  if FDataValida then begin
    if FDataLink.Field <> nil then
    begin
      FDataLink.Field.Text := Text;
      Modified := False;
    end;
  end
  else begin
    Modified := False;
    SetFocus;
  end;
end;


procedure TDBeditmesano.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

function TDBeditmesano.GetDataValida: Boolean;
var
  Data: TDateTime;
begin
  inherited;
  Result := True;
  Data := 0;
  if not mesanoEmBranco(Text) then begin
    try
      Data := strtodate('01' + '/' + copy(Text,1,2) + '/' + copy(Text,4,4)) - FAdicional;
    except
      on E: EConvertError do Result := False;
    end;
    if not Result
       or (Length(Text) < 7)
       or (Data < FDataBase - FMinimo)
       or (Data > FDataBase + FMaximo) then
    begin
      MensagemAviso('Data Inválida !');
      Result := False;
    end
    else
      Result := True;
  end
  else
     if not FOpcional then begin
       MensagemAviso('Data Inválida !');
       Result := False;
     end
     else
       Result := True;
  FDataValida:= Result;
end;

function TDBeditmesano.Criticar(Mensagem: Boolean): Boolean;
var
  Data: TDateTime;
begin
  inherited;
  Result := True;
  Data := 0;
  if not mesanoEmBranco(Text) then begin
    try
      Data := StrToDate(Text) - FAdicional;
    except
      on E: EConvertError do Result := False;
    end;
    if not Result
       or (Length(Text) < 10)
       or (Data < FDataBase - FMinimo)
       or (Data > FDataBase + FMaximo) then
    begin
      if Mensagem then
       MensagemAviso('Data Inválida !');
      Result := False;
    end
    else
      Result := True;
  end
  else
     if not FOpcional then begin
      if Mensagem then
        MensagemAviso('Data Inválida !');
       Result := False;
     end
     else
       Result := True;
  FDataValida:= Result;
end;

function TDBEditmesano.GetAlignment: TAlignment;
begin
  Result := FAlignment
end;

procedure TDBEditmesano.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd
  end;
end;

procedure TDBEditmesano.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case FAlignment of
    taLeftJustify  : Params.Style  := Params.Style or ES_LEFT;
    taRightJustify : Params.Style := Params.Style or ES_RIGHT;
    taCenter       : Params.Style := Params.Style or ES_CENTER;
  end;

end;

procedure TDBEditmesano.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

end.
