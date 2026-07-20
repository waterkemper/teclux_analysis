unit dmmanutencaocheques;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  DB,
  //Repositorio
  dmbasico, dmtecsoft,
  //Componentes
  cpdatasource, cpquery,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Biblio
  ctconstantes, biblio, clparametrossistema, ZTransact;

type
  TtecTipoCheque = (tpcVISTA, tpcPRAZO);

type
  TdtmManutencaoCheques = class(TdtmBasico)
    dsrFiliais: TtecDataSource;
    qryFiliais: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    qryCheques: TtecQuery;
    dsrPesquisa: TtecDataSource;
    qryChequesbanco: TStringField;
    qryChequescheque: TStringField;
    qryChequesdata: TDateField;
    qryChequesvalor: TFloatField;
    qryChequesvencto: TDateField;
    qryChequesremessanumero: TIntegerField;
    qryChequesremessadata: TDateField;
    qryChequestitular: TStringField;
    qryChequescliente: TStringField;
    qryParcelasCheques: TtecQuery;
    qryChequesnumero: TStringField;
    qryChequesfilial: TIntegerField;
    qryCobradores: TtecQuery;
    dsrCobradores: TtecDataSource;
    qryConsultaCobradores: TtecQuery;
    qryConsultaCobradorescodigo: TIntegerField;
    qryConsultaCobradoresnome: TStringField;
    qryChequessituacao: TStringField;
    qryChequescobrador: TStringField;
    qryChequesmarcar: TBooleanField;
    qryCobradorescodigo: TIntegerField;
    qryCobradoresnome: TStringField;
    qryChequesprimeiradevolucao: TDateField;
    qryBancos: TtecQuery;
    qryBancoscodigo: TIntegerField;
    qryBancosnome: TStringField;
    dsrBancos: TtecDataSource;
    qryConsultaBancos: TtecQuery;
    qryConsultaBancosnome: TStringField;
    qryConsultaBancoscodigo: TIntegerField;
    qryChequesagencia: TStringField;
    qryChequesconta: TStringField;
    qryChequesremessanumero2: TIntegerField;
    qryChequesremessadata2: TDateField;
    qryChequessegundadevolucao: TDateField;
    qryChequesreapresentar: TDateField;
    qryNumeroRemessa: TtecQuery;
    qryParcelasChequescheque: TStringField;
    qryParcelasChequesdatavencto: TDateField;
    qryParcelasChequesvalorvencto: TFloatField;
    qryParcelasChequesnumero: TIntegerField;
    qryConsultaMotivos: TtecQuery;
    qryConsultaMotivosdescricao: TStringField;
    qryConsultaMotivoscodigo: TIntegerField;
    qryMotivos: TtecQuery;
    qryMotivoscodigo: TIntegerField;
    qryMotivosdescricao: TStringField;
    dsrMotivos: TtecDataSource;
    qryChequesmotivo: TIntegerField;
    qryDefinirCobradores: TtecQuery;
    dsrDefinirCobradores: TtecDataSource;
    qryChequesprimeiraremessa: TStringField;
    qryChequessegundaremessa: TStringField;
    qryNumeroRemessanumero: TIntegerField;
    qryChequesarquivomagnetico: TBooleanField;
    qryAgencias: TtecQuery;
    qryAgenciascodigo: TIntegerField;
    qryAgenciasnome: TStringField;
    qryAgenciasbanco: TIntegerField;
    qryConsultaAgencias: TtecQuery;
    qryConsultaAgenciasnome: TStringField;
    qryConsultaAgenciascodigo: TIntegerField;
    qryConsultaAgenciasbanco: TIntegerField;
    dsrAgencia: TtecDataSource;
    qryAgenciassigla: TStringField;
    svdCaminho: TSaveDialog;
    qryAgenciasdiasuteisremessa: TIntegerField;
    qryAgenciasvalorlimitecheque: TFloatField;
    qryAgenciasqtdechequevista: TIntegerField;
    qryAgenciasqtdechequeprazo: TIntegerField;
    qryChequespessoatipo: TStringField;
    qryChequespessoanumero: TStringField;
    qryChequesusuario: TIntegerField;
    dsrContas: TtecDataSource;
    qryProcurarContas: TtecQuery;
    qryProcurarContasBanco: TIntegerField;
    qryProcurarContasAgencia: TIntegerField;
    qryProcurarContasConta: TIntegerField;
    qryProcurarContasDigito: TStringField;
    qryProcurarContasTitular: TStringField;
    qryProcurarContasSigla: TStringField;
    qryProcurarContasNome: TStringField;
    qryProcurarContascontacontabil: TIntegerField;
    qryConsultarContas: TtecQuery;
    qryConsultarContasSigla: TStringField;
    qryConsultarContasNome: TStringField;
    qryConsultarContasConta: TIntegerField;
    qryConsultarContasDigito: TStringField;
    qryConsultarContasTitular: TStringField;
    qryConsultarContasAgencia: TIntegerField;
    qryConsultarContasBanco: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  protected
    FControlarSegundaDevolucao: Boolean;
    FPath: String;
    FTipoOperacao: Integer;
    FMaxRemessa: Integer;
    procedure CriarArquivo(Data: String; Remessa: Integer);
    procedure FecharArquivo;
    function  GetTabelaConsultaMotivos: TtecQuery;
    function  GetNomeCobrador: String;
    function  GetDescricaoMotivo: String;
    function  GetConsultaAgencias: TtecQuery;
    function  GetTabelaConsultaCobradores: TtecQuery;
    function  GetQtdeCheques: Integer;
    function  GetTotalCheques: Real;
    function  GetTabelaConsultaBancos: TtecQuery;
    function  GetTabelaConsultaFilial: TtecQuery;
    procedure RemessaBanco_ITAU;
    procedure RemessaBanco_BESC;
    procedure SetPath(const Value: String);
    procedure SetTipoOperacao(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    function  ExisteFilial(Campo, Codigo: String): Boolean;
    function  ExisteCobrador(Campo, Codigo: String): Boolean;
    function  ExisteBanco(Campo, Codigo: String): Boolean;
    function  ExisteMotivo(Campo, Codigo: String): Boolean;
    function  ExisteAgencia(Campo, Codigo: String): Boolean;
    procedure porDataRemessa(RemessaData:String);
    procedure porFilial(Filial:String);
    procedure porCobrador(Cobrador:String; ChequesSemCobrador: Boolean);
    procedure porPeriodo(DataInicio,DataFinal:string);
    procedure porRemessa(Remessa:String);
    procedure porTipoCheque(TipoCheque: Integer);
    function  PosicionarBanco: Boolean;
    procedure AbreTabelaPesquisa(TipoProcura: TtecManutencaoCheques);
    procedure FechaTabelaPesquisa(TipoProcura: TtecManutencaoCheques);
    procedure Selecionar(TipoProcura: TtecManutencaoCheques);
    function  ExecutarConsultaCheque: Boolean;
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure AtribuirRemessa;
    procedure ExcluirRemessa(Data, Numero: String);
    procedure DevolverCheque(Data, Motivo: string);
    procedure AtribuirCobrador(Cobrador: String);
    property  DescricaoMotivo: String read GetDescricaoMotivo;
    property  NomeCobrador: String read GetNomeCobrador;
    property  TipoOperacao: Integer read FTipoOperacao write SetTipoOperacao;
    property  QtdeCheques: Integer read GetQtdeCheques;
    property  Path: String read FPath write SetPath;
    property  TotalCheques: Real read GetTotalCheques;
    property  TabelaConsultaFiliais : TtecQuery read GetTabelaConsultaFilial;
    property  TabelaConsultaCobradores : TtecQuery read GetTabelaConsultaCobradores;
    property  TabelaConsultaBancos: TtecQuery read GetTabelaConsultaBancos;
    property  TabelaConsultaMotivos: TtecQuery read GetTabelaConsultaMotivos;
    property  TabelaConsultaAgencias: TtecQuery read GetConsultaAgencias;
  end;

var
  dtmManutencaoCheques: TdtmManutencaoCheques;
  FArquivo  : Text;

implementation


{$R *.dfm}

{ TdtmManutencaoCheques }


procedure TdtmManutencaoCheques.AbreTabelaPesquisa(TipoProcura: TtecManutencaoCheques);
begin
  case TipoProcura of
          tpManutencaoChequesFiliais   : Abre(ctChequesConsultaFilial);
         tpManutencaoChequesCobradores,
   tpManutencaoChequesDefinicaoCobrador: Abre(ctChequesCobradores);
               tpManutencaoChequesBanco: Abre(ctChequesBanco);
              tpManutencaoChequesMotivo: Abre(ctChequesMotivo);
              tpManutencaoChequesConta : qryConsultarContas.Open;
  end
end;


procedure TdtmManutencaoCheques.AtribuirRemessa;
Var
  Dia, Mes, Ano: Word;
  GerouArquivo: Boolean;
begin
  if MensagemConfirmacao(ctGERARREMESSA) = smbOk then begin
    ReFazConsulta(qryNumeroRemessa,[0],[DataServidor]);
    FMaxRemessa:= qryNumeroRemessanumero.AsInteger;
    DecodeDate(DataServidor,Ano,Mes,Dia);
    svdCaminho.FileName:= 'Remessa-' + Format('%2.2d',[Dia]) +
                                       Format('%2.2d',[Mes]) +
                                       Format('%d',   [Ano]) + '-' +
                                       Format('%3.3d',[FMaxRemessa+1]);
    if svdCaminho.Execute then begin
      GerouArquivo:= True;
      Path:= svdCaminho.FileName;
      if Trim(qryAgenciassigla.AsString) = mrITAU then
        RemessaBanco_ITAU
      else if Trim(qryAgenciassigla.AsString) = mrBESC then
        RemessaBanco_BESC
      else begin
        MensagemAviso(ctSEMMODELOREMESSA);
        GerouArquivo:= False;
      end;
      if GerouArquivo then begin
        if MensagemConfirmacao(ctGERARLISTACHEQUES) = smbOk then begin
          //
        end;
      end;
    end;
  end;
end;

procedure TdtmManutencaoCheques.ExcluirRemessa(Data, Numero: String);
begin
  if MensagemConfirmacao(ctEXCLUIRREMESSA) = smbOk then begin
    qryCheques.DisableControls;
    try
      qryCheques.First;
      while not qryCheques.Eof do begin
        if qryChequesmarcar.AsBoolean then begin
          qryCheques.Edit;
          if (qryChequesremessanumero2.AsInteger > 0) then begin
            qryChequesremessadata2.Clear;
            qryChequesremessanumero2.Clear;
          end
          else if (qryChequesremessanumero.AsInteger > 0) then begin
            qryChequesremessadata.Clear;
            qryChequesremessanumero.Clear;
          end;
          qryChequesarquivomagnetico.AsBoolean:= False;
          qryCheques.Post;
        end;
        qryCheques.Next;
      end;
      Perpetrar([qryCheques]);
    finally
      qryCheques.First;
      qryCheques.EnableControls;
      FQtdeMarcados:=0;
      FTotalMarcados:=0;
    end;
  end;
end;

constructor TdtmManutencaoCheques.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.Tag               := ctTabelas;
  qryCobradores.Tag            := ctTabelas;
  qryBancos.Tag                := ctTabelas;
  qryAgencias.Tag              := ctTabelas;
  qryMotivos.Tag               := ctTabelas;
  qryDefinirCobradores.Tag     := ctTabelas;
  qryProcurarContas.Tag        := ctTabelas;
  qryConsultaFiliais.Tag       := ctChequesConsultaFilial;
  qryConsultaCobradores.Tag    := ctChequesCobradores;
  qryConsultaBancos.Tag        := ctChequesBanco;
  qryConsultaAgencias.Tag      := ctChequesBanco;
  qryConsultaMotivos.Tag       := ctChequesMotivo;
  qryCheques.Tag               := ctManutencaoChequesPesquisa;
  FControlarSegundaDevolucao   := ParSistema.ControlarSomente2Devolucao;
end;

procedure TdtmManutencaoCheques.DevolverCheque(Data, Motivo: string);

    procedure GerarParcelasCheques;
    begin
      if qryParcelasCheques.State = dsInactive then
        qryParcelasCheques.Open;
      qryParcelasCheques.Append;
      qryParcelasChequescheque.AsString       := qryChequesnumero.AsString;
      qryParcelasChequesnumero.AsInteger      := 1;
      qryParcelasChequesdatavencto.AsDateTime := qryChequesvencto.AsCurrency; //StrToDate(Data);
      qryParcelasChequesvalorvencto.AsCurrency:= qryChequesvalor.AsCurrency;
      qryParcelasCheques.Post;
    end;

begin
  if MensagemConfirmacao(ctDEVOLVERCHEQUE) = smbOk then begin
    qryCheques.DisableControls;
    try
      qryCheques.First;
      while not qryCheques.Eof do begin
        if qryChequesmarcar.AsBoolean then begin
          qryCheques.Edit;
          if FControlarSegundaDevolucao then
            qryChequessegundadevolucao.AsDateTime:= StrToDate(Data)
          else begin
            if (qryChequesprimeiradevolucao.AsDateTime = 0) then
                 qryChequesprimeiradevolucao.AsDateTime:= StrToDate(Data)
            else qryChequessegundadevolucao.AsDateTime:= StrToDate(Data);
          end;
          qryChequessituacao.AsString:= 'D';
          if Motivo <> '' then
               qryChequesmotivo.AsInteger:= StrToInt(Motivo)
          else qryChequesmotivo.Clear;
          if (not FControlarSegundaDevolucao or
             (FControlarSegundaDevolucao and (qryChequessegundadevolucao.AsDateTime <> 0))) then
             GerarParcelasCheques;
          qryCheques.Post;
        end;
        qryCheques.next;
      end;
      Perpetrar([qryCheques, qryParcelasCheques]);
    finally
     qryCheques.First;
     qryCheques.EnableControls;
     FQtdeMarcados:=0;
     FTotalMarcados:=0;
    end;
  end;
end;

function TdtmManutencaoCheques.ExisteCobrador(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaCobradores, Campo, Codigo);
end;

function TdtmManutencaoCheques.ExisteBanco(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaBancos, Campo, Codigo);
  ReFazConsulta(qryConsultaAgencias,[0],[qryConsultaBancoscodigo.AsInteger]);
end;

function TdtmManutencaoCheques.ExisteFilial(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

function TdtmManutencaoCheques.ExisteMotivo(Campo, Codigo: String): Boolean;
begin
  Result:= ExisteCodigo(qryConsultaMotivos, Campo, Codigo);
end;

procedure TdtmManutencaoCheques.FechaTabelaPesquisa(TipoProcura: TtecManutencaoCheques);
begin
  case TipoProcura of
         tpManutencaoChequesFiliais     : Fecha(ctChequesConsultaFilial);
         tpManutencaoChequesCobradores,
   tpManutencaoChequesDefinicaoCobrador : Fecha(ctChequesCobradores);
               tpManutencaoChequesBanco : Fecha(ctChequesBanco);
              tpManutencaoChequesMotivo : Fecha(ctChequesMotivo);
              tpManutencaoChequesConta  : qryConsultarContas.Close;
  end
end;

function TdtmManutencaoCheques.GetTabelaConsultaCobradores: TtecQuery;
begin
  Result := qryConsultaCobradores
end;

function TdtmManutencaoCheques.GetTabelaConsultaBancos: TtecQuery;
begin
  Result:= qryConsultaBancos;
end;

function TdtmManutencaoCheques.GetTabelaConsultaMotivos: TtecQuery;
begin
  Result:= qryConsultaMotivos;
end;

function TdtmManutencaoCheques.GetTabelaConsultaFilial: TtecQuery;
begin
  Result := qryConsultaFiliais
end;

procedure TdtmManutencaoCheques.porDataRemessa(RemessaData: string);
begin
  if DataEmBranco(RemessaData) then
       qryCheques.MacroByName('dataremessa').AsString := ''
  else qryCheques.MacroByName('dataremessa').AsString := 'and (((c.remessadata  = ''' + RemessaData + '''' + ') and c.remessadata2 is null) or' +
                                          '      (c.remessadata2 = ''' + RemessaData + '''' + '))';
end;

procedure TdtmManutencaoCheques.porFilial(Filial: String);
begin
  if (Trim(Filial) <> '') then
       qryCheques.MacroByName('filial').AsString := 'and (c.filial = ' + Trim(Filial) + ')'
  else qryCheques.MacroByName('filial').AsString := '';
end;

procedure TdtmManutencaoCheques.porCobrador(Cobrador: String; ChequesSemCobrador: Boolean);
begin
  if (Trim(Cobrador) <> '') and (FTipoOperacao = 3) then
       qryCheques.MacroByName('cobrador').AsString  := 'and (c.usuario = ' + Trim(Cobrador) + ')'
  else if ChequesSemCobrador and (FTipoOperacao = 3) then
      qryCheques.MacroByName('cobrador').AsString := 'and c.usuario is null'
 else qryCheques.MacroByName('cobrador').AsString := '';
end;

procedure TdtmManutencaoCheques.porPeriodo(DataInicio, DataFinal: string);
begin
  case FTipoOperacao of
     0: begin
          if not DataEmBranco(DataInicio) then begin
            if DataEmBranco(DataFinal) then
               qryCheques.MacroByName('periodo').AsString :='(c.vencto = ''' + DataInicio + ''')'
            else
               qryCheques.MacroByName('periodo').AsString :='(c.vencto between (''' + DataInicio + ''') and (''' + DataFinal + '''))';
          end
          else begin
            if not DataEmBranco(DataFinal) then
               qryCheques.MacroByName('periodo').AsString := '(c.vencto = ''' + DataFinal + ''')'
            else
               qryCheques.MacroByName('periodo').AsString := '';
          end;

          qryCheques.MacroByName('periodo').AsString := 'and (' + qryCheques.MacroByName('periodo').AsString + ' or ' +
                                         '((c.reapresentar <= current_date) and (c.remessanumero2 is null)))'
        end;
     2: begin
          if not DataEmBranco(DataInicio) then begin
            if DataEmBranco(DataFinal) then
                 qryCheques.MacroByName('periodo').AsString :='and (c.vencto = ''' + DataInicio + ''')'
            else qryCheques.MacroByName('periodo').AsString :='and (c.vencto between (''' + DataInicio + ''') and (''' + DataFinal + '''))'
          end
          else begin
            if not DataEmBranco(DataFinal) then
                 qryCheques.MacroByName('periodo').AsString := 'and (c.vencto = ''' + DataFinal + ''')'
            else qryCheques.MacroByName('periodo').AsString := '';
          end;
        end;
     1: qryCheques.MacroByName('periodo').AsString := '';
     3: begin
          if not DataEmBranco(DataInicio) then begin
            if DataEmBranco(DataFinal) then
                 qryCheques.MacroByName('periodo').AsString :=('and (c.segundadevolucao = ''' + DataInicio + ''')')
            else qryCheques.MacroByName('periodo').AsString :=('and (c.segundadevolucao between ('''+DataInicio+''') and ('''+DataFinal+'''))')
          end
          else begin
            if not DataEmBranco(DataFinal) then
                 qryCheques.MacroByName('periodo').AsString := ('and (c.segundadevolucao = ''' + DataFinal + ''')')
            else qryCheques.MacroByName('periodo').AsString := '';
          end;
        end;
  end;
end;

procedure TdtmManutencaoCheques.porRemessa(Remessa: String);
begin
  if (Trim(Remessa) <> '') then
       qryCheques.MacroByName('remessa').AsString := 'and (((c.remessanumero = ' + Trim(Remessa) + ') and c.remessanumero2 is null) or' +
                                      '      (c.remessanumero2 = ' + Trim(Remessa) + '))'
  else qryCheques.MacroByName('remessa').AsString  := '';
end;

procedure TdtmManutencaoCheques.porTipoCheque(TipoCheque: Integer);
begin
  if (TipoOperacao in [0,2]) then begin
    Case TipoCheque of
      0:   qryCheques.MacroByName('tipocheque').AsString := 'where(c.vencto <= current_date)';
      1:   qryCheques.MacroByName('tipocheque').AsString := 'where(c.vencto > current_date)';
      2:   qryCheques.MacroByName('tipocheque').AsString := 'where(c.vencto is not null)';
    end;
  end else qryCheques.MacroByName('tipocheque').AsString   := 'where(c.vencto is not null)';
end;

procedure TdtmManutencaoCheques.Selecionar(TipoProcura: TtecManutencaoCheques);
begin
 case TipoProcura of
         tpManutencaoChequesFiliais    : RefazConsulta(qryFiliais,[0],[qryConsultaFiliaiscodigo.AsInteger]);
         tpManutencaoChequesCobradores : RefazConsulta(qryCobradores,[0],[qryConsultaCobradorescodigo.AsInteger]);
  tpManutencaoChequesDefinicaoCobrador : RefazConsulta(qryDefinirCobradores,[0],[qryConsultaCobradorescodigo.AsInteger]);
              tpManutencaoChequesBanco : ReFazConsulta(qryAgencias,[0,1],[qryConsultaBancoscodigo.AsString,
                                                                          qryConsultaAgenciascodigo.AsString]);
             tpManutencaoChequesMotivo : ReFazConsulta(qryMotivos,[0],[qryConsultaMotivoscodigo.AsInteger]);
              tpManutencaoChequesConta : RefazConsulta(qryProcurarContas,[0],[qryConsultarContasConta.AsVariant]);
 end;
end;

function TdtmManutencaoCheques.ExecutarConsultaCheque: Boolean;
begin
  if qryCheques.Active then
    qryCheques.Close;
  Abre(ctManutencaoChequesPesquisa);
  Result:= qryCheques.IsEmpty;
end;

procedure TdtmManutencaoCheques.SetTipoOperacao(const Value: Integer);
begin
  FTipoOperacao := Value;
  case value of
    0: qryCheques.MacroByName('situacao').AsString := ' and (((c.remessanumero is null) and (c.remessanumero2 is null)) or ' +
                                              '((c.reapresentar <= current_date) and (c.remessanumero2 is null)))';
    1: qryCheques.MacroByName('situacao').AsString  := '';
    2: if FControlarSegundaDevolucao then
            qryCheques.MacroByName('situacao').AsString := 'and (c.segundadevolucao is null)'
       else qryCheques.MacroByName('situacao').AsString := 'and ((c.primeiradevolucao is null) or ' +
                                             '     ((c.segundadevolucao is null) and (c.reapresentar is not null)))';

(*            qryCheques.Sql[WhereSituacao] := 'and (c.remessanumero2 is not null) and (c.segundadevolucao is null)'
       else qryCheques.Sql[WhereSituacao] := 'and (((c.primeiradevolucao is null) and (c.remessanumero is not null)) or ' +
                                             '     ((c.segundadevolucao is null) and (c.remessanumero2 is not null) and ' +
                                             '      (c.reapresentar is not null)))';
*)
    3: qryCheques.MacroByName('situacao').AsString := 'and ((c.situacao = ''D''' + ') and (c.segundadevolucao is not null))';
  end;
end;

procedure TdtmManutencaoCheques.MarcarSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryCheques,
                  qryChequesmarcar,
                  qryChequesvalor,
                  Marcando,
                  Todos);
end;

function TdtmManutencaoCheques.GetQtdeCheques: Integer;
begin
   Result:= qryCheques.RecordCount;
end;

function TdtmManutencaoCheques.GetTotalCheques: Real;
begin
  Result:= TotalizarValores[qryCheques, qryChequesvalor, nil];
end;

procedure TdtmManutencaoCheques.AtribuirCobrador(Cobrador: String);
begin
  if MensagemConfirmacao(ctATRIBUIRCOBRADOR) = smbOk then begin
    qryCheques.DisableControls;
    try
      qryCheques.First;
      while not qryCheques.Eof do begin
        if qryChequesmarcar.AsBoolean then begin
          qryCheques.edit;
          qryChequesusuario.AsInteger := StrToInt(Cobrador);
          qryCheques.post;
        end;
        qryCheques.Next;
      end;
      Perpetrar([qryCheques]);
    finally
      qryCheques.First;
      qryCheques.EnableControls;
      FQtdeMarcados:=0;
      FTotalMarcados:=0;
    end;
  end;
end;

function TdtmManutencaoCheques.GetNomeCobrador: String;
begin
  Result:= qryCobradoresnome.Asstring;
end;

function TdtmManutencaoCheques.GetDescricaoMotivo: String;
begin
  Result:= qryMotivosdescricao.AsString;
end;

function TdtmManutencaoCheques.ExisteAgencia(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaAgencias, Campo, Codigo);
end;

function TdtmManutencaoCheques.GetConsultaAgencias: TtecQuery;
begin
  Result:= qryConsultaAgencias;
end;

function TdtmManutencaoCheques.PosicionarBanco: Boolean;
begin
  Result := ExisteCodigo(qryConsultaBancos, qryBancoscodigo.FieldName, qryBancoscodigo.AsString);
end;

procedure TdtmManutencaoCheques.RemessaBanco_ITAU;
Var
  TipoCheque: TtecTipoCheque;
  DataRemessa, HoraRemessa,
  PessoaTipo, PessoaNumero,
  DataCheque, DataBoa: String;
  Dia,Mes,Ano,
  Hora,Min,Seg,MSeg: Word;
  Tipo: Char;
  NrRem,
  NrReg: Integer;
  Valor: String;
  TotalLote: Real;

  procedure Header_Arquivo;
  begin
    Write(FArquivo,'341');
    Write(FArquivo,IncSt('0',4));

    Write(FArquivo,IncSt('0',1));

    Write(FArquivo,IncSt(' ',9));

    Write(FArquivo,'2');

    Write(FArquivo,FormatStringOut(CNPJFilialBase,'R','0',14));

    Write(FArquivo,IncSt(' ',20));

    Write(FArquivo,'0');

    Write(FArquivo,FormatStringOut(qryAgenciascodigo.AsString,'R','0',4));

    Write(FArquivo,IncSt(' ',1));

    Write(FArquivo,IncSt('0',7));

//  Write(FArquivo,Format('%5.5d',[qryAgenciasnumeroconta.AsInteger]));
    Write(FArquivo,Format('%5.5d',[qryProcurarContasConta.asinteger]));

    Write(FArquivo,IncSt(' ',1));

//  Write(FArquivo,qryAgenciasdigitoconta.AsString);
    Write(FArquivo,qryProcurarContasDigito.AsString);

    Write(FArquivo,FormatStringOut(Copy(NomeFilialBase,1,30),'L',' ',30));

    Write(FArquivo,FormatStringOut('BANCO ITAU','L',' ',30));

    Write(FArquivo,IncSt(' ',10));

    Write(FArquivo,'1');

    Write(FArquivo,DataRemessa);

    Write(FArquivo,HoraRemessa);

    Write(FArquivo,IncSt('0',6));

    Write(FArquivo,'040');

    Write(FArquivo,IncSt('0',5));

    Write(FArquivo,IncSt(' ',20));

    Write(FArquivo,IncSt(' ',49));

    WriteLn(FArquivo);

  end;

  procedure Header_Lote;
  begin
    Write(FArquivo,'341');
    Write(FArquivo,'0001');

    Write(FArquivo,'1');

    Write(FArquivo,'C');

    Write(FArquivo,'06');

    Write(FArquivo,'01');

    Write(FArquivo,'030');

    Write(FArquivo,IncSt(' ',1));

    Write(FArquivo,'2');

    Write(FArquivo,FormatStringOut(CNPJFilialBase,'R','0',14));

    Write(FArquivo,IncSt(' ',20));

    Write(FArquivo,'0');

    Write(FArquivo,FormatStringOut(qryAgenciascodigo.AsString,'R','0',4));

    Write(FArquivo,IncSt(' ',1));

    Write(FArquivo,IncSt('0',7));

//    Write(FArquivo,Format('%5.5d',[qryAgenciasnumeroconta.AsInteger]));
    Write(FArquivo,Format('%5.5d',[qryProcurarContasConta.AsInteger]));

    Write(FArquivo,IncSt(' ',1));

//    Write(FArquivo,qryAgenciasdigitoconta.AsString);
    Write(FArquivo,qryProcurarContasdigito.AsString);

    Write(FArquivo,FormatStringOut(Copy(NomeFilialBase,1,30),'L',' ',30));

    Write(FArquivo,IncSt(' ',7));

    Write(FArquivo,IncSt(' ',5));

    Write(FArquivo,IncSt(' ',125));

    Write(FArquivo,Tipo);

    WriteLn(FArquivo);

  end;

  procedure Trailer_Lote;
  begin
    Valor:= Format('%11.2f', [TotalLote]);
    Valor:= Trim(Trocar(Valor,',',''));

    Write(FArquivo,'341');

    Write(FArquivo,'0001');

    Write(FArquivo,'5');

    Write(FArquivo,IncSt(' ',9));

    Write(FArquivo,'2');

    Write(FArquivo,FormatStringOut(CNPJFilialBase,'R','0',14));

    Write(FArquivo,IncSt(' ',20));

    Write(FArquivo,'0');

    Write(FArquivo,FormatStringOut(qryAgenciascodigo.AsString,'R','0',4));

    Write(FArquivo,IncSt(' ',1));

    Write(FArquivo,IncSt('0',7));

//    Write(FArquivo,Format('%5.5d',[qryAgenciasnumeroconta.AsInteger]));
    Write(FArquivo,Format('%5.5d',[qryProcurarContasconta.AsInteger]));

    Write(FArquivo,IncSt(' ',1));

//    Write(FArquivo,qryAgenciasdigitoconta.AsString);
    Write(FArquivo,qryProcurarContasdigito.AsString);

    Write(FArquivo,IncSt(' ',98));

    Write(FArquivo,Format('%6.6d',[NrReg-1]));

    Write(FArquivo, FormatStringOut(Valor,'R','0',18));

    Write(FArquivo,IncSt(' ',46));

    WriteLn(FArquivo);

  end;

  procedure Trailer_Arquivo;
  begin
    Write(FArquivo,'341');
    Write(FArquivo,'9999');

    Write(FArquivo,'9');

    Write(FArquivo,IncSt(' ',09));

    Write(FArquivo,'000001');

    Write(FArquivo,Format('%6.6d',[NrReg-1]));

    Write(FArquivo, FormatStringOut(Valor,'R','0',18));

    Write(FArquivo,IncSt(' ',193));

  end;

Begin
  NrRem:= 0;

  qryCheques.DisableControls;

  try

    for TipoCheque:= tpcVISTA To tpcPRAZO do begin

      DecodeDate(DataServidor,Ano,Mes,Dia);

      DecodeTime(Time,Hora,Min,Seg,MSeg);
      DataRemessa:= Format('%2.2d',[Dia])  + Format('%2.2d',[Mes]) + IntToStr(Ano);
      HoraRemessa:= Format('%2.2d',[Hora]) + Format('%2.2d',[Min]) + Format('%2.2d',[Seg]);


      if qryChequescliente.AsString = qryChequestitular.AsString then begin

        if qryChequespessoatipo.AsString = 'F' then

          PessoaTipo:= '1'

        else if qryChequespessoatipo.AsString = 'J' then

          PessoaTipo:= '2';

        PessoaNumero:= FormatStringOut(qryChequespessoanumero.AsString,'R','0',14)

      end

      else begin

        PessoaTipo  := '0';

        PessoaNumero:= IncSt('0',14);

      end;



      if TipoCheque = tpcVISTA then Tipo:= '1'

      else                          Tipo:= '2';



      Inc(NrRem); NrReg:= 1;

      qryCheques.First;

      while not qryCheques.Eof do begin

        if qryChequesmarcar.AsBoolean and

           (qryChequesvalor.AsCurrency <= qryAgenciasvalorlimitecheque.AsCurrency)     and

           (((TipoCheque = tpcVISTA) and (qryChequesvencto.AsDateTime <= DataServidor)) or

            ((TipoCheque = tpcPRAZO) and (qryChequesvencto.AsDateTime > (DataServidor + qryAgenciasdiasuteisremessa.AsInteger))))

        then begin



          qryCheques.edit;

          if (qryChequesremessanumero.AsInteger > 0) then begin
            qryChequesremessanumero2.AsInteger:= FMaxRemessa + NrRem;
            qryChequesremessadata2.AsDateTime := DataServidor;
          end
          else begin
            qryChequesremessanumero.AsInteger := FMaxRemessa + NrRem;
            qryChequesremessadata.AsDateTime  := DataServidor;
          end;
          qryChequesarquivomagnetico.AsBoolean:= True;

          qryCheques.post;


          if (NrReg = 1) then begin

            TotalLote:= 0;

            CriarArquivo(DataRemessa,NrRem);

            Header_Arquivo;

            Header_Lote;

          end;



          DecodeDate(qryChequesdata.AsDateTime,Ano,Mes,Dia);

          DataCheque:= Format('%2.2d',[Dia])  + Format('%2.2d',[Mes]) + IntToStr(Ano);

          if (TipoCheque = tpcVISTA) then
            DataBoa:= '00000000'
          else begin
            DecodeDate(qryChequesvencto.AsDateTime,Ano,Mes,Dia);
            DataBoa:= Format('%2.2d',[Dia])  + Format('%2.2d',[Mes]) + IntToStr(Ano);
          end;


          Write(FArquivo,'341');

          Write(FArquivo,'0001');

          Write(FArquivo,'3');

          Write(FArquivo,Format('%5.5d',[NrReg]));

          Write(FArquivo,'D');

          Write(FArquivo,'000');

          Write(FArquivo,'2');

          Write(FArquivo,FormatStringOut(CNPJFilialBase,'R','0',14));

          Write(FArquivo,IncSt(' ',20));

          Write(FArquivo,'0');

          Write(FArquivo,FormatStringOut(qryAgenciascodigo.AsString,'R','0',4));

          Write(FArquivo,IncSt(' ',1));

          Write(FArquivo,IncSt('0',7));

//          Write(FArquivo,Format('%5.5d',[qryAgenciasnumeroconta.AsInteger]));
          Write(FArquivo,Format('%5.5d',[qryProcurarContasconta.AsInteger]));

          Write(FArquivo,IncSt(' ',1));

//          Write(FArquivo,qryAgenciasdigitoconta.AsString);
          Write(FArquivo,qryProcurarContasdigito.AsString);

          Write(FArquivo,FormatStringOut(Copy(qryChequestitular.AsString,1,30),'L',' ',30));

          Write(FArquivo,PessoaTipo);

          Write(FArquivo,PessoaNumero);

          Write(FArquivo,DataCheque);

          Write(FArquivo,DataBoa);

          Write(FArquivo,FormatStringOut(qryChequesnumero.AsString,'R','0',30));

          Valor:= Format('%11.2f', [qryChequesvalor.AsCurrency]);

          Valor:= Trim(Trocar(Valor,',',''));

          Write(FArquivo, FormatStringOut(Valor,'R','0',18));

          Write(FArquivo,IncSt('0',7));

          Write(FArquivo,IncSt(' ',16));

          Write(FArquivo,IncSt(' ',24));

          Write(FArquivo,'000040');

          Write(FArquivo,IncSt(' ',5));

          Write(FArquivo,'1');

          WriteLn(FArquivo);

          TotalLote:= TotalLote + qryChequesvalor.AsCurrency;

          Inc(NrReg);



          if (((TipoCheque = tpcVISTA) and (NrReg > qryAgenciasqtdechequevista.AsInteger)) or

              ((TipoCheque = tpcPRAZO) and (NRReg > qryAgenciasqtdechequeprazo.AsInteger))) then begin

            Trailer_Lote;

            Trailer_Arquivo;

            FecharArquivo;

            NrReg:= 1;

            Inc(NrRem);

          end;

        end;

        qryCheques.Next;

      end;

      if (TTextRec(FArquivo).Mode = fmOutput) then begin

        Trailer_Lote;
        Trailer_Arquivo;

        FecharArquivo;

      end

      else Dec(NrRem);

    end;
  finally

    Perpetrar([qryCheques]);

    qryCheques.First;
    qryCheques.EnableControls;
    FQtdeMarcados:=0;
    FTotalMarcados:=0;
  end;
End;


procedure TdtmManutencaoCheques.RemessaBanco_BESC;
begin
  //
end;

procedure TdtmManutencaoCheques.SetPath(const Value: String);
begin
  if FPath <> Value then
    FPath:= Value;
end;

procedure TdtmManutencaoCheques.CriarArquivo(Data: String; Remessa: Integer);
Var
  RPos: Integer;
begin
  RPos:= Pos('Remessa',Path);
  if (RPos <> 0) then begin
    Path:= Copy(Path,1,Length(Path)-RPos);
    Path:= Path + 'Remessa-' + Data + '-' + Format('%3.3d',[FMaxRemessa + Remessa]) + '.txt';
  end;
  Repeat
    if FileExists(FPath) then begin
      if MensagemConfirmacao(ctARQUIVOEXISTE) = smbOk then
        DeleteFile(FPath)
      else begin
        svdCaminho.FileName:= 'Remessa-' + Data + '-' + Format('%3.3d',[FMaxRemessa + Remessa]);
        if svdCaminho.Execute then
          Path:= svdCaminho.FileName;
      end;
    end;
  until not FileExists(FPath);
  AssignFile(FArquivo,FPath);
  Rewrite(FArquivo);
end;

procedure TdtmManutencaoCheques.FecharArquivo;
begin
  Close(FArquivo);
end;

procedure TdtmManutencaoCheques.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  qryProcurarContas.Close;
end;

procedure TdtmManutencaoCheques.DataModuleCreate(Sender: TObject);
begin
  inherited;
  qryProcurarContas.Open;
end;

end.
