unit NFePrintValidatorMSXML;

interface

uses
  System.SysUtils, Winapi.ActiveX, MSXML2_TLB; // MSXML 6 (msxml6)

type
  TNFeValidationResult = record
    IsPrintable: Boolean;      // True = pode imprimir DANFE “normal”
    IsAuthorized: Boolean;     // cStat 100 ou 150
    IsCanceled: Boolean;       // há evento 110111 autorizado (135/155)
    Chave: string;             // chNFe (ou extraída do @Id da infNFe)
    Motivo: string;            // xMotivo do protocolo, ou texto de erro
    cStat: string;             // código do protocolo (ex.: 100)
  end;

{  AXml   = conteúdo do XML (procNFe)
   AXsdDir= pasta com XSDs da NF-e (opcional). Se vazio, não valida XSD. }
function ValidateNFeXmlForPrinting_MSXML(const AXml: string; const AXsdDir: string = ''): TNFeValidationResult;

{ Versão que carrega de arquivo }
function ValidateNFeXmlForPrintingFromFile_MSXML(const AFileName: string; const AXsdDir: string = ''): TNFeValidationResult;

implementation

const
  NS_NFE = 'http://www.portalfiscal.inf.br/nfe';

function TextOfNode(const Node: IXMLDOMNode): string;
begin
  if Assigned(Node) and Assigned(Node.Text) then
    Result := Node.Text
  else
    Result := '';
end;

function AttrOfNode(const Node: IXMLDOMNode; const AttrName: string): string;
var A: IXMLDOMNode;
begin
  Result := '';
  if not Assigned(Node) then Exit;
  A := Node.Attributes.getNamedItem(AttrName);
  if Assigned(A) then
    Result := A.nodeValue;
end;

procedure LoadAllNFeSchemas(const Cache: IXMLDOMSchemaCollection2; const Dir: string);
  procedure TryAdd(const Ns, FileName: string);
  var Path: string;
  begin
    Path := IncludeTrailingPathDelimiter(Dir) + FileName;
    if FileExists(Path) then
      Cache.add(Ns, Path); // se já existir com mesmo ns, MSXML ignora/atualiza silenciosamente
  end;
begin
  // Núcleo NF-e 4.00 (ajuste conforme seu pacote de XSDs)
  TryAdd(NS_NFE, 'nfe_v4.00.xsd');
  TryAdd(NS_NFE, 'enviNFe_v4.00.xsd');
  TryAdd(NS_NFE, 'procNFe_v4.00.xsd');
  TryAdd(NS_NFE, 'retEnviNFe_v4.00.xsd');
  TryAdd(NS_NFE, 'consSitNFe_v4.00.xsd');
  TryAdd(NS_NFE, 'retConsSitNFe_v4.00.xsd');

  // Eventos (ainda usam o mesmo namespace NS_NFE)
  TryAdd(NS_NFE, 'eventoNFe_v1.00.xsd');
  TryAdd(NS_NFE, 'retEnvEvento_v1.00.xsd');
  TryAdd(NS_NFE, 'procEventoNFe_v1.00.xsd');

  // Dependências comuns (se existirem na sua pasta)
  TryAdd(NS_NFE, 'tiposBasico_v4.00.xsd');
  TryAdd(NS_NFE, 'tiposGeral_v1.00.xsd');
end;

function BuildDomWithOptionalXSD(const AXml: string; const AXsdDir: string; out Dom: IXMLDOMDocument3; out XsdError: string): Boolean;
var
  Cache: IXMLDOMSchemaCollection2;
  Err: IXMLDOMParseError;
begin
  XsdError := '';
  Dom := CoDOMDocument60.Create;
  Dom.async := False;
  Dom.validateOnParse := False;        // validação será feita depois via schemas
  Dom.resolveExternals := True;
  Dom.setProperty('SelectionLanguage', 'XPath'); // MSXML XPath

  if AXsdDir <> '' then
  begin
    Cache := CoXMLSchemaCache60.Create as IXMLDOMSchemaCollection2;
    LoadAllNFeSchemas(Cache, AXsdDir);
    Dom.schemas := Cache; // “anexa” as definições XSD ao DOM
  end;

  Result := Dom.loadXML(AXml);
  if not Result then
  begin
    Err := Dom.parseError;
    if Assigned(Err) then
      XsdError := Format('Falha ao carregar XML (%d): %s (linha %d, pos %d)',
                         [Err.errorCode, Err.reason, Err.line, Err.linepos])
    else
      XsdError := 'Falha ao carregar XML (erro desconhecido).';
    Exit;
  end;

  // Validação XSD (se houver schemas)
  if Assigned(Dom.schemas) then
  begin
    Err := Dom.validate;
    if (Assigned(Err)) and (Err.errorCode <> 0) then
    begin
      XsdError := Format('Falha de validação XSD (%d): %s (linha %d, pos %d)',
                         [Err.errorCode, Err.reason, Err.line, Err.linepos]);
      Result := False;
      Exit;
    end;
  end;
end;

function ExtractChaveViaXPath(const Dom: IXMLDOMDocument3): string;
var
  N: IXMLDOMNode;
  Id: string;
begin
  Result := '';

  // Tenta pelo chNFe do protocolo
  N := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]/*[local-name()="chNFe"]');
  if Assigned(N) then
  begin
    Result := TextOfNode(N).Trim;
    if Result <> '' then Exit;
  end;

  // Fallback: extrair do @Id da infNFe
  N := Dom.selectSingleNode('//*[local-name()="infNFe"]');
  if Assigned(N) then
  begin
    Id := AttrOfNode(N, 'Id');
    if (Id.StartsWith('NFe')) and (Length(Id) >= 47) then
      Result := Copy(Id, 4, 44);
  end;
end;

function ValidateNFeXmlForPrinting_MSXML(const AXml: string; const AXsdDir: string): TNFeValidationResult;
var
  Dom: IXMLDOMDocument3;
  XsdErr: string;
  N, NProt, NInfProt: IXMLDOMNode;
  cStat, xMotivo, chNFe: string;
  CancelEvt: IXMLDOMNode;
begin
  Result := Default(TNFeValidationResult);

  CoInitialize(nil);
  try
    if not BuildDomWithOptionalXSD(AXml, AXsdDir, Dom, XsdErr) then
    begin
      Result.Motivo := XsdErr;
      Exit;
    end;

    // Tem protocolo?
    NProt := Dom.selectSingleNode('//*[local-name()="protNFe"]');
    if not Assigned(NProt) then
    begin
      Result.Motivo := 'XML sem protocolo (use o *-procNFe.xml retornado pela SEFAZ).';
      Exit;
    end;

    // infProt, cStat e xMotivo
    NInfProt := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]');
    if not Assigned(NInfProt) then
    begin
      Result.Motivo := 'Bloco infProt não encontrado no protocolo.';
      Exit;
    end;

    N := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]/*[local-name()="cStat"]');
    cStat := TextOfNode(N).Trim;

    N := Dom.selectSingleNode('//*[local-name()="protNFe"]/*[local-name()="infProt"]/*[local-name()="xMotivo"]');
    xMotivo := TextOfNode(N).Trim;

    chNFe := ExtractChaveViaXPath(Dom);

    Result.cStat := cStat;
    Result.Motivo := xMotivo;
    Result.Chave := chNFe;

    // Autorizada?
    Result.IsAuthorized := (cStat = '100') or (cStat = '150');
    if not Result.IsAuthorized then
    begin
      if Result.Motivo = '' then
        Result.Motivo := 'NF-e não autorizada (cStat=' + cStat + ').';
      Result.IsPrintable := False;
      Exit;
    end;

    // Cancelamento autorizado?
    CancelEvt :=
      Dom.selectSingleNode(
        '//*[local-name()="procEventoNFe" or local-name()="retEvento"]' +
        '//*[local-name()="infEvento" and ./*[local-name()="tpEvento" and normalize-space(text())="110111"] and ' +
        ' ( ./*[local-name()="cStat" and (normalize-space(text())="135" or normalize-space(text())="155")] ) ]'
      );

    Result.IsCanceled := Assigned(CancelEvt);
    Result.IsPrintable := Result.IsAuthorized and (not Result.IsCanceled);

    if Result.IsCanceled then
      Result.Motivo := 'NF-e cancelada — imprimir DANFE de cancelamento (evento 110111 autorizado).';
  finally
    CoUninitialize;
  end;
end;

function ValidateNFeXmlForPrintingFromFile_MSXML(const AFileName: string; const AXsdDir: string): TNFeValidationResult;
var
  Xml: string;
begin
  if not FileExists(AFileName) then
  begin
    Result := Default(TNFeValidationResult);
    Result.Motivo := 'Arquivo não encontrado: ' + AFileName;
    Exit;
  end;
  Xml := TFile.ReadAllText(AFileName, TEncoding.UTF8);
  Result := ValidateNFeXmlForPrinting_MSXML(Xml, AXsdDir);
end;

end.

