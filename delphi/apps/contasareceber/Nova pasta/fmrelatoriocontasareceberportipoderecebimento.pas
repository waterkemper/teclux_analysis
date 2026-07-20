unit fmrelatoriocontasareceberportipoderecebimento;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  fmrelatoriopadrao, ExtCtrls, Buttons, frconsulta, frconsultacodigo, DateUtils,
  cpdbradiogroup, cpdata, dmrelatoriocontasareceberportipoderecebimento, Biblio, ComCtrls,
  cppagecontrol, ctconstantes, frlistafiliais, frlistatiposderecebimentos,
  frordenacao;

type
  Tfrmrelatoriocontasareceberportipoderecebimento = class(TfrmRelatorioPadrao)
    gbxEmissao: TGroupBox;
    edtDataInicialEmissao: TEditData;
    edtDataFinalEmissao: TEditData;
    rgbResumo: TtecDBRadioGroup;
    rbnComresumo: TtecRadioButton;
    rbnSemResumo: TtecRadioButton;
    rbnSoResumo: TtecRadioButton;
    gbxAgrupamento: TGroupBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparClientes: TCheckBox;
    ckbAgruparData: TCheckBox;
    gbxClientes: TGroupBox;
    fraConsultaClientes: TfraConsultaCodigo;
    ckbAgruparTipoRecebimento: TCheckBox;
    fraListaFiliais1: TfraListaFiliais;
    fraListaTiposdeRecebimentos1: TfraListaTiposdeRecebimentos;
    gbxVendedor: TGroupBox;
    fraConsultaVendedor: TfraConsultaCodigo;
    fraOrdenacao1: TfraOrdenacao;
    ckbAgruparVendedor: TCheckBox;
    lblA: TLabel;
    gbxVencimentos: TGroupBox;
    edtDataInicialVencto: TEditData;
    edtDataFinalVencto: TEditData;
    Label1: TLabel;
    lblConfirmados: TLabel;
    rgbConfirmado: TRadioGroup;
    procedure edtDataInicialEmissaoExit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure internoimpressao; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  ValidarCamposSelecao: Boolean;

    { Public declarations }
  end;

var
  frmrelatoriocontasareceberportipoderecebimento: Tfrmrelatoriocontasareceberportipoderecebimento;

implementation

{$R *.dfm}

{ Tfrmrelatoriocontasareceberportipoderecebimento }

constructor Tfrmrelatoriocontasareceberportipoderecebimento.Create(AOwner: TComponent);
begin
  dtmrelatoriocontasareceberportipoderecebimento:= Tdtmrelatoriocontasareceberportipoderecebimento.Create(Self);
  inherited;
  edtDataInicialVencto.Text := DateToStr(DataLocal);
  edtDataFinalVencto.Text   := DateToStr(DataLocal);
  fraConsultaClientes.TipoPesquisa    := pesCLIENTES;
  fraConsultaClientes.TipoCliente  := 'C';
  fraConsultaVendedor.TipoPesquisa    := pesVENDEDORES;

  fraOrdenacao1.qryLista.Open;
  rgbConfirmado.ItemIndex := 2;
end;

destructor Tfrmrelatoriocontasareceberportipoderecebimento.Destroy;
begin
  dtmrelatoriocontasareceberportipoderecebimento:= nil;
  inherited;
  frmrelatoriocontasareceberportipoderecebimento:= nil;
end;

procedure Tfrmrelatoriocontasareceberportipoderecebimento.internoimpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    with dtmrelatoriocontasareceberportipoderecebimento do
    begin
      ParametroCabecalho:= '';
      Filial := fraListaFiliais1.ListaSelecionada;
      TipodeRecebimento := fraListaTiposdeRecebimentos1.ListaSelecionada;
      ChequesAvulsos := fraListaTiposdeRecebimentos1.ChequesAvulsos;
      TipoCliente := fraConsultaClientes.qryProcuraClientetipo.AsString;
      Cliente := fraConsultaClientes.edfCodigo.Text;
      Vendedor := fraConsultaVendedor.qryProcuraVendedorescodigo.AsString;
      Confirmados:=rgbConfirmado.ItemIndex;



      AgruparFilial   := ckbAgruparFilial.Checked;
      AgruparVendedor := ckbAgruparVendedor.Checked;
      AgruparCliente  := ckbAgruparClientes.Checked;
      AgruparTipodeRecebimento := ckbAgruparTipoRecebimento.Checked;
      AgruparData := ckbAgruparData.Checked;

      PeriodoInicialEmissao:= edtDataInicialEmissao.Text;
      PeriodoFinalEmissao  := edtDataFinalEmissao.Text;

      PeriodoInicialVencto:= edtDataInicialVencto.Text;
      PeriodoFinalVencto  := edtDataFinalVencto.Text;

      DefineOrdenacao(fraOrdenacao1.ListaOrdenacao);
      Resumo := rgbResumo.ItemIndex;
      if GerarRelatorio then
      begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicialVencto.SetFocus;
      end
      else
        ImprimirRelatorio;
    end;
  end;
end;

procedure Tfrmrelatoriocontasareceberportipoderecebimento.edtDataInicialEmissaoExit(
  Sender: TObject);
begin
  inherited;
  if (edtDataInicialEmissao.Text<>'') and (edtDataFinalEmissao.Text<>'') then
    if strtodate(edtDataInicialEmissao.Text)> strtodate(edtDataFinalEmissao.Text) then
      edtDataFinalEmissao.Text := edtDataInicialEmissao.Text;

end;

function Tfrmrelatoriocontasareceberportipoderecebimento.ValidarCamposSelecao: Boolean;
begin
  Result := (edtDataInicialEmissao.DataValida and edtDataFinalVencto.DataValida);
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

end;

end.
