{********************************************************}
{                                                        }
{         Classe para criacao de arquivos textos         }
{            atraves de layouts pre definidos            }
{                                                        }
{********************************************************}

unit cltextwriter;

interface

uses
  classes, SysUtils, DB, biblio, ctconstantes, Forms;

const
  CHR_CONV_STR     = 'acelnosxzACELNOSXZ';
  LAT_CONV_STR     = '•Ü©à‰¢ò´æ§è®ù„‡'#$97'çΩ';
  DEFAULT_CONV_STR = 'πÊÍ≥ÒÛúüø•∆ £—”åèØ';
  LINE_FEED                     = #10;

  TAG_BG_DADOS                  = '<f%s>';
  TAG_EN_DADOS                  = '</f>';
  TAG_BG_FORMAT                 = '<fm>';
  TAG_EN_FORMAT                 = '</fm>';
  TAG_BG_BAND                   = '<i>';
  TAG_EN_BAND                   = '</i>';
  TAG_BG_CONSTANT               = '<fc%d>';
  TAG_EN_CONSTANT               = '</fc%d>';
  TAG_BG_SPACER                 = '<sp>';
  TAG_EN_SPACER                 = '</sp>';
  TAG_LINE_FEED                 = '<sbl>';

type
  TtecTextWriter = class
  private
    FPrn : TextFile;
    FDoc: String;
    FBandString: String;
    procedure TextOut;
    function ParseBand(Line:String; Campos: array of String; Valores: array of String): String;
    procedure SetBandString(const Value: String);
    procedure AddCommand(Text: String);
  public
    constructor Create;
    procedure BeginDoc(Name: String);
    procedure EndDoc;
    procedure WriteBand(Campos: array of String; Valores: array of String);
//    procedure WriteBand(Fields: TFields; constants: array of variant); overload;
//    procedure WriteBand(Fields: TFields); overload;
//    procedure WriteBand(constants: array of variant); overload;
    property  BandString: String read FBandString write SetBandString;
  end;

var
  TextWriter: TtecTextWriter = nil;

implementation

{ TtecTextWriter }

constructor TtecTextWriter.Create;
begin
  FDoc := '';
end;

procedure TtecTextWriter.SetBandString(const Value: String);
begin
  FBandString := Value;
end;

procedure TtecTextWriter.AddCommand(Text: String);
begin
  FDoc := FDoc + Text;
end;

function TtecTextWriter.ParseBand(Line:String; Campos: array of String; Valores: array of String): String;

  function FormatOut(Tag: String): String; overload;
  var
    a, PosIni, PosFim: Integer;
    Mascara, strValor: String;
    ValorR: Real;
    ValorI: Integer;
  begin
    PosIni := Pos('(', Tag);
    PosFim := Pos(')', Tag) - 1;
    Mascara := Copy(Tag, PosIni + 1, PosFim - PosIni);
    PosIni := PosFim + 2;
    PosFim := Pos('</fm>', Tag);
    strValor := Copy(Tag, PosIni, PosFim - PosIni);
    a := 1;
    if Pos('f', Mascara) > 0 then begin
      try
        ValorR := StrToFloat(strValor);
        while strValor[a] = ' ' do
          Inc(a);
      except
        ValorR := 0
      end;
      Result:= FormatFloat('#0,' + ThousandSeparator + '00', ValorR);
    end else if Pos('d', Mascara) > 0 then begin
      try
        ValorI := StrToInt(strValor);
        while strValor[a] = ' ' do
          Inc(a);
      except
        ValorI := 0
      end;
      Result := Format(Mascara, [ValorI]);
    end;
    if strValor[1] = ' ' then
      Result := StringOfChar(' ', Length(strValor) - Length(Result)) + Result;
  end;

  function FormatOut(S, Tag: String): String; overload;
  var
    WidthCount, Width, BPos, EPos: Integer;
    strWidth, TagAlign: String;
  begin
  { parse parametros -> (wwwa) }
    Result := S;
    Bpos := Pos('(', Tag) + 1;
    EPos := Pos(')', Tag) - 2;
    TagAlign := Copy(Tag, Epos + 1, 1);
    if (TagAlign <> 'C') and (TagAlign <> 'R') and (TagAlign <> 'L') then begin
      TagAlign := 'L';
      Inc(EPos)
    end;
    for WidthCount := BPos to EPos do
      strWidth := strWidth + Tag[WidthCount];
    Width := StrToInt(strWidth);
    if Length(Result) < Width then begin
      EPos := Width - Length(Result);
      if TagAlign = 'L' then
        for BPos := 1 to Epos do
          Result := Result + ' '
      else if TagAlign = 'R' then
        for BPos := 1 to Epos do
          Result :=  ' ' + Result
      else if TagAlign = 'C' then begin
        for BPos := 1 to (Epos div 2) do
           Result :=  ' ' + Result;
        if Odd(EPos) then
          for BPos := 1 to (Epos div 2) + 1 do
            Result := Result + ' '
        else
          for BPos := 1 to (Epos div 2) do
            Result := Result + ' ';
      end
    end else if Length(Result) > Width then
      Result := Copy(Result, 1, Width)
  end;

  function FormatMargem(Tag: String): String; overload;
  var
    Width, WidthCount, BPos, EPos, PosVirg, PosEnter, PosChar: Integer;
    str, strMargem, strWidth: String;
  begin
  { parse parametros -> (wwwa) }
    PosVirg :=  Pos(',', Tag) - 1;
    Bpos := Pos('(', Tag) + 1;
    EPos := Pos(')', Tag) - 1;
    Result := Trim(Copy(Tag, EPos+2, Pos('</m>', Tag) - EPos - 2));
    for WidthCount := BPos to PosVirg do
      strMargem := strMargem + Tag[WidthCount];
    for WidthCount := PosVirg+2 to EPos do
      strWidth := strWidth + Tag[WidthCount];
    try
      Width := StrToInt(strWidth)
    except
      Width := 0
    end;
    str := '<sbl><sp>('+strMargem+')</sp>';
    PosChar := Width;
    while PosChar < Length(Result) do begin
      if PosChar < Length(Result) then begin
        Insert(str, Result, PosChar);
        Inc(PosChar, Width + Length(str));
      end else
        Inc(PosChar, Width)
    end;

    repeat
      Result:= Trocar(Result,#13,' ');
      PosEnter := Pos(#$A, Result);
      if PosEnter > 0 then begin
        Delete(Result, PosEnter, 1);
        Insert(' ', Result, PosEnter)
      end;
    until PosEnter = 0;
  end;

var
  BTag: String;
  BPos, EPos, Index, TagCount: Integer;
  Tag, FmtOut: String;
begin
  Result := Line;
{ parse campos -> tags <fn></fn> }
(*  if (Fields <> nil) then begin
    for FieldIndex := 0 to Fields.Count - 1 do begin
      BTag := Format(TAG_BG_DADOS,[Fields[FieldIndex].FieldName]);
      BPos := Pos(BTag, Result);
      if BPos = 0  then
        Continue
      else begin
        EPos := BPos + 3;
        repeat
          Inc(EPos);
        until Copy(Result, EPos, 4) = '</f>';
        if EPos = 0 then
          Continue
        else begin
          Tag := '';
          Inc(EPos, 3{ + Length(Fields[FieldIndex].FieldName)});
          for TagCount := BPos to EPos do
            Tag := Tag + Result[TagCount];
          FmtOut := FormatOut(Fields[FieldIndex].AsString, Tag);
          Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
        end;
      end;
    end;
  end;
*)

{ parse espacos -> tag <fc></fc> }
  if High(Campos) = High(Valores) then begin
    for Index := 0 to High(Campos) do begin
      BTag := Format(TAG_BG_DADOS,[Campos[Index]]);
      BPos := Pos(BTag, Result);
      if BPos = 0  then
        Continue
      else begin
        EPos := BPos + 3;
        repeat
          Inc(EPos);
        until Copy(Result, EPos, 4) = '</f>';
        if EPos = 0 then
          Continue
        else begin
          Tag := '';
          Inc(EPos, 3);
          for TagCount := BPos to EPos do
            Tag := Tag + Result[TagCount];
          FmtOut := FormatOut(Valores[Index], Tag);
          Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
        end;
      end;
    end;
  end
  else raise Exception.Create('Os Parametros ''Campos'' e ''Valores'' definidos para impress„o' + #10#13 +
                              'da Remessa est„o com tamanhos diferentes.');

{ parse espacos -> tag <fm></fm> }
  while Pos(TAG_BG_FORMAT, Result) <> 0 do begin
    Tag := '';
    BPos := Pos(TAG_BG_FORMAT, Result);
    if BPos <> 0  then begin
      EPos := Pos(TAG_EN_FORMAT, Result) + 4;
      if EPos <> 0  then begin
        for TagCount := BPos to EPos do
          Tag := Tag + Result[TagCount];
        FmtOut := FormatOut(Tag);
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
    end;
  end;

{ parse espacos -> tag <sp></sp> }
  while Pos(TAG_BG_SPACER, Result) <> 0 do
  begin
    Tag := '';
    BPos := Pos(TAG_BG_SPACER, Result);
    if BPos <> 0  then
    begin
      EPos := Pos(TAG_EN_SPACER, Result) + 4;
      if EPos <> 0  then
      begin
        for TagCount := BPos to EPos do
           Tag := Tag + Result[TagCount];
        FmtOut := FormatOut('', Tag);
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
    end;
  end;

{ parse quebras -> tag <sbl> }
  while Pos(TAG_LINE_FEED, Result) <> 0  do
  begin
    Result := StringReplace(Result, TAG_LINE_FEED, LINE_FEED, []);
  end;
end;


(*function TtecTextWriter.ParseBand(Line: String; Fields: TFields; constants: array of variant): String;

  function FormatOut(Tag: String): String; overload;
  var
    a, PosIni, PosFim: Integer;
    Mascara, strValor: String;
    ValorR: Real;
    ValorI: Integer;
  begin
    PosIni := Pos('(', Tag);
    PosFim := Pos(')', Tag) - 1;
    Mascara := Copy(Tag, PosIni + 1, PosFim - PosIni);
    PosIni := PosFim + 2;
    PosFim := Pos('</fm>', Tag);
    strValor := Copy(Tag, PosIni, PosFim - PosIni);
    a := 1;
    if Pos('f', Mascara) > 0 then begin
      try
        ValorR := StrToFloat(strValor);
        while strValor[a] = ' ' do
          Inc(a);
      except
        ValorR := 0
      end;
      Result:= FormatFloat('#0,' + ThousandSeparator + '00', ValorR);
    end else if Pos('d', Mascara) > 0 then begin
      try
        ValorI := StrToInt(strValor);
        while strValor[a] = ' ' do
          Inc(a);
      except
        ValorI := 0
      end;
      Result := Format(Mascara, [ValorI]);
    end;
    if strValor[1] = ' ' then
      Result := StringOfChar(' ', Length(strValor) - Length(Result)) + Result;
  end;

  function FormatOut(S, Tag: String): String; overload;
  var
    WidthCount, Width, BPos, EPos: Integer;
    strWidth, TagAlign: String;
  begin
  { parse parametros -> (wwwa) }
    Result := S;
    Bpos := Pos('(', Tag) + 1;
    EPos := Pos(')', Tag) - 2;
    TagAlign := Copy(Tag, Epos + 1, 1);
    if (TagAlign <> 'C') and (TagAlign <> 'R') and (TagAlign <> 'L') then begin
      TagAlign := 'L';
      Inc(EPos)
    end;
    for WidthCount := BPos to EPos do
      strWidth := strWidth + Tag[WidthCount];
    Width := StrToInt(strWidth);
    if Length(Result) < Width then begin
      EPos := Width - Length(Result);
      if TagAlign = 'L' then
        for BPos := 1 to Epos do
          Result := Result + ' '
      else if TagAlign = 'R' then
        for BPos := 1 to Epos do
          Result :=  ' ' + Result
      else if TagAlign = 'C' then begin
        for BPos := 1 to (Epos div 2) do
           Result :=  ' ' + Result;
        if Odd(EPos) then
          for BPos := 1 to (Epos div 2) + 1 do
            Result := Result + ' '
        else
          for BPos := 1 to (Epos div 2) do
            Result := Result + ' ';
      end
    end else if Length(Result) > Width then
      Result := Copy(Result, 1, Width)
  end;

  function FormatMargem(Tag: String): String; overload;
  var
    Width, WidthCount, BPos, EPos, PosVirg, PosEnter, PosChar: Integer;
    str, strMargem, strWidth: String;
  begin
  { parse parametros -> (wwwa) }
    PosVirg :=  Pos(',', Tag) - 1;
    Bpos := Pos('(', Tag) + 1;
    EPos := Pos(')', Tag) - 1;
    Result := Trim(Copy(Tag, EPos+2, Pos('</m>', Tag) - EPos - 2));
    for WidthCount := BPos to PosVirg do
      strMargem := strMargem + Tag[WidthCount];
    for WidthCount := PosVirg+2 to EPos do
      strWidth := strWidth + Tag[WidthCount];
    try
      Width := StrToInt(strWidth)
    except
      Width := 0
    end;
    str := '<sbl><sp>('+strMargem+')</sp>';
    PosChar := Width;
    while PosChar < Length(Result) do begin
      if PosChar < Length(Result) then begin
        Insert(str, Result, PosChar);
        Inc(PosChar, Width + Length(str));
      end else
        Inc(PosChar, Width)
    end;

    repeat
      Result:= Trocar(Result,#13,' ');
      PosEnter := Pos(#$A, Result);
      if PosEnter > 0 then begin
        Delete(Result, PosEnter, 1);
        Insert(' ', Result, PosEnter)
      end;
    until PosEnter = 0;
  end;

var
  BTag: String;
  BPos, EPos, FieldIndex, TagCount, Count: Integer;
  Tag, FmtOut: String;
begin
  Result := Line;
{ parse campos -> tags <fn></fn> }
  if (Fields <> nil) then begin
    for FieldIndex := 0 to Fields.Count - 1 do begin
      BTag := Format(TAG_BG_DADOS,[Fields[FieldIndex].FieldName]);
      BPos := Pos(BTag, Result);
      if BPos = 0  then
        Continue
      else begin
        EPos := BPos + 3;
        repeat
          Inc(EPos);
        until Copy(Result, EPos, 4) = '</f>';
        if EPos = 0 then
          Continue
        else begin
          Tag := '';
          Inc(EPos, 3{ + Length(Fields[FieldIndex].FieldName)});
          for TagCount := BPos to EPos do
            Tag := Tag + Result[TagCount];
          FmtOut := FormatOut(Fields[FieldIndex].AsString, Tag);
          Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
        end;
      end;
    end;
  end;
{ parse espacos -> tag <fm></fm> }
  while Pos(TAG_BG_FORMAT, Result) <> 0 do begin
    Tag := '';
    BPos := Pos(TAG_BG_FORMAT, Result);
    if BPos <> 0  then begin
      EPos := Pos(TAG_EN_FORMAT, Result) + 4;
      if EPos <> 0  then begin
        for TagCount := BPos to EPos do
          Tag := Tag + Result[TagCount];
        FmtOut := FormatOut(Tag);
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
    end;
  end;

{ parse espacos -> tag <fc></fc> }
  Count := 1;
  repeat
    Tag := '';
    BPos := Pos(Format(TAG_BG_CONSTANT, [Count]), Result);
    if BPos <> 0  then begin
      EPos := Pos(Format(TAG_EN_CONSTANT, [Count]), Result) + 5;
      if EPos <> 0  then begin
        for TagCount := BPos to EPos do
           Tag := Tag + Result[TagCount];
        if High(constants)+1 >= Count then
          FmtOut := FormatOut(constants[Count-1], Tag)
        else
          FmtOut := '';
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
      Inc(Count);
    end;
  until BPos = 0;

{ parse espacos -> tag <sp></sp> }
  while Pos(TAG_BG_SPACER, Result) <> 0 do
  begin
    Tag := '';
    BPos := Pos(TAG_BG_SPACER, Result);
    if BPos <> 0  then
    begin
      EPos := Pos(TAG_EN_SPACER, Result) + 4;
      if EPos <> 0  then
      begin
        for TagCount := BPos to EPos do
           Tag := Tag + Result[TagCount];
        FmtOut := FormatOut('', Tag);
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
    end;
  end;

{ parse quebras -> tag <sbl> }
  while Pos(TAG_LINE_FEED, Result) <> 0  do
  begin
    Result := StringReplace(Result, TAG_LINE_FEED, LINE_FEED, []);
  end;
end;
*)

procedure TtecTextWriter.BeginDoc(Name:String);
begin
  if FileExists(Name) then
    DeleteFile(Name);
  AssignFile(FPrn,Name);
  Rewrite(FPrn);
end;

procedure TtecTextWriter.EndDoc;
begin
  CloseFile(FPrn);
end;

procedure TtecTextWriter.WriteBand(Campos: array of String; Valores: array of String);
var
  StrBand, StrOut: String;
begin
  StrBand := FBandString;
  StrOut := ParseBand(StrBand, Campos, Valores);
  Self.AddCommand(StrOut);
  Self.TextOut;
end;


(*procedure TtecTextWriter.WriteBand(Fields: TFields; constants: array of variant);
var
  StrBand, StrOut: String;
begin
  StrBand := FBandString;
  StrOut := ParseBand(StrBand, Fields, constants);
  Self.AddCommand(StrOut);
  Self.TextOut;
end;

procedure TtecTextWriter.WriteBand(Fields: TFields);
begin
  WriteBand(Fields, []);
end;

procedure TtecTextWriter.WriteBand(constants: array of variant);
begin
  WriteBand(nil, constants);
end; *)

procedure TtecTextWriter.TextOut;
{$IFNDEF LINUX}
var
  Buffer: TPrintBuffer;
  TempSpool: String;
  StackIdx: Integer;
{$ENDIF}
begin
  {$IFNDEF LINUX}
  while Length(FDoc) > 0 do
  begin
    FillChar(Buffer,0,SizeOf(Buffer));
    TempSpool := Copy(FDoc, 1, SizeOf(Buffer.Stack));
    Buffer.Length := Length(TempSpool);
    for StackIdx := 0 to Buffer.Length - 1 do
      Buffer.Stack[StackIdx] := TempSpool[StackIdx + 1];
    Escape(FPrn.Canvas.Handle, PASSTHROUGH, 0, @Buffer, nil);
    Delete(FDoc, 1, SizeOf(Buffer.Stack));
  end;
  {$ELSE}
   Write(FPrn, FDoc);
   Delete(FDoc, 1, Length(FDoc));
  {$ENDIF}
end;

initialization
  TextWriter := TtecTextWriter.Create;

finalization
  TextWriter.Free;

end.
