unit dmcadastrocodigosfiscais;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery, dmtecsoft, cpdatasource,
  ctconstantes, biblio, ZTransact;

type
  TdtmCadastroCodigosFiscais = class(TdtmBasico)
    qryCodigosFiscais: TtecQuery;
    qryCodigosFiscaiscodigo: TIntegerField;
    qryCodigosFiscaisdescricao: TStringField;
    qryCodigosFiscaisdetalhes: TStringField;
    qryCodigosFiscaisdebitoconta: TIntegerField;
    qryCodigosFiscaiscreditoconta: TIntegerField;
    qryCodigosFiscaistipo: TStringField;
    qryCodigosFiscaisvalidoate: TDateField;
    qryCodigosFiscaisvalidoapos: TDateField;
    qryCodigosFiscaisbasefaturamento: TBooleanField;
    qryCodigosFiscaisbasepis: TBooleanField;
    qryCodigosFiscaisbasecofins: TBooleanField;
    qryCodigosFiscaisbasecssl: TBooleanField;
    dsrCodigosFiscais: TtecDataSource;
    qryConsultaCodigosFiscais: TtecQuery;
    qryConsultaCodigosFiscaisdescricao: TStringField;
    qryConsultaCodigosFiscaiscodigo: TIntegerField;
    dsrConsultaCodigosFiscais: TtecDataSource;
    qryConsultaHistorico: TtecQuery;
    qryConsultaHistoricodescricao: TStringField;
    qryConsultaHistoricocodigo: TIntegerField;
    dsrConsultaHistorico: TtecDataSource;
    qryProcuraHistorico: TtecQuery;
    qryProcuraHistoricocodigo: TIntegerField;
    qryProcuraHistoricodescricao: TStringField;
    dsrProcuraHistorico: TtecDataSource;
    qryProcuraDebitar: TtecQuery;
    qryProcuraDebitarcodigo: TIntegerField;
    qryProcuraDebitarclassificacao: TStringField;
    qryProcuraDebitardescricao: TStringField;
    dsrProcuraDebitar: TtecDataSource;
    qryProcuraCreditar: TtecQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsrProcuraCreditar: TtecDataSource;
    qryConsultaContaContabil: TtecQuery;
    qryConsultaContaContabildescricaoedentada: TStringField;
    qryConsultaContaContabildescricao: TStringField;
    qryConsultaContaContabilclassificacao: TStringField;
    qryConsultaContaContabilcodigo: TIntegerField;
    qryConsultaContaContabiltipo: TStringField;
    qryCodigosFiscaishistorico: TIntegerField;
    qryCodigosFiscaisdestacaripi: TBooleanField;
    qryCodigosFiscaisdevolucaoretorno: TBooleanField;
    qryUpdateCodigosFiscais: TtecQuery;
    qryCodigosFiscaisexigenotareferenciada: TBooleanField;
    qryCodigosFiscaisst: TBooleanField;
    qryCodigosFiscaisvendasoucompras: TBooleanField;
    qryCodigosFiscaisoutrassaidas: TBooleanField;
    qryCodigosFiscaisusoouconsumo: TBooleanField;
    procedure qryCodigosFiscaisNewRecord(DataSet: TDataSet);
  protected
    function GetTabelaCodigosFiscais: TtecQuery;
    function GetTabelaConsultaCodigoFiscal: TtecQuery;
    function GetTabelaConsultaHistorico: TtecQuery;
  public
    constructor Create(AOwner: TComponent); override;
    function  ExcluirCodigoFiscal: Boolean;
    function  ExisteCodigosFiscais(campo, codigo: string): boolean;
    function  ExisteHistorico(campo, codigo: string): boolean;
    function  GravarCodigoFiscal : Boolean;
    function  IncluirCodigoFiscal: Boolean;
    property  TabelaCodigosFiscais : TtecQuery read GetTabelaCodigosFiscais;
    property  TabelaConsultaCodigoFiscal : TtecQuery read GetTabelaConsultaCodigoFiscal;
    property  TabelaConsultaHistorico    : TtecQuery read GetTabelaConsultaHistorico;
    procedure AbrirTabelasConsulta(TipoPesquisa: TtecCadastroCodigosFiscais);
    procedure FecharTabelasConsulta(TipoPesquisa: TtecCadastroCodigosFiscais);
    procedure Selecionar(TipoPesquisa: TtecCadastroCodigosFiscais);
    function ExisteContaContabil(campo, codigo: String): Boolean;

  end;

var
  dtmCadastroCodigosFiscais: TdtmCadastroCodigosFiscais;

implementation

{$R *.dfm}

{ TdtmCadastroCodigosFiscais }

procedure TdtmCadastroCodigosFiscais.AbrirTabelasConsulta(
  TipoPesquisa: TtecCadastroCodigosFiscais);
begin
  case TipoPesquisa of
    cfDEBITO : begin
                 if qryCodigosFiscaiscreditoconta.AsInteger<>0 then
                   qryConsultaContaContabil.MacroByName('consulta').AsString :=
                     'and codigo <> '+qryCodigosFiscaiscreditoconta.AsString;
                 Abre(ctConsultaContaContabil);
               end;
    cfCREDITO : begin
                  if qryCodigosFiscaisdebitoconta.AsInteger<>0 then
                    qryConsultaContaContabil.MacroByName('consulta').AsString :=
                      'and codigo <> '+qryCodigosFiscaisdebitoconta.AsString;
                  Abre(ctConsultaContaContabil);
                end;
    cfHISTORICO : abre(ctConsultaHistoricos);
    cfNENHUMA: Abre(ctConsultaCodigosFiscais);
  end;

end;

constructor TdtmCadastroCodigosFiscais.Create(AOwner: TComponent);
begin
  inherited;
  qryCodigosFiscais.Tag          := ctCadastroCodigoFiscal;
  qryConsultaCodigosFiscais.Tag  := ctConsultaCodigosFiscais;
  qryConsultaHistorico.Tag       := ctConsultaHistoricos;
  qryConsultaContaContabil.Tag   := ctConsultaContaContabil;
  qryProcuraDebitar.Params[1].AsInteger := 0;
  qryProcuraCreditar.Params[1].AsInteger := 0;
end;

function TdtmCadastroCodigosFiscais.ExcluirCodigoFiscal: Boolean;
begin
  qryCodigosFiscais.Delete;
  Perpetrar([qryCodigosFiscais]);
  Result := True;
end;

function TdtmCadastroCodigosFiscais.ExisteCodigosFiscais(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaCodigosFiscais, campo, codigo);
end;

function TdtmCadastroCodigosFiscais.ExisteContaContabil(campo,
  codigo: String): Boolean;
begin
  if campo = 'descricaoedentada' then
    Result:= ExisteCodigo(qryConsultaContaContabil, 'descricao', codigo)
  else
    Result:= ExisteCodigo(qryConsultaContaContabil, campo, codigo);
end;

function TdtmCadastroCodigosFiscais.ExisteHistorico(campo,codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaHistorico, campo, codigo);
end;

procedure TdtmCadastroCodigosFiscais.FecharTabelasConsulta(
  TipoPesquisa: TtecCadastroCodigosFiscais);
begin
  case TipoPesquisa of
    cfDEBITO, cfCREDITO : Fecha(ctConsultaContaContabil);
    cfHISTORICO : Fecha(ctConsultaHistoricos);
    cfNENHUMA: Fecha(ctConsultaCodigosFiscais);
  end;
end;

function TdtmCadastroCodigosFiscais.GetTabelaCodigosFiscais: TtecQuery;
begin
  Result := qryCodigosFiscais
end;

function TdtmCadastroCodigosFiscais.GetTabelaConsultaCodigoFiscal: TtecQuery;
begin
  Result := qryConsultaCodigosFiscais
end;

function TdtmCadastroCodigosFiscais.GetTabelaConsultaHistorico: TtecQuery;
begin
  Result := qryConsultaHistorico
end;

function TdtmCadastroCodigosFiscais.GravarCodigoFiscal: Boolean;
begin
  if qryCodigosFiscais.CheckRequiredFields then
  begin
    qryCodigosFiscais.Post;
    result := Perpetrar([qryCodigosFiscais]);    if result then    begin      qryUpdateCodigosFiscais.paramByName('devolucaoretorno').asBoolean := qrycodigosfiscaisdevolucaoretorno.asBoolean;      qryUpdateCodigosFiscais.paramByName('codigofiscal').asinteger := qrycodigosfiscaiscodigo.asinteger;      qryUpdateCodigosFiscais.execSQL;      result := Perpetrar([]);    end;  end else    Result := False
end;

function TdtmCadastroCodigosFiscais.IncluirCodigoFiscal: Boolean;
begin
  qryCodigosFiscais.Insert;
  Result := True;
end;

procedure TdtmCadastroCodigosFiscais.qryCodigosFiscaisNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryCodigosFiscaistipo.AsString := 'A';
  qryCodigosFiscaisdestacaripi.AsBoolean := false;
  qryCodigosFiscaisdevolucaoretorno.asboolean := false;
end;


procedure TdtmCadastroCodigosFiscais.Selecionar(
  TipoPesquisa: TtecCadastroCodigosFiscais);
begin
  case TipoPesquisa of
    cfDEBITO : begin
                  if qryConsultaContaContabiltipo.AsString<>'S' then
                    begin
                      if not (qryCodigosFiscais.state in [dsinsert, dsedit]) then
                        qryCodigosFiscais.Edit;
                      qryCodigosFiscaisdebitoconta.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                    end
                    else
                    begin
                      if not qryCodigosFiscaisdebitoconta.IsNull then
                      begin
                        if not (qryCodigosFiscais.state in [dsinsert, dsedit]) then
                          qryCodigosFiscais.Edit;
                        qryCodigosFiscaisdebitoconta.Clear;
                      end;
                    end
                  end;
    cfCREDITO : begin
                  if qryConsultaContaContabiltipo.AsString<>'S' then
                    begin
                      if not (qryCodigosFiscais.state in [dsinsert, dsedit]) then
                        qryCodigosFiscais.Edit;
                      qryCodigosFiscaiscreditoconta.AsInteger := qryConsultaContaContabilcodigo.AsInteger
                    end
                    else
                    begin
                      if not qryCodigosFiscaiscreditoconta.IsNull then
                      begin
                        if not (qryCodigosFiscais.state in [dsinsert, dsedit]) then
                          qryCodigosFiscais.Edit;
                        qryCodigosFiscaiscreditoconta.Clear;
                      end;
                    end
                  end;
    cfHISTORICO   : begin
                       if not (qryCodigosFiscais.state in [dsinsert, dsedit]) then
                          qryCodigosFiscais.Edit;
                       qryCodigosFiscaishistorico.AsInteger := qryConsultaHistoricocodigo.AsInteger
                      end;
    cfNENHUMA: RefazConsulta(qryCodigosFiscais, [0], [qryConsultaCodigosFiscaiscodigo.asInteger]);
  end;
end;

end.

