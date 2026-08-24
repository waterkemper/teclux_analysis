unit uDBJson;

interface
uses
SysUtils,Classes,Variants,DB,DBClient,SuperObject;

type
TTableJSon = class

private
    const cstFieldType = 'FieldType';
    const cstFieldName = 'FieldName';
    const cstFieldSize = 'FieldSize';
    const cstJsonType = 'JsonType';
    const cstRequired = 'Required';
    const cstFieldIndex = 'FieldIndex';

    const cstCols= 'Cols';
    const cstData= 'Data';

public
    class function JSonFromDataSet(DataSet:TDataSet):string;
    class function CreateFieldByJson(Fields:TFieldDefs;ColsJson:ISuperObject):Boolean;
    class function ImportDataFromJSon(DataSet:TDataSet;DataJson:ISuperObject):Integer;
    class function CDSFromJSon(CDS:TClientDataSet;Json:ISuperObject):Boolean;
    class function GetValue(Json:ISuperObject;const Name:string):Variant;

    class function CreateJsonValue(Json:ISuperObject;const Name:string;const Value:Variant):Boolean;
    class function CreateJsonValueByField(Json:ISuperObject;Field:TField):Boolean;
    class function GetValue2Field(Field:TField;JsonValue:ISuperObject):Variant;
end;
implementation
uses TypInfo,encddecd;

{ TTableJSon }

class function TTableJSon.CDSFromJSon(CDS: TClientDataSet;
Json: ISuperObject): Boolean;
var
ColsJson:ISuperObject;
begin
Result := False;
if Json = nil then
    Exit;
CDS.Close;
CDS.Data := Null;

ColsJson := Json.O[cstCols];
CreateFieldByJson(CDS.FieldDefs,ColsJson);
if CDS.FieldDefs.Count >0 then
    CDS.CreateDataSet;
ImportDataFromJSon(CDS,Json.O[cstData]);
Result := True;
end;

class function TTableJSon.CreateFieldByJson(Fields: TFieldDefs;
ColsJson: ISuperObject): Boolean;
var
SubJson:ISuperObject;
ft:TFieldType;
begin
Result := False;
Fields.DataSet.Close;
Fields.Clear;
for SubJson in ColsJson do
begin
    ft := TFieldType(GetEnumValue(TypeInfo(TFieldType),'ft'+SubJson.S[cstFieldType]));
    if ft= ftAutoInc then 
      ft := ftInteger;
    Fields.Add(SubJson.S[cstFieldName],ft,SubJson.I[cstFieldSize],SubJson.B[cstRequired]);
end;
Result := True;
end;

class function TTableJSon.CreateJsonValue(Json: ISuperObject;
const Name: string; const Value: Variant): Boolean;
begin
Result := False;
Json.O[Name] := SO(Value);
Result := True;
end;

class function TTableJSon.CreateJsonValueByField(Json: ISuperObject;
Field: TField): Boolean;
begin
Result := False;
if Field Is TDateTimeField then
    Json.O[Field.FieldName] := SO(Field.AsDateTime)
else if Field is TBlobField then
    Json.S[Field.FieldName] := EncodeString(Field.AsString)
else
    Json.O[Field.FieldName] := SO(Field.Value);
Result := True;
end;

class function TTableJSon.GetValue(
Json: ISuperObject;const Name: string): Variant;
begin
case Json.DataType of
    stNull: Result := Null;
    stBoolean: Result := Json.B[Name];
    stDouble: Result := Json.D[Name];
    stCurrency: Result := Json.C[Name];
    stInt: Result := Json.I[Name];
    stString: Result := Json.S[Name];
end;
end;

class function TTableJSon.GetValue2Field(Field: TField; JsonValue:ISuperObject): Variant;
begin
if JsonValue.DataType = stNull then
    Result := Null
else if Field is TDateTimeField then
    Result := JavaToDelphiDateTime(JsonValue.AsInteger)
else if (Field is TIntegerField) or (Field is TLargeintField) then
    Result := JsonValue.AsInteger
else if Field is TNumericField then
    Result := JsonValue.AsDouble
else if Field is TBooleanField then
    Result := JsonValue.AsBoolean
else if Field is TStringField then
    Result := JsonValue.AsString
else if Field is TBlobField then
    Result := DecodeString(JsonValue.AsString)    

end;

class function TTableJSon.ImportDataFromJSon(DataSet: TDataSet;
DataJson: ISuperObject): Integer;
var
SubJson:ISuperObject;
i:Integer;
iter: TSuperObjectIter;
begin
if not DataSet.Active then
    DataSet.Open;
DataSet.DisableControls;
try
    for SubJson in DataJson do
    begin
      DataSet.Append;
      if ObjectFindFirst(SubJson,iter) then
      begin
         repeat
           if DataSet.FindField(iter.Ite.Current.Name)<>nil then
             DataSet.FindField(iter.Ite.Current.Name).Value :=
                GetValue2Field(
                DataSet.FindField(iter.Ite.Current.Name),
                iter.Ite.Current.Value);
         until not ObjectFindNext(iter) ;
      end;
      DataSet.Post;
    end;
finally
    DataSet.EnableControls;
end;
end;

class function TTableJSon.JSonFromDataSet(DataSet:TDataSet):string;
procedure GetFieldTypeInfo(Field:TField;var Fieldtyp,JsonTyp:string);
begin
    Fieldtyp := GetEnumName(TypeInfo(tfieldtype),ord(Field.DataType));
    Delete(Fieldtyp,1,2);
    if Field is TStringField then
      JsonTyp := 'string'
    else if Field is TDateTimeField then
      JsonTyp := 'integer'
    else if (Field is TIntegerField) or (Field is TLargeintField) then
      JsonTyp := 'integer'
    else if Field is TCurrencyField then
      JsonTyp := 'currency'
    else if Field is TNumericField then
      JsonTyp := 'double'
    else if Field is TBooleanField then
      JsonTyp := 'boolean'
    else
      JsonTyp := 'variant';
end;
var
sj,aj,sj2:ISuperObject;
i:Integer;
Fieldtyp,JsonTyp:string;
List:TStringList;
begin
sj := SO();

aj := SA([]);
List := TStringList.Create;
try
    List.Sorted := True;

    for i := 0 to DataSet.FieldCount - 1 do
    begin
      sj2 := SO();
      GetFieldTypeInfo(DataSet.Fields[i],Fieldtyp,JsonTyp);

      sj2.S[cstFieldName] := DataSet.Fields[i].FieldName;
      sj2.S[cstFieldType] := Fieldtyp;
      sj2.S[cstJsonType] := JsonTyp;
      sj2.I[cstFieldSize] := DataSet.Fields[i].Size;
      sj2.B[cstRequired] := DataSet.Fields[i].Required;
      sj2.I[cstFieldIndex] := DataSet.Fields[i].Index;
      aj.AsArray.Add(sj2);
      List.Add(DataSet.Fields[i].FieldName+'='+JsonTyp);
    end;
    sj.O['Cols'] := aj;

    DataSet.DisableControls;

    DataSet.First;
    aj := SA([]);
    while not DataSet.Eof do
    begin
      sj2 := SO();
      for i := 0 to DataSet.FieldCount - 1 do
      begin
        //sj2.S[IntToStr(DataSet.Fields[i].Index)] := VarToStrDef(DataSet.Fields[i].Value,'');
        if VarIsNull(DataSet.Fields[i].Value) then
          sj2.O[DataSet.Fields[i].FieldName] := SO(Null)
        else
        begin
          CreateJsonValueByField(sj2,DataSet.Fields[i]);
        end;
      end;
      aj.AsArray.Add(sj2);
      DataSet.Next;
    end;
    sj.O['Data'] := aj;

    Result := sj.AsString;
finally
    List.Free;
    DataSet.EnableControls;
end;

end;

end.





var
json:TTableJSon;
s:string;

begin

S := json.JSonFromDataSet(ADODataSet1);



end;



var
json:ISuperObject;
begin
json := TSuperObject.ParseFile('json.txt',False);
TTableJSon.CDSFromJSon(cdsJSON,json);
end;