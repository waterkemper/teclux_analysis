unit IDGconst;

interface

uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, {DSGNINTF,} DB, Variants;

type

  TTypeData = ( tdQuery, tdStoredProc );

  PItem = ^TItem;
  TItem = class
    Data : Variant;
  private
    function GetAsDate: TDateTime;
    function GetAsFloat: double;
    function GetAsInteger: integer;
    function GetAsString: string;
    procedure SetAsDate(const Value: TDateTime);
    procedure SetAsFloat(const Value: double);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsString(const Value: string);

  public
    property Value : Variant read Data write Data;
    property AsString : string read GetAsString write SetAsString;
    property AsFloat : double read GetAsFloat write SetAsFloat;
    property AsDate : TDateTime read GetAsDate write SetAsDate;
    property AsInteger : Integer read GetAsInteger write SetAsInteger;
  end;

  TItemRec = class(TPersistent)
  private
    FItems : TStringList;

    function  GetData(Index : Integer) : TItem;
    function GetNames(Index : Integer) : string;
  public
    constructor Create;
    destructor Destroy;override;

    function FieldByName( name : string ) : TItem;
    procedure AddParam( name : string; data : Variant);

    function Count : Integer;
    property Items[Index : Integer] : TItem read GetData;default;
    property Names[Index : Integer] : string read GetNames;
  end;

  TFieldParams = class;

  TFieldParam = class(TObject)
  private
    FFieldParamList : TFieldParams;
    FFieldName : string;
  public
    constructor Create(AParamList: TFieldParams);
    destructor Destroy; override;

    property FieldName : string read FFieldName write FFieldName;
  end;

  TFieldParams = class(TPersistent)
  private
    FItems : TList;
    function  GetFieldParam(Index : Integer) : TFieldParam;
    function  GetCount : Integer;
    procedure DefineProperties(Filer: TFiler);override;
    procedure ReadBinaryData(Stream: TStream);
    procedure WriteBinaryData(Stream: TStream);

  protected
    procedure AddParam(Value: TFieldParam);
    procedure RemoveParam(Value: TFieldParam);

  public
    constructor Create; virtual;
    destructor Destroy; override;

    function CreateParam(const ParamName : string): TFieldParam;
    function ParamByName(const ParamName : string) :TFieldParam;
    function Find(const ParamName : string ) : Integer;
    procedure Clear;

    property Items[Index : Integer] : TFieldParam read GetFieldParam;default;
    property Count : Integer read GetCount;
  end;

  //структура для сохранения соответвия формата Value1=Value2
  TRelation = record
    Relation : string;
    InitialValue : Variant;
  end;

  PRelation = ^TRelation;

  //класс список для работы со структурой соответствия
  TRelations = class(TPersistent)
  private
    FItems : TList;

    function GetItem(Index : Integer) : TRelation;
    procedure SetItem( Index : Integer; Value : TRelation );

    function GetCount : Integer;
    function GetName(Index : Integer) : string;
    function GetValue(Index : Integer) : string;

    procedure DefineProperties(Filer: TFiler);override;
    procedure ReadBinaryData(Stream: TStream);
    procedure WriteBinaryData(Stream: TStream);
  protected

  public
    constructor Create; virtual;
    destructor  Destroy; override;

    procedure AddItem( Relation : string; InitialValue : Variant );
    procedure Clear;

    property Item[Index : Integer] :TRelation read GetItem write SetItem;default;
    property Names[Index : Integer] : string read GetName;
    property Values[Index : Integer] : string read GetValue;
    property Count : Integer read GetCount;
  end;

  procedure GetFieldNames( Fields : TItemRec; str : string; Values : Variant );
  function CompareItemRec( Fields, Data : TItemRec; Options : TLocateOptions ) : boolean;


implementation

procedure GetFieldNames( Fields : TItemRec; str : string; Values : Variant );
var
  i, n : Integer;
  Name : string;
  V  : Variant;
begin
  n := 0;
  while Length(str) > 0 do begin
    i := Pos(';', str);
    if ( i > 0 ) then begin
      Name := str;
      Delete(str, 1, i);
      Delete(name, i, Length(str) + 1);
    end
    else begin
      Name := str;
      str := '';
    end;
    if VarIsArray(Values) then
      V := Values[n]
    else
      V := Values;
    Fields.AddParam(Name, V);
    Inc(n);
  end;
end;

function CompareItemRec( Fields, Data : TItemRec; Options : TLocateOptions ) : boolean;
type
  TCompFunction = function (const S1, S2: string): Integer; 
var
  id, id1 : TItem;
  i : Integer;
  str : string;
  func : TCompFunction;
begin
  if loCaseInsensitive in Options then
    func := AnsiCompareText
  else
    func := AnsiCompareStr;

  Result := true;
  for i := 0 to Fields.Count - 1 do  begin
    id := Data.FieldByName( Fields.Names[i] );
    id1 := Fields.Items[i];
    if ( loPartialKey in Options ) then begin
      str := id.AsString;
      SetLength(str, Length(id1.AsString));
      if func(str, id1.AsString) <> 0 then begin
        Result := false;
        Exit;
      end;
    end
    else begin
      if func( id.AsString, id1.AsString) <> 0 then begin
        Result := false;
        Exit;
      end;
    end;
  end;
end;


// ****************** TItem ****************************************//

function TItem.GetAsString : string;
var
  i : Integer;
begin
  i := VarType(Data);
  if ( i = varEmpty) or (i = varNull) then
    Result := ''
  else
    Result := Data;
end;

function TItem.GetAsFloat : double;
var
  i : Integer;
begin
  i := VarType(Data);
  if ( i = varEmpty) or (i = varNull) then
    Result := 0
  else
    Result := Data;
end;

function TItem.GetAsDate : TDateTime;
var
  i : Integer;
begin
  i := VarType(Data);
  if ( i = varEmpty) or (i = varNull) then
    Result := 0
  else
    Result := Data;
end;

function TItem.GetAsInteger : integer;
var
  i : Integer;
begin
  i := VarType(Data);
  if ( i = varEmpty) or (i = varNull) then
    Result := 0
  else
    Result := Data;
end;

procedure TItem.SetAsFloat(const Value: double);
begin
  Data := Value;
end;

procedure TItem.SetAsInteger(const Value: Integer);
begin
  Data := Value;
end;

procedure TItem.SetAsString(const Value: string);
begin
  Data := Value;
end;

procedure TItem.SetAsDate(const Value: TDateTime);
begin
  Data := Value;
end;


// ****************** TItemRec ****************************************//

constructor TItemRec.Create;
begin
  FItems := TStringList.Create;
end;

destructor TItemRec.Destroy;
var
  i : integer;
begin
  for i := 0 to FItems.Count - 1 do begin
    TItem(FItems.Objects[i]).Free;
  end;
  FItems.Clear;
  FItems.Free;
  inherited Destroy;
end;

function TItemRec.FieldByName( name : string ) : TItem;
var
  i : integer;
begin
  for i := 0 to FItems.Count - 1 do begin
    if ( AnsiCompareText(FItems.Strings[i], name ) = 0 ) then begin
      Result := TItem(FItems.Objects[i]);
      Exit;
    end;
  end;
  raise Exception.Create('The field is not found.');
end;

function  TItemRec.GetData(Index : Integer) : TItem;
begin
  Result := TItem(FItems.Objects[Index]);
end;

function TItemRec.GetNames(Index : Integer) : string;
begin
  Result := FItems.Strings[Index];
end;

procedure TItemRec.AddParam( name : string; data : variant);
var
  item : TItem;
begin
  item := TItem.Create;
  item.Value := data;
  FItems.AddObject(name, item);
end;

function TItemRec.Count : Integer;
begin
  Result := FItems.Count;
end;


//*************** TFieldParam *****************************************//

constructor TFieldParam.Create(AParamList: TFieldParams);
begin
  if AParamList <> nil then AParamList.AddParam(Self);
end;

destructor TFieldParam.Destroy;
begin
  if FFieldParamList <> nil then FFieldParamList.RemoveParam(Self);
  inherited Destroy;
end;

//****************** TFieldParams ********************************************//

constructor TFieldParams.Create;
begin
  FItems := TList.Create;
  inherited Create;
end;

destructor TFieldParams.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

function TFieldParams.GetFieldParam(Index : Integer) : TFieldParam;
begin
  Result := TFieldParam(FItems[Index]) ;
end;

procedure TFieldParams.AddParam(Value: TFieldParam);
begin
  FItems.Add(Value);
  Value.FFieldParamList := Self;
end;

procedure TFieldParams.RemoveParam(Value: TFieldParam);
begin
  FItems.Remove(Value);
  Value.FFieldParamList := nil;
end;

function TFieldParams.CreateParam(const ParamName : string): TFieldParam;
begin
  Result := TFieldParam.Create(Self);
  with Result do
  begin
    FieldName := ParamName;
  end;
end;

function TFieldParams.ParamByName(const ParamName : string) :TFieldParam;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FItems.Count - 1 do
  begin
    Result := FItems[I];
    if AnsiCompareText(Result.FieldName, ParamName) = 0 then Exit;
  end;
//  DBErrorFmt(SParameterNotFound, [Value]);
end;


function TFieldParams.Find(const ParamName : string) :Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to FItems.Count - 1 do
  begin
    if AnsiCompareText(TFieldParam(FItems[I]).FieldName, ParamName) = 0 then begin
      Result := I;
      Exit;
    end;
  end;
end;


function TFieldParams.GetCount : Integer;
begin
  Result := FItems.Count;
end;

procedure TFieldParams.DefineProperties(Filer: TFiler);

  function WriteData: Boolean;
  begin
      Result := Count > 0;
  end;

begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('Data', ReadBinaryData, WriteBinaryData,
    WriteData);
end;

procedure TFieldParams.ReadBinaryData(Stream: TStream);
var
  Tempcount, I : integer;
  Temp : Integer;
  TempStr : string;
begin
  Clear;
  with Stream do
  begin
    ReadBuffer( TempCount, SizeOf(TempCount));
    for I := 0 to TempCount - 1 do
      with TFieldParam.Create(Self) do
      begin
        ReadBuffer(Temp, SizeOf(Temp));
        SetLength(TempStr, Temp);
        ReadBuffer(PChar(TempStr)^, Temp);
        FieldName := TempStr;
      end;
  end;
end;

procedure TFieldParams.WriteBinaryData(Stream: TStream);
var
  I: Integer;
  Temp: Integer;
begin
  with Stream do begin
    Temp := Count;

    WriteBuffer(Temp, SizeOf(Temp));
    for I := 0 to Temp - 1  do
      with Items[I] do begin
        Temp := Length(FFieldName);
        WriteBuffer(Temp, SizeOf(Temp));
        WriteBuffer(PChar(FFieldName)^, Length(FFieldName));
      end;
  end;
end;

procedure TFieldParams.Clear;
begin
  while FItems.Count > 0 do TFieldParam(FItems.Last).Free;
end;

// ----------------- TRelations --------------------------------------

constructor TRelations.Create;
begin
  inherited Create;
  FItems := TList.Create;
end;

destructor TRelations.Destroy;
begin
  Clear;
  FItems.Free;
  inherited;
end;

function TRelations.GetItem(Index : Integer) : TRelation;
var
  p : PRelation;
begin
  p := FItems[Index];
  Result.Relation := p.Relation;
  Result.InitialValue := p.InitialValue;
end;

procedure TRelations.SetItem( Index : Integer; Value : TRelation );
var
  p : PRelation;
begin
  p := FItems[Index];
  p.Relation := Value.Relation;
  p.InitialValue := p.InitialValue;
end;

procedure TRelations.AddItem( Relation : string; InitialValue : Variant );
var
  p : PRelation;
begin
  New(p);
  p.Relation := Relation;
  p.InitialValue := InitialValue;
  FItems.Add(p);
end;

function TRelations.GetCount : Integer;
begin
  Result := FItems.Count;
end;

procedure TRelations.Clear;
var
  p : PRelation;
  i : Integer;
begin
  for i := 0 to FItems.Count - 1 do begin
    p := FItems[0];
    FItems.Delete(0);
    Dispose(p);
  end;
end;

function TRelations.GetName(Index : Integer) : string;
var
  str : string;
  i : Integer;
  p : PRelation;
begin
  p := FItems[Index];
  str := p^.Relation;
  i := Pos('=', str);
  Delete(str, i, Length(str) - i + 1);
  Result := str;
end;

function TRelations.GetValue(Index : Integer) : string;
var
  str : string;
  i : Integer;
  p : PRelation;
begin
  p := FItems[Index];
  str := p^.Relation;
  i := Pos('=', str);
  Delete(str, 1, i );
  Result := str;
end;

procedure TRelations.DefineProperties(Filer: TFiler);
  function WriteData: Boolean;
  begin
      Result := Count > 0;
  end;
begin
  inherited DefineProperties(Filer);
  Filer.DefineBinaryProperty('Data', ReadBinaryData, WriteBinaryData,
    WriteData);
end;


// Сохранение
// 1 - Variant is Null
// 2 - Variant as string;
procedure TRelations.WriteBinaryData(Stream: TStream);
var
  I: Integer;
  Temp: Integer;
  p : PRelation;
  str : string;
  tVar : Integer;
begin
  with Stream do begin
    Temp := Count;
    WriteBuffer(Temp, SizeOf(Temp));
    for I := 0 to Temp - 1  do begin
      p := FItems[I];
      with p^ do begin
        Temp := Length(Relation);
        WriteBuffer(Temp, SizeOf(Temp));
        WriteBuffer(PChar(Relation)^, Length(Relation));

        case VarType(InitialValue) of
          varNull : tVar := 1;
        else
          tVar := 2;
        end;
        WriteBuffer( tVar, SizeOf(tVar));

        if (tVar = 2) then begin
          str := InitialValue;
          Temp := Length(str);
          WriteBuffer(Temp, SizeOf(Temp));
          WriteBuffer(PChar(str)^, Length(str));
        end;
      end;
    end;
  end;
end;

procedure TRelations.ReadBinaryData(Stream: TStream);
var
  Tempcount, I : integer;
  Temp : Integer;
  TempStr, str : string;
  p : PRelation;
  tVar : Integer;
begin
  Clear;
  with Stream do
  begin
    ReadBuffer( TempCount, SizeOf(TempCount));
    for I := 0 to TempCount - 1 do begin
      New(p);
      ReadBuffer(Temp, SizeOf(Temp));
      SetLength(TempStr, Temp);
      ReadBuffer(PChar(TempStr)^, Temp);
      p.Relation := TempStr;

      ReadBuffer(tVar, SizeOf(tVar));
      if (tVar = 2) then begin
        ReadBuffer(Temp, SizeOf(Temp));
        SetLength( str, Temp);
        ReadBuffer(PChar(str)^, Temp);
        p.InitialValue := str;
      end
      else
        p.InitialValue := Null;
      FItems.Add(p);

    end;
  end;
end;

end.
