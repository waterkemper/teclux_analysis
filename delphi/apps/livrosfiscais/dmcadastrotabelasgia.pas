unit dmcadastrotabelasgia;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, Menus,
  //Terceiros
  ZQuery, ZPgSqlQuery,   
  //Biblio
  biblio, ctconstantes,
  //Componentes
  cpquery, cpdatasource,
  //Repositorio
  dmbasico;

type
  TdtmCadastroTabelasGIA = class(TdtmBasico)
    dsrReceitasTributarias: TtecDataSource;
    qryReceitasTributarias: TtecQuery;
    qryClassesPagto: TtecQuery;
    dsrClassesPagto: TtecDataSource;
    qryConsultaClassesPagto: TtecQuery;
    dsrProcuraClassesPagto: TtecDataSource;
    qryProcuraClassesPagto: TtecQuery;
    qryProcuraClassesPagtocodigo: TIntegerField;
    qryProcuraClassesPagtodescricao: TStringField;
    spcClassesPagto: TtecQuery;
    spcReceitasTributarias: TtecQuery;
    qryReceitasTributariascodigo: TIntegerField;
    qryReceitasTributariasdescricao: TStringField;
    qryClassesPagtocodigo: TIntegerField;
    qryClassesPagtodescricao: TStringField;
    qryConsultaClassesPagtodescricao: TStringField;
    qryConsultaClassesPagtocodigo: TIntegerField;
    qryConsultaReceitasTributarias: TtecQuery;
    qryConsultaReceitasTributariascodigo: TIntegerField;
    qryConsultaReceitasTributariasdescricao: TStringField;
    qryProcuraReceitasTributarias: TtecQuery;
    dsrProcuraReceitasTributarias: TtecDataSource;
    qryProcuraReceitasTributariascodigo: TIntegerField;
    qryProcuraReceitasTributariasdescricao: TStringField;
    spcReceitasTributariascodigo: TIntegerField;
    spcClassesPagtocodigo: TIntegerField;
    qryClassesPagtoperiodo: TStringField;
  private
    function GetTabelaConsultaClassesPagto: TZDataSet;
    function GetTabelaConsultaReceitasTributarias: TZDataSet;
  protected
    function  GetTabelaClassesPagto: TZDataSet;
    function  GetTabelaReceitasTributarias: TZDataSet;
  public
    constructor Create(AOwner: TComponent); override;
    function ExisteClassesPagto(campo, codigo: String): Boolean;
    function ExisteReceitasTributarias(campo, codigo: String): Boolean;
    function ExcluirClassesPagto: Boolean;
    function ExcluirReceitasTributarias: Boolean;
    function GravarClassesPagto: Boolean;
    function GravarReceitasTributarias: Boolean;
    function IncluirClassesPagto: Boolean;
    function IncluirReceitasTributarias: Boolean;
    procedure AbrirTabelasCadastro(Tabela: TtecTabelasGIA);
    procedure AbrirTabelasConsulta(Tabela: TtecTabelasGIA);
    procedure FecharTabelasConsulta(Tabela: TtecTabelasGIA);
    procedure Selecionar(Tabela: TtecTabelasGIA);
    property TabelaClassesPagto: TZDataSet read GetTabelaClassesPagto;
    property TabelaConsultaClassesPagto: TZDataSet read GetTabelaConsultaClassesPagto;
    property TabelaConsultaReceitasTributarias: TZDataSet read GetTabelaConsultaReceitasTributarias;
    property TabelaReceitasTributarias: TZDataSet read GetTabelaReceitasTributarias;
  end;

var
  dtmCadastroTabelasGIA: TdtmCadastroTabelasGIA;

implementation

{$R *.dfm}

procedure TdtmCadastroTabelasGIA.AbrirTabelasCadastro(Tabela: TtecTabelasGIA);
begin
  case Tabela of
    tbgCLASSESPAGTO:        Abre(ctLIVTabelaClassesPagto);
    tbgRECEITASTRIBUTARIAS: Abre(ctLIVTabelaReceitasTributarias);
  end;
end;

procedure TdtmCadastroTabelasGIA.AbrirTabelasConsulta(Tabela: TtecTabelasGIA);
begin
  case Tabela of
    tbgCLASSESPAGTO:        Abre(ctLIVTabelaConsultaClassesPagto);
    tbgRECEITASTRIBUTARIAS: Abre(ctLIVTabelaConsultaReceitasTributarias);
  end;
end;

constructor TdtmCadastroTabelasGIA.Create(AOwner: TComponent);
begin
  inherited;
  qryClassesPagto.Tag                        := ctLIVTabelaClassesPagto;
  qryReceitasTributarias.Tag                 := ctLIVTabelaReceitasTributarias;
  qryConsultaClassesPagto.Tag                := ctLIVTabelaConsultaClassesPagto;
  qryConsultaReceitasTributarias.Tag         := ctLIVTabelaConsultaReceitasTributarias;
end;

function TdtmCadastroTabelasGIA.ExcluirClassesPagto: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a Classe de Pagamento'])) = smbOk then begin
    if not qryClassesPagto.IsEmpty then begin
      qryClassesPagto.Delete;
      Perpetrar([qryClassesPagto]);
    end;
    Result:= True;
  end
end;

function TdtmCadastroTabelasGIA.ExcluirReceitasTributarias: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a Receita tributária'])) = smbOk then begin
    if not qryReceitasTributarias.IsEmpty then begin
      qryReceitasTributarias.Delete;
      Perpetrar([qryReceitasTributarias]);
    end;
    Result:= True;
  end
end;

function TdtmCadastroTabelasGIA.ExisteClassesPagto(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaClassesPagto, campo, codigo)
end;

function TdtmCadastroTabelasGIA.ExisteReceitasTributarias(campo, codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaReceitasTributarias, campo, codigo)
end;

procedure TdtmCadastroTabelasGIA.FecharTabelasConsulta(Tabela: TtecTabelasGIA);
begin
  case Tabela of
    tbgCLASSESPAGTO:        Fecha(ctLIVTabelaConsultaClassesPagto);
    tbgRECEITASTRIBUTARIAS: Fecha(ctLIVTabelaConsultaReceitasTributarias);
  end;
end;

function TdtmCadastroTabelasGIA.GetTabelaClassesPagto: TZDataSet;
begin
  Result := qryClassesPagto;
end;

function TdtmCadastroTabelasGIA.GetTabelaConsultaClassesPagto: TZDataSet;
begin
  Result := qryConsultaClassesPagto
end;

function TdtmCadastroTabelasGIA.GetTabelaConsultaReceitasTributarias: TZDataSet;
begin
  Result := qryConsultaReceitasTributarias
end;

function TdtmCadastroTabelasGIA.GetTabelaReceitasTributarias: TZDataSet;
begin
  Result := qryReceitasTributarias;
end;

function TdtmCadastroTabelasGIA.GravarClassesPagto: Boolean;
begin
  Result:= False;
  if qryClassesPagto.CheckRequiredFields then begin
    if qryClassesPagto.State in [dsInsert] then begin
      spcClassesPagto.Open;
      qryClassesPagtocodigo.AsInteger:= spcClassesPagtocodigo.AsInteger;
      spcClassesPagto.Close;
    end;
    qryClassesPagto.Post;
    Perpetrar([qryClassesPagto]);
    Result := True;
  end
end;

function TdtmCadastroTabelasGIA.GravarReceitasTributarias: Boolean;
begin
  Result:= False;
  if qryReceitasTributarias.CheckRequiredFields then begin
    if qryReceitasTributarias.State in [dsInsert] then begin
      spcReceitasTributarias.Open;
      qryReceitasTributariascodigo.AsInteger:= spcReceitasTributariascodigo.AsInteger;
      spcReceitasTributarias.Close;
    end;
    qryReceitasTributarias.Post;
    Perpetrar([qryReceitasTributarias]);
    Result := True;
  end
end;

function TdtmCadastroTabelasGIA.IncluirClassesPagto: Boolean;
begin
  qryClassesPagto.Insert;
  Result := True;
end;

function TdtmCadastroTabelasGIA.IncluirReceitasTributarias: Boolean;
begin
  qryReceitasTributarias.Insert;
  Result := True;
end;

procedure TdtmCadastroTabelasGIA.Selecionar(Tabela: TtecTabelasGIA);
begin
  case Tabela of
    tbgCLASSESPAGTO:        ReFazConsulta(qryClassesPagto, [0], [qryConsultaClassesPagtocodigo.AsInteger]);
    tbgRECEITASTRIBUTARIAS: ReFazConsulta(qryReceitasTributarias, [0], [qryConsultaReceitasTributariascodigo.AsInteger]);
  end;
end;

end.
