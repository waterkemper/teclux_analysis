unit ProcNFeBuilder;

interface

uses
  SysUtils, Classes, XmlDoc, XmlIntf;

{ Retorna o outer XML da tag desejada (ex.: 'NFe' ou 'protNFe').
  Ignora prefixo de namespace (funciona para <NFe> e <ns:NFe>). }
function ExtractXmlNode(const AXml, ATagName: WideString): WideString;
function ExtractXmlNodeFromFile(const AFileName, ATagName: string): WideString;

{ Monta o nfeProc simples:
  <?xml version="1.0" encoding="UTF-8"?>
  <nfeProc versao="4.00" xmlns="http://www.portalfiscal.inf.br/nfe">
    <NFe>...</NFe>
    <protNFe>...</protNFe>
  </nfeProc> }
function MontarProcNFe(const ConteudoNFe, ConteudoProt: WideString): WideString;

{ Salva WideString em UTF-8 com BOM (Delphi 7) }
procedure SaveStringAsUTF8(const AFileName: string; const S: WideString);

{ Atalhos práticos (1 fonte com NFe+protNFe no mesmo arquivo/string) }
function BuildProcNFeFromSource(const XmlFonte: WideString): WideString; overload;
function BuildProcNFeFromSource(const XmlFonte: WideString; const DestFile: string): Boolean; overload;
function BuildProcNFeFromFile(const SourceFile: string): WideString; overload;
function BuildProcNFeFromFile(const SourceFile, DestFile: string): Boolean; overload;

{ *** NOVOS: duas fontes/arquivos distintos *** }
function BuildProcNFeFromFiles(const NFeFile, ProtFile: string): WideString; overload;
function BuildProcNFeFromFiles(const NFeFile, ProtFile, DestFile: string): Boolean; overload;

implementation

function _LocalName(const N: IXMLNode): string;
begin
  Result := N.LocalName;
  if Result = '' then
    Result := N.NodeName; // fallback no D7
end;

function _FindByLocalName(const Root: IXMLNode; const ATagName: string): IXMLNode;
var
  I: Integer;
  C, R: IXMLNode;
begin
  Result := nil;
  if Root = nil then Exit;

  if SameText(_LocalName(Root), ATagName) then
  begin
    Result := Root;
    Exit;
  end;

  for I := 0 to Root.ChildNodes.Count - 1 do
  begin
    C := Root.ChildNodes[I];
    R := _FindByLocalName(C, ATagName);
    if R <> nil then
    begin
      Result := R;
      Exit;
    end;
  end;
end;

function ExtractXmlNode(const AXml, ATagName: WideString): WideString;
var
  Doc: IXMLDocument;
  Node: IXMLNode;
begin
  Result := '';
  if (ATagName = '') or (AXml = '') then Exit;

  Doc := TXMLDocument.Create(nil);
  Doc.Options := Doc.Options + [doNodeAutoIndent];
  Doc.ParseOptions := Doc.ParseOptions + [poPreserveWhiteSpace];
  Doc.Active := False;
  Doc.LoadFromXML(AXml);
  Doc.Active := True;

  Node := _FindByLocalName(Doc.DocumentElement, ATagName);
  if Node <> nil then
    Result := Node.XML; // outer XML
end;

function ExtractXmlNodeFromFile(const AFileName, ATagName: string): WideString;
var
  Doc: IXMLDocument;
  Node: IXMLNode;
begin
  Result := '';
  if (ATagName = '') or (not FileExists(AFileName)) then Exit;

  Doc := TXMLDocument.Create(nil);
  Doc.Options := Doc.Options + [doNodeAutoIndent];
  Doc.ParseOptions := Doc.ParseOptions + [poPreserveWhiteSpace];
  Doc.LoadFromFile(AFileName);
  Doc.Active := True;

  Node := _FindByLocalName(Doc.DocumentElement, ATagName);
  if Node <> nil then
    Result := Node.XML;
end;

function MontarProcNFe(const ConteudoNFe, ConteudoProt: WideString): WideString;
begin
  Result :=
    '<?xml version="1.0" encoding="UTF-8"?>' + sLineBreak +
    '<nfeProc versao="4.00" xmlns="http://www.portalfiscal.inf.br/nfe">' + sLineBreak +
    ConteudoNFe + sLineBreak +
    ConteudoProt + sLineBreak +
    '</nfeProc>';
end;

procedure SaveStringAsUTF8(const AFileName: string; const S: WideString);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);
var
  FS: TFileStream;
  Utf8: UTF8String;
begin
  Utf8 := UTF8Encode(S); // WideString -> UTF-8 (Delphi 7)
  FS := TFileStream.Create(AFileName, fmCreate);
  try
    FS.WriteBuffer(UTF8BOM, SizeOf(UTF8BOM));          // BOM
    if Length(Utf8) > 0 then
      FS.WriteBuffer(Utf8[1], Length(Utf8));           // conteúdo
  finally
    FS.Free;
  end;
end;

function BuildProcNFeFromSource(const XmlFonte: WideString): WideString;
var
  NFeXML, ProtXML: WideString;
begin
  NFeXML  := ExtractXmlNode(XmlFonte, 'NFe');
  ProtXML := ExtractXmlNode(XmlFonte, 'protNFe');
  Result  := MontarProcNFe(NFeXML, ProtXML);
end;

function BuildProcNFeFromSource(const XmlFonte: WideString; const DestFile: string): Boolean;
var
  S: WideString;
begin
  S := BuildProcNFeFromSource(XmlFonte);
  Result := S <> '';
  if Result then
    SaveStringAsUTF8(DestFile, S);
end;

function BuildProcNFeFromFile(const SourceFile: string): WideString;
var
  Doc: IXMLDocument;
  Root: IXMLNode;
begin
  Result := '';
  if not FileExists(SourceFile) then Exit;

  Doc := TXMLDocument.Create(nil);
  Doc.Options := Doc.Options + [doNodeAutoIndent];
  Doc.ParseOptions := Doc.ParseOptions + [poPreserveWhiteSpace];
  Doc.LoadFromFile(SourceFile);
  Doc.Active := True;

  Root := Doc.DocumentElement;
  if Root = nil then Exit;

  Result := BuildProcNFeFromSource(Doc.XML.Text);
end;

function BuildProcNFeFromFile(const SourceFile, DestFile: string): Boolean;
var
  S: WideString;
begin
  S := BuildProcNFeFromFile(SourceFile);
  Result := S <> '';
  if Result then
    SaveStringAsUTF8(DestFile, S);
end;

{ ===== NOVOS: duas fontes/arquivos ===== }

function BuildProcNFeFromFiles(const NFeFile, ProtFile: string): WideString;
var
  NFeXML, ProtXML: WideString;
begin
  Result := '';
  if not FileExists(NFeFile) then Exit;
  if not FileExists(ProtFile) then Exit;

  NFeXML  := ExtractXmlNodeFromFile(NFeFile,  'NFe');
  ProtXML := ExtractXmlNodeFromFile(ProtFile, 'protNFe');

  // Se quiser exigir estritamente os dois:
  if (NFeXML = '') or (ProtXML = '') then Exit;

  Result := MontarProcNFe(NFeXML, ProtXML);
end;

function BuildProcNFeFromFiles(const NFeFile, ProtFile, DestFile: string): Boolean;
var
  S: WideString;
begin
  S := BuildProcNFeFromFiles(NFeFile, ProtFile);
  Result := S <> '';
  if Result then
    SaveStringAsUTF8(DestFile, S);
end;

end.

