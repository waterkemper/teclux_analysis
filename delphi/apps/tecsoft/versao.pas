unit versao;

interface

var
  VersaoBanco: String;

function GetVersao: String;

implementation

function GetVersao: String;
begin
 Result := 'BETA'
end;

end.
