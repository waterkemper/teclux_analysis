unit fmrelatorioduplicatas;

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
  dmrelatorioduplicatas, cpdbradiogroup, DB, ZPgSqlQuery, cpquery, ToolWin,
  CheckLst, frconsulta, frconsultacodigo, frconsultacontabil,
  frconsultacodigocontabil, frselecaoaleatoriaeventos,
  frselecaoaleatoriadocumentospag;

type
  TfrmRelatorioDuplicatas = class(TfrmRelatorioPadrao)
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxBanco: TGroupBox;
    sbnProcurarBanco: TSpeedButton;
    edfBanco: TtecDbEditFind;
    dtxBanco: TtecDBText;
    rgbTipoRelatorio: TRadioGroup;
    rgbPrevisoes: TtecDBRadioGroup;
    rbnComPrevisao: TtecRadioButton;
    rbnSemPrevisao: TtecRadioButton;
    rbnSoPrevisao: TtecRadioButton;
    rgbResumo: TtecDBRadioGroup;
    rbnComresumo: TtecRadioButton;
    rbnSemResumo: TtecRadioButton;
    rbnSoResumo: TtecRadioButton;
    pgcFornecedor: TtecPageControl;
    tstFornecedor: TTabSheet;
    sbnProcurarFornecedor: TSpeedButton;
    edfFornecedor: TtecDbEditFind;
    dtxFornecedor: TtecDBText;
    tstGrupoFornecedor: TTabSheet;
    sbnGrupoFornecedor: TSpeedButton;
    dtxGrupoFornecedor: TtecDBText;
    edfGrupoFornecedor: TtecDbEditFind;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparFornecedor: TCheckBox;
    rgbAutorizadas: TtecDBRadioGroup;
    ckbSim: TtecRadioButton;
    ckbNao: TtecRadioButton;
    ckbAmbos: TtecRadioButton;
    ckbAgruparData: TCheckBox;
    gbxTipoPagamento: TGroupBox;
    sbnProcurarTipoPagamento: TSpeedButton;
    edfTipoPagamento: TtecDbEditFind;
    dtxTipoPagamento: TtecDBText;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxTipoFornecedor: TGroupBox;
    ckbMontagem: TCheckBox;
    ckbProduto: TCheckBox;
    ckbTransporte: TCheckBox;
    stxRelatorio: TStaticText;
    lblA: TLabel;
    stxTipoDe: TStaticText;
    rgbAdiantamentos: TtecDBRadioGroup;
    rbnComAdiantamentos: TtecRadioButton;
    rbnSemAdiantamentos: TtecRadioButton;
    rbnSoAdiantamentos: TtecRadioButton;
    gbxDDA: TtecDBRadioGroup;
    rbnDDASim: TtecRadioButton;
    rbnDDANao: TtecRadioButton;
    rbnDDAAmbas: TtecRadioButton;
    tecPageControl1: TtecPageControl;
    TabSheet1: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    TabSheet2: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    gbxContas: TGroupBox;
    lbltraco: TLabel;
    fraConsultaContas: TfraConsultaCodigo;
    dtxAgencia: TtecDBText;
    dtxDigito: TtecDBText;
    fraSelecaoAleatoriaeventos1: TfraSelecaoAleatoriaeventos;
    pgcSelecaoAleatoria: TPageControl;
    tstEventos: TTabSheet;
    tstDocumentosPag: TTabSheet;
    fraSelecaoAleatoriadocumentospag1: TfraSelecaoAleatoriadocumentospag;
    ckbAgruparDocumentosPag: TCheckBox;
    gbxEmissao: TGroupBox;
    Label1: TLabel;
    edtDataInicialEmissao: TEditData;
    edtDataFinalEmissao: TEditData;
    procedure sbnProcurarBancoClick(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure sbnProcurarFornecedorClick(Sender: TObject);
    procedure pgcFornecedorChange(Sender: TObject);
    procedure sbnGrupoFornecedorClick(Sender: TObject);
    procedure rgbTipoRelatorioClick(Sender: TObject);
    procedure sbnProcurarTipoPagamentoClick(Sender: TObject);
    procedure FormLoaded(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure edfBancoFound(Found: Boolean);
  private
    procedure CondicoesdaConsultaEvento;
  protected
    dtmRelatorioDuplicatas: TdtmRelatorioDuplicatas;
    procedure internoimpressao; override;
    function  InternoPesquisar(Titulo: string): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    function  TabelaDePesquisa: TZdataSet; override;
    function  ValidarCamposSelecao: Boolean;
    procedure AtribuirDadosContas(Found: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmRelatorioDuplicatas: TfrmRelatorioDuplicatas;
  TipoPesquisa: TtecRelatorioDuplicatas;

implementation

{$R *.dfm}

{ TfrmRelatorioChequesEmitidos }

procedure TfrmRelatorioDuplicatas.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  with dtmRelatorioDuplicatas do
  begin
    case TipoPessoa[1] of
      'F': tstFornecedor.Caption:= 'Fornecedor';
      'C': tstFornecedor.Caption:= 'Cliente fornecedor';
      'L': tstFornecedor.Caption:= 'Filial fornecedor';
    end;
  end;

  rgbPrevisoes.    enabled := rgbTipoRelatorio.ItemIndex = 0;
  rgbAutorizadas.  Enabled := rgbTipoRelatorio.ItemIndex = 0;
  gbxTipoPagamento.Enabled := (rgbTipoRelatorio.ItemIndex = 1) or
                              (rgbTipoRelatorio.ItemIndex = 2) ;

end;

constructor TfrmRelatorioDuplicatas.Create(AOwner: TComponent);
begin
  dtmRelatorioDuplicatas:= TdtmRelatorioDuplicatas.Create(Self);
  inherited;
  dtmRelatorioDuplicatas.Abre(ctTabelas);
  edtDataInicial.Text:= DateToStr(dtmRelatorioDuplicatas.DataServidor);
  edtDataFinal.  Text:= DateToStr(dtmRelatorioDuplicatas.DataServidor);

  ObterLista(dtmRelatorioDuplicatas.ListaFiliais, clbFiliais);
  ObterLista(dtmRelatorioDuplicatas.ListaGruposFiliais, clbGrupodeFiliais);


  stxRelatorio.Height:= 10;
  stxTipoDe.   Height:= 10;

  fraConsultaContas.TipoPesquisa       := pesCONTAS;
  fraConsultaContas.edfCodigo.OnFound := AtribuirDadosContas;

  rgbTipoRelatorioClick(nil);

  fraSelecaoAleatoriaeventos1.fraSelecaoAleatoriaeventos.ConsultaSelecaoAleatoriaContabil.CondicoesdaConsulta :=
  CondicoesdaConsultaEvento;

end;

destructor TfrmRelatorioDuplicatas.Destroy;
begin
  dtmRelatorioDuplicatas:=nil;
  inherited;
  frmRelatorioDuplicatas:= nil;
end;

procedure TfrmRelatorioDuplicatas.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if not dataembranco(edtDataInicial.Text) and edtDataInicial.Criticar(false) then
    edtDataFinal.Minimo:= DaysBetween(dtmRelatorioDuplicatas.DataServidor,StrToDate(edtDataInicial.Text));
end;

function TfrmRelatorioDuplicatas.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
    with dtmRelatorioDuplicatas do
       case TipoPesquisa of
          rdpFILIAIS:           Result:= ExisteFiliais(NomeCampo, Value);
          rdpGRUPOFILIAIS:      Result:= ExisteGrupoFiliais(NomeCampo, Value);
          rdpFORNECEDORES:      Result:= ExisteFornecedores(NomeCampo, Value);
          rdpGRUPOFORNECEDORES: Result:= ExisteGrupoFornecedores(NomeCampo, Value);
          rdpBANCOS:            Result:= ExisteBanco(NomeCampo, Value);
          rdpTIPOSPAGAMENTOS:   Result:= ExisteTipoPagamento(NomeCampo, Value);
         else                   Result:= False;
      end;
end;

function TfrmRelatorioDuplicatas.InternoPesquisar(Titulo: string): Integer;
begin
  Result := mrNone;
  TipoPesquisa := rdpNone;
  if ActiveControl is TtecFindCustom then
  begin
    if CtrlOn then
    begin
      if ActiveControl = edfFornecedor then begin
        TipoPesquisa := rdpFORNECEDORES;
        Titulo       := 'Fornecedores';
      end
      else if ActiveControl = edfGrupoFornecedor then begin
        TipoPesquisa := rdpGRUPOFORNECEDORES;
        Titulo       := 'Grupo Fornecedores';
      end
      else if ActiveControl = edfBanco then begin
        TipoPesquisa := rdpBANCOS;
        Titulo       := 'Bancos';
      end
      else if ActiveControl = edfTipoPagamento then begin
        TipoPesquisa := rdpTIPOSPAGAMENTOS;
        Titulo       := 'Tipos de Pagamento';
      end;

      if TipoPesquisa <> rdpNone then
      begin
        with dtmRelatorioDuplicatas do
        begin
          AbreTabelaPesquisa(TipoPesquisa);
          Result:= inherited InternoPesquisar(Titulo);
          if Result = mrOK then
            Selecionar(TipoPesquisa);
          FechaTabelaPesquisa(TipoPesquisa);
        end;
      end;
    end;
  end;
end;

function TfrmRelatorioDuplicatas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = rdpFORNECEDORES then
    TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else begin
    TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
    TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
  end;
end;

procedure TfrmRelatorioDuplicatas.pgcFornecedorChange(Sender: TObject);
begin
  inherited;
  if pgcFornecedor.ActivePage = tstFornecedor then begin
    edfGrupoFornecedor.Clear;
    edfFornecedor.setFocus;
  end
  else begin
    edfFornecedor.Clear;
    edfGrupoFornecedor.setFocus;
  end;
end;

procedure TfrmRelatorioDuplicatas.rgbTipoRelatorioClick(Sender: TObject);
begin
  inherited;
  case rgbTipoRelatorio.ItemIndex of

   0 : begin
         gbxPeriodo.Caption:= ' VENCIMENTOS ';
         rbnSemAdiantamentos.Checked := true;
         rgbAdiantamentos.enabled := false;
       end;

   1 : begin
         gbxPeriodo.Caption:= ' LANÇAMENTOS ';
         rbnSemAdiantamentos.Checked := true;
         rbnComAdiantamentos.enabled := true;
       end;

   2 : begin
         gbxPeriodo.Caption:= ' PAGAMENTOS ';
         rgbAdiantamentos.enabled := true;
       end;
   end;

{
  if rgbTipoRelatorio.ItemIndex = 0 then
  begin
    rbnSemAdiantamentos.Checked := true;
    rgbAdiantamentos.enabled := false;
  end
  else
  begin
    rgbAdiantamentos.enabled := true;
  end;
}
  
end;


procedure TfrmRelatorioDuplicatas.sbnProcurarBancoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfBanco.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmRelatorioDuplicatas.sbnProcurarFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmRelatorioDuplicatas.sbnGrupoFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFornecedor.SetFocus;
  InternoPesquisar('');
end;


function TfrmRelatorioDuplicatas.TabelaDePesquisa: TZdataSet;
begin
   with dtmRelatorioDuplicatas do
      case TipoPesquisa of
         rdpFILIAIS:           Result:= ConsultaFiliais;
         rdpGRUPOFILIAIS:      Result:= ConsultaGrupoFiliais;
         rdpFORNECEDORES:      Result:= ConsultarFornecedores;
         rdpGRUPOFORNECEDORES: Result:= ConsultaGrupoFornecedores;
         rdpBANCOS:            Result:= ConsultaBancos;
         rdpTIPOSPAGAMENTOS:   Result:= ConsultaTiposPagamentos;
         else                  Result:= nil;
    end;
end;

function TfrmRelatorioDuplicatas.ValidarCamposSelecao: Boolean;
begin
  Result:= ((edtDataInicial.Text <> '') or (edtDataFinal.Text <> ''));
  if Result then
    Result:= edtDataInicial.DataValida and edtDataFinal.DataValida;

  if not result then
  begin
    Result:= ((edtDataInicialEmissao.Text <> '') or (edtDataFinalEmissao.Text <> ''));
    if Result then
      Result:= edtDataInicialEmissao.DataValida and edtDataFinalEmissao.DataValida;
  end;

  if Result then
    Result := OperadorTernario((Trim(edfBanco.          Text) <> ''), edfBanco.          Exist, True) and
              OperadorTernario((Trim(edfGrupoFornecedor.Text) <> ''), edfGrupoFornecedor.Exist, True) and
              OperadorTernario((Trim(edfTipoPagamento.  Text) <> ''), edfTipoPagamento.  Exist, True);
end;

procedure TfrmRelatorioDuplicatas.internoimpressao;
var
  SQLTipoFornecimento: String;
begin
   inherited;
   if not ValidarCamposSelecao then
     MensagemAviso('Verifique se os parâmetros atendem ao relatório solicitado.')
   else
   with dtmRelatorioDuplicatas do
   begin

      ParametroCabecalho := '';
      TipoRelatorio   := rgbTipoRelatorio.ItemIndex;
      Adiantamentos   := rgbAdiantamentos.ItemIndex;

      PeriodoInicialEmissao:= edtDataInicialEmissao.Text;
      PeriodoFinalEmissao  := edtDataFinalEmissao.Text;
      
      PeriodoInicial  := edtDataInicial.Text;
      PeriodoFinal    := edtDataFinal.Text;

      Fornecedor      := edfFornecedor.Text;
      GrupoFornecedor := edfGrupoFornecedor.Text;
      Banco           := edfBanco.Text;
      Conta           := fraConsultaContas.edfCodigo.text;   
      Previsao        := rgbPrevisoes.ItemIndex;
      Autorizadas     := rgbAutorizadas.ItemIndex;
      Evento          := fraSelecaoAleatoriaeventos1.ListaCondicional;
      ListaCondicionalDocumentosPag := fraSelecaoAleatoriaDocumentosPag1.ListaCondicional;
      TipoPagamento   := edfTipoPagamento.Text;
      Debito_Direto_Autorizado := gbxDDA.ItemIndex;

      MontarFiltroFiliais(clbFiliais);
      MontarFiltroGruposFiliais(clbGrupodeFiliais);

      FOrdenacaoDuplicatas := 'D';
      AgruparGrupoFilial := ckbAgruparGrupoFilial.Checked;
      AgruparFilial      := ckbAgruparFilial.Checked;
      AgruparFornecedor  := ckbAgruparFornecedor.Checked;
      AgruparData        := ckbAgruparData.Checked;
      AgruparDocumentosPag := ckbAgruparDocumentosPag.checked;

      if ckbAgruparFornecedor.Checked then
        FOrdenacaoDuplicatas:='N';
        
      DefineOrdenacao;
      Resumo:= rgbResumo.ItemIndex;

      SQLTipoFornecimento := '';
      if ckbMontagem.Checked then
        SQLTipoFornecimento := SQLTipoFornecimento + '''M'',';

      if ckbProduto.Checked then
        SQLTipoFornecimento := SQLTipoFornecimento + '''P'',';

      if ckbTransporte.Checked then
        SQLTipoFornecimento := SQLTipoFornecimento + '''T'',';

      TipoFornecimento := SQLTipoFornecimento;

      if GerarRelatorio then
      begin
         MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
         edtDataInicial.SetFocus;
      end
      else ImprimirRelatorio;
    end;
end;


procedure TfrmRelatorioDuplicatas.sbnProcurarTipoPagamentoClick(
  Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfTipoPagamento.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmRelatorioDuplicatas.FormLoaded(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmRelatorioDuplicatas.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,True);
  MarcarLista(clbGrupodeFiliais,False);

end;

procedure TfrmRelatorioDuplicatas.sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);

end;

procedure TfrmRelatorioDuplicatas.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,True);
  MarcarLista(clbFiliais,False);

end;

procedure TfrmRelatorioDuplicatas.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,False);

end;

procedure TfrmRelatorioDuplicatas.AtribuirDadosContas(Found: Boolean);
begin
  if fraConsultaContas.edfCodigo.text<>'' then
    edfBanco.text := fraConsultaContas.qryProcuraContas.fieldByName('NrBanco').asString;
end;

procedure TfrmRelatorioDuplicatas.edfBancoFound(Found: Boolean);
begin
  inherited;
  if found then
    if fraConsultaContas.qryProcuraContas.active then
      if edfbanco.text <> fraConsultaContas.qryProcuraContas.fieldByName('NrBanco').asString then
         fraConsultaContas.edfCodigo.clear;
end;

procedure TfrmRelatorioDuplicatas.CondicoesdaConsultaEvento;
begin
  fraSelecaoAleatoriaeventos1.fraSelecaoAleatoriaeventos.ConsultaSelecaoAleatoriaContabil.qryConsultaEventos.MacroByName('condicoes').asString :=
    ' and e.tipo = ''A'' and e.tipomovimentacao = ''S'' and e.Inativo IS NULL ';

  fraSelecaoAleatoriaeventos1.fraSelecaoAleatoriaeventos.ConsultaSelecaoAleatoriaContabil.qryProcuraEventos.MacroByName('condicoes').asString :=
    ' and e.tipo = ''A'' and e.tipomovimentacao = ''S'' and e.Inativo IS NULL ';

end;

end.
