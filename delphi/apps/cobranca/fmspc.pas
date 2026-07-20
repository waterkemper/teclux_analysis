unit fmspc;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, cpnumero, DBCtrls, Mask,
  Grids, DBGrids, ComCtrls, Windows, DateUtils, dmBasico,
    // Terceiros
  ZQuery, ZPgSqlQuery,
    // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmrelatoriopadrao, frendereco, biblio,
  clusuario,
  // Tecsoft
  cpdata, cpquery, cpdbtext, cpdbfindcontrols, cptexto,
  cpdbdata, cpcpfcnpj, cpdocumento, cppagecontrol, cpdbgrid, ctconstantes,
  frcgcoucpf, cpdbradiogroup, clparametrossistema, ToolWin;

type
  TfrmSPC = class(TfrmRelatorioPadrao)
    pgcGeracaoSPC: TPageControl;
    tstGeracao: TTabSheet;
    tstGerenciarSPC: TTabSheet;
    sbnGerar: TSpeedButton;
    dbgSPC: TtecDBGrid;
    dbgParcelasSPC: TtecDBGrid;
    dbgSPCRemessa: TtecDBGrid;
    lblSPCTotal: TLabel;
    lblSPCMarcados: TLabel;
    dtxBloqueada: TtecDBText;
    dtxSituacao: TtecDBText;
    pgcInformacoes: TPageControl;
    tstDadosPessoais: TTabSheet;
    gbxFiliacao: TGroupBox;
    edtClientesMae: TDBEditTexto;
    edtClientesPai: TDBEditTexto;
    gbxNaturalidade: TGroupBox;
    dtxClientesNaturalEstado: TDBEditTexto;
    dtxNaturalCidadeCliente: TtecDBText;
    edtClientesNascto: TDBEditData;
    edtNomeConjuge: TDBEditTexto;
    tstEndereco: TTabSheet;
    fraEndereco1: TfraEndereco;
    fracgcoucpf1: Tfracgcoucpf;
    gbxIdentificacao: TGroupBox;
    DBEditDocumento1: TDBEditDocumento;
    rgpSexo: TtecDBRadioGroup;
    rbnMasculino: TtecRadioButton;
    rbnFeminino: TtecRadioButton;
    rbnEmpresa: TtecRadioButton;
    rgpClientesCivil: TtecDBRadioGroup;
    rbnCasado: TtecRadioButton;
    rbnSolteiro: TtecRadioButton;
    rbnDivorciado: TtecRadioButton;
    rbnViuvo: TtecRadioButton;
    rbnOutros: TtecRadioButton;
    DBEditTexto1: TDBEditTexto;
    pnlFilialCentralizadora: TPanel;
    pnlClientes: TPanel;
    gbxClientes: TGroupBox;
    sbnConsultaCliente: TSpeedButton;
    dtxClientes: TtecDBText;
    edfCliente: TtecDbEditFind;
    sbnConfirma: TSpeedButton;
    pnlConsulta: TPanel;
    gbxPeriodo: TGroupBox;
    edtdataInicial: TEditData;
    edtdataFinal: TEditData;
    pnlOperaco: TPanel;
    rgpOperacao: TRadioGroup;
    ckbReenviarRejeitados: TCheckBox;
    tstDadosSPC: TTabSheet;
    gbxContratos: TGroupBox;
    dtxcliente: TtecDBText;
    dtxTipoCliente: TtecDBText;
    dtxcodigocliente: TtecDBText;
    dtxTotalemAberto: TtecDBText;
    dtxAvalista: TtecDBText;
    dtxcodigoavalista: TtecDBText;
    gbxRetorno: TGroupBox;
    dtxMsgRetorno: TtecDBText;
    dtxDataCompra: TtecDBText;
    dtxDataVencto: TtecDBText;
    gbxRegistro: TGroupBox;
    dtxDataSPC: TtecDBText;
    dtxDataEmpresa: TtecDBText;
    pnlGerarRemessa: TPanel;
    dtxArquivoRemessa: TtecDBText;
    pnlProcessarRetorno: TPanel;
    gbxRetornoaProcessar: TGroupBox;
    dbgProcessarRetorno: TtecDBGrid;
    gbxRegistradoPor: TGroupBox;
    ckbRegistradoSPC: TCheckBox;
    ckbRegistradoEmpresa: TCheckBox;
    gbxTipodeData: TGroupBox;
    ckbTipoDataInclusao: TCheckBox;
    ckbTipoDataExclusao: TCheckBox;
    gbxSituacaoAtual: TGroupBox;
    ckbExcluidos: TCheckBox;
    ckbIncluidos: TCheckBox;
    gbxSemAviso: TGroupBox;
    edtSemAviso: TEditData;
    pnlFiliais: TPanel;
    gbxFiliais: TGroupBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    gbxGrupodeFiliais: TGroupBox;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    ckbReenviarUltimaRemessa: TCheckBox;
    rgpClienteAvalista: TtecDBRadioGroup;
    rbnCliente: TtecRadioButton;
    rbnAvalista: TtecRadioButton;
    lblOperacao: TLabel;
    lblAIntervalor: TLabel;
    gbxArquivoRemessa: TGroupBox;
    gbxDataEmpresa: TGroupBox;
    gbxDataSPC: TGroupBox;
    gbxCliente: TGroupBox;
    gbxAvalista: TGroupBox;
    gbxValorDebito: TGroupBox;
    gbxDataCompra: TGroupBox;
    gbxDataVencto: TGroupBox;
    gbxNomeMae: TGroupBox;
    gbxNomePai: TGroupBox;
    gbxConjuge: TGroupBox;
    gbxDocumento: TGroupBox;
    gbxOrgao: TGroupBox;
    gbxUFDocto: TGroupBox;
    gbxDataNascto: TGroupBox;
    gbxNrTotal: TGroupBox;
    gbxMarcadas: TGroupBox;
    procedure sbnConsultaClienteClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure fracgcoucpf1rgbTipoPessoaChange(Sender: TObject);
    procedure dbgSPCDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgSPCDblClick(Sender: TObject);
    procedure dbgSPCKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgpOperacaoClick(Sender: TObject);
    procedure pgcGeracaoSPCChange(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure rgpClienteAvalistaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbTipoDataExclusaoClick(Sender: TObject);
    procedure ckbRegistradoSPCClick(Sender: TObject);
    procedure ckbRegistradoEmpresaClick(Sender: TObject);
    procedure ckbTipoDataInclusaoClick(Sender: TObject);
    procedure edfClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSemAvisoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtdataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbIncluidosClick(Sender: TObject);
    procedure ckbExcluidosClick(Sender: TObject);
    procedure ckbReenviarUltimaRemessaClick(Sender: TObject);
  private
    { Private declarations }
    fRemessaGerada : Boolean;
    function  TituloPesquisa: String;
    function PesquisaHabilitada: Boolean;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
    procedure MarcarFilialBase(Habilitar: Boolean);
  protected
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure InternoImpressao; override;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function VerificaCamposGerarSPC: Boolean;
    procedure GerarInscricaoSPC;
    procedure GerarRetiradaSPC;
    procedure GerarRetiradaForcadaSPC;
    procedure CancelarRetiradaForcadaSPC;
    procedure GerarConsulta;
    procedure GerarRemessaSPC;
    procedure ConfirmarRetiradaForcadaSPC;
    procedure ConfirmarCancelamentoRetiradaForcadaSPC;
    function VerificarUsuario: Boolean;
    procedure HabilitarControles(ExibirMarcacao: Boolean);
  end;

var
  frmSPC: TfrmSPC;
  TipoPesquisa : TipoProcuraSPC;


implementation
{$R *.dfm}

uses dmspc;

{ TfrmSPC }

constructor TfrmSPC.Create(AOwner: TComponent);
begin
  dtmspc:= Tdtmspc.Create(Self);
  inherited;
  dtmspc.Abre(cttabelas);
  ObterLista(dtmspc.ListaFiliais, clbFiliais);
  ObterLista(dtmspc.ListaGruposFiliais, clbGrupodeFiliais);
  MarcarFilialBase(False);
  sbnImprimir.Enabled := False;
  pgcGeracaoSPC.ActivePageIndex := 0;
  edtsemAviso.Minimo := 0;
  edtSemAviso.Maximo := DaysBetween(now()+31 ,now());
  rgpOperacaoClick(self);
  fremessagerada := false;
end;

destructor TfrmSPC.Destroy;
begin
  dtmspc.Fecha(ctTabelas);
  inherited;
  frmSPC := nil;
end;

function TfrmSPC.ExisteInformacao(Parametro: Integer; NomeCampo: String;
  Value: Variant): Boolean;
begin
  result := false;
  with dtmspc do
    case TipoPesquisa of
      spcClientes : result := ExisteCliente(NomeCampo, Value);
    end;
end;

function TfrmSPC.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmspc do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result := 0;
end;

function TfrmSPC.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [spcClientes]) and CtrlOn;
  Result := Jan
end;

function TfrmSPC.TabelaDePesquisa: TZDataSet;
begin
  Result := inherited TabelaDePesquisa;
  with dtmspc do
  Case TipoPesquisa of
   spcClientes  : Result := ConsultaClientes;
  end;
end;

procedure TfrmSPC.sbnConsultaClienteClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfCliente, ctCLIENTES);
end;

function TfrmSPC.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfCliente.Focused then
      TipoPesquisa := spcClientes;
    Result:= True;
  end;
end;

function TfrmSPC.TituloPesquisa: String;
begin
  Case TipoPesquisa of
   spcClientes  :result := ctCLIENTES;
  end;
end;

procedure TfrmSPC.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if pgcGeracaoSPC.ActivePage = tstGeracao then
  begin
   dtmspc.MontarFiltroFiliais(clbFiliais);
   dtmspc.MontarFiltroGrupoFiliais(clbGrupodeFiliais);
   if VerificaCamposGerarSPC then
    case rgpOperacao.ItemIndex of
     0: GerarInscricaoSPC;
     1: GerarRetiradaSPC;
     2: GerarRetiradaForcadaSPC ;
     3: CancelarRetiradaForcadaSPC;
     4: GerarRemessaSPC;
     6: GerarConsulta;
    end;
  end
  else
  begin
   dtmspc.OperacaoSPC := rgpOperacao.itemindex;
   if not dtmspc.GerarConsultaSPC then
   begin
     MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
     pgcGeracaoSPC.ActivePageIndex := 0;
   end
   else
   begin
    if (rgpOperacao.ItemIndex = 2) or
       (rgpOperacao.ItemIndex = 3) or
       (rgpOperacao.ItemIndex = 4) then
      dtmSPC.MarcarSPCSelecionadas(true,True);
    AtualizarContadores(false);
   end;
  end;
end;

function TfrmSPC.VerificaCamposGerarSPC: Boolean;
begin
 result := false;
 case rgpOperacao.ItemIndex of
 0,1: result := True;
 2: begin
       fRemessaGerada := false;
       result :=(Trim(edfCliente.Text) <> '');
       if result then
       begin
         Result := OperadorTernario((Trim(edfCliente.Text) <> ''), edfCliente.Exist, false);
         if Result then
           result := edtSemAviso.DataValida;
           if result then
            result := not dataembranco(edtSemAviso.Text);
            if not result then
            begin
             MensagemAviso(ctPARAMETROSINEXISTENTES);
             edtSemAviso.SetFocus;
            end;
       end
       else
        MensagemAviso(ctCLIENTENAOINFORMADO);
    end;
 3: begin
       fRemessaGerada := false;
       result :=(Trim(edfCliente.Text) <> '');
       if result then
         Result := OperadorTernario((Trim(edfCliente.Text) <> ''), edfCliente.Exist, false)
       else
        MensagemAviso(ctCLIENTENAOINFORMADO);
      end;
 4: begin
     fRemessaGerada := false;
     result := True;
    end;
 5: result := True;
 6: begin
       result :=(Trim(edfCliente.Text) <> '');
       if result then
         Result := OperadorTernario((Trim(edfCliente.Text) <> ''), edfCliente.Exist, true)
       else Result := True;
       if Result then
         Result := (edtdataInicial.DataValida and edtDataFinal.DataValida);
       if Result then
       begin
        result := (not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
        if result then
        begin
          Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
          if not Result then
          begin
           MensagemAviso(ctDTINICIALMAIORDTFINAL);
           edtDataInicial.SetFocus;
          end;
        end
        else
        begin
          MensagemAviso(ctPARAMETROSINEXISTENTES);
          edtDataInicial.SetFocus;
        end;
       end;
    end;
 end;

 if Result then
 case rgpOperacao.ItemIndex of
 0,1,2,3,4: begin
           with dtmspc do
            if not RefazNumeroRemessa(ckbReenviarUltimaRemessa.Checked) then
            begin
              MensagemAviso(ctFILIALCOMREGISTROSPCNAOINFORMADA);
              result := false;
            end;
          end;
 end;
end;

procedure TfrmSPC.GerarInscricaoSPC;
begin
 if VerificarUsuario then
 begin
   with dtmspc do
   begin
    DataHoraGravacao := DateTimeToStr(now());
    ReenviarRejeitados := ckbReenviarRejeitados.Checked;
    if GerarSPC then
    begin
     HabilitarControles(False);
     pgcGeracaoSPC.ActivePage := tstGerenciarSPC;
     sbnGerar.Click;
     MensagemAviso(format(ctSUCESSOSPC,[ctINCLUSAO]));
    end
    else
     MensagemAviso(ctNAOEXISTEMREGISTROSPC);
   end;
 end;
end;

procedure TfrmSPC.GerarRetiradaSPC;
begin
 if VerificarUsuario then
 begin
   with dtmspc do
   begin
    DataHoraGravacao := DateTimeToStr(now());
    ReenviarRejeitados := ckbReenviarRejeitados.Checked;
    if GerarRetiradaSPC(false) then
    begin
     HabilitarControles(False);
     pgcGeracaoSPC.ActivePage := tstGerenciarSPC;
     sbnGerar.Click;
     MensagemAviso(format(ctSUCESSOSPC,[ctEXCLUSAO]));
    end
    else
     MensagemAviso(ctNAOEXISTEMREGISTROSPC);
   end;
 end;  
end;

procedure TfrmSPC.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmspc do
  begin
   if not SoMarcados then
    lblSPCTotal.Caption   := IntToStr(TotalRegistros);

   lblSPCMarcados.Caption := IntToStr(QtdeMarcados);

   sbnImprimir.Enabled := (QtdeMarcados <> 0) and
                          (rgpOperacao.ItemIndex = 4) and
                          fRemessaGerada;

   sbnConfirma.Enabled := (QtdeMarcados <> 0) and
                          (rgpOperacao.ItemIndex <> 0) and
                          (rgpOperacao.ItemIndex <> 1) and
                          (rgpOperacao.ItemIndex <> 6) and
                          not fRemessaGerada;
  end;
end;

procedure TfrmSPC.fracgcoucpf1rgbTipoPessoaChange(Sender: TObject);
begin
  inherited;
  if Assigned(fracgcoucpf1) then
    fracgcoucpf1.edtCPFCNPJ.Tipo:= dtmspc.TipoPessoa;
end;

procedure TfrmSPC.dbgSPCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then
    if dbgSPC.DataSource.DataSet.FieldByName('marcar').AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmSPC.dbgSPCDblClick(Sender: TObject);
begin
  inherited;
  if not fRemessaGerada then
  case rgpOperacao.ItemIndex of
  2 : if not dtmspc.ParcelaObsoleta then
       if VerificarUsuario then
        begin
         dtmspc.MarcarSPCSelecionadas(True, False);
         AtualizarContadores(True);
        end;
  3 : if not dtmspc.ParcelaVerificado then
       if VerificarUsuario then
        begin
         dtmspc.MarcarSPCSelecionadas(True, False);
         AtualizarContadores(True);
        end;
  4 : if dtmspc.SPCDataExclusao='' then
      begin
       if VerificarUsuario then
       begin
        dtmspc.MarcarSPCSelecionadas(True, False);
        AtualizarContadores(True);
       end;
      end
      else
       MensagemAviso(ctCLIENTESAINDOSPC);
  end;
end;

procedure TfrmSPC.dbgSPCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if sbnConfirma.Enabled then
  if Key = VK_SPACE then
    if Shift = [ssCtrl] then
    begin
      case rgpOperacao.ItemIndex of
      2 : if not dtmspc.ParcelaObsoleta then
           if VerificarUsuario then
             begin
              dtmspc.MarcarSPCSelecionadas(True, False);
              AtualizarContadores(True);
             end;
      3 : if not dtmspc.ParcelaVerificado then
           if VerificarUsuario then
             begin
              dtmspc.MarcarSPCSelecionadas(True, False);
              AtualizarContadores(True);
             end;
      4 : if dtmspc.SPCDataExclusao='' then
          begin
           if VerificarUsuario then
           begin
            dtmspc.MarcarSPCSelecionadas(True, False);
            AtualizarContadores(True);
           end;
          end
          else
           MensagemAviso(ctCLIENTESAINDOSPC);
      end;
    end;
end;

procedure TfrmSPC.rgpOperacaoClick(Sender: TObject);
begin
  inherited;
  ckbReenviarUltimaRemessa.Checked := false;
  pgcGeracaoSPC.ActivePageIndex := 0;
  pnlFilialCentralizadora.Visible := (rgpOperacao.ItemIndex = 0) or
                                     (rgpOperacao.ItemIndex = 1);
  pnlGerarRemessa.Visible := rgpOperacao.ItemIndex = 4;
  pnlProcessarRetorno.Visible := rgpOperacao.ItemIndex = 5;
  pnlConsulta.Visible := (rgpOperacao.ItemIndex = 6);
  pnlClientes.Visible := (rgpOperacao.ItemIndex = 2) or
                         (rgpOperacao.ItemIndex = 3) or
                         (rgpOperacao.ItemIndex = 6);
  gbxSemAviso.Visible := (rgpOperacao.ItemIndex = 2);
  sbnConfirma.Enabled := false;
  case rgpOperacao.ItemIndex of
   0,1,5: MarcarFilialBase(False);
   2,3 : begin
          MarcarFilialBase(False);
          dtmspc.RefazNumeroRemessa(ckbReenviarUltimaRemessa.Checked);
         end;
   4: dtmspc.RefazNumeroRemessa(ckbReenviarUltimaRemessa.Checked);
   6: MarcarFilialBase(True);
  end;
end;

procedure TfrmSPC.GerarRetiradaForcadaSPC;
begin
 with dtmspc do
 begin
  ClienteSPC := edfCliente.Text;
  LimiteAviso := edtSemAviso.Text;
  DataHoraGravacao := DateTimeToStr(now());
 end;
 HabilitarControles(True);
 pgcGeracaoSPC.ActivePage := tstGerenciarSPC;
 sbnGerar.Click;
end;

procedure TfrmSPC.GerarConsulta;
begin
 with dtmspc do
 begin
  RegistradoSPC := ckbRegistradoSPC.Checked;
  RegistradoEmpresa := ckbRegistradoEmpresa.Checked;
  TipoDataInclusao := ckbTipoDataInclusao.Checked;
  TipoDataExclusao := ckbTipoDataExclusao.Checked;
  DataInicial := edtdataInicial.Text;
  DataFinal := edtdataFinal.Text;
  SituacaoIncluidos := ckbIncluidos.Checked;
  SituacaoExcluidos := ckbExcluidos.Checked;
  ClienteSPC := edfCliente.Text;
 end;
 HabilitarControles(False);
 pgcGeracaoSPC.ActivePage := tstGerenciarSPC;
 sbnGerar.Click;
end;

procedure TfrmSPC.pgcGeracaoSPCChange(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled := (pgcGeracaoSPC.ActivePageIndex = 0);
  if (pgcGeracaoSPC.ActivePageIndex = 0) then
    sbnConfirma.Enabled := false;
end;

procedure TfrmSPC.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  case rgpOperacao.ItemIndex of
   2: ConfirmarRetiradaForcadaSPC;
   3: ConfirmarCancelamentoRetiradaForcadaSPC;
   4: if dtmspc.GerarRemessaSPC then
      begin
       sbnConfirma.Enabled := false;
       sbnImprimir.Enabled := True;
       fRemessaGerada := true;
       MensagemAviso(ctOPERACAOREALIZADACOMSUCESSO);
      end;
  end;
end;

procedure TfrmSPC.ConfirmarRetiradaForcadaSPC;
begin
  inherited;
  if VerificarUsuario then begin
    if MensagemConfirmacao(ctRETIRAROCLIENTEDOSPC)= smbOK then
    begin
      if dtmspc.RetirarClientedoSPC then
      begin
       AtualizarContadores(True);
       MensagemAviso(ctOPERACAOREALIZADACOMSUCESSO);
      end;
    end;
  end else begin
    MensagemAviso(Format(ctUSUARIONAOAUTORIZADO, [ctRETIRAROCLIENTEDOSPC]));
    if Assigned(ActiveControl) then
      ActiveControl.SetFocus
  end
end;

function TfrmSPC.VerificarUsuario: Boolean;
var
  UsuarioAut: TtecUsuarios;
begin
  if UsuarioLogin.Cobrador then
    Result := True
  else begin
    try
      UsuarioAut := dtmspc.ObterAutorizacao(taLOGIN,ctCOBRADOR,ctAUTORIZADO);
      try
        if Assigned(UsuarioAut) then
          Result := UsuarioAut.Cobrador
        else begin
          Result := False;
          MensagemAviso(Format(ctUSUARIOSEMCADASTRO, ['']))
        end
      finally
        if Assigned(UsuarioAut) then
          UsuarioAut.Free;
      end
    except
      Result := False
    end
  end;
end;

procedure TfrmSPC.CancelarRetiradaForcadaSPC;
begin
 with dtmspc do
  ClienteSPC := edfCliente.Text;
 HabilitarControles(True);
 pgcGeracaoSPC.ActivePage := tstGerenciarSPC;
 sbnGerar.Click;
end;

procedure TfrmSPC.ConfirmarCancelamentoRetiradaForcadaSPC;
begin
  if VerificarUsuario then begin
    if MensagemConfirmacao(ctCANCELARSAIDAFORCADA)= smbOK then
    begin
      if dtmspc.CancelarRetiradaClientedoSPC then
      begin
       AtualizarContadores(True);
       MensagemAviso(ctOPERACAOREALIZADACOMSUCESSO);
      end;
    end;
  end else begin
    MensagemAviso(Format(ctUSUARIONAOAUTORIZADO, [ctRETIRAROCLIENTEDOSPC]));
    if Assigned(ActiveControl) then
      ActiveControl.SetFocus
  end
end;

procedure TfrmSPC.rgpClienteAvalistaClick(Sender: TObject);
begin
  inherited;
  case rgpClienteAvalista.ItemIndex of
   0: dtmspc.TipoeAvalista := false;
   1: dtmspc.TipoeAvalista := true;
  end;
end;

procedure TfrmSPC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmspc.CancelarGravacao;
end;


procedure TfrmSPC.GerarRemessaSPC;
begin
 HabilitarControles(True);
 pgcGeracaoSPC.ActivePage := tstGerenciarSPC;
 sbnGerar.Click;
end;

procedure TfrmSPC.ckbTipoDataExclusaoClick(Sender: TObject);
begin
  inherited;
  if not ckbTipoDataExclusao.Checked  then
   ckbTipoDataInclusao.Checked := true;
end;

procedure TfrmSPC.ckbRegistradoSPCClick(Sender: TObject);
begin
  inherited;
  if not ckbRegistradoSPC.Checked then
   ckbRegistradoEmpresa.Checked := true;
end;

procedure TfrmSPC.ckbRegistradoEmpresaClick(Sender: TObject);
begin
  inherited;
  if not ckbRegistradoEmpresa.Checked then
   ckbRegistradoSPC.Checked := true;
end;

procedure TfrmSPC.ckbTipoDataInclusaoClick(Sender: TObject);
begin
  inherited;
  if not ckbTipoDataInclusao.Checked then
   ckbTipoDataExclusao.Checked := true;
end;

procedure TfrmSPC.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
       VK_F5: if not CtrlOn and sbnConfirma.Enabled then
                  sbnConfirma.click;
       VK_F6: if not CtrlOn then
                  sbnGerar.Click;
  end;
  inherited;
end;

procedure TfrmSPC.edfClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if TeclaEnterouReturn(Key) and (Shift = []) then
   if (rgpOperacao.ItemIndex = 3) then
    sbnGerar.Click;
end;

procedure TfrmSPC.HabilitarControles(ExibirMarcacao: Boolean);
begin
 dbgSPC.Columns[2].visible := ExibirMarcacao;
 gbxMarcadas.Visible:= ExibirMarcacao;
 gbxNrTotal. Visible:= ExibirMarcacao;
end;

procedure TfrmSPC.edtSemAvisoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if TeclaEnterouReturn(Key) and (Shift = []) then
    sbnGerar.Click;
end;

procedure TfrmSPC.edtdataFinalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if TeclaEnterouReturn(Key) and (Shift = []) then
    sbnGerar.Click;
end;

procedure TfrmSPC.InternoImpressao;
begin
  inherited;
  dtmspc.ImprimirRelatorio;
end;

procedure TfrmSPC.ObterLista(Origem: TStrings; Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure TfrmSPC.MarcarFilialBase(Habilitar: Boolean);
var
 I: integer;
begin
 if not parsistema.ControleSPCCentralizado then
 begin
   MarcarLista(clbGrupodeFiliais, False);
   if clbFiliais.items.Count <> 0 then
     for I := 0 to dtmspc.ListaFiliais.Count -1 do
      if (dtmspc.FilialBase = integer(dtmspc.ListaFiliais.Objects[I])) then
       clbFiliais.Checked[I] := True
      else
       clbFiliais.Checked[I] := False;

    clbFiliais.Enabled := habilitar;
    sbnMarcarFiliais.Enabled := habilitar;
    sbnDesmarcarFiliais.Enabled := habilitar;
    clbGrupodeFiliais.Enabled := habilitar;
    sbnmarcarGrupodeFiliais.Enabled := habilitar;
    sbnDesmarcarGrupodeFiliais.Enabled := habilitar;
 end;
end;

procedure TfrmSPC.ckbIncluidosClick(Sender: TObject);
begin
  inherited;
  if ckbIncluidos.Checked then
    ckbExcluidos.Checked := false;
end;

procedure TfrmSPC.ckbExcluidosClick(Sender: TObject);
begin
  inherited;
  if ckbExcluidos.Checked then
    ckbIncluidos.Checked := false;
end;

procedure TfrmSPC.ckbReenviarUltimaRemessaClick(Sender: TObject);
begin
  inherited;
  dtmspc.RefazNumeroRemessa(ckbReenviarUltimaRemessa.Checked);
end;

end.
