unit dmImportacaoDDA;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, ofxreader, biblio, Variants, ctconstantes,
  fmPrincipalBasico, forms, ACBrBase, ACBrBoleto;

type
  TdtmImportacaoDDA = class(TdtmBasico)
    qryConciliacao: TtecQuery;
    qryConciliacaoconta: TIntegerField;
    qryConciliacaodatainicial: TDateField;
    qryConciliacaodatafinal: TDateField;
    qryConciliacaosaldo: TFloatField;
    dsrConciliacao: TtecDataSource;
    qryconciliacaoextrato: TtecQuery;
    qryconciliacaoextratoconta: TIntegerField;
    qryconciliacaoextratotransacao: TStringField;
    qryconciliacaoextratosequencial: TIntegerField;
    qryconciliacaoextratodocumento: TStringField;
    qryconciliacaoextratodata: TDateField;
    qryconciliacaoextratotipo: TStringField;
    qryconciliacaoextratovalor: TFloatField;
    qryconciliacaoextratodescricao: TStringField;
    dsrconciliacaoextrato: TtecDataSource;
    qryContaConciliacao: TtecQuery;
    qryContaConciliacaobanco: TIntegerField;
    qryContaConciliacaoagencia: TIntegerField;
    qryContaConciliacaoconta: TIntegerField;
    qryContaConciliacaodigito: TStringField;
    qryContaConciliacaotitular: TStringField;
    qryContaConciliacaosigla: TStringField;
    qryContaConciliacaonome: TStringField;
    dsrContaConciliacao: TtecDataSource;
    qryMovtosBancosEventos: TtecQuery;
    qryMovtosBancosEventosconta: TIntegerField;
    qryMovtosBancosEventostransacao: TStringField;
    qryMovtosBancosEventosdocumento: TStringField;
    qryMovtosBancosEventosvalor: TFloatField;
    dsrMovtosBancosEventos: TtecDataSource;
    qryMovtosBancosEventosoperacao: TStringField;
    OFXReader1: TOFXReader;
    qryMovtosBancosEventosevento: TIntegerField;
    qryMovtosBancosEventosdescricaoevento: TStringField;
    qryMovtosBancosEventosobservacoes: TStringField;
    qryMovtosBancosEventosconciliar: TBooleanField;
    qryconciliacaoextratototalconciliado: TFloatField;
    qryMovtosBancosEventosdata: TDateField;
    qryMovtosBancosEventossequencia: TIntegerField;
    qryMovtosBancosEventossequenciaevento: TIntegerField;
    qryConciliacaostatus: TStringField;
    qryconciliacaoextratoSaldo: TCurrencyField;
    qryAtualizarMovtosBancos: TtecQuery;
    qryProximoNumero_Conciliacao: TtecQuery;
    qryProximoNumero_Conciliacaonumero: TLargeintField;
    qryConciliacaonumero: TIntegerField;
    qryConciliacaototalconciliado: TFloatField;
    qryconciliacaoextratonumeroconciliacao: TIntegerField;
    qryAtualizarMovtosBancosEventos: TtecQuery;
    qryConciliacaototalaconciliar: TFloatField;
    qryProcuraContas: TtecQuery;
    qryProcuraContasBanco: TIntegerField;
    qryProcuraContasAgencia: TIntegerField;
    qryProcuraContasConta: TIntegerField;
    qryProcuraContasDigito: TStringField;
    qryProcuraContasTitular: TStringField;
    qryProcuraContasSigla: TStringField;
    qryProcuraContasNome: TStringField;
    qryProcuraContasSaldoLancado: TFloatField;
    dsrProcuraContas: TtecDataSource;
    qryConciliacao_Importacao_OFX: TtecQuery;
    qryConciliacao_Consulta: TtecQuery;
    qryConsultaContas: TtecQuery;
    qryConsultaContasSigla: TStringField;
    qryConsultaContasNome: TStringField;
    qryConsultaContasConta: TIntegerField;
    qryConsultaContasDigito: TStringField;
    qryConsultaContasTitular: TStringField;
    qryConsultaContasSaldoLancado: TFloatField;
    qryConsultaContasBanco: TIntegerField;
    qryConsultaContasAgencia: TIntegerField;
    qryDuplicatas: TtecQuery;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatasdatavencto: TDateField;
    qryParcelas: TtecQuery;
    qryParcelascontrato: TStringField;
    qryParcelasnumero: TIntegerField;
    ACBrBoleto1: TACBrBoleto;
    procedure qryconciliacaoextratoAfterScroll(DataSet: TDataSet);
    procedure qryMovtosBancosEventosAfterPost(DataSet: TDataSet);
    procedure dsrMovtosBancosEventosDataChange(Sender: TObject;
      Field: TField);
    procedure qryconciliacaoextratoCalcFields(DataSet: TDataSet);
    procedure qryConciliacaoCalcFields(DataSet: TDataSet);
    procedure qryConciliacaoNewRecord(DataSet: TDataSet);
    procedure qryMovtosBancosEventosconciliarChange(Sender: TField);
  private
    v_Conta : Integer;
    v_Data : TDateTime;
    v_Sequencia : Integer;
    v_Evento : Integer;
    v_SequenciaEvento :Integer;

    fDiasAcima: integer;
    fPercentualValorAbaixo: Currency;
    fDiasAbaixo: integer;
    fPercentualValorAcima: Currency;
    FMovtosBancosEventosAfterPost: TNotifyEvent;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:     TComponent); override;
    function ImportarConciliacao(Arquivo: String): Boolean;

    property DiasAbaixo: integer read fDiasAbaixo write fDiasAbaixo;
    property DiasAcima: integer read fDiasAcima write fDiasAcima;
    property PercentualValorAbaixo: Currency read fPercentualValorAbaixo write fPercentualValorAbaixo;
    property PercentualValorAcima: Currency read fPercentualValorAcima write fPercentualValorAcima;
    function Gravar: Boolean;
    function Cancelar: Boolean;
    function Excluir: Boolean;

    property MovtosBancosEventosAfterPost: TNotifyEvent
             read FMovtosBancosEventosAfterPost
             write FMovtosBancosEventosAfterPost;

    procedure GuardarPosicaoMovtosBancosEventos;
    procedure RestaurarPosicaoMovtosBancosEventos;
    function GerarConsultaConciliacao(DataInicial: String; DataFinal: String): Boolean;

    procedure Selecionar(TipoPesquisa: TtecMovtosBancos);
    function  ExisteConta(campo, codigo: string): boolean;

    procedure AbrirDocumentos;






  end;

var
  dtmImportacaoDDA: TdtmImportacaoDDA;

implementation

{$R *.dfm}

{ TdtmImportacaoDDA }

constructor TdtmImportacaoDDA.Create(AOwner: TComponent);
begin
  inherited;

end;

function TdtmImportacaoDDA.ImportarConciliacao(Arquivo: String): Boolean;
var
 i: integer;
 vListaced, vListacep : String;
 vAccountID : integer;
begin

  ACBrBoleto1.NomeArqRetorno := Arquivo;
  ACBrBoleto1.LerRetorno;

  result := true;

  try
    OFXReader1.OFXFile := Arquivo;
    OFXReader1.Import;
  except on E: Exception do
  begin
    raise Exception.Create('Error Message: ' + E.Message);
    exit;
  end;
  end;

  if OFXReader1.Count <> 0 then
  begin

    if pos('-', OFXReader1.AccountID) <> 0 then
      vAccountID := strtoint(copy(OFXReader1.AccountID, 1, pos('-', OFXReader1.AccountID)-1))
    else
      vAccountID := strtoint(copy(OFXReader1.AccountID, length(OFXReader1.AccountID)-8, 8));

    qryContaConciliacao.parambyname('conta').asInteger := vAccountID;
    qryContaConciliacao.close;
    qryContaConciliacao.open;

    if qryContaConciliacao.isempty then
    begin
      result := false;
      MensagemAviso(format('A Conta %s no arquivo de conciliação não esta cadastrada no TecLux',
         [quotedstr(OFXReader1.AccountID)]));

      exit;
    end
    else
    begin
      qryProcuraContas.parambyname('Conta').asInteger := vAccountID;
      qryProcuraContas.close;
      qryProcuraContas.open;
    end;

    qryConciliacao.sql.text := qryConciliacao_Importacao_OFX.sql.text;

    qryconciliacao.paramByName('conta').asInteger := vAccountID;
    qryconciliacao.paramByName('datainicial').asDateTime := strtodate(OFXReader1.DateStart);
    qryconciliacao.paramByName('datafinal').asDateTime := strtodate(OFXReader1.DateEnd);

    qryconciliacao.close;
    qryconciliacao.open;
    if qryconciliacao.isempty then
    begin
      qryconciliacao.append;
      qryConciliacaoconta.asInteger := vAccountID;
      qryConciliacaodatainicial.asDateTime := strtodate(OFXReader1.DateStart);
      qryConciliacaodatafinal.asDateTime := strtodate(OFXReader1.DateEnd);
      qryConciliacaosaldo.asFloat := strtoFloat(trocar(OFXReader1.FinalBalance,'.',','));
      qryConciliacaoStatus.asString := 'ABERTA';
      qryconciliacao.post;
    end;

    qryconciliacaoextrato.paramByName('conta').asInteger := vAccountID;
    vListaced := '';
    vListacep := '';

    for i := 0 to OFXReader1.Count-1 do
    begin
      if strtoFloat(trocar(OFXReader1.Get(i).Value,'.',',')) > 0 then
        vListaced := vListaced + quotedstr(OFXReader1.Get(i).ID) + ','
      else
      if strtoFloat(trocar(OFXReader1.Get(i).Value,'.',',')) < 0 then
        vListacep := vListacep + quotedstr(OFXReader1.Get(i).ID) + ',';
    end;

    delete(vListaced,length(vListaced),1);
    delete(vListacep,length(vListacep),1);

    if vListaced = '' then
      vListaced := quotedstr('0');

    if vListacep = '' then
      vListacep := quotedstr('0');


    qryconciliacaoextrato.MacrobyName('ListaTransacoes').asString := vListaced+', '+vListacep;
    try

      qryconciliacaoextrato.AfterScroll := nil;
      qryconciliacaoextrato.close;
      qryconciliacaoextrato.open;


      for i := 0 to OFXReader1.Count-1 do
      begin
        if not qryconciliacaoextrato.locate('transacao', OFXReader1.Get(i).ID, []) then
        begin
          qryconciliacaoextrato.Append;
          if qryconciliacaoextrato.state = dsBrowse then
             qryconciliacaoextrato.edit;
          qryconciliacaoextratonumeroconciliacao.asinteger := qryConciliacaonumero.AsInteger;
          qryconciliacaoextratoconta.asInteger := vAccountID ;
          qryconciliacaoextratotransacao.asString := OFXReader1.Get(i).ID;
          qryconciliacaoextratosequencial.asInteger := i+1;
          qryconciliacaoextratodocumento.AsString := OFXReader1.Get(i).Document;
          qryconciliacaoextratodata.asDateTime := OFXReader1.Get(i).MovDate;
          qryconciliacaoextratotipo.asString := OFXReader1.Get(i).MovType;
          qryconciliacaoextratovalor.asCurrency := strtoFloat(trocar(OFXReader1.Get(i).Value,'.',','));
          qryconciliacaoextratodescricao.asString := OFXReader1.Get(i).Description;
          qryconciliacaoextrato.post;
        end;
      end;

      perpetrar([qryconciliacao, qryconciliacaoextrato]);
      qryconciliacao.close;
      qryconciliacao.open;

                     {
      qryMovtosBancosEventos.paramByName('conta').asInteger := vAccountID;
      qryMovtosBancosEventos.MacrobyName('ListaTransacoes').asString := vListaced+', '+vListacep;
      qryMovtosBancosEventos.close;
      qryMovtosBancosEventos.open;

      qryconciliacaoextratoduplicatas.paramByName('conta').asInteger := vAccountID;
      qryconciliacaoextratoduplicatas.MacrobyName('ListaTransacoes').asString := vListaced;
      qryconciliacaoextratoduplicatas.close;
      qryconciliacaoextratoduplicatas.open;

      qryconciliacaoextratoparcelas.paramByName('conta').asInteger := vAccountID;
      qryconciliacaoextratoparcelas.MacrobyName('ListaTransacoes').asString := vListacep;
      qryconciliacaoextratoparcelas.close;
      qryconciliacaoextratoparcelas.open;
      }

    finally
      qryconciliacaoextrato.AfterScroll :=  qryconciliacaoextratoAfterScroll;
      qryconciliacaoextratoAfterScroll(qryconciliacaoextrato);
    end;

{

    qryconciliacaoextratoitems.paramByName('conta').asInteger := vAccountID;
    qryconciliacaoextratoitems.MacrobyName('ListaTransacoes').asString := vLista;
    qryconciliacaoextratoitems.close;
    qryconciliacaoextratoitems.open;

}

  end;

end;

procedure TdtmImportacaoDDA.qryconciliacaoextratoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  qryMovtosBancosEventos.paramByName('conta').asInteger := qryconciliacaoextratoconta.asInteger;
  qryMovtosBancosEventos.paramByName('datainicial').asDateTime := qryconciliacaoextratodata.asDateTime;
  qryMovtosBancosEventos.paramByName('datafinal').asDateTime := qryconciliacaoextratodata.asDateTime;
  qryMovtosBancosEventos.paramByName('valor').asFloat := qryconciliacaoextratovalor.asFloat;

  qryMovtosBancosEventos.paramByName('DiasAbaixo').asInteger := DiasAbaixo;
  qryMovtosBancosEventos.paramByName('DiasAcima').asInteger := DiasAcima;
  qryMovtosBancosEventos.paramByName('PercentualValorAbaixo').asCurrency := PercentualValorAbaixo;
  qryMovtosBancosEventos.paramByName('PercentualValorAcima').asCurrency := PercentualValorAcima;

  qryMovtosBancosEventos.parambyName('transacao').asString := qryconciliacaoextratotransacao.asString;

//  qryMovtosBancosEventos.MacrobyName('typejoinced').asString := 'join';
//  qryMovtosBancosEventos.MacrobyName('typejoincep').asString := 'join';
//  qryMovtosBancosEventos.MacrobyName('typejoinexterno').asString := 'join';

//  qryMovtosBancosEventos.MacrobyName('CondicaoBuscaAproximadaced').asString := 'false';
//  qryMovtosBancosEventos.MacrobyName('CondicaoBuscaAproximadacep').asString := 'false';
  qryMovtosBancosEventos.MacrobyName('CondicaoBuscaAproximadambe').asString := 'false';

//  qryMovtosBancosEventos.MacrobyName('OrderBy').asString := 'order by documento';

//  qryMovtosBancosEventos.MacrobyName('typejoinexterno').asString := 'left join';

  if qryConciliacaostatus.asString <> 'FECHADA' then
  begin
    qryMovtosBancosEventos.MacrobyName('CondicaoBuscaAproximadambe').asString :=
     ' mbe.data between cast(:datainicial as date) - :DiasAbaixo and cast(:datafinal as date) + :DiasAcima '+
     ' and  ABS(mbe.valor) <= ABS(:valor)  and case when :valor > 0 then mbe.valor > 0 else mbe.valor < 0 end '+
     ' and mbe.transacao is null ';

//    qryMovtosBancosEventos.MacrobyName('OrderBy').asString := 'order by items.valor=abs(:valor) desc';

  end;

  {
  if qryconciliacaoextratovalor.asCurrency < 0 then
  begin


    if qryconciliacaoextratoparcelas.recordcount = 0 then
    begin
      qryMovtosBancosEventos.MacrobyName('typejoinced').asString := 'right outer join';
      qryMovtosBancosEventos.MacrobyName('typejoinexterno').asString := 'left join';
      qryMovtosBancosEventos.MacrobyName('CondicaoBuscaAproximadaced').asString :=
       ' coalesce(d.datapagto,d.datavencto) between cast(:datainicial as date) - :DiasAbaixo and cast(:datafinal as date) + :DiasAcima '+
       ' and coalesce(nullif(d.valorpagto,0),d.valorvencto) between abs(:valor) - (abs(:valor) * (cast(:PercentualValorAbaixo as numeric)/100)) and abs(:valor) * (1+(cast(:PercentualValorAcima as numeric)/100)) '+
       ' and case when coalesce(d.valorpagto,0)<>0 then d.valorpagto <= :valor else true end '+
       ' and coalesce((select mbe.transacao is null                                             '+
       '      from movtosbancoseventos mbe                                                      '+
       '      where mbe.conta = d.contapagto                                                   '+
       '        and mbe.data = d.datapagto                                                     '+
       '        and mbe.sequencia = d.sequencia                                                '+
       '        and mbe.evento = d.evento                                                      '+
       '        and mbe.sequenciaevento = d.sequenciaevento),true)                             ';

      qryMovtosBancosEventos.MacrobyName('OrderBy').asString := 'order by items.valor=abs(:valor) desc';

    end;


  end
  else
  if qryconciliacaoextratovalor.asCurrency > 0 then
  begin

    if qryconciliacaoextratoduplicatas.recordcount = 0 then
    begin
      qryMovtosBancosEventos.MacrobyName('typejoincep').asString := 'right outer join';
      qryMovtosBancosEventos.MacrobyName('typejoinexterno').asString := 'left join';
      qryMovtosBancosEventos.MacrobyName('CondicaoBuscaAproximadacep').asString :=
       ' coalesce(p.datapagto,p.datavencto) between cast(:datainicial as date) - :DiasAbaixo and cast(:datafinal as date) + :DiasAcima '+
       ' and coalesce(NullIf(p.valorpagto,0),p.valorvencto) between abs(:valor) - (abs(:valor) * (cast(:PercentualValorAbaixo as numeric) /100)) and abs(:valor) * (1+(cast(:PercentualValorAcima as numeric)/100)) '+
       ' and case when coalesce(p.valorpagto,0)<>0 then p.valorpagto <= :valor else true end '+
       ' and coalesce((select mbe.transacao is null                                             '+
       '      from movtosbancoseventos mbe                                                      '+
       '      where mbe.conta = p.contaboleto                                                   '+
       '        and mbe.data = p.datapagto                                                     '+
       '        and mbe.sequencia = p.sequencia                                                '+
       '        and mbe.evento = p.evento                                                      '+
       '        and mbe.sequenciaevento = 1), true)                             ';

      qryMovtosBancosEventos.MacrobyName('OrderBy').asString := 'order by items.valor=abs(:valor) desc';

    end;
  end;
  }


  qryMovtosBancosEventos.disablecontrols;
  qryMovtosBancosEventos.close;
  qryMovtosBancosEventos.open;
//  qryMovtosBancosEventos.VoltarRegistro;
  qryMovtosBancosEventos.enablecontrols;

  //if qryMovtosBancosEventos.recordcount <> 0 then
//  qryconciliacaoextratototalconciliado.asCurrency := SomarValores(qryMovtosBancosEventos, [qryMovtosBancosEventosvalor], [qryMovtosBancosEventosconciliar],['True'],['=']);

end;

procedure TdtmImportacaoDDA.qryMovtosBancosEventosAfterPost(
  DataSet: TDataSet);
begin
  inherited;

  qryAtualizarMovtosBancos.parambyname('conta').asInteger := qryMovtosBancosEventosconta.asinteger;
  qryAtualizarMovtosBancos.parambyname('data').asDateTime := qryMovtosBancosEventosdata.asDateTime;
  qryAtualizarMovtosBancos.parambyname('sequencia').asInteger := qryMovtosBancosEventossequencia.asinteger;
  qryAtualizarMovtosBancos.parambyname('compensacao').asDateTime := qryconciliacaoextratodata.asDateTime;
  qryAtualizarMovtosBancos.ExecSql;

  qryAtualizarMovtosBancosEventos.parambyname('conta').asInteger := qryMovtosBancosEventosconta.asinteger;
  qryAtualizarMovtosBancosEventos.parambyname('data').asDateTime := qryMovtosBancosEventosdata.asDateTime;
  qryAtualizarMovtosBancosEventos.parambyname('sequencia').asInteger := qryMovtosBancosEventossequencia.asinteger;
  qryAtualizarMovtosBancosEventos.parambyname('evento').asInteger := qryMovtosBancosEventosevento.asinteger;
  qryAtualizarMovtosBancosEventos.parambyname('sequenciaevento').asInteger := qryMovtosBancosEventossequenciaevento.asinteger;
  if qryMovtosBancosEventostransacao.isnull then
    qryAtualizarMovtosBancosEventos.parambyname('transacao').value := null
  else
    qryAtualizarMovtosBancosEventos.parambyname('transacao').value := qryMovtosBancosEventostransacao.value;

  qryAtualizarMovtosBancosEventos.ExecSql;

  perpetrar([qryConciliacao, qryconciliacaoextrato,
             qryAtualizarMovtosBancos, qryAtualizarMovtosBancosEventos], AguardareTerminarDentroDm);

  qryconciliacao.edit;

  MovtosBancosEventosAfterPost(DataSet);
//  RestaurarPosicaoMovtosBancosEventos;

end;

procedure TdtmImportacaoDDA.dsrMovtosBancosEventosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
           (*
  if field = qryMovtosBancosEventosconciliar then
  begin

    if field.value then
    begin
       qryMovtosBancosEventostransacao.asString := qryconciliacaoextratotransacao.asString;

       qryconciliacaoextrato.edit;
       qryconciliacaoextratototalconciliado.asCurrency :=
         qryconciliacaoextratototalconciliado.asCurrency +
          qryMovtosBancosEventosvalor.asCurrency;

       qryconciliacao.edit;
       qryConciliacaototalconciliado.asCurrency :=
         qryConciliacaototalconciliado.asCurrency +
         qryMovtosBancosEventosvalor.asCurrency;

    end
    else
    begin
       {f9, total conciliado geral / a conciliar}
       qryMovtosBancosEventostransacao.clear;

       qryconciliacaoextrato.edit;
       qryconciliacaoextratototalconciliado.asCurrency :=
         qryconciliacaoextratototalconciliado.asCurrency -
          qryMovtosBancosEventosvalor.asCurrency;

       qryConciliacao.edit;
       qryConciliacaototalconciliado.asCurrency :=
         qryConciliacaototalconciliado.asCurrency -
         qryMovtosBancosEventosvalor.asCurrency;

    end;
  end;
  *)

end;

function TdtmImportacaoDDA.Gravar: Boolean;
begin
  result :=    perpetrar([qryConciliacao, qryconciliacaoextrato,
             qryAtualizarMovtosBancos, qryAtualizarMovtosBancosEventos], SomenteGravacao);

{
  if (qryconciliacaoextratovalor.asCurrency <>
     qryconciliacaoextratototalconciliado.asCurrency) then

    MensagemAviso(format('O total conciliado não esta fechando com o valor a conciliar.'+chr(13)+
                  'Total a Conciliar : %s'+chr(13)+
                  'Total conciliado  : %s'+chr(13)+
                  'Total da diferença: %s',

                  [FormatFloat('###,##0.00', qryconciliacaoextratovalor.asCurrency),
                   FormatFloat('###,##0.00', qryconciliacaoextratototalconciliado.asCurrency),
                   FormatFloat('###,##0.00', qryconciliacaoextratovalor.asCurrency - qryconciliacaoextratototalconciliado.asCurrency)]))
  else
  begin
    qryconciliacaoextratoitems.first;
    while not qryconciliacaoextratoitems.eof do
    begin
      if qryconciliacaoextratoitemsconciliar.asBoolean then
      begin

        qryAtualizarMovtosBancosEventos.parambyname('transacao').asString := qryconciliacaoextratotransacao.asString;
        qryAtualizarMovtosBancosEventos.parambyname('conta').asInteger := qryconciliacaoextratoitemsconta.asinteger;
        qryAtualizarMovtosBancosEventos.parambyname('data').asDateTime := qryconciliacaoextratoitemsdata.asDateTime;
        qryAtualizarMovtosBancosEventos.parambyname('sequencia').asInteger := qryconciliacaoextratoitemssequencia.asinteger;
        qryAtualizarMovtosBancosEventos.parambyname('evento').asInteger := qryconciliacaoextratoitemsevento.asinteger;
        qryAtualizarMovtosBancosEventos.parambyname('sequenciaevento').asInteger := qryconciliacaoextratoitemssequenciaevento.asinteger;

        qryAtualizarMovtosBancosEventos.ExecSQL;

      end
      else
      begin
        if not qryconciliacaoextratoitemstransacao.isnull then
        begin
          qryAtualizarMovtosBancosEventos.parambyname('transacao').value := null;
          qryAtualizarMovtosBancosEventos.parambyname('conta').asInteger := qryconciliacaoextratoitemsconta.asinteger;
          qryAtualizarMovtosBancosEventos.parambyname('data').asDateTime := qryconciliacaoextratoitemsdata.asDateTime;
          qryAtualizarMovtosBancosEventos.parambyname('sequencia').asInteger := qryconciliacaoextratoitemssequencia.asinteger;
          qryAtualizarMovtosBancosEventos.parambyname('evento').asInteger := qryconciliacaoextratoitemsevento.asinteger;
          qryAtualizarMovtosBancosEventos.parambyname('sequenciaevento').asInteger := qryconciliacaoextratoitemssequenciaevento.asinteger;

          qryAtualizarMovtosBancosEventos.ExecSQL;

        end;
      end;
      qryconciliacaoextratoitems.next;
    end;

    perpetrar([qryAtualizarMovtosBancosEventos]);
    qryMovtosBancosEventos.close;
    qryMovtosBancosEventos.open;

    qryconciliacaoextratoAfterScroll(qryconciliacaoextrato);

  end;
}


end;

procedure TdtmImportacaoDDA.qryconciliacaoextratoCalcFields(
  DataSet: TDataSet);
begin
  inherited;

  qryconciliacaoextratoSaldo.asCurrency :=
     qryconciliacaoextratovalor.asCurrency -
     qryconciliacaoextratototalconciliado.asCurrency;
     
end;

procedure TdtmImportacaoDDA.qryConciliacaoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qryConciliacaototalaconciliar.asCurrency = qryConciliacaototalconciliado.asCurrency) and
     (qryConciliacaototalaconciliar.asCurrency <> 0) then
    qryConciliacaostatus.asString := 'FECHADA'
  else
  if (qryConciliacaototalaconciliar.asCurrency <> qryConciliacaototalconciliado.asCurrency) and
     (qryConciliacaototalconciliado.asCurrency <> 0) then
    qryConciliacaostatus.asString := 'PARCIAL'
  else
    qryConciliacaostatus.asString := 'ABERTA'

end;

procedure TdtmImportacaoDDA.qryConciliacaoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  if qryProximoNumero_Conciliacao.active then
    qryProximoNumero_Conciliacao.close;
  qryProximoNumero_Conciliacao.open;

  qryConciliacaonumero.asinteger := qryProximoNumero_Conciliacaonumero.asInteger;

end;

function TdtmImportacaoDDA.Cancelar: Boolean;
begin
  result :=    Rollback([qryConciliacao, qryconciliacaoextrato,
               qryAtualizarMovtosBancos, qryAtualizarMovtosBancosEventos]);

  qryConciliacao.refresh;
  qryconciliacaoextrato.refresh;



end;

procedure TdtmImportacaoDDA.qryMovtosBancosEventosconciliarChange(
  Sender: TField);
begin
  inherited;
    GuardarPosicaoMovtosBancosEventos;
    if Tfield(Sender).value then
    begin

       qryMovtosBancosEventostransacao.asString := qryconciliacaoextratotransacao.asString;

       qryconciliacaoextrato.edit;
       qryconciliacaoextratototalconciliado.asCurrency :=
         qryconciliacaoextratototalconciliado.asCurrency +
          qryMovtosBancosEventosvalor.asCurrency;

       qryconciliacao.edit;
       qryConciliacaototalconciliado.asCurrency :=
         qryConciliacaototalconciliado.asCurrency +
         qryMovtosBancosEventosvalor.asCurrency;

    end
    else
    begin

       {f9, total conciliado geral / a conciliar}
       qryMovtosBancosEventostransacao.clear;

       qryconciliacaoextrato.edit;
       qryconciliacaoextratototalconciliado.asCurrency :=
         qryconciliacaoextratototalconciliado.asCurrency -
          qryMovtosBancosEventosvalor.asCurrency;

       qryConciliacao.edit;
       qryConciliacaototalconciliado.asCurrency :=
         qryConciliacaototalconciliado.asCurrency -
         qryMovtosBancosEventosvalor.asCurrency;

    end;

end;

function TdtmImportacaoDDA.Excluir: Boolean;
begin
{
  if MensagemConfirmacao('Confirma a exclusão desta importação?') = smbOk then
  begin

  end;
}  
end;

procedure TdtmImportacaoDDA.GuardarPosicaoMovtosBancosEventos;
begin
  v_Conta := qryMovtosBancosEventosconta.asinteger;
  v_Data := qryMovtosBancosEventosdata.asDateTime;
  v_Sequencia := qryMovtosBancosEventossequencia.asInteger;
  v_Evento := qryMovtosBancosEventosEvento.asInteger;
  v_SequenciaEvento := qryMovtosBancosEventossequenciaevento.asInteger;
end;

procedure TdtmImportacaoDDA.RestaurarPosicaoMovtosBancosEventos;
begin
  qryMovtosBancosEventos.locate('conta;data;sequencia;evento;sequenciaevento',
    VarArrayOf([v_conta,v_data,v_sequencia,v_evento,v_sequenciaevento]),[]);
end;

function TdtmImportacaoDDA.GerarConsultaConciliacao(DataInicial,
  DataFinal: String): Boolean;
begin
  try
    result := False;

    qryconciliacaoextrato.AfterScroll := nil;

    qryConciliacao.sql.text := qryConciliacao_Consulta.sql.text;

    qryconciliacao.paramByName('conta').asInteger := qryProcuraContasConta.asinteger;
    qryconciliacao.paramByName('datainicial').asDateTime := strtodate(DataInicial);
    qryconciliacao.paramByName('datafinal').asDateTime := strtodate(DataFinal);

    qryconciliacao.close;
    qryconciliacao.open;

    qryconciliacaoextrato.paramByName('conta').asInteger := qryProcuraContasConta.asinteger;
    qryconciliacaoextrato.paramByName('datainicial').asDateTime := strtodate(DataInicial);
    qryconciliacaoextrato.paramByName('datafinal').asDateTime := strtodate(DataFinal);

    qryconciliacaoextrato.MacroByName('ListaTransacoes').asString := 'select ce.transacao from conciliacaoextrato ce where ce.conta = :conta and ce.data between :datainicial and :datafinal';
    qryconciliacaoextrato.close;
    qryconciliacaoextrato.open;

    result := not qryConciliacaototalconciliado.isnull

  finally
    qryconciliacaoextrato.AfterScroll :=  qryconciliacaoextratoAfterScroll;

    if result then
      qryconciliacaoextratoAfterScroll(qryconciliacaoextrato);
  end;




end;

procedure TdtmImportacaoDDA.Selecionar(
  TipoPesquisa: TtecMovtosBancos);
begin
  case TipoPesquisa of
    tmbCONTAS: RefazConsulta(qryProcuraContas, [0],[qryConsultaContasConta.AsVariant]);
  end;

end;

function TdtmImportacaoDDA.ExisteConta(campo,
  codigo: string): boolean;
begin
  Result:= ExisteCodigo(qryConsultaContas, campo, codigo);
end;

procedure TdtmImportacaoDDA.AbrirDocumentos;
begin

  if qryMovtosBancosEventosoperacao.asstring = 'A PAGAR' then
  begin
    RefazConsultaPorNome(qryDuplicatas, ['conta','data','sequencia','evento','sequenciaevento'],
      [dtmImportacaoDDA.qryMovtosBancosEventosconta.AsInteger,
       dtmImportacaoDDA.qryMovtosBancosEventosData.AsDateTime,
       dtmImportacaoDDA.qryMovtosBancosEventosSequencia.AsInteger,
       dtmImportacaoDDA.qryMovtosBancosEventosEvento.AsInteger,
       dtmImportacaoDDA.qryMovtosBancosEventosSequenciaEvento.AsInteger]);

    if qryDuplicatas.recordcount = 1 then
      TfrmPrincipalBasico(Application.MainForm).
              MostrarFormRegistrado([dtmImportacaoDDA.qryDuplicatasdocumentopag.AsInteger,
                                     dtmImportacaoDDA.qryDuplicatasnumero.AsInteger,
                                     dtmImportacaoDDA.qryDuplicatasdatavencto.AsDateTime
                                     ], 'TfrmContasPagar', True)
    else
      MensagemErro('Conta a Pagar relacionada a este movimento de banco não encontrada!');
  end
  else
  if qryMovtosBancosEventosoperacao.asstring = 'A RECEBER' then
  begin
    RefazConsultaPorNome(qryparcelas, ['conta','data','sequencia','evento','valorpagto'],
      [dtmImportacaoDDA.qryMovtosBancosEventosconta.AsInteger,
       dtmImportacaoDDA.qryMovtosBancosEventosData.AsDateTime,
       dtmImportacaoDDA.qryMovtosBancosEventosSequencia.AsInteger,
       dtmImportacaoDDA.qryMovtosBancosEventosEvento.AsInteger,
       dtmImportacaoDDA.qryMovtosBancosEventosvalor.AsFloat]);

    if qryparcelas.recordcount = 1 then
      TfrmPrincipalBasico(Application.MainForm).
              MostrarFormRegistrado([dtmImportacaoDDA.qryparcelasContrato.AsString,
                                     dtmImportacaoDDA.qryParcelasnumero.AsInteger
                                     ], 'TfrmCadastroContratos', True)
    else
      MensagemErro('Contrato relacionada a este movimento de banco não encontrada!');
  end;
end;

end.
