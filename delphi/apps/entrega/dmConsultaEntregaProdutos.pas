unit dmConsultaEntregaProdutos;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, CheckLst, biblio, variants;

type
  TdtmConsultaEntregaProdutos = class(TdtmBasico)
    qryConsultaEntregaProdutos: TtecQuery;
    dsrConsultaEntregaProdutos: TtecDataSource;
    qryConsultaEntregaProdutoscontrato: TStringField;
    qryConsultaEntregaProdutosprodutovisual: TStringField;
    qryConsultaEntregaProdutosfilial: TIntegerField;
    qryConsultaEntregaProdutosdescricaoproduto: TStringField;
    qryConsultaEntregaProdutossaldo_quantidade: TFloatField;
    qryConsultaEntregaProdutosdataentrega: TDateField;
    qryConsultaEntregaProdutoshoraentrega: TTimeField;
    qryConsultaEntregaProdutosestado: TStringField;
    qryConsultaEntregaProdutosnomecidade: TStringField;
    qryConsultaEntregaProdutoscep: TIntegerField;
    qryConsultaEntregaProdutosnomebairro: TStringField;
    qryConsultaEntregaProdutosrua: TStringField;
    qryConsultaEntregaProdutosendnumero: TIntegerField;
    qryConsultaEntregaProdutosendcomplemento: TStringField;
    qryPeriodosEntrega: TtecQuery;
    qryPeriodosEntregacodigo: TIntegerField;
    qryPeriodosEntregadescricao: TStringField;
    qryPeriodosEntregahorapadrao: TTimeField;
    qryPeriodosEntregainativo: TDateField;
    dsrPeriodosEntrega: TtecDataSource;
    qryConsultaEntregaProdutosdata: TDateField;
    qryConsultaEntregaProdutosdescricaoperiodoentrega: TStringField;
    qryConsultaEntregaProdutosperiodoentrega: TIntegerField;
    qryConsultaEntregaProdutosdescricaoperiodoentrega_: TStringField;
    qryConsultaEntregaProdutosfilialnf: TIntegerField;
    qryConsultaEntregaProdutosserie: TStringField;
    qryConsultaEntregaProdutosnumero: TIntegerField;
    qryPeriodosEntregainicio: TTimeField;
    qryPeriodosEntregafim: TTimeField;
    qryPeriodosEntregamarcar: TBooleanField;
    qryConsultaEntregaProdutosdadofiscal: TIntegerField;
    qryAtualizar: TtecQuery;
    qryConsultaEntregaProdutosproduto: TLargeintField;
    qryConsultaEntregaProdutosauxdataentrega: TDateField;
    qryConsultaEntregaProdutosauxhoraentrega: TTimeField;
    qryConsultaEntregaProdutosauxperiodoentrega: TIntegerField;
    qryConsultaEntregaProdutosfornecedor_transporte: TIntegerField;
    qryConsultaEntregaProdutosnomefornecedortransporte: TStringField;
    qryConsultaEntregaProdutosregiao: TStringField;
    qryConsultaEntregaProdutosnomeregiao: TStringField;
    qryConsultaEntregaProdutosentregas: TFloatField;
    qryConsultaEntregaProdutosendereco: TStringField;
    qryConsultaEntregaProdutoscontratonota: TStringField;
    qryConsultaEntregaProdutoslimitequantidade: TIntegerField;
    qryConsultaEntregaProdutosromaneio: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dsrConsultaEntregaProdutosDataChange(Sender: TObject;
      Field: TField);
    procedure qryConsultaEntregaProdutosdescricaoperiodoentregaGetText(
      Sender: TField; var Text: String; DisplayText: Boolean);
    procedure qryConsultaEntregaProdutosAfterPost(DataSet: TDataSet);
    procedure qryConsultaEntregaProdutosCalcFields(DataSet: TDataSet);
  private
    fRomaneioDadoFiscal: integer;
    fRomaneio: integer;
    { Private declarations }
  public
    { Public declarations }

   editando : Boolean; 
   Procedure AbrirConsultaEntregaProdutos(
                       TodoIntervalodeEntregas: Boolean;
                       edtDataInicial,
                       edtDataFinal,
                       fraListaFiliaisVenda_ListaSelecionada,
                       fraListaFiliaisProdutos_ListaSelecionada,
                       ListaFornecedoresTransporte: String);

   property Romaneio: integer read fRomaneio write fRomaneio;
   property RomaneioDadoFiscal: integer read fRomaneioDadoFiscal write fRomaneioDadoFiscal;

   function GravarDados: Boolean ;

   function posicionarregistro(contrato,filialnf,serie,numero,produtovisual: String): Boolean;
   procedure GravarDadosEntrega;


  end;

var
  dtmConsultaEntregaProdutos: TdtmConsultaEntregaProdutos;

implementation

{$R *.dfm}

{ TdtmConsultaEntregaProdutos }

procedure TdtmConsultaEntregaProdutos.AbrirConsultaEntregaProdutos(
  TodoIntervalodeEntregas: Boolean;
  edtDataInicial, edtDataFinal,
  fraListaFiliaisVenda_ListaSelecionada,
  fraListaFiliaisProdutos_ListaSelecionada,
  ListaFornecedoresTransporte: String {;
  ChkPeriodo: TCheckListBox});
var
  vListaPeriodoEntrega: String;
begin
  qryConsultaEntregaProdutos.parambyname('TodoIntervalodeEntregas').asBoolean := TodoIntervalodeEntregas;

  if edtDataInicial <> '' then
    qryConsultaEntregaProdutos.parambyname('datainicial').asDateTime := strtodate(edtDataInicial)
  else
    qryConsultaEntregaProdutos.parambyname('datainicial').clear;

  if edtDataFinal <> '' then
    qryConsultaEntregaProdutos.parambyname('datafinal').asDateTime := strtodate(edtDataFinal)
  else
    qryConsultaEntregaProdutos.parambyname('datafinal').clear;

  if fraListaFiliaisVenda_ListaSelecionada <> '' then
  begin
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisVenda_ListaSelecionada').asString :=
      'and ct.filialvenda in ('+ fraListaFiliaisVenda_ListaSelecionada + ')';
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisVenda_DF_ListaSelecionada').asString :=
      'and df.filialvenda in ('+ fraListaFiliaisVenda_ListaSelecionada + ')';
  end
  else
  begin
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisVenda_ListaSelecionada').asString := '';
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisVenda_DF_ListaSelecionada').asString := '';
  end;

  if fraListaFiliaisProdutos_ListaSelecionada <> '' then
  begin
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisProdutos_ListaSelecionada').asString :=
      'and pc.filial in ('+ fraListaFiliaisProdutos_ListaSelecionada + ')';
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisProdutos_DF_ListaSelecionada').asString :=
      'and pdf.filial in ('+ fraListaFiliaisProdutos_ListaSelecionada + ')';
  end
  else
  begin
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisProdutos_ListaSelecionada').asString := '';
    qryConsultaEntregaProdutos.MacrobyName('ListaFiliaisProdutos_DF_ListaSelecionada').asString := '';
  end;


  vListaPeriodoEntrega := '';

  qryPeriodosEntrega.first;
  while not qryPeriodosEntrega.eof do
  begin

    if qryPeriodosEntregamarcar.asBoolean then
      vListaPeriodoEntrega := vListaPeriodoEntrega + ' (pc.horaentrega between cast('+ quotedstr(qryPeriodosEntregainicio.asString) + ' as TIME) and  cast(' + quotedstr(qryPeriodosEntregafim.asString) + ' as TIME)) or ';

    qryPeriodosEntrega.next;
  end;

  qryConsultaEntregaProdutos.MacrobyName('PeriodoEntrega').asString := '';

  if vListaPeriodoEntrega <> '' then
  begin
    delete(vListaPeriodoEntrega, length(vListaPeriodoEntrega)-3, 3);
    qryConsultaEntregaProdutos.MacrobyName('PeriodoEntrega').asString :=  ' and ( ' + vListaPeriodoEntrega + ')';
    qryConsultaEntregaProdutos.MacrobyName('PeriodoEntrega_DF').asString :=  ' and ( ' + StringReplace(vListaPeriodoEntrega,'pc.','pdf.',[rfReplaceAll]) + ')';
  end;


  if (romaneio <> 0) and (romaneiodadofiscal <> 0) then
  begin
    qryConsultaEntregaProdutos.MacrobyName('CondicaoRomaneio_DF').asString :=
    ' and  df.numero = ' + inttostr(romaneiodadofiscal);
    qryConsultaEntregaProdutos.MacrobyName('CondicaoRomaneio').asString := ' and false ';
  end
  else
  begin
    qryConsultaEntregaProdutos.MacrobyName('CondicaoRomaneio_DF').asString := '';
    qryConsultaEntregaProdutos.MacrobyName('CondicaoRomaneio').asString := '';
  end;

  if ListaFornecedoresTransporte <> '' then
    qryConsultaEntregaProdutos.MacroByName('ListaFornecedoresTransporte').AsString := 'and ('+
       StringReplace(ListaFornecedoresTransporte, 'vf.', 'vft.',[rfReplaceAll]) +')'
  else
    qryConsultaEntregaProdutos.MacroByName('ListaFornecedoresTransporte').AsString := '';

  qryConsultaEntregaProdutos.close;
  qryConsultaEntregaProdutos.open;

  editando := false;

end;

procedure TdtmConsultaEntregaProdutos.DataModuleCreate(Sender: TObject);
begin
  inherited;
  RemoveDataModule(Self);
end;

procedure TdtmConsultaEntregaProdutos.dsrConsultaEntregaProdutosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryConsultaEntregaProdutosperiodoentrega then
  begin
    qryConsultaEntregaProdutosdescricaoperiodoentrega.asString := qryPeriodosEntregadescricao.asString;
    if not ((qryConsultaEntregaProdutoshoraentrega.Value >= qryPeriodosEntregainicio.value) and
            (qryConsultaEntregaProdutoshoraentrega.Value <= qryPeriodosEntregafim.value)) then
    begin
      dsrConsultaEntregaProdutos.onDataChange := nil;
      qryConsultaEntregaProdutoshoraentrega.value := qryPeriodosEntregahorapadrao.value;
      dsrConsultaEntregaProdutos.onDataChange := dsrConsultaEntregaProdutosDataChange;
    end;
  end
  else
  if field = qryConsultaEntregaProdutoshoraentrega then
  begin
    try
      qryPeriodosEntrega.GuardarRegistroAtual(true);

      qryPeriodosEntrega.first;
      while not qryPeriodosEntrega.eof do
      begin
        if (qryConsultaEntregaProdutoshoraentrega.Value >= qryPeriodosEntregainicio.value) and
           (qryConsultaEntregaProdutoshoraentrega.Value <= qryPeriodosEntregafim.value) then
        begin
          dsrConsultaEntregaProdutos.onDataChange := nil;
          qryConsultaEntregaProdutosperiodoentrega.AsInteger := qryPeriodosEntregacodigo.asinteger;
          qryConsultaEntregaProdutosdescricaoperiodoentrega.asString := qryPeriodosEntregadescricao.asString;
          dsrConsultaEntregaProdutos.onDataChange := dsrConsultaEntregaProdutosDataChange;
          break;
        end;
        qryPeriodosEntrega.next;
      end;
    finally
       qryPeriodosEntrega.VoltarRegistro;
    end;
  end;


end;

function TdtmConsultaEntregaProdutos.GravarDados: Boolean;
begin
  try
    qryAtualizar.sql.clear;
    qryConsultaEntregaProdutos.GuardarRegistroAtual(true);
    qryConsultaEntregaProdutos.first;
    while not qryConsultaEntregaProdutos.eof do
    begin
      if (qryConsultaEntregaProdutosdataentrega.value <> qryConsultaEntregaProdutosauxdataentrega.value) or
         (qryConsultaEntregaProdutoshoraentrega.value <> qryConsultaEntregaProdutosauxhoraentrega.value) or
         (qryConsultaEntregaProdutosperiodoentrega.value <> qryConsultaEntregaProdutosauxperiodoentrega.value) then
      begin
        if not qryConsultaEntregaProdutoscontrato.isnull and
           not qryConsultaEntregaProdutosdadofiscal.isnull then
          qryAtualizar.sql.Append('update produtosdadosfiscais set dataentrega = cast('+quotedstr(FormatDateTime('yyyy-MM-dd', qryConsultaEntregaProdutosdataentrega.asDateTime)) + ' as date), ' +
                  ' horaentrega = cast(' + quotedstr(FormatDateTime('HH:mm:ss', qryConsultaEntregaProdutoshoraentrega.asDateTime)) + ' as time), ' +
                  ' periodoentrega = ' + qryConsultaEntregaProdutosperiodoentrega.asString + ' where dadofiscal = ' + qryConsultaEntregaProdutosdadofiscal.asString + ' and ' +
                  ' produto = ' + qryConsultaEntregaProdutosproduto.asString + ' ; ')
        else
          qryAtualizar.sql.Append('update produtoscontratos set dataentrega = cast('+quotedstr(FormatDateTime('yyyy-MM-dd', qryConsultaEntregaProdutosdataentrega.asDateTime)) + ' as date), ' +
                  ' horaentrega = cast(' + quotedstr(FormatDateTime('HH:mm:ss', qryConsultaEntregaProdutoshoraentrega.asDateTime)) + ' as time), ' +
                  ' periodoentrega = ' + qryConsultaEntregaProdutosperiodoentrega.asString + ' where contrato = ' + quotedstr(qryConsultaEntregaProdutoscontrato.asString) + ' and ' +
                  ' produto = ' + qryConsultaEntregaProdutosproduto.asString + ' ; ')

      end;
      qryConsultaEntregaProdutos.next;
    end;
  finally
    qryConsultaEntregaProdutos.VoltarRegistro;
  
    if qryAtualizar.sql.text <> '' then
    begin
      qryAtualizar.execsql;
      result := perpetrar([qryAtualizar]);
    end;
      
    editando := false;
  end;


end;

procedure TdtmConsultaEntregaProdutos.qryConsultaEntregaProdutosdescricaoperiodoentregaGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  {
  if not (not qryConsultaEntregaProdutosdescricaoperiodoentrega.isnull or
         not qryConsultaEntregaProdutosperiodoentrega.isnull) then
           Text := '';
           }


end;

procedure TdtmConsultaEntregaProdutos.qryConsultaEntregaProdutosAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  try
//    qryConsultaEntregaProdutos.AfterPost := nil;

//    GravarDadosEntrega;
    editando := true;
  finally
//    qryConsultaEntregaProdutos.AfterPost := qryConsultaEntregaProdutosAfterPost;
  end;
end;


procedure TdtmConsultaEntregaProdutos.GravarDadosEntrega;
var
  vContrato: String;
  vDadoFiscal: variant;
  vDataEntrega: TDateTime;
  vHoraEntrega: TDatetime;
  vPeriodoEntrega: integer;
  vDescricaoPeriodoEntrega: String;
begin
{
  AtribuirDados(qryConsultaEntregaProdutos,

             [qryConsultaEntregaProdutosdataentrega,
              qryConsultaEntregaProdutoshoraentrega,
              qryConsultaEntregaProdutosperiodoentrega,
              qryConsultaEntregaProdutosdescricaoperiodoentrega],

              [qryConsultaEntregaProdutosdataentrega.asDateTime,
               qryConsultaEntregaProdutoshoraentrega.asDateTime,
               qryConsultaEntregaProdutosperiodoentrega.asinteger,
               qryConsultaEntregaProdutosdescricaoperiodoentrega.asString],

              [qryConsultaEntregaProdutoscontrato,
               qryConsultaEntregaProdutosdadofiscal],

               [qryConsultaEntregaProdutoscontrato.asString,
                qryConsultaEntregaProdutosdadofiscal.asVariant],

                ['=','='], false, false);
}

  try

    qryConsultaEntregaProdutos.GuardarRegistroAtual(true);

    vContrato := qryConsultaEntregaProdutoscontrato.asString;
    vDadoFiscal := qryConsultaEntregaProdutosdadofiscal.asvariant;
    vDataEntrega := qryConsultaEntregaProdutosdataentrega.asDateTime;
    vHoraEntrega := qryConsultaEntregaProdutoshoraentrega.asDateTime;
    vPeriodoEntrega := qryConsultaEntregaProdutosperiodoentrega.asinteger;
    vDescricaoPeriodoEntrega := qryConsultaEntregaProdutosdescricaoperiodoentrega.asString;



    qryConsultaEntregaProdutos.first;
    while not qryConsultaEntregaProdutos.eof do
    begin
      if (vContrato = qryConsultaEntregaProdutoscontrato.asString) and
         (vDadoFiscal = qryConsultaEntregaProdutosdadofiscal.asvariant) then
      begin
         qryConsultaEntregaProdutos.edit;
         qryConsultaEntregaProdutosdataentrega.asDateTime := vDataEntrega;
         qryConsultaEntregaProdutoshoraentrega.asDateTime := vHoraEntrega;
         qryConsultaEntregaProdutosperiodoentrega.asinteger := vPeriodoEntrega;
         qryConsultaEntregaProdutosdescricaoperiodoentrega.asString := vDescricaoPeriodoEntrega;
         qryConsultaEntregaProdutos.post;
      end;
      qryConsultaEntregaProdutos.next;
    end;

  finally
    qryConsultaEntregaProdutos.VoltarRegistro;
  end;
  
end;

procedure TdtmConsultaEntregaProdutos.qryConsultaEntregaProdutosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryConsultaEntregaProdutosendereco.asString := qryConsultaEntregaProdutosrua.asString;

  if not qryConsultaEntregaProdutosendnumero.isnull then
    qryConsultaEntregaProdutosendereco.asString := qryConsultaEntregaProdutosendereco.asString + ', '+qryConsultaEntregaProdutosendnumero.asstring;

  if not qryConsultaEntregaProdutosendcomplemento.isnull then
    qryConsultaEntregaProdutosendereco.asString := qryConsultaEntregaProdutosendereco.asString + ' -  '+qryConsultaEntregaProdutosendcomplemento.asstring;

end;

function TdtmConsultaEntregaProdutos.posicionarregistro(contrato, filialnf,
  serie, numero, produtovisual: String): Boolean;
begin
  if (serie<>'') and (numero<>'') then
    result :=  qryConsultaEntregaProdutos.locate('contrato; filialnf; serie; numero; produtovisual',
      VarArrayOf([contrato, filialnf, serie, numero, produtovisual]), [])
  else
    result :=  qryConsultaEntregaProdutos.locate('contrato; filialnf; produtovisual',
      VarArrayOf([contrato, filialnf, produtovisual]), []);

end;

end.
