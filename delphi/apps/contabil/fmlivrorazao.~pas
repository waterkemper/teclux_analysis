unit fmlivrorazao;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, cpdata, StdCtrls, cpnumero,
  Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  //projetos
  dmlivrorazao, ctconstantes, biblio, clparametrossistema,
  fmconsultabasica, fmconsultaporcampo,
  //terceitos
  ZQuery, cpdoubledts, cpeditioncontrolvalidation, QCheckLst,
  frlistafiliais, frlistagruposfiliais, Grids, DBGrids, cpdbgrid,
  ComCtrls, frconsulta, frconsultacodigo, frconsultacontabil,
  frconsultacodigocontabil, ToolWin;

type
  TfrmLivroRazao = class(TfrmRelatorioPadrao)
    rgpRelatorio: TRadioGroup;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    edtMaximo: TEditNumero;
    gbxPeriodo: TGroupBox;
    rgpOpcaoSaldoDiario: TRadioGroup;
    gbxConta: TGroupBox;
    dtxContaClassificacao: TtecDBText;
    ecvValida: TtecEditionControlValidation;
    gbxOpcoes: TGroupBox;
    ckbSoComMovtos: TCheckBox;
    ckbSoComSaldos: TCheckBox;
    fraListaFiliais: TfraListaFiliais;
    rgpOrdenacao: TRadioGroup;
    ckbAgruparFiliaisnaFilialBase: TCheckBox;
    ckbExcetoConta: TCheckBox;
    fraConsultaContaContabil: TfraConsultaCodigoContabil;
    gbxLivro: TGroupBox;
    gbxPagina: TGroupBox;
    gbxMaximo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    stxRelatorio: TStaticText;
    lblA: TLabel;
    stxSaldosDiarios: TStaticText;
    stxOrdenacao: TStaticText;
    function  ValidarCamposSelecao: Boolean;
    procedure fraListaFiliaissbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaFiliaissbnDesmarcarFiliaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure InternoImpressao; override;

  end;

var
  frmLivroRazao: TfrmLivroRazao;
  TipoPesquisa: TtecLancamentoContas;
  ControleValido: TWinControl;

implementation

{$R *.dfm}

constructor TfrmLivroRazao.Create(AOwner: TComponent);
begin
  dtmLivroRazao := TdtmLivroRazao.Create(Self);
  inherited;
  edtpagina.Text:='2';
  edtMaximo.Text:='499';
  edtDataInicial.Text := DateToStr(PrimeiroDiaMesPassado(1));
  edtDataFinal.Text := DateToStr(UltimoDiaMesPassado(1));
  if ParSistema.LivrosFiscaisFolhaouPagina = 0 then
    gbxPagina.Caption := AnsiUpperCase(ctFOLHA)
  else gbxPagina.Caption:= AnsiUpperCase(ctPAGINA);
  fraConsultaContaContabil.TipoContaContabilDebitoSelecionavel := '';
  fraConsultaContaContabil.TipoContaContabilConsultaSelecionavel := '';
  fraConsultaContaContabil.TipoPesquisa := pesCONTADEBITO;
  fraListaFiliais.gbxFiliais.Font.Height:= -11;
end;

destructor TfrmLivroRazao.Destroy;
begin
  dtmLivroRazao:=nil;
  inherited;
  frmLivroRazao := nil;
end;

procedure TfrmLivroRazao.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
    dtmLivroRazao.ImprimirLivroRazao(
      rgpRelatorio.ItemIndex,
      rgpOpcaoSaldoDiario.ItemIndex,
      rgpOrdenacao.ItemIndex,
      edtDataInicial.text,
      edtDataFinal.text,
      fraConsultaContaContabil.edfCodigo.Text,
      fraConsultaContaContabil.edfCodigo.DataSource.DataSet.fieldbyname('tipo').AsString,
      fraConsultaContaContabil.edfCodigo.DataSource.DataSet.fieldbyname('classificacao').AsString,
      fraConsultaContaContabil.edfCodigo.DataSource.DataSet.fieldbyname('descricao').AsString,
      edtLivro.Text,
      edtPagina.Text,
      edtMaximo.Text,
      ckbSoComMovtos.Checked,
      ckbSoComSaldos.Checked,
      fraListaFiliais.TodosMarcados,
      ckbAgruparFiliaisnaFilialBase.Checked,
      ckbExcetoconta.checked,
      fraListaFiliais.ListaSelecionada
      );
end;

function TfrmLivroRazao.ValidarCamposSelecao: Boolean;
begin
  result:=ecvValida.Verify(gbxNumeracao, ControleValido);
  if Result then
  begin
    Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
    if Result then
    begin
     Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
     if result then
     begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if Result then
      begin
       if fraConsultaContaContabil.edfCodigo.Text<>'' then
         Result := OperadorTernario((Trim(fraConsultaContaContabil.edfCodigo.Text) <> ''),fraConsultaContaContabil.edfCodigo.Exist, True);
       if Result then
       begin
          if (rgpRelatorio.ItemIndex=1) and (edtLivro.Text='') then
          begin
             Result:=False;
             MensagemAviso(ctPARAMETROSINEXISTENTES);
             edtLivro.SetFocus;
          end;
       end;
      end
      else
      begin
       MensagemAviso(ctDATAINVALIDA);
       edtDataInicial.SetFocus;
      end;
     end
     else
     begin
       MensagemAviso(ctDTINICIALMAIORDTFINAL);
       edtDataInicial.SetFocus;
     end;
    end;
  end;
end;


procedure TfrmLivroRazao.fraListaFiliaissbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais.sbnMarcarFiliaisClick(Sender);
end;

procedure TfrmLivroRazao.fraListaFiliaissbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais.sbnDesmarcarFiliaisClick(Sender);
end;

end.
