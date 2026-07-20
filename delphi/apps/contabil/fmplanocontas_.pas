unit fmplanocontas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, cpnumero,
  cpdbdata, DBCtrls, cptexto, cpdbfindcontrols, cpdbradiogroup,
  DB, biblio, {Qete,} MaskUtils,
  //Componentes
  ctconstantes , clparametrossistema,

  //Terceiros
  ZQuery,

  //Repositorio
  fmconsultabasica, fmconsultaporcampo,

  //Projeto
  ZPgSqlQuery, cpquery, Grids, DBGrids, cpdbgrid, cpdocumento, cpcpfcnpj2,
  cpcpf, cpdata, cpdbmesano, cpmascara, cpeditioncontrolvalidation,
  frlistafiliais, Mask, cpdbtext, frconsulta, frconsultacodigo, ActnList,
  frconsultacontabil, frconsultacodigocontabil;


type
  TfrmPlanoContas = class(TfrmCadastroPadrao)
    sbnImprimir: TSpeedButton;
    pgcPlanoContas: TPageControl;
    tstCadastroPlanoContas: TTabSheet;
    tstImpressaoPlanoContas: TTabSheet;
    gbxCodigo: TGroupBox;
    edfCodigo: TtecDbEditFind;
    gbxClassificacao: TGroupBox;
    edtClassificacao: TDBEditmascara;
    gbxInativo: TGroupBox;
    edtInativo: TDBEditData;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
    rgpTipo: TtecDBRadioGroup;
    rbnAnalitica: TtecRadioButton;
    rbnSintetica: TtecRadioButton;
    gbxVinculacao: TGroupBox;
    dbgPlanoContasVinculados: TtecDBGrid;
    gbxRelatorio: TGroupBox;
    ckbAnalitico: TCheckBox;
    ckbSintetico: TCheckBox;
    ckbParaoDiario: TCheckBox;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    gbxFiltro: TGroupBox;
    ckbContaSelecionada: TCheckBox;
    ecvValida: TtecEditionControlValidation;
    gbxOpcoes: TGroupBox;
    ckbSoComMovtos: TCheckBox;
    ckbSoComSaldos: TCheckBox;
    fraListaFiliais1: TfraListaFiliais;
    ckbAgruparFiliaisnaFilialBase: TCheckBox;
    rgpInativas: TRadioGroup;
    rgpOrdenacao: TtecDBRadioGroup;
    rbnClassificacao: TtecRadioButton;
    rbnDescricao: TtecRadioButton;
    rbnCodigo: TtecRadioButton;
    rbnInatividade: TtecRadioButton;
    gbxDataInatividade: TGroupBox;
    edtDataInatividade: TEditData;
    gbxMaximo: TGroupBox;
    gbxNrLivro: TGroupBox;
    gbxPagina: TGroupBox;
    Label1: TLabel;
    fraConsultaClassificacaoReferencial: TfraConsultaCodigoContabil;
    gbxClassificacaoReferencial: TGroupBox;
    dtxClassificacaoReferencial: TtecDBText;
    gbxCadastro: TGroupBox;
    edtInclusao: TDBEditData;
    rgpNatureza_: TDBRadioGroup;
    procedure edtClassificacaoChange(Sender: TObject);
    procedure edtClassificacaoExit(Sender: TObject);
    procedure rbnSinteticaClick(Sender: TObject);
    procedure edfCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClassificacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
    procedure pgcPlanoContasChange(Sender: TObject);
    procedure ckbParaoDiarioClick(Sender: TObject);
    procedure ckbSinteticoClick(Sender: TObject);
    procedure ckbAnaliticoClick(Sender: TObject);
    procedure edtInativoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgpInativasClick(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rgpNatureza_Click(Sender: TObject);
  private
    { Private declarations }
  protected
     function  InternoIncluir: Boolean; override;
     function  InternoExcluir: Boolean; override;
     Function  InternoGravar: Boolean; Override;
     function  InternoPesquisar(Titulo:String): Integer; override;
     function  JanelaPesquisa: TfrmConsultaBasica; override;
     function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function  TabelaDePesquisa: TZDataSet; override;
     procedure KeyDown(var Key: Word; Shift: TShiftState); override;
     procedure PercorrerPlanoContas(Campo: Byte; var Key: Word; Shift: TShiftState);
     procedure AfterPlanoContasVinculado_SinteticasAfterOpen(Sender: TObject);
  public
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
  end;

var
  frmPlanoContas: TfrmPlanoContas;
  ControleValido: TWinControl;

implementation

uses dmplanocontas, dmbasico;

{$R *.dfm}
constructor TfrmPlanoContas.Create(AOwner: TComponent);
begin
   dtmPlanoContas:= TdtmPlanoContas.Create(Self);
   inherited;
   DataSet:= dtmPlanoContas.TabelaPlanoContas;
   pgcPlanoContasChange(pgcPlanoContas);
   edtpagina.Text:='2';
   edtMaximo.Text:='499';
   dtmPlanoContas.PlanoContasVinculado_SinteticasAfterOpen := AfterPlanoContasVinculado_SinteticasAfterOpen;
   if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
     edfCodigo.DenyInsert := false
   else
     edfCodigo.DenyInsert := true;

   fraConsultaClassificacaoReferencial.TipoContaReferencialConsultaSelecionavel := '';
   fraConsultaClassificacaoReferencial.TipoContaReferencialSelecionavel := '';
   fraConsultaClassificacaoReferencial.TipoPesquisa := pesCONTAREFERENCIAL;

   pgcPlanoContas.ActivePage := tstCadastroPlanoContas;   
end;

destructor TfrmPlanoContas.Destroy;
begin
  dtmPlanoContas:=nil;
  inherited;
  frmPlanoContas := nil;
end;

function TfrmPlanoContas.InternoIncluir: Boolean;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      if dtmPlanoContas.IncluirPlanoContas then
      begin
        if ParSistema.PermitirCODIGOnoPLANODECONTASinformado then
        begin
          edfCodigo.SetFocus;
          edfCodigo.SelectAll;
        end
        else
        begin
          edtClassificacao.SetFocus;
          edtClassificacao.SelectAll;
        end;
        rbnAnalitica.Enabled :=  true;
        rbnAnalitica.Enabled := true;
      end;
  end;
end;

function TfrmPlanoContas.InternoExcluir: Boolean;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
    begin
      rbnAnalitica.Enabled :=  true;
      rbnAnalitica.Enabled := true;
      dtmPlanoContas.ExcluirPlanoContas;
    end;
  end;
end;

function TfrmPlanoContas.InternoGravar: Boolean;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= inherited InternoGravar;
  result :=  edtClassificacao.Criticar(false);
  if Result then
    dtmPlanoContas.GravarPlanoContas;
end;

function TfrmPlanoContas.InternoPesquisar(Titulo:String): Integer;
begin
  pgcPlanoContas.ActivePage := tstCadastroPlanoContas;
  Result:= mrOK;
  if not CtrlOn then begin
    dtmPlanoContas.abre(ctConsultaPlanoContas);
    Result:= inherited InternoPesquisar(ctPlanoContas);
    if Result = mrOK then
    begin
       dtmPlanoContas.SelecionarPlanoContas;
       edfCodigo.Text := dtmPlanoContas.qryConsultaPlanosCodigo.AsString;
       edfcodigo.Exist;
    end;
    dtmPlanoContas.Fecha(ctConsultaPlanoContas);
  end;
end;

function TfrmPlanoContas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmPlanoContas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmPlanoContas.ExistePlanoContas(NomeCampo, Value);
end;

function TfrmPlanoContas.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmPlanoContas.TabelaConsultarPlanoContas;
end;

procedure TfrmPlanoContas.edtClassificacaoChange(Sender: TObject);
begin
  inherited;
  dtmPlanoContas.PercorrendoPlanoContas := false;
  dtmPlanoContas.VerificarMascaraClassificacao(edtClassificacao.Text);
end;

procedure TfrmPlanoContas.edtClassificacaoExit(Sender: TObject);
begin
  if not edtClassificacao.ClassificacaoInvalida then
  begin
    dtmPlanoContas.ValidarContas(true);
    dtmPlanoContas.VerificarClassificacao;
  end;
end;

procedure TfrmPlanoContas.rbnSinteticaClick(Sender: TObject);
begin
  inherited;
  if rbnSintetica.Checked then
    edtDescricao.CharCase := ecUpperCase
  else edtDescricao.CharCase := ecNormal;
end;

procedure TfrmPlanoContas.KeyDown(var Key: Word; Shift: TShiftState);
begin
 if edtDescricao.Focused then
   if TeclaEnterOuReturn(key) then
     If dtmPlanoContas.Inserindo
         then InternoGravar;

   inherited;
end;

procedure TfrmPlanoContas.PercorrerPlanoContas(Campo: Byte; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_NEXT) or
      (Key = VK_PRIOR)   or
     ((ssCtrl in Shift) and ((Key = VK_HOME) or (Key = VK_END))) then
   begin
     dtmPlanoContas.PercorrendoPlanoContas := true;
     dtmPlanoContas.PercorrerPlanoContas(Campo, Key, Shift);
//     edfCodigo.Text := dtmPlanoContas.qryPlanoContascodigo.AsString;
//     edfcodigo.Exist;
     case campo of
      cmpcodigo        : edfCodigo.SelectAll;
      cmpClassificacao : edtClassificacao.SelectAll;
      cmpDescricao     : edtDescricao.SelectAll;
      cmpDataInativo   : edtInativo.SelectAll;
     end;
   end;
end;

procedure TfrmPlanoContas.edfCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpcodigo, Key, Shift);
end;

procedure TfrmPlanoContas.edtClassificacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpClassificacao, Key, Shift);
end;

procedure TfrmPlanoContas.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpDescricao, Key, Shift);
end;

procedure TfrmPlanoContas.sbnImprimirClick(Sender: TObject);

begin
  inherited;
  if ecvValida.Verify(gbxNumeracao, ControleValido) then
  begin
    if ckbParaoDiario.Checked and (edtLivro.Text = '') then
    begin
      MensagemAviso(ctPARAMETROSINEXISTENTES);
      edtLivro.SetFocus;
    end
    else
     dtmPlanoContas.ImprimirPlanoContas(ckbSintetico.Checked,
         ckbAnalitico.Checked, ckbParaoDiario.Checked, ckbContaSelecionada.Checked,
         edtLivro.text, edtPagina.Text, edtMaximo.Text,
         fraListaFiliais1.ListaSelecionada,
         rgpOrdenacao.ItemIndex,
         ckbSoComMovtos.Checked,
         ckbSoComSaldos.Checked,
         fraListaFiliais1.TodosMarcados,
         ckbAgruparFiliaisnaFilialBase.Checked,
         rgpInativas.itemindex, edtDataInatividade.Text);
  end;
end;

procedure TfrmPlanoContas.pgcPlanoContasChange(Sender: TObject);
begin
  inherited;
  sbnImprimir.Enabled := (pgcPlanoContas.ActivePage = tstImpressaoPlanoContas);
end;

procedure TfrmPlanoContas.ckbParaoDiarioClick(Sender: TObject);
begin
  inherited;
  ckbAnalitico.OnClick := nil;
  ckbSintetico.OnClick := nil;
  if ckbParaoDiario.Checked then
  begin
    ckbAnalitico.Checked := false;
    ckbSintetico.Checked := false;
    ckbContaSelecionada.Checked := false;
    rgpOrdenacao.ItemIndex := 0;
    rgpOrdenacao.Enabled := false;
    edtDataInatividade.Clear;
    rgpInativas.ItemIndex := 0;
    rgpInativas.Enabled := false;
  end
  else
  begin
   rgpOrdenacao.Enabled := true;
   rgpInativas.Enabled := true;
  end;
  ckbAnalitico.OnClick := ckbAnaliticoClick;
  ckbSintetico.OnClick := ckbSinteticoClick;
end;

procedure TfrmPlanoContas.ckbSinteticoClick(Sender: TObject);
begin
  inherited;
  if not ckbSintetico.Checked then
    ckbAnalitico.Checked := true;
  ckbParaoDiario.Checked := false;
end;

procedure TfrmPlanoContas.ckbAnaliticoClick(Sender: TObject);
begin
  inherited;
  if not ckbAnalitico.Checked then
    ckbSintetico.Checked := true;
  ckbParaoDiario.Checked := false;
end;

procedure TfrmPlanoContas.edtInativoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  PercorrerPlanoContas(cmpDataInativo, Key, Shift);
end;

procedure TfrmPlanoContas.rgpInativasClick(Sender: TObject);
begin
  inherited;
  case rgpInativas.ItemIndex of
  0 : begin
        if rbnInatividade.Checked then
          rbnClassificacao.Checked := true;
        rbnInatividade.Enabled := false;
        gbxDataInatividade.Visible := false;
      end;
  1,2 : begin
         rbnInatividade.Enabled := true;
         gbxDataInatividade.Visible := True;
        end;
  end;
end;


procedure TfrmPlanoContas.AfterPlanoContasVinculado_SinteticasAfterOpen(
  Sender: TObject);
begin
  edtClassificacao.OnExit := nil;
  rbnAnalitica.Enabled := dtmPlanoContas.AbilitarAnalitica;
  if not rbnAnalitica.Enabled then
    rbnSintetica.Enabled := true
  else
    rbnSintetica.Enabled := dtmPlanoContas.AbilitarSintetica;
  edtClassificacao.OnExit := edtClassificacaoExit;
end;

procedure TfrmPlanoContas.edtDescricaoExit(Sender: TObject);
begin
  inherited;
  dtmPlanoContas.ValidarContas(true)
end;

procedure TfrmPlanoContas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ParSistema.ReatualizarSaldosContabeis then
    CanClose := dtmPlanoContas.VerificarAtualizacaoSaldoContabil(true);

end;

procedure TfrmPlanoContas.rgpNatureza_Click(Sender: TObject);
begin
  inherited;
  if dtmPlanoContas.qryPlanoContasnatureza.AsString<>'' then
     dtmPlanoContas.AtualizarNivelAbaixo;

end;

end.
