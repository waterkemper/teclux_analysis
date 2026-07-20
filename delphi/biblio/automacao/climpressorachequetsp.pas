unit climpressorachequetsp;

interface

Uses
  //Biblio
  climpressorachequepadrao;

type

  TtecImpChequeTSP = class(TtecImpressoraChequePadrao)
  protected
    function FormatarInformacao: String; override;
  public
    constructor Create; override;
    class procedure LerArquivoINI;
  end;

implementation

Uses
  //CLX
  Classes, SysUtils, inifiles, Forms,
  //Biblio
  biblio;

{ TtecImpChequeBematech }

Const

  NomeArquivoINI = 'tspslip80.ini';
  NomeSection    = 'bancos';

var
  Bancos: array of record
                     CodigoBanco: Integer;
                     Padrao: String;
                   end;

constructor TtecImpChequeTSP.Create;
begin
  inherited;
  LerArquivoINI;
end;

function TtecImpChequeTSP.FormatarInformacao: String;
const
  ESC = #27;
  LinhaImpressao = #20+ESC+'mREAL$REAIS$'+ESC+'B%s'+ESC+'N%s$'+ESC+'C%s$'+ESC+'D%s'+ESC+'v%s$';
var
  strValor,
  strData: String;
  PosPt: Integer;

  function ProcuraBanco: String;
  var
    a: Integer;
  begin
    for a := 0 to High(Bancos) do
      if CodigoBanco = IntToStr(Bancos[a].CodigoBanco) then begin
        Result := Bancos[a].Padrao;
        break
      end;
    if a > High(Bancos) then
      Result := '5'
  end;

begin
  strValor := FormatarValor(StrToFloat(Valor), 2);
  Delete(strValor, Pos(',', strValor), 1);
  PosPt := Pos('.', strValor);
  while PosPt <> 0 do begin
    Delete(strValor, Pospt, 1);
    PosPt := Pos('.', strValor);
  end;
  strData  := Data;
  Delete(strData, 3, 1);
  Delete(strData, 5, 3);
  Result := Format(LinhaImpressao, [ProcuraBanco, Favorecido, NomeCidade, strData, strValor]);
end;

class procedure TtecImpChequeTSP.LerArquivoINI;
var
  ArquivoINI: TIniFile;
  lstBancos: TStringList;
  PosIgual, a: Integer;
  Dir: String;
begin
  Dir := ExtractFilePath(Application.ExeName);
  if FileExists(Dir+NomeArquivoINI) then begin
    ArquivoINI := TIniFile.Create(Dir+NomeArquivoINI);
{$IFDEF LINUX}
    ArquivoINI.CaseSensitive := False;
{$ENDIF}
    if ArquivoINI.SectionExists(NomeSection) then begin
      lstBancos := TStringList.Create;
      ArquivoINI.ReadSectionValues(NomeSection, lstBancos);
      SetLength(Bancos, lstBancos.Count);
      for a := 0 to lstBancos.Count - 1 do begin
        PosIgual := Pos('=', lstBancos[a]);
        if PosIgual > 0 then begin
          Bancos[a].CodigoBanco := StrToInt(Copy(lstBancos[a], 1, PosIgual - 1));
          Bancos[a].Padrao      := Copy(lstBancos[a], PosIgual + 1, Length(lstBancos[a]) - PosIgual);
        end
      end
    end else
      MensagemAviso('O Arquivo de configuração ('+NomeArquivoINI+') da impressora de cheque "TSP SLIP 80" esta com erro.')
  end else
    MensagemAviso('O Arquivo de configuração ('+NomeArquivoINI+') da impressora de cheque "TSP SLIP 80" não foi encontrado.')
end;

end.
