unit dmrelatoriocaixa;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  CheckLst, ctconstantes, biblio, FR_Class, FR_DSet, FR_DBSet,
  fmpreviewpadrao, ZTransact, clparametrossistema, Graphics, dmtecsoft;

type
  Tdtmrelatoriocaixa = class(TdtmBasico)
    qryFiliais: TtecQuery;
    qryGruposFiliais: TtecQuery;
    qryEventos: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryGruposFiliaiscodigo: TIntegerField;
    qryGruposFiliaisdescricao: TStringField;
    qryEventoscodigo: TIntegerField;
    qryEventosdescricao: TStringField;
    qryImprimirRelatorio: TtecQuery;
    frpRelatorioCaixa: TfrReport;
    qryImprimirRelatorionumero: TIntegerField;
    qryImprimirRelatoriodata: TDateField;
    qryImprimirRelatoriofilial: TIntegerField;
    qryImprimirRelatorionomefilial: TStringField;
    qryImprimirRelatoriocaixa: TIntegerField;
    qryImprimirRelatorionomecaixa: TStringField;
    qryImprimirRelatorioautenticacao: TIntegerField;
    qryImprimirRelatoriobanco: TIntegerField;
    qryImprimirRelatorionomebanco: TStringField;
    qryImprimirRelatoriocheque: TStringField;
    qryImprimirRelatoriovenctocheque: TDateField;
    qryImprimirRelatoriodatadocumento: TDateField;
    qryImprimirRelatorioevento: TIntegerField;
    qryImprimirRelatoriodescricaoevento: TStringField;
    qryImprimirRelatoriohistorico: TIntegerField;
    qryImprimirRelatoriohora: TStringField;
    qryImprimirRelatoriomotivo: TIntegerField;
    qryImprimirRelatoriodescricaomotivo: TStringField;
    qryImprimirRelatorionota: TIntegerField;
    qryImprimirRelatorioparametros: TStringField;
    qryImprimirRelatoriocontratoparcela: TStringField;
    qryImprimirRelatorioparcela: TIntegerField;
    qryImprimirRelatoriofornecedor: TIntegerField;
    qryImprimirRelatoriotipofornecedor: TStringField;
    qryImprimirRelatoriosaldo: TFloatField;
    qryImprimirRelatoriosituacao: TBooleanField;
    qryImprimirRelatoriotransferencia: TIntegerField;
    qryImprimirRelatorioentradapendente: TBooleanField;
    qryImprimirRelatorioconfirmacao: TBooleanField;
    qryImprimirRelatoriovalor: TFloatField;
    qryImprimirRelatoriovalorvenctoparcela: TFloatField;
    qryImprimirRelatoriodocumentopag: TIntegerField;
    qryImprimirRelatorionumeroduplicata: TIntegerField;
    qryImprimirRelatoriovenctoduplicata: TDateField;
    qryImprimirRelatorioclientedev: TIntegerField;
    qryImprimirRelatoriotipoclientedev: TStringField;
    qryImprimirRelatorionomeclientedev: TStringField;
    qryImprimirRelatorioreferencia: TStringField;
    qryImprimirRelatoriotipocliente: TStringField;
    qryImprimirRelatoriocliente: TIntegerField;
    qryImprimirRelatoriocontrato: TStringField;
    qryCaixas: TtecQuery;
    qryImprimirRelatorioentradasaida: TStringField;
    qryImprimirRelatoriodescricaotipo: TMemoField;
    qryFrenteCaixa: TtecQuery;
    qryFrenteCaixacodigo: TIntegerField;
    qryFrenteCaixaautenticacao: TIntegerField;
    qryFrenteCaixavalor: TFloatField;
    qryFrenteCaixatipo: TStringField;
    fdsFrenteCaixa: TfrDBDataSet;
    qryImprimirRelatoriotipo: TStringField;
    qryFrenteCaixadescricaotipo: TStringField;
    qryImprimirRelatoriotiporeduzido: TMemoField;
    qryImprimirRelatoriosaldoinicial: TFloatField;
    qryImprimirRelatoriosaldofinal: TFloatField;
    fdsImprimirRelatorio: TfrDBDataSet;
    qryConsultaCaixas: TtecQuery;
    procedure qryImprimirRelatorioAfterScroll(DataSet: TDataSet);
    procedure frpRelatorioCaixaBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryFrenteCaixaCalcFields(DataSet: TDataSet);
  private
    FListaFiliais: TStringList;
    FListaGruposFiliais: TStringList;
    FListaCaixas: TStringList;
    FListaEventos: TStringList;
    FListaAutenticacoes: TStringList;
    FListaAutenticacoesI: TStringList;
    FParametroCabecalho: String;
    FDataInicial: String;
    FDataFinal: String;
    FAgruparAutenticacao: Boolean;
    function GetListaFiliais: TStrings;
    function GetListaGruposFiliais: TStrings;
    function GetListaAutenticacoes: TStrings;
    procedure SetEventos(const Value: String);
    procedure SetFiliais(const Value: String);
    procedure SetGrupoFiliais(const Value: String);
    procedure SetAutenticacoes(const Value: String);
    procedure SetCaixas(const Value: String);
    procedure SetDataFinal(const Value: String);
    procedure MontaDatas;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    procedure MontarFiltroFiliais(Usar: TCheckListBox);
    procedure MontarFiltroGrupoFiliais(Usar: TCheckListBox);
    procedure MontarFiltroAutenticacoes(Usar: TCheckListBox);
    procedure ImprimirRelatorio;

    property Filiais: String write SetFiliais;
    property GrupoFiliais: String write SetGrupoFiliais;
    property Caixas: String write SetCaixas;
    property Eventos: String write SetEventos;
    property Autenticacoes: String write SetAutenticacoes;
    property DataInicial: String read FDataInicial write FDataInicial;
    property DataFinal: String read FDataFinal write SetDataFinal;
    property ListaFiliais: TStrings read GetListaFiliais;
    property ListaGruposFiliais: TStrings read GetListaGruposFiliais;
    property ListaAutenticacoes: TStrings read GetListaAutenticacoes;
    property ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property AgruparAutenticacao: Boolean read FAgruparAutenticacao write FAgruparAutenticacao;
  end;

var
  dtmrelatoriocaixa: Tdtmrelatoriocaixa;

implementation

{$R *.dfm}

{ Tdtmrelatoriocaixa }

const

  FiltroFiliais       = ' AND ( a.filial IN (%s)) ' +#13#10;
  FiltroGrupoFiliais  = ' AND ( a.filial IN (SELECT filial '+#13#10+
                                        'FROM filiaisgruposfiliais fgf '+#13#10+
                                        'WHERE fgf.grupo IN (%s))) ';
  FiltroCaixas        = ' AND ( a.caixa IN (%s)) ' +#13#10;
  FiltroEventos       = ' AND ( a.evento IN (%s))' +#13#10;
  FiltroAutenticacoes = ' AND ( a.tipo IN (%s))' +#13#10;

constructor Tdtmrelatoriocaixa.Create(Aowner: Tcomponent);
begin
  inherited;
  qryFiliais.Tag                :=ctTabelas;
  qryGruposFiliais.Tag          :=ctTabelas;
  qryEventos.Tag                :=ctTabelas;
end;

function Tdtmrelatoriocaixa.GetListaAutenticacoes: TStrings;
begin
  FListaAutenticacoes := TStringList.Create;
  FListaAutenticacoes.Add('Cancelamento');
  FListaAutenticacoes.Add('Cartão');
  FListaAutenticacoes.Add('Cheques');
  FListaAutenticacoes.Add('Depósitos');
  FListaAutenticacoes.Add('Devoluções');
  FListaAutenticacoes.Add('Devoluções de Saldo');
  FListaAutenticacoes.Add('Documento');
  FListaAutenticacoes.Add('Duplicatas');
  FListaAutenticacoes.Add('Frente de Caixa');
  FListaAutenticacoes.Add('Perdas');
  FListaAutenticacoes.Add('Prestações');
  FListaAutenticacoes.Add('Resgate de Cheque');
  FListaAutenticacoes.Add('Transferência de Entrada');
  FListaAutenticacoes.Add('Transferência de Saída');

  FListaAutenticacoesI := TStringList.Create;
  FListaAutenticacoesI.Add('C');
  FListaAutenticacoesI.Add('T');
  FListaAutenticacoesI.Add('H');
  FListaAutenticacoesI.Add('B');
  FListaAutenticacoesI.Add('N');
  FListaAutenticacoesI.Add('A');
  FListaAutenticacoesI.Add('D');
  FListaAutenticacoesI.Add('G');
  FListaAutenticacoesI.Add('F');
  FListaAutenticacoesI.Add('J');
  FListaAutenticacoesI.Add('P');
  FListaAutenticacoesI.Add('R');
  FListaAutenticacoesI.Add('E');
  FListaAutenticacoesI.Add('S');

  Result := FListaAutenticacoes;
end;



function Tdtmrelatoriocaixa.GetListaFiliais: TStrings;
begin
  FListaFiliais:= TStringList.Create;
  qryFiliais.Open;
  while not qryFiliais.Eof do
  begin
    FListaFiliais.AddObject(qryFiliaisnome.AsString, Pointer(qryFiliaiscodigo.AsInteger));
    qryFiliais.Next;
  end;
  qryFiliais.Close;
  Result := FListaFiliais;
end;

function Tdtmrelatoriocaixa.GetListaGruposFiliais: TStrings;
begin
  FListaGruposFiliais:= TStringList.Create;
  qryGruposFiliais.Open;
  while not qryGruposFiliais.Eof do
  begin
    FListaGruposFiliais.AddObject(qryGruposFiliaisdescricao.AsString, Pointer(qryGruposFiliaiscodigo.AsInteger));
    qryGruposFiliais.Next;
  end;
  qryGruposFiliais.Close;
  Result := FListaGruposFiliais;
end;

procedure Tdtmrelatoriocaixa.ImprimirRelatorio;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['RAZAOFILIALBASE']:= RazaoFilialBase;
  frVariables['ENDERECO_BAIRRO']:= RuaFilialBase+ ' - '+BairroFilialBase;
  frVariables['CEP_CIDADE_UF']  := FormatarCEP(CEPFilialBase)+'  '+CidadeFilialBase+ '  '+ EstadoFilialBase;
  frVariables['Titulo']         := 'Movimentacoes de Caixa';
  frVariables['Outras']         := ParametroCabecalho;
  frVariables['AgruparAutenticacao']:= AgruparAutenticacao;

//  frpRelatorioCaixa.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
    Relatorio := frmPreview.frCompositeReport;
    with frmPreview do
    begin
      frCompositeReport.Reports.Clear;
      frCompositeReport.Reports.Add(frpRelatorioCaixa);
    end;
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    qryImprimirRelatorio.Close;
    frmPreview.Free
  end;
end;

procedure Tdtmrelatoriocaixa.MontaDatas;
begin
  qryImprimirRelatorio.ParamByName('datainicial').Value := FDataInicial;
  qryImprimirRelatorio.ParamByName('datafinal').Value := FDataFinal;
  FParametroCabecalho := FParametroCabecalho+' Entre: '+FDataInicial+' e '+FDataFinal;
end;

procedure Tdtmrelatoriocaixa.MontarFiltroAutenticacoes(
  Usar: TCheckListBox);
  var
  STRAutenticacoes: String;
  TodasAutenticacoes: Boolean;
  cnt: Integer;
begin
  TodasAutenticacoes:=true;
  STRAutenticacoes := '';
  for cnt := 0 to FListaAutenticacoesI.Count - 1 do
    if Usar.Checked[cnt] then
      STRAutenticacoes := STRAutenticacoes + '''' + FListaAutenticacoesI[cnt] + ''','
    else
      TodasAutenticacoes:=false;

  STRAutenticacoes := Copy(STRAutenticacoes, 0, Length(STRAutenticacoes) - 1);
  if Trim(STRAutenticacoes) <> '' then
  begin
    if TodasAutenticacoes then
      FParametroCabecalho:=FParametroCabecalho+' Autenticações: Todas'
    else
      FParametroCabecalho:=FParametroCabecalho+' Autenticações: '+STRAutenticacoes;
  end;
  Autenticacoes := STRAutenticacoes ;
end;

procedure Tdtmrelatoriocaixa.MontarFiltroFiliais(Usar: TCheckListBox);
var
  STRFiliais: String;
  TodasFiliais: Boolean;
  cnt: Integer;
begin
  TodasFiliais := True;
  STRFiliais := '';
  for cnt := 0 to FListaFiliais.Count - 1 do
    if Usar.Checked[cnt] then
      STRFiliais := STRFiliais + '''' + IntToStr(Integer(FListaFiliais.Objects[cnt])) + ''','
    else
      TodasFiliais := False;

  STRFiliais := Copy(STRFiliais, 0, Length(STrFiliais) - 1);
  Filiais := STRFiliais;
  if Trim(STRFiliais) <> '' then
    if not TodasFiliais then
      FParametroCabecalho:=FParametroCabecalho+' Filiais: '+STRFiliais
    else
      Filiais := '';
end;

procedure Tdtmrelatoriocaixa.MontarFiltroGrupoFiliais(Usar: TCheckListBox);
var
  STRGruposFiliais: String;
  TodosGrupos: Boolean;
  cnt: Integer;
begin
  STRGruposFiliais := '';
  TodosGrupos := True;
  for cnt := 0 to FListaGruposFiliais.Count - 1 do
    if Usar.Checked[cnt] then
      STRGruposFiliais := STRGruposFiliais + '''' + IntToStr(Integer(FListaGruposFiliais.Objects[cnt])) + ''','
    else
      TodosGrupos := False;

  STRGruposFiliais := Copy(STRGruposFiliais, 0, Length(STrGruposFiliais) - 1);
  GrupoFiliais:=STRGruposFiliais;
  if Trim(STRGruposFiliais) <> '' then
   if not TodosGrupos then
    FParametroCabecalho:=FParametroCabecalho+' Grupo de Filiais: '+STRGruposFiliais
   else
    GrupoFiliais:='';
end;

procedure Tdtmrelatoriocaixa.SetAutenticacoes(const Value: String);
begin
  if Value <> '' then
    qryImprimirRelatorio.MacroByName('WHEREAUTENTICACOES').AsString := Format(FiltroAutenticacoes,[Value])
  else qryImprimirRelatorio.MacroByName('WHEREAUTENTICACOES').AsString := '';
end;

procedure Tdtmrelatoriocaixa.SetCaixas(const Value: String);
begin
  if Value <> '' then
  begin
    FParametroCabecalho := FParametroCabecalho + ' Caixas: ' + Value;
    qryImprimirRelatorio.MacroByName('WHERECAIXAS').AsString := Format(FiltroCaixas,[Value]);
  end
  else
  begin
    FParametroCabecalho:=FParametroCabecalho+' Caixas: Todos';
    qryImprimirRelatorio.MacroByName('WHERECAIXAS').AsString := '';
  end;
end;

procedure Tdtmrelatoriocaixa.SetDataFinal(const Value: String);
begin
  if not DataEmBranco(Value) then
  begin
    FDataFinal := Value;
    if FDataInicial='' then
      FDataInicial:=FDataFinal;
  end
  else FDataFinal := FDataInicial;
  MontaDatas;
end;

procedure Tdtmrelatoriocaixa.SetEventos(const Value: String);
begin
  if Value <> '' then
  begin
    qryImprimirRelatorio.MacroByName('WHEREEVENTOS').AsString    := Format(FiltroEventos,[Value]);
    FParametroCabecalho:=FParametroCabecalho+' Eventos: '+Value;
  end
  else
  begin
    qryImprimirRelatorio.MacroByName('WHEREEVENTOS').AsString := '';
    FParametroCabecalho:=FParametroCabecalho+' Eventos: Todos';
  end;
end;

procedure Tdtmrelatoriocaixa.SetFiliais(const Value: String);
begin
  if Value <> '' then
    qryImprimirRelatorio.MacroByName('WHEREFILIAIS').AsString    := Format(FiltroFiliais,[Value])
  else qryImprimirRelatorio.MacroByName('WHEREFILIAIS').AsString := '';
end;

procedure Tdtmrelatoriocaixa.SetGrupoFiliais(const Value: String);
begin
  if Value <> '' then
    qryImprimirRelatorio.MacroByName('WHEREFILIAIS').AsString := Format(FiltroGrupoFiliais,[Value]);
end;

procedure Tdtmrelatoriocaixa.qryImprimirRelatorioAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
//  ReFazConsulta(qrySaldoInicial,[0,1,2],[qryImprimirRelatoriofilial.asInteger,
  //                                       qryImprimirRelatoriocaixa.asInteger,
    //                                     DataInicial]);
  //RefazConsulta(qrySaldoFinal,[0,1,2], [qryImprimirRelatoriofilial.asInteger,
    //                                    qryImprimirRelatoriocaixa.asInteger,
      //                                  DataFinal]);
  if qryImprimirRelatoriotipo.AsString = 'F' then
    RefazConsulta(qryFrenteCaixa, [0], [qryImprimirRelatorionumero.AsInteger])
  else
  begin
    if not qryFrenteCaixa.Active then
      RefazConsulta(qryFrenteCaixa, [0], [0])
    else
    begin
      qryFrenteCaixa.first;
      while not qryFrenteCaixa.eof do
        qryFrenteCaixa.Delete;
    end;
  end;

  if qryFrenteCaixa.IsEmpty then
  begin
    qryFrenteCaixa.DisableControls;
    qryFrenteCaixa.Append;
    qryFrenteCaixadescricaotipo.AsString := '';
    qryFrenteCaixavalor.AsCurrency := 0;
    qryFrenteCaixa.Post;
    qryFrenteCaixa.EnableControls;
  end

end;

procedure Tdtmrelatoriocaixa.frpRelatorioCaixaBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioCaixa,View);
end;


procedure Tdtmrelatoriocaixa.qryFrenteCaixaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryFrenteCaixatipo.AsString = 'DN' then
    qryFrenteCaixadescricaotipo.AsString := 'DINHEIRO'
  else
   if qryFrenteCaixatipo.AsString = 'CH' then
    qryFrenteCaixadescricaotipo.AsString := 'CHEQUE'
  else
  if qryFrenteCaixatipo.AsString = 'MD' then
    qryFrenteCaixadescricaotipo.AsString := 'MASTERCARD DÉBITO'
  else
  if qryFrenteCaixatipo.AsString = 'MC' then
    qryFrenteCaixadescricaotipo.AsString := 'MASTERCARD CRÉDITO'
  else
  if qryFrenteCaixatipo.AsString = 'VD' then
   qryFrenteCaixadescricaotipo.AsString := 'VISA DÉBITO'
  else
  if qryFrenteCaixatipo.AsString = 'VC' then
    qryFrenteCaixadescricaotipo.AsString := 'VISA CRÉDITO'
  else
  if qryFrenteCaixatipo.AsString = 'AD' then
    qryFrenteCaixadescricaotipo.AsString := 'AMEX DÉBITO'
  else
  if qryFrenteCaixatipo.AsString = 'AC' then
    qryFrenteCaixadescricaotipo.AsString := 'AMEX CRÉDITO'
  else
  if qryFrenteCaixatipo.AsString = 'HD' then
    qryFrenteCaixadescricaotipo.AsString := 'HIPERCARD DÉBITO'
  else
  if qryFrenteCaixatipo.AsString = 'HC' then
    qryFrenteCaixadescricaotipo.AsString := 'HIPERCARD CRÉDITO'

  else
  if qryFrenteCaixatipo.AsString = 'TF' then
    qryFrenteCaixadescricaotipo.AsString := 'TEF';
end;


end.
