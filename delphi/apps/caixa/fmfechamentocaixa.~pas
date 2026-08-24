unit fmfechamentocaixa;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, ComCtrls, Mask, DBCtrls, Windows, ActnList,
  //Terceiros
  ZQuery, db,
  //Componentes
  cpdbfindcontrols, cpnumero, cpdata, cppagecontrol, cpdbtext,
  //Biblio,
  ctConstantes, clusuario, clparametrossistema,
  //Repositorio
  fmrelatoriopadrao, fmconsultabasica, fmconsultaporcampo,
  //Projeto
  dmfechamentocaixa, Grids, DBGrids, cpdbgrid,
  frconsulta, frconsultacodigo, frconsultacontabil, frconsultacodigocontabil,
  ToolWin, clecf;

type

  TfrmFechamentoCaixa = class(TfrmRelatorioPadrao)
    pgcFechamento: TtecPageControl;
    tstImpressao: TTabSheet;
    lblSaldoAnterior: TLabel;
    dtxSaldoAnterior: TtecDBText;
    lblSaldoAtual: TLabel;
    dtxSaldoAtual: TtecDBText;
    gbxFundoJanela: TGroupBox;
    edtDataFechamento: TEditData;
    gbxImpresao: TGroupBox;
    ckbCancelamentos: TCheckBox;
    ckbChequesAPrazo: TCheckBox;
    ckbChequesAVista: TCheckBox;
    ckbDepositos: TCheckBox;
    ckbDevolucoes: TCheckBox;
    ckbDocumentos: TCheckBox;
    ckbPerdas: TCheckBox;
    ckbRecebimentos: TCheckBox;
    ckbResgate: TCheckBox;
    ckbResumo: TCheckBox;
    ckbTransferencias: TCheckBox;
    dtxCaixa: TtecDBText;
    sbnProcurarCaixa: TSpeedButton;
    edfCodigoCaixa: TtecDbEditFind;
    gbxEntradas: TGroupBox;
    dtxDocumentoEntrada: TtecDBText;
    dtxTransferenciaEntrada: TtecDBText;
    dtxPrestacoes: TtecDBText;
    dtxResgateCheques: TtecDBText;
    lblDocumentosEntrada: TLabel;
    lblTransferenciaEntrada: TLabel;
    lblRecebimentos: TLabel;
    lblResgateCheques: TLabel;
    gbxSaidas: TGroupBox;
    lblDocumentosSaida: TLabel;
    dtxDocumentosSaida: TtecDBText;
    lblDepositos: TLabel;
    dtxDepositos: TtecDBText;
    lblDevolucoes: TLabel;
    dtxDevolucoes: TtecDBText;
    lblTransferenciaSaida: TLabel;
    dtxTransferenciaSaida: TtecDBText;
    dtxDuplicatasFornecedores: TtecDBText;
    lblDuplicatasFornecedores: TLabel;
    gbxOutros: TGroupBox;
    lblNroCancelamentos: TLabel;
    lblPerdas: TLabel;
    dtxNroCancelamentos: TtecDBText;
    dtxPerdas: TtecDBText;
    dtxChequesAVista: TtecDBText;
    lblChequeAVista: TLabel;
    dtxChequesPreDatados: TtecDBText;
    lblChequePreDatados: TLabel;
    dtxTotalEntradas: TtecDBText;
    dtxTotalSaidas: TtecDBText;
    ckbDuplicatas: TCheckBox;
    aclAbilitar: TActionList;
    actAbilitar: TAction;
    dtxJuros: TtecDBText;
    dtxDescontos: TtecDBText;
    lblJuros: TLabel;
    lblDescontos: TLabel;
    dtxCartao: TtecDBText;
    lblCartao: TLabel;
    chbDetalhes: TCheckBox;
    sbnVisualizar: TSpeedButton;
    dtxDevolucoesSaldoTroca: TtecDBText;
    lblDevolucoesSaldoTroca: TLabel;
    ckbDevolucoesSaldo: TCheckBox;
    tstEventos: TTabSheet;
    gbxDataFechamento: TGroupBox;
    gbxCaixa: TGroupBox;
    dbgEventos: TtecDBGrid;
    sbnSalvar: TSpeedButton;
    gbxTiposRecebimentos: TGroupBox;
    dbgTiposRecebimentos: TtecDBGrid;
    Label1: TLabel;
    dtxChequeNaoIdentificado: TtecDBText;
    gbxTotalSaidas: TGroupBox;
    gbxTotalEntradas: TGroupBox;
    sbnFecharCaixa: TSpeedButton;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    lblPIX: TLabel;
    dtxPIX: TtecDBText;
    lblAjustSldDevTroca: TLabel;
    dtxAjustSldDevTroca: TtecDBText;
    Label2: TLabel;
    dtxCartoes: TtecDBText;
    procedure edtDataFechamentoExit(Sender: TObject);
    procedure pgcFechamentoChange(Sender: TObject);
    procedure sbnProcurarCaixaClick(Sender: TObject);
    procedure sbnFecharCaixaClick(Sender: TObject);
    procedure actAbilitarUpdate(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure sbnVisualizarClick(Sender: TObject);
    procedure dbgEventosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfCodigoCaixaEnter(Sender: TObject);
    procedure edfCodigoCaixaExit(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);

  private
    FVisualizar : Boolean;
    FOntecClose: TtecProcedure;
    caixa: String;
    procedure AtribuirCamposFilial(Found: Boolean);

  Protected
//    ParSistema: TtecParametrosSistema;
    ConsultaEvento : TfraConsultaCodigoContabil;
    procedure ConsultarTotaisDeFechamento;
    procedure DoFechamentoCaixa;
    Function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure FecharCaixa;
    Function  InternoPesquisar(Titulo: String): Integer; Override;
    procedure InternoImpressao; Override;
    Function  JanelaPesquisa: TfrmConsultaBasica; Override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); Override;
    Function  TabelaDePesquisa: TZDataSet; override;
    procedure AcionaPesquisaGrade;
    procedure AtribuirDadosEvento(Found: Boolean);
    procedure EventosAfterPost(Sender: TObject);
    procedure EventosAfterOpen(Sender: TObject);
    procedure CondicoesEvento;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    property  OntecClose: TtecProcedure read FOntecClose write FOntecClose;
  end;

var
  frmFechamentoCaixa: TfrmFechamentoCaixa;

implementation

Uses
  //Biblio
  biblio,
  //Repositorio
  fmajuda, fmselecionarimpressoras,
  //Projeto
  fmautenticacoes, dmbasico;

var
  PrimeiraVezOpcoes: Boolean;
  DataUltimaConsulta: String;



{$R *.dfm}

procedure TfrmFechamentoCaixa.ConsultarTotaisDeFechamento;
begin
  if not CtrlOn Then Begin
    If Length(Trim(edtDataFechamento.text)) <> 10 Then begin
      dtmfechamentocaixa.Fecha(ctCaixaFechamento);
    end else Begin
      dtmfechamentocaixa.Fecha(ctCaixaFechamento);
      dtmfechamentocaixa.MontarFechamentoCaixa(edfCodigoCaixa.text,edtDataFechamento.text);
      dtmfechamentocaixa.Abre(ctCaixaFechamento);
    End;
    PrimeiraVezOpcoes:= True;
  End;
end;

constructor TfrmFechamentoCaixa.Create(AOwner: TComponent);
begin
  dtmfechamentocaixa := Tdtmfechamentocaixa.Create(Self);
  inherited;
//  pgcFechamento.ActivePage:= tstFechamento;
  dtmfechamentocaixa.SelecionarcaixaAtual;
  sbnFecharCaixa.Enabled := False;
  sbnImprimir.Enabled := False;
  PrimeiraVezOpcoes:= True;
  FVisualizar := False;
  sbnVisualizar.Visible := ParSistema.VisualizarFEchamentoCaixa;
  if not sbnVisualizar.Visible then
  begin
    bvlBotoes.Left := bvlBotoes.Left - sbnVisualizar.Width;
    sbnAjuda.Left  := sbnAjuda.Left - sbnVisualizar.Width;
  end;

  if not (UsuarioLogin.Administrador or UsuarioLogin.Suporte) then
    edtDataFechamento.Minimo := ParSistema.LimiteDiasFechamentoCaixa;

  edtDataFechamento.Text := DateTimeToStr(DataLocal);
  DataUltimaConsulta:=edtDataFechamento.Text;


  ConsultaEvento := TfraConsultaCodigoContabil.Create(self);
  ConsultaEvento.Name := 'fraConsultaEvento';
  ConsultaEvento.edfCodigo.MaxLength := 3;
  ConsultaEvento.edfCodigo.DataSource := dtmFechamentoCaixa.dsrEventos;
  ConsultaEvento.edfCodigo.DataField := 'evento';
  ConsultaEvento.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaEvento.edfCodigo.LookupSource := ConsultaEvento.dsrProcuraEventos;
  ConsultaEvento.edfCodigo.LookupField := 'codigo';
  ConsultaEvento.edfCodigo.LookupQueryParameter := 'codigo';
  ConsultaEvento.AbrirTabelaProcura := false;
  ConsultaEvento.OnFound := AtribuirDadosEvento;
  ConsultaEvento.CondicoesdaConsulta := CondicoesEvento;
  ConsultaEvento.TipoPesquisa := pesEVENTO;
  dtmFechamentoCaixa.EventosAfterPost := EventosAfterPost;
  dtmFechamentoCaixa.EventosAfterOpen := EventosAfterOpen;
  sbnSalvar.Enabled := false;
  edtDataFechamento.SetFocus();
  edtDataFechamento.selectall;
  pgcFechamento.ActivePageIndex := 0;

  fraConsultaFilial.OnFound := AtribuirCamposFilial;

  fraConsultaFilial.qryProcuraFiliais.parambyname('codigo').asInteger := filialbase;

  fraConsultaFilial.AbrirTipoPesquisa := True;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;




end;

destructor TfrmFechamentoCaixa.Destroy;
begin
  dtmfechamentocaixa:=nil;
  inherited;
  frmFechamentoCaixa := nil;
  if Assigned(OntecClose) then
    OntecClose;
end;

procedure TfrmFechamentoCaixa.DoFechamentoCaixa;
begin
  if Assigned(OnFechamentoCaixa) then
    OnFechamentoCaixa;

end;

procedure TfrmFechamentoCaixa.edtDataFechamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(edfCodigoCaixa.Text) = ''  then
    MensagemAviso(ctCAIXAFECHAMENTONAOPREENCHIDO)
  else
  if fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').isnull then
    MensagemAviso(ctFILIALFECHAMENTONAOPREENCHIDO)
  else
  if edtDataFechamento.Criticar(False) then
  begin
    if (edtDataFechamento.Text <> DataUltimaConsulta) then
      DataUltimaConsulta:=edtDataFechamento.Text;
    ConsultarTotaisDeFechamento;
  end;
end;

Function TfrmFechamentoCaixa.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmfechamentocaixa.ExisteCaixa(Nomecampo,Value);
End;

procedure TfrmFechamentoCaixa.FecharCaixa;
var
  frmAjuda: TForm;
  Imp: String;
  SelecionarImpressora: Boolean;
begin
  if dtmFechamentoCaixa.TransferenciaNaoConfirmada then
    MensagemAviso(ctCAIXATRANSFERENCIANAOCONFIRMADA)
  else if Trim(edfCodigoCaixa.Text) = ''  then
    MensagemAviso(ctCAIXAFECHAMENTONAOPREENCHIDO)
  else if DataEmBranco(edtDataFechamento.Text) then
    MensagemErro(ctDATAFECHAMENTOCAIXANAOPREENCHIDA)
  else if edfCodigoCaixa.Exist and edtDataFechamento.DataValida then
    if edfCodigoCaixa.Text = IntToStr(dtmfechamentocaixa.CodigoUsuario) then
    begin

      SelecionarImpressora:=(parsistema.NomeImpressoraFechamentoCaixa <> '') or not assigned(ECFPadrao);
      if SelecionarImpressora then
      begin;
          frmSelecionarImpressoras := TfrmSelecionarImpressoras.Create(frmSelecionarImpressoras, ' ');
          if frmSelecionarImpressoras.ShowModal = mrok then
             Imp := frmSelecionarImpressoras.NomeImpressora;
      end;
      try
          if dtmfechamentocaixa.Fecharcaixa(StrToDate(edtDataFechamento.Text), Imp) then
          begin
            sbnFecharCaixa.Enabled := dtmfechamentocaixa.CaixaABerto;
            DoFechamentoCaixa;
            frmAjuda := TfrmAutenticacoesCaixa.Referencia;
            if Assigned(frmAjuda) then
              frmAjuda.Free
          end
          else
            MensagemAviso(ctCAIXADATAABERTURAFECHAMENTODIFEREM);
      finally
        if SelecionarImpressora then
           frmSelecionarImpressoras.Free;
      end
    end else
      MensagemAviso(ctCAIXAOPERADORUSUARIODIFEREM)
end;

procedure TfrmFechamentoCaixa.InternoImpressao;
var
  Imp: String;
  Enter: char;
  vcontinuar : Boolean;
begin
  inherited;

  {
  edtDataFechamentoExit;
  edfCodigoCaixaEnter;
  edfCodigoCaixaExit;
  }

  ConsultarTotaisDeFechamento;


  vcontinuar := FVisualizar or assigned(ECFPadrao) or
       (parsistema.Emissor_de_NFC_e and (parsistema.NomeImpressoraFechamentoCaixa =
                                         parsistema.NomeImpressoraNFCe));



  if vcontinuar then
  begin

    if not FVisualizar then
    begin
      if {(parsistema.NomeImpressoraFechamentoCaixa <> '') or} not assigned(ECFPadrao) then
      begin
        frmSelecionarImpressoras := TfrmSelecionarImpressoras.Create(frmSelecionarImpressoras, 'NFCe');
        try
          if frmSelecionarImpressoras.ShowModal = mrok then
          begin
            Imp := frmSelecionarImpressoras.NomeImpressora;
            vcontinuar := True;
          end
          else
          begin
            vcontinuar := False;
            MensagemAviso(ctSELECIONARIMPRESSORA);
          end;
        finally
          frmSelecionarImpressoras.Free;
        end;
      end;
    end;

    dtmFechamentoCaixa.Visualizar := FVisualizar;

    //bug 2395
    if (edtDataFechamento.Text<>DataUltimaConsulta) then
    begin
  //    tstFechamento.SetFocus;
      edtDataFechamento.SetFocus;
    end;

    dtmFechamentoCaixa.ImprimirFechamento(edtDataFechamento.Text,
                                          ckbCancelamentos.Checked,
                                          ckbChequesAPrazo.Checked,
                                          ckbChequesAVista.Checked,
                                          ckbDepositos.Checked,
                                          ckbDevolucoes.Checked,
                                          ckbDevolucoesSaldo.Checked,
                                          ckbDocumentos.Checked,
                                          ckbDuplicatas.Checked,
                                          ckbPerdas.Checked,
                                          ckbRecebimentos.Checked,
                                          ckbResgate.Checked,
                                          ckbResumo.Checked,
                                          ckbTransferencias.Checked,
                                          chbDetalhes.Checked,
                                          Imp)
  end;

end;

Function TfrmFechamentoCaixa.InternoPesquisar(Titulo: String): Integer;
Begin
  if ActiveControl = edfCodigoCaixa then
  begin
    dtmfechamentocaixa.Abre(ctCaixaConsultaCaixas);
    Result:= Inherited InternoPesquisar(Titulo);
    If Result = mrOk Then
      dtmfechamentocaixa.Selecionar;
    dtmfechamentocaixa.Fecha(ctCaixaConsultaCaixas);
  end;
End;

Function TfrmFechamentoCaixa.JanelaPesquisa;
Begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
End;

procedure TfrmFechamentoCaixa.KeyDown(var Key: Word; Shift: TShiftState);
begin
  Inherited;
{  If CtrlOn and edfCodigoCaixa.Focused Then begin
    sbnProcurarCaixaClick(Self);
    CtrlOn:= False;
  end;}
  if (Key = VK_F8) and sbnFecharCaixa.Enabled then
    FecharCaixa;

  if (Key = VK_F5) and sbnSalvar.Enabled then
    dtmFechamentoCaixa.SalvarEventos;

end;

procedure TfrmFechamentoCaixa.pgcFechamentoChange(Sender: TObject);
begin
  inherited;
  if (pgcFechamento.ActivePage = tstImpressao) and PrimeiraVezOpcoes then begin
    PrimeiraVezOpcoes := False;
    try
      ckbCancelamentos.Checked := ParSistema.Cancelamentos;
      ckbChequesAPrazo.Checked := ParSistema.ChequePrazo;
      ckbChequesAVista.Checked := ParSistema.ChequeVista;
      ckbDepositos.Checked     := ParSistema.Depositos;
      ckbDevolucoes.Checked    := ParSistema.Devolucoes;
      ckbDocumentos.Checked    := ParSistema.Documentos;
      ckbDuplicatas.Checked    := ParSistema.Duplicatas;
      ckbPerdas.Checked        := ParSistema.Perdas;
      ckbRecebimentos.Checked  := ParSistema.Recebimentos;
      ckbResgate.Checked       := ParSistema.ResgateDeCheques;
      ckbResumo.Checked        := ParSistema.Resumo;
      ckbTransferencias.Checked:= ParSistema.Transferencias;
    except
    end;
  end;
end;

procedure TfrmFechamentoCaixa.sbnFecharCaixaClick(Sender: TObject);
begin
  inherited;
  FecharCaixa
end;

procedure TfrmFechamentoCaixa.sbnProcurarCaixaClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCodigoCaixa, ctCAIXAS);
end;

Function TfrmFechamentoCaixa.TabelaDePesquisa: TZDataSet;
Begin
  Result:= dtmfechamentocaixa.TabelaConsultarCaixa
End;

procedure TfrmFechamentoCaixa.actAbilitarUpdate(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataFechamento.text) then
   if edtDataFechamento.Criticar(False) then
     if (Trim(edfCodigoCaixa.Text) <> '') then
     begin
      sbnImprimir.Enabled := True;
      sbnFecharCaixa.Enabled := (usuariologin.codigousuario = strtoint(edfCodigoCaixa.Text))
          and (usuariologin.DataAberturaCaixa = strtodate(edtDataFechamento.Text))
          and dtmFechamentoCaixa.CaixaAberto;
     end
     else
     begin
      sbnImprimir.Enabled := False;
      sbnFecharCaixa.Enabled := False;
     end;
  if ((UsuarioLogin.GerenteCaixa) or (UsuarioLogin.Administrador) or
      (UsuarioLogin.Suporte)) then
  begin
      edfCodigoCaixa.Enabled:=true;
      sbnProcurarCaixa.Enabled:=true;
  end
  else
  begin
      edfCodigoCaixa.Enabled:=false;
      sbnProcurarCaixa.Enabled:=false;
      //edtDataFechamento.SetFocus;
  end;
end;

procedure TfrmFechamentoCaixa.sbnImprimirClick(Sender: TObject);
begin
  FVisualizar := False;
  inherited;

end;

procedure TfrmFechamentoCaixa.sbnVisualizarClick(Sender: TObject);
begin
  FVisualizar := True;
  InternoImpressao;
  inherited;
end;

procedure TfrmFechamentoCaixa.dbgEventosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if UsuarioLogin.GerenteCaixa then
    if Shift = [ssCtrl] then
    begin
      case Key of
        VK_F9 : begin
                   ConsultaEvento.CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or ConsultaEvento.CtrlOn then
                     AcionaPesquisaGrade
                 end;
      end;
    end
    else
    begin
      case key of
        VK_Return :
        begin
          case dbgEventos.SelectedIndex of
          0 : begin
                if ConsultaEvento.edfCodigo.Exist then
                begin
                  AtribuirDadosEvento(true);
                  if dtmFechamentoCaixa.qryEventos.state = dsedit then
                    dtmFechamentoCaixa.qryEventos.Post;
                end;
              end;
          end;
        end;
      end;
    end;
end;

procedure TfrmFechamentoCaixa.AcionaPesquisaGrade;
begin
  ConsultaEvento.CtrlOn := True;
  dbgEventos.SetFocus;
  case ConsultaEvento.InternoPesquisar(ctEVENTO) of
    mrOk : begin
             dbgEventos.SelectedIndex :=  0;
             dbgEventos.SetFocus;
             if dtmFechamentoCaixa.qryEventos.state = dsedit then
               dtmFechamentoCaixa.qryEventos.Post;
           end;
    mrCancel : begin
                      dbgEventos.SelectedIndex :=  0;
                      dbgEventos.SetFocus;
                    end;
  end
end;

procedure TfrmFechamentoCaixa.AtribuirDadosEvento(Found: Boolean);
begin
  dtmFechamentoCaixa.qryEventosdescricao.AsString := ConsultaEvento.qryProcuraEventos.fieldbyname('descricao').AsString;
end;

procedure TfrmFechamentoCaixa.EventosAfterPost(Sender: TObject);
begin
  sbnSalvar.Enabled := true;
end;

procedure TfrmFechamentoCaixa.edfCodigoCaixaEnter(Sender: TObject);
begin
  inherited;
  caixa := edfCodigoCaixa.Text;
end;

procedure TfrmFechamentoCaixa.edfCodigoCaixaExit(Sender: TObject);
begin
  inherited;
  if caixa<>edfCodigoCaixa.Text then
    edtDataFechamentoExit(self);
end;

procedure TfrmFechamentoCaixa.EventosAfterOpen(Sender: TObject);
begin
  sbnSalvar.Enabled := false;
end;

procedure TfrmFechamentoCaixa.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  dtmFechamentoCaixa.SalvarEventos;
end;

procedure TfrmFechamentoCaixa.CondicoesEvento;
begin
  if dtmFechamentoCaixa.qryEventostipomovimentacao.AsString='S' then
  begin
    ConsultaEvento.qryProcuraEventos.MacroByName('condicoes').AsString :='and e.tipo=''A'' and e.tipomovimentacao=''S''';
    ConsultaEvento.qryConsultaEventos.MacroByName('condicoes').AsString :='and e.tipo=''A'' and e.tipomovimentacao=''S''';
  end
  else
  begin
    ConsultaEvento.qryProcuraEventos.MacroByName('condicoes').AsString :='and e.tipo=''A'' and e.tipomovimentacao=''E''';
    ConsultaEvento.qryConsultaEventos.MacroByName('condicoes').AsString :='and e.tipo=''A'' and e.tipomovimentacao=''E''';
  end;
end;

procedure TfrmFechamentoCaixa.AtribuirCamposFilial(Found: Boolean);
begin
   if dtmFechamentoCaixa.FilialFechamento <> fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asInteger then
   begin
     dtmFechamentoCaixa.FilialFechamento := fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asInteger;
     edtDataFechamentoExit(self);
   end

end;

end.
