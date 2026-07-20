unit fmecf;

interface

uses
  SysUtils, Types, Classes, Graphics, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, ExtCtrls, Buttons, fmajudabt, Mask,
  cpdata, ComCtrls, biblio, ctconstantes, Controls, ACBrSped,
  cpdbradiogroup, frconsultacontabil, frconsultacodigocontabil, cpnumero,
  DBCtrls, cpdbtext, cpdbmemo, cptexto, cpdbdata, cpdbmesano, Windows,
  fmcadastropadrao, frconsulta, frconsultacodigo, cpdbfindcontrols, ToolWin, {Qete,} DB,
  dateutils, Grids, DBGrids, cpdbgrid, cppagecontrol, DBTabControl,
  dbcgrids, cpdblookupcombobox, DBMaplistCombobox, dmecf, fmImportarContasECF;

type
  Tfrmecf = class(TfrmCadastroPadrao)
    sbnGerarArquivo: TSpeedButton;
    mmoErro: TMemo;
    pnlTop: TPanel;
    gbxExercicio: TGroupBox;
    gbxArquivo: TGroupBox;
    dtxArquivo: TtecdBText;
    edtExercicio: TtecdBEditFind;
    gbxFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    gbxErro: TGroupBox;
    rgbtip_ecd: TtecDBRadioGroup;
    rbnNaoparticipante_de_SCP_como_socio_ostensivo: TtecRadioButton;
    rbnECD_da_SCP: TtecRadioButton;
    rbnParticipante_de_SCP_como_socio_ostensivo: TtecRadioButton;
    tecfBRadioGroup1: TtecDBRadioGroup;
    tecRadioButton5: TtecRadioButton;
    tecRadioButton6: TtecRadioButton;
    tecRadioButton7: TtecRadioButton;
    GroupBox1: TGroupBox;
    edtnum_rec: TDBEditTexto;
    rbnind_sit_ini_per: TtecDBRadioGroup;
    tecRadioButton1: TtecRadioButton;
    tecRadioButton2: TtecRadioButton;
    tecRadioButton3: TtecRadioButton;
    tecRadioButton4: TtecRadioButton;
    tecRadioButton11: TtecRadioButton;
    rbnSituacao: TtecDBRadioGroup;
    rbnCISAO: TtecRadioButton;
    rbnFUSAO: TtecRadioButton;
    rbnINCORPORACAO: TtecRadioButton;
    rbnEXTINSAO: TtecRadioButton;
    rbnNormal: TtecRadioButton;
    rbnTransformacao: TtecRadioButton;
    tecRadioButton12: TtecRadioButton;
    tecRadioButton13: TtecRadioButton;
    tecRadioButton14: TtecRadioButton;
    tecRadioButton15: TtecRadioButton;
    pgcECF: TtecPageControl;
    tstECF: TTabSheet;
    tstLucroReal: TTabSheet;
    pgcLucroReal: TtecPageControl;
    tstL210: TTabSheet;
    DBTabControlL030: TDBTabControl;
    dbgecf_l210: TtecDBGrid;
    dbgPlanodeContas: TtecDBGrid;
    pnlPlanodeContas: TPanel;
    Panel1: TPanel;
    Bevel1: TBevel;
    lblOrientacao: TStaticText;
    tstL300: TTabSheet;
    dbg_l300: TtecDBGrid;
    tstLALUR: TTabSheet;
    pgcLALUR: TtecPageControl;
    tstParte_A_DemoLucroLeal: TTabSheet;
    dbg_ecfM300: TtecDBGrid;
    tstParteB_LALUR: TTabSheet;
    pgcParte_A_DemoLucroLeal: TtecPageControl;
    tstParte_A_DemoLucroLeal_Lancamentos: TTabSheet;
    tst_Parte_A_DemoLucroLeal_Relacionamentos: TTabSheet;
    pgcParteB_LALUR: TtecPageControl;
    tst_m010: TTabSheet;
    tst_m410: TTabSheet;
    tst_m500: TTabSheet;
    zdbg_m010: TtecDBGrid;
    pnlecf_m010_bottom: TPanel;
    pnlecf_m010: TPanel;
    Splitter1: TSplitter;
    DBNavigator1: TDBNavigator;
    pnlECF_m410_bottom: TPanel;
    dbgECF_m410: TtecDBGrid;
    DBNavigator2: TDBNavigator;
    Label12: TLabel;
    pnlecf_m410: TPanel;
    lblTributacao: TLabel;
    gbx_m010_Cod_Cta_B: TGroupBox;
    gbx_m010_Dt_Lim_Lal: TGroupBox;
    gbx_m010_Vl_Saldo_Ini: TGroupBox;
    gbxl_m010_Cod_Lan_Orig: TGroupBox;
    gbx_m010_Cod_Tributo: TGroupBox;
    gbx_m010_Ind_Vl_Saldo_Ini: TGroupBox;
    gbx_m010_dt_ap_lal: TGroupBox;
    gbx_m010_Desc_Cta_Lal: TGroupBox;
    edt_m010_Cod_Cta_B: TDBEditTexto;
    edt_m010_desc_cta_lal: TDBEditTexto;
    edt_m010_dt_ap_lal: TDBEditData;
    dbl_m010_Cod_Lan_Orig: TTecDBLookupComboBox;
    edt_m010_Dt_Lim_Lal: TDBEditData;
    edt_m010_Vl_Saldo_Ini: TDBEditNumero;
    dbm_m010_Ind_Vl_Saldo_Ini: TDBMaplistCombobox;
    dbm_m010_Cod_Tributo: TDBMaplistCombobox;
    gbx_m010_CNPJ_Sit_Esp: TGroupBox;
    DBEditData1: TDBEditData;
    gbxM410_COD_CTA_B: TGroupBox;
    DBCBB: TTecDBLookupComboBox;
    GroupBox3: TGroupBox;
    tecDBText1: TtecDBText;
    gbxM410_COD_TRIBUTO: TGroupBox;
    DBMaplistCombobox1: TDBMaplistCombobox;
    gbxM410_VAL_LAN_LALB_PB: TGroupBox;
    gbxM410_IND_VAL_LAN_LALB_PB: TGroupBox;
    DBEditNumero2: TDBEditNumero;
    DBMaplistCombobox2: TDBMaplistCombobox;
    gbxContraPartida: TGroupBox;
    TecDBLookupComboBox1: TTecDBLookupComboBox;
    GroupBox7: TGroupBox;
    tecDBText2: TtecDBText;
    GroupBox5: TGroupBox;
    DBMaplistCombobox3: TDBMaplistCombobox;
    gbxM410_HIST_LAN_LALB: TGroupBox;
    tecDBMemo1: TtecDBMemo;
    Timer1: TTimer;
    tstLucroPresumido: TTabSheet;
    DBTabControlP030: TDBTabControl;
    pgcLucroPresumido: TtecPageControl;
    tstP200: TTabSheet;
    Splitter2: TSplitter;
    dbgP200: TtecDBGrid;
    tstP300: TTabSheet;
    dbgP300: TtecDBGrid;
    tstP400: TTabSheet;
    dbgP400: TtecDBGrid;
    tstP500: TTabSheet;
    dbgP500: TtecDBGrid;
    btnImportarContas: TSpeedButton;
    procedure sbnGerarArquivoClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure dbgecf_l210DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgPlanodeContasDblClick(Sender: TObject);
    procedure dbgPlanodeContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbAtualizarSaldoAoSelecionarExcluirCC_L210Click(
      Sender: TObject);
    procedure pgcLucroRealChange(Sender: TObject);
    procedure dbg_ecfM300DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pgcLALURChange(Sender: TObject);
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure pgcParte_A_DemoLucroLealChange(Sender: TObject);
    procedure pgcParteB_LALURChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pgcLucroPresumidoChange(Sender: TObject);
    procedure pgcECFChange(Sender: TObject);
    procedure dbgP200DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgP300DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgP400DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgP500DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnImportarContasClick(Sender: TObject);
  protected
    fraConsultaecf : TfraConsultaCodigoContabil;
    fraconsultacontacontabil : TfraConsultaCodigoContabil;
    procedure Abrirecf(Found: Boolean);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;

  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;
    procedure ACBrSPEDecfonError(Sender: TObject);
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosContaContabil(Found: Boolean);
    procedure DefinirLocalPainelPlanodeContas(Tab: TTabSheet; PosicaoLeft: integer; TipoPesquisaPlano: tpesPlano);

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    { Public declarations}
  end;

var
  frmecf: Tfrmecf;

implementation


{$R *.dfm}

procedure Tfrmecf.ACBrSPEDeCFonError(Sender: TObject);
begin
  mmoErro.Lines.Add(dtmecf.erro);
end;

constructor Tfrmecf.Create(AOwner: TComponent);
{
var
  I: Integer;
  MyDataLink: TDataLink;
  }

begin
  inherited;
  dtmecf := Tdtmecf.Create(self);
  DataSet := dtmecf.qryecf;
  dtmecf.ACBrSPEDECFonError := ACBrSPEDeCFonError;
  fraConsultaFilial.TipoPesquisa := pesFILIAIS;

  fraConsultaecf := TfraConsultaCodigoContabil.Create(self);
  fraConsultaecf.Name := 'fraConsultaecf';
  fraConsultaecf.edfCodigo.Operacao := opPESQUISA;
  fraConsultaecf.AbrirTabelaProcura := false;
  fraConsultaecf.TipoPesquisa := pesecf;
  fraConsultaecf.OnFound := Abrirecf;

  fraConsultaContaContabil := TfraConsultaCodigoContabil.Create(self);
  fraConsultaContaContabil.Name := 'fraConsultaContaContabil';
  fraConsultaContaContabil.TipoContaContabilCreditoSelecionavel := '';
  fraConsultaContaContabil.TipoContaContabilConsultaSelecionavel := '';
  fraConsultaContaContabil.edfCodigo.MaxLength := 6;
  fraConsultaContaContabil.edfCodigo.DataSource := dtmecf.dsrPlanoContas;
  fraConsultaContaContabil.edfCodigo.DataField := 'codigo';
  fraConsultaContaContabil.edfCodigo.Operacao := opATRIBUICAO;
  fraConsultaContaContabil.edfCodigo.LookupSource := fraConsultaContaContabil.dsrProcuraCreditar;
  fraConsultaContaContabil.edfCodigo.LookupField := 'codigo';
  fraConsultaContaContabil.edfCodigo.LookupQueryParameter := 'codigo';
  fraConsultaContaContabil.AbrirTabelaProcura := false;
  fraconsultacontaContabil.TipoContaContabilCreditoSelecionavel := 'A';
//  fraconsultacontaContabil.TipoContaContabilConsultaSelecionavel := 'A';
  fraConsultaContaContabil.TipoPesquisa := pesCONTACREDITO;
  fraConsultaContaContabil.OnFound := AtribuirDadosContaContabil;

  sbnGerarArquivo.Enabled := false;

  dbgPlanodeContas.ondelete := dtmecf.ExcluirListaContabil;

  pgcECF.activepageindex := 0;
  self.activecontrol := edtExercicio;
  pgcLucroReal.activepageindex := 0;

       {
  for I := 0 to TecDBLookupComboBox1.ControlCount - 1 do
    if TecDBLookupComboBox1.Controls[I] is TPopupDataList then
    begin
      MyDataLink := TDataLink(TecDBLookupComboBox1.Controls[I].Perform(CM_GETDATALINK, 0, 0));
      if MyDataLink <> nil then
        MyDataLink.DataSourceFixed := False;
        MyDataLink.DataSource := nil;
    end;
    }

// pnlPlanodeContas.parent := tstL210;
// pnlPlanodeContas.align := alright;



    

end;

procedure Tfrmecf.sbnGerarArquivoClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
  begin
     mmoErro.Clear;
     with dtmecf do
     begin
       if GerarArquivo(qryecfnomearquivo.AsString) then
         MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[qryecfnomearquivo.AsString]));
     end;
  end
end;

function Tfrmecf.ValidarCamposSelecao: Boolean;
begin
  result := not length(trim(edtExercicio.Text))<>4;
  if not result then
  begin
    MensagemAviso(ctPERIODOINVALIDO);
    edtExercicio.SetFocus;
  end;

  if result then
  begin
    if fraConsultaFilial.qryProcuraFiliais.fieldbyname('codigo').asString = '' then
    begin
      MensagemAviso('Informe a filial');
      fraConsultaFilial.edfcodigo.setFocus;
      result := false;
    end;
  end;

end;


function Tfrmecf.InternoExcluir: Boolean;
begin
  Result := inherited InternoExcluir;
  if Result then
    if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['a Escrita Contábil Fiscal'])) = smbOK then
      Result := dtmecf.Excluirecf
    else
      Result := False
end;

function Tfrmecf.InternoGravar: Boolean;
begin
  if ValidarCamposSelecao then
  begin
    inherited InternoGravar;
    Result := dtmecf.Gravarecf;

    if result then
      Timer1Timer(nil);
  end;
end;

function Tfrmecf.InternoIncluir: Boolean;
begin
  result := inherited internoincluir;
  if result then
    Result := dtmecf.Incluirecf;
end;


destructor Tfrmecf.Destroy;
begin
  inherited;
  dtmecf := nil;

  frmecf := nil;
end;


procedure Tfrmecf.Abrirecf(Found: Boolean);
begin
  edtExercicio.Text := fraConsultaecf.qryProcuraecfexercicio.AsString;
  fraConsultaFilial.edfCodigo.Text := fraConsultaecf.qryProcuraecffilial.AsString;
  dtmecf.
        refazconsulta(dtmecf.qryecf,[0,1],
             [fraConsultaecf.qryProcuraecfexercicio.AsString,
              fraConsultaecf.qryProcuraecffilial.AsString]);
end;

procedure Tfrmecf.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  fraConsultaecf.InternoPesquisar('ecf - Escrita Contábil Fiscal');
  self.SetFocus;
end;

procedure Tfrmecf.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key = VK_F9) then
    begin
      if sbnProcurar.Enabled then
      begin
        fraConsultaecf.InternoPesquisar('efd - Escrita Contábil Fiscal');
        self.SetFocus;
      end
    end
    else
    if (key = VK_F8) then
    begin
      if sbnGerarArquivo.Enabled then
        sbnGerarArquivoClick(nil);
    end;
  end;
end;

procedure Tfrmecf.AlterarEstadoBotoes;
begin
  inherited;

  sbnGerarArquivo.Enabled := sbnIncluir.Enabled and
                             not sbnSalvar.Enabled and
                             (dtmecf.qryecf.RecordCount<>0);
end;

procedure Tfrmecf.dbgecf_l210DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R')  or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CA') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CNA') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure Tfrmecf.dbgPlanodeContasDblClick(Sender: TObject);
begin
  inherited;
  acionarPesquisaGrade;
end;

procedure Tfrmecf.dbgPlanodeContasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if CtrlOn then
  begin
    case Key of
      VK_F9 : AcionarPesquisaGrade;
    end;
  end
  else
  begin
    case key of
      VK_Return :
      begin
        case dbgPlanodeContas.SelectedIndex of
        0,2 : begin
              if not fraconsultacontacontabil.edfCodigo.Exist then
                dtmecf.qryPlanoContascodigo.clear
              else
                AtribuirDadosContaContabil(true);

              dbgPlanodeContas.SelectedIndex := 0;
              dbgPlanodeContas.SetFocus;
            end;
        end;

        if dtmecf.qryplanocontas.State in [dsedit, dsinsert] then
           dtmecf.qryplanocontas.Post;
      end;
    end;
  end;
end;

procedure Tfrmecf.AcionarPesquisaGrade;
begin
  if (not dtmecf.qryecf_l210.readonly and (dtmecf.tipopesplano = ecf_l210)) or
     (not dtmecf.qryecf_m300.readonly and (dtmecf.tipopesplano = ecf_m300)) or
     (not dtmecf.qryecf_m010.readonly and (dtmecf.tipopesplano = ecf_m010)) or
     (not dtmecf.qryecf_p200.readonly and (dtmecf.tipopesplano = ecf_p200)) or
     (not dtmecf.qryecf_p300.readonly and (dtmecf.tipopesplano = ecf_p300)) or
     (not dtmecf.qryecf_p400.readonly and (dtmecf.tipopesplano = ecf_p400)) or
     (not dtmecf.qryecf_p500.readonly and (dtmecf.tipopesplano = ecf_p500)) then
  begin
    fraconsultacontacontabil.CtrlOn := True;
    dbgPlanodeContas.SetFocus;
    case dbgPlanodeContas.SelectedIndex of
      0,1: begin

               fraConsultaContaContabil.CtrlOn := True;
               fraConsultaContaContabil.InternoPesquisar('Conta Contábil');
               dbgPlanodeContas.SetFocus;
               dbgPlanodeContas.SelectedIndex :=  0;

           end;
    end;
  end;
end;

procedure Tfrmecf.AtribuirDadosContaContabil(Found: Boolean);
begin
  with dtmecf do
  begin
    if ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_l210listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_l210)) or
       ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_m300listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_m300)) or
       ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_m010listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_m010)) or
       ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_p200listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_p200)) or
       ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_p300listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_p300)) or
       ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_p400listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_p400)) or
       ((pos(fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING, qryecf_p500listacontascontabeis.asString+',')=0) and (tipopesplano = ecf_p500)) or
       (qryPlanoContasposicaosaldoaux.asString <> qryPlanoContasposicaosaldo.asString) then
    begin

      qryPlanoContas.edit;
      qryPlanoContascodigo.assTRING := fraconsultacontacontabil.qryProcuraCreditarcodigo.AssTRING;
      qryPlanoContasdescricao.asString := fraConsultaContaContabil.qryProcuraCreditardescricao.AsString;
      qryPlanoContas.post;

      case tipopesplano of
        ecf_l210 : GravarListaContabil_L210;
        ecf_m300 : GravarListaContabil_m300;
        ecf_m010 : GravarListaContabil_m010;
        ecf_p200 : GravarListaContabil_p200;
        ecf_p300 : GravarListaContabil_p300;
        ecf_p400 : GravarListaContabil_p400;
        ecf_p500 : GravarListaContabil_p500;
      end;

    end;
  end;
end;

procedure Tfrmecf.ckbAtualizarSaldoAoSelecionarExcluirCC_L210Click(
  Sender: TObject);
begin
  inherited;
//  dtmecf.AtualizarSaldoAoSelecionarExcluirCC_L210 := ckbAtualizarSaldoAoSelecionarExcluirCC_L210.checked;
end;

procedure Tfrmecf.pgcLucroRealChange(Sender: TObject);
begin
  inherited;
  if pgcLucroReal.activepage = tstLALUR then
    pgcLALURChange(nil)
  else
  if pgcLucroReal.activepage = tstL210 then
    DefinirLocalPainelPlanodeContas(tstL210, dbgecf_l210.width, ecf_l210);
end;

procedure Tfrmecf.dbg_ecfM300DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R')  or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CA') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CNA') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrmecf.pgcLALURChange(Sender: TObject);
begin
  inherited;
  if pgcLALUR.activepage = tstParte_A_DemoLucroLeal then
    pgcParte_A_DemoLucroLealChange(nil)
  else
  if pgcLALUR.activepage = tstParteB_LALUR then
    pgcParteB_LALURChange(nil);

end;

procedure Tfrmecf.Splitter1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  inherited;
//  Accept := (NewSize >= 100) and ((ClientWidth - (NewSize + Splitter1.Width)) >= 600);
end;

procedure Tfrmecf.pgcParte_A_DemoLucroLealChange(Sender: TObject);
begin
  inherited;
  if pgcParte_A_DemoLucroLeal.activepage = tstParte_A_DemoLucroLeal_Lancamentos then
    DefinirLocalPainelPlanodeContas(tstParte_A_DemoLucroLeal_Lancamentos, dbg_ecfM300.width, ecf_m300);
end;

procedure Tfrmecf.pgcParteB_LALURChange(Sender: TObject);
begin
  inherited;
  if pgcParteB_LALUR.activepage = tst_m010 then
    DefinirLocalPainelPlanodeContas(tst_m010, pnlecf_m010_bottom.width, ecf_m010)
  else
  if pgcParteB_LALUR.activepage = tst_m410 then
    DefinirLocalPainelPlanodeContas(tst_m410, pnlecf_m410_bottom.width, ecf_m010);
end;

procedure Tfrmecf.Timer1Timer(Sender: TObject);
begin
  inherited;

             {
1 - Lucro real
2 - Lucro real/arbitrado
3 - Lucro presumido/real
4 - Lucro presumido/real/arbitrado
5 - Lucro presumido
6 - Lucro arbitrado
7 - Lucro presumido/arbitrado
8 - Imune do IRPJ
9 - Isenta do IRPJ
              }
  
  tstLucroReal.tabvisible := (dtmecf.qryecf.recordcount > 0) and
                             (dtmecf.qryfiliais.fieldbyname('form_tribut').asinteger in [1,2,3,4]) ;

  tstLucroPresumido.tabvisible := (dtmecf.qryecf.recordcount > 0) and
                             (dtmecf.qryfiliais.fieldbyname('form_tribut').asinteger in [3,4,5,7]) ;




end;

procedure Tfrmecf.DefinirLocalPainelPlanodeContas(Tab: TTabSheet; PosicaoLeft: integer; TipoPesquisaPlano: tpesPlano);
begin
  Splitter1.parent := Tab;
  pnlPlanodeContas.parent := Tab;
  Splitter1.left := PosicaoLeft;
  dtmecf.tipopesplano := TipoPesquisaPlano;
end;

procedure Tfrmecf.pgcLucroPresumidoChange(Sender: TObject);
begin
  inherited;
  if pgcLucroPresumido.activepage = tstp200 then
    DefinirLocalPainelPlanodeContas(tstP200, dbgP200.width, ecf_p200)
  else
  if pgcLucroPresumido.activepage = tstp300 then
    DefinirLocalPainelPlanodeContas(tstP300, dbgP300.width, ecf_p300)
  else
  if pgcLucroPresumido.activepage = tstp400 then
    DefinirLocalPainelPlanodeContas(tstP400, dbgP400.width, ecf_p400)
  else
  if pgcLucroPresumido.activepage = tstp500 then
    DefinirLocalPainelPlanodeContas(tstP500, dbgP500.width, ecf_p500);
end;

procedure Tfrmecf.pgcECFChange(Sender: TObject);
begin
  inherited;
  if pgcECF.activepage = tstLucroReal then
    pgcLucroRealChange(nil)
//    DefinirLocalPainelPlanodeContas(tstL210, dbgecf_l210.width, ecf_l210)
  else
  if pgcECF.activepage = tstLucroPresumido then
    pgcLucroPresumidoChange(nil);
//    DefinirLocalPainelPlanodeContas(tstP200, dbgP200.width, ecf_p200);
end;

procedure Tfrmecf.dbgP200DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R')  or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CA') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CNA') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrmecf.dbgP300DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R')  or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CA') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CNA') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrmecf.dbgP400DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R')  or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CA') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CNA') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrmecf.dbgP500DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'R')  or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CA') or
     (TDBGrid(Sender).DataSource.DataSet.FieldByName('tipo').AsString = 'CNA') then
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrmecf.btnImportarContasClick(Sender: TObject);
begin
  inherited;
  if not assigned(frmImportarContasECF) then
    frmImportarContasECF := TfrmImportarContasECF.create(frmImportarContasECF);

  if frmImportarContasECF.showmodal = mrOK then
    dtmecf.ImportarContasContabeis(frmImportarContasECF.rbnOpcao.itemindex=1, frmImportarContasECF.edtAnoExercicio.value);

end;

end.
