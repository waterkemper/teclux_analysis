unit dmConsultaLicitacoes;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery;

type
  TdtmConsultaLicitacoes = class(TdtmBasico)
    qryConsultaLicitacoes: TtecQuery;
    dsrConsultaLicitacoes: TtecDataSource;
    qryConsultaLicitacoesnumero: TIntegerField;
    qryConsultaLicitacoescliente: TIntegerField;
    qryConsultaLicitacoesnomecliente: TStringField;
    qryConsultaLicitacoesufcliente: TStringField;
    qryConsultaLicitacoesvendedor: TIntegerField;
    qryConsultaLicitacoesnomevendedor: TStringField;
    qryConsultaLicitacoesdatavenda: TDateField;
    qryConsultaLicitacoesvigencia: TDateField;
    qryConsultaLicitacoesprodutovisual: TStringField;
    qryConsultaLicitacoesprodutodescricao: TStringField;
    qryConsultaLicitacoesquantidade: TFloatField;
    qryConsultaLicitacoespreco: TFloatField;
    qryConsultaLicitacoestotalproduto: TFloatField;
    qryConsultaLicitacoesquantidadenotafiscal: TFloatField;
    qryConsultaLicitacoestotalprodutoentregue: TFloatField;
    qryConsultaLicitacoesquantidadependente: TFloatField;
    qryConsultaLicitacoestotalprodutopendente: TFloatField;
    qryConsultaLicitacoessituacao_licitacao: TStringField;
    qryConsultaLicitacoesaliquotaipi: TFloatField;
    qryConsultaLicitacoesvaloripi: TFloatField;
    qryConsultaLicitacoesvalordesconto: TFloatField;
    procedure qryConsultaLicitacoesAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GerarConsulta(DataInicialVenda,
                            DataFinalVenda,
                            DataInicialVigencia,
                            DataFinalVigencia: String;

                            LicitacaoAberta,
                            LicitacaoFinalizada,
                            LicitacaoCancelada,
                            LicitacaoExpirada : Boolean;

                            ListaCondicoesVendedores,
                            ListaCondicoesProdutos,
                            ListaCondicoesClientes: String);


  end;

var
  dtmConsultaLicitacoes: TdtmConsultaLicitacoes;

implementation

uses fmConsultaLicitacoes;

{$R *.dfm}

{ TdtmConsultaLicitacoes }


{ TdtmConsultaLicitacoes }

procedure TdtmConsultaLicitacoes.GerarConsulta(DataInicialVenda,
  DataFinalVenda, DataInicialVigencia, DataFinalVigencia: String;
  LicitacaoAberta,
  LicitacaoFinalizada,
  LicitacaoCancelada,
  LicitacaoExpirada : Boolean;
  ListaCondicoesVendedores, ListaCondicoesProdutos,
  ListaCondicoesClientes: String);

VAR
  vSituacaoLicitacao : String;
begin

  vSituacaoLicitacao := '';
  if LicitacaoAberta then
    vSituacaoLicitacao := quotedstr('ABERTO')+',';

  if LicitacaoFinalizada then
    vSituacaoLicitacao := vSituacaoLicitacao + quotedstr('FINALIZADO')+',';

  if LicitacaoCancelada then
    vSituacaoLicitacao := vSituacaoLicitacao + quotedstr('CANCELADO')+',';

  if LicitacaoExpirada then
    vSituacaoLicitacao := vSituacaoLicitacao + quotedstr('EXPIRADO')+',';

  if vSituacaoLicitacao<>'' then
  begin
    delete(vSituacaoLicitacao,length(vSituacaoLicitacao),1);

    qryConsultaLicitacoes.MacroByName('SituacaoLicitacao').asString :=
      'and situacao_licitacao(l.numero) in ('+vSituacaoLicitacao+')';

  end
  else
    qryConsultaLicitacoes.MacroByName('SituacaoLicitacao').asString := '';

  qryConsultaLicitacoes.Parambyname('DataInicialVenda').asString := DataInicialVenda;
  qryConsultaLicitacoes.Parambyname('DataFinalVenda').asString := DataFinalVenda;
  qryConsultaLicitacoes.Parambyname('DataInicialVigencia').asString := DataInicialVigencia;
  qryConsultaLicitacoes.Parambyname('DataFinalVigencia').asString := DataFinalVigencia;

  qryConsultaLicitacoes.MacrobyName('ListaCondicoesVendedores').asString := '';
  if ListaCondicoesVendedores<>'' then
    qryConsultaLicitacoes.MacrobyName('ListaCondicoesVendedores').asString := ' and ( '+ListaCondicoesVendedores+')';

  qryConsultaLicitacoes.MacrobyName('ListaCondicoesProdutos').asString := '';
  if ListaCondicoesProdutos<>'' then
    qryConsultaLicitacoes.MacrobyName('ListaCondicoesProdutos').asString := ' and ( '+ListaCondicoesProdutos+')';

  qryConsultaLicitacoes.MacrobyName('ListaCondicoesClientes').asString := '';
  if ListaCondicoesClientes<>'' then
    qryConsultaLicitacoes.MacrobyName('ListaCondicoesClientes').asString := ' and ( '+ StringReplace(ListaCondicoesClientes, 'vf.', 'cl.', [rfReplaceAll]) + ')';

  qryConsultaLicitacoes.close;
  qryConsultaLicitacoes.open;


end;

procedure TdtmConsultaLicitacoes.qryConsultaLicitacoesAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TfrmConsultaLicitacoes(self.owner).CalcularTotaisConsultaLicitacoes;
end;

end.
