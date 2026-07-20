unit fmrelatorioresumosinteticofaturamento;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cpdata, DBCtrls, cpdbtext,
  Mask, cpdbfindcontrols, ComCtrls, cppagecontrol, Buttons, ctconstantes, biblio,
  DB, ZQuery, ZPgSqlQuery, cpquery, cpeditioncontrolvalidation,
  fmrelatoriopadrao,
  fmconsultabasica,
  fmconsultaporcampo, frconsultafilialgrupofilial, frconsulta,
  frconsultaippgcm, frconsultacodigo, clparametrossistema, ToolWin,
  frselecaoaleatoriaclientes, frselecaoaleatoriagruposusuarios,
  frselecaoaleatoriausuarios;

type
  Tfrmrelatorioresumosinteticofaturamento = class(TfrmRelatorioPadrao)
    gbxResumoSinteticodoFaturamento: TGroupBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbAgruparVendedor: TCheckBox;
    gbxDevolucoes: TGroupBox;
    ckbDevolucoesPeriodoSelecionado: TCheckBox;
    ckbDevolucoesPeriodoAnterior: TCheckBox;
    ckbSaltarPaginas: TCheckBox;
    gbxListar: TGroupBox;
    ckbRecebimentosporContrato: TCheckBox;
    ckbRecebimentosFrentedeCaixa: TCheckBox;
    fraConsultaFilialGrupoFilial: TfraConsultaFilialGrupoFilial;
    fraConsultaIPPGCM1: TfraConsultaIPPGCM;
    fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes;
    gbxClientes: TGroupBox;
    pgcVendedores: TtecPageControl;
    tstVendedores: TTabSheet;
    fraSelecaoAleatoriausuariosVendedores: TfraSelecaoAleatoriausuarios;
    tstGruposdeVendedores: TTabSheet;
    fraSelecaoAleatoriaGrupoVendedores: TfraSelecaoAleatoriagruposusuarios;
    procedure ckbRecebimentosporContratoClick(Sender: TObject);
    procedure ckbRecebimentosFrentedeCaixaClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InternoImpressao; override;
  public
    { Public declarations  }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure MontaPesquisa;
    function  ValidarCamposSelecao: Boolean;
  end;

var
  frmrelatorioresumosinteticofaturamento: Tfrmrelatorioresumosinteticofaturamento;
  TipoPesquisa      : TtecRelatorioVendas;

implementation

uses dmrelatorioresumosinteticofaturamento;

{$R *.dfm}

{ Tfrmrelatorioresumosinteticofaturamento }

constructor Tfrmrelatorioresumosinteticofaturamento.Create(
  Aowner: Tcomponent);
begin
  inherited;
  dtmrelatorioresumosinteticofaturamento := Tdtmrelatorioresumosinteticofaturamento.Create(Self);
  dtmrelatorioresumosinteticofaturamento.Abre(ctTabelas);

  edtDataInicial.Text := DateToStr(PrimeiroDiaMes(dtmrelatorioresumosinteticofaturamento.dataservidor));
  edtDataFinal.Text := DateToStr(DataLocal);

  fraConsultaFilialGrupoFilial.MultiplosFiltros := false;
  fraConsultaFilialGrupoFilial.fraConsultaFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;
  fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.SomenteFiliaisUsuario :=
    ParSistema.RelatorioSomenteFiliaisAutorizadas;

  fraConsultaFilialGrupoFilial.fraConsultaFilial.TipoPesquisa := pesFILIAIS;
  fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.TipoPesquisa := pesGRUPOSFILIAIS;
  
  with fraConsultaIPPGCM1 do
  begin
    MultiplosFiltros := false;
    fraConsultaItemProduto.TipoPesquisa := pesITEMPRODUTOS;
    fraConsultaProduto.TipoPesquisa     := pesPRODUTOS;
    fraConsultaGrupo.TipoPesquisa       := pesGRUPOS;
    fraConsultaClasse.TipoPesquisa      := pesCLASSES;
    fraConsultaMarcas.TipoPesquisa      := pesMARCAS;
    tstMarcas.TabVisible := false;
  end;

  edtDataInicial.setfocus;
  edtDataInicial.selectall;


end;

destructor Tfrmrelatorioresumosinteticofaturamento.Destroy;
begin
  dtmrelatorioresumosinteticofaturamento:=nil;
  inherited;
  frmrelatorioresumosinteticofaturamento:=nil;
end;

procedure Tfrmrelatorioresumosinteticofaturamento.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

procedure Tfrmrelatorioresumosinteticofaturamento.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmrelatorioresumosinteticofaturamento do
    begin
      ParametroCabecalho      := '';
      RecebimentosporContrato := ckbRecebimentosporContrato.Checked;
      RecebimentosporFrenteCaixa := ckbRecebimentosFrentedeCaixa.Checked;
      DevolucoesPeriodoSelecionado := ckbDevolucoesPeriodoSelecionado.Checked;
      DevolucoesPeriodoAnterior := ckbDevolucoesPeriodoAnterior.Checked;
      DataInicial             := edtDataInicial.Text;
      DataFinal               := edtDataFinal.Text;
      Filiais                 := fraConsultaFilialGrupoFilial.fraConsultaFilial.edfCodigo.Text;
      CondicaoClientes        := fraSelecaoAleatoriaClientes1.ListaCondicional;
      GrupoFiliais            := fraConsultaFilialGrupoFilial.fraConsultaGrupoFilial.edfCodigo.Text;
      if GrupoFiliais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Grupo de Filiais: '+GrupoFiliais
      else
      if Filiais<>'' then
        ParametroCabecalho:=ParametroCabecalho+' Filiais: '+Filiais;

      ItemProdutos            := fraConsultaIPPGCM1.fraConsultaItemProduto.qryProcuraItemProdutos.fieldbyname('produto').AsString;
      Produtos                := fraConsultaIPPGCM1.fraConsultaProduto.edfCodigo.Text;
      GrupoProdutos           := fraConsultaIPPGCM1.fraConsultaGrupo.edfCodigo.Text;
      ClasseProdutos          := fraConsultaIPPGCM1.fraConsultaClasse.edfCodigo.Text;

{      Vendedores              := fraConsultaVendedor.edfCodigo.Text; }

      Vendedores := fraSelecaoAleatoriausuariosVendedores.ListaCondicional;
      GruposVendedores := fraSelecaoAleatoriaGrupoVendedores.ListaCondicional;

      AgruparGrupoFilial      := ckbAgruparGrupoFilial.Checked;
      AgruparFilial           := ckbAgruparFilial.Checked;
      AgruparVendedor         := ckbAgruparVendedor.checked;
      SaltarPagina            := ckbSaltarPaginas.Checked;

      if AbrirRelatorio then
       ImprimirRelatorio('RESUMO SINTETICO DO FATURAMENTO')
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
    end;
  end;
end;

function Tfrmrelatorioresumosinteticofaturamento.ValidarCamposSelecao: Boolean;
begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then
   begin
    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
    if result then
    begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if not Result then
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

procedure Tfrmrelatorioresumosinteticofaturamento.ckbRecebimentosporContratoClick(
  Sender: TObject);
begin
  inherited;
  gbxDevolucoes.Enabled := ckbRecebimentosporContrato.Checked;
  if not ckbRecebimentosporContrato.Checked then
    ckbRecebimentosFrentedeCaixa.Checked := true;
end;

procedure Tfrmrelatorioresumosinteticofaturamento.ckbRecebimentosFrentedeCaixaClick(
  Sender: TObject);
begin
  inherited;
  if not ckbRecebimentosFrentedeCaixa.Checked then
    ckbRecebimentosporContrato.Checked := true;
  gbxDevolucoes.Enabled := ckbRecebimentosporContrato.Checked;
end;

end.
