unit dmrelatoriosac;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,dmtecsoft,
  ctconstantes, FR_DSet, FR_DBSet, FR_Class;

type
  TdtmRelatorioSAC = class(TdtmBasico)   //
    qryRelSacMaster: TtecQuery;
    dsrRelSacMaster: TtecDataSource;
    qryQuestionarios: TtecQuery;
    qryQuestionarioscodigo: TIntegerField;
    qryQuestionariosdescricao: TStringField;
    dsrQuestionarios: TtecDataSource;
    dsrConsultaQuestionario: TtecDataSource;
    qryConsultaQuestionario: TtecQuery;
    qryConsultaQuestionariocodigo: TIntegerField;
    qryConsultaQuestionariodescricao: TStringField;
    frDBEstatisticoPorQuestionario: TfrDBDataSet;
    frEstatisticoPorQuestionario: TfrReport;
    frDBEstatisticoTodosQuestionarios: TfrDBDataSet;
    qryRelSacDetail: TtecQuery;
    dsrRelSacDetail: TtecDataSource;
    frEstatisticoTodosQuestionarios: TfrReport;
    qryUsuario: TtecQuery;
    dsrUsuario: TtecDataSource;
    qryUsuariousuario: TIntegerField;
    qryUsuarionome: TStringField;
    frEstatisticoPorUsuario: TfrReport;
    frDBEstatisticoUsuario: TfrDBDataSet;
    qryRelSacMasterpergunta: TIntegerField;
    qryRelSacMasterenunciado: TStringField;
    qryRelSacMasteropcao: TMemoField;
    qryRelSacMastercodigo: TIntegerField;
    qryRelSacMasterparcial: TIntegerField;
    qryRelSacMastertotal: TIntegerField;
    procedure qryRelSacDetailAfterScroll(DataSet: TDataSet);
  protected
    function GetCodigoQuestionario      : integer;
    function GetConsultaQuestionario    : TtecQuery;
  public
    constructor Create(AOwner: TComponent); override;
    function ExisteQuestionario(campo, codigo: string): boolean;
    procedure PreparaSQL(DataInicial,DataFinal:string;todos,comUsuario: boolean);
    procedure PreparaSQlDetail;
    procedure DataRelatorio(dtInicial, dtFinal: string);
    procedure RefazConsultaQuestionarios(codQuestionario:integer);
    procedure RefazConsultaRelSacDetail(Datainicial,DataFinal:string);
    procedure RefazConsultaUsuario(Datainicial,DataFinal:string);
    property  CodigoQuestionario     : integer read GetCodigoQuestionario;
    property  ConsultaQuestionario   : TtecQuery read GetConsultaQuestionario;
  end;

var
{  dtmRelatorioSAC: TdtmRelatorioSAC;}
  Cont:integer;
  comOperador: boolean;
  TodosQuestionario: boolean;

implementation

{$R *.dfm}

{ TdtmRelatorioSAC }

constructor TdtmRelatorioSAC.Create(AOwner: TComponent);
begin
  inherited;
  qryRelSacMaster.Tag                     := ctRelatorioQuestionario;
  qryQuestionarios.Tag                    := ctRelatorioQuestionarioQuestionario;
  qryConsultaQuestionario.Tag             := ctRelatorioConsultaQuestionario;
end;

function TdtmRelatorioSAC.ExisteQuestionario(campo,
  codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaQuestionario, campo, codigo);//
end;

function TdtmRelatorioSAC.GetCodigoQuestionario: integer;
begin
  Result := qryConsultaQuestionariocodigo.AsInteger
end;

function TdtmRelatorioSAC.GetConsultaQuestionario: TtecQuery;
begin
  Result := qryConsultaQuestionario
end;

procedure TdtmRelatorioSAC.PreparaSQL(DataInicial, DataFinal: string;todos, comUsuario: boolean);
begin
  TodosQuestionario:=todos;
  RefazConsulta(qryRelSacMaster, [0,1,2], [qryQuestionarioscodigo.AsVariant,
                                 (DataInicial),
                                 (DataFinal)]);
  if todos then begin
    qryRelSacDetail.SQl[5]:=' ';
    RefazConsultaRelSacDetail(DataInicial, DataFinal);
    if comOperador then
      frEstatisticoPorUsuario.ShowReport
    else
      frEstatisticoTodosQuestionarios.ShowReport;
  end else begin
    qryRelSacDetail.SQl[5]:=' and (questionarios.codigo = '+ qryQuestionarioscodigo.AsString +') ';
    RefazConsultaRelSacDetail(DataInicial, DataFinal);
    if comOperador then
      frEstatisticoPorUsuario.ShowReport
    else
      frEstatisticoPorQuestionario.ShowReport;
  end;
end;

procedure TdtmRelatorioSAC.RefazConsultaQuestionarios(
  codQuestionario: integer);
begin
  ReFazConsulta(qryQuestionarios, [0], [codQuestionario]);
end;

procedure TdtmRelatorioSAC.qryRelSacDetailAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if comOperador = False then begin
    if Cont <= qryRelSacDetail.RecordCount then begin
      if qryRelSacMaster.Eof then Cont:= Cont+1;
      qryRelSacMaster.Close;
      qryRelSacMaster.SQL[06]:='';
      qryRelSacMaster.SQL[15]:='';
         if TodosQuestionario = true then
            RefazConsulta(qryRelSacMaster, [0], [qryRelSacDetail.Fields.Fields[0].AsVariant])
         else RefazConsulta(qryRelSacMaster, [0], [qryQuestionarioscodigo.AsVariant]);
    end;
  end else
    if Cont <= qryRelSacDetail.RecordCount then begin
      if qryRelSacMaster.Eof then Cont:= Cont+1;
      qryRelSacMaster.Close;
      qryRelSacMaster.SQL[06]:='contatos.usuario = '''+qryRelSacDetail.Fields.Fields[2].AsString+''' and ';
      qryRelSacMaster.SQL[15]:='contatos.usuario = '''+qryRelSacDetail.Fields.Fields[2].AsString+''' and ';
      if TodosQuestionario = true then
         RefazConsulta(qryRelSacMaster, [0], [qryRelSacDetail.Fields.Fields[0].AsVariant])
      else RefazConsulta(qryRelSacMaster, [0], [qryQuestionarioscodigo.AsVariant]);
    end;
end;

procedure TdtmRelatorioSAC.RefazConsultaRelSacDetail(Datainicial, DataFinal: string);
begin
  RefazConsulta(qryRelSacDetail, [0,1] ,[DataInicial,
                                         DataFinal]);
end;

procedure TdtmRelatorioSAC.RefazConsultaUsuario(Datainicial,
  DataFinal: string);
begin
  RefazConsulta(qryUsuario, [0,1], [DataInicial, DataFinal]);
end;

procedure TdtmRelatorioSAC.PreparaSQlDetail;
begin
  if comOperador then begin
     qryRelSacDetail.SQL[1]:=' SELECT distinct questionarios.codigo,questionarios.descricao,usuarios.codigo as usuario, usuarios.nome as nome ';
     qryRelSacDetail.SQl[2]:=' FROM    contatos,objetivas,questionarios,usuarios ';
     qryRelSacDetail.SQL[4]:='      and (usuarios.codigo = contatos.usuario) ';
     qryRelSacDetail.SQL[8]:=' ORDER BY questionarios.codigo,usuarios.codigo ';
  end else begin
     qryRelSacDetail.SQL[1]:=' SELECT distinct questionarios.codigo,questionarios.descricao ';
     qryRelSacDetail.SQl[2]:=' FROM    contatos,objetivas,questionarios ';
     qryRelSacDetail.SQL[4]:=' ';
     qryRelSacDetail.SQL[8]:=' ORDER BY questionarios.codigo ';
  end
end;

procedure TdtmRelatorioSAC.DataRelatorio(dtInicial, dtFinal: string);
begin
  frEstatisticoPorQuestionario.Dictionary.Variables.Variable['Data1']:= QuotedStr(dtInicial);
  frEstatisticoPorQuestionario.Dictionary.Variables.Variable['Data2']:= QuotedStr(dtFinal);
  frEstatisticoTodosQuestionarios.Dictionary.Variables.Variable['Data1']:= QuotedStr(dtInicial);
  frEstatisticoTodosQuestionarios.Dictionary.Variables.Variable['Data2']:= QuotedStr(dtFinal);
  frEstatisticoPorUsuario.Dictionary.Variables.Variable['Data1']:= QuotedStr(dtInicial);
  frEstatisticoPorUsuario.Dictionary.Variables.Variable['Data2']:= QuotedStr(dtFinal);
end;

end.
