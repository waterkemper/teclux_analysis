unit dmcadastromaquinas;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, ctconstantes, Forms, fr_dset, fr_dbset, fr_class,
  fmpreviewpadrao, ZTransact;

type
  TdtmCadastroMaquinas = class(TdtmBasico)
    dsrMaquinas: TtecDataSource;
    qryMaquinas: TtecQuery;
    qryMaquinasProximo: TtecQuery;
    qryMaquinasProximocodigo: TIntegerField;
    qryMaquinascodigo: TIntegerField;
    qryMaquinasdescricao: TStringField;
    qryMaquinasquantidade: TIntegerField;
    qryMaquinascapacidade: TIntegerField;
    qryOperacoesMaquinas: TtecQuery;
    dsrOperacoesMaquinas: TtecDataSource;
    qryOperacoesMaquinasmaquina: TIntegerField;
    qryOperacoesMaquinasoperacao: TIntegerField;
    qryOperacoesMaquinasnome: TStringField;
    qryOperacoesMaquinasc01: TStringField;
    qryOperacoesMaquinasc02: TStringField;
    qryOperacoesMaquinasc03: TStringField;
    qryOperacoesMaquinasdescricao: TStringField;
    qryRegistrodasOperacoes: TtecQuery;
    qryRegistrodasOperacoesusuarioinclusao: TStringField;
    qryRegistrodasOperacoesdatainclusao: TStringField;
    qryRegistrodasOperacoesusuarioalteracao: TStringField;
    qryRegistrodasOperacoesdataalteracao: TStringField;
    qryRegistrodasOperacoesoperacao: TStringField;
    qryRegistrodasOperacoestabela: TStringField;
    qryRegistrodasOperacoesnomeusuarioinclusao: TStringField;
    qryRegistrodasOperacoesnomeusuarioalteracao: TStringField;
    qryImprimirMaquinas: TtecQuery;
    fdsImprimirMaquinas: TfrDBDataSet;
    frpImprimirMaquinas: TfrReport;
    frpImprimirMaquinasOperacoes: TfrReport;
    fdsImprimirMaquinasOperacoes: TfrDBDataSet;
    qryImprimirMaquinasOperacoes: TtecQuery;
    qryImprimirMaquinascodigo: TIntegerField;
    qryImprimirMaquinasdescricao: TStringField;
    qryImprimirMaquinasquantidade: TIntegerField;
    qryImprimirMaquinascapacidade: TIntegerField;
    qryImprimirMaquinasusuarioinclusao: TStringField;
    qryImprimirMaquinasdatahorainclusao: TDateTimeField;
    qryImprimirMaquinasusuarioalteracao: TStringField;
    qryImprimirMaquinasdatahoraalteracao: TStringField;
    qryImprimirMaquinasoperacao: TStringField;
    qryImprimirMaquinastabela: TStringField;
    qryImprimirMaquinasOperacoescodigomaquina: TIntegerField;
    qryImprimirMaquinasOperacoesdescricaomaquina: TStringField;
    qryImprimirMaquinasOperacoesquantidade: TIntegerField;
    qryImprimirMaquinasOperacoescapacidade: TIntegerField;
    qryImprimirMaquinasOperacoesaperacaomaquina: TIntegerField;
    qryImprimirMaquinasOperacoesmaquina: TIntegerField;
    qryImprimirMaquinasOperacoesnome: TStringField;
    qryImprimirMaquinasOperacoescodigooperacao: TIntegerField;
    qryImprimirMaquinasOperacoesc01: TStringField;
    qryImprimirMaquinasOperacoesc02: TStringField;
    qryImprimirMaquinasOperacoesc03: TStringField;
    qryImprimirMaquinasOperacoesdescricaooperacao: TStringField;
    qryImprimirMaquinasOperacoessetup: TBooleanField;
    qryImprimirMaquinasOperacoesplanocontrole: TBooleanField;
    qryImprimirMaquinasOperacoesdescr_c01: TStringField;
    qryImprimirMaquinasOperacoesdescr_c02: TStringField;
    qryImprimirMaquinasOperacoesdescr_c03: TStringField;
    qryImprimirMaquinasOperacoesdescricaosetup: TStringField;
    qryImprimirMaquinasOperacoesusuarioinclusao: TStringField;
    qryImprimirMaquinasOperacoesdatahorainclusao: TDateTimeField;
    qryImprimirMaquinasOperacoesusuarioalteracao: TStringField;
    qryImprimirMaquinasOperacoesdatahoraalteracao: TStringField;
    qryImprimirMaquinasOperacoesoperacao: TStringField;
    qryImprimirMaquinasOperacoestabela: TStringField;
    qryMaquinassetorproducao: TStringField;
    qryMaquinasusocomum: TBooleanField;
    procedure qryOperacoesMaquinasAfterDelete(DataSet: TDataSet);
    procedure qryOperacoesMaquinasAfterEdit(DataSet: TDataSet);
    procedure qryOperacoesMaquinasAfterOpen(DataSet: TDataSet);
    procedure qryOperacoesMaquinasAfterPost(DataSet: TDataSet);
    procedure qryOperacoesMaquinasNewRecord(DataSet: TDataSet);
    procedure qryMaquinasAfterScroll(DataSet: TDataSet);
    procedure frpImprimirMaquinasBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpImprimirMaquinasOperacoesBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryMaquinasNewRecord(DataSet: TDataSet);
  private
    FListaOperacoesSelecionadas: String;
    FonMaquinasUsuariosNewRecord: TNotifyEvent;
    FListaUsuariosSelecionados: String;
    { Private declarations }
  protected
    function ProximoCodigo: Integer;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure ExcluirMaquinas;
    procedure IncluirMaquinas;
    procedure AtualizaListaOperacoes;
    procedure EditarOperacoesMaquinas;
    procedure IncluirOperacao;
    function GravarMaquinas: Boolean;
    property onMaquinasUsuariosNewRecord : TNotifyEvent read FonMaquinasUsuariosNewRecord write FonMaquinasUsuariosNewRecord;
    procedure EditarMaquinas;
    property ListaUsuariosSelecionados: String read FListaUsuariosSelecionados write FListaUsuariosSelecionados;
    property ListaOperacoesSelecionadas: String read FListaOperacoesSelecionadas write FListaOperacoesSelecionadas;
    procedure ExcluirOperacoesMaquinas;
    procedure GravarOperacoesMaquinas;
    function SalvarOperacoesMaquinas: boolean;
    procedure imprimir(dataInicialInclusao, dataFinalInclusao, dataInicialAlteracao, dataFinalAlteracao: String;
                       listarOperacoes: Boolean;
                       ordenacao: integer);

  end;

var
  dtmCadastroMaquinas: TdtmCadastroMaquinas;

implementation

{$R *.dfm}

procedure TdtmCadastroMaquinas.ExcluirMaquinas;
begin
  if not qryMaquinas.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a M핽UINA'])) = smbOk) then
    begin
       qryMaquinas.Delete;
       Perpetrar([qryMaquinas]);
    end;
end;

function TdtmCadastroMaquinas.GravarMaquinas: Boolean;
var
  CodigoMaquinaGerado: integer;

  function AtribuirCodigo: boolean;
  begin
    result := true;
    GuardarRegistroAtual(qryOperacoesMaquinas,true);
    qryOperacoesMaquinas.First;
    while not qryOperacoesMaquinas.Eof do
    begin
      if qryOperacoesMaquinasMaquina.AsInteger = CodigoMaquinaGerado then
      begin
        qryOperacoesMaquinas.Edit;
        if qryOperacoesMaquinasMaquina.AsInteger <> qryMaquinasCodigo.AsInteger then
          qryOperacoesMaquinasMaquina.AsInteger := qryMaquinasCodigo.AsInteger;
        qryOperacoesMaquinas.Post;
      end;
      (* COMPARA O VALOR DO TEMPO PADRAO COM O ORIGINAL E GUARDA EM "LISTATEMPOPADRAO" P/ GERAR O UPDATE *)

      result := qryOperacoesMaquinas.CheckRequiredFields;
      if not result then
        break;

      qryOperacoesMaquinas.Next;
    end;
    VoltarRegistroAtual(qryOperacoesMaquinas);
  end;


begin
  result := false;
  if (qryMaquinas.CheckRequiredFields) then
  begin
    if SalvarOperacoesMaquinas then
    begin
      CodigoMaquinaGerado := qryMaquinasCodigo.AsInteger;
      if qryMaquinas.State = dsinsert then
          qryMaquinasCodigo.AsInteger := ProximoCodigo;

      if AtribuirCodigo then
      begin
        qryMaquinas.Post;
        result := Perpetrar([qryMaquinas,
                             qryOperacoesMaquinas]);

        RefazConsultaPorNome(qryRegistrodasOperacoes,['maquina'],[qryMaquinascodigo.AsVariant]);
      end;
    end;
  end;

end;

procedure TdtmCadastroMaquinas.IncluirMaquinas;
begin
  qryMaquinas.Insert;
  qryMaquinascodigo.AsInteger := ProximoCodigo;
end;

function TdtmCadastroMaquinas.ProximoCodigo: Integer;
begin
 qryMaquinasProximo.Open;
 result := qryMaquinasProximocodigo.AsInteger;
 qryMaquinasProximo.Close;
end;


procedure TdtmCadastroMaquinas.EditarMaquinas;
begin
  if not (qryMaquinas.State in [dsedit, dsinsert]) then
    qryMaquinas.Edit;
end;

constructor TdtmCadastroMaquinas.Create(AOwner: TComponent);
begin
  inherited;
  qryMaquinas.Tag := ctTabelas;
  FListaOperacoesSelecionadas := '0';

end;

destructor TdtmCadastroMaquinas.Destroy;
begin

  inherited;
end;


procedure TdtmCadastroMaquinas.qryOperacoesMaquinasAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  EditarMaquinas;
  AtualizaListaOperacoes;

end;

procedure TdtmCadastroMaquinas.AtualizaListaOperacoes;
var
  Pos: TBookmark;
begin
  Pos := qryOperacoesMaquinas.GetBookmark;
  qryOperacoesMaquinas.DisableControls;

  try
    ListaOperacoesSelecionadas := '';

    qryOperacoesMaquinas.AfterEdit := nil;
    qryOperacoesMaquinas.AfterPost := nil;
    qryOperacoesMaquinas.First;
    while Not qryOperacoesMaquinas.Eof do
    begin
      if qryOperacoesMaquinasoperacao.AsString<>'' then
        if ListaOperacoesSelecionadas <> '' then
          ListaOperacoesSelecionadas := ListaOperacoesSelecionadas + ', '+
                                       qryOperacoesMaquinasoperacao.AsString
        else
          ListaOperacoesSelecionadas := qryOperacoesMaquinasoperacao.AsString;


      qryOperacoesMaquinas.Next;

    end;


  finally

    if ListaOperacoesSelecionadas = '' then
      ListaOperacoesSelecionadas := '0';

    if ListaOperacoesSelecionadas <> '0' then
    begin
      if copy(ListaOperacoesSelecionadas,Length(ListaOperacoesSelecionadas),1)=',' then
        ListaOperacoesSelecionadas := copy(ListaOperacoesSelecionadas,0, Length(ListaOperacoesSelecionadas)-1)
    end
    else
      ListaOperacoesSelecionadas := '0';


    qryOperacoesMaquinas.AfterEdit := qryOperacoesMaquinasAfterEdit;
    qryOperacoesMaquinas.AfterPost := qryOperacoesMaquinasAfterPost;

    qryOperacoesMaquinas.GotoBookmark(Pos);
    qryOperacoesMaquinas.FreeBookmark(Pos);


    qryOperacoesMaquinas.EnableControls;
  end;
end;

procedure TdtmCadastroMaquinas.qryOperacoesMaquinasAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
  EditarMaquinas;
end;

procedure TdtmCadastroMaquinas.qryOperacoesMaquinasAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  AtualizaListaOperacoes;
end;

procedure TdtmCadastroMaquinas.qryOperacoesMaquinasAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  EditarMaquinas;
  AtualizaListaOperacoes;
end;

procedure TdtmCadastroMaquinas.qryOperacoesMaquinasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryOperacoesMaquinasMaquina.AsInteger := qryMaquinasCodigo.AsInteger;
end;

procedure TdtmCadastroMaquinas.IncluirOperacao;
begin
  qryOperacoesMaquinas.Insert;
end;

procedure TdtmCadastroMaquinas.EditarOperacoesMaquinas;
begin
  if not (qryOperacoesMaquinas.State in [dsedit, dsinsert]) then
    qryOperacoesMaquinas.Edit;
end;

procedure TdtmCadastroMaquinas.ExcluirOperacoesMaquinas;
begin
  if not qryOperacoesMaquinas.IsEmpty then
    if not qryOperacoesMaquinas.ReadOnly then
      if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a OPERA플O desta M핽UINA'])) = smbOk) then
         qryOperacoesMaquinas.Delete;
end;

procedure TdtmCadastroMaquinas.GravarOperacoesMaquinas;
begin
  if (qryOperacoesMaquinas.State in [dsEdit, dsInsert]) then
     qryOperacoesMaquinas.Post;

end;

function TdtmCadastroMaquinas.SalvarOperacoesMaquinas: boolean;
begin
  result := true;
  if (qryOperacoesMaquinas.State in [dsEdit, dsInsert]) then
  begin
    if qryOperacoesMaquinas.CheckRequiredFields then
      qryOperacoesMaquinas.Post
    else
      result := false;
  end;
end;


procedure TdtmCadastroMaquinas.qryMaquinasAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ReFazConsulta(qryOperacoesMaquinas,[0], [qryMaquinasCodigo.AsVariant]);
  RefazConsultaPorNome(qryRegistrodasOperacoes,['maquina'],[qryMaquinascodigo.AsVariant]);

end;


procedure TdtmCadastroMaquinas.imprimir(dataInicialInclusao,
  dataFinalInclusao, dataInicialAlteracao, dataFinalAlteracao: String;
  listarOperacoes: Boolean; ordenacao: integer);
const
  SQLDataInicial = 'and cast(trigger_changed as date) between :datainicialalteracao and :datafinalalteracao';

var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;

begin
  if (dataInicialInclusao<>'') and (dataFinalInclusao<>'') then
  begin
    qryImprimirMaquinas.MacroByName('datainclusao').asstring := 'and cast(trigger_changed as date) between :datainicialinclusao and :datafinalinclusao';
    qryImprimirMaquinas.MacroByName('InclusaoMaquinas').asstring := 'and cast(datahorainclusao as date) between :datainicialinclusao and :datafinalinclusao';

    qryImprimirMaquinas.paramByName('datainicialinclusao').AsDateTime := strtodatetime(dataInicialinclusao);
    qryImprimirMaquinas.paramByName('datafinalinclusao').AsDateTime := strtodatetime(dataFinalinclusao);

  end
   else
  if (dataInicialinclusao<>'') and (dataFinalinclusao='') then
  begin
    qryImprimirMaquinas.MacroByName('datainclusao').asstring := 'and cast(trigger_changed as date) >= :datainicialinclusao';
    qryImprimirMaquinas.MacroByName('InclusaoMaquinas').asstring := 'and cast(datahorainclusao as date) >= :datainicialinclusao';
    qryImprimirMaquinas.paramByName('datainicialinclusao').AsDateTime := strtodatetime(dataInicialinclusao);
    qryImprimirMaquinas.paramByName('datafinalinclusao').clear;
  end
  else
  if (dataInicialinclusao='') and (dataFinalinclusao<>'') then
  begin
    qryImprimirMaquinas.MacroByName('datainclusao').asstring := 'and cast(trigger_changed as date) <= :datafinalinclusao';
    qryImprimirMaquinas.MacroByName('InclusaoMaquinas').asstring := 'and cast(datahorainclusao as date) <= :datafinalinclusao';
    qryImprimirMaquinas.paramByName('datainicialinclusao').clear;
    qryImprimirMaquinas.paramByName('datafinalinclusao').AsDateTime := strtodatetime(dataFinalinclusao);
  end
  else
  if (dataInicialinclusao='') and (dataFinalinclusao='') then
  begin
    qryImprimirMaquinas.MacroByName('datainclusao').asstring := '';
    qryImprimirMaquinas.MacroByName('InclusaoMaquinas').asstring := '';
    qryImprimirMaquinas.paramByName('datainicialinclusao').clear;
    qryImprimirMaquinas.paramByName('datafinalinclusao').clear;
  end;



  if (dataInicialalteracao<>'') and (dataFinalalteracao<>'') then
  begin
    qryImprimirMaquinas.MacroByName('dataalteracao').asstring := 'and cast(trigger_changed as date) between :datainicialalteracao and :datafinalalteracao';
    qryImprimirMaquinas.MacroByName('AlteracaoMaquinas').asstring := 'and cast(datahoraalteracao as date) between :datainicialalteracao and :datafinalalteracao';
    qryImprimirMaquinas.paramByName('datainicialalteracao').AsDateTime := strtodatetime(dataInicialAlteracao);
    qryImprimirMaquinas.paramByName('datafinalalteracao').AsDateTime := strtodatetime(dataFinalAlteracao);
  end
  else
  if (dataInicialalteracao<>'') and (dataFinalalteracao='') then
  begin
    qryImprimirMaquinas.MacroByName('dataalteracao').asstring := 'and cast(trigger_changed as date) >= :datainicialalteracao';
    qryImprimirMaquinas.MacroByName('AlteracaoMaquinas').asstring := 'and cast(datahoraalteracao as date) >= :datainicialalteracao';
    qryImprimirMaquinas.paramByName('datainicialalteracao').AsDateTime := strtodatetime(dataInicialAlteracao);
    qryImprimirMaquinas.paramByName('datafinalalteracao').clear;
  end
  else
  if (dataInicialalteracao='') and (dataFinalalteracao<>'') then
  begin
    qryImprimirMaquinas.MacroByName('dataalteracao').asstring := 'and cast(trigger_changed as date) <= :datafinalalteracao';
    qryImprimirMaquinas.MacroByName('AlteracaoMaquinas').asstring := 'and cast(datahoraalteracao as date) <= :datafinalalteracao';
    qryImprimirMaquinas.paramByName('datainicialalteracao').clear;
    qryImprimirMaquinas.paramByName('datafinalalteracao').AsDateTime := strtodatetime(dataFinalAlteracao);
  end
  else
  if (dataInicialalteracao='') and (dataFinalalteracao='') then
  begin
    qryImprimirMaquinas.MacroByName('dataalteracao').asstring := '';
    qryImprimirMaquinas.MacroByName('AlteracaoMaquinas').asstring := '';
    qryImprimirMaquinas.paramByName('datainicialalteracao').clear;
    qryImprimirMaquinas.paramByName('datafinalalteracao').clear;
  end;

  qryImprimirMaquinasOperacoes.Macros := qryImprimirMaquinas.Macros;
  qryImprimirMaquinasOperacoes.Params := qryImprimirMaquinas.Params;


  case ordenacao of
  0: begin
       qryImprimirMaquinas.MacroByName('Ordenacao').asstring := 'order by m.codigo';
       qryImprimirMaquinasOperacoes.MacroByName('Ordenacao').asstring := 'order by m.codigomaquina, m.codigooperacao';
     end;
  1: begin
       qryImprimirMaquinas.MacroByName('Ordenacao').asstring := 'order by m.descricao';
       qryImprimirMaquinasOperacoes.MacroByName('Ordenacao').asstring := 'order by m.descricaomaquina, m.codigooperacao';
     end;
  end;


  frmPreview := TfrmPreviewPadrao.create(self);
  frmPreview.cmbZoom.ItemIndex := 3; //125%
  try
   Relatorio := frmPreview.frCompositeReport;
   with frmPreview do
   begin
     frCompositeReport.Reports.Clear;
     frCompositeReport.DoublePass:= True;

     if not listarOperacoes then
     begin
       frVariables['TITULO'] := 'CADASTRO DE M핽UINAS';
       frVariables['SUBTITULO'] := '';
       frCompositeReport.Reports.Add(frpImprimirMaquinas)
     end
     else
     begin
       frVariables['TITULO'] := 'CADASTRO DE M핽UINAS';
       frVariables['SUBTITULO'] := 'COM RELA플O DE OPERA합ES';
       frCompositeReport.Reports.Add(frpImprimirMaquinasOperacoes);
     end;

     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
   end;
  finally
   frmPreview.Free
  end;


end;


procedure TdtmCadastroMaquinas.frpImprimirMaquinasBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpImprimirMaquinas,View);
end;

procedure TdtmCadastroMaquinas.frpImprimirMaquinasOperacoesBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpImprimirMaquinasOperacoes,View);
end;

procedure TdtmCadastroMaquinas.qryMaquinasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryMaquinasusocomum.AsBoolean := false;
end;

end.
