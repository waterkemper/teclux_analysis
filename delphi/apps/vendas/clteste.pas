unit clteste;

interface

Uses
  //CLX
  Classes;

Type
  TTecTEste = class
  private
    function Formatar_ValorNFe(Formato: String; Valor: Extended): String;
  public
    function Cancelar_Nfe(NFe, Protocolo, Justificativa, Ambiente: String;
                         var ProtocoloCanc: String): Boolean;
  end;

{$IFDEF MSWINDOWS}
function BlockInput (fBlockIt: Boolean): Boolean; stdcall; external 'user32.dll';
{$ENDIF }


implementation

Uses
  //CLX
  {$IFDEF MSWINDOWS} Windows, {$ENDIF} SysUtils;

{ TTecTeste }

function TTecTeste.Formatar_ValorNFe(Formato: String;
  Valor: Extended): String;
begin
//  BlockInput(false);
//  Result := trocar(FormatFloat(Formato, Valor),',','.')
end;

function TTecTeste.Cancelar_Nfe(NFe, Protocolo, Justificativa, Ambiente: String;
                                              var ProtocoloCanc: String): Boolean;
var
  Linha,
  MsgErro,
  ArqEnvio,
  ArqRetorno,
  ArqErro,
  Status,
  Motivo: String;
  ArqResp: TextFile;

begin
 linha := '';
{$IFDEF MSWINDOWS}
  BlockInput(false);
{$ENDIF }

end;

end.
