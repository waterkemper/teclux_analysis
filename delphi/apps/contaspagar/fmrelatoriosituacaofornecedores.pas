unit fmrelatoriosituacaofornecedores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, ExtCtrls, Buttons, cpdata, cpnumero,
  DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ComCtrls, cppagecontrol,
  fmconsultabasica, fmconsultaporcampo, ZQuery, biblio, ctconstantes, DB,
  ZPgSqlQuery, cpquery, cpeditioncontrolvalidation,
  clparametrossistema, CheckLst, cpdbradiogroup, ToolWin, frconsulta,
  frconsultacodigo;

type
  TfrmRelatoriosituacaofornecedores = class(TfrmRelatorioPadrao)
    tecPageControl1: TtecPageControl;
    TabSheet1: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    TabSheet2: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    rgbPrevisao: TtecDBRadioGroup;
    rbnComPrevisao: TtecRadioButton;
    rbnSemPrevisao: TtecRadioButton;
    rbnSoPrevisao: TtecRadioButton;
    rgbResumo: TtecDBRadioGroup;
    rbnComresumo: TtecRadioButton;
    rbnSemResumo: TtecRadioButton;
    rbnSoResumo: TtecRadioButton;
    gbxPesquisarDesde: TGroupBox;
    edtDataInicial: TEditData;
    gbxSituacaoEm: TGroupBox;
    edtDataSituacao: TEditData;
    rgbOrdenacao: TtecDBRadioGroup;
    rbnNNota: TtecRadioButton;
    rbnDataLancto: TtecRadioButton;
    rgpSoNotas: TtecDBRadioGroup;
    rbnComDuplicatas: TtecRadioButton;
    rbnSemDuplicatas: TtecRadioButton;
    rbnAmbasSituacoes: TtecRadioButton;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    ckbDuplicataemAberto: TCheckBox;
    ckbQuebraporFornecedor: TCheckBox;
    gbxGrupos: TGroupBox;
    sbnMarcarNaturezas: TSpeedButton;
    sbnDesmarcarNaturezas: TSpeedButton;
    clbNaturezas: TCheckListBox;
    gbxTipoFornecedor: TGroupBox;
    ckbProduto: TCheckBox;
    ckbTransporte: TCheckBox;
    ckbMontagem: TCheckBox;
    ckbListarNotasdeClientes: TCheckBox;
    ckbSomenteDocsComNotas: TCheckBox;
    gbxOpcoes: TGroupBox;
    GroupBox1: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnMarcarNaturezasClick(Sender: TObject);
    procedure sbnDesmarcarNaturezasClick(Sender: TObject);
  private
    procedure ObterLista(Origem: TLista; Destino: TCheckListBox);
  protected
     procedure internoImpressao; Override;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     function ValidarCamposSelecao: Boolean;
  end;

var
  frmRelatoriosituacaofornecedores: TfrmRelatoriosituacaofornecedores;
  TipoPesquisa: TTecPesquisa;
  ControleValido: TWinControl;

implementation
uses dmrelatoriosituacaofornecedores;


{$R *.dfm}

{ TfrmLivroEntradaMercadorias }

constructor TfrmRelatoriosituacaofornecedores.Create(AOwner: TComponent);
var
  Dia, Mes, Ano: Word;
  Data: TDateTime;
begin
  inherited;
  dtmRelatoriosituacaofornecedores := TdtmRelatoriosituacaofornecedores.Create(Self);
  DecodeDate(dtmRelatoriosituacaofornecedores.DataServidor,Ano,Mes,Dia);
  Data:= EncodeDate(Ano,Mes,01);
  edtdatasituacao.Text:= DateToStr(Data-1);
  DecodeDate(Data,Ano,Mes,Dia);
  Data:= EncodeDate(Ano,Mes,01);
  edtDataInicial.Text:= DateToStr(Data-90);
  ObterLista(dtmRelatoriosituacaofornecedores.ListaFiliais, clbFiliais);
  ObterLista(dtmRelatoriosituacaofornecedores.ListaGruposFiliais, clbGrupodeFiliais);
  ObterLista(dtmRelatoriosituacaofornecedores.ListaNaturezas, clbNaturezas);

  fraConsultaFornecedor.qryProcuraCliente.ParamByName('NaoConsiderarTipoCliente').asBoolean := false;
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;
  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';
  
end;

destructor TfrmRelatoriosituacaofornecedores.Destroy;
begin
  dtmRelatoriosituacaofornecedores:=nil;
  inherited;
  frmRelatoriosituacaofornecedores := nil;
end;

procedure TfrmRelatoriosituacaofornecedores.internoImpressao;
begin
  inherited;
  if ValidarCamposSelecao then
  with dtmRelatoriosituacaofornecedores do
  begin
   ParametroCabecalho:='';
   DataInicial:=edtDataInicial.Text;
   DataSituacao:=edtDataSituacao.Text;
   ParametroFornecedor := fraConsultaFornecedor.edfCodigo.Text;
   ForneceProdutos := ckbProduto.Checked;
   ForneceTransporte := ckbTransporte.Checked;
   ForneceMontagem := ckbMontagem.Checked;
   Resumo := rgbResumo.ItemIndex;

   AgruparGrupoFilial:=ckbAgruparGrupoFilial.Checked;
   AgruparFilial:=ckbAgruparFilial.Checked;
   TipoOrdenacao := rgbOrdenacao.ItemIndex;
   SomenteDuplicatasemAberto  := ckbDuplicataemAberto.Checked;
   QuebrarPaginaporFornecedor := ckbQuebraporFornecedor.Checked;
   SomenteDocsComNotas := ckbSomenteDocsComNotas.Checked;

   MontarFiltroFiliais(clbFiliais);
   MontarFiltroGruposFiliais(clbGrupodeFiliais);
   MontarFiltroNaturezas(clbNaturezas);
   Previsao := rgbPrevisao.ItemIndex;
   SituacaoNota := rgpSoNotas.ItemIndex;

   DefinirOrdenacao;
   if AbrirConsultas then
     ImprimirRelatorio
   else
     MensagemAviso(format(ctNENHUMREGISTROSELECIONADO, ['registro']));

  end;
end;

function TfrmRelatoriosituacaofornecedores.ValidarCamposSelecao: Boolean;
begin
    Result := (edtDataInicial.DataValida and edtDataSituacao.DataValida);
    if Result then
    begin
     if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataSituacao.text)) then
       Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataSituacao.Text);
     if result then
     begin
       Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataSituacao.text));
       if Result then
          Result := OperadorTernario((Trim(fraConsultaFornecedor.edfCodigo.Text) <> ''), fraConsultaFornecedor.edfCodigo.Exist, True)
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


procedure TfrmRelatoriosituacaofornecedores.ObterLista(Origem: TLista;
  Destino: TCheckListBox);
var
  Ind: Integer;
begin
  for Ind:= 0 to (Length(Origem) - 1) do
    Destino.Items.Add(Origem[Ind].codigo+' - ' +Origem[Ind].descricao);
end;

procedure TfrmRelatoriosituacaofornecedores.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,True);
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure TfrmRelatoriosituacaofornecedores.sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);
end;

procedure TfrmRelatoriosituacaofornecedores.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure TfrmRelatoriosituacaofornecedores.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,True);
  MarcarLista(clbFiliais,False);
end;

procedure TfrmRelatoriosituacaofornecedores.sbnMarcarNaturezasClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbNaturezas,True);
end;


procedure TfrmRelatoriosituacaofornecedores.sbnDesmarcarNaturezasClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbNaturezas,False);
end;

end.
