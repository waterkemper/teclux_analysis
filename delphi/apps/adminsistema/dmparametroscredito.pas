unit dmparametroscredito;

interface

uses
  SysUtils, Classes, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery, ctconstantes,
  dmbasico, biblio, variants, ZTransact, windows;

type
  TdtmParametrosCredito = class(TdtmBasico)
    qryIdade: TtecQuery;
    dsrIdade: TtecDataSource;
    qryIdadetabela: TIntegerField;
    qryIdadelinha: TIntegerField;
    qryIdadedescricao: TStringField;
    qryIdadevalor1: TIntegerField;
    qryIdadevalor2: TIntegerField;
    qryParametros: TtecQuery;
    dsrParametros: TtecDataSource;
    qryParametrostabela: TIntegerField;
    qryParametroslinha: TIntegerField;
    qryParametrosdescricao: TStringField;
    qryParametrosvalor1: TIntegerField;
    qryParametrosvalor2: TIntegerField;
    qryParametrossimnao: TStringField;
    qryIdademinimo: TIntegerField;
    qryTelefone: TtecQuery;
    dsrTelefone: TtecDataSource;
    qryTelefonetabela: TIntegerField;
    qryTelefonelinha: TIntegerField;
    qryTelefonedescricao: TStringField;
    qryTelefonevalor1: TIntegerField;
    qryTelefonevalor2: TIntegerField;
    qryResidencia: TtecQuery;
    dsrResidencia: TtecDataSource;
    qryResidenciatabela: TIntegerField;
    qryResidencialinha: TIntegerField;
    qryResidenciadescricao: TStringField;
    qryResidenciavalor1: TIntegerField;
    qryResidenciavalor2: TIntegerField;
    qryReferencia: TtecQuery;
    dsrReferencia: TtecDataSource;
    qryReferenciatabela: TIntegerField;
    qryReferencialinha: TIntegerField;
    qryReferenciadescricao: TStringField;
    qryReferenciavalor1: TIntegerField;
    qryReferenciavalor2: TIntegerField;
    qryRendaConjuge: TtecQuery;
    dsrRendaConjuge: TtecDataSource;
    qryRendaConjugetabela: TIntegerField;
    qryRendaConjugelinha: TIntegerField;
    qryRendaConjugedescricao: TStringField;
    qryRendaConjugevalor1: TIntegerField;
    qryRendaConjugevalor2: TIntegerField;
    qryRendaConjugeminimo: TIntegerField;
    qryTempoResidencia: TtecQuery;
    dsrTempoResidencia: TtecDataSource;
    qryTempoResidenciatabela: TIntegerField;
    qryTempoResidencialinha: TIntegerField;
    qryTempoResidenciadescricao: TStringField;
    qryTempoResidenciavalor1: TIntegerField;
    qryTempoResidenciavalor2: TIntegerField;
    qryTempoResidenciaminimo: TIntegerField;
    qryTempoServico: TtecQuery;
    dsrTempoServico: TtecDataSource;
    qryTempoServicotabela: TIntegerField;
    qryTempoServicolinha: TIntegerField;
    qryTempoServicodescricao: TStringField;
    qryTempoServicovalor1: TIntegerField;
    qryTempoServicovalor2: TIntegerField;
    qryTempoServicominimo: TIntegerField;
    qryMDA: TtecQuery;
    dsrMDA: TtecDataSource;
    qryMDAtabela: TIntegerField;
    qryMDAlinha: TIntegerField;
    qryMDAdescricao: TStringField;
    qryMDAvalor1: TIntegerField;
    qryMDAvalor2: TIntegerField;
    qryMDAminimo: TIntegerField;
    qryPrestacoesPagas: TtecQuery;
    dsrPrestacoesPagas: TtecDataSource;
    qryPrestacoesPagastabela: TIntegerField;
    qryPrestacoesPagaslinha: TIntegerField;
    qryPrestacoesPagasdescricao: TStringField;
    qryPrestacoesPagasvalor1: TIntegerField;
    qryPrestacoesPagasvalor2: TIntegerField;
    qryPrestacoesPagasminimo: TIntegerField;
    qrySexo: TtecQuery;
    dsrSexo: TtecDataSource;
    qrySexotabela: TIntegerField;
    qrySexolinha: TIntegerField;
    qrySexodescricao: TStringField;
    qrySexovalor1: TIntegerField;
    qrySexovalor2: TIntegerField;
    qryNaoInformado: TtecQuery;
    dsrNaoInformado: TtecDataSource;
    qryNaoInformadotabela: TIntegerField;
    qryNaoInformadolinha: TIntegerField;
    qryNaoInformadodescricao: TStringField;
    qryNaoInformadovalor1: TIntegerField;
    qryNaoInformadovalor2: TIntegerField;
    qryEstadoCivil: TtecQuery;
    dsrEstadoCivil: TtecDataSource;
    qryEstadoCiviltabela: TIntegerField;
    qryEstadoCivillinha: TIntegerField;
    qryEstadoCivildescricao: TStringField;
    qryEstadoCivilvalor1: TIntegerField;
    qryEstadoCivilvalor2: TIntegerField;
    qryTempoCasamento: TtecQuery;
    dsrTempoCasamento: TtecDataSource;
    qryTempoCasamentotabela: TIntegerField;
    qryTempoCasamentolinha: TIntegerField;
    qryTempoCasamentodescricao: TStringField;
    qryTempoCasamentovalor1: TIntegerField;
    qryTempoCasamentovalor2: TIntegerField;
    qryTempoCasamentominimo: TIntegerField;
    dsrParametrosUnicos: TtecDataSource;
    qryParametrosUnicos: TtecQuery;
    qryParametrosUnicoslinha: TIntegerField;
    qryParametrosUnicosdescricao: TStringField;
    qryParametrosUnicosvalor1: TIntegerField;
    qryParametrosUnicosdescr: TStringField;
    qryParametrosLimites: TtecQuery;
    dsrParametrosLimites: TtecDataSource;
    qryParametrosLimiteslinha: TIntegerField;
    qryParametrosLimitesdescricao: TStringField;
    qryParametrosLimiteslimite: TFloatField;
    qryParametrosBooleanos: TtecQuery;
    dsrParamentrosBooleanos: TtecDataSource;
    qryParametrosBooleanoslimite: TFloatField;
    qryParametrosBooleanosbooleano: TBooleanField;
    qryParametrosBooleanostabela: TIntegerField;
    qryParametrosBooleanoslinha: TIntegerField;
    qryParametrosBooleanosdescricao: TStringField;
    qryParametrosBooleanosvalor1: TIntegerField;
    qryParametrosBooleanosvalor2: TIntegerField;
    dsrPontuacao: TtecDataSource;
    qryPontuacao: TtecQuery;
    qryPontuacaotabela: TIntegerField;
    qryPontuacaolinha: TIntegerField;
    qryPontuacaodescricao: TStringField;
    qryPontuacaovalor1: TIntegerField;
    qryPontuacaovalor2: TIntegerField;
    qryPontuacaominimo: TIntegerField;
    procedure qryParametrosAfterInsert(DataSet: TDataSet);
    procedure qryParametrosUnicosAfterInsert(DataSet: TDataSet);
    procedure qryParametrosLimitesAfterInsert(DataSet: TDataSet);
    procedure qryIdadeBeforeInsert(DataSet: TDataSet);
    procedure qryIdadeAfterInsert(DataSet: TDataSet);
    procedure qryResidenciaAfterInsert(DataSet: TDataSet);
    procedure qryReferenciaAfterInsert(DataSet: TDataSet);
    procedure qryTelefoneAfterInsert(DataSet: TDataSet);
    procedure qrySexoAfterInsert(DataSet: TDataSet);
    procedure qryNaoInformadoAfterInsert(DataSet: TDataSet);
    procedure qryEstadoCivilAfterInsert(DataSet: TDataSet);
    procedure qryTempoCasamentoAfterInsert(DataSet: TDataSet);
    procedure qryTempoCasamentoBeforeInsert(DataSet: TDataSet);
    procedure qryTempoResidenciaAfterInsert(DataSet: TDataSet);
    procedure qryTempoResidenciaBeforeInsert(DataSet: TDataSet);
    procedure qryTempoServicoAfterInsert(DataSet: TDataSet);
    procedure qryTempoServicoBeforeInsert(DataSet: TDataSet);
    procedure qryRendaConjugeAfterInsert(DataSet: TDataSet);
    procedure qryRendaConjugeBeforeInsert(DataSet: TDataSet);
    procedure qryMDAAfterInsert(DataSet: TDataSet);
    procedure qryMDABeforeInsert(DataSet: TDataSet);
    procedure qryPrestacoesPagasAfterInsert(DataSet: TDataSet);
    procedure qryPrestacoesPagasBeforeInsert(DataSet: TDataSet);
    procedure qryPontuacaoAfterInsert(DataSet: TDataSet);
    procedure qryPontuacaoBeforeInsert(DataSet: TDataSet);
    procedure dsrIdadeDataChange(Sender: TObject; Field: TField);
    procedure dsrTempoCasamentoDataChange(Sender: TObject; Field: TField);
    procedure dsrTempoResidenciaDataChange(Sender: TObject; Field: TField);
    procedure dsrTempoServicoDataChange(Sender: TObject; Field: TField);
    procedure dsrRendaConjugeDataChange(Sender: TObject; Field: TField);
    procedure dsrMDADataChange(Sender: TObject; Field: TField);
    procedure dsrPrestacoesPagasDataChange(Sender: TObject; Field: TField);
    procedure dsrPontuacaoDataChange(Sender: TObject; Field: TField);
    private
    FIdadeMinimo: Integer;
    FTempoResidenciaMinimo: Integer;
    FPrestacoesPagasMinimo: Integer;
    FRendaConjugeMinimo: Integer;
    FMDAMinimo: Integer;
    FTempoServicoMinimo: Integer;
    FTempoCasamentoMinimo: Integer;
    FPontuacaoMinimo: Integer;
    { Private declarations }
    procedure SetFaixaMinimo(querys: Array of TtecQuery);
    function GetDescontarDebitoMes: Boolean;
    procedure SetDescontarDebitoMes(const Value: Boolean);
    procedure VerificaValores(Query: TtecQuery; Field: TField; Maximo: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure   LerParametros;

    procedure GravarParametros;
    procedure Excluir(Tabela: TtecParCreditoTipoTabela);
    procedure VerificaPreenchimento(Tabela: TtecParCreditoTipoTabela);
    procedure EditaValorMaximo(Tabela: Array of TtecParCreditoTipoTabela);
    property  DescontarDebitoMes        : Boolean read GetDescontarDebitoMes write SetDescontarDebitoMes;
    property  IdadeMinimo               : Integer read FIdadeMinimo write FIdadeMinimo;
    property  TempoCasamentoMinimo      : Integer read FTempoCasamentoMinimo write FTempoCasamentoMinimo;
    property  TempoResidenciaMinimo     : Integer read FTempoResidenciaMinimo write FTempoResidenciaMinimo;
    property  TempoServicoMinimo        : Integer read FTempoServicoMinimo write FTempoServicoMinimo;
    property  RendaConjugeMinimo        : Integer read FRendaConjugeMinimo write FRendaConjugeMinimo;
    property  MDAMinimo                 : Integer read FMDAMinimo write FMDAMinimo;
    property  PrestacoesPagasMinimo     : Integer read FPrestacoesPagasMinimo write FPrestacoesPagasMinimo;
    property  PontuacaoMinimo           : Integer read FPontuacaoMinimo write FPontuacaoMinimo;
  end;

var
  dtmParametrosCredito: TdtmParametrosCredito;

implementation


const
  IdadeMaxima      =   120;
  CasamentoMaximo  =   120;
  ResidenciaMaximo =   120;
  ServicoMaximo    =   120;
  ConjugeMaxima    = 10000;
  MDAMaxima        =   300;
  QuitadasMaxima   =   300;
  PontuacaoMaxima  =   500;

{$R *.dfm}

{ TdtmParametrosCredito }

constructor TdtmParametrosCredito.Create(AOwner: TComponent);
begin
  inherited;
  LerParametros;
  SetFaixaMinimo([qryIdade,qryTempoCasamento,qryTempoResidencia,qryTempoServico,
                  qryRendaConjuge,qryMDA,qryPrestacoesPagas,qryPontuacao]);
 
end;

procedure TdtmParametrosCredito.GravarParametros;
 {
  function verificarValoresFaixas(Querys: Array of TtecQuery): Boolean;
  var
    a: Integer;
    PosAnt : TBookmark;
  begin
    for a := 0 to High(Querys) do
    begin
      if Querys[a].CheckRequiredFields then
      begin
        Result := True;
        if Querys[a].State in [dsEdit, dsInsert] then
          Querys[a].Post;
        if Querys[a].RecordCount > 0 then begin
          PosAnt := Querys[a].GetBookmark;
          Querys[a].DisableControls;
          try
            Querys[a].First;
            while not Querys[a].Eof do
            begin
              if Querys[a].FieldByName('minimo').Value > Querys[a].FieldByName('valor1').Value then
              begin
                Result := False;
                break;
              end;
              Querys[a].Next;
            end;
          finally
            Querys[a].GotoBookmark(PosAnt);
            Querys[a].FreeBookmark(PosAnt);
            Querys[a].EnableControls;
          end;
          for a := 0 to High(Valores) - 1 do begin
            for b := a + 1 to High(Valores) do
              if Valores[a] = Valores[b] then begin
                OK := False;
                break
              end;
            if Not OK then
              Break
          end
        end;
        if Result then
          Perpetrar([Querys[a]])
        else MensagemAviso('Existem valores incorretos. Será necessário corrigir.');
      end;
      if not Result then
        Break;
    end;
  end;
              }

begin
  EditaValorMaximo([pcrIDADE,pcrCASAMENTO,pcrRESIDENCIA,pcrSERVICO,pcrRENDACONJUGE,
                    pcrMDA,pcrPRESTACOESPAGAS,pcrPONTUACAO]);
  if qryParametros.CheckRequiredFields and qryParametrosUnicos.CheckRequiredFields and
     qryParametrosLimites.CheckRequiredFields and qryParametrosBooleanos.CheckRequiredFields and
     qryResidencia.CheckRequiredFields and qryReferencia.CheckRequiredFields and
     qryTelefone.CheckRequiredFields and qrySexo.CheckRequiredFields and
     qryNaoInformado.CheckRequiredFields and qryEstadoCivil.CheckRequiredFields and
     qryIdade.CheckRequiredFields and qryTempoCasamento.CheckRequiredFields and
     qryTempoResidencia.CheckRequiredFields and qryTempoServico.CheckRequiredFields and
     qryRendaConjuge.CheckRequiredFields and qryMDA.CheckRequiredFields and
     qryPrestacoesPagas.CheckRequiredFields and qryPontuacao.CheckRequiredFields then
    Perpetrar([qryParametros,qryParametrosUnicos,qryParametrosLimites,
               qryParametrosBooleanos,qryResidencia,qryReferencia,qryTelefone,
               qrySexo,qryNaoInformado,qryEstadoCivil,qryIdade,qryTempoCasamento,
               qryTempoResidencia,qryTempoServico,qryRendaConjuge,qryMDA,
               qryPrestacoesPagas,qryPontuacao]);
  

end;

procedure TdtmParametrosCredito.LerParametros;
begin
  qryParametros.Open;
  qryParametrosUnicos.Open;
  qryParametrosLimites.Open;
  qryParametrosBooleanos.Open;

  qryResidencia.Open;
  qryReferencia.Open;
  qryTelefone.Open;
  qrySexo.Open;
  qryNaoInformado.Open;
  qryEstadoCivil.Open;

  qryIdade.Open;
  qryTempoCasamento.Open;
  qryTempoResidencia.Open;
  qryTempoServico.Open;
  qryRendaConjuge.Open;
  qryMDA.Open;
  qryPrestacoesPagas.Open;
  qryPontuacao.Open;
end;

procedure TdtmParametrosCredito.SetFaixaMinimo(querys: Array of TtecQuery);
var
  max,a: Integer;
  pos : TBookmark;
begin
  for a := 0 to High(querys) do begin
    max := 0;
    pos := querys[a].GetBookmark;
    querys[a].DisableControls;
    querys[a].First;
    while not querys[a].Eof do
    begin
      querys[a].Edit;
      querys[a].FieldByName('minimo').AsInteger := max;
      querys[a].Post;
      max := querys[a].FieldByName('valor1').AsInteger + 1;
      querys[a].Next;
    end;
    querys[a].GotoBookmark(pos);
    querys[a].FreeBookmark(pos);
    querys[a].EnableControls;
  end;
end;

procedure TdtmParametrosCredito.qryParametrosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryParametrosUnicosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryParametrosLimitesAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

function TdtmParametrosCredito.GetDescontarDebitoMes: Boolean;
begin
  result := qryParametrosBooleanosbooleano.AsBoolean;
end;

procedure TdtmParametrosCredito.SetDescontarDebitoMes(
  const Value: Boolean);
begin
  qryParametrosBooleanos.Edit;
  qryParametrosBooleanosbooleano.AsBoolean := Value;
  qryParametrosBooleanos.Post;
end;

procedure TdtmParametrosCredito.qryIdadeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (qryIdadevalor1.AsInteger > 0) and (qryIdadevalor2.AsString <> '')
      and (qryIdadevalor1.AsInteger < IdadeMaxima) then
    IdadeMinimo := qryIdadevalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryIdadeAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if (IdadeMinimo <> 0) and (IdadeMinimo < IdadeMaxima) then begin
    qryIdadetabela.AsCurrency := 11;
    qryIdadelinha.AsCurrency :=  qryIdade.RecordCount + 1;
    qryIdademinimo.AsInteger := IdadeMinimo;
    IdadeMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryResidenciaAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryReferenciaAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryTelefoneAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qrySexoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryNaoInformadoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryEstadoCivilAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.Cancel;
end;

procedure TdtmParametrosCredito.Excluir(Tabela: TtecParCreditoTipoTabela);
begin
  case Tabela of
    pcrIDADE : begin
                 if (qryIdade.RecordCount > 1) and (qryIdadelinha.AsCurrency > 1) then
                   qryIdade.Delete;
               end;
    pcrCASAMENTO : begin
                     if (qryTempoCasamento.RecordCount > 1) and (qryTempoCasamentolinha.AsCurrency > 1) then
                       qryTempoCasamento.Delete;
                   end;
    pcrRESIDENCIA : begin
                      if (qryTempoResidencia.RecordCount > 1) and (qryTempoResidencialinha.AsCurrency > 1) then
                        qryTempoResidencia.Delete;
                    end;
    pcrSERVICO : begin
                   if (qryTempoServico.RecordCount > 1) and (qryTempoServicolinha.AsCurrency > 1) then
                     qryTempoServico.Delete;
                 end;
    pcrRENDACONJUGE : begin
                        if (qryRendaConjuge.RecordCount > 1) and (qryRendaConjugelinha.AsCurrency > 1) then
                          qryRendaConjuge.Delete;
                      end;
    pcrMDA : begin
               if (qryMDA.RecordCount > 1) and (qryMDAlinha.AsCurrency > 1) then
                 qryMDA.Delete;
             end;
    pcrPRESTACOESPAGAS : begin
                           if (qryPrestacoesPagas.RecordCount > 1) and (qryPrestacoesPagaslinha.AsCurrency > 1) then
                             qryPrestacoesPagas.Delete;
                         end;
    pcrPONTUACAO : begin
                     if (qryPontuacao.RecordCount > 1) and (qryPontuacaolinha.AsCurrency > 1) then
                       qryPontuacao.Delete;
                   end;
  end;
end;

procedure TdtmParametrosCredito.qryTempoCasamentoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TempoCasamentoMinimo <>  0 then begin
    qryTempoCasamentotabela.AsCurrency := 12;
    qryTempoCasamentolinha.AsCurrency :=  qryTempoCasamento.RecordCount + 1;
    qryTempoCasamentominimo.AsInteger := TempoCasamentoMinimo;
    TempoCasamentoMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryTempoCasamentoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryTempoCasamentovalor1.AsInteger > 0) and (qryTempoCasamentovalor2.AsString <> '')
     and (qryTempoCasamentovalor1.AsInteger < CasamentoMaximo) then
    TempoCasamentoMinimo := qryTempoCasamentovalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryTempoResidenciaAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TempoResidenciaMinimo <>  0 then begin
    qryTempoResidenciatabela.AsCurrency := 13;
    qryTempoResidencialinha.AsCurrency :=  qryTempoResidencia.RecordCount + 1;
    qryTempoResidenciaminimo.AsInteger := TempoResidenciaMinimo;
    TempoResidenciaMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryTempoResidenciaBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryTempoResidenciavalor1.AsInteger > 0) and (qryTempoResidenciavalor2.AsString <> '')
     and (qryTempoResidenciavalor1.AsInteger < ResidenciaMaximo) then
    TempoResidenciaMinimo := qryTempoResidenciavalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryTempoServicoAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if TempoServicoMinimo <>  0 then begin
    qryTempoServicotabela.AsCurrency := 14;
    qryTempoServicolinha.AsCurrency :=  qryTempoServico.RecordCount + 1;
    qryTempoServicominimo.AsInteger := TempoServicoMinimo;
    TempoServicoMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryTempoServicoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryTempoServicovalor1.AsInteger > 0) and (qryTempoServicovalor2.AsString <> '')
     and (qryTempoServicovalor1.AsInteger < ServicoMaximo) then
    TempoServicoMinimo := qryTempoServicovalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryRendaConjugeAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if RendaConjugeMinimo <>  0 then begin
    qryRendaConjugetabela.AsCurrency := 15;
    qryRendaConjugelinha.AsCurrency :=  qryRendaConjuge.RecordCount + 1;
    qryRendaConjugeminimo.AsInteger := RendaConjugeMinimo;
    RendaConjugeMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryRendaConjugeBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryRendaConjugevalor1.AsInteger > 0) and (qryRendaConjugevalor2.AsString <> '')
     and (qryRendaConjugevalor1.AsInteger < ConjugeMaxima) then
    RendaConjugeMinimo := qryRendaConjugevalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryMDAAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if MDAMinimo <>  0 then begin
    qryMDAtabela.AsCurrency := 16;
    qryMDAlinha.AsCurrency :=  qryMDA.RecordCount + 1;
    qryMDAminimo.AsInteger := MDAMinimo;
    MDAMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryMDABeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if (qryMDAvalor1.AsInteger > 0) and (qryMDAvalor2.AsString <> '')
     and (qryMDAvalor1.AsInteger < MDAMaxima) then
    MDAMinimo := qryMDAvalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryPrestacoesPagasAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  if PrestacoesPagasMinimo <>  0 then begin
    qryPrestacoesPagastabela.AsCurrency := 17;
    qryPrestacoesPagaslinha.AsCurrency :=  qryPrestacoesPagas.RecordCount + 1;
    qryPrestacoesPagasminimo.AsInteger := PrestacoesPagasMinimo;
    PrestacoesPagasMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryPrestacoesPagasBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryPrestacoesPagasvalor1.AsInteger > 0) and (qryPrestacoesPagasvalor2.AsString <> '')
     and (qryPrestacoesPagasvalor1.AsInteger < QuitadasMaxima) then
    PrestacoesPagasMinimo := qryPrestacoesPagasvalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryPontuacaoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if PontuacaoMinimo <>  0 then begin
    qryPontuacaotabela.AsCurrency := 18;
    qryPontuacaolinha.AsCurrency :=  qryPontuacao.RecordCount + 1;
    qryPontuacaominimo.AsInteger := PontuacaoMinimo;
    PontuacaoMinimo := 0;
  end
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.qryPontuacaoBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
  if (qryPontuacaovalor1.AsInteger > 0) and (qryPontuacaovalor2.AsString <> '')
     and (qryPontuacaovalor1.AsInteger < PontuacaoMaxima) then
    PontuacaoMinimo := qryPontuacaovalor1.AsInteger + 1
  else DataSet.Cancel;
end;

procedure TdtmParametrosCredito.EditaValorMaximo(Tabela: Array of TtecParCreditoTipoTabela);
var
  a: Integer;
begin
  for a := 0 to High(Tabela) do begin
    case Tabela[a] of
                pcrIDADE: begin
                            qryIdade.Last;
                            if qryIdadevalor1.AsCurrency <> IdadeMaxima then
                            begin
                              qryIdade.Edit;
                              qryIdadevalor1.AsCurrency := IdadeMaxima;
                            end;
                          end;
            pcrCASAMENTO: begin
                            qryTempoCasamento.Last;
                            if qryTempoCasamentovalor1.AsCurrency <> CasamentoMaximo then
                            begin
                              qryTempoCasamento.Edit;
                              qryTempoCasamentovalor1.AsCurrency := CasamentoMaximo;
                            end;
                          end;
           pcrRESIDENCIA: begin
                            qryTempoResidencia.Last;
                            if qryTempoResidenciavalor1.AsCurrency <> ResidenciaMaximo then
                            begin
                              qryTempoResidencia.Edit;
                              qryTempoResidenciavalor1.AsCurrency := ResidenciaMaximo;
                            end;
                          end;
              pcrSERVICO: begin
                            qryTempoServico.Last;
                            if qryTempoServicovalor1.AsCurrency <> ServicoMaximo then
                            begin
                              qryTempoServico.Edit;
                              qryTempoServicovalor1.AsCurrency := ServicoMaximo;
                            end;
                          end;
         pcrRENDACONJUGE: begin
                            qryRendaConjuge.Last;
                            if qryRendaConjugevalor1.AsCurrency <> ConjugeMaxima then
                            begin
                              qryRendaConjuge.Edit;
                              qryRendaConjugevalor1.AsCurrency := ConjugeMaxima;
                            end;
                          end;
                  pcrMDA: begin
                            qryMDA.Last;
                            if qryMDAvalor1.AsCurrency <> MDAMaxima then
                            begin
                              qryMDA.Edit;
                              qryMDAvalor1.AsCurrency := MDAMaxima;
                            end;
                          end;
      pcrPRESTACOESPAGAS: begin
                            qryPrestacoesPagas.Last;
                            if qryPrestacoesPagasvalor1.AsCurrency <> QuitadasMaxima then
                            begin
                              qryPrestacoesPagas.Edit;
                              qryPrestacoesPagasvalor1.AsCurrency := QuitadasMaxima;
                            end;
                          end;
            pcrPONTUACAO: begin
                            qryPontuacao.Last;
                            if qryPontuacaovalor1.AsCurrency <> PontuacaoMaxima then
                            begin
                              qryPontuacao.Edit;
                              qryPontuacaovalor1.AsCurrency := PontuacaoMaxima;
                            end;
                          end;
    end;
  end;
end;

procedure TdtmParametrosCredito.VerificaPreenchimento(
  Tabela: TtecParCreditoTipoTabela);
begin
  case Tabela of
              pcrIDADE : begin
                           if (qryIdadevalor1.AsString = '') and (qryIdadevalor2.AsString = '')
                               and qryIdade.Eof then
                             qryIdade.Cancel;
                         end;
          pcrCASAMENTO : begin
                           if (qryTempoCasamentovalor1.AsString = '') and (qryTempoCasamentovalor2.AsString = '')
                               and qryTempoCasamento.Eof then
                             qryTempoCasamento.Cancel;
                         end;
         pcrRESIDENCIA : begin
                           if (qryTempoResidenciavalor1.AsString = '') and (qryTempoResidenciavalor1.AsString = '')
                               and qryTempoResidencia.Eof then
                             qryTempoResidencia.Cancel;
                         end;
            pcrSERVICO : begin
                           if (qryTempoServicovalor1.AsString = '') and (qryTempoServicovalor2.AsString = '')
                               and qryTempoServico.Eof then
                             qryTempoServico.Cancel;
                         end;
       pcrRENDACONJUGE : begin
                           if (qryRendaConjugevalor1.AsString = '') and (qryRendaConjugevalor2.AsString = '')
                               and qryRendaConjuge.Eof then
                             qryRendaConjuge.Cancel;
                         end;
                pcrMDA : begin
                           if (qryMDAvalor1.AsString = '') and (qryMDAvalor2.AsString = '')
                               and qryMDA.Eof then
                             qryMDA.Cancel;
                         end;
    pcrPRESTACOESPAGAS : begin
                           if (qryPrestacoesPagasvalor1.AsString = '') and (qryPrestacoesPagasvalor2.AsString = '')
                               and qryPrestacoesPagas.Eof then
                             qryPrestacoesPagas.Cancel;
                         end;
          pcrPONTUACAO : begin
                           if (qryPontuacaovalor1.AsString = '') and (qryPontuacaovalor2.AsString = '')
                               and qryPontuacao.Eof then
                             qryPontuacao.Cancel;
                         end;
  end;
end;

procedure TdtmParametrosCredito.dsrIdadeDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if field = qryIdadevalor1 then
    verificaValores(qryIdade, Field, IdadeMaxima);
end;

procedure TdtmParametrosCredito.VerificaValores(Query: TtecQuery; Field: TField; Maximo: Integer);

  function ValoresNaoBatem(Query: TtecQuery): Boolean;
  var
   a : Integer;
   valor1 : Currency;
   pos : TBookmark;
  begin
    Result := False;
    Query.DisableControls;
    pos := Query.GetBookmark;
    for a := Query.RecNo to Query.RecordCount - 1 do
    begin
      valor1 := Query.FieldByName('valor1').AsCurrency;
      Query.Next;
      if Query.FieldByName('minimo').AsCurrency <= valor1 then
      begin
        Query.Edit;
        Query.FieldByName('minimo').AsCurrency := valor1 + 1;
        if Query.FieldByName('minimo').AsCurrency > Query.FieldByName('valor1').AsCurrency then
          Query.FieldByName('valor1').AsCurrency :=  valor1 + 1;
        Query.Post;
        Result := True;
      end;
    end;
    Query.GotoBookmark(pos);
    Query.FreeBookmark(pos);
    Query.EnableControls;
    if Result then
      MensagemAviso('Os valores foram atualizados, verifique-os.');
    keybd_event(VK_END,0,0,0);      
  end;


begin
  if ((Field.AsInteger < Query.FieldByName('minimo').AsInteger) or
      (Field.AsInteger > Maximo)) and (Field.AsVariant <> null) then
  begin
    MensagemAviso(Format('O valor a digitar deve estar entre %s e %s' ,[Query.FieldByName('minimo').AsString, IntToStr(Maximo)]));
    if (Field.OldValue <> Null) then
     if Query.State <> dsInsert then
        Field.AsVariant := Field.OldValue
     else Field.AsVariant := Null
    else Field.AsVariant := Null;
    Field.FocusControl;
  end;
  ValoresNaoBatem(Query);
end;

procedure TdtmParametrosCredito.dsrTempoCasamentoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryTempoCasamentovalor1 then
    VerificaValores(qryTempoCasamento, Field, CasamentoMaximo);
end;

procedure TdtmParametrosCredito.dsrTempoResidenciaDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryTempoResidenciavalor1 then
    verificaValores(qryTempoResidencia, Field, ResidenciaMaximo);
end;

procedure TdtmParametrosCredito.dsrTempoServicoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryTempoServicovalor1 then
    VerificaValores(qryTempoServico, Field, ServicoMaximo);
end;

procedure TdtmParametrosCredito.dsrRendaConjugeDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryRendaConjugevalor1 then
    VerificaValores(qryRendaConjuge, Field, ConjugeMaxima);
end;

procedure TdtmParametrosCredito.dsrMDADataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryMDAvalor1 then
    VerificaValores(qryMDA, Field, MDAMaxima);
end;

procedure TdtmParametrosCredito.dsrPrestacoesPagasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = qryPrestacoesPagasvalor1 then
    VerificaValores(qryPrestacoesPagas, Field, QuitadasMaxima);
end;

procedure TdtmParametrosCredito.dsrPontuacaoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = qryPontuacaovalor1 then
    VerificaValores(qryPontuacao, Field, PontuacaoMaxima);
end;

end.
