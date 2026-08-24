unit fmlista;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, DB, Windows, ComCtrls,
  // Constantes
  ctconstantes, biblio, clparametrossistema,
  // Terceiros
  ZQuery,
  // Repositorio
  dmlista, fmconsultabasica, fmconsultaporcampo, fmajudabt,
  // Componentes
  cptexto, cpdbfindcontrols, cpquery, cpdbtext, cpeditioncontrolvalidation,
  cppagecontrol, fmrelatoriopadrao, cpdata, CheckLst, ToolWin,
  frmultiplaselecaoaleatoria, frselecaoaleatoriaitemdeprodutos, frconsulta,
  frconsultacodigo;

type
  TfrmListaPrecos = class(TfrmRelatorioPadrao)
    gbxInformar: TGroupBox;
    lblPrecosAlterados: TLabel;
    edtDataAlteracao: TEditData;
    gbxFornecedores: TGroupBox;
    gbxColuna: TGroupBox;
    sbnColuna: TSpeedButton;
    edfColuna: TtecDbEditFind;
    dtxColuna: TtecDBText;
    rgbOrdenacao: TRadioGroup;
    gbxSituacaoProdutos: TGroupBox;
    ckbProdutoEmLinha: TCheckBox;
    ckbProdutoForadeLinha: TCheckBox;
    ckbProdutoComMontagem: TCheckBox;
    ckbProdutoSemMontagem: TCheckBox;
    ckbProdutoNaoBrinde: TCheckBox;
    ckbProdutoBrinde: TCheckBox;
    ckbProdutoAtivo: TCheckBox;
    ckbProdutoInativo: TCheckBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    edtDataValidade: TEditData;
    gbxFiliais: TGroupBox;
    edfFilial: TtecDbEditFind;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    gbxTipoPreco: TGroupBox;
    ckbNormal: TCheckBox;
    ckbPromocao: TCheckBox;
    gbxAgrupamento: TGroupBox;
    ckbMarca: TCheckBox;
    ckbFornecedor: TCheckBox;
    rgbDataValidade: TRadioGroup;
    pnlDireita: TPanel;
    gbxDataValidade: TGroupBox;
    gbxDataAlteracao: TGroupBox;
    pnlEsquerdo: TPanel;
    sbnExcel: TSpeedButton;
    fraMultiplaSelecaoAleatoria1: TfraMultiplaSelecaoAleatoria;
    gbxOpcoes: TGroupBox;
    ckbSemEstoqueZero: TCheckBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    ckbImprimirCodigoDeBarras: TCheckBox;
    procedure edfColunaKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure sbnColunaClick(Sender: TObject);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnExcelClick(Sender: TObject);
  protected
    dtmListaPrecos: TdtmListaPrecos;
    procedure internoimpressao; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure CriarDataModulo; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure LimpaControles;
    function TituloPesquisa: String;
    function PesquisaHabilitada: Boolean;
    function VerificaCamposConsulta: Boolean;
  end;

var
  frmListaPrecos: TfrmListaPrecos;
  TipoPesquisa: TtecPesquisa;
  ControleValido: TWinControl;

implementation

uses frselecaoaleatoriaprodutos;

{$R *.dfm}

constructor TfrmListaPrecos.Create(AOwner: TComponent);
begin
  inherited;
  dtmListaPrecos.Abre(ctTabelas);
  edtDataInicial.Text := dtmListaPrecos.periodoinicial;
  edtDataFinal.Text := dtmListaPrecos.periodoFinal;
//  sbnExcel.Visible := ParSistema.PrecosporCargo;

  fraMultiplaSelecaoAleatoria1.tstItemdeProduto.tabvisible := false;

  {
  if ParSistema.PrecosporCargo then
    sbnImprimir.Caption := 'Excel F7'
  else
    sbnImprimir.Caption := 'Imprimir F7';

  gbxPeriodo.Visible := not ParSistema.PrecosporCargo;
  gbxFiliais.Visible := not ParSistema.PrecosporCargo;
  gbxDataAlteracao.Visible := not ParSistema.PrecosporCargo;
  gbxDataValidade.Visible    := not ParSistema.PrecosporCargo;
  gbxTipoPreco.Visible       := not ParSistema.PrecosporCargo;
  gbxAgrupamento.Visible       := not ParSistema.PrecosporCargo;

  if not ParSistema.PrecosporCargo then
    self.Height := 550
  else
    self.Height := 380;
 }

  fraConsultaFornecedor.qryProcuraCliente.ParamByName('NaoConsiderarTipoCliente').asBoolean := false;
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;
  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';

end;

destructor TfrmListaPrecos.Destroy;
begin
  frmListaPrecos:= nil;
  inherited;
end;


procedure TfrmListaPrecos.CriarDataModulo;
begin
  inherited;
  dtmListaPrecos := TdtmListaPrecos.Create(Self);
end;

function TfrmListaPrecos.PesquisaHabilitada: Boolean;
begin
 Result:= False;
  if CtrlOn then
  begin
    if ActiveControl is TtecDBEditFind then
    begin
      if edfColuna.Focused then
        TipoPesquisa := pesCOLUNAS
      else
      if edfFilial.Focused then
        TipoPesquisa := pesFILIAIS;
      Result := True;
    end
  end;
end;

function TfrmListaPrecos.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmListaPrecos do
    case TipoPesquisa of
      pesFILIAIS         : Result := ExisteFilial(NomeCampo, Value);
    else
      Result := False;
    end;
end;

function TfrmListaPrecos.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmListaPrecos do
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

function TfrmListaPrecos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmListaPrecos.TabelaDePesquisa: TZDataSet;
begin
  with dtmListaPrecos do
    case TipoPesquisa of
      pesFILIAIS         : Result := ConsultaFilial;
    else  Result := nil;
    end;
end;

function TfrmListaPrecos.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesCARACTERISTICAS : Result := ctPRODUTO;
    pesMARCAS          : Result := ctMARCAS;
    pesCLASSES         : Result := ctCLASSES;
    pesGRUPOS          : Result := ctGRUPOS;
    pesCOLUNAS         : Result := ctCOLUNA;
  end;
end;

function TfrmListaPrecos.VerificaCamposConsulta: Boolean;
begin
 result := edfFilial.Text<>'';
 if result then
 begin
   Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
   if Result then
   begin
    if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
      Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
    if result then
    begin
      Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
      if Result then
        Result := OperadorTernario((Trim(edffilial.Text) <> ''), edffilial.Exist, false) and
                  OperadorTernario((Trim(fraConsultaFornecedor.edfcodigo.Text) <> ''), fraConsultaFornecedor.edfcodigo.Exist, True) and
                  OperadorTernario((Trim(edfColuna.Text) <> ''), edfColuna.Exist, true)
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
 end
 else
 begin
  MensagemAviso(ctCODIGONECESSARIO);
  edfFilial.SetFocus;
 end;
end;

procedure TfrmListaPrecos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
   VK_F8     : begin
                 if sbnExcel.Visible then
                 begin
                   dtmListaPrecos.AbrirExcel := true;
                   internoimpressao;
                   dtmListaPrecos.AbrirExcel := false;
                 end;  
               end;
   VK_Escape : LimpaControles;
  end;
  inherited;
end;

procedure TfrmListaPrecos.edfColunaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) and (Shift = []) then
    internoimpressao;
end;

procedure TfrmListaPrecos.LimpaControles;
begin
  with dtmListaPrecos do begin
    Selecionar(pesGRUPOS);
    Selecionar(pesCLASSES);
  end;
end;

procedure TfrmListaPrecos.internoimpressao;
begin
  inherited;
    if VerificaCamposConsulta then
    with dtmListaPrecos do begin
      Normal := ckbNormal.Checked;
      Promocao := ckbPromocao.Checked;
      DataInicial := edtDataInicial.Text;
      DataFinal := edtDataFinal.Text;
      ParametroColuna    := edfColuna.Text;
      ParametroCabecalho := '';

      ParametroProduto   := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriaprodutos.ListaCondicional;

      ParametroMarca     := fraMultiplaSelecaoAleatoria1.fraSelecaoAleatoriamarcasProdutos.ListaCondicional;
      ListaCondicionalPromocoes := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriapromocoes.ListaCondicional;
      ParametroGrupo     := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriagruposprodutos.ListaCondicional;
      ParametroClasse    := fraMultiplaSelecaoAleatoria1.fraSelecaoaleatoriaclassesprodutos.ListaCondicional;


      ParametroFornecedor:= fraConsultaFornecedor.edfcodigo.Text;
      ParametroFilial    := edfFilial.Text;
      DataAlteracao := edtDataAlteracao.Text;
      TipoValidade := rgbDataValidade.ItemIndex;
      DataValidade := edtDataValidade.Text;
      ProdutoEmLinha     := ckbProdutoEmLinha.checked;
      ProdutoForadeLinha := ckbProdutoForadeLinha.checked;
      ProdutoAtivo       := ckbProdutoAtivo.Checked;
      ProdutoInativo     := ckbProdutoInativo.Checked;
      ProdutoComMontagem := ckbProdutoComMontagem.Checked;
      ProdutoSemMontagem := ckbProdutoSemMontagem.Checked;
      ProdutoBrinde      := ckbProdutoBrinde.Checked;
      ProdutoNaoBrinde   := ckbProdutoNaoBrinde.Checked;
      ParametroOrdenacao := rgbOrdenacao.ItemIndex;
      AgruparMarca       := ckbMarca.Checked;
      AgruparFornecedor  := ckbFornecedor.Checked;
      SemEstoqueZero := ckbSemEstoqueZero.Checked;
      ImprimirCodigoDeBarras:= ckbImprimirCodigoDeBarras.Checked;

      if not GerarRelatorio then
        MensagemAviso(format(ctNENHUMREGISTROSELECIONADO,['registro']))
    end;
end;



procedure TfrmListaPrecos.sbnColunaClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  ActiveControl := edfColuna;
  InternoPesquisar('');
end;

procedure TfrmListaPrecos.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  ActiveControl := edfFilial;
  InternoPesquisar('');

end;

procedure TfrmListaPrecos.sbnExcelClick(Sender: TObject);
begin
  inherited;
  dtmListaPrecos.AbrirExcel := true;
  internoimpressao;
  dtmListaPrecos.AbrirExcel := false;
end;

end.
