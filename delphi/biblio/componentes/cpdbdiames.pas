unit cpdbdiames;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, DB, ctconstantes, clParametrosSistema,
  Windows;

type
  TDBEditDiaMes = class(TCustomEdit)
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
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read GetField;
    property DataBase: TDateTime read GetDataBase write SetDataBase;
    property DataValida: Boolean read GetDataValida;
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
{ CLX_TO_VCL    property OnKeyString;}
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

function TDBEditDiaMes.GetDataBase: TDateTime;
begin
  Result := FDataBase;
end;

procedure TDBEditDiaMes.SetDataBase(const Value: TDateTime);
begin
  FDataBase := Value;
end;

procedure TDBEditDiaMes.DoExit;
var
  Data: String;
  Ano: String;
begin
  Color:= clWindow;
  Data:= Trim(Text);
  if Length(Data) = 8 then
  begin
    Ano:= Copy(Data,07,02);
    try
//      if (StrToInt(Ano) > 50) then Insert('19',Data,7)
//                              else Insert('20',Data,7);

      if (StrToInt(Ano) >= ParSistema.Seculo) then Insert('19',Data,7)
                                              else Insert('20',Data,7);

    except
    end;
    Text:= Data;
  end;

  if not ReadOnly and not GetDataValida then begin
     if CanFocus then SetFocus;
  end;

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

procedure TDBEditDiaMes.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);

  if FDataLink.CanModify then
  begin
    {
    if (Key = VK_Delete) or
       (Key = VK_BACK) or
       ((Key = VK_INSERT) and (ssShift in Shift)) then
        FDataLink.Edit;
    }

    {
    if (Key in [32..255]) and
       ((GetCharFromVirtualKey(Key)<>'') and
        not (GetCharFromVirtualKey(Key)[1] in ['0'..'9'])) then
    begin
      Key := 0;
      messagebeep(0);
    end
    else
    begin
    }

    if (Key in [32..255]) and
       ((GetCharFromVirtualKey(Key)<>'') and
        (GetCharFromVirtualKey(Key)[1] in ['0'..'9'])) then
    begin
      if (length(Text) = 2) and (sellength=0) then
      begin
//        self.OnKeyDown := nil;
        Text := Text + '/';
        self.SelStart := length(Text);
//        self.OnKeyDown := OnKeyDown;
      end;

      {
      if (Length(Novo) < 5) or ((Length(Novo) = 5) and (SelLength = 5)) then
      begin
         Text:= Novo;
         self.SelStart := length(Text);
      end
      else
      begin
        Key:= 0;
        messagebeep(0);
      end;
      }
    end;
  end;

end;

procedure TDBEditDiaMes.Change;
var
  NC:    byte;
  Novo:  String;
begin
  if FDataLink.CanModify then begin
    NC := 1;
    Novo := '';
    while NC <= Length(Text) do begin
       if (Char(Text[NC]) in ['0'..'9','/']) then
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

constructor TDBEditDiaMes.Create(AOwner: TComponent);
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

procedure TDBEditDiaMes.DataChange(Sender: TObject);
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

destructor TDBEditDiaMes.Destroy;
begin
  FDataLink.Free;
  inherited Destroy;
end;

procedure TDBEditDiaMes.DoEnter;
begin
  inherited;
  if Focused then
    Color:= CorFundoControle;
  // // //Alignment:=taLeftJustify;
end;

function TDBEditDiaMes.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

function TDBEditDiaMes.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TDBEditDiaMes.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBEditDiaMes.GetDataSource: tDataSource;
begin
  if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;
end;

function TDBEditDiaMes.GetField: TField;
begin
 Result := FDataLink.Field;
end;

function TDBEditDiaMes.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBEditDiaMes.KeyPress(var Key: Char);
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

procedure TDBEditDiaMes.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;
    }
end;

procedure TDBEditDiaMes.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TDBEditDiaMes.Restore;
begin
  if FDataLink.Field <> nil then begin
    MaxLength := -1;
    Alignment := FDataLink.Field.Alignment;
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

procedure TDBEditDiaMes.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBEditDiaMes.SetDataSource(Value: tDataSource);
begin
  if not ((csLoading in ComponentState) and FDataLink.DataSourceFixed) then
    FDataLink.DataSource := Value;
end;

procedure TDBEditDiaMes.SetReadOnly(Value: Boolean);
begin
  inherited ReadOnly := Value;
  FDataLink.ReadOnly := Value;
end;

function TDBEditDiaMes.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TDBEditDiaMes.UpdateData(Sender: TObject);
begin
  if FDataValida then begin
    if FDataLink.Field <> nil then
    begin
      FDataLink.Field.Text := Text + '/' + FAnoExercicio;
      Modified := False;
    end;
  end
  else begin
    Modified := False;
    SetFocus;
  end;
end;


procedure TDBEditDiaMes.Resize;
begin
  if (csDesigning in ComponentState) then
    Height := 23
  else
    inherited;
end;

function TDBEditDiaMes.GetDataValida: Boolean;
var
  Data: TDateTime;
begin
  inherited;
  Result := True;
  Data := 0;
  if not DataEmBranco(Text) then
  begin
    try
      Data := StrToDate(Text + '/' + FAnoExercicio) - FAdicional;
    except
      on E: EConvertError do begin
               MensagemAviso('A data "' + Text + '/' + FAnoExercicio + '" é inválida!');
               Result := False;
            end;
    end;


    if Result and not field.ReadOnly and not self.ReadOnly then
    begin
      if (Data < FDataBase - FMinimo) then
      begin
        if assigned(MensagemPadronizada) then
          MensagemPadronizada
        else
          MensagemAviso(format('Data inferior ao(s) %d dia(s) permitido(s)!',[FMinimo+1]));

        Result := False;
      end
      else
        if (Data > FDataBase + FMaximo) then
        begin
          MensagemAviso(format('Data superior ao(s) %d dia(s) permitido(s)!',[FMaximo]));
          Result := False;
        end;
    end;
  end
  else
     if not FOpcional then
     begin
       MensagemAviso('Data não preenchida!');
       Result := False;
     end
     else
       Result := True;

  FDataValida := Result;
end;

function TDBEditDiaMes.GetAlignment: TAlignment;
begin
  Result := FAlignment
end;

procedure TDBEditDiaMes.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd
  end;
end;

procedure TDBEditDiaMes.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case FAlignment of
    taLeftJustify  : Params.Style  := Params.Style or ES_LEFT;
    taRightJustify : Params.Style := Params.Style or ES_RIGHT;
    taCenter       : Params.Style := Params.Style or ES_CENTER;
  end;
end;

procedure TDBEditDiaMes.Click;
begin
  inherited;
  {
  if self.seltext='' then
    self.selectall;
    }

end;

end.
