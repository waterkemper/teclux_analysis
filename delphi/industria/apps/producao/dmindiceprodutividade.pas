unit dmindiceprodutividade;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, biblio, ctconstantes, ExcelExport, ZTransact;

type


  TpConsultaProdutividade = (tpEFICIENCIA_POR_OPERACAO_DE_OSP,
  tpPREMIACAO_DE_FUNCIONARIOS_POR_SETOR,
  tpPREMIACAO_DE_FUNCIONARIOS_PONDERADA,
  tpPREMIACAO_DE_LIDERES);


type
  TdtmIndiceProdutividade = class(TdtmBasico)
    qryIndiceProdutividade: TtecQuery;
    dsrIndiceProdutividade: TtecDataSource;
    ExcelExport1: TExcelExport;
    qryEficienciaporOperacaodeOSP: TtecQuery;

    qryPremiacaoFuncionariosSetor: TtecQuery;
    qryPremiacaoLideres: TtecQuery;
    qryPremiacaoFuncionariosPonderada: TtecQuery;
    qryEficienciaporOperacaodeOSPsetorproducao: TStringField;
    qryEficienciaporOperacaodeOSPdescricaosetor: TStringField;
    qryEficienciaporOperacaodeOSPusuario: TIntegerField;
    qryEficienciaporOperacaodeOSPnomeusuario: TStringField;
    qryEficienciaporOperacaodeOSPosp: TIntegerField;
    qryEficienciaporOperacaodeOSPlote: TIntegerField;
    qryEficienciaporOperacaodeOSPnomeoperacao: TStringField;
    qryEficienciaporOperacaodeOSPc01: TStringField;
    qryEficienciaporOperacaodeOSPc02: TStringField;
    qryEficienciaporOperacaodeOSPc03: TStringField;
    qryEficienciaporOperacaodeOSPtempopadrao: TFloatField;
    qryEficienciaporOperacaodeOSPquantidade: TIntegerField;
    qryEficienciaporOperacaodeOSPtempo: TIntegerField;
    qryEficienciaporOperacaodeOSPeficiencia: TFloatField;
    qryEficienciaporOperacaodeOSPqualidade: TFloatField;
    qryEficienciaporOperacaodeOSPperda: TLargeintField;
    qryPremiacaoFuncionariosSetorsetorproducao: TStringField;
    qryPremiacaoFuncionariosSetorusuario: TIntegerField;
    qryPremiacaoFuncionariosSetornomeusuario: TStringField;
    qryPremiacaoFuncionariosSetoreficienciausuario: TFloatField;
    qryPremiacaoFuncionariosSetorpremiousuario: TFloatField;
    qryPremiacaoFuncionariosSetoreficienciasetor: TFloatField;
    qryPremiacaoFuncionariosSetorpremiosetor: TFloatField;
    qryPremiacaoFuncionariosSetorpremiototal: TFloatField;
    qryPremiacaoFuncionariosPonderadausuario: TIntegerField;
    qryPremiacaoFuncionariosPonderadanomeusuario: TStringField;
    qryPremiacaoFuncionariosPonderadapremio: TFloatField;
    qryPremiacaoLideresusuario: TIntegerField;
    qryPremiacaoLideressetorproducao: TStringField;
    qryPremiacaoLidereseficienciasetor: TFloatField;
    qryPremiacaoLideresvalorpremio: TFloatField;
    qryPremiacaoLideresmediaeficiencia: TFloatField;
    qryPremiacaoLideresvalorpremiolider: TFloatField;
    qryPremiacaoLideresnomeusuario: TStringField;
    qryEficienciaporOperacaodeOSPdata: TDateField;
    qryEficienciaporOperacaodeOSPpn: TStringField;
    procedure qryIndiceProdutividadeAfterOpen(DataSet: TDataSet);
  private
    fTipoConsultaProdutividade: TpConsultaProdutividade;
    { Private declarations }
  public
    { Public declarations }
    property TipoConsultaProdutividade: TpConsultaProdutividade read fTipoConsultaProdutividade write fTipoConsultaProdutividade;
    function AbrirConsulta(DataInicial, DataFinal, ListaSetoresProducao, ListaFuncionarios: String): boolean;
    procedure ExportarExcell;
  end;

var
  dtmIndiceProdutividade: TdtmIndiceProdutividade;

implementation

{$R *.dfm}

{ TdtmIndiceProdutividade }

function TdtmIndiceProdutividade.AbrirConsulta(DataInicial, DataFinal,
  ListaSetoresProducao, ListaFuncionarios: String): boolean;
var
 vLider : string;
 vMediaEficiencia : Currency;
 vMaiorValorPremio : Currency;
 vNumero: integer;
 vFinalArquivo : Boolean;

begin
  case TipoConsultaProdutividade of
    tpEFICIENCIA_POR_OPERACAO_DE_OSP       : qryIndiceProdutividade.sql.Text := qryEficienciaporOperacaodeOSP.sql.text;
    tpPREMIACAO_DE_FUNCIONARIOS_POR_SETOR  : qryIndiceProdutividade.sql.Text := qryPremiacaoFuncionariosSetor.sql.text;
    tpPREMIACAO_DE_FUNCIONARIOS_PONDERADA  : qryIndiceProdutividade.sql.Text := qryPremiacaoFuncionariosPonderada.sql.text;
    tpPREMIACAO_DE_LIDERES                 : qryIndiceProdutividade.sql.Text := qryPremiacaoLideres.sql.text;
  end;

//  qryIndiceProdutividade.ParamByName('SemFalhaNaoInfluiPremiacao').AsBoolean := SemFalhaNaoInfluiPremiacao;

  if (DataInicial<>'') and (DataFinal<>'') then
  begin
    qryIndiceProdutividade.MacroByName('FiltroPeriodo').AsString := 'and oou.data between :datainicial and :datafinal';

    qryIndiceProdutividade.ParamByName('datainicial').AsDateTime := StrToDateTime(datainicial);
    qryIndiceProdutividade.ParamByName('datafinal').  AsDateTime := StrToDateTime(DataFinal);
  end
  else
  if (DataInicial<>'') and (DataFinal='') then
  begin
    qryIndiceProdutividade.MacroByName('FiltroPeriodo').AsString := 'and oou.data >= :datainicial';
    qryIndiceProdutividade.ParamByName('datainicial').asdatetime := StrToDateTime(datainicial);
  end
  else
  if (DataInicial='') and (DataFinal<>'') then
  begin
    qryIndiceProdutividade.MacroByName('FiltroPeriodo').AsString := 'and oou.data <= :datafinal';
    qryIndiceProdutividade.ParamByName('datafinal').asdatetime := StrToDateTime(DataFinal);
  end
  else
  if (DataInicial='') and (DataFinal='') then
    qryIndiceProdutividade.MacroByName('FiltroPeriodo').AsString := '';

  if ListaSetoresProducao <> '' then
    qryIndiceProdutividade.MacroByName('FiltroSetoresProducao').AsString := 'and m.setorproducao in ('+ListaSetoresProducao+')'
  else
    qryIndiceProdutividade.MacroByName('FiltroSetoresProducao').AsString := '';

  if ListaFuncionarios <> '' then
  begin
    if TipoConsultaProdutividade <> tpPREMIACAO_DE_LIDERES then
      qryIndiceProdutividade.MacroByName('FiltroFuncionarios').AsString := 'and oou.usuario in ('+ListaFuncionarios+')';
  end
  else
  begin
    if TipoConsultaProdutividade <> tpPREMIACAO_DE_LIDERES then
      qryIndiceProdutividade.MacroByName('FiltroFuncionarios').AsString := '';

  end;

  qryIndiceProdutividade.Close;
  qryIndiceProdutividade.Open;

  if TipoConsultaProdutividade = tpPREMIACAO_DE_LIDERES then
  begin
    qryIndiceProdutividade.first;
    vlider := qryIndiceProdutividade.fieldbyname('usuario').asstring;
    vnumero := 0;
    vMaiorValorPremio := 0;
    if qryIndiceProdutividade.recordcount<>0 then
    begin
      while true do
      begin
        if (vlider <> qryIndiceProdutividade.fieldbyname('usuario').asstring) or
           qryIndiceProdutividade.Eof then
        begin
          vfinalArquivo := qryIndiceProdutividade.Eof;
          guardarRegistroAtual(qryIndiceProdutividade,true);

          qryIndiceProdutividade.first;
          while not qryIndiceProdutividade.eof do
          begin
            if vlider = qryIndiceProdutividade.fieldbyname('usuario').asstring then
            begin
              qryIndiceProdutividade.edit;
              qryIndiceProdutividade.fieldbyname('mediaeficiencia').ascurrency :=  vMediaEficiencia / vnumero;
              qryIndiceProdutividade.fieldbyname('valorpremiolider').ascurrency := vMaiorValorPremio * qryIndiceProdutividade.fieldbyname('mediaeficiencia').ascurrency / 100;
              qryIndiceProdutividade.post;
            end;
            qryIndiceProdutividade.next;
          end;

          voltarRegistroAtual(qryIndiceProdutividade);
          if vFinalArquivo then
            break
          else
          begin
            vlider := qryIndiceProdutividade.fieldbyname('usuario').asstring;
            vnumero := 0;
            vMaiorValorPremio := 0;
            vMediaEficiencia := 0;
          end;
        end
        else
        begin
          if qryIndiceProdutividade.fieldbyname('valorpremio').ascurrency > vMaiorValorPremio then
            vMaiorValorPremio := qryIndiceProdutividade.fieldbyname('valorpremio').ascurrency;

          vMediaEficiencia := vMediaEficiencia + qryIndiceProdutividade.fieldbyname('eficienciasetor').ascurrency;
          inc(vnumero);
          qryIndiceProdutividade.next;
        end;
      end;  
    end;
  end;

  

  if qryIndiceProdutividade.IsEmpty then
  begin
    result := false;
    MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
  end
  else
    result := true
end;

procedure TdtmIndiceProdutividade.ExportarExcell;
begin
  GuardarRegistroAtual(qryIndiceProdutividade,true);
  ExcelExport1.ExportDataset;
  VoltarRegistroAtual(qryIndiceProdutividade);
end;

procedure TdtmIndiceProdutividade.qryIndiceProdutividadeAfterOpen(
  DataSet: TDataSet);
var
 i: integer;
 vTabela : TtecQuery;
begin
  inherited;
  case TipoConsultaProdutividade of
    tpEFICIENCIA_POR_OPERACAO_DE_OSP       : vTabela := qryEficienciaporOperacaodeOSP;
    tpPREMIACAO_DE_FUNCIONARIOS_POR_SETOR  : vTabela := qryPremiacaoFuncionariosSetor;
    tpPREMIACAO_DE_FUNCIONARIOS_PONDERADA  : vTabela := qryPremiacaoFuncionariosPonderada;
    tpPREMIACAO_DE_LIDERES                 : vTabela := qryPremiacaoLideres;
  end;

  for i:=0 to vTabela.FieldCount - 1 do
  begin
    qryIndiceProdutividade.Fields[i].DisplayWidth := vTabela.fields[i].DisplayWidth;
    qryIndiceProdutividade.Fields[i].DisplayLabel := vTabela.fields[i].DisplayLabel;
    qryIndiceProdutividade.Fields[i].Alignment    := vTabela.fields[i].Alignment;

    case qryIndiceProdutividade.Fields[i].DataType of
         ftInteger:  TIntegerField (qryIndiceProdutividade.Fields[i]).DisplayFormat:= TIntegerField (vTabela.fields[i]).DisplayFormat;
         ftLargeint: TLargeIntField(qryIndiceProdutividade.Fields[i]).DisplayFormat:= TLargeIntField(vTabela.fields[i]).DisplayFormat;
         ftFloat:    TFloatField   (qryIndiceProdutividade.Fields[i]).DisplayFormat:= TFloatField   (vTabela.fields[i]).DisplayFormat;
     end;
  end;

end;

end.
