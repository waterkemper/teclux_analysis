unit NFePrintValidator_anterior;
interface

uses
  Windows, SysUtils, Variants, ComObj, ActiveX, classes, XmlDoc, XmlIntf; // Delphi 7

type
  TNFeValidationResult = record
    IsPrintable: Boolean;   // True se pode imprimir DANFE normal
    IsAuthorized: Boolean;  // cStat 100/150
    IsCanceled: Boolean;    // Evento 110111 autorizado (135/155)
    Chave: string;          // chNFe (ou extraída do @Id)
    Motivo: string;         // xMotivo do protocolo, ou erro
    cStat: string;          // código do protocolo
  end;

function ValidateNFeXmlForPrinting(const AXml: AnsiString; const AXsdDir: string = ''): TNFeValidationResult;
function ValidateNFeXmlForPrintingFromFile(const AFileName: string; const AXsdDir: string = ''): TNFeValidationResult;
//function ExtractNFeXml(const AXml: WideString): WideString;

implementation

function VarHasValue(const V: OleVariant): Boolean;
begin
  Result := (not VarIsNull(V)) and (not VarIsEmpty(V));
end;

function CreateDom(var UsedMsxml6: Boolean): OleVariant;
begin
  UsedMsxml6 := False;
  try
    Result := CreateOleObject('Msxml2.DOMDocument.6.0');
    UsedMsxml6 := True;
    Exit;
  except
    // fallback para MSXML 3 (sem validação XSD)
  end;
  Result := CreateOleObject('Msxml2.DOMDocument.3.0');
end;

function CreateSchemaCache: OleVariant;
begin
  // só existe no MSXML 6
  Result := CreateOleObject('Msxml2.XMLSchemaCache.6.0');
end;

function TextOfNode(const N: OleVariant): string;
begin
  if VarHasValue(N) then
    Result := N.text
  else
    Result := '';
end;

function AttrOfNode(const N: OleVariant; const Attr: string): string;
var A: OleVariant;
begin
  Result := '';
  if not VarHasValue(N) then Exit;
  A := N.attributes.getNamedItem(Attr);
  if VarHasValue(A) then
    Result := A.nodeValue;
end;

procedure LoadBasicNFeSchemas(const Cache: OleVariant; const Dir: string);
  procedure TryAdd(const Ns, FileName: string);
  var Path: string;
  begin
    Path := IncludeTrailingPathDelimiter(Dir) + FileName;
    if FileExists(Path) then
      Cache.add(Ns, Path);
  end;
const
  NS_NFE = 'http://www.portalfiscal.inf.br/nfe';
begin
  // Ajuste os nomes conforme seu pacote oficial de XSDs
  TryAdd(NS_NFE, 'nfe_v4.00.xsd');
  TryAdd(NS_NFE, 'procNFe_v4.00.xsd');
  TryAdd(NS_NFE, 'retConsSitNFe_v4.00.xsd');
  TryAdd(NS_NFE, 'eventoNFe_v1.00.xsd');
  TryAdd(NS_NFE, 'retEnvEvento_v1.00.xsd');
  TryAdd(NS_NFE, 'procEventoNFe_v1.00.xsd');
  // Dependências comuns (se existirem)
  TryAdd(NS_NFE, 'tiposBasico_v4.00.xsd');
end;

function BuildDom(const AXml: AnsiString; const AXsdDir: string;
                  out Dom: OleVariant; out ErrMsg: string): Boolean;
var
  Used6: Boolean;
  ParseOk: WordBool;
  Err: OleVariant;
  Cache: OleVariant;
begin
  Result := False;
  ErrMsg := '';

  Dom := CreateDom(Used6);
  Dom.async := False;
  Dom.validateOnParse := False;
  Dom.resolveExternals := True;
  Dom.setProperty('SelectionLanguage', 'XPath');

  // Se temos MSXML 6 e pediram XSD, anexar schemas
  if Used6 and (AXsdDir <> '') then
  try
    Cache := CreateSchemaCache;
    LoadBasicNFeSchemas(Cache, AXsdDir);
    Dom.schemas := Cache;
  except
    // se falhar, segue sem XSD
  end;

  ParseOk := Dom.loadXML(AXml);
  if not ParseOk then
  begin
    Err := Dom.parseError;
    if VarHasValue(Err) then
      ErrMsg := Format('Falha ao carregar XML (%d): %s (linha %d, pos %d)',
                       [Integer(Err.errorCode), string(Err.reason),
                        Integer(Err.line), Integer(Err.linepos)])
    else
      ErrMsg := 'Falha ao carregar XML.';
    Exit;
  end;

  // Validação XSD apenas se schemas estiverem anexados (MSXML 6)
  if VarHasValue(Dom.schemas) then
  begin
    Err := Dom.validate;
    if VarHasValue(Err) and (Integer(Err.errorCode) <> 0) then
    begin
      ErrMsg := Format('Falha de validação XSD (%d): %s (linha %d, pos %d)',
                       [Integer(Err.errorCode), string(Err.reason),
                        Integer(Err.line), Integer(Err.linepos)]);
      Exit;
    end;
  end;

  Result := True;
end;

function ExtractChave(const Dom: OleVariant): string;
var
  N, Inf: OleVariant;
  Id: string;
begin
  Result := '';
  // chNFe do protocolo
  N := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]/*[local-name()="chNFe"]');
  if VarHasValue(N) then
  begin
    Result := Trim(TextOfNode(N));
    if Result <> '' then Exit;
  end;

  // fallback: @Id da infNFe
  Inf := Dom.selectSingleNode('//*[local-name()="infNFe"]');
  if VarHasValue(Inf) then
  begin
    Id := AttrOfNode(Inf, 'Id');
    if (Length(Id) >= 47) and (Copy(Id, 1, 3) = 'NFe') then
      Result := Copy(Id, 4, 44);
  end;
end;

function ValidateNFeXmlForPrinting(const AXml: AnsiString; const AXsdDir: string): TNFeValidationResult;
var
  Dom: OleVariant;
  Err: string;
  NProt, NInfProt, N: OleVariant;
  cStat, xMotivo: string;
  CancelEvt: OleVariant;
begin
  FillChar(Result, SizeOf(Result), 0);

  CoInitialize(nil);
  try
    if not BuildDom(AXml, AXsdDir, Dom, Err) then
    begin
      Result.Motivo := Err;
      Exit;
    end;

    // Precisa ter protocolo
    NProt := Dom.selectSingleNode('//*[local-name()="protNFe"]');
    if not VarHasValue(NProt) then
    begin
      Result.Motivo := 'XML sem protocolo (use o arquivo *-procNFe.xml do retorno da SEFAZ).';
      Exit;
    end;

    NInfProt := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]');
    if not VarHasValue(NInfProt) then
    begin
      Result.Motivo := 'Bloco infProt não encontrado no protocolo.';
      Exit;
    end;

    N := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]/*[local-name()="cStat"]');
    cStat := Trim(TextOfNode(N));

    N := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]/*[local-name()="xMotivo"]');
    xMotivo := Trim(TextOfNode(N));

    Result.cStat := cStat;
    Result.Motivo := xMotivo;
    Result.Chave := ExtractChave(Dom);

    // Autorizada?
    Result.IsAuthorized := (cStat = '100') or (cStat = '150');
    if not Result.IsAuthorized then
    begin
      if Result.Motivo = '' then
        Result.Motivo := 'NF-e não autorizada (cStat=' + cStat + ').';
      Result.IsPrintable := False;
      Exit;
    end;

    // Cancelamento autorizado? (evento 110111 com cStat 135/155)
    CancelEvt :=
      Dom.selectSingleNode(
        '//*[local-name()="procEventoNFe" or local-name()="retEvento"]' +
        '//*[local-name()="infEvento" and ./*[local-name()="tpEvento" and normalize-space(text())="110111"] and ' +
        '( ./*[local-name()="cStat" and (normalize-space(text())="135" or normalize-space(text())="155")] ) ]'
      );

    Result.IsCanceled := VarHasValue(CancelEvt);
    Result.IsPrintable := Result.IsAuthorized and (not Result.IsCanceled);

    if Result.IsCanceled then
      Result.Motivo := 'NF-e cancelada — imprimir DANFE de cancelamento (evento 110111 autorizado).';
  finally
    CoUninitialize;
  end;
end;

function ValidateNFeXmlForPrintingFromFile(const AFileName: string; const AXsdDir: string): TNFeValidationResult;
var
  S: AnsiString;
  FS: TFileStream;
begin
  if not FileExists(AFileName) then
  begin
    FillChar(Result, SizeOf(Result), 0);
    Result.Motivo := 'Arquivo não encontrado: ' + AFileName;
    Exit;
  end;

  FS := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyNone);
  try
    SetLength(S, FS.Size);
    if FS.Size > 0 then
      FS.ReadBuffer(S[1], FS.Size);
  finally
    FS.Free;
  end;

  Result := ValidateNFeXmlForPrinting(S, AXsdDir);
end;



(*
function ExtractNFeXml(const AXml: WideString): WideString;
var
  Doc: IXMLDocument;
  Root, N: IXMLNode;
  I: Integer;
  function NomeLocal(const X: IXMLNode): string;
  begin
    Result := X.LocalName;
    if Result = '' then Result := X.NodeName; // D7 às vezes não preenche LocalName
  end;
begin
  Result := '';
  Doc := TXMLDocument.Create(nil);
  Doc.Options := Doc.Options + [doNodeAutoIndent];
  Doc.ParseOptions := Doc.ParseOptions + [poPreserveWhiteSpace];
  Doc.LoadFromXML(AXml);
  Doc.Active := True;

  Root := Doc.DocumentElement;
  if Root = nil then Exit;

  // 1) Se a raiz já é <NFe ...>
  if SameText(NomeLocal(Root), 'NFe') then
  begin
    Result := Root.XML;
    Exit;
  end;

  // 2) Tenta filho direto com nome exato (sem namespace)
  N := Root.ChildNodes.FindNode('NFe');
  if N <> nil then
  begin
    Result := N.XML;
    Exit;
  end;

  // 3) Varre só 1º nível, ignorando prefixo (ns:NFe)
  for I := 0 to Root.ChildNodes.Count - 1 do
  begin
    N := Root.ChildNodes[I];
    if SameText(NomeLocal(N), 'NFe') then
    begin
      Result := N.XML;
      Exit;
    end;
  end;
end;
*)


end.

