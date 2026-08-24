unit dmrelatoriosituacaofornecedores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, DB, CheckLst,
  // Terceiros
  ZQuery, ZPgSqlQuery, FR_DSet, FR_DBSet, FR_Class,
  // Componentes
  cpquery, cpdatasource,
  // Constantes
  Biblio, ctConstantes,
  // Repositorio
  dmtecsoft, dmbasico, clparametrossistema, dmimprimetermos,
  // Outros
  fmpreviewpadrao, ZTransact, frxClass, frx2xto30;

type
  TdtmRelatoriosituacaofornecedores = class(TdtmBasico)
    qryCodigosFiscais: TtecQuery;
    qryCodigosFiscaismenorcodigo: TIntegerField;
    qryCodigosFiscaismaiorcodigo: TIntegerField;
    qryNaturezas: TtecQuery;
    qryNaturezascodigo: TIntegerField;
    qryNaturezasdescricao: TStringField;
    qryFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryGrupoFiliais: TtecQuery;
    qryGrupoFiliaiscodigo: TIntegerField;
    qryGrupoFiliaisdescricao: TStringField;
    qryDuplicatas: TtecQuery;
    frpNotasEntrada: TfrReport;
    fdsNotasEntrada: TfrDBDataSet;
    qryNotasPag: TtecQuery;
    fdsDuplicatas: TfrDBDataSet;
    dsrNotasPag: TtecDataSource;
    qryDuplicatascodigo: TIntegerField;
    qryDuplicatasnumero: TIntegerField;
    qryDuplicatasdatavencto: TDateField;
    qryDuplicatasvalorvencto: TFloatField;
    qryDuplicatasvalorjurosdesconto: TFloatField;
    qryDuplicatasndias: TIntegerField;
    qryDuplicatasdatapagto: TDateField;
    qryNotasPaggrupofilial: TIntegerField;
    qryNotasPagnomegrupofilial: TStringField;
    qryNotasPagfilial: TIntegerField;
    qryNotasPagnomefilial: TStringField;
    qryNotasPagserie: TStringField;
    qryNotasPagnumero: TIntegerField;
    qryNotasPagcodigofiscal: TIntegerField;
    qryNotasPagdata: TDateField;
    qryNotasPagemissao: TDateField;
    qryNotasPagvalornota: TFloatField;
    qryNotasPagsaldodevedor: TFloatField;
    qryNotasPagtotalvalorvencto: TFloatField;
    qryNotasPagtotalvalorpagto: TFloatField;
    qryNotasPagtotalvalorjurosdesconto: TFloatField;
    qryNotasPagcodigo: TIntegerField;
    qryNotasPagtipo: TStringField;
    qryDuplicatastipo: TStringField;
    qryDuplicatasdocumentopag: TIntegerField;
    qryDuplicatasvalorpagto: TFloatField;
    qryNotasPagtipofornecedor: TStringField;
    frpNotasEntradaResumo: TfrReport;
    qryNotasPagexisteduplicata: TBooleanField;
    qryNotasPagcgc_cnpj: TStringField;
    qryNotasPagfornecedor: TIntegerField;
    qryNotasPagnome: TStringField;
    qryNotasPagimpostosretidos: TFloatField;
    frxReport1: TfrxReport;
    procedure frpLivroEntradaMercadoriasTermosBeforePrint(
      Memo: TStringList; View: TfrView);
    procedure frpLivroEntradaMercadoriasTermosGetValue(
      const ParName: String; var ParValue: Variant);
    procedure frpNotasEntradaBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpNotasEntradaResumoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
//    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  Protected
  private
    FAgruparGrupoFilial: Boolean;
    FAgruparFilial: Boolean;
    FParametroCabecalho: String;
    FDataInicial: String;
    FDataSituacao: String;
    FTipodeData: Integer;
    FPrevisao: integer;
    FSomenteDuplicatasemAberto: boolean;
    FsituacaoNota: integer;
    FTipoOrdenacao: Integer;
    FQuebrarPaginaporFornecedor: Boolean;
    FResumo: Integer;
    FNaturezas: String;
    FForneceProdutos: Boolean;
    FForneceTransporte: Boolean;
    FForneceMontagem: Boolean;
    FListarNotasdeClientes: Boolean;
    FSomenteDocsComNotas: Boolean;
    procedure SetDataSituacao(const Value: String);
    function GetListaNaturezas: TLista;
    function GetListaFiliais: TLista;
    function GetListaGruposFiliais: TLista;
    procedure SetTipodeData(const Value: Integer);
    procedure SetParametroFornecedor(const Value: String);
    procedure SetPrevisao(const Value: integer);
    procedure SetSomenteDuplicatasemAberto(const Value: boolean);
    procedure SetSituacaoNota(const Value: integer);
    procedure SetForneceMontagem(const Value: Boolean);
    procedure SetListarNotasdeClientes(const Value: Boolean);
    procedure SetSomenteDocsComNotas(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
     constructor Create(AOwner: TComponent); override;
     procedure ImprimirRelatorio;

     property ParametroFornecedor: String write SetParametroFornecedor;

     property DataInicial: String read FDataInicial write FDataInicial;
     property DataSituacao: String read FDataSituacao write SetDataSituacao;

     property AgruparGrupoFilial: Boolean read FAgruparGrupoFilial write FAgruparGrupoFilial;
     property AgruparFilial: Boolean read FAgruparFilial write FAgruparFilial;
     property TipoOrdenacao: Integer read FTipoOrdenacao write FTipoOrdenacao;

     property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;

     property ListaNaturezas: TLista read GetListaNaturezas;
     property ListaFiliais: TLista read GetListaFiliais;
     property ListaGruposFiliais: TLista read GetListaGruposFiliais;

     procedure MontarFiltroFiliais(Filiais: TCheckListBox);
     procedure MontarFiltroGruposFiliais(GruposFiliais: TCheckListBox);
     procedure MontarFiltroNaturezas(Natureza: TCheckListBox);

     property TipodeData: Integer read FTipodeData write SetTipodeData;

     procedure DefinirOrdenacao;
     function AbrirConsultas: Boolean;
     property Previsao: integer read FPrevisao write SetPrevisao;
     property SituacaoNota: integer read FsituacaoNota write SetSituacaoNota;

     property SomenteDuplicatasemAberto: boolean read FSomenteDuplicatasemAberto write SetSomenteDuplicatasemAberto;
     property QuebrarPaginaporFornecedor: Boolean read FQuebrarPaginaporFornecedor write FQuebrarPaginaporFornecedor;
     property Resumo: Integer read FResumo write FResumo;
     property ForneceProdutos: Boolean read FForneceProdutos write FForneceProdutos;
     property ForneceTransporte: Boolean read FForneceTransporte write FForneceTransporte;
     property ForneceMontagem: Boolean read FForneceMontagem write SetForneceMontagem;
     property ListarNotasdeClientes: Boolean read FListarNotasdeClientes write SetListarNotasdeClientes;
     property SomenteDocsComNotas: Boolean read FSomenteDocsComNotas write SetSomenteDocsComNotas;
  end;

var
  dtmRelatoriosituacaofornecedores: TdtmRelatoriosituacaofornecedores;
  FListaNaturezas  : TLista;
  FListaFiliais : TLista;
  FListaGruposFiliais : TLista;

implementation

{$R *.dfm}

{ TdtmLivroEntradaMercadorias }


constructor TdtmRelatoriosituacaofornecedores.Create(AOwner: TComponent);
begin
  inherited;
  qryCodigosFiscais.Tag         := ctTabelas;
  qryFiliais.Tag                := ctTabelas;
  qryGrupoFiliais.Tag           := ctTabelas;
end;


procedure TdtmRelatoriosituacaofornecedores.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['RAZAOFILIALBASE']:= RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']:= RuaFilialBase+ ' - ' + BairroFilialBase;
  frVariables['CEP_CIDADE_UF']  := FormatarCEP(CEPFilialBase) + '  ' +
                                   CidadeFilialBase + '  ' + EstadoFilialBase;
  frVariables['Titulo']         := 'SITUAÇÃO DOS FORNECEDORES EM '+FormatDateTime('dd/mm/yy',strtodate(DataSituacao));
  frVariables['Outras']         := FParametroCabecalho;
  frVariables['AgruparGrupoFilial']:=AgruparGrupoFilial;
  frVariables['AgruparFilial']:=AgruparFilial;
  frVariables['QuebrarPaginaFornecedor']:=QuebrarPaginaporFornecedor;
  frVariables['DataSituacao']:=FormatDateTime('dd/mm/yy',strtodate(DataSituacao));

//  frpNotasEntrada.DesignReport;
//  frxReport1.designreport;

//  frpNotasEntradaResumo.DesignReport;
//  frxReport1.designreport;
  
  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
    frCompositeReport.Reports.Clear;
    case FResumo of
    0 : begin
         frCompositeReport.Reports.Add(frpNotasEntrada);
         frCompositeReport.Reports.Add(frpNotasEntradaResumo);
        end;
    1 : frCompositeReport.Reports.Add(frpNotasEntrada);
    2 : frCompositeReport.Reports.Add(frpNotasEntradaResumo);
    end;
   end;
   Relatorio.Preview := frmPreview.frPreviewPadrao;
   Relatorio.ShowReport;

   frmPreview.ShowModal;

  finally

   frmPreview.Free

  end;

end;


procedure TdtmRelatoriosituacaofornecedores.SetDataSituacao(const Value: String);
begin
  if Value<>'' then
  begin
   FDataSituacao := Value;
   if FDataInicial='' then
    FDataInicial:=FDataSituacao;
  end
  else
   FDataSituacao:=FDataInicial;

  qryNotasPag.ParamByName('DataInicial').AsString:=FDataInicial;
  qryNotasPag.ParamByName('DataSituacao').AsString:=FDataSituacao;
  qryDuplicatas.ParamByName('DataInicial').AsString:=FDataInicial;
  qryDuplicatas.ParamByName('DataSituacao').AsString:=FDataSituacao;
  FParametroCabecalho:='A partir de: '+FDataInicial;
end;

procedure TdtmRelatoriosituacaofornecedores.frpLivroEntradaMercadoriasTermosBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'logotipo') or
     (View.Name = 'logotipo2') then
   if FileExists(LogotipoFilialBase) then
     try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;

end;

procedure TdtmRelatoriosituacaofornecedores.frpLivroEntradaMercadoriasTermosGetValue(
  const ParName: String; var ParValue: Variant);
begin
  inherited;
  if ParName = 'NOMECONTADOR' then ParValue := ParSistema.NomeContador
  else if ParName = 'CRCCONTADOR' then ParValue := ParSistema.CRCContador
  else if ParName = 'RESPONSAVEL1' then ParValue := ParSistema.ResponsavelLivros1
  else if ParName = 'RESPONSAVEL2' then ParValue := ParSistema.ResponsavelLivros2
  else if Parname = 'FOLHA_OU_PAGINA' then
       case ParSistema.LivrosFiscaisFolhaouPagina of
        0: ParValue := ctFOLHA;
        1: ParValue := ctPAGINA;
       end;

end;

function TdtmRelatoriosituacaofornecedores.GetListaNaturezas: TLista;
Var
Ind: Integer;
begin
  FillChar(FListaNaturezas,SizeOf(FListaNaturezas),0);
  qryNaturezas.Open;
  SetLength(FListaNaturezas, qryNaturezas.RecordCount);
  Ind:= 0;
  while not qryNaturezas.Eof do
  begin
    FListaNaturezas[Ind].codigo   := qryNaturezascodigo.AsString;
    FListaNaturezas[Ind].descricao:= qryNaturezasdescricao.AsString;
    Inc(Ind);
    qryNaturezas.Next;
  end;
  qryNaturezas.Close;
  Result := FListaNaturezas;
end;



function TdtmRelatoriosituacaofornecedores.GetListaFiliais: TLista;
Var
  Ind: Integer;
begin
  FillChar(FListaFiliais,SizeOf(FListaFiliais),0);
  SetLength(FListaFiliais, qryFiliais.RecordCount);
  Ind:= 0;
  while not qryFiliais.Eof do
  begin
    FListaFiliais[Ind].codigo   := qryFiliaiscodigo.AsString;
    FListaFiliais[Ind].descricao:= qryFiliaisnome.AsString;
    Inc(Ind);
    qryFiliais.Next;
  end;
  Result := FListaFiliais;
end;


function TdtmRelatoriosituacaofornecedores.GetListaGruposFiliais: TLista;
Var
  Ind: Integer;
begin
  FillChar(FListaGruposFiliais,SizeOf(FListaGruposFiliais),0);
  SetLength(FListaGruposFiliais, qryGrupoFiliais.RecordCount);
  Ind:= 0;
  while not qryGrupoFiliais.Eof do
  begin
    FListaGruposFiliais[Ind].codigo   := qryGrupoFiliaiscodigo.AsString;
    FListaGruposFiliais[Ind].descricao:= qryGrupoFiliaisdescricao.AsString;
    Inc(Ind);
    qryGrupoFiliais.Next;
  end;
  Result := FListaGruposFiliais;
end;

procedure TdtmRelatoriosituacaofornecedores.SetTipodeData(const Value: Integer);
begin
  FTipodeData := Value;
  case FTipodeData of
  0: begin
       qryNotasPag.MacroByName('TipodeData').AsString := 'np.data';
       qryDuplicatas.MacroByName('TipodeData').AsString := 'np.data';
     end;
  1: begin
       qryNotasPag.MacroByName('TipodeData').AsString := 'np.emissao';
       qryDuplicatas.MacroByName('TipodeData').AsString := 'np.emissao';
     end;
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.SetParametroFornecedor(
  const Value: String);
const
 SQL_np = 'and np.fornecedor = %s';
 SQL_dp = 'and dp.fornecedor = %s';
begin
  if Value<>'' then
  begin
   qryNotasPag.MacroByName('WhereFornecedores_np').AsString := format(SQL_np, [Value]);
   qryNotasPag.MacroByName('WhereFornecedores_dp').AsString := format(SQL_dp, [Value]);
   qryDuplicatas.MacroByName('WhereFornecedores_np').AsString := format(SQL_np, [Value]);
   qryDuplicatas.MacroByName('WhereFornecedores_dp').AsString := format(SQL_dp, [Value]);
   FParametroCabecalho:=FParametroCabecalho+' Fornecedor: '+Value;
  end
  else
  begin
   qryNotasPag.MacroByName('WhereFornecedores_np').AsString := '';
   qryNotasPag.MacroByName('WhereFornecedores_dp').AsString := '';
   qryDuplicatas.MacroByName('WhereFornecedores_np').AsString := '';
   qryDuplicatas.MacroByName('WhereFornecedores_dp').AsString := '';
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.MontarFiltroFiliais(
  Filiais: TCheckListBox);
var
  STRFiliais: String;
  Ind: Integer;
begin
  STRFiliais := '';
  for Ind:= 0 to (Length(FListaFiliais) - 1) do
    if Filiais.Checked[Ind] then
      STRFiliais := STRFiliais + QuotedStr(FListaFiliais[Ind].codigo) + ',';
  STRFiliais := Copy(STRFiliais, 0, Length(STRFiliais) - 1);
  if STRFiliais <> '' then
  begin
      qryNotasPag.MacroByName('WhereFiliais_np').AsString:='and (np.filial in (' + STRFiliais + '))';
      qryNotasPag.MacroByName('WhereFiliais_dp').AsString:='and (dp.filialemissao in (' + STRFiliais + '))';
      qryduplicatas.MacroByName('WhereFiliais_np').AsString:='and (np.filial in (' + STRFiliais + '))';
      qryduplicatas.MacroByName('WhereFiliais_dp').AsString:='and (dp.filialemissao in (' + STRFiliais + '))';
      FParametroCabecalho := FParametroCabecalho+' Filiais: '+STRFiliais;
  end
  else
  begin
      qryNotasPag.MacroByName('WhereFiliais_np').AsString:='';
      qryNotasPag.MacroByName('WhereFiliais_dp').AsString:='';
      qryduplicatas.MacroByName('WhereFiliais_np').AsString:='';
      qryduplicatas.MacroByName('WhereFiliais_dp').AsString:='';
  end;

end;

procedure TdtmRelatoriosituacaofornecedores.MontarFiltroGruposFiliais(
  GruposFiliais: TCheckListBox);
const
  FiltroGrupoFilial_np = ' AND ( np.filial IN (SELECT filial '+#13#10+
                             'FROM filiaisgruposfiliais fgf '+#13#10+
                               'WHERE fgf.grupo IN (%s))) ';
  FiltroGrupoFilial_dp = ' AND ( dp.filialemissao IN (SELECT filial '+#13#10+
                             'FROM filiaisgruposfiliais fgf '+#13#10+
                               'WHERE fgf.grupo IN (%s))) ';
var
  STRGruposFiliais: String;
  Ind: Integer;
begin
  STRGruposFiliais := '';
  for Ind:= 0 to (Length(FListaGruposFiliais) - 1) do
    if GruposFiliais.Checked[Ind] then
      STRGruposFiliais := STRGruposFiliais + QuotedStr(FListaGruposFiliais[Ind].codigo) + ',';
  STRGruposFiliais := Copy(STRGruposFiliais, 0, Length(STRGruposFiliais) - 1);
  if STRGruposFiliais <> '' then
  begin
       qryNotasPag.MacroByName('WhereGruposFiliais_np').AsString:=format(FiltroGrupoFilial_np,[STRGruposFiliais]);
       qryNotasPag.MacroByName('WhereGruposFiliais_dp').AsString:=format(FiltroGrupoFilial_dp,[STRGruposFiliais]);
       qryDuplicatas.MacroByName('WhereGruposFiliais_np').AsString:=format(FiltroGrupoFilial_np,[STRGruposFiliais]);
       qryDuplicatas.MacroByName('WhereGruposFiliais_dp').AsString:=format(FiltroGrupoFilial_dp,[STRGruposFiliais]);
       FParametroCabecalho := FParametroCabecalho+' Grupos de Filiais: '+STRGruposFiliais;
  end
  else
  begin
       qryNotasPag.MacroByName('WhereGruposFiliais_np').AsString:='';
       qryNotasPag.MacroByName('WhereGruposFiliais_dp').AsString:='';
       qryDuplicatas.MacroByName('WhereGruposFiliais_np').AsString:='';
       qryDuplicatas.MacroByName('WhereGruposFiliais_dp').AsString:='';
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.DefinirOrdenacao;
var
 Ordenacao : String;
begin
  ordenacao:='';
  if AgruparGrupoFilial then
    Ordenacao:=Ordenacao+', nomegrupofilial, grupofilial ';
  if AgruparFilial then
    Ordenacao:=Ordenacao+', nomefilial, filial ';
  case TipoOrdenacao of
   0: Ordenacao := Ordenacao + ', nome, fornecedor, tipofornecedor, numero, data';
   1: Ordenacao := Ordenacao + ', nome, fornecedor, tipofornecedor, data, numero';
  end;
  qryNotasPag.MacroByName('ordenacao').AsString:='Order by '+copy(Ordenacao,2,length(Ordenacao)-1);
end;

function TdtmRelatoriosituacaofornecedores.AbrirConsultas: Boolean;
begin
  ReFazConsulta(qryNotasPag,[],[]);
  ReFazConsulta(qryDuplicatas,[],[]);
  result := not qryNotasPag.IsEmpty;
end;

procedure TdtmRelatoriosituacaofornecedores.SetPrevisao(
  const Value: integer);
begin
  FPrevisao := Value;
  case Value of
    0: begin
         qryNotasPag.  MacroByName('Previsao_np').AsString := '';
         qryNotasPag.  MacroByName('Previsao_dp').AsString := '';
         qryDuplicatas.MacroByName('Previsao_np').AsString := '';
         qryDuplicatas.MacroByName('Previsao_dp').AsString := '';
         FParametroCabecalho:= FParametroCabecalho + ' Com Previsões';
       end;
    1: begin
         qryNotasPag.  MacroByName('Previsao_np').AsString := 'and not (select dp.previsao from documentospag dp where dp.numero = np.documentopag)';
         qryNotasPag.  MacroByName('Previsao_dp').AsString := 'and not dp.previsao';
         qryDuplicatas.MacroByName('Previsao_np').AsString := 'and not (select dp.previsao from documentospag dp where dp.numero = np.documentopag)';
         qryDuplicatas.MacroByName('Previsao_dp').AsString := 'and not dp.previsao';
         FParametroCabecalho:= FParametroCabecalho + ' Sem Previsões';
       end;
    2: begin
         qryNotasPag.  MacroByName('Previsao_np').AsString := 'and (select dp.previsao from documentospag dp where dp.numero = np.documentopag)';
         qryNotasPag.  MacroByName('Previsao_dp').AsString := 'and dp.previsao';
         qryDuplicatas.MacroByName('Previsao_np').AsString := 'and (select dp.previsao from documentospag dp where dp.numero = np.documentopag)';
         qryDuplicatas.MacroByName('Previsao_dp').AsString := 'and dp.previsao';
         FParametroCabecalho:= FParametroCabecalho + ' Só Previsões';
       end;
  end;

end;

procedure TdtmRelatoriosituacaofornecedores.SetSomenteDuplicatasemAberto(
  const Value: boolean);
begin
  FSomenteDuplicatasemAberto := Value;
  if value then
  begin
    qryDuplicatas.MacroByName('SomenteDuplicataemAberto').AsString := 'and (d.datapagto is null or d.datapagto > :DataSituacao)';
    qryNotasPag.MacroByName('SomenteDuplicataemAberto').AsString := 'where (saldodevedor>0)';
  end
  else
  begin
    qryDuplicatas.MacroByName('SomenteDuplicataemAberto').AsString := '';
    qryNotasPag.MacroByName('SomenteDuplicataemAberto').AsString := '';
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.SetSituacaoNota(
  const Value: integer);
begin
  FsituacaoNota := Value;
  case Value of
    0: begin
         qryNotasPag.  MacroByName('SituacaoNotas_NP').AsString := 'and exists (select d.numero from duplicatas d where d.documentopag = np.documentopag)';
         qryNotasPag.  MacroByName('SituacaoNotas_DP').AsString := 'and exists (select d.numero from duplicatas d where d.documentopag = dp.numero)';
         qryDuplicatas.MacroByName('SituacaoNotas_NP').AsString := 'and exists (select d.numero from duplicatas d where d.documentopag = np.documentopag)';
         qryDuplicatas.MacroByName('SituacaoNotas_DP').AsString := 'and exists (select d.numero from duplicatas d where d.documentopag = dp.numero)';
         FParametroCabecalho:= FParametroCabecalho + ' Situação: Com Duplicatas';
       end;
    1: begin
         qryNotasPag.  MacroByName('SituacaoNotas_NP').AsString := 'and not exists (select d.numero from duplicatas d where d.documentopag = np.documentopag)';
         qryNotasPag.  MacroByName('SituacaoNotas_DP').AsString := 'and not exists (select d.numero from duplicatas d where d.documentopag = dp.numero)';
         qryDuplicatas.MacroByName('SituacaoNotas_NP').AsString := 'and not exists (select d.numero from duplicatas d where d.documentopag = np.documentopag)';
         qryDuplicatas.MacroByName('SituacaoNotas_DP').AsString := 'and not exists (select d.numero from duplicatas d where d.documentopag = dp.numero)';
         FParametroCabecalho:= FParametroCabecalho + ' Situação: Sem Duplicatas';
       end;
    2: begin
         qryNotasPag.  MacroByName('SituacaoNotas_NP').AsString := '';
         qryNotasPag.  MacroByName('SituacaoNotas_DP').AsString := '';
         qryDuplicatas.MacroByName('SituacaoNotas_NP').AsString := '';
         qryDuplicatas.MacroByName('SituacaoNotas_DP').AsString := '';
         FParametroCabecalho:= FParametroCabecalho + ' Situação: Com/Sem Duplicatas';
       end;
  end;

end;

procedure TdtmRelatoriosituacaofornecedores.frpNotasEntradaBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') or
     (View.Name = 'fpvLogo2')then
  begin
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
  end
  else
  if TColor(strtoint(parsistema.CorZebradoRelatorio))<>TColor(clnone) then
  begin
   if (View.Name = 'mmoZebrado') then
    if (frpNotasEntrada.Dictionary.Variables.Variable['LINHA'] MOD 2)=1 then
    begin
      frpNotasEntrada.FindObject('mmoZebrado').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
      frpNotasEntrada.Dictionary.Variables.Variable['LINHASUB'] := frpNotasEntrada.Dictionary.Variables.Variable['LINHA']+1;
    end
    else
    begin
      frpNotasEntrada.FindObject('mmoZebrado').FillColor := clnone;
    end;

   if (View.Name = 'mmoZebradosub') then
    if (frpNotasEntrada.Dictionary.Variables.Variable['LINHASUB'] MOD 2)=1 then
    begin
      frpNotasEntrada.FindObject('mmoZebradosub').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
      frpNotasEntrada.Dictionary.Variables.Variable['LINHA'] := frpNotasEntrada.Dictionary.Variables.Variable['LINHASUB'];
    end
    else
    begin
      frpNotasEntrada.FindObject('mmoZebradosub').FillColor := clnone;
      frpNotasEntrada.Dictionary.Variables.Variable['LINHA'] := 0;
    end;
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.frpNotasEntradaResumoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  if (View.Name = 'fpvLogo') then
  begin
   if FileExists(LogotipoFilialBase) then
    try TfrPictureView(View).Picture.LoadFromFile(LogotipoFilialBase) except end;
  end
  else
  if TColor(strtoint(parsistema.CorZebradoRelatorio))<>TColor(clnone) then
  begin
   if (View.Name = 'mmoZebrado') then
    if (frpNotasEntradaResumo.Dictionary.Variables.Variable['LINHA'] MOD 2)=1 then
      frpNotasEntradaResumo.FindObject('mmoZebrado').FillColor := TColor(strtoint(parsistema.CorZebradoRelatorio))
    else
      frpNotasEntradaResumo.FindObject('mmoZebrado').FillColor := clnone;
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.MontarFiltroNaturezas(
  Natureza: TCheckListBox);
var
  STRNaturezas: String;
  Ind: Integer;
begin
  STRNaturezas := '';
  for Ind:= 0 to (Length(FListaNaturezas) - 1) do
    if Natureza.Checked[Ind] then
      STRNaturezas := STRNaturezas + QuotedStr(FListaNaturezas[Ind].codigo) + ',';
  STRNaturezas := Copy(STRNaturezas, 0, Length(STRNaturezas) - 1);
  if STRNaturezas <> '' then
       FNaturezas:= 'and (np.codigonatureza in (' + STRNaturezas + '))'
  else
       FNaturezas:= '';
  qryNotasPag.MacroByName('WhereNaturezas_np').AsString:=FNaturezas;
end;

{procedure TdtmRelatoriosituacaofornecedores.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\log.txt') then
    Listar.loadfromfile('c:\log.txt');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\log.txt');
  listar.free;
end;  }



procedure TdtmRelatoriosituacaofornecedores.SetListarNotasdeClientes(
  const Value: Boolean);
const
  SQL_np = 'and np.tipofornecedor<>''C''';
  SQL_dp = 'and dp.tipofornecedor<>''C''';
begin
  FListarNotasdeClientes := Value;
  if not value then
  begin
    qryNotasPag.MacroByName('TipoCliente_np').AsString := SQL_np;
    qryNotasPag.MacroByName('TipoCliente_dp').AsString := SQL_dp;
    qryDuplicatas.MacroByName('TipoCliente_np').AsString := SQL_np;
    qryDuplicatas.MacroByName('TipoCliente_dp').AsString := SQL_dp;
    FParametroCabecalho := FParametroCabecalho+'Lista Clientes: Sim';
  end
  else
  begin
    qryNotasPag.MacroByName('TipoCliente_np').AsString := '';
    qryNotasPag.MacroByName('TipoCliente_dp').AsString := '';
    qryDuplicatas.MacroByName('TipoCliente_np').AsString := '';
    qryDuplicatas.MacroByName('TipoCliente_dp').AsString := '';
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.SetForneceMontagem(
  const Value: Boolean);
Const

  SQL_np = ' and (select count(*)                                            '+
           '      from listatipofornecimento((select f.tipofornecimento      '+
           '                                  from fornecedores f            '+
           '                                  where f.codigo = np.fornecedor  '+
           '                                    and np.tipofornecedor=''F'')) '+
           '      where tipo in (%s))<>0';


  SQL_dp = ' and (select count(*)                                            '+
           '      from listatipofornecimento((select f.tipofornecimento      '+
           '                                  from fornecedores f            '+
           '                                  where f.codigo = dp.fornecedor  '+
           '                                    and dp.tipofornecedor=''F'')) '+
           '      where tipo in (%s))<>0';

var
  TipoFornecimento : String;
  Cabecalho: String;
begin
  Cabecalho := 'Fornecimento de: ';
  TipoFornecimento := '';
  FForneceMontagem := Value;

  if FForneceProdutos then
  begin
    TipoFornecimento := TipoFornecimento + quotedstr('P');
    Cabecalho := Cabecalho+' Produto,';
  end;

  If FForneceTransporte then
  begin
    Cabecalho := Cabecalho+' Transporte,';
    if Length(TipoFornecimento)>0 then
       TipoFornecimento := TipoFornecimento + ','+quotedstr('T')
    else
       TipoFornecimento := TipoFornecimento + quotedstr('T');
  end;

  If FForneceMontagem then
  begin
    Cabecalho := Cabecalho+' Montagem,';
    if Length(TipoFornecimento)>0 then
       TipoFornecimento := TipoFornecimento + ','+quotedstr('M')
    else
       TipoFornecimento := TipoFornecimento + quotedstr('M');
  end;

  if TipoFornecimento<>'' then
  begin
    qryNotasPag.MacroByName('TipoFornecimento_np').AsString := format(SQL_np,[TipoFornecimento]);
    qryNotasPag.MacroByName('TipoFornecimento_dp').AsString := format(SQL_dp,[TipoFornecimento]);
    qryDuplicatas.MacroByName('TipoFornecimento_np').AsString := format(SQL_np,[TipoFornecimento]);
    qryDuplicatas.MacroByName('TipoFornecimento_dp').AsString := format(SQL_dp,[TipoFornecimento]);
    delete(Cabecalho,length(Cabecalho),1);
    FParametroCabecalho := FParametroCabecalho+Cabecalho;
  end
  else
  begin
    qryNotasPag.MacroByName('TipoFornecimento_np').AsString := '';
    qryNotasPag.MacroByName('TipoFornecimento_dp').AsString := '';
    qryDuplicatas.MacroByName('TipoFornecimento_np').AsString := '';
    qryDuplicatas.MacroByName('TipoFornecimento_dp').AsString := '';
  end;
end;


procedure TdtmRelatoriosituacaofornecedores.SetSomenteDocsComNotas(
  const Value: Boolean);
begin
  FSomenteDocsComNotas := Value;
  if Value then
  begin
    qryNotasPag.MacroByName('SomenteComNota').AsString := 'and FALSE';
    qryDuplicatas.MacroByName('SomenteComNota').AsString := 'and FALSE';
  end
  else
  begin
    qryNotasPag.MacroByName('SomenteComNota').AsString := '';
    qryDuplicatas.MacroByName('SomenteComNota').AsString := '';
  end;
end;

procedure TdtmRelatoriosituacaofornecedores.ZMonitor1MonitorEvent(Sql,
  Result: String);
var
 Listar : TStringList;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('/tmp/texto1.sql') then
    Listar.loadfromfile('/tmp/texto1.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('/tmp/texto1.sql');
  listar.free;
end;

end.
