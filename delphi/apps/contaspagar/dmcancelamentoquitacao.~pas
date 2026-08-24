unit dmcancelamentoquitacao;

interface

uses
  SysUtils, Classes, Variants, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, ctconstantes, biblio, clusuario, dmtecsoft, clparametrossistema,Dialogs,
  dmcontaspagar, Controls, ZTransact;

type
  TdtmCancelamentoQuitacao = class(TdtmBasico)
    qryFilial: TtecQuery;
    qryFilialCodigo: TIntegerField;
    qryFilialNome: TStringField;
    dsrFilial: TtecDataSource;
    qryConsultaFiliais: TtecQuery;
    qryConsultaFiliaisNome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryGrupoFiliais: TtecQuery;
    qryGrupoFiliaisCodigo: TIntegerField;
    qryGrupoFiliaisDescricao: TStringField;
    dsrGrupoFiliais: TtecDataSource;
    qryConsultaGrupoFiliais: TtecQuery;
    qryConsultaGrupoFiliaisDescricao: TStringField;
    qryConsultaGrupoFiliaisCodigo: TIntegerField;
    qryFornecedores: TtecQuery;
    qryFornecedoresCodigo: TIntegerField;
    qryFornecedoresNome: TStringField;
    qryFornecedoresTipo: TStringField;
    dsrFornecedores: TtecDataSource;
    qryConsultaFornecedores: TtecQuery;
    qryConsultaFornecedoresNome: TStringField;
    qryConsultaFornecedoresCodigo: TIntegerField;
    qryConsultaFornecedoresTipo: TStringField;
    qryDuplicatas: TtecQuery;
    dsrDuplicatas: TtecDataSource;
    qryMesmoCheque: TtecQuery;
    qryCancelarQuitacao: TtecQuery;
    qryCancelarQuitacaoDocumentoPag: TIntegerField;
    qryCancelarQuitacaoDataVencto: TDateField;
    qryCancelarQuitacaoValorVencto: TFloatField;
    qryCancelarQuitacaoNumero: TIntegerField;
    qryCancelarQuitacaoDataPagto: TDateField;
    qryCancelarQuitacaoValorPagto: TFloatField;
    qryCancelarQuitacaoFilialPagto: TIntegerField;
    qryCancelarQuitacaoChequePagto: TIntegerField;
    qryCancelarQuitacaoTipoPagamento: TIntegerField;
    qryCancelarQuitacaoUsuario: TIntegerField;
    qryCancelarQuitacaoContaCredito: TIntegerField;
    qryCancelarQuitacaoAutorizado: TBooleanField;
    qryConsultaFornecedoresPessoaNumero: TStringField;
    qryConsultaFornecedoresTipoCliente: TStringField;
    qryConsultaFornecedoresEstado: TStringField;
    qryConsultaFornecedoresNomeCidade: TStringField;

    qryConsultarContas: TtecQuery;
    qryConsultarContasSigla: TStringField;
    qryConsultarContasNome: TStringField;
    qryConsultarContasConta: TIntegerField;
    qryConsultarContasDigito: TStringField;
    qryConsultarContasTitular: TStringField;
    qryConsultarContasAgencia: TIntegerField;
    qryConsultarContasBanco: TIntegerField;

    qryContas: TtecQuery;
    qryContasBanco: TIntegerField;
    qryContasAgencia: TIntegerField;
    qryContasConta: TIntegerField;
    qryContasDigito: TStringField;
    qryContasTitular: TStringField;
    qryContasSigla: TStringField;
    qryContasNome: TStringField;
    dsrContas: TtecDataSource;
    qryCancelarQuitacaoContaPagto: TIntegerField;
    qryMesmoChequeDocumentoPag: TIntegerField;
    qryMesmoChequeDataVencto: TDateField;
    qryMesmoChequeNumero: TIntegerField;
    qryDuplicatasCodigo: TIntegerField;
    qryDuplicatasTipoFornecedor: TStringField;
    qryDuplicatasDocumentoPag: TIntegerField;
    qryDuplicatasDataVencto: TDateField;
    qryDuplicatasDataPagto: TDateField;
    qryDuplicatasAtraso: TIntegerField;
    qryDuplicatasValorPagto: TFloatField;
    qryDuplicatasNumero: TIntegerField;
    qryDuplicatasContaPagto: TIntegerField;
    qryDuplicatasChequePagto: TIntegerField;
    qryDuplicatasQuitar: TBooleanField;
    qryDuplicatasFornecedor: TStringField;
    qryConsultaContaContabil: TtecQuery;
    qryConsultaContaContabildescricaoedentada: TStringField;
    qryConsultaContaContabildescricao: TStringField;
    qryConsultaContaContabilclassificacao: TStringField;
    qryConsultaContaContabilcodigo: TIntegerField;
    qryConsultaContaContabiltipo: TStringField;
    qryProcuraCreditarPagamento: TtecQuery;
    qryProcuraCreditarPagamentocodigo: TIntegerField;
    qryProcuraCreditarPagamentoclassificacao: TStringField;
    qryProcuraCreditarPagamentodescricao: TStringField;
    dsrProcuraCreditarPagamento: TtecDataSource;
    qryContascontacontabil: TIntegerField;
    qryDuplicatascomplemento: TStringField;
    procedure qryFornecedoresBeforeOpen(DataSet: TDataSet);
    procedure qryDuplicatasAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryContasAfterOpen(DataSet: TDataSet);
    procedure qryDuplicatasBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
//    procedure ZMonitor1MonitorEvent(Sql, Result: String);

  private
    FDocumentoPagAberto: integer;
    FReabrirDocumentoPag: Boolean;
    fdtmContasPagar: TdtmContasPagar;
    procedure SetConta(const Value: String);
    function GetConsultaContas: TtecQuery;
    procedure SetContContabil(const Value: String);
    function getdtmContasPagar: TdtmContasPagar;


  protected
    Usuario: TtecUsuarios;
//    dtmContasPagar: TdtmContasPagar;
    FPagtoFinal: String;
    FPagtoInicial: String;
    FTotalRegistro: Integer;
    FTotalValores: Real;
    function GetTipoPessoa: String;
    function GetQtdeDuplicatas: Integer;
    function GetTotalDuplicatas: Real;
    procedure MontaDataPagamento;
    function GetConsultaFiliais: TtecQuery;
    function GetConsultaFornecedores: TtecQuery;
    function GetConsultaGrupoFiliais: TtecQuery;
    procedure SetFilial(const Value: String);
    procedure SetFornecedor(const Value: String);
    procedure SetGrupo(const Value: String);
    procedure SetPagtoFinal(const Value: String);
    procedure SetPagtoInicial(const Value: String);
    function GetDataContabil: TDateTime;
  public
    // seta a ordem pela qual as duplicatas serão ordenadas
    // D -> Data Pagto (default)
    // F -> Fornecedor
    FOrdenacaoDuplicata:String;
    procedure MarcarSelecionados(Marcando, Todos: Boolean);
    procedure CancelarQuitacao;
    procedure ZerarConsultaDuplicatas;
    function SelecionarDuplicatas: Boolean;
    function ExisteFiliais(Campo, Codigo: string): Boolean;
    function ExisteConta(Campo, Codigo: string): Boolean;
    function ExisteGrupoFiliais(Campo, Codigo: String): Boolean;
    function ExisteFornecedores(Campo, Codigo: String): Boolean;
    function ExisteContaContabil(campo, codigo: String): Boolean;

    procedure AbreTabelaPesquisa(TipoPesquisa: TtecCancelamentoQuitacao);
    procedure FechaTabelaPesquisa(TipoPesquisa: TtecCancelamentoQuitacao);
    procedure Selecionar(TipoPesquisa: TtecCancelamentoQuitacao);
    constructor Create(AOwner: TComponent); Override;

    property ConsultaContas: TtecQuery read GetConsultaContas;
    property ConsultaFiliais: TtecQuery read GetConsultaFiliais;
    property ConsultaGrupoFiliais: TtecQuery read GetConsultaGrupoFiliais;
    property ConsultaFornecedores: TtecQuery read GetConsultaFornecedores;
    property PagtoInicial: String read FPagtoInicial write SetPagtoInicial;
    property PagtoFinal: String read FPagtoFinal write SetPagtoFinal;
    property Filial: String write SetFilial;
    property Grupo: String write SetGrupo;
    property Conta: String write SetConta;
    property ContaContabil: String write SetContContabil;
    property Fornecedor: String write SetFornecedor;
    property DataContabil: TDateTime read GetDataContabil;
    property TipoPessoa: String read GetTipoPessoa;
    property QtdeDuplicatas: Integer read GetQtdeDuplicatas;
    property TotalDuplicatas: Real read GetTotalDuplicatas;
    property DocumentoPagAberto: integer read FDocumentoPagAberto write FDocumentoPagAberto;
    property ReabrirDocumentoPag: Boolean read FReabrirDocumentoPag write FReabrirDocumentoPag;
    property dtmContasPagar: TdtmContasPagar read getdtmContasPagar write fdtmContasPagar;
  end;

var
  dtmCancelamentoQuitacao: TdtmCancelamentoQuitacao;

implementation

const
      WhereBase = 16;
      WherePagto      = WhereBase + 1;
      WhereFilial     = WhereBase + 2;
      WhereGrupo      = WhereBase + 3;
      WhereFornecedor = WhereBase + 4;

{$R *.dfm}

{ TdtmCancelamentoQuitacao }

procedure TdtmCancelamentoQuitacao.AbreTabelaPesquisa(TipoPesquisa: TtecCancelamentoQuitacao);
begin
   case TipoPesquisa of
      cdpFILIAIS:      Abre(ctConsultaFiliais);
      cdpGRUPOFILIAIS: Abre(ctConsultaGruposFiliais);
      cdpFORNECEDORES: begin
                          qryConsultaFornecedores.MacroByName('Codigo').AsString:= ' AND v.Codigo = 0';
                          Abre(ctConsultaFornecedores);
                       end;
      cdpCONTA:        Abre(ctConsultaContas);
      cdpCONTACREDITOPAGAMENTO : begin
                                   qryConsultaContaContabil.MacroByName('consulta').AsString := '';
                                   Abre(ctConsultaContaContabil);
                                 end;
   end;
end;

procedure TdtmCancelamentoQuitacao.CancelarQuitacao;
var
  duplicatasSelecionadas: TtecDuplicatasSelecionadas;
  i : integer;
begin

  if not assigned(Usuario) then
   Usuario := TtecUsuarios.Create(dtmTecSoft.Database);

  try
    if UsuarioLogin.Pagamento then
         Usuario:= ObterAutorizacao(taSENHA)
    else Usuario:= ObterAutorizacao(taLOGIN, ctAUTORIZACAOPAGAMENTO, ctAUTORIZADO);
    if Assigned(Usuario) and Usuario.Pagamento then begin
      try

        i:=0;
        duplicatasSelecionadas := nil;
        qryDuplicatas.DisableControls;
        qryDuplicatas.First;
        while not qryDuplicatas.Eof do
        begin
          if qryDuplicatasquitar.AsBoolean then
          begin
            SetLength(duplicatasSelecionadas,i+1);
            duplicatasSelecionadas[i].DocumentoPag := qryDuplicatasDocumentoPag.AsInteger;
            duplicatasSelecionadas[i].DataVencto := qryDuplicatasDataVencto.Asdatetime;
            duplicatasSelecionadas[i].Numero := qryDuplicatasNumero.asinteger;
            if DocumentoPagAberto = qryDuplicatasdocumentopag.AsInteger then
               ReabrirDocumentoPag := true;
            i := i+1;
          end;
          qryduplicatas.Next;
        end;



        {
        if not assigned(dtmContasPagar) then
          dtmContasPagar := TdtmContasPagar.Create(self);
          }

        for i := 0 to High(duplicatasSelecionadas) do
          dtmContasPagar.DesQuitarDuplicatas(
              duplicatasSelecionadas[i].DocumentoPag,
              duplicatasSelecionadas[i].Numero,
              duplicatasSelecionadas[i].DataVencto,
              duplicatasSelecionadas);
              
//        dtmcontaspagar.Free;
//        dtmContasPagar := nil;


        {
        qryDuplicatas.First;
        while not qryDuplicatas.Eof do begin
          if qryDuplicatasquitar.AsBoolean then begin

            ReFazConsulta(qryCancelarQuitacao,[0,1],[qryDuplicatasDocumentoPag.AsInteger,
                                                     qryDuplicatasdatavencto.AsDateTime]);

            if not qryCancelarQuitacao.IsEmpty then begin
              qryCancelarQuitacao.Edit;
              qryCancelarQuitacaodatapagto.Clear;
              qryCancelarQuitacaovalorpagto.Clear;
              qryCancelarQuitacaofilialpagto.Clear;
              qryCancelarQuitacaotipopagamento.Clear;
              qryCancelarQuitacaousuario.Clear;
              qryCancelarQuitacaoContaPagto.Clear;
              qryCancelarQuitacaoChequePagto.Clear;
              qryCancelarQuitacaocontacredito.Clear;
              qryCancelarQuitacaoautorizado.AsBoolean:= True;
              qryCancelarQuitacao.Post;
              Perpetrar([qryCancelarQuitacao]);

            end;
          end;
          qryduplicatas.Next;
        end;
        }
      finally

           {
        dtmcontaspagar.Free;
        dtmContasPagar := nil;
        }

        qryDuplicatas.EnableControls;

        SelecionarDuplicatas;
        QtdeMarcados := 0;
        TotalMarcados:= 0;

      end;
    end
    else
      MensagemAviso(format(ctUSUARIONAOAUTORIZADO,['cancelar o pagamento de duplicatas.']));
  finally
    freeandnil(fdtmcontaspagar);
//    Usuario.Free;
  end;
end;

constructor TdtmCancelamentoQuitacao.Create(AOwner: TComponent);
begin
  inherited;
  qryFilial.      Tag:= ctTabelas;
  qryGrupoFiliais.Tag:= ctTabelas;
  qryFornecedores.Tag:= ctTabelas;
  qryContas.      Tag:= ctTabelas;

  qryConsultaFiliais.      Tag := ctConsultaFiliais;
  qryConsultaGrupoFiliais. Tag := ctConsultaGruposFiliais;
  qryConsultaFornecedores. Tag := ctConsultaFornecedores;
  qryConsultarContas.      Tag := ctConsultaContas;
  qryConsultaContaContabil.Tag := ctConsultaContaContabil;

end;


function TdtmCancelamentoQuitacao.ExisteConta(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultarContas, Campo, Codigo);
end;

function TdtmCancelamentoQuitacao.ExisteFiliais(Campo, Codigo: string): Boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, Campo, Codigo);
end;

function TdtmCancelamentoQuitacao.ExisteFornecedores(Campo, Codigo: String): Boolean;
const
  SQL = 'AND (to_ascii(%s,''latin1'') ilike to_ascii(''%s%s'',''latin1''))';
begin
  if Campo = 'NomeCidade' then
    Campo:= 'c.nome'
  else if Campo = 'tipocliente' then
    Campo:= 'v.tipo'
  else
    Campo:= 'v.' + Campo;
  qryConsultaFornecedores.MacroByName('Codigo').AsString := Format(SQL, [Campo, Codigo, '%']);
  qryConsultaFornecedores.Close;
  qryConsultaFornecedores.Open;
  Result := qryConsultaFornecedores.RecordCount > 0
end;

function TdtmCancelamentoQuitacao.ExisteGrupoFiliais(Campo, Codigo: String): Boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupoFiliais, Campo, Codigo);
end;

procedure TdtmCancelamentoQuitacao.FechaTabelaPesquisa(TipoPesquisa: TtecCancelamentoQuitacao);
begin
   case TipoPesquisa of
      cdpFILIAIS:      Fecha(ctConsultaFiliais);
      cdpGRUPOFILIAIS: Fecha(ctConsultaGruposFiliais);
      cdpFORNECEDORES: Fecha(ctConsultaFornecedores);
      cdpCONTA:        Fecha(ctConsultaContas);
      cdpCONTACREDITOPAGAMENTO : Fecha(ctConsultaContaContabil);
   end;
end;


function TdtmCancelamentoQuitacao.GetConsultaContas: TtecQuery;
begin
  Result:= qryConsultarContas;
end;

function TdtmCancelamentoQuitacao.GetConsultaFiliais: TtecQuery;
begin
  Result:= qryConsultaFiliais;
end;

function TdtmCancelamentoQuitacao.GetConsultaFornecedores: TtecQuery;
begin
  Result:= qryConsultaFornecedores;
end;

function TdtmCancelamentoQuitacao.GetConsultaGrupoFiliais: TtecQuery;
begin
  Result:= qryConsultaGrupoFiliais;
end;

function TdtmCancelamentoQuitacao.GetDataContabil: TDateTime;
begin
  Result:= ParSistema.DataContabil;
end;

function TdtmCancelamentoQuitacao.GetQtdeDuplicatas: Integer;
begin
  Result:= qryDuplicatas.RecordCount;
end;

function TdtmCancelamentoQuitacao.GetTipoPessoa: String;
begin
  if qryFornecedorestipo.AsString = '' then
       Result:= 'F'
  else Result:= qryFornecedorestipo.AsString;
end;

function TdtmCancelamentoQuitacao.GetTotalDuplicatas: Real;
begin
  Result:= TotalizarValores[qryDuplicatas, qryDuplicatasvalorpagto, nil];
end;

procedure TdtmCancelamentoQuitacao.MarcarSelecionados(Marcando, Todos: Boolean);
var
  Pos: TBookmark;
  ChequeAnt,
  ContaAnt: Integer;
  vValorMarcar : Boolean;

  procedure AtualizarValores;
  begin
    if qryDuplicatasquitar.AsBoolean then begin
      FQtdeMarcados  := FQtdeMarcados + 1;
      FTotalMarcados := FTotalMarcados + qryDuplicatasvalorpagto.AsCurrency;
    end
    else begin
      FQtdeMarcados  := FQtdeMarcados - 1;
      FTotalMarcados := FTotalMarcados - qryDuplicatasvalorpagto.AsCurrency;
    end;
  end;

    procedure Marcar;
    begin
       qryDuplicatas.Edit;
       if not Todos then begin
         qryDuplicatasquitar.AsBoolean:= vValorMarcar; //not qryDuplicatasquitar.AsBoolean;
         AtualizarValores;
       end
       else begin
         if Marcando then begin
           if not qryDuplicatasquitar.AsBoolean then begin
             qryDuplicatasquitar.AsBoolean := True;
             AtualizarValores;
           end;
         end
         else begin
           if qryDuplicatasquitar.AsBoolean then begin
             qryDuplicatasquitar.AsBoolean:= False;
             AtualizarValores;
           end;
         end;
       end;
       qryDuplicatas.Post;
    end;

    procedure MarcarTodas;
    begin
       if qryMesmoCheque.RecordCount > 1 then
       begin
         if MensagemSimNaoOpcaoCancelar(format(ctCANCELAMENTOQUITACAOCHEQUENUMERO,[qryDuplicatasChequePagto.asstring]),'',False) = mrYes then
         begin
           qryMesmoCheque.First;
           while not qryMesmoCheque.Eof do
           begin
              if qryDuplicatas.Locate('DocumentoPag; DataVencto; Numero',
                                       VarArrayOf([qryMesmoChequedocumentopag.AsInteger,
                                                   qryMesmoChequedatavencto.  AsDateTime,
                                                  qryMesmoChequenumero.      AsInteger]), [])
              then Marcar;
              qryMesmoCheque.Next;
           end;
         end
         else
         begin
           qryDuplicatas.GotoBookmark(Pos);
           Marcar;
         end;
       end
       else
       begin
         qryDuplicatas.GotoBookmark(Pos);
         Marcar;
       end;
    end;

   function PodeCancelarQuitacao: Boolean;
   begin
      Result:= True;
      ReFazConsulta(qryMesmoCheque, [0,1], [qryDuplicatasContaPagto. AsInteger,
                                            qryDuplicatasChequePagto.AsInteger]);
      qryMesmoCheque.First;
      while not qryMesmoCheque.Eof and Result do begin
         Result:= qryDuplicatas.Locate('DocumentoPag; DataVencto; Numero',
                                        VarArrayOf([qryMesmoChequedocumentopag.AsInteger,
                                                    qryMesmoChequedatavencto.  AsDateTime,
                                                    qryMesmoChequenumero.      AsInteger]),[]);
         qryMesmoCheque.Next;
      end;
   end;

   procedure ValidarRegistrosMarcar;
   begin
      if qryDuplicatasChequePagto.AsInteger = 0
      then Marcar
      else begin
         try
            Pos:= qryDuplicatas.GetBookmark;
            if PodeCancelarQuitacao then
               MarcarTodas
            else
            begin
              if not Todos or
                ((Todos and Marcando)                                 and
                 (ChequeAnt <> qryDuplicatasChequePagto.AsInteger)   and
                 (ContaAnt  <> qryDuplicatasContaPagto.AsInteger))    then
                 if MensagemSimNaoOpcaoCancelar(Format(ctCANCELAMENTOQUITACAONUMERO,[qryDuplicatasDocumentoPag.AsString,
                                                                    qryDuplicatasNumero.AsString,
                                                                    qryDuplicatasChequePagto.AsString]),'',false) = mrYES then
              MarcarTodas;
            end;
         finally
            qryDuplicatas.GotoBookmark(Pos);
            qryDuplicatas.FreeBookmark(Pos);
         end;
      end;
   end;

begin
  vValorMarcar := not qryDuplicatasQuitar.asboolean;
  if not qryDuplicatas.IsEmpty then
  begin
   if not Todos then
    ValidarRegistrosMarcar
   else
   begin
    ChequeAnt:= 0; ContaAnt:= 0;
    qryDuplicatas.First;
    while not qryDuplicatas.Eof do
    begin
      if Marcando then
      begin
        if not qryDuplicatasQuitar.AsBoolean then
        begin
          ValidarRegistrosMarcar;
          ChequeAnt:= qryDuplicatasChequePagto.AsInteger;
          ContaAnt := qryDuplicatasContaPagto.AsInteger;
        end;
        qryDuplicatas.Next;
      end
      else
      begin
        if qryDuplicatasQuitar.AsBoolean then
        begin
          ValidarRegistrosMarcar;
          ChequeAnt:= qryDuplicatasChequePagto.AsInteger;
          ContaAnt := qryDuplicatasContaPagto.AsInteger;
        end;
        qryDuplicatas.Next;
      end;
    end;
   end;
  end;
end;

procedure TdtmCancelamentoQuitacao.MontaDataPagamento;
const Data_1: String = ' AND t.DataPagto = ''';
      Data_2: String = ' AND t.DataPagto BETWEEN ''';
begin
   if not DataEmBranco(FPagtoInicial)
   then if DataEmBranco(FPagtoFinal)
        then qryDuplicatas.MacroByName('Pagamento').AsString:= Data_1 + FPagtoInicial + ''''
        else qryDuplicatas.MacroByName('Pagamento').AsString:= Data_2 + FPagtoInicial + ''' AND ''' + FPagtoFinal + ''''

   else if not DataEmBranco(FPagtoFinal)
        then qryDuplicatas.MacroByName('Pagamento').AsString:= Data_1 + FPagtoFinal + ''''
        else qryDuplicatas.MacroByName('Pagamento').AsString:= '';
end;


procedure TdtmCancelamentoQuitacao.qryDuplicatasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDuplicatas.Cancel;
end;

procedure TdtmCancelamentoQuitacao.qryFornecedoresBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryFornecedores.Params[0].AsString = '' then
    qryFornecedores.Params[0].AsString:= 'F';
end;

procedure TdtmCancelamentoQuitacao.Selecionar(TipoPesquisa: TtecCancelamentoQuitacao);
begin
   case TipoPesquisa of
      cdpFILIAIS:      ReFazConsulta(qryFilial,       [0],   [qryConsultaFiliaiscodigo.AsInteger]);
      cdpGRUPOFILIAIS: ReFazConsulta(qryGrupoFiliais, [0],   [qryConsultaGrupoFiliaiscodigo.AsInteger]);
      cdpFORNECEDORES: ReFazConsulta(qryFornecedores, [0,1], [qryConsultaFornecedorestipo.AsString,
                                                              qryConsultaFornecedorescodigo.AsInteger]);
      cdpCONTA:        ReFazConsulta(qryContas,       [0],   [qryConsultarContasConta.AsInteger]);
      cdpCONTACREDITOPAGAMENTO :
                       refazconsulta(qryProcuraCreditarPagamento, [0], [qryConsultaContaContabilcodigo.AsVariant]);
  end;
end;

function TdtmCancelamentoQuitacao.SelecionarDuplicatas: Boolean;
begin
   with qryDuplicatas do begin
      if Active then Close;

      case FOrdenacaoDuplicata[1] of
         'F': MacroByName('Ordenacao').AsString:= 'ORDER BY UPPER(TO_ASCII(nome,''LATIN1'')), t.DataPagto, t.ChequePagto, d.Fornecedor';
         'D': MacroByName('Ordenacao').AsString:= 'ORDER BY t.DataPagto, t.ChequePagto, d.Fornecedor';
      end;

      Open;   Result:= IsEmpty;
   end;      
end;


procedure TdtmCancelamentoQuitacao.SetConta(const Value: String);
begin
   if value <> ''
   then qryDuplicatas.MacroByName('Conta').AsString:= 'AND t.ContaPagto = ' + Value
   else qryDuplicatas.MacroByName('Conta').AsString:= '';
end;


procedure TdtmCancelamentoQuitacao.SetFilial(const Value: String);
begin
   if Value <> ''
   then qryDuplicatas.MacroByName('Filial').AsString:= 'AND d.FilialEmissao = ' + Value
   else qryDuplicatas.MacroByName('Filial').AsString:= '';
end;

procedure TdtmCancelamentoQuitacao.SetFornecedor(const Value: String);
begin
   if Value <> ''
   then qryDuplicatas.MacroByName('Fornecedor').AsString:= ' AND d.Fornecedor = ' + Value
   else qryDuplicatas.MacroByName('Fornecedor').AsString:= '';
end;

procedure TdtmCancelamentoQuitacao.SetGrupo(const Value: String);
begin
   if Value <> ''
   then qryDuplicatas.MacroByName('GrupoFilial').AsString:= ' AND d.FilialEmissao IN ' +
                                                            '(SELECT Filial FROM filiaisgruposfiliais WHERE Grupo = ' + Value
   else qryDuplicatas.MacroByName('GrupoFilial').AsString:= '';
end;

procedure TdtmCancelamentoQuitacao.SetPagtoFinal(const Value: String);
begin
   if not DataEmBranco(Value)
   then FPagtoFinal:= Value
   else FPagtoFinal:= '';
   MontaDataPagamento;
end;

procedure TdtmCancelamentoQuitacao.SetPagtoInicial(const Value: String);
begin
   if not DataEmBranco(Value)
   then FPagtoInicial := Value
   else FPagtoinicial := '';
   MontaDataPagamento;
end;

procedure TdtmCancelamentoQuitacao.ZerarConsultaDuplicatas;
begin
   qryDuplicatas.Close;
end;

procedure TdtmCancelamentoQuitacao.DataModuleCreate(Sender: TObject);
begin
   inherited;
   FOrdenacaoDuplicata := 'N';
end;


{procedure TdtmCancelamentoQuitacao.ZMonitor1MonitorEvent(Sql, Result: String);
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

end;}

function TdtmCancelamentoQuitacao.ExisteContaContabil(campo,
  codigo: String): Boolean;
begin
  if campo = 'descricaoedentada' then
    Result:= ExisteCodigo(qryConsultaContaContabil, 'descricao', codigo)
  else
    Result:= ExisteCodigo(qryConsultaContaContabil, campo, codigo);
end;

procedure TdtmCancelamentoQuitacao.qryContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if ParSistema.GerarContabilidade then
    refazconsulta(qryProcuraCreditarPagamento, [0], [qryContascontacontabil.AsVariant]);
end;

procedure TdtmCancelamentoQuitacao.SetContContabil(const Value: String);
begin
   if value <> ''
   then qryDuplicatas.MacroByName('ContaContabil').AsString:= 'AND t.Contacredito = ' + Value
   else qryDuplicatas.MacroByName('ContaContabil').AsString:= '';
end;

procedure TdtmCancelamentoQuitacao.qryDuplicatasBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not (UsuarioLogin.Administrador or UsuarioLogin.Suporte) then
    qryDuplicatas.MacroByName('Administrador').AsString:= 'and not d.administrador';
end;

procedure TdtmCancelamentoQuitacao.DataModuleDestroy(Sender: TObject);
begin
  inherited;

  if assigned(Usuario) then
    Usuario.free;

    {
  if assigned(dtmContasPagar) then
  begin
    dtmContasPagar.free;
    dtmContasPagar := nil;
  end;
  }


end;

function TdtmCancelamentoQuitacao.getdtmContasPagar: TdtmContasPagar;
begin
  if not assigned(fdtmContasPagar) then
    fdtmContasPagar := TdtmContasPagar.Create(self);

  Result := fdtmContasPagar;
end;

end.procedure TdtmCancelamentoQuitacao.DataModuleDestroy(Sender: TObject);
begin
  inherited;

end;


