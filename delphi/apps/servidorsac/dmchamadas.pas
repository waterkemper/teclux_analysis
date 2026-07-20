unit dmchamadas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  // Terceiros
   ZQuery, ZPgSqlQuery,
  // Repositorio
   dmbasico,
  // Constantes
   ctconstantes,
  // Componentes
   cpdatasource,  cpquery;

type
  TdtmChamadas = class(TdtmBasico)
    qryChamadas: TtecQuery;
    qryAtualizarChamadas: TtecQuery;
    qryDerrubarChamada: TtecQuery;
    qryDerrubarChamadaidcall: TIntegerField;
    qryDerrubarChamadastatus: TStringField;
    qryChamadasnumero: TIntegerField;
    qryChamadasoperador: TStringField;
    qryChamadasfiltrosac: TIntegerField;
    qryChamadasfone: TLargeintField;
    qryChamadascomando: TStringField;
    qryChamadasstatus: TStringField;
    qryChamadaschamada: TIntegerField;
  private
  public
    procedure InicializaChamadas;
    procedure AtualizarStatus(Chamada: Cardinal;Call: Word;Status: Char);
    function LerPrimeiraChamada(var Numero,Chamada: Cardinal;
                                var Status: Char;
                                var Operador,Fone: String): Char;
    function BuscaChamada(Chamada: Cardinal): Word;
  end;

var
  dtmChamadas: TdtmChamadas;

implementation

uses dmtecsoft;

{$R *.dfm}

{ TdtmChamadas }


procedure TdtmChamadas.InicializaChamadas;
begin
   qryChamadas.Open;
end;

procedure TdtmChamadas.AtualizarStatus(Chamada: Cardinal;Call: Word;Status: Char);
begin
    qryAtualizarChamadas.Sql.Clear;
    qryAtualizarChamadas.Sql.Add('UPDATE chamadas SET status = ''' + Status +'''');
    If Call <> 0 Then
       qryAtualizarChamadas.Sql.Add(' ,idcall = '+IntToStr(Call));
    qryAtualizarChamadas.Sql.Add(' WHERE numero = ' + InttoStr(Chamada));
    qryAtualizarChamadas.ExecSql;
    dtmTecSoft.tstTecSoft.Commit;
end;

function TdtmChamadas.LerPrimeiraChamada(var Numero,Chamada: Cardinal;
                                         var Status: Char;
                                         var Operador,Fone: String): Char;
begin
  If qryChamadas.active then begin
     qryChamadas.Refresh;
     If qryChamadas.Active Then
       qryChamadas.First;
     If not qryChamadas.EOF and (qryChamadasstatus.AsString = 'Z') then begin
        Numero  := qryChamadasnumero.Asinteger;
        Chamada := qryChamadaschamada.Asinteger;
        Status := qryChamadasstatus.AsString[1];
        Operador:= qryChamadasoperador.AsString;
        Fone:= qryChamadasfone.AsString;
        If Length(Fone) > 8 Then
           Fone := '0' + Fone;

        Result := qryChamadascomando.asString[1];
     end
     Else Result := #0;
  end
  Else Result := #0;
end;


function TdtmChamadas.BuscaChamada(Chamada: Cardinal): Word;
begin
  qryDerrubarChamada.Params[0].Value := InttoStr(Chamada);
  qryDerrubarChamada.Open;
  qryDerrubarChamada.First;
  if (qryDerrubarChamadastatus.AsString = 'A') or
     (qryDerrubarChamadastatus.AsString = 'D') or
     (qryDerrubarChamadastatus.AsString = 'T') then
     Result := qryDerrubarChamadaidcall.AsInteger
  Else
     Result := 0;
  qryDerrubarChamada.Close;
end;

begin
end.
