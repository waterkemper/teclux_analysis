unit dmcadastroSetoresProducao;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, biblio, ctconstantes, Forms, fr_dset, fr_dbset, fr_class,
  fmpreviewpadrao, ZTransact, dateutils;

type
  TdtmCadastroSetoresProducao = class(TdtmBasico)
    dsrSetoresProducao: TtecDataSource;
    qrySetoresProducao: TtecQuery;
    qrySetoresProducaodescricao: TStringField;
    qrySetoresProducaocodigo: TStringField;
    qryRegistrodasOperacoes: TtecQuery;
    qryRegistrodasOperacoesusuarioinclusao: TStringField;
    qryRegistrodasOperacoesdatainclusao: TStringField;
    qryRegistrodasOperacoesusuarioalteracao: TStringField;
    qryRegistrodasOperacoesdataalteracao: TStringField;
    qryRegistrodasOperacoesoperacao: TStringField;
    qryRegistrodasOperacoestabela: TStringField;
    qryRegistrodasOperacoesnomeusuarioinclusao: TStringField;
    qryRegistrodasOperacoesnomeusuarioalteracao: TStringField;
    qryImprimirSetoresProducao: TtecQuery;
    frpImprimirSetoresProducao: TfrReport;
    fdsImprimirSetoresProducao: TfrDBDataSet;
    qryImprimirSetoresProducaocodigo: TStringField;
    qryImprimirSetoresProducaodescricao: TStringField;
    qryImprimirSetoresProducaonumeropedidoosp: TIntegerField;
    qryImprimirSetoresProducaousuarioinclusao: TStringField;
    qryImprimirSetoresProducaodatahorainclusao: TDateTimeField;
    qryImprimirSetoresProducaousuarioalteracao: TStringField;
    qryImprimirSetoresProducaodatahoraalteracao: TStringField;
    qryImprimirSetoresProducaooperacao: TStringField;
    qryImprimirSetoresProducaotabela: TStringField;
    qrySetoresProducaoLideres: TtecQuery;
    dsrSetoresProducaoLideres: TtecDataSource;
    qrySetoresProducaoLideressetor: TStringField;
    qrySetoresProducaoLideresusuario: TIntegerField;
    qrySetoresProducaoLideresdatainiciallideranca: TDateField;
    qrySetoresProducaoLideresdatafinallideranca: TDateField;
    qrySetoresProducaoLideresnomeusuario: TStringField;
    qrySetoresProducaoLideresusuariovalidado: TBooleanField;
    qrySetoresProducaoPremiacao: TtecQuery;
    dsrSetoresProducaoPremiacao: TtecDataSource;
    qrySetoresProducaoPremiacaosetor: TStringField;
    qrySetoresProducaoPremiacaomes: TStringField;
    qrySetoresProducaoPremiacaovalor: TFloatField;
    qrySetoresProducaoLideresturno: TIntegerField;
    qrySetoresProducaoLideresdescricaoturno: TStringField;
    qrySetoresProducaoCustoHomemHora: TFloatField;
    qrySetoresProducaoFatorCusto: TFloatField;
    procedure qrySetoresProducaoAfterScroll(DataSet: TDataSet);
    procedure frpImprimirSetoresProducaoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qrySetoresProducaoLideresNewRecord(DataSet: TDataSet);
    procedure qrySetoresProducaoLideresAfterScroll(DataSet: TDataSet);
    procedure qrySetoresProducaoLideresAfterPost(DataSet: TDataSet);
    procedure qrySetoresProducaoLideresAfterDelete(DataSet: TDataSet);
    procedure qrySetoresProducaoLideresAfterEdit(DataSet: TDataSet);
    procedure qrySetoresProducaoLideresAfterInsert(DataSet: TDataSet);
    procedure dsrSetoresProducaoLideresDataChange(Sender: TObject;
      Field: TField);
    procedure qrySetoresProducaoPremiacaoNewRecord(DataSet: TDataSet);
    procedure qrySetoresProducaoPremiacaoAfterPost(DataSet: TDataSet);
    procedure dsrSetoresProducaoPremiacaoDataChange(Sender: TObject;
      Field: TField);
    procedure qrySetoresProducaoPremiacaoBeforePost(DataSet: TDataSet);
    procedure qrySetoresProducaoPremiacaoAfterScroll(DataSet: TDataSet);
  private
    FListaUsuariosSelecionados: String;
    FListaUsuariosTerminoAberto: String;
    { Private declarations }
  protected
{    procedure AtualizaListaUsuariosTerminoemAberto;}


  public
    { Public declarations }
    vdatafinallideranca, vdatainiciallideranca  : String;
    vErroMesAno : boolean;
    vMes: String;
    vAno: String;


    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure ExcluirSetoresProducao;

    procedure IncluirSetoresProducao;
    procedure IncluirSetoresProducaoLideres;
    procedure ExcluirSetoresProducaoLideres;

    procedure IncluirSetoresProducaoPremiacao;
    procedure ExcluirSetoresProducaoPremiacao;

    function GravarSetoresProducao: Boolean;
    procedure Editar;
    property ListaUsuariosSelecionados: String read FListaUsuariosSelecionados write FListaUsuariosSelecionados;
    procedure imprimir(dataInicialInclusao, dataFinalInclusao, dataInicialAlteracao, dataFinalAlteracao: String;
                       ordenacao: integer);
    property ListaUsuariosTerminoAberto: String read FListaUsuariosTerminoAberto write FListaUsuariosTerminoAberto;
    procedure LimparOperacoesOSPUsuario;
    function MesAno: String;


  end;

var
  dtmCadastroSetoresProducao: TdtmCadastroSetoresProducao;
   Listar : tStringlist;
implementation

{$R *.dfm}

procedure TdtmCadastroSetoresProducao.ExcluirSetoresProducao;
begin
  if not qrySetoresProducao.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['este SETOR'])) = smbOk) then
    begin
       qrySetoresProducao.Delete;
       Perpetrar([qrySetoresProducao]);
       RefazConsultaPorNome(qryRegistrodasOperacoes,['setor'],[qrySetoresProducaocodigo.AsVariant]);
    end;
end;

function TdtmCadastroSetoresProducao.GravarSetoresProducao: Boolean;
begin
  result := false;
  if (qrySetoresProducao.CheckRequiredFields) then
  begin
    qrySetoresProducao.Post;
    result := Perpetrar([qrySetoresProducao, qrySetoresProducaoLideres, qrySetoresProducaoPremiacao]);
    qrySetoresProducaoAfterScroll(nil);
{    AtualizaListaUsuariosTerminoemAberto;}
  end;
end;

procedure TdtmCadastroSetoresProducao.IncluirSetoresProducao;
begin
  qrySetoresProducao.Append;
end;


procedure TdtmCadastroSetoresProducao.Editar;
begin
  if not (qrySetoresProducao.State in [dsedit, dsinsert]) then
    qrySetoresProducao.Edit;
end;

constructor TdtmCadastroSetoresProducao.Create(AOwner: TComponent);
begin
  inherited;
  qrySetoresProducao.Tag := ctTabelas;
  ListaUsuariosTerminoAberto := '0';
end;

destructor TdtmCadastroSetoresProducao.Destroy;
begin

  inherited;
end;


procedure TdtmCadastroSetoresProducao.qrySetoresProducaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  RefazConsultaPorNome(qryRegistrodasOperacoes,['setor'],[qrySetoresProducaocodigo.AsVariant]);
  RefazConsultaPorNome(qrySetoresProducaoLideres,['setor'],[qrySetoresProducaocodigo.AsVariant]);
  RefazConsultaPorNome(qrySetoresProducaoPremiacao,['setor'],[qrySetoresProducaocodigo.AsVariant]);

{  AtualizaListaUsuariosTerminoemAberto;}
end;

procedure TdtmCadastroSetoresProducao.imprimir(dataInicialInclusao,
  dataFinalInclusao, dataInicialAlteracao, dataFinalAlteracao: String;
  ordenacao: integer);
const
  SQLDataInicial = 'and cast(trigger_changed as date) between :datainicialalteracao and :datafinalalteracao';
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  if (dataInicialInclusao<>'') and (dataFinalInclusao<>'') then
  begin
    qryImprimirSetoresProducao.MacroByName('datainclusao').asstring := 'and cast(trigger_changed as date) between :datainicialinclusao and :datafinalinclusao';
    qryImprimirSetoresProducao.MacroByName('InclusaoSetoresProducao').asstring := 'and cast(datahorainclusao as date) between :datainicialinclusao and :datafinalinclusao';

    qryImprimirSetoresProducao.paramByName('datainicialinclusao').AsDateTime := strtodatetime(dataInicialinclusao);
    qryImprimirSetoresProducao.paramByName('datafinalinclusao').AsDateTime := strtodatetime(dataFinalinclusao);

  end
   else
  if (dataInicialinclusao<>'') and (dataFinalinclusao='') then
  begin
    qryImprimirSetoresProducao.MacroByName('datainclusao').asstring := 'and cast(trigger_changed as date) >= :datainicialinclusao';
    qryImprimirSetoresProducao.MacroByName('InclusaoSetoresProducao').asstring := 'and cast(datahorainclusao as date) >= :datainicialinclusao';
    qryImprimirSetoresProducao.paramByName('datainicialinclusao').AsDateTime := strtodatetime(dataInicialinclusao);
    qryImprimirSetoresProducao.paramByName('datafinalinclusao').clear;
  end
  else
  if (dataInicialinclusao='') and (dataFinalinclusao<>'') then
  begin
    qryImprimirSetoresProducao.MacroByName('datainclusao').asstring := 'and cast(trigger_changed as date) <= :datafinalinclusao';
    qryImprimirSetoresProducao.MacroByName('InclusaoSetoresProducao').asstring := 'and cast(datahorainclusao as date) <= :datafinalinclusao';
    qryImprimirSetoresProducao.paramByName('datainicialinclusao').clear;
    qryImprimirSetoresProducao.paramByName('datafinalinclusao').AsDateTime := strtodatetime(dataFinalinclusao);
  end
  else
  if (dataInicialinclusao='') and (dataFinalinclusao='') then
  begin
    qryImprimirSetoresProducao.MacroByName('datainclusao').asstring := '';
    qryImprimirSetoresProducao.MacroByName('InclusaoSetoresProducao').asstring := '';
    qryImprimirSetoresProducao.paramByName('datainicialinclusao').clear;
    qryImprimirSetoresProducao.paramByName('datafinalinclusao').clear;
  end;



  if (dataInicialalteracao<>'') and (dataFinalalteracao<>'') then
  begin
    qryImprimirSetoresProducao.MacroByName('dataalteracao').asstring := 'and cast(trigger_changed as date) between :datainicialalteracao and :datafinalalteracao';
    qryImprimirSetoresProducao.MacroByName('AlteracaoSetoresProducao').asstring := 'and cast(datahoraalteracao as date) between :datainicialalteracao and :datafinalalteracao';
    qryImprimirSetoresProducao.paramByName('datainicialalteracao').AsDateTime := strtodatetime(dataInicialAlteracao);
    qryImprimirSetoresProducao.paramByName('datafinalalteracao').AsDateTime := strtodatetime(dataFinalAlteracao);
  end
  else
  if (dataInicialalteracao<>'') and (dataFinalalteracao='') then
  begin
    qryImprimirSetoresProducao.MacroByName('dataalteracao').asstring := 'and cast(trigger_changed as date) >= :datainicialalteracao';
    qryImprimirSetoresProducao.MacroByName('AlteracaoSetoresProducao').asstring := 'and cast(datahoraalteracao as date) >= :datainicialalteracao';
    qryImprimirSetoresProducao.paramByName('datainicialalteracao').AsDateTime := strtodatetime(dataInicialAlteracao);
    qryImprimirSetoresProducao.paramByName('datafinalalteracao').clear;
  end
  else
  if (dataInicialalteracao='') and (dataFinalalteracao<>'') then
  begin
    qryImprimirSetoresProducao.MacroByName('dataalteracao').asstring := 'and cast(trigger_changed as date) <= :datafinalalteracao';
    qryImprimirSetoresProducao.MacroByName('AlteracaoSetoresProducao').asstring := 'and cast(datahoraalteracao as date) <= :datafinalalteracao';
    qryImprimirSetoresProducao.paramByName('datainicialalteracao').clear;
    qryImprimirSetoresProducao.paramByName('datafinalalteracao').AsDateTime := strtodatetime(dataFinalAlteracao);
  end
  else
  if (dataInicialalteracao='') and (dataFinalalteracao='') then
  begin
    qryImprimirSetoresProducao.MacroByName('dataalteracao').asstring := '';
    qryImprimirSetoresProducao.MacroByName('AlteracaoSetoresProducao').asstring := '';
    qryImprimirSetoresProducao.paramByName('datainicialalteracao').clear;
    qryImprimirSetoresProducao.paramByName('datafinalalteracao').clear;
  end;

  case ordenacao of
  0: begin
       qryImprimirSetoresProducao.MacroByName('Ordenacao').asstring := 'order by sp.codigo';
     end;
  1: begin
       qryImprimirSetoresProducao.MacroByName('Ordenacao').asstring := 'order by sp.descricao';
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
     frVariables['TITULO'] := 'CADASTRO DE SETORES DE PRODUÇÃO';
     frCompositeReport.Reports.Add(frpImprimirSetoresProducao);
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
   end;
  finally
   frmPreview.Free
  end; 

end;

procedure TdtmCadastroSetoresProducao.frpImprimirSetoresProducaoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
    ZebrarLinhaRelatorio(frpImprimirSetoresProducao,View);
end;

procedure TdtmCadastroSetoresProducao.ZMonitor1MonitorEvent(Sql,
  Result: String);
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\relator.sql') then
    Listar.loadfromfile('c:\relator.sql');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\relator.sql');
  listar.free;
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoLideresNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qrySetoresProducaoLideresdatainiciallideranca.ReadOnly := false;
  qrySetoresProducaoLideresdatafinallideranca.ReadOnly := false;
  qrySetoresProducaoLideresusuario.ReadOnly := false;

  qrySetoresProducaoLideressetor.AsString := qrySetoresProducaocodigo.asstring;
  if vdatafinallideranca <> '' then
    qrySetoresProducaoLideresdatainiciallideranca.AsDateTime := strtodate(vdatafinallideranca)+1
  else
   qrySetoresProducaoLideresdatainiciallideranca.asdatetime := Datalocal;

//  qrySetoresProducaoLideresdatafinallideranca.clear;

end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoLideresAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qrySetoresProducaoLideres.recordcount = 0 then
  begin
    qrySetoresProducaoLideresdatainiciallideranca.ReadOnly := false;
    qrySetoresProducaoLideresdatafinallideranca.ReadOnly := false;
    qrySetoresProducaoLideresdatafinallideranca.ReadOnly := false;
    qrySetoresProducaoLideresusuario.ReadOnly := false;
  end
  else
  begin
    if qrySetoresProducaoLideres.state <> dsinsert then
    begin
      qrySetoresProducaoLideresdatainiciallideranca.ReadOnly := true;
      if qrySetoresProducaoLideres.recordcount <> 0 then
        qrySetoresProducaoLideresdatafinallideranca.ReadOnly := false
      else
        qrySetoresProducaoLideresdatafinallideranca.ReadOnly := true;
      qrySetoresProducaoLideresusuario.ReadOnly := true;
    end;  
  end;

  if qrySetoresProducaoLideres.state <> dsinsert then
  begin
    vdatainiciallideranca := qrySetoresProducaoLideresdatainiciallideranca.AsString;
    vdatafinallideranca := qrySetoresProducaoLideresdatafinallideranca.AsString;
  end;

end;

{
procedure TdtmCadastroSetoresProducao.AtualizaListaUsuariosTerminoemAberto;
var
  Pos: TBookmark;
begin
  Pos := qrySetoresProducaoLideres.GetBookmark;
  try
    qrySetoresProducaoLideres.AfterScroll := nil;
    qrySetoresProducaoLideres.DisableControls;
    ListaUsuariosTerminoAberto := '';
    qrySetoresProducaoLideres.First;
    while Not qrySetoresProducaoLideres.Eof do
    begin
      if qrySetoresProducaoLideresdatafinallideranca.isnull then
        if qrySetoresProducaoLideresusuariovalidado.AsBoolean then
          ListaUsuariosTerminoAberto := ListaUsuariosTerminoAberto +
                                       qrySetoresProducaoLideresusuario.AsString + ',';
      qrySetoresProducaoLideres.Next
    end;

    if ListaUsuariosTerminoAberto <> '' then
      ListaUsuariosTerminoAberto := copy(ListaUsuariosTerminoAberto,0, Length(ListaUsuariosTerminoAberto)-1)
    else
      ListaUsuariosTerminoAberto := '0';

  finally
    qrySetoresProducaoLideres.GotoBookmark(Pos);
    qrySetoresProducaoLideres.FreeBookmark(Pos);
    qrySetoresProducaoLideres.enableControls;
    qrySetoresProducaoLideres.AfterScroll := qrySetoresProducaoLideresAfterScroll;
  end
end;
}

procedure TdtmCadastroSetoresProducao.LimparOperacoesOSPUsuario;
begin
   if not (qrySetoresProducaoLideres.State in [dsedit, dsinsert]) then
     qrySetoresProducaoLideres.Edit;
   qrySetoresProducaoLideresusuario.Clear;
   qrySetoresProducaoLideresnomeusuario.Clear;
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoLideresAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qrySetoresProducao.Edit;
//  AtualizaListaUsuariosTerminoemAberto;
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoLideresAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  qrySetoresProducao.Edit;
//  AtualizaListaUsuariosTerminoemAberto;
end;

procedure TdtmCadastroSetoresProducao.IncluirSetoresProducaoLideres;
begin
  GuardarRegistroAtual(qrySetoresProducaoLideres, true);
  qrySetoresProducaoLideres.Last;
  qrySetoresProducaoLideres.append;
  VoltarRegistroAtual(qrySetoresProducaoLideres);
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoLideresAfterEdit(
  DataSet: TDataSet);
begin
  inherited;
//  qrySetoresProducaoLideres.Cancel;
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoLideresAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  {
  if (vdatafinallideranca = '') and
     (qrySetoresProducaoLideres.RecordCount <> 0) then
  begin
    MensagemAviso('A inclusão de um líder requer o término do último líder cadastrado.');
    qrySetoresProducaoLideres.cancel;
  end;
  }
end;

procedure TdtmCadastroSetoresProducao.ExcluirSetoresProducaoLideres;
begin
  if not qrySetoresProducaoLideres.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['este LÍDER DO SETOR'])) = smbOk) then
    begin
       qrySetoresProducaoLideres.Delete;
       Perpetrar([qrySetoresProducaoLideres]);
 //      RefazConsultaPorNome(qryRegistrodasOperacoes,['setor'],[qrySetoresProducaocodigo.AsVariant]);
    end;
end;

procedure TdtmCadastroSetoresProducao.dsrSetoresProducaoLideresDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qrySetoresProducaoLideresdatainiciallideranca then
  begin
    if not field.IsNull then
    begin
      if (vdatainiciallideranca<>'') and (vdatafinallideranca<>'') then
      begin
        if (field.AsDateTime >= StrToDate(vdatainiciallideranca)) and
           (field.AsDateTime <= strtodate(vdatafinallideranca)) then
        begin
          MensagemErro('A data inicial não pode estar em um intervalo já selecionado');
          field.clear;
        end;
      end;
    end;
  end
  else
  if field = qrySetoresProducaoLideresdatafinallideranca then
  begin
    if not field.IsNull then
    begin
      if (field.AsDateTime < qrySetoresProducaoLideresdatainiciallideranca.asdatetime) then
      begin
        MensagemErro('A data final não pode ser inferior à data inicial');
        field.clear;
      end;
    end;
  end;

end;

procedure TdtmCadastroSetoresProducao.IncluirSetoresProducaoPremiacao;
begin
  qrySetoresProducaoPremiacao.last;
  qrySetoresProducaoPremiacao.Append;
end;

procedure TdtmCadastroSetoresProducao.ExcluirSetoresProducaoPremiacao;
begin
  if not qrySetoresProducaoPremiacao.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a PREMIAÇÃO DESTE SETOR'])) = smbOk) then
    begin
       qrySetoresProducaoPremiacao.Delete;
       Perpetrar([qrySetoresProducaoPremiacao]);
 //      RefazConsultaPorNome(qryRegistrodasOperacoes,['setor'],[qrySetoresProducaocodigo.AsVariant]);
    end;
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoPremiacaoNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qrySetoresProducaoPremiacaosetor.AsString := qrySetoresProducaocodigo.asstring;
  qrySetoresProducaoPremiacaomes.AsString := MesAno;
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoPremiacaoAfterPost(
  DataSet: TDataSet);
begin
  if not vErroMesAno then
  begin
    inherited;
    qrySetoresProducao.Edit;
    GravarSetoresProducao;
  end
  else
    RefazConsultaPorNome(qrySetoresProducaoPremiacao,['setor'],[qrySetoresProducaocodigo.AsVariant]);
end;

procedure TdtmCadastroSetoresProducao.dsrSetoresProducaoPremiacaoDataChange(
  Sender: TObject; Field: TField);
var
  vData : TDateTime;
begin
  inherited;
  {
  if field = qrySetoresProducaoPremiacaomes then
  begin
    if (trim(trocar(qrySetoresProducaoPremiacaomes.asstring,'/',''))<>'') then
    begin
      try
        vData := strtodatetime('01/'+qrySetoresProducaoPremiacaomes.asstring);
      except
        MensagemAviso('Mês/Ano incorreto!');
        qrySetoresProducaoPremiacaomes.clear;
      end;
    end;
  end;
  }
end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoPremiacaoBeforePost(
  DataSet: TDataSet);
var
 vData : TDateTime;

begin
  vErroMesAno:= false;
  if (trim(trocar(qrySetoresProducaoPremiacaomes.asstring,'/',''))<>'') then
  begin
    try
      vData := strtodatetime('01/'+qrySetoresProducaoPremiacaomes.asstring);
    except
      MensagemAviso('Mês/Ano incorreto!');
      qrySetoresProducaoPremiacaomes.clear;
      qrySetoresProducaoPremiacao.Cancel;

      vErroMesAno := true;
    end;
  end;

  if not vErroMesAno then
    inherited;

end;

procedure TdtmCadastroSetoresProducao.qrySetoresProducaoPremiacaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qrySetoresProducaoPremiacao.state <> dsinsert then
  begin
    vmes := copy(qrySetoresProducaoPremiacaomes.AsString,1,2);
    vano := copy(qrySetoresProducaoPremiacaomes.AsString,4,4);
  end;
end;

function TdtmCadastroSetoresProducao.MesAno: String;
begin
  if vmes = '' then
    vMes := IntToStr(MonthOf(dataservidor));
  if vano = '' then
    vAno := IntToStr(YearOf(dataservidor));

  if vmes = '12' then
    result := '01/'+ FormatStringOut(inttostr(strtoint(vano)+1),'R','0',4)
  else
    result := FormatStringOut(inttostr(strtoint(vmes)+1),'R','0',2)+'/'+vano;
end;

end.
