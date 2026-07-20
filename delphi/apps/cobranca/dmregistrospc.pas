unit dmregistrospc;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  // Terceiros
  ZQuery, ZPgSqlQuery,
  // Componentes
  cpquery,
  // Biblio
  biblio,
  // Repositorio
  dmbasico,
  // Constantes
  ctconstantes;

type
  TdtmRegistroSPC = class(TdtmBasico)
    qryConfirmadosSPC: TtecQuery;
    qryConfirmadosSPCcliente: TIntegerField;
    qryConfirmadosSPCdata: TDateField;
    qryConfirmadosSPCtipocarta: TIntegerField;
    qryConfirmadosSPCcontrato: TStringField;
    qryConfirmadosSPCobsoleta: TBooleanField;
    qryConfirmadosSPCvoltou: TDateField;
    qryConfirmadosSPCconfirmacao: TDateField;
    qryFiltraConfirmados: TtecQuery;
    qryDadosAvisoSPC: TtecQuery;
    qryDadosAvisoSPCfilial: TIntegerField;
    qryDadosAvisoSPCgrupofilial: TIntegerField;
    qryFiltraConfirmadosatende: TIntegerField;
    qryCancelaSPC: TtecQuery;
    qryRegistraSPC: TtecQuery;
    qryCanceladosSPC: TtecQuery;
    qryCanceladosSPCnumero: TIntegerField;
    qryParcelasAtrasadas: TtecQuery;
    qryParcelasAtrasadasdatavencto: TDateField;
    qryParcelasAtrasadasvalorvencto: TFloatField;
    spcSpcProximo: TtecQuery;
    spcSpcProximonumero: TIntegerField;
    qryConfirmadosSPCavalista: TIntegerField;
  protected
    FDataVencto: TDateTime;
    FDivida: Currency;
    FNumeroSPC: Integer;
  public
    procedure InserirRegistro;
    procedure CancelarRegistro;
    procedure ProximoNumeroSPC;
    procedure CalcularDivida;
    property NumeroSPC: Integer read FNumeroSPC;
    property DataVencto: TDateTime read FDataVencto;
    property Divida: Currency read FDivida;
  end;

var
  dtmRegistroSPC: TdtmRegistroSPC;

const
   FiltroFilial = '( c.filialvenda = %s )';
   FiltroGrupo = '( c.filialvenda IN (SELECT filial FROM filiaisgruposfiliais WHERE grupo = %s ) ) ';

implementation

uses
  //biblio
  clparametrossistema,
  //repositorio
  dmtecsoft;

{$R *.dfm}

procedure TdtmRegistroSPC.CancelarRegistro;
begin
// Obtem registros no SPC com direito ao cancelamento
//  RefazConsulta(qryCanceladosSPC,[0],[ParSistema.DiasAtraso]);
// Efetua cancelamento registro a registro
  qryCanceladosSPC.First;
  while not qryCanceladosSPC.Eof do
  begin
    RefazConsulta(qryCancelaSPC,[0],[qryCanceladosSPCnumero.AsString]);
    qryCanceladosSPC.Next;
  end;
end;

procedure TdtmRegistroSPC.InserirRegistro;
begin
// Verifica os avisos de SPC foram gerados para uma filial ou grupo de filiais
  RefazConsulta(qryDadosAvisoSPC,[],[]);
// Monta filtro de selecao de contratos
  if qryDadosAvisoSPC.FieldByName('filial').IsNull then
    qryFiltraConfirmados.Sql[17] := Format(FiltroGrupo, [qryDadosAvisoSPCgrupofilial.AsString])
  else
    qryFiltraConfirmados.Sql[17] :=  Format(FiltroFilial, [qryDadosAvisoSPCfilial.AsString]);
// Obtem as cartas de avisos de spc confirmadas
  RefazConsulta(qryConfirmadosSPC, [], []);
  qryConfirmadosSPC.First;
  while not qryConfirmadosSPC.Eof do
  begin
// Verifica se o contrato do aviso atende ao filtro
    RefazConsulta(qryFiltraConfirmados, [0], [qryConfirmadosSPCcontrato.AsString]);
    if (qryFiltraConfirmadosatende.AsInteger > 0) then
    begin
// Gera novo numero de registro no SPC
      ProximoNumeroSPC;
// Calcula o total da divida e atraso do cliente
      CalcularDivida;
// Gera novo registro no SPC
      with qryRegistraSPC do
      begin
        Params[0].Value:= NumeroSPC;
        Params[1].Value:= qryConfirmadosSPCcliente.AsInteger;
        Params[2].Value:= qryConfirmadosSPCcontrato.AsString;
        if (qryConfirmadosSPCavalista.AsInteger = 0) then
           Params[3].Value:= Null
        else
           Params[3].Value:= qryConfirmadosSPCavalista.AsInteger;
        Params[4].Value:= Divida;
        Params[5].Value:= DataVencto;
        ExecSql;
      end;
      Perpetrar([qryRegistraSPC]);
    end;
    qryConfirmadosSPC.Next;
  end;
end;

procedure TdtmRegistroSPC.CalcularDivida;
var
  Vencto: Boolean;
begin
  FDivida := 0;
  Vencto := False;
  RefazConsulta(qryParcelasAtrasadas,[0],[qryConfirmadosSPCcontrato.AsString]);
  qryParcelasAtrasadas.First;
  while not qryParcelasAtrasadas.Eof do
  begin
    if qryParcelasAtrasadasdatavencto.Value < Date then
    begin
      FDivida := FDivida + qryParcelasAtrasadasvalorvencto.AsCurrency;
      if not Vencto then
      begin
        FDataVencto := qryParcelasAtrasadasdatavencto.Value;
        Vencto := True;
      end;
    end;
    qryParcelasAtrasadas.Next;
  end;
end;

procedure TdtmRegistroSPC.ProximoNumeroSPC;
begin
  spcSpcProximo.Open;
  FNumeroSPC := spcSpcProximonumero.AsInteger;
  spcSpcProximo.Close;
end;

end.
