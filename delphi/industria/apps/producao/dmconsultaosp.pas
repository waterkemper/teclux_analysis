unit dmconsultaosp;

interface

uses
  SysUtils, Classes, dmbasico, DB, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmImprimeOsp, ZTransact, ctconstantes, Biblio, Controls,
  clparametrossistema;

const
  nOSP  = 1;
  nLote = 2;

type
  TdtmConsultaOSP = class(TdtmBasico)
    qryOsp: TtecQuery;
    qryOspnumero: TIntegerField;
    qryOspentrega: TDateField;
    qryOspsemanafabr: TFloatField;
    qryOspanofabr: TStringField;
    qryOspano: TStringField;
    qryOspprioridade: TIntegerField;
    qryOspobservacoes: TStringField;
    qryOspdadosmarcacao: TStringField;
    qryOspproduto: TLargeintField;
    qryOspdata: TDateField;
    qryOspcliente: TIntegerField;
    qryOspnomecliente: TStringField;
    qryOsppedidocliente: TStringField;
    qryOspquantidade: TFloatField;
    qryOspquantidade_anterior: TFloatField;
    qryOsppreco: TFloatField;
    qryOspprodutovisual: TStringField;
    qryOspcaracteristica: TLargeintField;
    qryOspcaracteristicavisual: TStringField;
    qryOsppartnumber: TStringField;
    qryOspproduto_cliente: TStringField;
    qryOspfluxograma: TIntegerField;
    qryOsploteproducao: TIntegerField;
    qryOspunidade: TStringField;
    qryOspapelido: TStringField;
    dsrOsp: TtecDataSource;
    qryProdutosCompostos: TtecQuery;
    dsrProdutosCompostos: TtecDataSource;
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto: TLargeintField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosfinalidade: TStringField;
    qryClientesProdutospn: TStringField;
    qryClientesProdutosorigem: TStringField;
    dsrClientesProdutos: TtecDataSource;
    qryFluxogramasOperacoes: TtecQuery;
    dsrFluxogramasOperacoes: TtecDataSource;
    qryOspqtdeentregue: TFloatField;
    qryOspsaldo: TFloatField;
    qryOsptotal: TFloatField;
    qryOspsemana: TStringField;
    qryOspjaimpresso: TBooleanField;
    qryOspimprimir: TBooleanField;
    qryOspnumerolote: TIntegerField;
    qryFluxogramasOperacoessequencia: TStringField;
    qryFluxogramasOperacoesc01: TStringField;
    qryFluxogramasOperacoesc02: TStringField;
    qryFluxogramasOperacoesc03: TStringField;
    qryFluxogramasOperacoesdescricao: TStringField;
    qryFluxogramasOperacoestipooperacao: TStringField;
    qryFluxogramasOperacoestempopadrao: TFloatField;
    qryFluxogramasOperacoessetup: TStringField;
    qryFluxogramasOperacoesplanocontrole: TStringField;
    qryProdutosCompostosquantidade: TFloatField;
    qryProdutosCompostosunidade: TStringField;
    qryProdutosCompostosdescricao: TStringField;
    qryFluxogramasOperacoesnome: TStringField;
    qryProdutosCompostoscodigovisual: TStringField;
    qryUpdateOSPLotes: TtecQuery;
    procedure qryOspAfterScroll(DataSet: TDataSet);
    procedure qryOspAfterOpen(DataSet: TDataSet);
    procedure qryOspCalcFields(DataSet: TDataSet);
    procedure ZMonitor1MonitorEvent(Sql, Result: String);
  private
    FNumeroOSPInicial: String;
    FNumeroOSPFinal: String;
    fSemanaEntrega: String;
    fSemanaentrada: String;
    fAnoEntrada: String;
    fAnoEntrega: String;
    fUltimaImpressoraSelecionada: String;
    procedure SetCliente(const Value: String);
    procedure SetAnoEntrada(const Value: String);
    procedure SetAnoEntrega(const Value: String);
    { Private declarations }
  protected
    procedure AtualizaTabelas;
    function MontarParametroOSP: String;
  public
    { Public declarations }
    ListaOSPLotes: array [1..2] of TStringList;
    ListaOSP: TStringList;

    procedure MarcarSelecionados  (Marcando, Todos: Boolean);
    procedure MarcarSoNaoImpressas(Marcando, Todos: Boolean);
    procedure ImprimirRelatorio{(Osp: TStringList)}; {overload;}
    function  GerarConsulta: Boolean;
    function  GerarListaOSP: Boolean;

   { procedure ImprimirRelatorio; overload;}

    property  SemanaEntrada : String read fSemanaentrada write fSemanaEntrada;
    property  AnoEntrada: String read fAnoEntrada write SetAnoEntrada;

    property  SemanaEntrega : String read fSemanaEntrega write fSemanaEntrega;
    property  AnoEntrega: String read fAnoEntrega write SetAnoEntrega;

    property  NumeroOSPInicial     : String read FNumeroOSPInicial write FNumeroOSPInicial;
    property  NumeroOSPFinal       : String read FNumeroOSPFinal write FNumeroOSPFinal;
    property  Cliente       : String write SetCliente;

    property UltimaImpressoraSelecionada: String read fUltimaImpressoraSelecionada write fUltimaImpressoraSelecionada;

  end;

var
  dtmConsultaOSP: TdtmConsultaOSP;

implementation

{$R *.dfm}

{ TdtmConsultaOsp }

function TdtmConsultaOsp.GerarConsulta: Boolean;
begin
  qryOsp.MacroByName('Numero').AsString:= MontarParametroOSP;
  if qryOsp.Active then
    qryOsp.Close;
  qryOsp.Open;
  Result:= qryOsp.IsEmpty;
end;

{
procedure TdtmConsultaOsp.ImprimirRelatorio;
var Pos: TBookmark;
    Osp: TStringList;
    Cont: Integer;
begin
  Pos:= qryOsp.GetBookmark;
  qryOsp.DisableControls;
  qryOsp.AfterScroll:= nil;
  qryOsp.First;
  Cont:= 0;
  Osp:= TStringList.Create;
  while Cont < QtdeMarcados do
  begin
    if qryOspimprimir.AsBoolean then
    begin
      Osp.Add(qryOspnumero.AsString);
      Inc(Cont);
    end;
    qryOsp.Next;
  end;
  qryOsp.EnableControls;
  qryOsp.AfterScroll:= qryOspAfterScroll;
  qryOsp.GotoBookmark(Pos);
  qryOsp.FreeBookmark(Pos);

  if Osp.Count > 0 then
    ImprimirRelatorio(OSP);
end;
}

procedure TdtmConsultaOsp.ImprimirRelatorio{(Osp: TStringList)};
var i: integer;
    vImpressoraOSP, vImpressoraSetupProcesso, vImpressoraControleProcesso : String;
    vImprimiu : Boolean;
    vListaOSPLotes: String;
begin
  vImprimiu := false;

  if not assigned(dtmImprimeOsp) then
    dtmImprimeOsp:= TdtmImprimeOsp.Create(Self);

  if GerarListaOSP then
  begin
    try

      if MensagemSimNaoOpcaoCancelar(Format(ctMENSAGEMIMPRIMIR,['a OSP']),'',false) = mryes then
      begin
        if ParSistema.NomeImpressoraOSP<> '' then
           vImpressoraOSP := ParSistema.NomeImpressoraOSP
        else
        if UltimaImpressoraSelecionada<>'' then
          vImpressoraOSP := UltimaImpressoraSelecionada
        else
        begin
//        vImpressoraOSP := SelecionarImpressora;
          UltimaImpressoraSelecionada := vImpressoraOSP;
        end;

        for i:=0 to ListaOSPLotes[nOSP].Count -1 do
        begin
          if dtmImprimeOsp.ImprimirOSP(strtoint(ListaOSPLotes[nOSP].Strings[I]),
                                    strtoint(ListaOSPLotes[nLote].Strings[I]), vImpressoraOSP) then
            vImprimiu := true
          else
            vImprimiu := false;

        end
      end;

      if dtmImprimeOsp.MensagemImpressao(ctSETUP) then
      begin

        if ParSistema.NomeImpressoraSetupProcesso<> '' then
           vImpressoraSetupProcesso := ParSistema.NomeImpressoraSetupProcesso
        else
        if UltimaImpressoraSelecionada<>'' then
          vImpressoraSetupProcesso := UltimaImpressoraSelecionada
        else
        begin
//        vImpressoraSetupProcesso := SelecionarImpressora;
          UltimaImpressoraSelecionada := vImpressoraSetupProcesso;
        end;


        for i:=0 to ListaOSP.Count -1 do
        begin
          if dtmImprimeOsp.ImpressaoSetup(strtoint(ListaOSP.Strings[I]), vImpressoraSetupProcesso) then
            vImprimiu := true
          else
            vImprimiu := false;
        end;

      end;

      if dtmImprimeOsp.MensagemImpressao(ctCONTROLEPROCESSO) then
      begin

        if ParSistema.NomeImpressoraControleProcesso<> '' then
           vImpressoraControleProcesso := ParSistema.NomeImpressoraControleProcesso
        else
        if UltimaImpressoraSelecionada<>'' then
          vImpressoraControleProcesso := UltimaImpressoraSelecionada
        else
        begin
//          vImpressoraControleProcesso := SelecionarImpressora;
          UltimaImpressoraSelecionada := vImpressoraControleProcesso;
        end;

        for i:=0 to ListaOSP.Count -1 do
        begin
          if dtmImprimeOsp.ImpressaoControleProcesso(strtoint(ListaOSP.Strings[I]), vImpressoraControleProcesso) then
            vImprimiu := true
          else
            vImprimiu := false;
        end;

      end;

    finally
      dtmImprimeOsp.Free;
      dtmImprimeOsp := nil;

      if vImprimiu then
      begin

        vListaOSPLotes := '';
        qryOsp.AfterScroll := nil;
        qryOsp.First;
        while not qryOSP.Eof do
        begin
          if qryOspimprimir.AsBoolean then
          begin
            qryOSP.edit;
            qryOSPjaimpresso.AsBoolean := true;
            qryOSP.post;
            vListaOSPLotes := vListaOSPLotes + '('+qryOspnumero.AsString+','+qryOspnumerolote.AsString+'), '
          end;
          qryOSP.next;
        end;

        if vListaOSPLotes<>'' then
          delete(vListaOSPLotes, Length(vListaOSPLotes)-1,2);

        qryUpdateOSPLotes.MacroByName('ListaOSPLote').AsString := vListaOSPLotes;
        qryUpdateOSPLotes.ExecSql;

        perpetrar([qryUpdateOSPLotes]);
        qryOsp.AfterScroll := qryOspAfterScroll;
      end;

    end;
  end
  else
  MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['OSP']));
end;

procedure TdtmConsultaOsp.MarcarSelecionados(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryOsp, qryOspimprimir, Marcando, Todos);
end;

procedure TdtmConsultaOsp.MarcarSoNaoImpressas(Marcando, Todos: Boolean);
begin
  MarcarRegistros(qryOsp, qryOSPImprimir, qryOSPJaImpresso, Marcando, Todos);
end;

procedure TdtmConsultaOsp.SetCliente(const Value: String);
begin
  if Value <> '' then
    qryOsp.MacroByName('Cliente').AsString:= 'and (osp.cliente = '+Value+')'
  else
    qryOsp.MacroByName('Cliente').AsString:= '';
end;



procedure TdtmConsultaOsp.qryOspAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaTabelas;
end;

procedure TdtmConsultaOsp.AtualizaTabelas;
begin
  ReFazConsulta(qryClientesProdutos,[0,1],[qryOspcliente.AsVariant, qryOspproduto.AsVariant]);
  ReFazConsulta(qryProdutosCompostos,[0], [qryOspproduto.AsVariant]);
  ReFazConsulta(qryFluxogramasOperacoes,[0], [qryOspfluxograma.AsVariant]);
end;

procedure TdtmConsultaOsp.qryOspAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AtualizaTabelas;
end;

procedure TdtmConsultaOsp.qryOspCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryOSPtotal.AsCurrency := qryOSPquantidade.AsCurrency * qryOSPpreco.AsCurrency;
  if not qryOSPqtdeentregue.IsNull then
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency -
                              qryOSPqtdeentregue.AsCurrency
  else
    qryOSPsaldo.AsCurrency := qryOSPquantidade.AsCurrency;
end;

function TdtmConsultaOsp.MontarParametroOSP: String;
begin
   if FNumeroOSPInicial <> ''
   then if FNumeroOSPFinal <> ''
        then Result:= 'AND (OSP.Numero >= ' + FNumeroOSPInicial + ' AND ' +
                           'OSP.Numero <= ' + FNumeroOSPFinal   + ')'

        else Result:= 'AND (OSP.Numero <= ' + FNumeroOSPInicial + ')'

   else if FNumeroOSPFinal <> ''
        then Result:= 'AND (OSP.Numero >= ' + FNumeroOSPInicial + ')'
        else Result:= '';
end;

procedure TdtmConsultaOsp.ZMonitor1MonitorEvent(Sql, Result: String);
var
 Listar : TStringList;
 Arquivo: String;
begin
  inherited;
  Listar := tStringlist.create;
  Arquivo:= 'c:\ConsultaOsp.sql';
  if fileexists(Arquivo) then
    Listar.loadfromfile(Arquivo);
  Listar.add('');
  Listar.add(sql);
  Listar.add(result);
  listar.savetofile(Arquivo);
  listar.free;
end;

function TdtmConsultaOsp.GerarListaOSP: Boolean;
begin
  ListaOSPLotes[nOSP] := TStringList.Create;
  ListaOSPLotes[nLote] := TStringList.Create;

  ListaOSP := TStringList.Create;
  ListaOSP.Duplicates := dupIgnore;
  Listaosp.Sorted := true;

  qryOsp.AfterScroll:= nil;
  qryOsp.DisableControls;
  qryOsp.First;
  while not qryOsp.Eof do
  begin
    if qryOspimprimir.AsBoolean then
    begin
      ListaOSPLotes[nOSP].Add(qryOspnumero.AsString);
      ListaOSPLotes[nLote].Add(qryOspnumerolote.AsString);

      ListaOSP.Add(qryOspnumero.AsString);
    end;
    qryOsp.Next;
  end;
  qryOsp.EnableControls;
  qryOsp.AfterScroll:= qryOspAfterScroll;
  Result:= ListaOSPLotes[nOSP].Count > 0;
end;

procedure TdtmConsultaOsp.SetAnoEntrada(const Value: String);
begin
  fAnoEntrada := Value;

  if (SemanaEntrada <> '0') and (AnoEntrada<>'0') then
    qryOsp.MacroByName('SemanaEntrada').AsString:= ' and (select extract(week from osp.data))= '+inttostr(strtoint(SemanaEntrada))+
                                                   ' and (select extract(year from osp.data))= '+AnoEntrada
  else
  if (AnoEntrada<>'0') then
    qryOsp.MacroByName('SemanaEntrada').AsString:= ' and (select extract(year from osp.data))= '+AnoEntrada
  else
    qryOsp.MacroByName('SemanaEntrada').AsString:= '';


end;

procedure TdtmConsultaOsp.SetAnoEntrega(const Value: String);
begin
  fAnoEntrega := Value;

  if (SemanaEntrega <> '0') and (AnoEntrega<>'0') then
    qryOsp.MacroByName('SemanaEntrega').AsString:= ' and osp.semana = ' + inttostr(strtoint(SemanaEntrega))+
                                                   ' and osp.ano = '+AnoEntrega
  else
  if (AnoEntrega<>'0') then
     qryOsp.MacroByName('SemanaEntrega').AsString:= ' and osp.ano = '+AnoEntrega
  else
     qryOsp.MacroByName('SemanaEntrega').AsString:= '';


end;

end.
