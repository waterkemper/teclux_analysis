unit fmrelatoriorecebimentosporcobrador;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, ComCtrls, Mask, DBCtrls, Windows, DateUtils,
  Grids, DBGrids, ActnList,
  // Componentes
  cpdbfindcontrols, cpdbtext, cppagecontrol, cpnumero, cpdata, cpdbgrid,
  // Repositorio
  fmrelatoriopadrao, fmconsultabasica, fmconsultaporcampo, fmajudabt,
  // Constantes
  biblio, ctconstantes,
  // Terceiros
  zquery,
  // Projeto
  dmrelatoriorecebimentosporcobrador, cpdbradiogroup, DB, ZPgSqlQuery, cpquery;

type
  TfrmRelatorioRecebimentosPorCobrador = class(TfrmRelatorioPadrao)
    gbxChequesEmitidos: TGroupBox;
    gbxAgente: TGroupBox;
    sbnProcurarAgente: TSpeedButton;
    edfAgente: TtecDbEditFind;
    dtxAgente: TtecDBText;
    gbxPeriodo: TGroupBox;
    rgbOrdenacao: TtecDBRadioGroup;
    rbnDataPagamento: TtecRadioButton;
    rbnNomeCliente: TtecRadioButton;
    rbnValorPagamento: TtecRadioButton;
    gbxCobrador: TGroupBox;
    gbxFilial: TGroupBox;
    edfCobrador: TtecDbEditFind;
    sbnProcurarCobrador: TSpeedButton;
    dtxCobrador: TtecDBText;
    edfFilial: TtecDbEditFind;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    edtPagamentoInicial: TEditData;
    edtPagamentoFinal: TEditData;
    lblAPeriodo: TLabel;
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarAgenteClick(Sender: TObject);
    procedure edtPagamentoFinalEnter(Sender: TObject);
    procedure sbnProcurarCobradorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    dtmRecebimentosPorCobrador: TdtmRelatorioRecebimentosPorCobrador;
    procedure InternoImpressao; override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCamposSelecao: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmRelatorioRecebimentosPorCobrador: TfrmRelatorioRecebimentosPorCobrador;
  TipoPesquisa: TtecRecebimentosPorCobrador;

implementation

{$R *.dfm}

{ TfrmRelatorioChequesEmitidos }

constructor TfrmRelatorioRecebimentosPorCobrador.Create(AOwner: TComponent);
begin
  dtmRecebimentosPorCobrador:= TdtmRelatorioRecebimentosPorCobrador.Create(Self);
  inherited;
  edtPagamentoInicial.Text:= DateToStr(dtmRecebimentosPorCobrador.DataServidor-1);
  edtPagamentoFinal.Text  := DateToStr(dtmRecebimentosPorCobrador.DataServidor-1);
end;

destructor TfrmRelatorioRecebimentosPorCobrador.Destroy;
begin
  dtmRecebimentosPorCobrador:=nil;
  inherited;
  frmRelatorioRecebimentosPorCobrador:= nil;
end;

procedure TfrmRelatorioRecebimentosPorCobrador.edtPagamentoFinalEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtPagamentoInicial.Text) and edtPagamentoInicial.Criticar(false) then
    edtPagamentoFinal.Minimo:= DaysBetween(dtmRecebimentosPorCobrador.DataServidor,StrToDate(edtPagamentoInicial.Text));
end;

function TfrmRelatorioRecebimentosPorCobrador.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmRecebimentosPorCobrador do
    case TipoPesquisa of
           rpcFILIAIS: Result:= ExisteFiliais(NomeCampo, Value);
        rpcCOBRADORES: Result:= ExisteCobradores(NomeCampo, Value);
           rpcAGENTES: Result:= ExisteAgentes(NomeCampo, Value);
      else             Result:= False
    end;
end;

function TfrmRelatorioRecebimentosPorCobrador.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFilial then begin
        TipoPesquisa := rpcFILIAIS;
        Titulo       := 'Filiais';
      end
      else if ActiveControl = edfCobrador then begin
        TipoPesquisa := rpcCOBRADORES;
        Titulo       := 'Cobradores';
      end
      else if ActiveControl = edfAgente then begin
        TipoPesquisa := rpcAGENTES;
        Titulo       := 'Agentes';
      end;

      with dtmRecebimentosPorCobrador do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmRelatorioRecebimentosPorCobrador.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

procedure TfrmRelatorioRecebimentosPorCobrador.sbnProcurarAgenteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfAgente.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmRelatorioRecebimentosPorCobrador.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmRelatorioRecebimentosPorCobrador.sbnProcurarCobradorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCobrador.SetFocus;
  InternoPesquisar('');
end;

function TfrmRelatorioRecebimentosPorCobrador.TabelaDePesquisa: TZdataSet;
begin
  with dtmRecebimentosPorCobrador do
    case TipoPesquisa of
             rpcFILIAIS: Result:= ConsultaFiliais;
          rpcCOBRADORES: Result:= ConsultaCobradores;
             rpcAGENTES: Result:= ConsultaAgentes;
    else                 Result:= nil;
    end;
end;

function TfrmRelatorioRecebimentosPorCobrador.ValidarCamposSelecao: Boolean;
begin
  Result:= ((edtPagamentoInicial.Text <> '') or (edtPagamentoFinal.Text <> ''));
  if Result then
    Result:= edtPagamentoInicial.DataValida and edtPagamentoFinal.DataValida;
  if Result then
    Result := OperadorTernario((Trim(edfFilial.Text) <> ''),  edfFilial.Exist,   True)     and
              OperadorTernario((Trim(edfCobrador.Text) <> ''),edfCobrador.Exist, True) and
              OperadorTernario((Trim(edfAgente.Text) <> ''),  edfAgente.Exist,   True);
end;

procedure TfrmRelatorioRecebimentosPorCobrador.internoimpressao;
begin
  inherited;
   if ValidarCamposSelecao then
     with dtmRecebimentosPorCobrador do begin
       ParametroCabecalho := '';
       PeriodoInicial     := edtPagamentoInicial.Text;
       PeriodoFinal       := edtPagamentoFinal.Text;
       Filial             := edfFilial.Text;
       Cobrador           := edfCobrador.Text;
       Agente             := edfAgente.Text;
       Ordenacao          := rgbOrdenacao.ItemIndex;
       if GerarRelatorio then begin
         MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
         edtPagamentoInicial.SetFocus;
       end
       else
         ImprimirRelatorio;
     end;
end;

procedure TfrmRelatorioRecebimentosPorCobrador.FormShow(Sender: TObject);
begin
  inherited;
  edtPagamentoInicial.SetFocus;
end;

end.
