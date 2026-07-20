unit climpressorachequepadrao;

interface

Uses
  //CLX
  Classes, SysUtils;

type

  TtecPortaImpressao = (pisSERIAL,pisPARALELA);

  TtecImpressoraChequePadrao = class(TPersistent)
  private
    FData: String;
    FCodigoBanco: String;
    FFavorecido: String;
    FValor: String;
    FNomeCidade: String;
    FNumeroPorta: Integer;
    FPortaImpressao: TtecPortaImpressao;
  protected
    function FormatarInformacao: String; virtual; abstract;
  public
    constructor Create; virtual;
    procedure Imprimir;
    property CodigoBanco: String read FCodigoBanco write FCodigoBanco;
    property Data: String read FData write FData;
    property Favorecido: String read FFavorecido write FFavorecido;
    property NomeCidade: String read FNomeCidade write FNomeCidade;
    property NumeroPorta: Integer read FNumeroPorta write FNumeroPorta;
    property PortaImpressao: TtecPortaImpressao read FPortaImpressao write FPortaImpressao;
    property Valor: String read FValor write FValor;
  end;

  TtecImpressoraChequePadraoClass = Class of TtecImpressoraChequePadrao;

var
  ImpChequePadrao: TtecImpressoraChequePadrao;

implementation

Uses
  {$IFDEF LINUX} Libc, {$ENDIF}
  //Biblio
  clserial, cltextprinter;

{ TtecImpressoraChequePadrao }

constructor TtecImpressoraChequePadrao.Create;
begin
  Inherited;
end;

procedure TtecImpressoraChequePadrao.Imprimir;
var
  Buffer: String;
  Serial: TtecSerial;
{$IFDEF MSWINDOWS}
  Lst: TextFile;
{$ENDIF}
begin
  Buffer := FormatarInformacao;
  if PortaImpressao = pisSERIAL then begin
    Serial := TtecSerial.Create;
    try
      Serial.OpenPort(PChar('COM' + IntToStr(NumeroPorta)));
      Serial.WritePort(Buffer)
    finally
      Serial.ClosePort;
      Serial.Free
    end
  end else begin
{$IFDEF LINUX}
    NomeImpressoraEscolhida := '';
    TextPrinter.BeginDoc('', False);
    TextPrinter.WriteText(Buffer, 0);
    TextPrinter.EndDoc('');
{$ELSE}
    AssignFile(Lst, 'LPT'+IntToStr(FNumeroPorta));
    Rewrite(Lst);
    Write(Lst, Buffer);
    CloseFile(Lst);
{$ENDIF}
  end
end;

end.
