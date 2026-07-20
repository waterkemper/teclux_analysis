unit dmgerargiaemarquivo;

interface

uses
  //CLX
  SysUtils, Classes, DB,
  //Repositorio
  dmbasico, dmtecsoft,
  //Componentes
  cpdatasource, cpquery,
  //Terceiros
  ZQuery, ZPgSqlQuery;                    

type
  TdtmGerarGIAEmArquivo = class(TdtmBasico)
    qryFiliais: TtecQuery;
    dsrFiliais: TtecDataSource;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryQuadrosGIA: TtecQuery;
    qryQuadrosGIAfilial: TIntegerField;
    qryQuadrosGIAperiodo: TStringField;
    qryQuadrosGIAfaturamento: TFloatField;
    qryQuadrosGIAqtdadeempregados: TIntegerField;
    qryQuadrosGIAacrescimofinanceiro: TFloatField;
    qryQuadrosGIAdespesamensalpessoal: TFloatField;
    qryQuadrosGIAdebdiferencialaliquota: TFloatField;
    qryQuadrosGIAdebtransferencia: TFloatField;
    qryQuadrosGIAdebestornocredito: TFloatField;
    qryQuadrosGIAdebestornoativoimobilizado: TFloatField;
    qryQuadrosGIAdebapuracaoconsolidada: TFloatField;
    qryQuadrosGIAoutrosdebitos: TFloatField;
    qryQuadrosGIAcreddifaliquotaativoimobil: TFloatField;
    qryQuadrosGIAcreddifaliquotamaterialconsumo: TFloatField;
    qryQuadrosGIAcredtransferencia: TFloatField;
    qryQuadrosGIAcredpresumidos: TFloatField;
    qryQuadrosGIAcredincetivosfiscais: TFloatField;
    qryQuadrosGIAcredpagtoocasiaofatogerador: TFloatField;
    qryQuadrosGIAcredapuracaoconsolidada: TFloatField;
    qryQuadrosGIAoutroscreditos: TFloatField;
    qryQuadrosGIAsubstbasecalculo: TFloatField;
    qryQuadrosGIAsubstimpostoretido: TFloatField;
    qryQuadrosGIAsubstcreditos: TFloatField;
    qryQuadrosGIAsubstressarcimentoicms: TFloatField;
    qryQuadrosGIAimpostorecolher: TFloatField;
    qryQuadrosGIAtotaldebitos: TFloatField;
    qryQuadrosGIAtotalcreditos: TFloatField;
    qryQuadrosGIAsubtotaldebitos: TFloatField;
    qryQuadrosGIAsubtotalcreditos: TFloatField;
    qryQuadrosGIAsaldocredoparaperiodoseguinte: TFloatField;
    qryQuadrosGIAsubstsaldocredorperiodosequinte: TFloatField;
    qryQuadrosGIAdebitopelassaidas: TFloatField;
    qryQuadrosGIAsubstsubsaldocredor: TFloatField;
    qryQuadrosGIAsubstsubsaldodebitos: TFloatField;
    qryQuadrosGIAsubstimpostorecolher: TFloatField;
    qryQuadrosGIAsubsttotaldebitos: TFloatField;
    qryQuadrosGIAsubsttotalcreditos: TFloatField;
    qryFiliaisrazao: TStringField;
    qryFiliaisinscricaoestadual: TStringField;
    qryFiliaisfoneddd: TIntegerField;
    qryFiliaisfonenumero: TIntegerField;
    qryFiliaisporte: TStringField;
    qryFiliaissimples: TStringField;
    qryFiliaisregime: TIntegerField;
  public
    constructor Create(AOwner: TComponent); override;
    procedure GerarArquivo(NomeArquivo, Data: String);
  end;

var
  dtmGerarGIAEmArquivo: TdtmGerarGIAEmArquivo;

implementation

Uses
  //CLX
  Forms,
  //Biblio
  ctconstantes, biblio, clparametrossistema;

type

  TResponsavel = class
  private
    FNome: String;
    FTelefone: Integer;
    FDDD: Integer;
    FEMail: String;
    FCRC: String;
  public
    constructor Create;
    property CRC: String read FCRC write FCRC;
    property DDD: Integer read FDDD write FDDD;
    property EMail: String read FEMail write FEMail;
    property Nome: String read FNome write FNome;
    property Telefone: Integer read FTelefone write FTelefone;
  end;

{$R *.dfm}

{ TdtmGerarGIAEmArquivo }

constructor TdtmGerarGIAEmArquivo.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Tag := ctLIVTabelaConsultaFiliais;
end;

procedure TdtmGerarGIAEmArquivo.GerarArquivo(NomeArquivo, Data: String);
type
  TLado = (Esquerdo, Direito);
const
  Periodo = '11';
var
  PosBarra: Integer;
  Cabecalho,
  Str: WideString;
  Porte,
  Simples: String;
  Arq: TextFile;
  Buffer: Array[0..10000] of byte;

  function CompletaString(Valor: String; TamMax: Integer; Padrao: Char; Lado: TLado = Direito): String;
  var
    a: Integer;
  begin
    Result := Valor;
    if Lado = Esquerdo then
      for a := 0 to TamMax - Length(Valor) do
        Result := Padrao + Result
    else
      for a := 0 to TamMax - Length(Valor) do
        Result := Result + Padrao
  end;

  function RetiraSimbolos(Valor: String): String;
  var
    PosSimb: Integer;
  begin
    Result := Valor;
    PosSimb := Pos(',', Result);
    if PosSimb > 0 then
      Delete(Result, PosSimb, 1);
  end;

  procedure Converte(Str: WideString);
  begin
    Move(Str, Buffer, Length(Str));
  end;

begin
{$IFDEF LINUX}
  PosBarra := Pos('\', NomeArquivo);
{$ELSE }
  PosBarra := Pos('/', NomeArquivo);
{$ENDIF }
  if PosBarra = 0 then
    NomeArquivo := ExtractFilePath(Application.ExeName) + NomeArquivo;
  try
    AssignFile(Arq, NomeArquivo);
    if FileExists(NomeArquivo) then
{$IFDEF LINUX}
      Rewrite(Arq)
//      Arq := FileOpen(NomeArquivo, fmOpenReadWrite)
    else
      Rewrite(Arq);
//      Arq := FileCreate(NomeArquivo);
{$ELSE }
//      Arq :=
//      Arq :=
{$ENDIF }
    if qryFiliaisporte.AsString = ctPORTEFILIALMICROEMPRESA then
      Porte := qryFiliaisporte.AsString + 'E'
    else if qryFiliaisporte.AsString = ctPORTEFILIALPEQUENAEMPRESA then
      Porte := qryFiliaisporte.AsString + 'P'
    else if qryFiliaisporte.AsString = ctPORTEFILIALOUTRA then
      Porte := qryFiliaisporte.AsString + 'U';
    if qryFiliaissimples.AsString = ctSIMPLESUNICO then
      Simples := '1'
    else if qryFiliaissimples.AsString = ctSIMPLESCENTRALIZADO then
      Simples := '2'
    else if qryFiliaissimples.AsString = ctSIMPLESCENTRALIZADOR then
      Simples := '3'
    else if qryFiliaissimples.AsString = ctSIMPLESNAOOPTANTE then
      Simples := '0';
    // Registro tipo 20
    Cabecalho := ParSistema.CRCContador + CompletaString(ParSistema.CRCContador, 11, ' ', Direito) +
                 CompletaString(qryFiliaisinscricaoestadual.AsString, 9, '0', Esquerdo) +
                 Copy(Data, 4, 4) + Copy(Data, 1, 2) + Periodo;
    Str := ParSistema.CRCContador + CompletaString(ParSistema.CRCContador, 18, ' ') + '20' +
           CompletaString(ParSistema.NomeContador, 46, ' ') +
           CompletaString(IntToStr(ParSistema.DDDContador), 4, '0') +
           CompletaString(IntToStr(ParSistema.TelefoneContador), 8, '0') +
           CompletaString(ParSistema.EmailContador, 50, ' ') + #10#13;
//    Converte(Str);
    Writeln(Arq, Str);
//    FileWrite(Arq, Buffer, Length(Buffer));
{
    // Registro tipo 30
    Buffer := Cabecalho + '301' +
              CompletaString(qryQuadrosGIAqtdadeempregados.AsString, 5, '0') + qryQuadrosGIAqtdadeempregados.AsString +
              CompletaString(qryFiliaisfoneddd.AsString, 4, '0') + qryFiliaisfoneddd.AsString +
              CompletaString(qryFiliaisfonenumero.AsString, 8, '0') + qryFiliaisfonenumero.AsString +
              CompletaString(RetiraSimbolos(qryQuadrosGIAfaturamento.AsString), 17, '0') + RetiraSimbolos(qryQuadrosGIAfaturamento.AsString) +
              CompletaString(RetiraSimbolos(qryQuadrosGIAacrescimofinanceiro.AsString), 17, '0') + RetiraSimbolos(qryQuadrosGIAacrescimofinanceiro.AsString) +
              CompletaString(RetiraSimbolos(qryQuadrosGIAdespesamensalpessoal.AsString), 17, '0') + RetiraSimbolos(qryQuadrosGIAdespesamensalpessoal.AsString) +
              qryFiliaisrazao.AsString + CompletaString(qryFiliaisrazao.AsString, 46, ' ') +
              Porte +
              Simples +
              qryFiliaisregime.AsString + #10#13;
    FileWrite(Arq, Buffer, Length(Buffer));
    Buffer := Cabecalho + '31';
    FileClose(Arq);            }
  except
    on E:EFCreateError do
      MensagemErro(E.Message);
  end;
end;

{ Responsavel }

constructor TResponsavel.Create;
begin
  inherited;
  FCRC := ParSistema.CRCContador;
  FDDD := ParSistema.DDDContador;
  FEMail := ParSistema.EmailContador;
  FNome := ParSistema.NomeContador;
  FTelefone := ParSistema.TelefoneContador;
end;

end.
