unit cpdbtext;

interface

uses
  Classes, DBCtrls, Controls, SysUtils, {Qete,} DB, Graphics, Windows;


type
  TtecDBText = class(TDBEdit)
  private
    FAlignment: TAlignment;
    function GetAlignment: TAlignment;
    procedure SetAlignment(const Value: TAlignment);
  protected
   {CLX_TO_VCL procedure TextChanged; override;}
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Change; override;


  public
    constructor Create(AOwner: TComponent); override;
  published
   {CLX_TO_VCL property BorderStyle;}
    property Alignment: TAlignment read GetAlignment write SetAlignment default taRightJustify;

  end;

implementation

{ TtecDBText }

procedure TtecDBText.Change;
begin
  inherited;
  if Assigned(field) then
  begin
  {
    try
      case field.DataType of
        ftFloat : begin
                    if TFloatField(Field).DisplayFormat = '' then
                       text := field.AsString;
                  end;

        ftCurrency: begin
                    if TCurrencyField(Field).DisplayFormat = '' then
                       text := field.AsString;
                  end;
      else
        text := field.AsString;
      end;
    except
    }
//      text := field.AsString;
    {
    end;
    }
  end
end;

constructor TtecDBText.Create(AOwner: TComponent);
begin
  inherited;
  Height := 23;
  Color := clBtnFace;
  readonly := true;
//  enabled := false;
  TabStop := false;

  if Assigned(field) then
  begin
    try
      case field.DataType of
        ftFloat,
        ftCurrency: Alignment := taRightJustify;
      end;
    except
    end;
  end
end;

{
procedure TtecDBText.TextChanged;
var
  Str: String;
  Dec: ShortString;
  I: Byte;
  FValue: Extended;
  EhDecimal: Boolean;
  NrDecimal: Byte;
begin
  inherited TextChanged;
  if Assigned(Field) then
    if (Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency]) then begin
      EhDecimal:= False;
      Str:= '';
      for I:= 1 to Length(Text)  do begin
        if Char(Text[I]) in ['0'..'9',DecimalSeparator,CHR(VK_Minus)] then
          Str:= Str + Text[I];
      end;
      if Pos(DecimalSeparator,Text) > 0 then begin
        EhDecimal:= True;
        NrDecimal:= Length(Text) - Pos(DecimalSeparator,Text);
      end else
        NrDecimal:= 0;
      if Str = '-' then begin
        Str := '';
        Text:= '';
      end;
      if (Str <> '') then begin
        FValue := StrToFloat(Str);
        if EhDecimal then begin
          Dec := '';
          for i := 1 to NrDecimal do
            Dec := Dec + '0';
          Text := FormatFloat('#,##0.' + Dec, FValue);
//          Text := FormatFloat('#0,' + ThousandSeparator + Dec, FValue);
        end
        else
          Text := FormatFloat('#0,', FValue);
      end;
    end;
end;
}

procedure TtecDBText.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);

  case FAlignment of
    taLeftJustify  : Params.Style := Params.Style or  ES_LEFT;
    taRightJustify : Params.Style := Params.Style or   ES_RIGHT;
    taCenter       : Params.Style := Params.Style or   ES_CENTER;
  end;

//  Params.Style := Params.Style or Alinhamentos[FAlinhamento];

end;

function TtecDBText.GetAlignment: TAlignment;
begin
  Result := FAlignment
end;

procedure TtecDBText.SetAlignment(const Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    RecreateWnd
  end
end;

end.

