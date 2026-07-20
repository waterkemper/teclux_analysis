unit dmautorizacaopagamento;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, ctconstantes, biblio, clusuario, ZTransact, FR_Class, FR_DSet,
  FR_DBSet, fmpreviewpadrao, dmimprimeautorizacaopagto;

type
  TdtmAutorizacaoPagamento = class(TdtmBasico)
    qryFilial: TtecQuery;
    qryFilialcodigo: TIntegerField;
    qryFilialnome: TStringField;
    dsrFilial: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryGrupoFiliais: TtecQuery;
    qryGrupoFiliaiscodigo: TIntegerField;
    qryGrupoFiliaisdescricao: TStringField;
    dsrGrupoFiliais: TtecDataSource;
    qryConsultaGrupoFiliais: TtecQuery;
    qryConsultaGrupoFiliaisdescricao: TStringField;
    qryConsultaGrupoFiliaiscodigo: TIntegerField;
    qryFornecedores: TtecQuery;
    qryFornecedorescodigo: TIntegerField;
    qryFornecedoresnome: TStringField;
    qryFornecedorestipo: TStringField;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaFornecedoresnome: TStringField;
    qryConsultaFornecedorescodigo: TIntegerField;
    qryConsultaFornecedorestipo: TStringField;
    qryDuplicatas: TtecQuery;
    dsrDuplicatas: TtecDataSource;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatasvalordesconto: TFloatField;
    qryDuplicatastipojuros: TStringField;
    qryDuplicatasjuros: TFloatField;
    qryDuplicatastipomulta: TStringField;
    qryDuplicatasmulta: TFloatField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatasprevisao: TFloatField;
    qryDuplicatasfornecedor: TIntegerField;
    qryDuplicatastipofornecedor: TStringField;
    qryDuplicatasautorizado: TBooleanField;
    qryDuplicatasselecionar: TBooleanField;
    qryConsultaFornecedorespessoanumero: TStringField;
    qryConsultaFornecedorestipocliente: TStringField;
    qryConsultaFornecedoresestado: TStringField;
    qryConsultaFornecedoresnomecidade: TStringField;
    qryDuplicatasfilialemissao: TIntegerField;
    qryDuplicatasdescricaofilialemissao: TStringField;
    qryDuplicatasrua: TStringField;
    qryDuplicatasnomebairro: TStringField;
    qryDuplicatascep: TIntegerField;
    qryDuplicatasnomecidade: TStringField;
    qryDuplicatasestado: TStringField;
    qryDuplicatasemissao: TDateField;
    qryDuplicatasdatalancto: TDateField;
    qryDuplicatasvalornota: TFloatField;
    qryDuplicatasreferencia: TStringField;
    qryDuplicatasordem: TStringField;
    qryDuplicatascomplemento: TStringField;
    qryDuplicatasnome: TStringField;
    qryDuplicatasdataautorizacaopagto: TDateField;
    qryDuplicatasobservacao: TStringField;
    procedure qryFornecedoresBeforeOpen(DataSet: TDataSet);
    procedure qryDuplicatasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryDuplicatasBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FOperacao: integer;
    FAutorizacaoInicial: String;
    FAutorizacaoFinal: String;
    procedure SetAutorizacaoFinal(const Value: String);
    procedure SetAutorizacaoInicial(const Value: String);
    procedure SetOperacao(const Value: integer);
//    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  protected
    Usuario: TtecUsuarios;
    FLanctoFinal: String;
    FLanctoInicial: String;
    FVenctoInicial: String;
    FVenctoFinal: String;
    function GetTipoPessoa: String;
    function GetQtdeDuplicatas: Integer;
    function GetTotalDuplicatas: Real;
    procedure MontaDataLancamento;
    procedure MontaDataVencimento;
    procedure MontaDataAutorizacao;
    procedure SetFilial(const Value: String);
    procedure SetFornecedor(const Value: String);
    procedure SetGrupo(const Value: String);
    procedure SetLanctoFinal(const Value: String);
    procedure SetLanctoInicial(const Value: String);
    procedure SetVenctoFinal(const Value: String);
    procedure SetVenctoInicial(const Value: String);
    function  GetConsultaFiliais: TtecQuery;
    function  GetConsultaFornecedores: TtecQuery;
    function  GetConsultaGrupoFiliais: TtecQuery;
  public
    function ExisteFiliais(Campo, Codigo: string): Boolean;
    function ExisteGrupoFiliais(Campo, Codigo: String): Boolean;
    function ExisteFornecedores(Campo, Codigo: String): Boolean;
    function SelecionarDuplicatas: Boolean;
    procedure MarcarRegistrosSelecionados(Marcando, Todos: Boolean);
    procedure FecharTabelaDuplicatas;
    procedure AutorizarPagamentos(Imprimir: Boolean);
    constructor Create(AOwner: TComponent); Override;
    procedure AbreTabelaPesquisa(TipoPesquisa: TtecAutorizacaoDuplicatas);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecAutorizacaoDuplicatas);
    procedure Selecionar(TipoPesquisa: TtecAutorizacaoDuplicatas);
    property ConsultaFiliais: TtecQuery read GetConsultaFiliais;
    property ConsultaGrupoFiliais: TtecQuery read GetConsultaGrupoFiliais;
    property ConsultaFornecedores: TtecQuery read GetConsultaFornecedores;
    property LanctoInicial: String read FLanctoInicial write SetLanctoInicial;
    property LanctoFinal: String read FLanctoFinal write SetLanctoFinal;
    property VenctoInicial: String read FVenctoInicial write SetVenctoInicial;
    property VenctoFinal: String read FVenctoFinal write SetVenctoFinal;
    property AutorizacaoInicial: String read FAutorizacaoInicial write SetAutorizacaoInicial;
    property AutorizacaoFinal: String read FAutorizacaoFinal write SetAutorizacaoFinal;
    property Filial: String write SetFilial;
    property Grupo: String write SetGrupo;
    property Fornecedor: String write SetFornecedor;
    property TipoPessoa: String read GetTipoPessoa;
    property QtdeDuplicatas: Integer read GetQtdeDuplicatas;
    property TotalDuplicatas: Real read GetTotalDuplicatas;
    property Operacao: integer read FOperacao write SetOperacao;
  end;

var
  dtmAutorizacaoPagamento: TdtmAutorizacaoPagamento;

implementation

{$R *.dfm}

{ TdtmAutorizacaoPagamento }

procedure TdtmAutorizacaoPagamento.AbreTabelaPesquisa(TipoPesquisa: TtecAutorizacaoDuplicatas);
begin
  case TipoPesquisa of
    audFILIAIS      : Abre(ctConsultaFiliais);
    audGRUPOSFILIAIS: Abre(ctConsultaGruposFiliais);
     audFORNECEDORES: begin
                         qryConsultaFornecedores.Sql[08]:= 'Where (v.codigo = 0)';
                         Abre(ctConsultaFornecedores);
                       end;
  end;
end;

constructor TdtmAutorizacaoPagamento.Create(AOwner: TComponent);
begin
  inherited;
  qryFilial.Tag                := ctTabelas;
  qryGrupoFiliais.Tag          := ctTabelas;
  qryFornecedores.Tag          := ctTabelas;

  qryConsultaFiliais.Tag       := ctConsultaFiliais;
  qryConsultaGrupoFiliais.Tag  := ctConsultaGruposFiliais;
  qryConsultaFornecedores.Tag  := ctConsultaFornecedores;
  qryFornecedores.params[0].AsString := 'F';
end;

function TdtmAutorizacaoPagamento.ExisteFiliais(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmAutorizacaoPagamento.ExisteFornecedores(Campo, Codigo: String): Boolean;
const
  SQL = 'Where (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if Campo = 'nomecidade' then
    Campo:= 'c.nome'
  else if Campo = 'tipocliente' then
    Campo:= 'v.tipo'
  else
    Campo:= 'v.' + Campo;  
  qryConsultaFornecedores.Sql[08] := Format(SQL, [Campo, Codigo, '%']);
  qryConsultaFornecedores.Open;
  Result := qryConsultaFornecedores.RecordCount > 0
end;

function TdtmAutorizacaoPagamento.ExisteGrupoFiliais(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupoFiliais, Campo, Codigo);
end;

procedure TdtmAutorizacaoPagamento.FechaTabelaPesquisa(TipoPesquisa: TtecAutorizacaoDuplicatas);
begin
  case TipoPesquisa of
    audFILIAIS      : Fecha(ctConsultaFiliais);
    audGRUPOSFILIAIS: Fecha(ctConsultaGruposFiliais);
    audFORNECEDORES : Fecha(ctConsultaFornecedores);
  end;
end;

function TdtmAutorizacaoPagamento.GetConsultaFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmAutorizacaoPagamento.GetConsultaFornecedores: TtecQuery;
begin
  Result:= qryConsultaFornecedores;
end;

function TdtmAutorizacaoPagamento.GetConsultaGrupoFiliais: TtecQuery;
begin
  Result:= qryConsultaGrupoFiliais;
end;

function TdtmAutorizacaoPagamento.GetQtdeDuplicatas: Integer;
begin
  Result:= qryDuplicatas.RecordCount;
end;

function TdtmAutorizacaoPagamento.GetTipoPessoa: String;
begin
  if qryFornecedorestipo.AsString = '' then
       Result:= 'F'
  else Result:= qryFornecedorestipo.AsString;
end;

function TdtmAutorizacaoPagamento.GetTotalDuplicatas: Real;
begin
  Result:= TotalizarValores[qryDuplicatas, qryDuplicatasprevisao, nil];
end;

procedure TdtmAutorizacaoPagamento.MarcarRegistrosSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryDuplicatas,
                  qryDuplicatasselecionar,
                  qryDuplicatasprevisao,
                  Marcando,
                  Todos);
  if qryduplicatas.Active then
  begin
    if todos then
    begin

      GuardarRegistroAtual(qryDuplicatas, true);
      qryduplicatas.First;
      while not qryduplicatas.Eof do
      begin
        qryDuplicatas.Edit;
        if qryDuplicatasselecionar.AsBoolean then
          qryDuplicatasdataautorizacaopagto.AsDateTime := now
        else
          qryDuplicatasdataautorizacaopagto.clear;
        qryduplicatas.Next;
      end;
      VoltarRegistroAtual(qryDuplicatas);

    end
    else
    begin
      qryDuplicatas.Edit;
      if qryDuplicatasselecionar.AsBoolean then
        qryDuplicatasdataautorizacaopagto.AsDateTime := now
      else
        qryDuplicatasdataautorizacaopagto.clear;
      qryDuplicatas.post;
    end;
  end;  
end;

procedure TdtmAutorizacaoPagamento.MontaDataLancamento;
const
  Data_1: String = 'and (np.emissao = ';
  Data_2: String = 'and (np.emissao between (';
begin
  if not DataEmBranco(FLanctoInicial) then begin
    if DataEmBranco(FLanctoFinal) then
         qryDuplicatas.MacroByName('Lancamento').AsString := Data_1 + '''' + FLanctoInicial + ''')'
    else
         qryDuplicatas.MacroByName('Lancamento').AsString := Data_2 + '''' + FLanctoInicial + ''') and (''' + FLanctoFinal + '''))';
  end
  else begin
    if not DataEmBranco(FLanctoFinal) then
         qryDuplicatas.MacroByName('Lancamento').AsString := Data_1 + '''' + FLanctoFinal + ''')'
    else
         qryDuplicatas.MacroByName('Lancamento').AsString := '';
  end;
end;

procedure TdtmAutorizacaoPagamento.MontaDataVencimento;
const
  Data_1: String = 'and (t.datavencto = ';
  Data_2: String = 'and (t.datavencto between (';
begin
  if not DataEmBranco(FVenctoInicial) then begin
    if DataEmBranco(FVenctoFinal) then
         qryDuplicatas.MacroByName('Vencimento').AsString := Data_1 + '''' + FVenctoInicial + ''')'
    else
         qryDuplicatas.MacroByName('Vencimento').AsString := Data_2 + '''' + FVenctoInicial + ''') and (''' + FVenctoFinal + '''))';
  end
  else begin
    if not DataEmBranco(FVenctoFinal) then
         qryDuplicatas.MacroByName('Vencimento').AsString := Data_1 + '''' + FVenctoFinal + ''')'
    else
         qryDuplicatas.MacroByName('Vencimento').AsString := '';
  end;
end;

procedure TdtmAutorizacaoPagamento.Selecionar(TipoPesquisa: TtecAutorizacaoDuplicatas);
begin
  case TipoPesquisa of
    audFILIAIS      : ReFazConsulta(qryFilial,[0],[qryConsultaFiliaiscodigo.AsInteger]);
    audGRUPOSFILIAIS: ReFazConsulta(qryGrupoFiliais,[0],[qryConsultaGrupoFiliaiscodigo.AsInteger]);
    audFORNECEDORES : ReFazConsulta(qryFornecedores,[0,1],[qryConsultaFornecedorestipo.AsString,
                                                           qryConsultaFornecedorescodigo.AsInteger]);
  end;
end;

function TdtmAutorizacaoPagamento.SelecionarDuplicatas: Boolean;
begin
  if qryDuplicatas.Active then
    qryDuplicatas.Close;
  qryDuplicatas.Open;
  Result:= qryDuplicatas.IsEmpty;
end;

procedure TdtmAutorizacaoPagamento.SetFilial(const Value: String);
begin
  if (Value <> '') then
     qryDuplicatas.MacroByName('Filial').AsString := 'and (d.filialemissao = ' + Value + ')'
  else
     qryDuplicatas.MacroByName('Filial').AsString := '';
end;

procedure TdtmAutorizacaoPagamento.SetFornecedor(const Value: String);
begin
  if (Value <> '') then
       qryDuplicatas.MacroByName('Fornecedor').AsString := 'and (d.fornecedor = ' + Value + ') and ' +
                                            '(d.tipofornecedor = ' + '''' + qryFornecedorestipo.AsString + '''' + ')'
  else
      qryDuplicatas.MacroByName('Fornecedor').AsString := '';
end;

procedure TdtmAutorizacaoPagamento.SetGrupo(const Value: String);
begin
  if (Value <> '') then
       qryDuplicatas.MacroByName('GrupoFilial').AsString := 'and (d.filialemissao in (Select filial From filiaisgruposfiliais Where grupo = ' + Value + '))'
  else
       qryDuplicatas.MacroByName('GrupoFilial').AsString := '';
end;

procedure TdtmAutorizacaoPagamento.SetLanctoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FLanctoFinal := Value
  else FLanctoFinal := '';
  MontaDataLancamento;
end;

procedure TdtmAutorizacaoPagamento.SetLanctoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FLanctoInicial := Value
  else FLanctoInicial := '';
  MontaDataLancamento;
end;

procedure TdtmAutorizacaoPagamento.SetVenctoFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
       FVenctoFinal := Value
  else FVenctoFinal := '';
  MontaDataVencimento;
end;

procedure TdtmAutorizacaoPagamento.SetVenctoInicial(const Value: String);
begin
  if not DataEmBranco(Value) then
       FVenctoInicial := Value
  else FVenctoInicial := '';
  MontaDataVencimento;
end;

procedure TdtmAutorizacaoPagamento.FecharTabelaDuplicatas;
begin
  qryDuplicatas.Close;
end;

procedure TdtmAutorizacaoPagamento.AutorizarPagamentos(Imprimir: Boolean);
var
  Pos: TBookmark;
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  ListadeDuplicatas : String;
begin
  if not assigned(Usuario) then
    Usuario:= TtecUsuarios.Create(dtmTecSoft.Database);

  try
    if UsuarioLogin.Pagamento then
         Usuario:= ObterAutorizacao(taSENHA)
    else Usuario:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOPAGAMENTO, ctAUTORIZADO);

    if Assigned(Usuario) and
       Usuario.Pagamento then begin
      qryDuplicatas.DisableControls;
      qryDuplicatas.First;
      try

        case Operacao of
        {autorizacao}
        0: begin
             while not qryDuplicatas.Eof do
             begin
              if qryDuplicatasselecionar.AsBoolean then begin
                 qryDuplicatas.Edit;
                 qryDuplicatasautorizado.AsBoolean:= True;
                 qryDuplicatasdataautorizacaopagto.AsDateTime := now();
                 qryDuplicatas.Post;
               end;
               qryDuplicatas.Next;
             end;
             Perpetrar([qryDuplicatas]);
           end;

        {cancelamento}
        1: begin
             if not Imprimir then
             begin
               while not qryDuplicatas.Eof do
               begin
                if qryDuplicatasselecionar.AsBoolean then begin
                   qryDuplicatas.Edit;
                   qryDuplicatasautorizado.AsBoolean:= False;
                   qryDuplicatasdataautorizacaopagto.clear;
                   qryDuplicatas.Post;
                 end;
                 qryDuplicatas.Next;
               end;
               Perpetrar([qryDuplicatas]);
             end;
           end;
        end;

        if imprimir then
        begin
          dtmImprimeAutorizacaoPagto := TdtmImprimeAutorizacaoPagto.create(self);

          qryDuplicatas.Filtered := true;
          case operacao of
            0: qryduplicatas.Filter := 'autorizado'; {autorizar}
            1: qryduplicatas.Filter := 'selecionar'; {cancelar}
          end;
          ListadeDuplicatas := '';
          qryduplicatas.First;
          while not qryduplicatas.Eof do
          begin
            ListadeDuplicatas := ListadeDuplicatas +
                                 '('+ qryDuplicatasdocumentopag.AsString + ','
                                    + quotedstr(formatdatetime('yyyy-mm-dd',qryDuplicatasdatavencto.AsDateTime)) + ','
                                    + qryDuplicatasnumero.AsString + '),';
            qryduplicatas.next;
          end;
          delete(ListadeDuplicatas, length(ListadeDuplicatas),1);
          dtmImprimeAutorizacaoPagto.ImprimirAutorizacao(ListadeDuplicatas);
          qryduplicatas.Filtered := false;
        end;
      finally
        qryDuplicatas.EnableControls;
      end;
      if (operacao = 0) or ((operacao = 1) and not Imprimir) then
      begin
        SelecionarDuplicatas;
        QtdeMarcados  := 0;
        TotalMarcados := 0;
      end;
    end
    else MensagemAviso(format(ctUSUARIONAOAUTORIZADO,['autorizar o pagamento de duplicatas.']));
  finally
  //  Usuario.Free;
  end;
end;

procedure TdtmAutorizacaoPagamento.qryFornecedoresBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryFornecedores.Params[0].AsString = '' then
    qryFornecedores.Params[0].AsString:= 'F';
end;

{procedure TdtmAutorizacaoPagamento.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
 arquivo: String;
begin
  inherited;
  arquivo:='c:\monitor.sql';
  Listar := tStringlist.create;
  if fileexists(arquivo) then
    Listar.loadfromfile(arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(arquivo);
  listar.free;
end;}
procedure TdtmAutorizacaoPagamento.qryDuplicatasFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
  if qryduplicatas.filtered then
    accept := qryduplicatasselecionar.asboolean;
end;

procedure TdtmAutorizacaoPagamento.qryDuplicatasBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if not (UsuarioLogin.Administrador or UsuarioLogin.Suporte) then
    qryDuplicatas.MacroByName('Administrador').AsString:= 'and not d.administrador';
end;

procedure TdtmAutorizacaoPagamento.SetAutorizacaoFinal(
  const Value: String);
begin
  FAutorizacaoFinal := Value;

  if not DataEmBranco(Value) then
       FAutorizacaoFinal := Value
  else FAutorizacaoFinal := '';
  MontaDataAutorizacao;

end;

procedure TdtmAutorizacaoPagamento.SetAutorizacaoInicial(
  const Value: String);
begin
  if not DataEmBranco(Value) then
    FAutorizacaoInicial := Value
  else FAutorizacaoInicial := '';
  MontaDataAutorizacao;
end;

procedure TdtmAutorizacaoPagamento.MontaDataAutorizacao;
const
  Data_1: String = 'and (t.dataautorizacaopagto = ';
  Data_2: String = 'and (t.dataautorizacaopagto between (';
begin
  if not DataEmBranco(FAutorizacaoInicial) then begin
    if DataEmBranco(FAutorizacaoFinal) then
         qryDuplicatas.MacroByName('Autorizacao').AsString := Data_1 + '''' + FAutorizacaoInicial + ''')'
    else
         qryDuplicatas.MacroByName('Autorizacao').AsString := Data_2 + '''' + FAutorizacaoInicial + ''') and (''' + FAutorizacaoFinal + '''))';
  end
  else begin
    if not DataEmBranco(FAutorizacaoFinal) then
         qryDuplicatas.MacroByName('Autorizacao').AsString := Data_1 + '''' + FAutorizacaoFinal + ''')'
    else
         qryDuplicatas.MacroByName('Autorizacao').AsString := '';
  end;
end;

procedure TdtmAutorizacaoPagamento.SetOperacao(const Value: integer);
begin
  FOperacao := Value;
  case value of
    0: begin
         qryDuplicatas.MacroByName('Operacao').AsString := 'and not (coalesce(t.autorizado,false))';
         qryDuplicatas.MacroByName('Autorizacao').AsString := '';
       end;
    1: begin
         qryDuplicatas.MacroByName('Operacao').AsString := 'and (coalesce(t.autorizado,false))';
         qryDuplicatas.MacroByName('Lancamento').AsString := '';
         qryDuplicatas.MacroByName('Vencimento').AsString := '';

       end;
  end;
end;

procedure TdtmAutorizacaoPagamento.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  if assigned(Usuario) then
    Usuario.free;
end;

end.
