unit dmcadastromoedas;

interface

uses
  SysUtils, Classes, dmbasico, dmtecsoft, DB, cpdatasource, ZQuery,
  ZPgSqlQuery, cpquery, ctconstantes, biblio, Forms, dateutils, clparametrossistema,
  ZTransact;

type
  TdtmCadastroMoedas = class(TdtmBasico)
    qryMoedas: TtecQuery;
    dsrMoedas: TtecDataSource;
    qryMoedascodigo: TStringField;
    qryMoedasdescricao: TStringField;
    qryMoedasnrdecimais: TIntegerField;
    qryGravacaoMoedasCotacoes: TtecQuery;
    dsrGravacaoMoedasCotacoes: TtecDataSource;
    qryGravacaoMoedasCotacoesmoeda: TStringField;
    qryGravacaoMoedasCotacoesdata: TDateField;
    qryGravacaoMoedasCotacoescotacao: TFloatField;
    qryGravacaoMoedasCotacoesobservacoes: TStringField;
    qryMoedasmesano: TStringField;
    qryGravacaoMoedasCotacoesdia: TIntegerField;
    qryMoedaspadrao: TBooleanField;
    qryMoedaPadrao: TtecQuery;
    qryMoedasCotacoes: TtecQuery;
    dsrMoedasCotacoes: TtecDataSource;
    qryMoedasCotacoesmoeda: TStringField;
    qryMoedasCotacoesdia1: TIntegerField;
    qryMoedasCotacoescotacao1: TFloatField;
    qryMoedasCotacoesobservacoes1: TStringField;
    qryMoedasCotacoesdia2: TIntegerField;
    qryMoedasCotacoescotacao2: TFloatField;
    qryMoedasCotacoesobservacoes2: TStringField;
    qryMoedasCotacoesdia3: TIntegerField;
    qryMoedasCotacoescotacao3: TFloatField;
    qryMoedasCotacoesobservacoes3: TStringField;
    qryMoedasCotacoesdata1: TDateField;
    qryMoedasCotacoesdata2: TDateField;
    qryMoedasCotacoesdata3: TDateField;
    qryMoedasInativo: TDateField;
    procedure qryMoedasAfterScroll(DataSet: TDataSet);
    procedure qryMoedasNewRecord(DataSet: TDataSet);
    procedure qryGravacaoMoedasCotacoesAfterOpen(DataSet: TDataSet);
    procedure dsrMoedasDataChange(Sender: TObject; Field: TField);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
    procedure qryMoedasCotacoesAfterScroll(DataSet: TDataSet);
    procedure qryMoedasCotacoesBeforeInsert(DataSet: TDataSet);
    procedure qryMoedasCotacoesAfterInsert(DataSet: TDataSet);
    procedure qryMoedasCotacoesAfterOpen(DataSet: TDataSet);
    procedure qryMoedasCotacoesAfterPost(DataSet: TDataSet);
    procedure qryMoedasCotacoesBeforePost(DataSet: TDataSet);
  private
    FDiasnoMes: integer;
    FMesAno: String;
    function GetDiasnoMes: integer;
    function GetMesAno: String;
  private
    { Private declarations }
    property DiasnoMes: integer read GetDiasnoMes write FDiasnoMes;
    property MesAno: String read GetMesAno write FMesAno;

  protected
    procedure EditarMoedas;
    procedure AtribuirMascara;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent);override;
    destructor Destroy; override;
    procedure IncluirMoedas;
    procedure ExcluirMoedas;
    function GravarMoedas: Boolean;
    procedure IncluirCotacoesMoedas(editar: Boolean);
    procedure ExcluirCotacoesMoedas;
    procedure ReplicarMoeda(Coluna: Integer);
    procedure AtribuirValorCotacao;
    procedure GravarMoedaCotacao;
    procedure CancelarMoedaCotacao;
  end;

var
  dtmCadastroMoedas: TdtmCadastroMoedas;

implementation

{$R *.dfm}

{ TdtmCadastroMoedas }

constructor TdtmCadastroMoedas.Create(AOwner: TComponent);
begin
  inherited;
  qryMoedas.Tag := ctTabelas;
end;

destructor TdtmCadastroMoedas.Destroy;
begin

  inherited;
end;

procedure TdtmCadastroMoedas.EditarMoedas;
begin
  if not (qryMoedas.state in [dsedit, dsinsert]) then
    qryMoedas.edit;
end;

procedure TdtmCadastroMoedas.ExcluirCotacoesMoedas;
begin
  if not qryMoedasCotacoes.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a COTAÇÃO'])) = smbOk) then
    begin
      qryMoedasCotacoes.Delete;
      EditarMoedas;
    end;
end;

procedure TdtmCadastroMoedas.ExcluirMoedas;
begin
  if not qryMoedas.IsEmpty then
    if (MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['a MOEDA'])) = smbOk) then
    begin
       qryMoedas.Delete;
       Perpetrar([qryMoedas]);
    end;
end;

function TdtmCadastroMoedas.GravarMoedas: Boolean;
begin
  result := false;
  if qryMoedas.CheckRequiredFields then
  begin
    GuardarRegistroAtual(qryMoedasCotacoes,true);
    qryMoedasCotacoes.First;
    while not qryMoedasCotacoes.Eof do
    begin
      if qryGravacaoMoedasCotacoes.Locate('data',qryMoedasCotacoesdata1.AsDateTime,[]) then
      begin
        qryGravacaoMoedasCotacoes.Edit;
        qryGravacaoMoedasCotacoesmoeda.AsString := qryMoedascodigo.AsString;
        qryGravacaoMoedasCotacoescotacao.AsFloat := qryMoedasCotacoescotacao1.AsFloat;
        qryGravacaoMoedasCotacoesobservacoes.AsString := qryMoedasCotacoesobservacoes1.AsString;
        qryGravacaoMoedasCotacoes.Post;
      end;

      if qryGravacaoMoedasCotacoes.Locate('data',qryMoedasCotacoesdata2.AsDateTime,[]) then
      begin
        qryGravacaoMoedasCotacoes.Edit;
        qryGravacaoMoedasCotacoesmoeda.AsString := qryMoedascodigo.AsString;
        qryGravacaoMoedasCotacoescotacao.AsFloat := qryMoedasCotacoescotacao2.AsFloat;
        qryGravacaoMoedasCotacoesobservacoes.AsString := qryMoedasCotacoesobservacoes2.AsString;
        qryGravacaoMoedasCotacoes.Post;
      end;

      if qryGravacaoMoedasCotacoes.Locate('data',qryMoedasCotacoesdata3.AsDateTime,[]) then
      begin
        qryGravacaoMoedasCotacoes.Edit;
        qryGravacaoMoedasCotacoesmoeda.AsString := qryMoedascodigo.AsString;
        qryGravacaoMoedasCotacoescotacao.AsFloat := qryMoedasCotacoescotacao3.AsFloat;
        qryGravacaoMoedasCotacoesobservacoes.AsString := qryMoedasCotacoesobservacoes3.AsString;
        qryGravacaoMoedasCotacoes.Post;
      end;

      qryMoedasCotacoes.Next;
    end;

    VoltarRegistroAtual(qryMoedasCotacoes);

    qryMoedas.Post;
    if qryMoedaspadrao.AsBoolean then
    begin
      qryMoedaPadrao.ParamByName('codigo').AsString := qryMoedascodigo.AsString;
      qryMoedaPadrao.ExecSql;
    end;
    result := Perpetrar([qrymoedas,qryGravacaomoedascotacoes, qrymoedapadrao]);
  end;
end;

procedure TdtmCadastroMoedas.IncluirCotacoesMoedas(editar: Boolean);
begin
  if not editar or qryMoedasCotacoes.IsEmpty then
    qryMoedasCotacoes.insert;
end;

procedure TdtmCadastroMoedas.IncluirMoedas;
begin
  qryMoedas.Insert;
end;

procedure TdtmCadastroMoedas.qryMoedasAfterScroll(DataSet: TDataSet);
var
  DataInicial, DataFinal: TdateTime;
begin
  inherited;
  if qryMoedasmesano.AsString <> '' then
  begin
    DataInicial := strtodate('01/'+qryMoedasmesano.AsString);
    Datafinal :=  UltimoDiaMes(strtodate('01/'+qryMoedasmesano.AsString));
  end
  else
  begin
    DataInicial := strtodate('01/'+FormatDateTime('mm/yyyy',date));
    DataFinal := UltimoDiaMes(strtodate('01/'+FormatDateTime('mm/yyyy',date)))
  end;

  if (qryMoedas.state = dsinsert) or
     not (qryMoedas.IsEmpty) then
  begin

    RefazConsultaPorNome(qryMoedasCotacoes,
       ['moeda','datainicial','datafinal'],
       [qryMoedascodigo.AsString,
        FormatDateTime('yyyy-mm-dd',DataInicial),
        formatDatetime('yyyy-mm-dd',DataFinal)]);

    ReFazConsultapornome(qryGravacaoMoedasCotacoes,
       ['moeda','datainicial','datafinal'],
       [qryMoedascodigo.AsString,
        FormatDateTime('yyyy-mm-dd',DataInicial),
        formatDatetime('yyyy-mm-dd',DataFinal)]);

    qryMoedasCotacoes.First;
    qryGravacaoMoedasCotacoes.First;
    AtribuirMascara;

  end;
end;

procedure TdtmCadastroMoedas.qryMoedasNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryMoedasnrdecimais.AsInteger := 6;
  qryMoedasmesano.AsString := FormatDateTime('mm/yyyy',date);
  qryMoedaspadrao.AsBoolean := false;
end;

procedure TdtmCadastroMoedas.qryGravacaoMoedasCotacoesAfterOpen(DataSet: TDataSet);
var
 i: integer;
begin
  inherited;
  if qryGravacaoMoedasCotacoes.IsEmpty then
  begin
    for i:=1 to DiasnoMes do
    begin
      qryGravacaoMoedasCotacoes.Append;
      qryGravacaoMoedasCotacoesmoeda.AsString := qryMoedascodigo.AsString;
      qryGravacaoMoedasCotacoesdata.AsDateTime := strtodate(inttostr(i)+'/'+MesAno);
      qryGravacaoMoedasCotacoesdia.AsInteger := i;
      qryGravacaoMoedasCotacoes.Post;
    end;
  end;
end;

procedure TdtmCadastroMoedas.dsrMoedasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryMoedasnrdecimais then
    AtribuirMascara
  else
  if Field = qryMoedasmesano then
    qryMoedasAfterScroll(nil);
end;

procedure TdtmCadastroMoedas.AtribuirMascara;
var
  mascara : String;
  i : integer;
begin
  if qryMoedasnrdecimais.AsInteger = 0 then
    mascara := '###,###,##0'
  else
    mascara := '###,###,##0.';
  for i:=1 to qryMoedasnrdecimais.AsInteger do
    mascara := mascara+'0';

  qryMoedasCotacoescotacao1.Precision := qryMoedasnrdecimais.AsInteger;
  qryMoedasCotacoescotacao2.Precision := qryMoedasnrdecimais.AsInteger;
  qryMoedasCotacoescotacao3.Precision := qryMoedasnrdecimais.AsInteger;

  qryMoedasCotacoescotacao1.DisplayFormat := mascara;
  qryMoedasCotacoescotacao2.DisplayFormat := mascara;
  qryMoedasCotacoescotacao3.DisplayFormat := mascara;

  qryGravacaoMoedasCotacoescotacao.Precision := qryMoedasnrdecimais.AsInteger;
  qryGravacaoMoedasCotacoescotacao.DisplayFormat := mascara;

  //qryMoedasCotacoescotacao.EditFormat := mascara;
  //qryMoedasCotacoescotacao.EditMask := '!'+trocar(Trocar(mascara,'#','9'),',','')+';0;';
end;

procedure TdtmCadastroMoedas.ZMonitor1MonitorEvent(Sql, Result: String);
var
listar : tstringlist;
begin
  inherited;
  Listar := tStringlist.create;
  if fileexists('c:\logh.txt') then
    Listar.loadfromfile('c:\logh.txt');
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile('c:\logh.txt');
  listar.free;
end;

procedure TdtmCadastroMoedas.ReplicarMoeda(Coluna: Integer);
var
  valor: Currency;
  dia: integer;
begin
  if MensagemConfirmacao('Confirma a replicação desta cotação ao restante dos dias?')=smbOk then
  begin
    GuardarRegistroAtual(qryMoedasCotacoes,true);

    if coluna in [1..3] then
    begin
      valor := qryMoedasCotacoescotacao1.AsCurrency;
      dia := qryMoedasCotacoesdia1.AsInteger;
    end
    else
    if coluna in [3..6] then
    begin
      valor := qryMoedasCotacoescotacao2.AsCurrency;
      dia := qryMoedasCotacoesdia2.AsInteger;
    end
    else
    if coluna in [6..9] then
    begin
      valor := qryMoedasCotacoescotacao3.AsCurrency;
      dia := qryMoedasCotacoesdia3.AsInteger;
    end;

    qryMoedasCotacoes.First;
    while not qryMoedasCotacoes.Eof do
    begin
      if (dia < qryMoedasCotacoesdia1.AsInteger) and
         not qryMoedasCotacoesdia1.IsNull then
      begin
        qryMoedasCotacoes.Edit;
        qryMoedasCotacoescotacao1.AsCurrency := valor;
        qryMoedasCotacoes.Post;
      end;

      if (dia < qryMoedasCotacoesdia2.AsInteger) and
         not qryMoedasCotacoesdia2.IsNull then
      begin
        qryMoedasCotacoes.Edit;
        qryMoedasCotacoescotacao2.AsCurrency := valor;
        qryMoedasCotacoes.Post;
      end;

      if (dia < qryMoedasCotacoesdia3.AsInteger) and
         not qryMoedasCotacoesdia3.IsNull then
      begin
        qryMoedasCotacoes.Edit;
        qryMoedasCotacoescotacao3.AsCurrency := valor;
        qryMoedasCotacoes.Post;
      end;

      qryMoedasCotacoes.Next;
    end;

    VoltarRegistroAtual(qryMoedasCotacoes);
  end;
end;

procedure TdtmCadastroMoedas.AtribuirValorCotacao;
var
  valors: string;
begin
{  if pos(',',qryGravacaoMoedasCotacoescotacao.AsString)<>0 then
    valors := copy(qryGravacaoMoedasCotacoescotacao.AsString,0,
                   pos(',',qryGravacaoMoedasCotacoescotacao.AsString)+qryMoedasnrdecimais.AsInteger)
  else
    valors := qryGravacaoMoedasCotacoescotacao.AsString;
  qryGravacaoMoedasCotacoescotacao.AsString := valors;}


  if pos(',',qryMoedasCotacoescotacao1.AsString)<>0 then
    valors := copy(qryMoedasCotacoescotacao1.AsString,0,
                   pos(',',qryMoedasCotacoescotacao1.AsString)+qryMoedasnrdecimais.AsInteger)
  else
    valors := qryMoedasCotacoescotacao1.AsString;
  qryMoedasCotacoescotacao1.AsString := valors;

  if pos(',',qryMoedasCotacoescotacao2.AsString)<>0 then
    valors := copy(qryMoedasCotacoescotacao2.AsString,0,
                   pos(',',qryMoedasCotacoescotacao2.AsString)+qryMoedasnrdecimais.AsInteger)
  else
    valors := qryMoedasCotacoescotacao2.AsString;
  qryMoedasCotacoescotacao2.AsString := valors;

  if pos(',',qryMoedasCotacoescotacao3.AsString)<>0 then
    valors := copy(qryMoedasCotacoescotacao3.AsString,0,
                   pos(',',qryMoedasCotacoescotacao3.AsString)+qryMoedasnrdecimais.AsInteger)
  else
    valors := qryMoedasCotacoescotacao3.AsString;
  qryMoedasCotacoescotacao3.AsString := valors;



end;


procedure TdtmCadastroMoedas.GravarMoedaCotacao;
begin
  if qryMoedasCotacoes.State in [dsedit, dsinsert] then
    qryMoedasCotacoes.Post
end;

procedure TdtmCadastroMoedas.CancelarMoedaCotacao;
begin
  if qryMoedasCotacoes.State in [dsedit, dsinsert] then
    qryMoedasCotacoes.cancel;
end;

procedure TdtmCadastroMoedas.qryMoedasCotacoesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  qryMoedasCotacoescotacao1.ReadOnly := qryMoedasCotacoesdia1.IsNull;
  qryMoedasCotacoesobservacoes1.ReadOnly := qryMoedasCotacoesdia1.IsNull;

  qryMoedasCotacoescotacao2.ReadOnly := qryMoedasCotacoesdia2.IsNull;
  qryMoedasCotacoesobservacoes2.ReadOnly := qryMoedasCotacoesdia2.IsNull;

  qryMoedasCotacoescotacao3.ReadOnly := qryMoedasCotacoesdia3.IsNull;
  qryMoedasCotacoesobservacoes3.ReadOnly := qryMoedasCotacoesdia3.IsNull;

end;

procedure TdtmCadastroMoedas.qryMoedasCotacoesBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryMoedasCotacoes.Cancel;
end;

procedure TdtmCadastroMoedas.qryMoedasCotacoesAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  qryMoedasCotacoes.Cancel;
end;

function TdtmCadastroMoedas.GetDiasnoMes: integer;
begin
  if qryMoedasmesano.AsString<>'' then
    FDiasnoMes := DaysInMonth(strtodate('01/'+qryMoedasmesano.AsString))
  else
    FDiasnoMes := DaysInMonth(date);

  Result := FDiasnoMes;
end;

function TdtmCadastroMoedas.GetMesAno: String;
begin
  if qryMoedasmesano.AsString<>'' then
    MesAno := qryMoedasmesano.AsString
  else
    MesAno := FormatDateTime('mm/yyyy',date);
  Result := FMesAno;
end;


procedure TdtmCadastroMoedas.qryMoedasCotacoesAfterOpen(DataSet: TDataSet);
var
 i: integer;
begin
  inherited;
  qryMoedasCotacoes.AfterInsert := nil;
  qryMoedasCotacoes.AfterScroll := nil;
  if qryMoedasCotacoes.IsEmpty then
  begin
    for i:=1 to 10 do
    begin
      qryMoedasCotacoes.Append;
      qryMoedasCotacoesmoeda.AsString := qryMoedasdescricao.AsString;

      qryMoedasCotacoesdata1.AsDateTime := strtodate(inttostr(i)+'/'+MesAno);
      qryMoedasCotacoesdia1.AsInteger := i;

      qryMoedasCotacoesdata2.AsDateTime := strtodate(inttostr(i+10)+'/'+MesAno);
      qryMoedasCotacoesdia2.AsInteger := i+10;

      try
        if MonthOf(strtodate(inttostr(i+20)+'/'+MesAno)) = MonthOf(strtodate('01/'+MesAno)) then
        begin
          qryMoedasCotacoesdata3.AsDateTime := strtodate(inttostr(i+20)+'/'+MesAno);
          qryMoedasCotacoesdia3.AsInteger := i+20;
        end
        else
        begin
          qryMoedasCotacoesdata3.clear;
          qryMoedasCotacoesdia3.clear;
        end;
      except
      end;  

{        qryMoedasCotacoesdata3.AsDateTime := strtodate(
                        inttostr(i+DaysInMonth(strtodate('01/'+MesAno))-20)+'/'+MesAno);
        qryMoedasCotacoesdia3.AsInteger := i+DaysInMonth(strtodate('01/'+MesAno))-20;
}

      qryMoedasCotacoes.Post;
    end;

    if MonthOf(strtodate('01/'+MesAno)) in [1,3,5,7,8,10,12] then
    begin
      qryMoedasCotacoes.Append;
      qryMoedasCotacoesmoeda.AsString := qryMoedasdescricao.AsString;

      qryMoedasCotacoesdata1.clear;
      qryMoedasCotacoesdia1.clear;

      qryMoedasCotacoesdata2.clear;
      qryMoedasCotacoesdia2.clear;

      qryMoedasCotacoesdata3.AsDateTime := strtodate('31/'+MesAno);
      qryMoedasCotacoesdia3.AsInteger := 31;

      qryMoedasCotacoes.Post;

    end;
  end;
  qryMoedasCotacoes.AfterInsert := qryMoedasCotacoesAfterInsert;
  qryMoedasCotacoes.AfterScroll := qryMoedasCotacoesAfterScroll;
end;


procedure TdtmCadastroMoedas.qryMoedasCotacoesAfterPost(DataSet: TDataSet);
begin
  inherited;
  EditarMoedas;
end;

procedure TdtmCadastroMoedas.qryMoedasCotacoesBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  AtribuirValorCotacao;

end;

end.
