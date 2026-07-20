{********************************************************}
{                                                        }
{                                                        }
{         Interface com a Biblioteca CliSeTefI           }
{                         SITEF                          }
{                                                        }
{                   Ver 1.0 18/02/2005                   }
{********************************************************}

unit bbtefdedicado;

interface

uses {$IFNDEF LINUX}Windows,{$ENDIF} Classes;

{$B-}
{$R-}
{$V-}
{$T-}
{$X+}
{$P+}
{$J+}
{$H+}

{***************** Definicao de Constantes da API ****************}

const
{$IFNDEF LINUX}
  LIB_NAME = 'CliSiTef32I.dll';
  INI_PATH = 'c:\windows\system\';
{$ELSE}
  LIB_NAME = 'libclisitef.so';
  INI_PATH = '/usr/lib/';
{$ENDIF}

{**************** funçoes externas da API ******************}

  function ConfiguraIntSiTefInterativo(EndTef, IdLoja, IdTerminal: PChar; Reservado: Smallint): Integer; stdcall; external LIB_NAME;
  function IniciaFuncaoSiTefInterativo(Funcao: Integer; Valor, CuponFiscal, DataFiscal, Horario, Operador, ParamAdic: PChar): Integer; stdcall; external LIB_NAME;
  procedure FinalizaTransacaoSiTefInterativo(Confirma: Smallint; NumeroCuponFiscal, DataFiscal,  Horario: PChar); stdcall; external LIB_NAME;
  function LeCartaoDireto(Mensagem, Trilha1, Trilha2: PChar): Integer; stdcall; external LIB_NAME;
  procedure InterrompeLeCartaoDireto; stdcall; external LIB_NAME;
  function ContinuaFuncaoSiTefInterativo(Comando, TipoCampo: PInteger; TamMinimo, TamMaximo: PSmallint;
                                         Buffer: PChar; TamBuffer, Continua: Integer): Integer; stdcall; external LIB_NAME;
//  CorrespondenteBancarioTefInterativo (CuponFiscal, DataFiscal, Horario, Operador, ParamAdic): Integer; stdcall; external LIB_NAME;
  function VerificaPresencaPinPad: Integer; stdcall; external LIB_NAME;
  function EscreveMensagemPermanentePinPad(Mensagem: PChar): Integer; stdcall; external LIB_NAME;
  function ValidaCampoCodigoEmBarras (Dados: PChar; Tipo: PSmallint): Integer; stdcall; external LIB_NAME;
  function LeSimNaoPinPad (Mensagem: PChar): Integer; stdcall; external LIB_NAME;

const
  Lib: string = LIB_NAME;
  hLib: THandle = 0;
  LibLoaded: Boolean = False;
  LibNotFound = 'A biblioteca %s nÒo foi encontrada';

implementation

uses SysUtils;

{***************** Constantes da biblioteca  ****************}

const
  COM1  = '/dev/ttyS0';
  COM2  = '/dev/ttyS1';
  COM3  = '/dev/ttyS2';
  COM4  = '/dev/ttyS3';
  COM5  = '/dev/ttyS4';
  COM6  = '/dev/ttyS5';
  COM7  = '/dev/ttyS6';
  COM8  = '/dev/ttyS7';
  COM9  = '/dev/ttyS8';
  COM10 = '/dev/ttyS9';
  COM11 = '/dev/ttyS10';
  COM12 = '/dev/ttyS11';
  COM13 = '/dev/ttyS12';
  COM14 = '/dev/ttyS13';
  COM15 = '/dev/ttyS14';
  STX  = #2;
  ETX  = #3;
  ACK  = $06;
  NAK  = $15;
  STATUS = 3;
(*
function TefLoadLib: Boolean;
begin
  Result := False;
  {Carrega biblioteca}
  if hLib = 0 then begin
    hLib := GetModuleHandle(PChar(Lib));
    LibLoaded := False;
    if hLib = 0 then begin
      hLib := LoadLibrary(PChar(Lib));
      LibLoaded := True;
    end;
  end;
  {Carrega funcoes contidas na biblioteca}
  if hLib <> 0 then begin
    @Tef_ConfiguraIntTefInterativo := GetProcAddress(hLib, 'ConfiguraIntSiTefInterativo');
    @Tef_IniciaFuncaoTefInterativo := GetProcAddress(hLib, 'IniciaFuncaoSiTefInterativo');
  end else
    raise Exception.Create(Format(LibNotFound,[Lib]));
end;
  *)
initialization

finalization
  if (hLib <> 0) and LibLoaded then
//    FreeLibrary(hLib);

end.

