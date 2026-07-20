unit clhistorico;

interface

const MaxDescricao  = 12;
      MaxParametros =  5;
      MaxTipo       =  4;
type
  TParametrosHistorico = class(TObject)
    Completa: string;
    Parametros: array[1..MaxParametros] of record
      Descricao: string[MaxDescricao];
      Tipo     : string[MaxTipo];
    end;
    NParametros: Byte;
  private
    function  ProcuraTexto(Texto: string; PosEspaco: Byte): string;
  public
    constructor Create(Descricao: string);
    function  ParametroDescricao(Nro: byte): string;
    function  ParametroTipo(Nro: byte): string;
    property NroParametros: Byte   read NParametros;
    property Descricao    : string read Completa;
  end;

implementation

function TParametrosHistorico.ProcuraTexto(Texto: String; PosEspaco: Byte): String;
var NP: Byte;
begin
  Dec(PosEspaco);
  while (PosEspaco > 0) and (Texto[PosEspaco] = ' ') do
    Dec(PosEspaco);
  Texto := Copy(Texto,1,PosEspaco);
  if Length(Texto) < MaxDescricao then
    NP := 0
  else
    NP:= Length(Texto)-MaxDescricao;
  while (NP <> 0) and (Texto[NP] <> ' ') do
    Dec(NP);
  Texto := Copy(Texto,NP+1,255);
  if Length(Texto) <= MaxDescricao then
    ProcuraTexto := Texto
  else
    ProcuraTexto := Copy(Texto,Pos(' ',Texto)+1,255);
end;

function TParametrosHistorico.ParametroDescricao(Nro: byte): String;
begin
  if Nro <= NParametros then
    Result := Parametros[Nro].Descricao
  else
    Result := '';
end;

function TParametrosHistorico.ParametroTipo(Nro: byte): String;
begin
  if Nro <= NParametros then
    Result := Parametros[Nro].Tipo
  else
    Result := '';
end;

constructor TParametrosHistorico.Create(Descricao: string);
var Posicao: Word;
begin
  inherited Create;
  Completa    := Descricao;
  NParametros := 0;
  FillChar(Parametros,SizeOf(Parametros),0);
  Posicao := Pos('*',Descricao);
  while (NParametros < MaxParametros) and (Posicao <> 0) do begin
    Inc(NParametros);
    Parametros[NParametros].Descricao := ProcuraTexto(Descricao,Posicao);
    Descricao := Copy(Descricao,Posicao,255);
    Posicao := Pos(' ',Descricao);
    if Posicao = 0 then
      Posicao := 256;
    Parametros[NParametros].Tipo := Copy(Descricao,1,Posicao-1);
    Descricao := Copy(Descricao,Posicao+1,255);
    Posicao := Pos('*',Descricao);
  end;
end;

end.


