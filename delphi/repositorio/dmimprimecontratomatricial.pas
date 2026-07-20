unit dmimprimecontratomatricial;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery,clparametrossistema, ZTransact;

type
  TdtmImprimeContratoMatricial = class(TdtmBasico)
    qryModelosContratosMatriciais: TtecQuery;
    qryModelosContratosMatriciaiscabecalho: TStringField;
    qryModelosContratosMatriciaisvencimento: TStringField;
    qryModelosContratosMatriciaisproduto: TStringField;
    qryModelosContratosMatriciaisservico: TStringField;
    qryModelosContratosMatriciaisrodape: TStringField;
    qryModelosContratosMatriciaiscanhoto: TStringField;
    qryModelosContratosMatriciaisrodapepagina: TStringField;
    qryModelosContratosMatriciaisconfigurar: TStringField;
    qryModelosContratosMatriciaisrodapeacrescimo: TStringField;
    qryModelosContratosMatriciaisrodapedesconto: TStringField;
    qryModelosContratosMatriciaisvenctoagrupados: TStringField;
    qryModelosContratosMatriciaisobslegais: TStringField;
    qryModelosContratosMatriciaissemprodutos: TStringField;
    qryContratos: TtecQuery;
    qryProdutosContratos: TtecQuery;
    qryContratosnumero: TStringField;
    qryContratosdata: TDateField;
    qryContratosfaturamento: TDateField;
    qryContratosavalista: TIntegerField;
    qryContratoscliente: TIntegerField;
    qryContratostipocliente: TStringField;
    qryContratosdependente: TIntegerField;
    qryContratosvendedor: TIntegerField;
    qryContratosfilialvenda: TIntegerField;
    qryContratosvalorvista: TFloatField;
    qryContratosvalorprazo: TFloatField;
    qryContratostotalprodutos: TFloatField;
    qryContratostotalservicos: TFloatField;
    qryContratosdesconto: TFloatField;
    qryContratosfrete: TFloatField;
    qryContratosseguro: TFloatField;
    qryContratosagente: TIntegerField;
    qryContratosanalista: TIntegerField;
    qryContratosnomeanalista: TStringField;
    qryContratosorigem: TStringField;
    qryContratostiporenegociacao: TStringField;
    qryContratostaxajuros: TFloatField;
    qryContratosplano: TIntegerField;
    qryContratosconsideracoes: TStringField;
    qryContratosentrua: TStringField;
    qryContratosentestado: TStringField;
    qryContratosentcidade: TIntegerField;
    qryContratosentbairro: TIntegerField;
    qryContratosentcep: TIntegerField;
    qryContratosentfoneddd: TIntegerField;
    qryContratosentfonenumero: TIntegerField;
    qryContratosentfoneramal: TStringField;
    qryContratosmontagemobs: TStringField;
    qryContratosmontagemfilial: TIntegerField;
    qryContratossituacao: TStringField;
    qryContratosemitirnotadepoisde: TDateField;
    qryContratosnomesituacao: TStringField;
    qryContratosmotivo: TIntegerField;
    qryContratosdescricaomotivo: TStringField;
    qryContratosnomecidadeentrega: TStringField;
    qryContratosnomebairroentrega: TStringField;
    qryContratosnomecidadenaturalidade: TStringField;
    qryContratosnomecidade: TStringField;
    qryContratosnomebairro: TStringField;
    qryContratosnomecidadeempresa: TStringField;
    qryContratosnomebairroempresa: TStringField;
    qryContratosnomecidadeconjuge: TStringField;
    qryContratosnomebairroconjuge: TStringField;
    qryContratosnomecidadereferencia: TStringField;
    qryContratosnomebairroreferencia: TStringField;
    qryContratosnome: TStringField;
    qryContratosnascto: TDateField;
    qryContratosapelido: TStringField;
    qryContratossexo: TStringField;
    qryContratoscivil: TStringField;
    qryContratoscivildata: TDateField;
    qryContratosiddocumento: TStringField;
    qryContratosidorgao: TStringField;
    qryContratosiddata: TDateField;
    qryContratosidestado: TStringField;
    qryContratospessoatipo: TStringField;
    qryContratospessoanumero: TStringField;
    qryContratosmae: TStringField;
    qryContratospai: TStringField;
    qryContratosconceito: TIntegerField;
    qryContratosnaturalcidade: TIntegerField;
    qryContratosnaturalestado: TStringField;
    qryContratosrua: TStringField;
    qryContratosestado: TStringField;
    qryContratoscidade: TIntegerField;
    qryContratosbairro: TIntegerField;
    qryContratoscep: TIntegerField;
    qryContratosfonetipo: TStringField;
    qryContratosfoneddd: TIntegerField;
    qryContratosfonenumero: TIntegerField;
    qryContratosfoneramal: TStringField;
    qryContratosfone2ddd: TIntegerField;
    qryContratosfone2numero: TIntegerField;
    qryContratosfone2ramal: TStringField;
    qryContratosrestipo: TStringField;
    qryContratosresonus: TFloatField;
    qryContratosrestempo: TDateField;
    qryContratosempresa: TStringField;
    qryContratosempadmissao: TDateField;
    qryContratosempcep: TIntegerField;
    qryContratosempcomprovado: TBooleanField;
    qryContratosempfoneddd: TIntegerField;
    qryContratosempfonenumero: TIntegerField;
    qryContratosempfoneramal: TStringField;
    qryContratosempoutrasdescricao: TStringField;
    qryContratosempoutrasfaixa: TIntegerField;
    qryContratosempoutrasvalor: TFloatField;
    qryContratosemprendafaixa: TIntegerField;
    qryContratosemprendavalor: TFloatField;
    qryContratosemprua: TStringField;
    qryContratosempestado: TStringField;
    qryContratosempcidade: TIntegerField;
    qryContratosempbairro: TIntegerField;
    qryContratosempcargo: TIntegerField;
    qryContratosconjuge: TIntegerField;
    qryContratosconnome: TStringField;
    qryContratosconadmissao: TDateField;
    qryContratosconcep: TIntegerField;
    qryContratosconempresa: TStringField;
    qryContratosconfoneddd: TIntegerField;
    qryContratosconfonenumero: TIntegerField;
    qryContratosconfoneramal: TStringField;
    qryContratosconnascto: TDateField;
    qryContratosconrendafaixa: TIntegerField;
    qryContratosconrendavalor: TFloatField;
    qryContratosconrua: TStringField;
    qryContratosconestado: TStringField;
    qryContratosconcidade: TIntegerField;
    qryContratosconbairro: TIntegerField;
    qryContratosconcargo: TIntegerField;
    qryContratosreferencia: TStringField;
    qryContratosreftipo: TStringField;
    qryContratosrefrua: TStringField;
    qryContratosrefestado: TStringField;
    qryContratosrefcidade: TIntegerField;
    qryContratosrefbairro: TIntegerField;
    qryContratosrefcep: TIntegerField;
    qryContratosreffoneddd: TIntegerField;
    qryContratosreffonenumero: TIntegerField;
    qryContratosreffoneramal: TStringField;
    qryContratosreffone2ddd: TIntegerField;
    qryContratosreffone2numero: TIntegerField;
    qryContratosreffone2ramal: TStringField;
    qryContratosobservacoes: TStringField;
    qryContratosemail: TStringField;
    qryContratoslistacasamento: TIntegerField;
    qryContratosautomovel: TBooleanField;
    qryContratoscartaocredito: TBooleanField;
    qryContratoscartaoloja: TBooleanField;
    qryContratoscheque: TBooleanField;
    qryContratoschequeespecial: TBooleanField;
    qryContratosdependentes: TIntegerField;
    qryContratosonus: TFloatField;
    qryContratosprimogenito: TStringField;
    qryContratospedidocliente: TStringField;
    qryContratosrenegociado: TStringField;
    qryContratoscreditotroca: TFloatField;
    qryParcelas: TtecQuery;
    qryParcelasAgrupadas: TtecQuery;
    qryParcelasAgrupadasquant: TLargeintField;
    qryParcelasAgrupadasvalorvencto: TFloatField;
    qryParcelasAgrupadasdata: TDateField;
    qryProdutosContratoscontrato: TStringField;
    qryProdutosContratosquantidade: TFloatField;
    qryProdutosContratosproduto: TLargeintField;
    qryProdutosContratosfilial: TIntegerField;
    qryProdutosContratosprecovenda: TFloatField;
    qryProdutosContratosprecototal: TFloatField;
    qryProdutosContratosprodutodescricao: TStringField;
    qryProdutosContratosreferencia: TStringField;
    qryProdutosContratosunidade: TStringField;
    qryProdutosContratoslocalizacao: TStringField;
    qryProdutosContratosobslegal: TStringField;
    qryProdutosContratosorigem: TIntegerField;
    qryProdutosContratosincidencia: TStringField;
    qryProdutosContratosmarcadescricao: TStringField;
    qryContratosnomevendedor: TStringField;
    qryContratosdescricaoplano: TStringField;
    qryParcelasnumero: TIntegerField;
    qryParcelasparcelaorigem: TStringField;
    qryParcelasdatavencto: TDateField;
    qryParcelasvalorvencto: TFloatField;
    qryParcelassinaltroca: TStringField;
    qryContratostotalgeral: TFloatField;
    qryContratosdddfilialbase: TStringField;
    qryContratosfonefilialbase: TStringField;
    qryContratosrazaofilial: TStringField;
    qryModelosContratosMatriciaiscabecalhoproduto: TStringField;
    qryContratosendnumero: TIntegerField;
    qryContratosendcomplemento: TStringField;
    qryContratosendereco: TStringField;
    qryContratosfonedddfilialvenda: TIntegerField;
    qryContratosfonenumerofilialvenda: TIntegerField;
    qryParcelastiporecebimento: TIntegerField;
    qryParcelasdescricaotiporecebimento: TStringField;
    qryParcelasAgrupadastiporecebimento_a: TIntegerField;
    qryParcelasAgrupadasdescricaotiporecebimento_a: TStringField;
    procedure qryContratosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function  ImprimirContrato(NumeroContrato:String; Impressora:String): Boolean;
    procedure ObterComplementos(NumeroContrato:String);
  end;

var
  dtmImprimeContratoMatricial: TdtmImprimeContratoMatricial;

implementation
uses
  cltextprinter;
{$R *.dfm}

procedure TdtmImprimeContratoMatricial.ObterComplementos(NumeroContrato:String);
begin
  ReFazConsulta(qryContratos, [0], [NumeroContrato]);
  RefazConsulta(qryProdutosContratos,[0],[NumeroContrato]);
//  RefazConsulta(qryServicosDadosFiscais,[0],[qryDadosFiscaisnumero.AsInteger]);
//  RefazConsulta(qryCalculos,[0],[qryDadosFiscaisnumero.AsInteger]);
  RefazConsulta(qryParcelas,[0],[NumeroContrato]);
  RefazConsulta(qryParcelasAgrupadas,[0],[NumeroContrato]);
 // ReFazConsulta(qryFornecedor, [0], [qryDadosFiscaisnumero.AsInteger]);
  ReFazConsulta(qryModelosContratosMatriciais, [0], [ParSistema.ModeloContratoMatricial]);
end;

function TdtmImprimeContratoMatricial.ImprimirContrato(NumeroContrato:String; Impressora:String): Boolean;
var
  Count, Columas,  ProdPag, {ServPag,}   ProdAux, Pagina,
  LinhasVencto,    {PagServ,} QtdadePag: Integer;
  BandProd: String;
begin
  Pagina  := 1;
  ProdAux := 0;
  Result  := False;
  ObterComplementos(NumeroContrato);
  if Impressora = '' then NomeImpressoraEscolhida:= ParSistema.NomeImpressoraContrato
                     else NomeImpressoraEscolhida:= Impressora;

  with TextPrinter do begin
    BeginDoc(qryModelosContratosMatriciaisconfigurar.AsString);
    ProdPag      := ProductPerPage(qryModelosContratosMatriciaisconfigurar.AsString);
//    ServPag      := ServicePerPage(qryModelosNotasconfigurar.AsString);
    LinhasVencto := ExpirationBandLines(qryModelosContratosMatriciaisconfigurar.AsString);

    if qryContratosdesconto.AsFloat   > 0   then Inc(ProdAux);
 //   if qryDadosFiscaisacrescimo.AsFloat  > 0   then Inc(ProdAux);
    if qryProdutosContratosobslegal.AsString <> '' then Inc(ProdAux);

    if (qryProdutosContratos.RecordCount + ProdAux) <= ProdPag then QtdadePag := 1
    else begin
      QtdadePag := ((qryProdutosContratos.RecordCount + ProdAux) div ProdPag);
      if ((qryProdutosContratos.RecordCount + ProdAux) mod ProdPag) > 0 then
        Inc(QtdadePag)
    end;

   { if (ServPag > 0) and (qryServicosDadosFiscais.RecordCount > ServPag) then begin
      PagServ := qryServicosDadosFiscais.RecordCount div ServPag;
      if (qryServicosDadosFiscais.RecordCount mod ServPag) > 0 then
        Inc(PagServ);
      if QtdadePag < PagServ then
        QtdadePag := PagServ;
    end;}
    repeat
      BandString := qryModelosContratosMatriciaiscabecalho.AsString;
      BreakToLine;
      WriteBand(qryContratos.Fields, ['X',' ']);
      BandString := qryModelosContratosMatriciaisvencimento.AsString;
      Columas := BandColumns;
      Count := 1;
      if (LinhasVencto * Columas) < qryParcelas.RecordCount then begin
        BandString := qryModelosContratosMatriciaisvenctoagrupados.AsString;
        Columas := BandColumns;
        BreakToLine;
        qryParcelasAgrupadas.First;
        while Not qryParcelasAgrupadas.Eof do begin
          WriteBand(qryParcelasAgrupadas.Fields);
          if (Count mod Columas) = 0 then
            BreakLine(1);
          Inc(Count);
          qryParcelasAgrupadas.Next;
        end
      end else begin
        BreakToLine;
        qryParcelas.First;
        while not qryParcelas.Eof do begin
          WriteBand(qryParcelas.Fields);
          if (Count mod Columas) = 0 then
            BreakLine(1);
          Inc(Count);
          qryParcelas.Next;
        end
      end;
      BandString := qryModelosContratosMatriciaiscabecalhoproduto.AsString;
      if BandString <> '' then
      begin
        BreakToLine;
        WriteBand([]);
      end;
      if qryProdutosContratos.RecordCount > 0 then begin
        BandString := qryModelosContratosMatriciaisproduto.AsString;
        BreakToLine;
        BandProd := BandString;
        if Pagina = 1 then
          qryProdutosContratos.First;
        Count := 0;

        while not qryProdutosContratos.Eof do begin
          WriteBand(qryProdutosContratos.Fields);
          if qryProdutosContratosobslegal.AsString <> '' then begin
            BandString := qryModelosContratosMatriciaisobslegais.AsString;
            BreakLine(1);
            WriteBand(qryProdutosContratos.Fields);
            BandString := BandProd;
            Inc(Count);
            if Count = ProdPag then
              Break;
          end;
          BreakLine(1);
          qryProdutosContratos.Next;
          Inc(Count);
          if Count = ProdPag then
            Break;
        end;
 {     end else if (qryServicosDadosFiscais.RecordCount = 0) or (ServPag = 0) then begin
        BandString := qryModelosNotassemprodutos.AsString;
        BreakToLine;
        WriteBand(qryDadosFiscais.Fields);  }
      end;

      if Pagina = QtdadePag then begin
        if qryContratosdesconto.AsFloat > 0 then begin
          BandString := qryModelosContratosMatriciaisrodapedesconto.AsString;
          WriteBand(qryContratos.Fields);
        end;
  {      if qryDadosFiscaisacrescimo.AsFloat > 0 then begin
          BandString := qryModelosNotasrodapeacrescimo.AsString;
          WriteBand(qryDadosFiscais.Fields);
        end; }
      end;
  {    if (qryServicosDadosFiscais.RecordCount > 0) and
         (qryModelosNotasservico.AsString <> '') and
         (ServPag > 0)
      then begin
        BandString := qryModelosNotasservico.AsString;
        BreakToLine;
        if Pagina = 1 then
          qryServicosDadosFiscais.First;
        Count := 0;
        while Not qryServicosDadosFiscais.Eof do begin
          WriteBand(qryServicosDadosFiscais.Fields);
          BreakLine(1);
          qryServicosDadosFiscais.Next;
          Inc(Count);
          if Count = ServPag then
            Break;
        end;
      end;  }
      if Pagina = QtdadePag then
        BandString := qryModelosContratosMatriciaisrodape.AsString
      else
        BandString := qryModelosContratosMatriciaisrodapepagina.AsString;
      BreakToLine;
      if QtdadePag = 1 then
        WriteBand(qryContratos.Fields)
      else if Pagina < QtdadePag then
        WriteBand(qryContratos.Fields, [Pagina, QtdadePag])
      else
        WriteBand(qryContratos.Fields, ['  Pagina ', Pagina, ' de ', QtdadePag]);

      BandString := qryModelosContratosMatriciaiscanhoto.AsString;
      BreakToLine;
      WriteBand(qryContratos.Fields);

      FormFeed;
      
      {$IFNDEF LINUX}
         if Pagina < QtdadePag then
           WriteTextln('',0);
      {$ENDIF}

      Inc(Pagina);
    until Pagina > QtdadePag;
    EndDoc('TecLUX - Contrato');
  end;
end;

procedure TdtmImprimeContratoMatricial.qryContratosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryContratosDddFilialbase.AsString  := dddfilialbase;
  qryContratosFoneFilialbase.AsString := fonefilialbase;
  qryContratosendereco.AsString := qryContratosrua.AsString;
  if qryContratosendnumero.AsInteger<>0 then
    qryContratosendereco.AsString := qryContratosendereco.AsString + ' '+
                                     qryContratosendnumero.AsString;
  if qryContratosendcomplemento.AsString <>'' then
    qryContratosendereco.AsString := qryContratosendereco.AsString + ' '+
                                     qryContratosendcomplemento.AsString;
end;

end.
