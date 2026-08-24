unit dmrelatoriochequesvencimentos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, DB,
  //Terceiros
  ZPgSqlQuery, FR_DSet, FR_DBSet, FR_Class,
  //Componentes
  cpdatasource, ZQuery, cpquery,
  //Biblio
  ctconstantes, biblio,
  //Repositorio
  dmbasico, dmtecsoft,
  clparametrossistema,
  fmpreviewpadrao, ZTransact;


type
  TdtmRelatorioChequesVencimentos = class(TdtmBasico)
    dsrFiliais: TtecDataSource;
    qryFiliais: TtecQuery;
    qryConsultaFiliais: TtecQuery;
    dsrGrupoFilial: TtecDataSource;
    qryGrupoFilial: TtecQuery;
    qryConsultaGrupoFilial: TtecQuery;
    qryGrupoFilialcodigo: TIntegerField;
    qryGrupoFilialdescricao: TStringField;
    qryConsultaGrupoFilialcodigo: TIntegerField;
    qryConsultaGrupoFilialdescricao: TStringField;
    qryFiliaiscodigo: TIntegerField;
    qryFiliaisnome: TStringField;
    qryConsultaFiliaiscodigo: TIntegerField;
    qryConsultaFiliaisnome: TStringField;
    dsrCheques: TtecDataSource;
    qryCheques: TtecQuery;
    frpRelatorioChequesAnalitico: TfrReport;
    fdsChequesAnalitico: TfrDBDataSet;
    qryChequesfilial: TIntegerField;
    qryChequesnomefilial: TStringField;
    qryChequesbanco: TStringField;
    qryChequesagencia: TStringField;
    qryChequesconta: TStringField;
    qryChequescheque: TStringField;
    qryChequesdata: TDateField;
    qryChequesvencto: TDateField;
    qryChequestitular: TStringField;
    qryChequesvalor: TFloatField;
    qryChequesprimeiradevolucao: TDateField;
    qryChequessegundadevolucao: TDateField;
    qryChequesnomecliente: TStringField;
    qryChequessaldo: TFloatField;
    frpRelatorioChequesSintetico: TfrReport;
    qryChequesobservacao: TStringField;
    qryChequesusuario: TIntegerField;
    qryChequesporCobrador: TtecQuery;
    dsrChequesporCobrador: TtecDataSource;
    frpChequesporCobrador: TfrReport;
    fdsChequesporCobrador: TfrDBDataSet;
    qryChequesporCobradorfilial: TIntegerField;
    qryChequesporCobradornomefilial: TStringField;
    qryChequesporCobradorbanco: TStringField;
    qryChequesporCobradoragencia: TStringField;
    qryChequesporCobradorconta: TStringField;
    qryChequesporCobradorcheque: TStringField;
    qryChequesporCobradordata: TDateField;
    qryChequesporCobradorvencto: TDateField;
    qryChequesporCobradortitular: TStringField;
    qryChequesporCobradorvalor: TFloatField;
    qryChequesporCobradorobservacao: TStringField;
    qryChequesporCobradorsaldo: TFloatField;
    qryChequesporCobradorprimeiradevolucao: TDateField;
    qryChequesporCobradorsegundadevolucao: TDateField;
    qryChequesporCobradornomecliente: TStringField;
    qryChequesporCobradorusuario: TIntegerField;
    qryChequesporCobradornomeusuario: TStringField;
    procedure frpRelatorioChequesAnaliticoBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpRelatorioChequesSinteticoBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure frpChequesporCobradorBeforePrint(Memo: TStringList;
      View: TfrView);
  private
    FCobrador: Integer;
    FCobradores: String;
    procedure SetCobrador(const Value: Integer);
    procedure SetCobradores(const Value: String);
    procedure SetOrdenarpor(const Value: String);
  protected
    FSituacaoCheque: String;
    FAgrupar: Integer;
    FListarObs: Boolean;
    FRelatorio: Integer;
    FParametroCabecalho: String;
    function  GetTabelaConsultaFilial: TtecQuery;
    procedure SetComResgate(const Value: Integer);
    function  GetTabelaConsultaGrupoFilial: TtecQuery;
    procedure SetConsiderar(const Value: Integer);
    procedure SetTipoCheque(const Value: Integer);
    procedure SetRemessa(const Value: Integer);
    procedure SetRelatorio(const Value: Integer);
    procedure setAgrupar(const Value: Integer);
    procedure setListarObs(const Value: Boolean);
  public
    procedure AtribuirFilial;
    constructor Create(AOwner: TComponent); override;
    function  ExisteFilial(campo, codigo: string): boolean;
    function  ExisteGrupoFilial(campo, codigo: string): boolean;
    procedure porFilial(Filial: String);
    procedure porGrupoFilial(GrupoFilial: String);

    procedure porPeriodo(Tipo: TtecTipoRelatorioCheque;
              DataInicio, DataFinal,
              InicioDevolucao, FinalDevolucao : String);

    procedure Situacao(Tipo: TtecTipoRelatorioCheque);
    procedure RefazConsultaTabelas(Tipo: TtecChequeConsultaFiliais);
    procedure ZerarCampos(Tipo: TtecChequeConsultaFiliais);
    procedure ImprimirRelatorio(Tipo: TtecTipoRelatorioCheque);
    property  TabelaConsultaFiliais         : TtecQuery read GetTabelaConsultaFilial;
    property  TabelaConsultaGrupoFilial     : TtecQuery read GetTabelaConsultaGrupoFilial;
    property  ParametroCabecalho: String read FParametroCabecalho write FParametroCabecalho;
    property  ComResgate: Integer write SetComResgate;
    property  Considerar: Integer write SetConsiderar;
    property  TipoCheque: Integer write SetTipoCheque;
    property  Remessa: Integer write SetRemessa;
    property  Ordenarpor: String write SetOrdenarpor; 
    property  Relatorio: Integer read FRelatorio write SetRelatorio;
    property  Agrupar: Integer read FAgrupar write setAgrupar;
    property  ListarObs: Boolean read FListarObs write setListarObs;
    property  SituacaoCheque: String read FSituacaoCheque write FSituacaoCheque;
    property  Cobrador: Integer read FCobrador write SetCobrador;
    property  Cobradores: String read FCobradores write SetCobradores;
    procedure CopiarMacros;
    function AbrirConsultas: Boolean;

//    procedure AfterConstruction; override;
  end;

var
  dtmRelatorioChequesVencimentos: TdtmRelatorioChequesVencimentos;

implementation

uses fmrelatoriochequesvencimentos;

{$R *.dfm}

{ TdtmChequesDevolvidos }

procedure TdtmRelatorioChequesVencimentos.AtribuirFilial;
begin
  qryFiliais.Edit;
  qryFiliaiscodigo.AsInteger:= qryConsultaFiliaisCodigo.AsInteger;
end;

constructor TdtmRelatorioChequesVencimentos.Create(AOwner: TComponent);
begin
  inherited;
  qryFiliais.tag               := ctChequesVencimentos;
  qryGrupoFilial.tag           := ctChequesVencimentos;
  qryConsultaFiliais.Tag       := ctChequesConsulta;
  qryConsultaGrupoFilial.Tag   := ctChequesConsulta;
  qryCheques.Tag               := ctChequesRelatorio;
end;

function TdtmRelatorioChequesVencimentos.ExisteFilial(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaFiliais, campo, codigo);
end;

function TdtmRelatorioChequesVencimentos.ExisteGrupoFilial(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryConsultaGrupoFilial, campo, codigo);
end;

function TdtmRelatorioChequesVencimentos.GetTabelaConsultaFilial: TtecQuery;
begin
  Result := qryConsultaFiliais
end;

function TdtmRelatorioChequesVencimentos.GetTabelaConsultaGrupoFilial: TtecQuery;
begin
  Result := qryConsultaGrupoFilial
end;

procedure TdtmRelatorioChequesVencimentos.ImprimirRelatorio(Tipo: TtecTipoRelatorioCheque);
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
begin
  frVariables['Razao']  := RazaoFilialBase;
  frVariables['Rua']    := RuaFilialBase;
  frVariables['Bairro'] := BairroFilialBase + ' - CEP: ' + CEPFilialBase;
  frVariables['Cidade'] := CidadeFilialBase + ' - ' + EstadoFilialBase;
  frVariables['Outras'] := FParametroCabecalho;

//  Listar := frmrelatoriochequesvencimentos.ckbListarObs.Checked;
  frVariables['ListarObs'] := ListarObs;

  case Tipo of
    rcVENCIMENTOS  : if FRelatorio = 0 then
                          frVariables['Titulo']:= 'RELACAO DE CHEQUES POR VENCIMENTO'
                     else frVariables['Titulo']:= 'SINTETICO POR VENCIMENTO';
    rcRECEBIMENTOS : if FRelatorio = 0 then
                          frVariables['Titulo']:= 'RELACAO DE CHEQUES RECEBIDOS'
                     else frVariables['Titulo']:= 'SINTETICO RECEBIDOS';
    rcDEVOLUCOES   : frVariables['Titulo']:= 'RELACAO DE CHEQUES DEVOLVIDOS';
    rcCANCELAMENTOS: frVariables['Titulo']:= 'RELACAO DE CHEQUES CANCELADOS';
    rcINUTILIZADOS: frVariables['Titulo']:= 'RELACAO DE CHEQUES INUTILIZADOS';

  end;
  if FRelatorio = 1 then begin
    if (FAgrupar = 1) then
         frVariables['Agrupar'] := 'EMISSAO'
    else frVariables['Agrupar'] := 'VENCTO';
  end;
//  frpRelatorioChequesAnalitico.DesignReport;

//  frpRelatorioChequesSintetico.DesignReport;
//  frpChequesAnalitico.DesignReport;
  frmPreview := TfrmPreviewPadrao.create(self);
  try
    Relatorio := frmPreview.frCompositeReport;
    frmPreview.frCompositeReport.Reports.Clear;
    case Cobrador of
    0: frmPreview.frCompositeReport.Reports.Add(frpChequesporCobrador);
    1,2: begin
          case FRelatorio of
            0: frmPreview.frCompositeReport.Reports.Add(frpRelatorioChequesAnalitico);
            1: frmPreview.frCompositeReport.Reports.Add(frpRelatorioChequesSintetico);
          end;
         end;
    end;
    Relatorio.Preview := frmPreview.frPreviewPadrao;
    Relatorio.ShowReport;
    frmPreview.ShowModal;
  finally
    frmPreview.Free
  end;
end;

procedure TdtmRelatorioChequesVencimentos.porFilial(Filial: String);
begin
  if (Trim(Filial) <> '') then begin
    qryCheques.macrobyname('Filial').asstring := 'and (h.Filial = ' + Trim(Filial) + ')';
    FParametroCabecalho:=FParametroCabecalho + ' Filial ' + Trim(Filial);
  end
  else qryCheques.macrobyname('Filial').asstring := '';
end;

procedure TdtmRelatorioChequesVencimentos.porGrupoFilial(GrupoFilial: String);
const
  SQL: String = 'and (h.filial in (Select fgf.filial From filiaisgruposfiliais fgf Where fgf.grupo = ';
begin
  if (Trim(GrupoFilial) <> '') then begin
    qryCheques.macrobyname('GrupoFilial').asstring := SQL + Trim(GrupoFilial) + '))';
    FParametroCabecalho:=FParametroCabecalho + ' Grupo filial ' + Trim(GrupoFilial);
  end
  else qryCheques.macrobyname('GrupoFilial').asstring    := '';
end;

procedure TdtmRelatorioChequesVencimentos.porPeriodo(Tipo: TtecTipoRelatorioCheque;
           DataInicio, DataFinal,
           InicioDevolucao, FinalDevolucao : String);

  function Data1: String;
  begin
    case Tipo of
      rcVENCIMENTOS, rcDEVOLUCOES  : Result:= ' and ((h.vencto = ';
      rcRECEBIMENTOS : Result:= ' and ((h.data = ';

{      rcDEVOLUCOES   : if ParSistema.ControlarSomente2Devolucao then
                            Result:= 'and ((h.segundadevolucao = '
                       else Result:= 'and ((h.primeiradevolucao = ' + QuotedStr(DataInicio) + ') or ' +
                                     '     (h.segundadevolucao = ';}

      rcCANCELAMENTOS: Result:= ' and ((h.vencto = ';
      rcINUTILIZADOS: Result:= ' and ((h.vencto = ';

    end;
  end;

  function Data2: String;
  begin
    case Tipo of
      rcVENCIMENTOS, rcDEVOLUCOES  : Result:= ' and ((h.vencto between ';
      rcRECEBIMENTOS : Result:= ' and ((h.data between ';
{      rcDEVOLUCOES   : if ParSistema.ControlarSomente2Devolucao then
                            Result:= 'and ((h.segundadevolucao between '
                       else Result:= 'and ((h.primeiradevolucao between ' + QuotedStr(DataInicio) + ' and ' + QuotedStr(DataFinal) + ') or ' +
                                     '     (h.segundadevolucao  between ';}
      rcCANCELAMENTOS: Result:= ' and ((h.vencto between ';
      rcINUTILIZADOS: Result:= ' and ((h.vencto between ';

    end;
  end;

  function DataInicioDevolucao: String;
  begin
    case Tipo of
//      rcVENCIMENTOS  : Result:= 'and ((h.vencto =';
//      rcRECEBIMENTOS : Result:= 'and ((h.data =';

      rcDEVOLUCOES   : if ParSistema.ControlarSomente2Devolucao then
                            Result:= ' and ((h.segundadevolucao = '
                       else Result:= ' and ((h.primeiradevolucao = ' + QuotedStr(InicioDevolucao) + ') or ' +
                                     '     (h.segundadevolucao = ';

//      rcCANCELAMENTOS: Result:= 'and ((h.vencto =';
//      rcINUTILIZADOS: Result:= 'and ((h.vencto =';

    end;
  end;

  function DataFinalDevolucao: String;
  begin
    case Tipo of
//      rcVENCIMENTOS  : Result:= 'and ((h.vencto between ';
//      rcRECEBIMENTOS : Result:= 'and ((h.data between ';
      rcDEVOLUCOES   : if ParSistema.ControlarSomente2Devolucao then
                            Result:= ' and ((h.segundadevolucao between '
                       else Result:= ' and ((h.primeiradevolucao between ' + QuotedStr(InicioDevolucao) + ' and ' + QuotedStr(FinalDevolucao) + ') or ' +
                                     '     (h.segundadevolucao  between ';
//      rcCANCELAMENTOS: Result:= 'and ((h.vencto between ';
//      rcINUTILIZADOS: Result:= 'and ((h.vencto between ';

    end;
  end;




begin
{
  if Tipo <> rcDEVOLUCOES then
  begin
}

    if not DataEmBranco(DataInicio) then
    begin
      if DataEmBranco(DataFinal) then
      begin
        qryCheques.macrobyname('Periodo').asstring := Data1 + QuotedStr(DataInicio) + ')) ';
        FParametroCabecalho:=FParametroCabecalho + ' Entre ' + DataInicio+ ' e ' + DataInicio;
      end
      else
      begin
        qryCheques.macrobyname('Periodo').asstring := Data2 + QuotedStr(DataInicio) + ' and ' + QuotedStr(DataFinal) + ')) ';
        FParametroCabecalho:=FParametroCabecalho+' Entre '+DataInicio+' e '+DataFinal;
      end;
    end
    else
    begin
      if not DataEmBranco(DataFinal) then
      begin
        qryCheques.macrobyname('Periodo').asstring := Data1 + QuotedStr(DataFinal) + ')) ';
        FParametroCabecalho:=FParametroCabecalho+' Entre: '+DataFinal+' e '+DataFinal;
      end
      else
        qryCheques.macrobyname('Periodo').asstring  := '';
    end;
{
  end
  else
    qryCheques.macrobyname('Periodo').asstring  := '';
}
   qryCheques.macrobyname('PeriodoDevolucao').asstring  := '';

   if Tipo = rcDEVOLUCOES then
   begin
      if not DataEmBranco(InicioDevolucao) then
      begin
        if DataEmBranco(FinalDevolucao) then
        begin
          qryCheques.macrobyname('PeriodoDevolucao').asstring := DataInicioDevolucao + QuotedStr(InicioDevolucao) + ')) ';
          FParametroCabecalho:=FParametroCabecalho + ' Devolução Entre ' + InicioDevolucao + ' e ' + InicioDevolucao;
        end
        else
        begin
          qryCheques.macrobyname('PeriodoDevolucao').asstring := DataFinalDevolucao + QuotedStr(InicioDevolucao) + ' and ' + QuotedStr(FinalDevolucao) + ')) ';
          FParametroCabecalho:=FParametroCabecalho+' Devolução Entre '+InicioDevolucao+' e '+FinalDevolucao;
        end;
      end
      else
      begin
        if not DataEmBranco(FinalDevolucao) then
        begin
          qryCheques.macrobyname('PeriodoDevolucao').asstring := DataInicioDevolucao + QuotedStr(FinalDevolucao) + ')) ';
          FParametroCabecalho:=FParametroCabecalho+' Devolução Entre: '+FinalDevolucao+' e '+FinalDevolucao;
        end
        else
          qryCheques.macrobyname('PeriodoDevolucao').asstring  := '';
      end;

   end;


end;

procedure TdtmRelatorioChequesVencimentos.RefazConsultaTabelas(Tipo: TtecChequeConsultaFiliais);
begin
  case Tipo of
    ccfFILIAIS      : begin
                        ReFazConsulta(qryFiliais,[0],[qryConsultaFiliaisCodigo.AsInteger]);
                        ReFazConsulta(qryGrupoFilial,[],[]);
                      end;
    ccfGRUPOSFILIAIS: begin
                        ReFazConsulta(qryGrupoFilial,[0],[qryConsultaGrupoFilialcodigo.AsInteger]);
                        ReFazConsulta(qryFiliais,[],[]);
                      end;
  end;
end;

procedure TdtmRelatorioChequesVencimentos.Situacao(Tipo: TtecTipoRelatorioCheque);
begin
  case tipo of
    rcDEVOLUCOES    : qryCheques.macrobyname('Situacao').asstring     := 'and (h.situacao = ''D'')';

    rcCANCELAMENTOS :
    begin
      if (SituacaoCheque<>'') then
        qryCheques.macrobyname('Situacao').asstring     := 'and (h.situacao = ''C'') '+
                                                           'and (h.cancelado <= '+
                                                           quotedstr(FormatDateTime('yyyy-mm-dd',
                                                           strtodatetime(SituacaoCheque)))+')'
      else
        qryCheques.macrobyname('Situacao').asstring     := 'and (h.situacao = ''C'')';
    end;

    rcINUTILIZADOS : qryCheques.macrobyname('Situacao').asstring     := 'and (h.situacao = ''I'')';

  else
    qryCheques.macrobyname('Situacao').asstring     := 'and (h.situacao <> ''C'')';
  end;  
end;

procedure TdtmRelatorioChequesVencimentos.ZerarCampos(Tipo: TtecChequeConsultaFiliais);
begin
  case Tipo of
    ccfFILIAIS       : ReFazConsulta(qryGrupoFilial,[0],[0]);
    ccfGRUPOSFILIAIS : ReFazConsulta(qryFiliais,[0],[0]);
  end;
end;

procedure TdtmRelatorioChequesVencimentos.frpRelatorioChequesAnaliticoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioChequesAnalitico,View);
end;

procedure TdtmRelatorioChequesVencimentos.SetComResgate(const Value: Integer);
begin
  qryCheques.Params[0].AsString:= FSituacaoCheque;
  case value of
    0: begin
         qryCheques.macrobyname('Resgate').asstring :=
           'and (((Select count(*) From parcelascheques pc Where (pc.cheque = h.numero) and pc.datapagto is not null) = 0) or ' + #10#13 +
           '     ((Select min(pc.datapagto) From parcelascheques pc Where (pc.cheque = h.numero)) > ' + QuotedStr(FSituacaoCheque) + '))';
         FParametroCabecalho:= FParametroCabecalho + ' Nao listar resgate';
       end;
    1: begin
         qryCheques.macrobyname('Resgate').asstring :=
           'and (((h.segundadevolucao is not null) and (h.segundadevolucao <= ' + QuotedStr(FSituacaoCheque) + ') and ' + #10#13 +
           '      (((Select coalesce(sum(valorpagto),0) ' +
           '          From parcelascheques pc '            +
           '          Where (pc.cheque = h.numero) and (pc.resgate = ''2'')) < h.valor) and ' + #10#13 +
           '       ((Select coalesce(sum(valorpagto),0) From parcelascheques pc Where (pc.cheque = h.numero) and (pc.resgate = ''2'')) <>0))) or ' + #10#13 +

           '     ((h.primeiradevolucao is not null) and (h.primeiradevolucao <= ' + QuotedStr(FSituacaoCheque) + ') and ' + #10#13 +
           '      ((Select coalesce(sum(valorpagto),0) '  +
           '        From parcelascheques pc ' +
           '        Where (pc.cheque = h.numero) and (pc.resgate = ''1'')) < h.valor)))';
         FParametroCabecalho:= FParametroCabecalho + ' Resgate somente menor';
       end;
    2: qryCheques.macrobyname('Resgate').asstring := '';
  end;
end;

procedure TdtmRelatorioChequesVencimentos.SetConsiderar(const Value: Integer);
begin
  case value of
    0: begin
         qryCheques.macrobyname('Considerar').asstring := 'and (h.primeiradevolucao is not null and h.segundadevolucao is null)';
         FParametroCabecalho:= FParametroCabecalho + ' 1° devolução';
       end;
    1: begin
         qryCheques.macrobyname('Considerar').asstring := 'and (h.segundadevolucao is not null)';
         FParametroCabecalho:= FParametroCabecalho + ' 2° devolução';
       end;
    2: qryCheques.macrobyname('Considerar').asstring := '';
  end;
end;

procedure TdtmRelatorioChequesVencimentos.SetTipoCheque(const Value: Integer);
begin
  case value of
    0: qryCheques.macrobyname('TipoCheque').asstring  := 'Where ((h.data  = h.vencto) or (h.data <> h.vencto))';
    1: begin
         qryCheques.macrobyname('TipoCheque').asstring := 'Where (h.data  = h.vencto)';
         ParametroCabecalho:='Cheque a vista';
       end;
    2: begin
         qryCheques.macrobyname('TipoCheque').asstring := 'Where (h.data <> h.vencto)';
         ParametroCabecalho:='Cheque a prazo';
       end;
  end;
end;

procedure TdtmRelatorioChequesVencimentos.SetRemessa(const Value: Integer);
begin
  case Value of
    0: begin
         qryCheques.macrobyname('Remessa').asstring  := 'and (h.remessanumero is not null or h.remessanumero2 is not null)';
         ParametroCabecalho:= ParametroCabecalho +' com remessa';
       end;
    1: begin
         qryCheques.macrobyname('Remessa').asstring  := 'and (h.remessanumero is null or h.remessanumero2 is null)';
         ParametroCabecalho:= ParametroCabecalho +' sem remessa';
       end;
    2: qryCheques.macrobyname('Remessa').asstring  := '';
  end
end;

procedure TdtmRelatorioChequesVencimentos.SetRelatorio(const Value: Integer);
begin
  if FRelatorio <> Value then
    FRelatorio:= Value;
end;

procedure TdtmRelatorioChequesVencimentos.setAgrupar(const Value: Integer);
begin
  if FAgrupar <> Value then
    FAgrupar:= Value;
end;

procedure TdtmRelatorioChequesVencimentos.setListarObs(const Value: Boolean);
begin
  if FListarObs <> Value then
    FListarObs := Value;
end;


procedure TdtmRelatorioChequesVencimentos.SetCobrador(
  const Value: Integer);
begin
  FCobrador := Value;
  case value of
  //Com
  0: begin
       if cobradores <>'' then
         qryChequesporCobrador.macrobyname('ListaporCobrador').asstring :=
            'and h.usuario in ('+cobradores+')'
       else
         qryChequesporCobrador.macrobyname('ListaporCobrador').asstring := '';
     end;
  //Sem
  1: qryCheques.macrobyname('ListaporCobrador').asstring := 'and h.usuario is null';
  //Ambos
  2: begin
       if cobradores <> '' then
        qryCheques.macrobyname('ListaporCobrador').asstring :=
              'and (h.usuario in ('+cobradores+') or h.usuario is null)'
       else
        qryCheques.macrobyname('ListaporCobrador').asstring := '';
     end;   
  end;
end;

procedure TdtmRelatorioChequesVencimentos.SetCobradores(
  const Value: String);
begin
  FCobradores := Value;
end;

procedure TdtmRelatorioChequesVencimentos.CopiarMacros;
var i: integer;
begin
  for i:=0 to qrycheques.MacroCount-1 do
    qryChequesporCobrador.macros[i].asstring := qryCheques.macros[i].asstring;
end;

procedure TdtmRelatorioChequesVencimentos.SetOrdenarpor(
  const Value: String);
begin
  if FRelatorio = 0 then
  begin
    qryCheques.macrobyname('Ordenacao').asstring := 'Order by filial, '+value;
    qryChequesporCobrador.macrobyname('Ordenacao').asstring := 'Order by u.nome, usuario, '+value;
  end
  else begin
    case FAgrupar of
      0: qryCheques.macrobyname('Ordenacao').asstring := 'Order By filial, vencto, ' + value;
      1: qryCheques.macrobyname('Ordenacao').asstring := 'Order By filial, data, ' + value;
    end;
  end;
end;

function TdtmRelatorioChequesVencimentos.AbrirConsultas: Boolean;
begin
  case cobrador of
  0: begin
       refazconsulta(qrychequesporcobrador,[],[]);
       result := not qrychequesporcobrador.isempty;
     end;
  1,2: begin
        refazconsulta(qrycheques,[],[]);
        result := not qrycheques.isempty;
       end;
  end;
end;

procedure TdtmRelatorioChequesVencimentos.frpRelatorioChequesSinteticoBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRelatorioChequesSintetico,View);
end;

procedure TdtmRelatorioChequesVencimentos.frpChequesporCobradorBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpChequesporCobrador,View);
end;

end.
