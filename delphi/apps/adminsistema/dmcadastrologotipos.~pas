unit dmcadastrologotipos;

interface

uses
  SysUtils, Classes, DB, Forms,
    //Terceiros
  ZQuery, ZPgSqlQuery,    //Componentes
  cpquery, cpdatasource,
    //Biblio
  ctconstantes, Biblio,
    //Repositorio
  dmbasico, dmtecsoft, ZTransact;

type
  TdtmCadastroLogotipos = class(TdtmBasico)
    dsrLogotipos: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    dsrConsultaFiliais: TtecDataSource;
    qryProcuraFilial: TtecQuery;
    qryProcuraFilialcodigo: TIntegerField;
    qryProcuraFilialnome: TStringField;
    dsrProcuraFilial: TtecDataSource;
    qryLogotipos: TtecQuery;
    qryLogotiposfilial: TIntegerField;
    qryLogotiposdescricao: TStringField;
    qryLogotiposnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryConsultaLogotipos: TtecQuery;
    dsrProcuraLogotipos: TtecDataSource;
    qryConsultaLogotiposfilial: TIntegerField;
    qryConsultaLogotiposdescricao: TStringField;
    qryConsultaLogotiposnome: TStringField;
    qryLogotipostipo: TStringField;
    procedure qryLogotiposAfterScroll(DataSet: TDataSet);
  private
    FFilialLogotipo: String;
    function GetTabelaFiliais: TZDataset;
    function GetTabelaLogotipos: TZDataset;
    procedure SetLogotipoFilial(const Value: integer);
    procedure SetTipoLogotipo(const Value: String);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property TabelaFiliais: TZDataset read GetTabelaFiliais;
    property TabelaLogotipos: TZDataset read GetTabelaLogotipos;
    function IncluirLogotipos: Boolean;
    function ExcluirLogotipos: Boolean;
    function GravarLogotipos: Boolean;
    function  ExisteFilial(campo, codigo: string): Boolean;
    function  ExisteFilialLogotipo(campo, codigo: string): Boolean;
    property LogotipoFilial: integer write SetLogotipoFilial;
    property TipoLogotipo : String write SetTipoLogotipo;
    procedure Selecionar;
    property FilialLogotipo: String read FFilialLogotipo write FFilialLogotipo;

    { Public declarations }

  end;

var
  dtmCadastroLogotipos: TdtmCadastroLogotipos;

implementation

{$R *.dfm}

constructor TdtmCadastroLogotipos.Create(AOwner: TComponent);
begin
  inherited;
  qryLogotipos.Tag        := ctTabelas;
  qryConsultaFiliais.Tag  := ctTabelaConsultaFiliais;
end;

function TdtmCadastroLogotipos.ExcluirLogotipos: Boolean;
begin
  if MensagemConfirmacao(format(ctCONFIRMEEXCLUIR, ['o LOGOTIPO'])) = smbOk then
  begin
    if not (qryLogotipos.IsEmpty) then
         qryLogotipos.Delete
    else qryLogotipos.Cancel;
    Perpetrar([qryLogotipos]);
    Result := True;
  end else
    Result:= False
end;

function TdtmCadastroLogotipos.ExisteFilial(campo,
  codigo: string): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

function TdtmCadastroLogotipos.GetTabelaFiliais: TZDataset;
begin
  result := qryConsultaFiliais;
end;

function TdtmCadastroLogotipos.GetTabelaLogotipos: TZDataset;
begin
  result := qryLogotipos;
end;

function TdtmCadastroLogotipos.GravarLogotipos: Boolean;
begin
  Result:= False;
  if qryLogotipos.CheckRequiredFields then  begin
    try
      begin
        qryLogotipos.Post;
        perpetrar([qryLogotipos]);
        Result := True;
      end;
    except
      MensagemAviso('Esta filial já possui logotipo'+#10#13+
                    'cadastrado com este tipo.');
    end;
  end;
end;

function TdtmCadastroLogotipos.IncluirLogotipos: Boolean;
begin
  qryLogotipos.Insert;
  Result:=True;
end;

procedure TdtmCadastroLogotipos.Selecionar;
begin
 LogotipoFilial := qryConsultaFiliaiscodigo.AsInteger;
end;

procedure TdtmCadastroLogotipos.SetLogotipoFilial(const Value: integer);
begin
  if Not (qryLogotipos.State in [dsInsert, dsEdit]) then
    qryLogotipos.Edit;
  qryLogotiposfilial.Asinteger := Value;
end;

procedure TdtmCadastroLogotipos.qryLogotiposAfterScroll(DataSet: TDataSet);
begin
  inherited;
  FilialLogotipo:=qryLogotiposfilial.AsString;
end;

function TdtmCadastroLogotipos.ExisteFilialLogotipo(campo,
  codigo: string): Boolean;
begin
  Result:=ExisteCodigo(qryLogotipos, campo, codigo);
end;

procedure TdtmCadastroLogotipos.SetTipoLogotipo(const Value: String);
begin
  if qryLogotipos.State in [dsInsert, dsEdit] then
     qrylogotipostipo.asString:= Value;
end;

end.
