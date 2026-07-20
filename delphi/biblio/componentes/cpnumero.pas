unit cpnumero;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, windows,
  StdCtrls, Mask, DBCtrls, DB, ctconstantes, biblio, clparametrossistema;

type
  TtecTipoMascara = (tmGERAL, tmQUANTIDADE);
  TEditNumero = class(TEdit)
  private
    FModificado: Boolean;
    FNegativo: Boolean;
    FTamanho: Integer;
    FTamanhoQuantidade: Integer;
    FValue: Extended;
    FDecimaisQuantidade: Boolean;
    FNrDecimal: Integer;
    FNrDecimalQuantidade: Integer;
    FMascara: Boolean;
    FMascaraQuantidade: Boolean;
    FOldValue : String;
    FTipoMascara: TtecTipoMascara;
    FDecimais: Boolean;
    FAlignment: TAlignment;
    FValorMinimo: Extended;
    FValorMaximo: Extended;
    function GetDecimais: Boolean;
    procedure SetTipoMascara(const Value: TtecTipoMascara);
    function GetNrDecimal: Integer;
    function GetMascara: Boolean;
    function GetTamanho: Integer;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetNrDecimal(const Value: Integer);
  protected
    CorOriginal: tcolor;
    function  GetValorSemFormatacao: Variant;
    procedure SetFloatValue(const Value: Extended);
    procedure FormataTexto;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Change; override;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    property ValorSemFormatacao: Variant read GetValorSemFormatacao;
    function Criticar(Mensagem: Boolean): Boolean;
    property  Value: Extended read FValue write SetFloatValue;
  published
    property Mascara: Boolean read GetMascara write FMascara;
    property Alignment: TAlignment read GetAlignment write SetAlignment default taRightJustify;
    property TipoMascara: TtecTipoMascara read FTipoMascara write SetTipoMascara;
    property NrDecimal: Integer read GetNrDecimal write SetNrDecimal;
    property Decimais:  Boolean read GetDecimais  write FDecimais;
    property Negativo:  Boolean read FNegativo  write FNegativo;
    property Tamanho:   Integer read GetTamanho   write FTamanho;
    property ValorMaximo : Extended read FValorMaximo write fValorMaximo;
    property ValorMinimo : Extended read FValorMinimo write fValorMinimo;

    property Modificado : Boolean read FModificado;
    property OldValue : String read FOldValue;
    property Color;

  end;

  TDBEditNumero = class(TEditNumero)  // TCustomEdit
  private
    FDataLink: TFieldDataLink;
    FTextLocked: Boolean;
    FDatasetLocked: Boolean;
//    FDecimais: Boolean;
//    FNegativo: Boolean;
//    FTamanho: Integer;
//    FNrDecimal: Integer;
//    FValue: Extended;
    FModificado: Boolean;
//    FMascara: Boolean;
    procedure DataChange(Sender: TObject);
    function  GetDataField: string;
    function  GetDataSource: TDataSource;
    function  GetField: TField;
    function  GetReadOnly: Boolean;
    procedure Restore;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetReadOnly(const Value: Boolean);
    procedure UpdateData(Sender: TObject);
//    procedure SetFloatValue(const Value: Extended);
  protected
    CorOriginal: tcolor;
    procedure Change; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    function  EditCanModify: Boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Reset;

//    procedure FormataTexto;
//    property  Value: Extended read FValue write SetFloatValue;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    property Field: TField read GetField;
  published
    property Alignment: TAlignment read GetAlignment write SetAlignment default taRightJustify;
    property Anchors;
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Constraints;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
//    property Decimais:  Boolean read FDecimais  write FDecimais;
    property DragMode;
    property Enabled;
    property Font;
//    property Mascara: Boolean read FMascara write FMascara;
    property MaxLength;
//    property Negativo:  Boolean read FNegativo  write FNegativo;
//    property NrDecimal: Integer read FNrDecimal write FNrDecimal;
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
//    property OnKeyString;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
//    property Tamanho: Integer read FTamanho   write FTamanho default 0;
  end;

  TDBEditNumeroIBGE = class(TDBEditNumero)  // TCustomEdit

  protected
    procedure DoExit; override;
  public
    function ValidarDigitoIBGE: boolean;
  end;
implementation

{ TDBEditNumero }

procedure TDBEditNumero.Change;
begin
//  if ((Text = '') or not FModificado) and FMascara then
//    FormataTexto;
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

constructor TDBEditNumero.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
//  FDataLink.Field.Alignment := taRightJustify;;
  Alignment := taRightJustify;
//  MaxLength := -1;
//  FModificado:= True;
//  FMascara:= True;
//  Decimais:= True;
//  FTamanho:= 9;
//  NrDecimal:= 2;
//  Negativo:= False;
end;

procedure TDBEditNumero.DataChange(Sender: TObject);
begin
  if not FDatasetLocked then
  begin
    FTextLocked := True;
    try
//      if FModificado then
      Restore;
      FormataTexto;
//      FModificado:= False;
      finally
      FTextLocked := False;
    end;
  end;
end;

destructor TDBEditNumero.Destroy;
begin
  FDataLink.Free;
  inherited Destroy;
end;

procedure TDBEditNumero.DoEnter;
{var
  Str: String;
  I: Integer;}
begin
  inherited;
  CorOriginal := color;
  if Self.Focused {and Not ReadOnly} then
    Color:= CorFundoControle

//  FModificado:= False;
{  if Text = ''  then
       FModificado:= False
  else FModificado:= True;
  Str:= '';
  for I:= 1 to Length(Text)  do begin
    if Char(Text[I]) <> ThousandSeparator then
      Str:= Str + Text[I];
  end;
  Text:= Str;}
end;

procedure TDBEditNumero.DoExit;
begin

  Color:= CorOriginal;


  try
    if self.modified then
    begin
      FDataLink.edit;
      FDataLink.Modified;
      FDataLink.UpdateRecord;
      Restore;
      FormataTexto;
    end;

  except
//    SelectAll;
//    SetFocus;
    raise;
  end;

  inherited;

end;

function TDBEditNumero.EditCanModify: Boolean;
begin
  Result := FDataLink.Edit;
end;

function TDBEditNumero.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

{procedure TDBEditNumero.FormataTexto;
var
  Str: String;
  Dec: ShortString;
  I: Byte;
begin
  Str:= '';
  for I:= 1 to Length(Text)  do begin
    if Char(Text[I]) in ['0'..'9',DecimalSeparator] then
      Str:= Str + Text[I];
  end;
  if Str = '-' then begin
    Str := '';
    Text:= '';
  end;
  if Str = '' then
    FValue := 0
  else begin
    FValue := StrToFloat(Str);
    if FDecimais then begin
      Dec := '';
      for i := 1 to FNrDecimal do
        Dec := Dec + '0';
//      if Dec = '' then
//        Text := FormatFloat('#0', FValue)
//      else
      Text := FormatFloat('#0,' + ThousandSeparator + Dec, FValue);
    end
    else
      Text := FormatFloat('#0,', FValue);
  end;
end;}

function TDBEditNumero.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBEditNumero.GetDataSource: TDataSource;
begin
  if(Assigned(FDataLink.DataSource)) then
	Result := FDataLink.DataSource
  else
    Result:=nil;

end;

function TDBEditNumero.GetField: TField;
begin
 Result := FDataLink.Field;
end;

function TDBEditNumero.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBEditNumero.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  {
  if (Key = VK_Delete) or ((Key = VK_INSERT) and (ssShift in Shift)) then
    FDataLink.Edit;
  }
end;

procedure TDBEditNumero.KeyPress(var Key: Char);
begin
 if FDataLink.CanModify then
 begin
    if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
      not FDataLink.Field.IsValidChar(Key) then
    begin
      MessageBeep(0);
      Key := #0;
    end;
//    else
//      FModificado := true;

    case Key of
      ^H, ^V, ^X, #32..#255:

      if FModificado then FDataLink.Edit;
      #27:
        begin
          FDataLink.Reset;
          SelectAll;
          Key := #0;
        end;
    end;
  end
  else
    Key:= #0;

  if key = #13 then
    key := #0;

  inherited KeyPress(Key);
{  Str:= '';
  for I:= 1 to Length(Text)  do begin
    if Char(Text[I]) in ['0'..'9',DecimalSeparator] then
      Str:= Str + Text[I];
  end;

  if FDecimais then begin
    if not (Key in ['0'..'9', DecimalSeparator, ThousandSeparator, #8, #13, #28, '-']) then
         Key := #0
    else FModificado:= True;

    if Key in [DecimalSeparator, ThousandSeparator] then begin
      if (Pos(DecimalSeparator, Str) > 0) or (Length(Str) = 0) then begin
        Key := #0;
        MessageBeep(0);
      end
      else
        Key := DecimalSeparator;
    end;
    if Negativo and (Key = '-') then begin
      if (((Pos('-', Text) > 0) and (SelLength < Length(Text))) or ((Length(Text) > 0) and (SelLength < Length(Text)))) then begin
        Key := #0;
        MessageBeep(0);
      end;
    end;
    if  (not (Key in [#8,#13])                                                                                and
        (((Pos('-', Text) > 0) and ((Length(Text) - SelLength) >= (FTamanho + FNrDecimal + 2))) or
         ((Pos('-', Text) = 0) and ((Length(Text) - SelLength) >= (FTamanho + FNrDecimal + 1)))))  or    // +2 = 1 do decimal e 1 do negativo

        ( not (Key in [DecimalSeparator,#8,#13])                                               and
         (Pos(DecimalSeparator,Text) = 0)                                                      and
         (((Pos('-', Text) > 0) and ((Length(Text) - SelLength) >= FTamanho+1)) or
          ((Pos('-', Text) = 0) and ((Length(Text) - SelLength) >= FTamanho  ))))   or    // +1 = 1 do negativo

        (not (Key in [#8, #13])                                     and
        (Pos(DecimalSeparator,Text) > 0)                            and
        (GetSelStart >= Pos(DecimalSeparator,Text))                 and
        ((Length(Copy(Text,Pos(DecimalSeparator,Text),Length(Text)))- SelLength) > FNrDecimal)) then begin
       Key := #0;
       MessageBeep(0);
    end;
  end
  else begin
    if not (Key in ['0'..'9', #8, #13, #28, ThousandSeparator, '-'])     or
       ((((Length(Text) - SelLength) >= FTamanho+1)) and not (Key in[#8, #13])) or
       ((((Length(Text) - SelLength) >= FTamanho  )) and not (Key in[#8, #13])) then Begin  // +1 = 1 do negativo
       Key := #0;
       MessageBeep(0);
    end
    else FModificado:= True;

    if Negativo and (Key = '-') then begin
      if (((Pos('-', Text) > 0) and (SelLength < Length(Text))) or ((Length(Text) > 0) and (SelLength < Length(Text)))) then begin
        Key := #0;
        MessageBeep(0);
      end;
    end;
  end}
end;

procedure TDBEditNumero.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  {
  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;
  }
end;

procedure TDBEditNumero.Reset;
begin
  FDataLink.Reset;
  SelectAll;
end;

procedure TDBEditNumero.Restore;
begin
  if FDataLink.Field <> nil then
  begin
    MaxLength := -1;
    if FDataLink.CanModify then
    begin
      if not FDataLink.Field.isnull then
      begin
        if PossuiSomenteNumero(FDataLink.Field.asString) then
        begin
          if (somentenumero(Text) = '') or
             ((somentenumero(text) <> '') and
              ((floattostr((strtofloat(SomenteNumeroF(limpaFloat(Text)))))) <> (floattostr(FDataLink.Field.asfloat)))) then
            Text := FDataLink.Field.value
        end;
       { else
          Text := FDataLink.Field.DisplayText};
      end
      else
      begin
        if Text <> '0' then
          Text := '';
      end;
    end
    else
      Text := FDataLink.Field.DisplayText;

    Alignment := FDataLink.Field.Alignment;
  end
  else
  begin
    Alignment:=taLeftJustify;
    if csDesigning in ComponentState then
      Text := Name
    else
      Text := '';
  end;

  Modified := False;
end;

procedure TDBEditNumero.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBEditNumero.SetDataSource(const Value: TDataSource);
begin
  if not ((csLoading in ComponentState) and FDataLink.DataSourceFixed) then
    FDataLink.DataSource := Value;
end;

{procedure TDBEditNumero.SetFloatValue(const Value: Extended);
begin
  if FValue <> Value then
    FValue := Value;
end;}

procedure TDBEditNumero.SetReadOnly(const Value: Boolean);
begin
  inherited ReadOnly := Value;
  FDataLink.ReadOnly := Value;
end;

function TDBEditNumero.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

procedure TDBEditNumero.UpdateData(Sender: TObject);
var
  I: Integer;
  Str: String;
begin
  if FDataLink.Field <> nil then
  begin
    Str:= '';
    for I:= 1 to Length(Text)  do
    begin
      if Negativo then
      begin
        if Char(Text[I]) in ['0'..'9',DecimalSeparator,'-'] then
          Str:= Str + Text[I]
      end
      else
      begin
        if Char(Text[I]) in ['0'..'9',DecimalSeparator] then
          Str:= Str + Text[I];
      end;
    end;

    if str<>'' then
    begin
      if (strtofloat(str) <> FDataLink.Field.asfloat) or (str='0') then
        FDataLink.Field.AsString := Str
    end
    else FDataLink.Field.Clear;

    Modified := False;
//    FModificado:= False;
  end;
end;

{TEditNumero}

procedure TEditNumero.DoEnter;
{var
  I: Integer;
  Str: String;}
begin
  inherited;
  CorOriginal := color;
  if Self.Focused and Not ReadOnly then
    Color:= CorFundoControle;

  FModificado:= True;
  FOldValue := Text;
{  if Text = ''  then
       FModificado:= False
  else FModificado:= True;
  Str:= '';
  for I:= 1 to Length(Text)  do begin
    if Char(Text[I]) <> ThousandSeparator then
      Str:= Str + Text[I];
  end;
  Text:= Str;}
end;

procedure TEditNumero.Change;
begin
  if ((Text = '') or not FModificado) and Mascara then begin
    FormataTexto;
  end;
  Modified := true;
  inherited
end;

procedure TEditNumero.DoExit;
begin
  if FOldValue = Text then
    FModificado := False;

  Color:= CorOriginal;
  if Mascara then
    FormataTexto;
  self.SelLength := 0;
  inherited DoExit;
end;

constructor TEditNumero.Create(AOwner: TComponent);
Begin
  inherited Create(AOwner);
  Alignment := taRightJustify;
  FModificado:= False;
  Mascara:= True;
  Decimais:= True;
  MaxLength:= -1;
  FTamanho:= 9;
  NrDecimal:= 2;
  Negativo:= False;
  Height := 23;
  ValorMaximo := 0;
  Valorminimo := 0;
End;

procedure TEditNumero.KeyPress(var Key: Char);
var
  A,I: Integer;
  Str: String;
begin
  Str:= '';  A:= 0;
  for I:= 1 to Length(Text)  do begin
    if (Char(Text[I]) = ThousandSeparator) then
      Inc(A);
    if Char(Text[I]) in ['0'..'9',DecimalSeparator, '-'] then
      Str:= Str + Text[I];
  end;

  if (Key = '-') and not Negativo then
     Key:= #0;

  if Decimais then
  begin
    if (Key in [#32..#255]) and
       not (Key in ['0'..'9', DecimalSeparator, ThousandSeparator, #8, #13, #28, '-']) then
         Key := #0
    else FModificado:= True;

    if Key in [DecimalSeparator, ThousandSeparator] then begin
      if (Pos(DecimalSeparator, Str) > 0) or (Length(Str) = 0) then begin
        Key := #0;
        MessageBeep(0);
      end
      else
        Key := DecimalSeparator;
    end;
    if {Negativo and }(Key = '-') then begin
      if (((Pos('-', Str) > 0) and (SelLength < Length(Str))) or ((Length(Str) > 0) and (SelLength < Length(Str)))) then begin
        Key := #0;
        MessageBeep(0);
      end;
    end;
    if  (not (Key in [#8,#13])                                                                                and
        (((Pos('-', Str) > 0) and ((Length(Str) - SelLength) >= (Tamanho + NrDecimal + 2))) or
         ((Pos('-', Str) = 0) and ((Length(Str) - SelLength) >= (Tamanho + NrDecimal + 1)))))  or    // +2 = 1 do decimal e 1 do negativo

        ( not (Key in [DecimalSeparator,#8,#13])                                               and
         (Pos(DecimalSeparator,Str) = 0)                                                      and
         (((Pos('-', Str) > 0) and ((Length(Str) - SelLength) >= Tamanho+1)) or
          ((Pos('-', Str) = 0) and ((Length(Str) - SelLength) >= Tamanho  ))))   or    // +1 = 1 do negativo

        (not (Key in [#8, #13])                                    and
        (Pos(DecimalSeparator,Str) > 0)                            and
        ((GetSelStart - A) >= Pos(DecimalSeparator,Str))           and
        ((Length(Copy(Str,Pos(DecimalSeparator,Str),Length(Str)))- SelLength) > NrDecimal)) then begin
       Key := #0;
       MessageBeep(0);
    end;
  end
  else
  begin
    if not (Key in ['0'..'9', #8, #13, #28, ThousandSeparator, '-'])     or
       ((Pos('-', Str) > 0) and (((Length(Str) - SelLength) >= Tamanho+1)) and not (Key in[#8, #13])) or
       ((Pos('-', Str) = 0) and (((Length(Str) - SelLength) >= Tamanho  )) and not (Key in[#8, #13])) then Begin  // +1 = 1 do negativo
       Key := #0;
       MessageBeep(0);
    end
    else
      FModificado:= True;

    if {Negativo and }(Key = '-') then begin
      if (((Pos('-', Str) > 0) and (SelLength < Length(Str))) or ((Length(Str) > 0) and (SelLength < Length(Str)))) then begin
        Key := #0;
        MessageBeep(0);
      end;
    end;
  end;

  if key = #13 then
    key := #0;

  inherited KeyPress(Key);
end;

procedure TEditNumero.SetFloatValue(const Value: Extended);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    text := floattostr(Value);
    FormataTexto;
  end;
end;

procedure TEditNumero.FormataTexto;
var
  Str: String;
  Dec: ShortString;
  I: Byte;
  milhar, decimal: String;
begin
  Str:= '';
  for I:= 1 to Length(Text)  do begin
    if Char(Text[I]) in ['0'..'9',DecimalSeparator,'-'] then
      Str:= Str + Text[I];
  end;
  if Str = '-' then begin
    Str := '';
    Text:= '';
  end;
  if (Str = '') then
    FValue := 0
  else
  begin
    FValue := StrToFloat(Str);
    if Decimais then
    begin
      Dec := '';
      for i := 1 to NrDecimal do
        Dec := Dec + '0';
//      Text := FormatFloat('#,##0.' + Dec, FValue);
      case FTipoMascara of
       tmGERAL      : begin
                        Text := FormatFloat('#0,' + ThousandSeparator + Dec, FValue);
                        if not Negativo then
                          Text := Trocar(text,'-','');
                      end;

       tmQUANTIDADE : begin
                        milhar  := trocar(copy(ParSistema.MascaraQuantidade,1,
                                           pos(',',ParSistema.MascaraQuantidade)),'.','');
                        decimal := copy(ParSistema.MascaraQuantidade,
                                   pos(',',ParSistema.MascaraQuantidade)+1,
                                   (length(ParSistema.MascaraQuantidade)-
                                     pos(',',ParSistema.MascaraQuantidade)));
                        if (pos('.',ParSistema.MascaraQuantidade)<>0) then
                          Text := FormatFloat(milhar +
                                              ThousandSeparator +
                                              decimal, FValue)
                        else
                          Text := trocar(FormatFloat(milhar +
                                                     ThousandSeparator +
                                                     decimal, FValue),'.','');

                        {$ifdef LINUX}
                        if (text <> '') and self.Focused then
                          self.selectall;
                        {$endif}

                        {$ifdef MSWINDOWS}
                        if (text <> '') and self.focused then
                          self.selectall;
                        {$endif}
                      end;
     end;
    end
    else
    begin
      Text := FormatFloat('0', FValue);
      if self.Focused then
        self.selectall;
    end;
  end;
end;

function TEditNumero.GetValorSemFormatacao: Variant;
begin
  try
    if Decimais then  Result:= StrToFloat(Trocar(Text,'.',''))
    else              Result:= StrToInt(Trocar(Text,'.',''));
  except
    Result := 0
  end
end;

function TEditNumero.GetDecimais: Boolean;
begin
  Result := FDecimais;
  case FTipoMascara of
    tmGERAL      : Result := FDecimais;
    tmQUANTIDADE : Result := FDecimaisQuantidade;
  end
end;

procedure TEditNumero.SetTipoMascara(const Value: TtecTipoMascara);
begin

  FTipoMascara := Value;
  if not (csDesigning in ComponentState) then
  begin
    case FTipoMascara of
    tmQUANTIDADE:
       begin
         FMascaraQuantidade := (pos(',', ParSistema.MascaraQuantidade)<>0) or
                               (pos('0', ParSistema.MascaraQuantidade)<>0) or
                               (pos('.', ParSistema.MascaraQuantidade)<>0);

         FDecimaisQuantidade := pos(',',ParSistema.MascaraQuantidade)<>0;
         if FDecimaisQuantidade then
         begin
           FNrDecimalQuantidade := length(copy(ParSistema.MascaraQuantidade,
                         pos(',',ParSistema.MascaraQuantidade)+1,
                         length(ParSistema.MascaraQuantidade)-
                         pos(',',ParSistema.MascaraQuantidade)));
           FTamanhoQuantidade := length(copy(ParSistema.MascaraQuantidade,
                                 0,pos(',',Parsistema.MascaraQuantidade)-1));
         end
         else
         begin
           FNrDecimalQuantidade := 0;
           FTamanhoQuantidade := length(ParSistema.MascaraQuantidade);
         end
       end;
    end;
  end;
end;

function TEditNumero.GetNrDecimal: Integer;
begin
  Result := FNrDecimal;
  case FTipoMascara of
    tmGERAL     : Result := FNrDecimal;
    tmQUANTIDADE: Result := FNrDecimalQuantidade;
  end;
end;

function TEditNumero.GetMascara: Boolean;
begin
  Result := FMascara;
  case FTipoMascara of
    tmGERAL      : Result := FMascara;
    tmQUANTIDADE : Result := FMascaraQuantidade;
  end
end;

function TEditNumero.GetTamanho: Integer;
begin
  Result := FTamanho;
  case FTipoMascara of
    tmGERAL      : Result := FTamanho;
    tmQUANTIDADE : Result := FTamanhoQuantidade;
  end
end;

function TEditNumero.GetAlignment: TAlignment;
begin
  Result := FAlignment
end;

procedure TEditNumero.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd
  end
end;

procedure TEditNumero.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case FAlignment of
    taLeftJustify  : Params.Style  := Params.Style or ES_LEFT;
    taRightJustify : Params.Style := Params.Style or ES_RIGHT;
    taCenter       : Params.Style := Params.Style or ES_CENTER;
  end;

end;


procedure TEditNumero.SetNrDecimal(const Value: Integer);
begin
  fNrDecimal := Value;
  FormataTexto;
end;

function TEditNumero.Criticar(Mensagem: Boolean): Boolean;
begin
  Result := True;
  if (valormaximo <> 0) and
     (ValorSemFormatacao > valormaximo) then
  begin
    result := false;
    MensagemAviso(format('O valor ultrapassou o valor máximo de %f permitido!',[valormaximo]));
    self.Text := self.OldValue;
  end
  else
  if (ValorMinimo <> 0) and
     (ValorSemFormatacao < ValorMinimo) then
  begin
    result := false;
    MensagemAviso(format('O valor está inferior ao valor mínimo de %f permitido!',[valorminimo]));
    self.Text := self.OldValue;
  end;
end;

procedure TEditNumero.KeyDown(var Key: Word; Shift: TShiftState);
begin
//    inherited KeyDown(Key, Shift);
    if (Key = VK_Return) then
    begin
      if  not Criticar(true) then
        Key:= 0
      else
        inherited KeyDown(Key, Shift)
    end
    else
      inherited KeyDown(Key, Shift);


end;

{ TDBEditNumeroIBGE }

procedure TDBEditNumeroIBGE.DoExit;
begin
  inherited;
  ValidardigitoIBGE;

end;

function TDBEditNumeroIBGE.ValidarDigitoIBGE: boolean;
begin
   result := true;
  if Text<>'' then
  begin
    if length(text)=7 then
    begin
      if Modulo10(copy(text,1,6),'121212')<>
         copy(text,7,1) then
      begin
        result := false;
        MensagemAviso('Dígito verificador do IBGE incorreto');
        SelectAll;
        SetFocus;
      end
    end
    else
    begin
      result := false;
      MensagemAviso('Código IBGE deve conter 7 dígitos');
      SelectAll;
      SetFocus;
    end;
  end;

end;

initialization
  ThousandSeparator := '.';
//  DecimalSeparator  := ',';

end.
