unit climpressorachequebematech;

interface

Uses
  //Biblio
  climpressorachequepadrao;

type
  
  TtecImpChequeBematech = class(TtecImpressoraChequePadrao)
  protected
    function FormatarInformacao: String; override;
  end;

implementation

Uses
  //CLX
  SysUtils,
  //Biblio
  biblio;

{ TtecImpChequeBematech }

function TtecImpChequeBematech.FormatarInformacao: String;
const
  ESC = #27;
  NL  = #13;
  LinhaImpressao = ESC+#$B1+ESC+#$A0+'%s'+NL+ESC+#$A1+'%s'+NL+ESC+#$A2+'%s' +
        NL+ESC+#$A3+'%s'+NL+ESC+#$A4+'%s'+NL+ESC+#$B0+NL;
var
  strValor,
  strData: String;
begin
  strValor := FormatarValor(StrToFloat(Valor), 2);
  strData  := Data;
  Delete(strData, 7, 2);
  Result := Format(LinhaImpressao, [Favorecido, NomeCidade, CodigoBanco, strValor, strData]);
end;

end.
 