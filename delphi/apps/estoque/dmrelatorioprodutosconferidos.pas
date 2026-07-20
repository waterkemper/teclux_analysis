unit dmrelatorioprodutosconferidos;

interface

uses
  SysUtils, Classes, dmbasico, ZTransact, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft,
  fr_class, fr_dset, fr_dbset, fmPreviewPadrao, variants;

type
  TdtmRelatorioProdutosConferidos = class(TdtmBasico)
    qrySelecaoConferencia: TtecQuery;
    frpRelatorioProdutosConferidos: TfrReport;
    fdsSelecaoConferencia: TfrDBDataSet;
    qrySelecaoConferenciadocumento: TStringField;
    qrySelecaoConferenciatipo: TStringField;
    qrySelecaoConferenciadata: TDateField;
    qrySelecaoConferenciausuario: TIntegerField;
    qrySelecaoConferencianome: TStringField;
    qrySelecaoConferenciaproduto: TLargeintField;
    qrySelecaoConferenciadescricao: TStringField;
    qrySelecaoConferencialido: TFloatField;
    qrySelecaoConferenciaquantidade: TFloatField;
    qrySelecaoConferenciasaldo: TFloatField;
    qrySelecaoConferenciapercentual: TFloatField;
    qrySelecaoConferenciasituacao: TStringField;
    qrySelecaoConferenciadocumentopesquisa: TStringField;
    qrySelecaoConferenciaDescricaoSituacao: TStringField;
    qrySelecaoConferenciadigitado: TBooleanField;
    qrySelecaoConferenciafilial: TIntegerField;
    qrySelecaoConferenciadatahora_alteracao: TDateTimeField;
    qrySelecaoConferenciaprodutovisual: TStringField;
    procedure qrySelecaoConferenciaCalcFields(DataSet: TDataSet);
    procedure qrySelecaoConferenciaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure frpRelatorioProdutosConferidosBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    { Private declarations }
   fSituacaoNaoConferidos : Boolean;
   fSituacaoParcialmenteConferidos : Boolean;
   fSituacaoTotalmenteConferidos : Boolean;

  public
    { Public declarations }
    procedure Imprimir(DataInicial, DataFinal,
                       DataInicialDigitacao, DataFinalDigitacao,
                       ListadeFiliais, ListadeUsuarios: String;
                       SituacaoNaoConferidos, SituacaoParcialmenteConferidos, SituacaoTotalmenteConferidos,
                       TipoContrato, TipoOrcamento, TipoNotaSaida, TipoNotaEntrada, TipoTransferencia,
                       TipoListaPadrao, TipoNotaSaidaTransferencia,
                       TipoRomaneiosdeEntrada, TipoRomaneiosdeSaida: Boolean;
                       ListadeItemProdutos, ListadeProdutos, ListadeGrupos,
                       ListadeClasses, ListadeMarcas,
                       ListaCondicionalPromocoes : String);
    procedure VerificarSituacaoDocumentos;
  end;

var
  dtmRelatorioProdutosConferidos: TdtmRelatorioProdutosConferidos;

implementation

{$R *.dfm}

{ TdtmRelatorioProdutosConferidos }

procedure TdtmRelatorioProdutosConferidos.Imprimir(DataInicial, DataFinal,
  DataInicialDigitacao, DataFinalDigitacao,
  ListadeFiliais, ListadeUsuarios: String; SituacaoNaoConferidos,
  SituacaoParcialmenteConferidos, SituacaoTotalmenteConferidos,
  TipoContrato, TipoOrcamento, TipoNotaSaida, TipoNotaEntrada, TipoTransferencia,
  TipoListaPadrao, TipoNotaSaidaTransferencia,
  TipoRomaneiosdeEntrada, TipoRomaneiosdeSaida: Boolean;
  ListadeItemProdutos, ListadeProdutos, ListadeGrupos, ListadeClasses, ListadeMarcas, ListaCondicionalPromocoes: String);

begin

  fSituacaoNaoConferidos := SituacaoNaoConferidos;
  fSituacaoParcialmenteConferidos := SituacaoParcialmenteConferidos;
  fSituacaoTotalmenteConferidos := SituacaoTotalmenteConferidos;

  if (DataInicialDigitacao <> '') and (DataFinalDigitacao <> '') then
  begin
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacao').asString := 'and cast(pcf.datahora_alteracao as date) between :datahora_inicial_alteracao and :datahora_final_alteracao';
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Saida').asString :=
       ' and cast(                                         '+
       ' (select max(vdfc.datahora_alteracao)              '+
       ' from volumesdadosfiscaisconferencia vdfc          '+
       ' where vdfc.tipo = ''ROS''                         '+
       '   and vdfc.codigo = cast(r.numero as varchar(20)) '+
       '   and vdfc.dadofiscal = rn.dadofiscal) as date) between :datahora_inicial_alteracao and :datahora_final_alteracao';

    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Entrada').asString :=
       ' and cast(                                         '+
       ' (select max(vdfc.datahora_alteracao)              '+
       ' from volumesdadosfiscaisconferencia vdfc          '+
       ' where vdfc.tipo = ''ROE''                         '+
       '   and vdfc.codigo = cast(r.numero as varchar(20)) '+
       '   and vdfc.dadofiscal = rn.dadofiscal) as date) between :datahora_inicial_alteracao and :datahora_final_alteracao';

  end
  else
  if (DataInicialDigitacao <> '') and (DataFinalDigitacao = '') then
  begin

    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacao').asString := 'and cast(pcf.datahora_alteracao as date) >= :datahora_inicial_alteracao';
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Saida').asString :=
       ' and cast(                                         '+
       ' (select max(vdfc.datahora_alteracao)              '+
       ' from volumesdadosfiscaisconferencia vdfc          '+
       ' where vdfc.tipo = ''ROS''                         '+
       '   and vdfc.codigo = cast(r.numero as varchar(20)) '+
       '   and vdfc.dadofiscal = rn.dadofiscal) as date) >= :datahora_inicial_alteracao';

    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Entrada').asString :=
       ' and cast(                                         '+
       ' (select max(vdfc.datahora_alteracao)              '+
       ' from volumesdadosfiscaisconferencia vdfc          '+
       ' where vdfc.tipo = ''ROE''                         '+
       '   and vdfc.codigo = cast(r.numero as varchar(20)) '+
       '   and vdfc.dadofiscal = rn.dadofiscal) as date) >= :datahora_inicial_alteracao';

  end
  else
  if (DataInicialDigitacao = '') and (DataFinalDigitacao <> '') then
  begin
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacao').asString := 'and cast(pcf.datahora_alteracao as date) <= :datahora_final_alteracao';


    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Saida').asString :=
       ' and cast(                                         '+
       ' (select max(vdfc.datahora_alteracao)              '+
       ' from volumesdadosfiscaisconferencia vdfc          '+
       ' where vdfc.tipo = ''ROS''                         '+
       '   and vdfc.codigo = cast(r.numero as varchar(20)) '+
       '   and vdfc.dadofiscal = rn.dadofiscal) as date) <= :datahora_final_alteracao';

    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Entrada').asString :=
       ' and cast(                                         '+
       ' (select max(vdfc.datahora_alteracao)              '+
       ' from volumesdadosfiscaisconferencia vdfc          '+
       ' where vdfc.tipo = ''ROE''                         '+
       '   and vdfc.codigo = cast(r.numero as varchar(20)) '+
       '   and vdfc.dadofiscal = rn.dadofiscal) as date) <= :datahora_final_alteracao';
  end
  else
  begin
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacao').asString := '';
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Saida').asString := '';
    qrySelecaoConferencia.MacroByName('CondicaoDataDigitacaoVDF_Entrada').asString := '';
  end;


  qrySelecaoConferencia.parambyname('datainicial').AsDateTime := strtodate(datainicial);
  qrySelecaoConferencia.parambyname('datafinal').AsDateTime := strtodate(DataFinal);

  if DataInicialDigitacao<>'' then
    qrySelecaoConferencia.parambyname('datahora_inicial_alteracao').AsDateTime := strtodate(DataInicialDigitacao)
  else
    qrySelecaoConferencia.parambyname('datahora_inicial_alteracao').clear;

  if DataFinalDigitacao<>'' then
    qrySelecaoConferencia.parambyname('datahora_final_alteracao').AsDateTime := strtodate(DataFinalDigitacao)
  else
    qrySelecaoConferencia.parambyname('datahora_final_alteracao').clear;

  qrySelecaoConferencia.parambyname('TipoContrato').AsBoolean := TipoContrato;
  qrySelecaoConferencia.parambyname('TipoOrcamento').AsBoolean := TipoOrcamento;
  qrySelecaoConferencia.parambyname('TipoNotaSaida').AsBoolean := TipoNotaSaida;
  qrySelecaoConferencia.parambyname('TipoNotaSaidaTransferencia').AsBoolean := TipoNotaSaidaTransferencia;
  qrySelecaoConferencia.parambyname('TipoNotaEntrada').AsBoolean := TipoNotaEntrada;
  qrySelecaoConferencia.parambyname('TipoTransferencia').AsBoolean := TipoTransferencia;
  qrySelecaoConferencia.parambyname('TipoListaPadrao').AsBoolean := TipoListaPadrao;

  qrySelecaoConferencia.parambyname('TipoRomaneiosdeEntrada').AsBoolean := TipoRomaneiosdeEntrada;
  qrySelecaoConferencia.parambyname('TipoRomaneiosdeSaida').AsBoolean := TipoRomaneiosdeSaida;


  if ListadeFiliais<>'' then
  begin
    qrySelecaoConferencia.MacroByName('ListadeFiliaisCTR').asstring := 'and ct.filialvenda in ('+ListadeFiliais+')';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisORC').asstring := 'and o.filial in ('+ListadeFiliais+')';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisNFS').asstring := 'and df.filialvenda in ('+ListadeFiliais+')';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisNFE').asstring := 'and np.filial in ('+ListadeFiliais+')';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisRequisitada').asstring := 'and pf.requisitada in ('+ListadeFiliais+')';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisLPA').asstring := 'and lp.filial in ('+ListadeFiliais+')';
  end
  else
  begin
    qrySelecaoConferencia.MacroByName('ListadeFiliaisCTR').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisORC').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisNFS').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisNFE').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisRequisitada').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeFiliaisLPA').asstring := '';
  end;

  if ListadeUsuarios<>'' then
  begin
    qrySelecaoConferencia.MacroByName('ListadeUsuarios').asstring := 'and cf.usuario in ('+ListadeUsuarios+')';
    qrySelecaoConferencia.MacroByName('ListadeUsuariosCTR').asstring := 'and coalesce(pc.vendedor,ct.vendedor) in ('+ListadeUsuarios+')';
    qrySelecaoConferencia.MacroByName('ListadeUsuariosORC').asstring := 'and coalesce(po.vendedor,o.vendedor) in ('+ListadeUsuarios+')';
  end
  else
  begin
    qrySelecaoConferencia.MacroByName('ListadeUsuariosCTR').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeUsuariosORC').asstring := '';
    qrySelecaoConferencia.MacroByName('ListadeUsuarios').asstring := '';
  end;

  if ListadeItemProdutos<>'' then
    qrySelecaoConferencia.MacroByName('ListadeItemProdutos').AsString :=  'and ('+ListadeItemProdutos+')'
  else
    qrySelecaoConferencia.MacroByName('ListadeItemProdutos').AsString := '';

  if ListadeProdutos<>'' then
    qrySelecaoConferencia.MacroByName('ListadeProdutos').AsString :=  'and ('+ListadeProdutos+')'
  else
    qrySelecaoConferencia.MacroByName('ListadeProdutos').AsString := '';

  if ListadeGrupos<>'' then
    qrySelecaoConferencia.MacroByName('ListadeGrupos').AsString :=  'and ('+ListadeGrupos+')'
  else
    qrySelecaoConferencia.MacroByName('ListadeGrupos').AsString := '';

  if ListadeGrupos<>'' then
    qrySelecaoConferencia.MacroByName('ListadeGrupos').AsString :=  'and ('+ListadeGrupos+')'
  else
    qrySelecaoConferencia.MacroByName('ListadeGrupos').AsString := '';

  if ListadeClasses<>'' then
    qrySelecaoConferencia.MacroByName('ListadeClasses').AsString := 'and ('+ListadeClasses+')'
  else
    qrySelecaoConferencia.MacroByName('ListadeClasses').AsString := '';

  if ListadeMarcas<>'' then
    qrySelecaoConferencia.MacroByName('ListadeMarcas').AsString := 'and ('+ListadeMarcas+')'
  else
    qrySelecaoConferencia.MacroByName('ListadeMarcas').AsString := '';

  if ListaCondicionalPromocoes<>'' then
    qrySelecaoConferencia.MacroByName('ListaCondicionalPromocoes').AsString := 'and ('+ListaCondicionalPromocoes+')'
  else
    qrySelecaoConferencia.MacroByName('ListaCondicionalPromocoes').AsString := '';


  qrySelecaoConferencia.close;
  qrySelecaoConferencia.open;
  VerificarSituacaoDocumentos;

  if SituacaoNaoConferidos and SituacaoParcialmenteConferidos and SituacaoTotalmenteConferidos then
     qrySelecaoConferencia.filtered := false
  else
    qrySelecaoConferencia.filtered := true;

  AtribuirParametrosBaseRelatorio;
  frVariables['Titulo']:= 'PRODUTOS CONFERIDOS ENTRE '+FormatDateTime('DD/MM/YYYY',strtodate(DataInicial))+
                          ' E '+FormatDateTime('DD/MM/YYYY',strtodate(DataFinal));

//  frpRelatorioProdutosConferidos.DesignReport;

  ImprimirRelatoriofast(null, null, MSimples, 0, [frpRelatorioProdutosConferidos], true, self);

  qrySelecaoConferencia.Filtered := false;

end;

procedure TdtmRelatorioProdutosConferidos.qrySelecaoConferenciaCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qrySelecaoConferenciasaldo.AsFloat := qrySelecaoConferenciaquantidade.AsFloat - qrySelecaoConferencialido.AsFloat;
  if qrySelecaoConferenciasituacao.AsString = 'P' then
    qrySelecaoConferenciaDescricaoSituacao.AsString := 'PARCIALMENTE CONFERIDO'
  else
  if qrySelecaoConferenciasituacao.AsString = 'N' then
    qrySelecaoConferenciaDescricaoSituacao.AsString := 'NÃO CONFERIDO'
  else
  if qrySelecaoConferenciasituacao.AsString = 'T' then
    qrySelecaoConferenciaDescricaoSituacao.AsString := 'TOTALMENTE CONFERIDO';


end;

procedure TdtmRelatorioProdutosConferidos.VerificarSituacaoDocumentos;
var
  vTipo, vDocumentoPesquisa, vSituacao : String;
  vRegistroAtual : TBookMark;

  procedure VerificarSituacao;
  begin
    while (vTipo = qrySelecaoConferenciatipo.AsString) and
          (vDocumentoPesquisa = qrySelecaoConferenciadocumentopesquisa.AsString) and
          not qrySelecaoConferencia.Eof do
    begin

      if (qrySelecaoConferenciapercentual.AsCurrency > 0) and
         (qrySelecaoConferenciapercentual.AsCurrency < 100) then
      begin
        vSituacao := 'P';
        break;
      end
      else
      if (qrySelecaoConferenciapercentual.AsCurrency = 0) then
      begin
        if vsituacao = 'T' then
        begin
          vSituacao := 'P';
          break;
        end
        else
         vSituacao := 'N';
      end
      else
        vSituacao := 'T';

      qrySelecaoConferencia.next;
    end;

    qrySelecaoConferencia.GotoBookmark(vRegistroAtual);

    while (vTipo = qrySelecaoConferenciatipo.AsString) and
          (vDocumentoPesquisa = qrySelecaoConferenciadocumentopesquisa.AsString) and
          not qrySelecaoConferencia.Eof do
    begin
      qrySelecaoConferencia.Edit;
      qrySelecaoConferenciasituacao.AsString := vSituacao;
      qrySelecaoConferencia.post;
      qrySelecaoConferencia.next;
    end;

  end;

begin
  qrySelecaoConferencia.First;
  while not qrySelecaoConferencia.Eof do
  begin
    vTipo := qrySelecaoConferenciatipo.AsString;
    vDocumentoPesquisa := qrySelecaoConferenciadocumentopesquisa.AsString;
    vRegistroAtual := qrySelecaoConferencia.GetBookmark;
    vsituacao := '';
    VerificarSituacao;
  end;
end;

procedure TdtmRelatorioProdutosConferidos.qrySelecaoConferenciaFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qrySelecaoConferencia.Filtered then
  begin
    Accept := (fSituacaoNaoConferidos and (qrySelecaoConferenciasituacao.AsString = 'N')) or
              (fSituacaoParcialmenteConferidos and (qrySelecaoConferenciasituacao.AsString = 'P')) or
              (fSituacaoTotalmenteConferidos and (qrySelecaoConferenciasituacao.AsString = 'T')) ;

  end;
end;

procedure TdtmRelatorioProdutosConferidos.frpRelatorioProdutosConferidosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioProdutosConferidos, View);
end;

end.
