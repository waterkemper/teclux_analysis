{********************************************************}
{                                                        }
{                                                        }
{         Classe para comunicacao com impressoras        }
{           matriciais que emulam padrao EPSON           }
{                                                        }
{                   Ver 1.1 14/04/2003                   }
{********************************************************}

unit cltextprinter;

interface

uses
  //CLX
  {$IFNDEF LINUX} Windows, Printers,{$ELSE} Libc, QPrinters,{$ENDIF}
  classes, SysUtils, DB, Forms, clparametrossistema,
  //Biblio
  biblio, ctepson;

const
  CHR_CONV_STR     = 'acelnosxzACELNOSXZ';
  LAT_CONV_STR     = '•Ü©à‰¢ò´æ§è®ù„‡'#$97'çΩ';
  DEFAULT_CONV_STR = 'πÊÍ≥ÒÛúüø•∆ £—”åèØ';

  TAG_BG_DADOS                  = '<f%s>';
  TAG_EN_DADOS                  = '</f>';
  TAG_BG_FORMAT                 = '<fm>';
  TAG_EN_FORMAT                 = '</fm>';
  TAG_BG_VALNULL                = '<vn>';
  TAG_en_VALNULL                = '</vn>';
  TAG_BG_BAND                   = '<i>';
  TAG_EN_BAND                   = '</i>';
  TAG_BG_MARGEM                 = '<m>';
  TAG_EN_MARGEM                 = '</m>';
  TAG_BG_MARGEM2                = '<m2>';
  TAG_EN_MARGEM2                = '</m2>';
  TAG_BG_PRODUCTPAGE            = '<pp>';
  TAG_EN_PRODUCTPAGE            = '</pp>';
  TAG_BG_SERVICETPAGE            = '<svl>';
  TAG_EN_SERVICEPAGE            = '</svl>';
  TAG_BG_EXPIRATIONBAND         = '<vl>';
  TAG_EN_EXPIRATIONBAND         = '</vl>';
  TAG_BG_COLUMNSBAND            = '<cb>';
  TAG_EN_COLUMNSBAND            = '</cb>';
  TAG_BG_CONSTANT               = '<fc%d>';
  TAG_EN_CONSTANT               = '</fc%d>';
  TAG_BG_BOLD                   = '<b>';
  TAG_EN_BOLD                   = '</b>';
  TAG_BG_ITALIC                 = '<i>';
  TAG_EN_ITALIC                 = '</i>';
  TAG_BG_DWIDTH                 = '<ex>';
  TAG_EN_DWIDTH                 = '</ex>';
  TAG_BG_UNDERLINE              = '<u>';
  TAG_EN_UNDERLINE              = '</u>';
  TAG_BG_SPACER                 = '<sp>';
  TAG_EN_SPACER                 = '</sp>';
  TAG_BG_CONDENCER              = '<cd>';
  TAG_EN_CONDENCER              = '</cd>';
  TAG_BG_PAGE_LINES             = '<pl>';
  TAG_EN_PAGE_LINES             = '</pl>';
  TAG_BG_ETIQUETA               = '<e>';
  TAG_EN_ETIQUETA               = '</e>';

  TAG_LINE_FEED                 = '<sbl>';
  TAG_BG_8LINESINCHES           = '<lp8>';
  TAG_BG_6LINESINCHES           = '<lp6>';


type

  TPrintBuffer = record
    Length: Word;
    Stack: array [0..255] of Char;
  end;

  TtecTextFontStyle  = (mfBold, mfItalic, mfUnderline);
  TtecTextFontStyles = set of TtecTextFontStyle;

  TtecTextFontCharSet = (mcLatin, mcAnsiChar, mcDefault);

  TtecTextPrinter = class
  private
   {$IFNDEF LINUX}
    FPrn : TPrinter;
   {$ELSE}
//    FPrn : Integer;
    FNomeArq: String;
    FPrn : TextFile;
   {$ENDIF}
    FFontStyle: TtecTextFontStyles;
    FFontCharSet: TtecTextFontCharSet;
    FDoc: String;
    FBandString: String;
    FBandFile: TextFile;
    FPrinting: Boolean;
    FPageLines: Integer;
    FLineCount: Integer;
    FProductPerPage: Integer;
    FServicePerPage: Integer;
    FText : TStringList;
    FImprimirParaArquivo : BOolean;
    function ConvertCharSet(Text: String): String;
    function GetBandColumns: Integer;
    function ParseBand(Line:String; Fields: TFields; constants: array of variant): String;
//    procedure ImprimirComTesteImpressao(Arquivo: String);
    procedure SetPageLines(Value: Integer);
    procedure SetFontStyle(const Value: TtecTextFontStyles);
    procedure SetFontCharSet(const Value: TtecTextFontCharSet);
    procedure SetBandString(const Value: String);
    procedure SetBandFile(const Value: String);
    procedure SetAdvance(Advance: Integer);
    procedure AddCommand(Text: String);
    procedure TextOut;
    procedure addLinha(linha:String);
  public
    constructor Create;
    procedure BeginDoc(Configurar: String; CaracterControle: Boolean = True);
    procedure EndDoc(Title: String);
    procedure BreakLine(Breaks: Integer = 1);
    procedure BreakToLine;
    function  ExpirationBandLines(Configurar: String): Integer;
    procedure SetPageBounds(Left, Right: Integer);
    procedure FormFeed;
    procedure FormFeedCarneLinux;
    function  ProductPerPage(Configurar: String): Integer;
    function  ServicePerPage(Configurar: String): Integer;
    procedure WriteLine(Size, Column: Integer);
    procedure Writeln;
    procedure WriteChar(aChar: Char; Size, Column: Integer);
    procedure WriteText(aText: String; Column: Integer);
    procedure WriteTextln(aText: String; Column: Integer);
    procedure WriteFile(FileName: String);
    function  WriteBand(Fields: TFields; constants: array of variant; Final: Boolean = True): String; overload;
    procedure WriteBand(Fields: TFields); overload;
    procedure WriteBand(constants: array of variant); overload;
    property PageLines: Integer read FPageLines write SetPageLines;
    property BandFile: String write SetBandFile;
    property BandString: String read FBandString write SetBandString;
    property BandColumns: Integer read GetBandColumns;
    property FontStyle: TtecTextFontStyles read FFontStyle write SetFontStyle;
    property CharSet: TtecTextFontCharSet read FFontCharSet write SetFontCharSet default mcDefault;
    property Printing: Boolean read FPrinting default False;
    property Text    : TStringList read FText write FText;
    property ImprimirParaArquivo : Boolean read FImprimirParaArquivo write FImprimirParaArquivo;
  end;

var
  TextPrinter: TtecTextPrinter = nil;

//  NomeImpNotaFiscal       : String = '';
//  NomeImpCarne            : String = '';
//  NomeImpBoleto           : String = '';

//  NomeImpEtiqueta         : String = '';
//  TipoImpressoraEtiqueta  : String = '';
  NomeImpressoraEscolhida : String = '';
  ColCarne: Integer;

implementation

{ TtecTextPrinter }

constructor TtecTextPrinter.Create;
begin
  FDoc := '';
  {$IFNDEF LINUX}
  FPrn := Printer;
  {$ENDIF}
  FPageLines := 88;
  FLineCount := 1;
  FPrinting := False;
  FFontStyle := [];
  FFontCharSet := mcDefault;
  FText :=  TStringList.Create;
end;

function TtecTextPrinter.GetBandColumns: Integer;
var
  PosIni, PosFim: Integer;
begin
  PosIni := Pos(TAG_BG_COLUMNSBAND, BandString);
  if PosIni > 0 then begin
    PosFim := Pos(TAG_EN_COLUMNSBAND, BandString);
    try
      Result := StrToInt(Copy(BandString, PosIni + Length(TAG_BG_COLUMNSBAND), PosFim - PosIni - Length(TAG_BG_COLUMNSBAND)));
    except
      Result := 0
    end;
    Delete(FBandString, PosIni, PosFim - PosIni + Length(TAG_EN_COLUMNSBAND));
  end else
    Result := 1;
end;

procedure TtecTextPrinter.SetPageLines(Value: Integer);
begin
  if FPrinting then
  begin
    if Value < 1 then
      Value := 1
    else
    if Value > 127 then
      Value := 127;
    FPageLines := Value;
//    Self.AddCommand(EPS_SET_FORM_LINES + IntToStr(Value));
    Self.TextOut;
  end;
end;

procedure TtecTextPrinter.SetPageBounds(Left, Right: Integer);
begin
  if not FPrinting then
  begin
    Self.AddCommand(EPS_SET_MARGIN_LEFT + IntToStr(Left));
    Self.AddCommand(EPS_SET_MARGIN_RIGHT + IntToStr(Right));
    Self.TextOut;
  end;
end;

procedure TtecTextPrinter.SetFontStyle(const Value: TtecTextFontStyles);
begin
  if FFontStyle <> Value then
  begin
    if not (mfBold in FFontStyle) and (mfBold in Value) then
      AddCommand(EPS_ON_BOLD)
    else
    if (mfBold in FFontStyle) and not (mfBold in Value) then
      AddCommand(EPS_OFF_BOLD);
    if not (mfItalic  in FFontStyle) and (mfItalic in Value) then
      AddCommand(EPS_ON_ITALIC)
    else
    if (mfItalic in FFontStyle) and not(mfItalic in Value) then
      AddCommand(EPS_OFF_ITALIC);
    if not (mfUnderline in FFontStyle) and (mfUnderline in Value) then
      AddCommand(EPS_ON_UNDERLINE)
    else
    if (mfUnderline in FFontStyle) and not(mfUnderline in Value) then
      AddCommand(EPS_OFF_UNDERLINE);
    FFontStyle := Value;
  end;
end;

procedure TtecTextPrinter.SetFontCharSet(const Value: TtecTextFontCharSet);
begin
  if FFontCharSet <> Value then
    FFontCharSet := Value;
end;

procedure TtecTextPrinter.SetBandString(const Value: String);
begin
  FBandString := Value;
end;

procedure TtecTextPrinter.SetBandFile(const Value: String);
begin
  if not FileExists(Value) then
    raise Exception.Create('O Arquivo especificado n„o existe');
  AssignFile(FBandFile, Value);
  FBandString := '';
end;

procedure TtecTextPrinter.SetAdvance(Advance: Integer);
var
  val: Integer;
begin
  if (Advance + FLineCount) > FPageLines then
  begin
    val := (Advance + FLineCount) - FPageLines;
    repeat
       if val > FPageLines then
         Dec(val, FPageLines);
    until val <= FPageLines;
    FLineCount := val;
  end
  else
    Inc(FLineCount, Advance);
end;

procedure TtecTextPrinter.AddCommand(Text: String);
begin
  if not FImprimirParaArquivo then
    FDoc := FDoc + Text;
  addLinha(Text);
end;

procedure TtecTextPrinter.TextOut;
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

function TtecTextPrinter.ConvertCharSet(Text: String): String;

  function ChangeSet(Text, FromSet, ToSet: String): String;
  var
    Fcnt, Tcnt: Integer;
  begin
    for Fcnt := 1 to Length(Text) do
    begin
        Tcnt := Pos(Text[Fcnt], FromSet);
        if Tcnt <> 0 then
          Text[Fcnt]:= ToSet[Tcnt]
    end;
    Result := Text;
  end;

begin
  case FFontCharSet of
    mcLatin    : Result := ChangeSet(Text, DEFAULT_CONV_STR, LAT_CONV_STR);
    mcAnsiChar : Result := ChangeSet(Text, DEFAULT_CONV_STR, CHR_CONV_STR);
    mcDefault  : Result := Text;
  end;
end;

function TtecTextPrinter.ParseBand(Line: String; Fields: TFields; constants: array of variant): String;

  function FormatOut(Tag: String): String; overload;
  var
    a, PosIni, PosFim: Integer;
    Mascara, strValor, NCasas: String;
    ValorR: Real;
    ValorI: Integer;
    ValorS: String;
  begin
    PosIni := Pos('(', Tag);
    PosFim := Pos(')', Tag) - 1;
    Mascara := Copy(Tag, PosIni + 1, PosFim - PosIni);
    PosIni := PosFim + 2;
    if Copy(Tag, 0,4) = '<vn>' then PosFim:= Pos('</vn>',Tag) else
    PosFim := Pos('</fm>', Tag);
    strValor := Copy(Tag, PosIni, PosFim - PosIni);
    if (strValor = '') or ((Copy(Tag, 0,4) = '<vn>') and (StrValor = '              ')) then StrValor := '0,00';
//    a := 1;
    if Pos('f', Mascara) > 0 then begin
      try
        ValorR := StrToFloat(strValor);
//        while strValor[a] = ' ' do
//          Inc(a);
      except
        ValorR := 0
      end;
//      Result:= FormatFloat('#0,' + ThousandSeparator + '00', ValorR);
//      Result := Format(Mascara, [ValorR]);
      a := pos('.',Mascara);
      NCasas := Copy(Mascara,a+1,Length(Mascara) -1);
      NCasas := SomenteNumero(NCasas);
      Result := FormatarValor(ValorR,StrToInt(NCasas));
    end else if Pos('dd/mm/yy', Mascara) > 0 then begin
      try
       ValorS := formatdatetime('dd/mm/yy', strtodate(strValor))
      except
      end;
      result := ValorS;
    end else if Pos('d', Mascara) > 0 then begin
      try
        ValorI := StrToInt(strValor);
//        while strValor[a] = ' ' do
//          Inc(a);
      except
        ValorI := 0
      end;
      Result := Format(Mascara, [ValorI]);
    end else if Pos('i', Mascara) > 0 then begin
      result := FormatStringOut(trim(strValor),'R','0',6,true)
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

  function FormatMargem(Tag: String; RetirarEnter: Boolean = True): String; overload;
  var
    Width, WidthCount, BPos, EPos, PosVirg, PosEnter, PosChar: Integer;
    str, strMargem, strWidth, analisando, EspacoInicioLinha: String;
  begin
  { parse parametros -> (wwwa) }
    PosVirg :=  Pos(',', Tag) - 1;
    Bpos := Pos('(', Tag) + 1;
    EPos := Pos(')', Tag) - 1;
    if RetirarEnter then
      Result := Trim(Copy(Tag, EPos+2, Pos('</m>', Tag) - EPos - 2))
    else
      Result := Trim(Copy(Tag, EPos+2, Pos('</m2>', Tag) - EPos - 2));
    for WidthCount := BPos to PosVirg do
      strMargem := strMargem + Tag[WidthCount];
    for WidthCount := PosVirg+2 to EPos do
      strWidth := strWidth + Tag[WidthCount];
    try
      Width := StrToInt(strWidth)
    except
      Width := 0
    end;
    if StrToInt(strMargem) > 0 then
      EspacoInicioLinha := '<sp>('+strMargem+')</sp>'
    else
      EspacoInicioLinha := '';
    str := '<sbl>';
    if RetirarEnter then
    begin
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
    end
    else
    begin
      analisando := Result;
      Result := '';
      while (Length(analisando) > width) or (Pos(#$A,analisando) <> 0) do
      begin
        PosEnter := Pos(#$A,analisando);
        if (posenter = 0) or (posenter > width)then
        begin
          Result := Result + EspacoInicioLinha + Copy(analisando,0,Width) + str;
          Delete(analisando,1,Width);
        end
        else
        begin
          Result := Result + EspacoInicioLinha + Copy(analisando,1,PosEnter-1) + str;
          Delete(analisando,1,PosEnter);
        end;
      end;
      if analisando <> '' then
        Result := Result + EspacoInicioLinha + analisando;
    end;
  end;

var
  BTag: String;
  PPos, BPos, EPos, FieldIndex, TagCount, Count: Integer;
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
  //      ETag := Format(TAG_EN_DADOS,[Fields[FieldIndex].FieldName]);
        EPos := BPos + 3;
        repeat
          Inc(EPos);
        until Copy(Result, EPos, 4) = '</f>';
  //      EPos := Pos(TAG_EN_DADOS, Result);
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

  while Pos(TAG_BG_VALNULL, Result) <> 0 do begin
    Tag := '';
    BPos := Pos(TAG_BG_VALNULL, Result);
    if BPos <> 0  then begin
      EPos := Pos(TAG_EN_VALNULL, Result) + 4;
      if EPos <> 0  then begin
        for TagCount := BPos to EPos do
          Tag := Tag + Result[TagCount];
        FmtOut := FormatOut(Tag);
        If Trim(FmtOut) = '0,00' then
          FmtOut := '';
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

{ parse espacos -> tag <m></m> }
  while Pos(TAG_BG_MARGEM, Result) <> 0 do begin
    Tag := '';
    BPos := Pos(TAG_BG_MARGEM, Result);
    if BPos <> 0  then begin
      EPos := Pos(TAG_EN_MARGEM, Result) + 3;
      if EPos <> 0  then begin
        for TagCount := BPos to EPos do
           Tag := Tag + Result[TagCount];
        FmtOut := FormatMargem(Tag);
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
    end;
  end;

{ parse espacos -> tag <m2></m2> }
  while Pos(TAG_BG_MARGEM2, Result) <> 0 do begin
    Tag := '';
    BPos := Pos(TAG_BG_MARGEM2, Result);
    if BPos <> 0  then begin
      EPos := Pos(TAG_EN_MARGEM2, Result) + 4;
      if EPos <> 0  then begin
        for TagCount := BPos to EPos do
           Tag := Tag + Result[TagCount];
        FmtOut := FormatMargem(Tag,False);
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


{ parse etiqueta -> tag <e></e> }
  while Pos(TAG_BG_ETIQUETA, Result) <> 0 do
  begin
    Tag := '';
    BPos := Pos(TAG_BG_ETIQUETA, Result);
    if BPos <> 0  then
    begin
      EPos := Pos(TAG_EN_ETIQUETA, Result);
      if EPos <> 0  then
      begin
        PPos:= Pos('(', Result);
        BTag:= Copy(Result,BPos+3,(PPos-1) - (BPos+2));
        for TagCount := BPos to EPos+3 do
           Tag := Tag + Result[TagCount];
        FmtOut := FormatOut(BTag, Tag);
        Result := StringReplace(Result, Tag, FmtOut, [rfReplaceAll]);
      end;
    end;
  end;

{ parse quebras -> tag <sbl> }
  TagCount := 0;
  while Pos(TAG_LINE_FEED, Result) <> 0  do
  begin
    Result := StringReplace(Result, TAG_LINE_FEED, EPS_CR+EPS_LINE_FEED, []);
    Inc(TagCount);
  end;

  if TagCount <> 0 then
    Self.SetAdvance(TagCount);
{ parse formatacoes -> tags <b></b>, <i></i>, <u></u>, <cd></cd>, <ex></ex> }

  Result := StringReplace(Result, TAG_BG_BOLD, EPS_ON_BOLD, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_EN_BOLD, EPS_OFF_BOLD, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_BG_ITALIC, EPS_ON_ITALIC, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_EN_ITALIC, EPS_OFF_ITALIC, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_BG_UNDERLINE, EPS_ON_UNDERLINE, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_EN_UNDERLINE, EPS_OFF_UNDERLINE, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_BG_CONDENCER, EPS_ON_CONDENSED, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_EN_CONDENCER, EPS_OFF_CONDENSED, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_BG_DWIDTH, EPS_ON_DWIDTH, [rfReplaceAll]);
  Result := StringReplace(Result, TAG_EN_DWIDTH, EPS_OFF_DWIDTH, [rfReplaceAll]);
end;

procedure TtecTextPrinter.BeginDoc(Configurar: String; CaracterControle: Boolean = True);
var
  PosI, PosF: Integer;
  Linhas: Integer;
{$IFDEF LINUX}
  NroSeq,
{$ENDIF}
  Str: String;
begin
{$IFNDEF LINUX}
  if not (ImprimirParaArquivo) then
  begin
    if NomeImpressoraEscolhida <> '' then
    begin
      FPrn.SetPrinter(PChar(NomeImpressoraEscolhida), 'WINSPOOL', '', 0);
    end;
    FPrn.BeginDoc;
  end;
{$ELSE}
  DateTimeToString(NroSeq, 'mdhnszzz', Now);
  FNomeArq :=  '/tmp/tecluxfileprn' + NroSeq + '.tmp';
  AssignFile(FPrn, FNomeArq);
  Rewrite(FPrn);
{$ENDIF}
  FPrinting := True;

//----- Carlos (05/04/2006)---------------------------------------------------------------------------------------------------
  PosI := Pos(TAG_BG_COLUMNSBAND, Configurar);
  if PosI > 0 then begin
    PosF := Pos(TAG_EN_COLUMNSBAND, Configurar);
    try
      ColCarne := StrToInt(Copy(Configurar, PosI + Length(TAG_BG_COLUMNSBAND), PosF - PosI - Length(TAG_BG_COLUMNSBAND)));
    except
      ColCarne := 1
    end;
  end else
    ColCarne := 1;
//-----------------------------------------------------------------------------------------------------------------------------

  PosI := Pos(TAG_BG_8LINESINCHES, Configurar);
  if PosI > 0 then begin
    Str := Copy(Configurar, PosI, Length(TAG_BG_8LINESINCHES));
    Str :=StringReplace(Str, TAG_BG_8LINESINCHES, EPS_SMALL_BREAK, [rfReplaceAll])
  end else begin
    PosI := Pos(TAG_BG_6LINESINCHES, Configurar);
    if PosI > 0 then begin
      Str := Copy(Configurar, PosI, Length(TAG_BG_6LINESINCHES));
      Str :=StringReplace(Str, TAG_BG_6LINESINCHES, EPS_BIG_BREAK, [rfReplaceAll])
    end
  end;
  PosI := Pos(TAG_BG_PAGE_LINES, Configurar);
  if PosI > 0 then begin
    PosF := Pos(TAG_EN_PAGE_LINES, Configurar);
    if PosF > 0 then begin
      try
        Linhas := StrToInt(Copy(Configurar, PosI + Length(TAG_BG_PAGE_LINES), PosF - PosI - Length(TAG_BG_PAGE_LINES)));
      except
        Linhas := 0
      end;
      Str := Str + EPS_SET_FORM_LINES + chr(Linhas);
      PageLines := Linhas;
    end
  end;
  if CaracterControle then
    AddCommand(EPS_INIT_PRINT + EPS_NORMALSCRIPT + EPS_OFF_DWIDTH + EPS_OFF_DHEIGHT + Str);
  FLineCount := 1;
end;

procedure TtecTextPrinter.EndDoc(Title: String);
begin
{$IFNDEF LINUX}
  if not (FImprimirParaArquivo) then
  begin
    FPrn.Title := Title;
    EndPage(FPrn.Handle);
   // verificar comportamento da fila de impressao
    FPrn.EndDoc;
  end;
{$ELSE}
  CloseFile(FPrn);
  if NomeImpressoraEscolhida = '' then
    Libc.system(PChar('lpr -l-r -J ''' + Title + ''' ' + FNomeArq))
  else
    Libc.system(PChar('lpr -l-r -J ''' + Title + ''' -P '+ NomeImpressoraEscolhida + ' ' + FNomeArq));
  DeleteFile(FNomeArq);
{$ENDIF}
  FPrinting := False;
end;
(*
procedure TtecTextPrinter.ImprimirComTesteImpressao(Arquivo: String);
var
  F: TextFile;
  S: String;
begin
  {$I-}
  AssignFile(F,Arquivo);
  Reset(F);
  If (IOResult = 0) then begin
    Readln(F,S);
    if IOResult = 0 then begin
//      Libc.system(Pchar('echo ' + S + ' > /dev/lp0'));
      repeat
        repeat
          Readln(F,S);
          if IOResult = 0 then
            System.WriteLn(S,'/dev/lp0');
//            Libc.system(Pchar('echo ' + S + ' > /dev/lp0'));
        until (S <> '');
      until MensagemConfirmacao('Imprimir Teste de Impress„o?') = smbCancel;
    end;
    CloseFile(F);
  end;
  {$I+}
end;
  *)
procedure TtecTextPrinter.BreakLine(Breaks: Integer);
var
  cnt: Integer;
begin
  for cnt := 1 to Breaks do
    AddCommand(EPS_CR + EPS_LINE_FEED);
  TextOut;
  SetAdvance(Breaks);
end;

procedure TtecTextPrinter.BreakToLine;
var
  PosIni, PosFim, Line: Integer;
begin
  PosIni := Pos(TAG_BG_BAND, BandString);
  if PosIni > 0 then begin
    PosFim := Pos(TAG_EN_BAND, BandString);
    try
      Line := StrToInt(Copy(BandString, PosIni + Length(TAG_BG_BAND), PosFim - PosIni - Length(TAG_BG_BAND)));
    except
      Line := 0
    end;
    if (Line > FLineCount) and (Line <= FPageLines) then
      BreakLine(Line - FLineCount);
    Delete(FBandString, PosIni, PosFim + Length(TAG_EN_BAND)-1);
  end
end;

function TtecTextPrinter.ExpirationBandLines(Configurar: String): Integer;
var
  PosIni, PosFim: Integer;
begin
  PosIni := Pos(TAG_BG_EXPIRATIONBAND, Configurar);
  if PosIni = 0 then
    Result := 0
  else begin
    PosFim := Pos(TAG_EN_EXPIRATIONBAND, Configurar);
    try
      Result := StrToInt(Copy(Configurar, PosIni + Length(TAG_BG_EXPIRATIONBAND), PosFim - PosIni - Length(TAG_BG_EXPIRATIONBAND)));
    except
      Result := 0
    end;
    FProductPerPage := Result;
  end
end;

procedure TtecTextPrinter.FormFeedCarneLinux;
begin
  Self.AddCommand(EPS_FORM_FEED);
  Self.TextOut;
  FLineCount := 1;
end;


procedure TtecTextPrinter.FormFeed;
begin
{$IFDEF LINUX}
  Self.AddCommand(EPS_FORM_FEED);
  Self.TextOut;
{$ELSE}
  if ParSistema.ImprimirLineFeednaImpressoraMatricial then
  begin
    Self.AddCommand(EPS_FORM_FEED);
    Self.TextOut;
  end;
{$ENDIF}
  FLineCount := 1;
end;

function TtecTextPrinter.ProductPerPage(Configurar: String): Integer;
var
  PosIni, PosFim: Integer;
begin
  PosIni := Pos(TAG_BG_PRODUCTPAGE, Configurar);
  if PosIni = 0 then
    Result := 0
  else begin
    PosFim := Pos(TAG_EN_PRODUCTPAGE, Configurar);
    try
      Result := StrToInt(Copy(Configurar, PosIni + Length(TAG_BG_PRODUCTPAGE), PosFim - PosIni - Length(TAG_BG_PRODUCTPAGE)));
    except
      Result := 0
    end;
    FProductPerPage := Result;
  end
end;

function TtecTextPrinter.ServicePerPage(Configurar: String): Integer;
var
  PosIni, PosFim: Integer;
begin
  PosIni := Pos(TAG_BG_SERVICETPAGE, Configurar);
  if PosIni = 0 then
    Result := 0
  else begin
    PosFim := Pos(TAG_EN_SERVICEPAGE, Configurar);
    try
      Result := StrToInt(Copy(Configurar, PosIni + Length(TAG_BG_SERVICETPAGE), PosFim - PosIni - Length(TAG_BG_SERVICETPAGE)));
    except
      Result := 0
    end;
    FServicePerPage := Result;
  end
end;

procedure TtecTextPrinter.WriteLine(Size, Column: Integer);
var
  StrOut: String;
begin
  StrOut := StringOfChar(' ', Column);
  Self.AddCommand(StrOut);
  StrOut := StringOfChar(LINE, Size);
  Self.AddCommand(StrOut);
  Self.TextOut;
end;

procedure TtecTextPrinter.WriteChar(aChar: Char; Size, Column: Integer);
var
  StrOut: String;
begin
  StrOut := StringOfChar(' ', Column);
  Self.AddCommand(StrOut);
  StrOut := StringOfChar(aChar, Size);
  Self.AddCommand(StrOut);
  Self.TextOut;
end;

procedure TtecTextPrinter.Writeln;
begin
  Self.AddCommand(EPS_CR + EPS_LINE_FEED);
  Self.TextOut;
end;

procedure TtecTextPrinter.WriteText(aText: String; Column: Integer);
var
  StrOut: String;
begin
  StrOut := StringOfChar(' ', Column);
  Self.AddCommand(StrOut);
  Self.AddCommand(ConvertCharSet(aText));
  Self.TextOut;
end;

procedure TtecTextPrinter.WriteTextln(aText: String; Column: Integer);
var
  StrOut: String;
begin
  StrOut := StringOfChar(' ', Column);
  Self.AddCommand(StrOut);
  Self.AddCommand(ConvertCharSet(aText));
  Self.TextOut;
  Writeln;
end;

procedure TtecTextPrinter.WriteFile(FileName: String);
var
  F: TextFile;
  StrOut: String;
begin
  if not FileExists(FileName) then
    raise Exception.Create('O Arquivo especificado n„o existe');
  AssignFile(F, FileName);
  Reset(F);
  while not EOF(F) do
  begin
    Readln(F, StrOut);
    Self.AddCommand(StrOut + EPS_CR + EPS_LINE_FEED);
  end;
  CloseFile(F);
  Self.TextOut;
end;

procedure TtecTextPrinter.WriteBand(constants: array of variant);
begin
  WriteBand(nil, constants);
end;

procedure TtecTextPrinter.WriteBand(Fields: TFields);
begin
  WriteBand(Fields, []);
end;

function TtecTextPrinter.WriteBand(Fields: TFields; constants: array of variant; Final: Boolean = True): String;
var
  StrBand, StrLine, StrOut: String;
begin
  StrBand := '';
  if FBandString = '' then
    try
      Reset(FBandFile);
      while not EOF(FBandFile) do
      begin
        Readln(FBandFile, StrLine);
        StrBand := StrBand + StrLine;
      end;
    except raise;
    end
  else
    StrBand := FBandString;
  StrOut := ParseBand(StrBand, Fields, constants);
  Result := StrOut;
  if Final then
  begin
    Self.AddCommand(StrOut);
    Self.TextOut;
  end;
end;


procedure TtecTextPrinter.addLinha(linha: String);
begin
  FText.Add(linha);
end;

initialization
  TextPrinter := TtecTextPrinter.Create;

finalization
  TextPrinter.Free;

end.
