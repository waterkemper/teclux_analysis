unit fmrelatoriosituacaorecebimentos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, CheckLst, DBCtrls,
  cpdbtext, Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, cpdata,
  ZQuery,
  fmconsultabasica,
  fmconsultaporcampo, cpeditioncontrolvalidation,
  ctconstantes, clparametrossistema,
  biblio, cpnumero, Dateutils, frconsultafilialgrupofilial, frconsulta,
  frconsultacodigo, ToolWin;

type
  TfrmRelatorioSituacaoRecebimentos = class(TFrmRelatorioPadrao)
    gbxSituacaoRecebimentos: TGroupBox;
    gbxAgentes: TGroupBox;
    sbnMarcarAgentes: TSpeedButton;
    sbnDesmarcarAgentes: TSpeedButton;
    clbAgentes: TCheckListBox;
    rgpTipodeContrato: TRadioGroup;
    rgpRenegociacao: TRadioGroup;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    gbxMesBase: TGroupBox;
    edtmesbase: TEditMesAno;
    ecvValida: TtecEditionControlValidation;
    gbxMesesaVisualizar: TGroupBox;
    lblMesBase: TLabel;
    lblDepoisMesBase: TLabel;
    edtnmesesbase: TEditNumero;
    edtnMesesDepois: TEditNumero;
    fraConsultaFilialGrupoFilial: TfraConsultaFilialGrupoFilial;
    procedure sbnMarcarAgentesClick(Sender: TObject);
    procedure sbnDesmarcarAgentesClick(Sender: TObject);
  protected
    procedure InternoImpressao; override;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    function  ValidarCamposSelecao: Boolean;
    procedure ObterLista(Origem: TStrings; Destino: TCheckListBox);
  end;

var
  frmRelatorioSituacaoRecebimentos: TfrmRelatorioSituacaoRecebimentos;
  ControleValido                  : TWinControl;
  tiporelatorio                   : TTecTipoRelatorioVendas;
  TipoPesquisa                    : TtecRelatorioVendas;

implementation

uses dmrelatoriosituacaorecebimentos;

{$R *.dfm}

{ TfrmRelatorioSituacaoRecebimentos }

constructor TfrmRelatorioSituacaoRecebimentos.Create(Aowner: Tcomponent);
begin
  dtmrelatoriosituacaorecebimentos := Tdtmrelatoriosituacaorecebimentos.Create(Self);
  inherited;
  dtmRelatorioSituacaoRecebimentos.Abre(ctTabelas);
  ObterLista(dtmRelatorioSituacaoRecebimentos.ListaAgentes, clbAgentes);
  MarcarLista(clbAgentes, True);
  edtmesbase.Text := FormatDateTime('MM/YYYY',Date);
  edtnmesesbase.text:='6';
  edtnMesesDepois.text:='18';
  fraConsultaFilialGrupoFilial.MultiplosFiltros := false;
  fraConsultaFilialGrupoFilial.fraConsultaFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilialGrupoFilial.fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.TipoPesquisa := pesGRUPOSFILIAIS;
  
end;

destructor TfrmRelatorioSituacaoRecebimentos.Destroy;
begin
  dtmRelatorioSituacaoRecebimentos:=nil;
  inherited;
  frmRelatorioSituacaoRecebimentos:= nil;
end;

procedure TfrmRelatorioSituacaoRecebimentos.InternoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then begin
    with dtmRelatorioSituacaoRecebimentos do
    begin
      ParametroCabecalho :='';
      Filiais       := fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text;
      GrupoFiliais  := fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.edfCodigo.Text;;
      if GrupoFiliais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Grupo Filial de Venda: '+GrupoFiliais
      else
      if Filiais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Filial de Venda: '+Filiais;

      MontarFiltroAgentes(clbAgentes);
      MesBase       := FormatDateTime('YYYY/MM',strtodate('01/'+edtmesbase.Text));
      ParametroCabecalho:=ParametroCabecalho+' Mês Base: '+edtmesbase.Text;
      MesBaseSaldo  := FormatDateTime('YYYY/MM',IncMonth(strtodatetime('01/'+edtmesbase.Text), -edtnmesesbase.ValorSemFormatacao));
      MesBaseDepois := FormatDateTime('YYYY/MM',IncMonth(strtodatetime('01/'+edtmesbase.Text), edtnMesesDepois.ValorSemFormatacao));
      Renegociacao  := rgpRenegociacao.ItemIndex;
      TipodeContrato:= rgpTipodeContrato.ItemIndex;
      AgruparGrupoFilial := ckbAgruparGrupoFilial.Checked;
      AgruparFilial      := ckbAgruparFilial.Checked;
     qryRelatorioSituacaoRecebimentos.Open;
     if not (qryRelatorioSituacaoRecebimentos.IsEmpty) then
       ImprimirRelatorio
     else
       MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;

end;


procedure TfrmRelatorioSituacaoRecebimentos.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

function TfrmRelatorioSituacaoRecebimentos.ValidarCamposSelecao: Boolean;
begin
  Result:=ecvValida.Verify(gbxSituacaoRecebimentos, ControleValido);
  if Result then
     Result := OperadorTernario((Trim(fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text) <> ''),
     fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Exist, True) and
               OperadorTernario((Trim(fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text) <> ''),
     fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Exist, True);
end;


procedure TfrmRelatorioSituacaoRecebimentos.sbnMarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, True);
end;

procedure TfrmRelatorioSituacaoRecebimentos.sbnDesmarcarAgentesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAgentes, False);
end;

end.
