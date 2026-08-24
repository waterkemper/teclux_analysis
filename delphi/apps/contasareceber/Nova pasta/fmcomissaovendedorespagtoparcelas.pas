unit fmcomissaovendedorespagtoparcelas;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta, frconsultacodigo, DateUtils,
  cpdbradiogroup, cpdata, dmcomissaovendedorespagtoparcelas, Biblio, ComCtrls,
  cppagecontrol, ctconstantes, ToolWin, frselecaoaleatoriavendedores,
  frselecaoaleatoriausuarios;

type
  Tfrmcomissaovendedorespagtoparcelas = class(TfrmRelatorioPadrao)
    rgbTipoRelatorio: TRadioGroup;
    rgbResumo: TtecDBRadioGroup;
    rbnComresumo: TtecRadioButton;
    rbnSemResumo: TtecRadioButton;
    rbnSoResumo: TtecRadioButton;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparClientes: TCheckBox;
    ckbAgruparData: TCheckBox;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    tstGrupoFilial: TTabSheet;
    gbxBanco: TGroupBox;
    gbxClientes: TGroupBox;
    fraConsultaClientes: TfraConsultaCodigo;
    fraConsultaBancos: TfraConsultaCodigo;
    fraConsultaFilial: TfraConsultaCodigo;
    fraConsultaGrupoFilial: TfraConsultaCodigo;
    grxTipoRecebimento: TGroupBox;
    fraConsultaTipoRecebimentos: TfraConsultaCodigo;
    gbxEmissao: TGroupBox;
    lblA: TLabel;
    edtDataInicialEmissao: TEditData;
    edtDataFinalEmissao: TEditData;
    gbxVencimentos: TGroupBox;
    Label1: TLabel;
    edtDataInicialVencto: TEditData;
    edtDataFinalVencto: TEditData;
    gbxDataRecebimentos: TGroupBox;
    Label2: TLabel;
    edtDataInicialRecebimento: TEditData;
    edtDataFinalRecebimento: TEditData;
    cbkVisualizarValoresPISeCOFINS: TCheckBox;
    gbxListaCondicionalVendedores: TGroupBox;
    fraSelecaoAleatoriavendedores: TfraSelecaoAleatoriavendedores;
    ckbAgruparVendedor: TCheckBox;
    stxTipoRelatorio: TStaticText;
    rgpFilialSelecao: TRadioGroup;
    rgpFilialExibicao: TRadioGroup;
    procedure rgbTipoRelatorioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure internoimpressao; override;
    function  ValidarCamposSelecao: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  frmcomissaovendedorespagtoparcelas: Tfrmcomissaovendedorespagtoparcelas;

implementation

{$R *.dfm}

{ Tfrmcomissaovendedorespagtoparcelas }

constructor Tfrmcomissaovendedorespagtoparcelas.Create(AOwner: TComponent);
begin
  dtmcomissaovendedorespagtoparcelas:= Tdtmcomissaovendedorespagtoparcelas.Create(Self);
  inherited;
//  edtDataInicial.Text := DateToStr(DataLocal);
//  edtDataFinal.Text   := DateToStr(DataLocal);

  fraConsultaClientes.TipoPesquisa    := pesCLIENTES;
  fraConsultaClientes.TipoCliente  := 'C';
  fraConsultaBancos.TipoPesquisa      := pesBANCOS;
  fraConsultaFilial.TipoPesquisa      := pesFILIAIS;
  fraConsultaGrupoFilial.TipoPesquisa := pesGRUPOSFILIAIS;
  fraConsultaTipoRecebimentos.TipoPesquisa := pesTIPORECEBIMENTO;



end;

destructor Tfrmcomissaovendedorespagtoparcelas.Destroy;
begin
  dtmcomissaovendedorespagtoparcelas:= nil;
  inherited;
  frmcomissaovendedorespagtoparcelas:= nil;
end;

procedure Tfrmcomissaovendedorespagtoparcelas.internoimpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmcomissaovendedorespagtoparcelas do
    begin
      ParametroCabecalho:= '';

      if rgpFilialSelecao.visible then
        FilialSelecao := rgpFilialSelecao.ItemIndex
      else
        FilialSelecao := 1;

      if rgpFilialExibicao.visible then
        FilialExibicao := rgpFilialExibicao.ItemIndex
      else
        FilialExibicao := 1;

      Filial := fraConsultaFilial.edfCodigo.Text;
      GrupoFiliais := fraConsultaGrupoFilial.edfCodigo.Text;
      Cliente := fraConsultaClientes.edfCodigo.Text;
      TipoCliente := fraConsultaClientes.qryProcuraClientetipo.AsString;
      Banco := fraConsultaBancos.edfCodigo.Text;
      TipoRecebimento:= fraConsultaTipoRecebimentos.edfCodigo.Text;
      AgruparGrupoFilial:= ckbAgruparGrupoFilial.Checked;
      AgruparFilial := ckbAgruparFilial.Checked;
      AgruparCliente := ckbAgruparClientes.Checked;
      AgruparData := ckbAgruparData.Checked;
      AgruparVendedor := ckbAgruparVendedor.Checked;
      TipoRelatorio:= rgbTipoRelatorio.ItemIndex;
      ListaCondicionalVendedores := fraSelecaoAleatoriavendedores.ListaCondicional;

      PeriodoInicialEmissao:= edtDataInicialEmissao.Text;
      PeriodoFinalEmissao  := edtDataFinalEmissao.Text;

      PeriodoInicialVencto:= edtDataInicialVencto.Text;
      PeriodoFinalVencto  := edtDataFinalVencto.Text;

      PeriodoInicialRecebimento:= edtDataInicialRecebimento.Text;
      PeriodoFinalRecebimento  := edtDataFinalRecebimento.Text;

      VisualizarValoresPISeCOFINS := cbkVisualizarValoresPISeCOFINS.checked;

      MontaIntervaloPeriodoEmissao;
      MontaIntervaloPeriodoVencimento;
      MontaIntervaloPeriodoRecebimento;

      DefineOrdenacao;
      Resumo := rgbResumo.ItemIndex;
      if GerarRelatorio then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicialEmissao.SetFocus;
      end
      else
        ImprimirRelatorio;
    end;
  end;
end;

function Tfrmcomissaovendedorespagtoparcelas.ValidarCamposSelecao: Boolean;
begin
  Result := (edtDataInicialEmissao.DataValida and edtDataFinalEmissao.DataValida);
  if Result then
  begin
    if (not dataembranco(edtDataInicialEmissao.text) and not dataembranco(edtDataFinalEmissao.text)) then
      Result:=StrToDate(edtDataInicialEmissao.Text) <= StrToDate(edtDataFinalEmissao.Text);

    if not result then
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtDataInicialEmissao.SetFocus;
    end;
  end;

  if result then
  begin
    Result := (edtDataInicialVencto.DataValida and edtDataFinalVencto.DataValida);
    if Result then
    begin
      if (not dataembranco(edtDataInicialVencto.text) and not dataembranco(edtDataFinalVencto.text)) then
        Result:=StrToDate(edtDataInicialVencto.Text) <= StrToDate(edtDataFinalVencto.Text);

      if not result then
      begin
        MensagemAviso(ctDTINICIALMAIORDTFINAL);
        edtDataInicialVencto.SetFocus;
      end;
    end;
  end;

  if result then
  begin
    Result := (edtDataInicialRecebimento.DataValida and edtDataFinalRecebimento.DataValida);
    if Result then
    begin
      if (not dataembranco(edtDataInicialRecebimento.text) and not dataembranco(edtDataFinalRecebimento.text)) then
        Result:=StrToDate(edtDataInicialRecebimento.Text) <= StrToDate(edtDataFinalRecebimento.Text);

      if not result then
      begin
        MensagemAviso(ctDTINICIALMAIORDTFINAL);
        edtDataInicialRecebimento.SetFocus;
      end;
    end;
  end;

end;

procedure Tfrmcomissaovendedorespagtoparcelas.rgbTipoRelatorioClick(
  Sender: TObject);
begin
  inherited;
  rgpFilialSelecao.visible :=   rgbTipoRelatorio.itemindex = 1;
  rgpFilialExibicao.visible :=  rgbTipoRelatorio.itemindex = 1;

end;

procedure Tfrmcomissaovendedorespagtoparcelas.FormActivate(Sender: TObject);
begin
  inherited;
  rgpFilialSelecao.visible :=   rgbTipoRelatorio.itemindex = 1;
  rgpFilialExibicao.visible :=  rgbTipoRelatorio.itemindex = 1;
end;

end.
