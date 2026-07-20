unit fmrelatorionotasentrada;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, StdCtrls, ExtCtrls, Buttons, cpdata, cpnumero,
  DBCtrls, cpdbtext, Mask, cpdbfindcontrols, ComCtrls, cppagecontrol,
  fmconsultabasica, fmconsultaporcampo, ZQuery, biblio, ctconstantes, DB,
  ZPgSqlQuery, cpquery, cpeditioncontrolvalidation,
  clparametrossistema, CheckLst, ToolWin, frselecaoaleatoria,frconsultacodigo,frconsulta,
  Windows;

type
  TfrmRelatorioNotasEntrada = class(TfrmRelatorioPadrao)
    gbxLivroEntradaMercadorias: TGroupBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    gbxAgrupamento: TGroupBox;
    ckbAgruparGrupoFilial: TCheckBox;
    ckbAgruparFilial: TCheckBox;
    gbxCodigoFiscal: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigoInicial: TEditNumero;
    edtCodigoFinal: TEditNumero;
    gbxGrupos: TGroupBox;
    sbnMarcarNaturezas: TSpeedButton;
    sbnDesmarcarNaturezas: TSpeedButton;
    clbNaturezas: TCheckListBox;
    tecPageControl1: TtecPageControl;
    TabSheet1: TTabSheet;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    clbFiliais: TCheckListBox;
    TabSheet2: TTabSheet;
    sbnmarcarGrupodeFiliais: TSpeedButton;
    sbnDesmarcarGrupodeFiliais: TSpeedButton;
    clbGrupodeFiliais: TCheckListBox;
    gbxFornecedor: TGroupBox;
    ckbAgruparFornecedor: TCheckBox;
    rgpTipodeData: TRadioGroup;
    gbxEventos: TGroupBox;
    sbnMarcarEventos: TSpeedButton;
    sbnDesmarcarEventos: TSpeedButton;
    clbEventos: TCheckListBox;
    ckbAgruparEventos: TCheckBox;
    ckbListarProdutos: TCheckBox;
    fraSelecaoAleatoriaFiltroProduto: TfraSelecaoAleatoria;
    GroupBox1: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    gbxSituacaoNotaEntrada: TGroupBox;
    ckbNotaEntradaNormal: TCheckBox;
    ckbNotaEntradaParcial: TCheckBox;
    ckbNotaEntradaCancelada: TCheckBox;
    ckbNotaEntradaDenegada: TCheckBox;
    GroupBox2: TGroupBox;
    ckbNotasdeCompra: TCheckBox;
    ckbNotasdeTransferencia: TCheckBox;
    ckbNotasdeDevolucao: TCheckBox;
    rgpDuplicatas: TRadioGroup;
    StaticText1: TStaticText;
    ckbNotasdeTransporte: TCheckBox;
    procedure sbnMarcarEventosClick(Sender: TObject);
    procedure sbnMarcarNaturezasClick(Sender: TObject);
    procedure sbnDesmarcarEventosClick(Sender: TObject);
    procedure sbnDesmarcarNaturezasClick(Sender: TObject);
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure sbnmarcarGrupodeFiliaisClick(Sender: TObject);
    procedure fraSelecaoAleatoriaFiltroProdutosbnIncluirItemClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFiltroProdutosbnProcuraClick(
      Sender: TObject);
    procedure AcionarPesquisaGrade;
    procedure AtribuirDadosItemproduto(Found: Boolean);
    procedure fraSelecaoAleatoriaFiltroProdutodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaFiltroProdutodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFiltroProdutoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
  private
  protected
     procedure internoImpressao; Override;
  public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
     function ValidarCamposSelecao: Boolean;
  end;

var
  frmRelatorioNotasEntrada: TfrmRelatorioNotasEntrada;
  TipoPesquisa: TTecPesquisa;
  ControleValido: TWinControl;

implementation
uses dmrelatorionotasentrada;


{$R *.dfm}

{ TfrmLivroEntradaMercadorias }

constructor TfrmRelatorioNotasEntrada.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioNotasEntrada := TdtmRelatorioNotasEntrada.Create(Self);
  edtDataInicial.Text := DateToStr(UltimoDiaMesPassado(1)+1);
  edtDataFinal.Text   := DateToStr(DataLocal);
  ObterLista(dtmRelatorioNotasEntrada.ListaNaturezas, clbNaturezas);
  ObterLista(dtmRelatorioNotasEntrada.ListaFiliais, clbFiliais);
  ObterLista(dtmRelatorioNotasEntrada.ListaGruposFiliais, clbGrupodeFiliais);
  ObterLista(dtmRelatorioNotasEntrada.ListaEventos, clbEventos);

  fraSelecaoAleatoriaFiltroProduto.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
     'SELECT  cast(null as char(18)) as Codigo, cast(null as varchar(50)) as descricao';

  fraSelecaoAleatoriaFiltroProduto.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaFiltroProduto.qrySelecaoAleatoria.Open;
  fraSelecaoAleatoriaFiltroProduto.qrySelecaoAleatoria.delete;


  with fraSelecaoAleatoriaFiltroProduto do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 18;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraItemProdutos;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'produto';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'produto';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesITEMPRODUTOS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosItemProduto;
  end;

  fraConsultaFornecedor.qryProcuraCliente.ParamByName('NaoConsiderarTipoCliente').asBoolean := false;
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;
  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.Tipovfornecedor := 'F';

end;


destructor TfrmRelatorioNotasEntrada.Destroy;
begin
  dtmRelatorioNotasEntrada:=nil;
  inherited;
  frmRelatorioNotasEntrada := nil;
end;

procedure TfrmRelatorioNotasEntrada.internoImpressao;

  function ListaSituacaoNotaEntrada: String;
  begin
    result := '';
    if ckbNotaEntradaNormal.checked    then result := result + '''N'',';
    if ckbNotaEntradaParcial.checked   then result := result + '''P'',';
    if ckbNotaEntradaCancelada.checked then result := result + '''C'',';
    if ckbNotaEntradaDenegada.checked  then result := result + '''D'',';

    if result <> '' then
      delete(result,length(result),1);
  end;

begin
  inherited;
  if ValidarCamposSelecao then
  with dtmRelatorioNotasEntrada do
  begin
   ParametroCabecalho:='';
   TipodeData := rgpTipodeData.ItemIndex;
   DataInicial:=edtDataInicial.Text;
   DataFinal:=edtDataFinal.Text;
   CodigoFiscalInicial:=edtCodigoInicial.ValorSemFormatacao;
   CodigoFiscalFinal:=edtCodigoFinal.ValorSemFormatacao;
   ParametroFornecedor := fraConsultaFornecedor.edfCodigo.Text;
   ListarProdutos := ckbListarProdutos.checked;

   AgruparGrupoFilial:=ckbAgruparGrupoFilial.Checked;
   AgruparFilial:=ckbAgruparFilial.Checked;
   AgruparFornecedor := ckbAgruparFornecedor.Checked;
   AgruparEvento := ckbAgruparEventos.Checked;

   MontarFiltroNaturezas(clbNaturezas);
   MontarFiltroEventos(clbEventos);
   MontarFiltroFiliais(clbFiliais);
   MontarFiltroGruposFiliais(clbGrupodeFiliais);

   ListadeProdutosSelecionadosAleatoriamente := fraSelecaoAleatoriaFiltroProduto.StringSelecionada;
   SituacaoNotaEntrada := ListaSituacaoNotaEntrada;

   NotaEntradaCompra        := ckbNotasdeCompra.checked;
   NotaEntradaDevolucao     := ckbNotasdeDevolucao.checked;
   NotaEntradaTransporte    := ckbNotasdeTransporte.checked;
   NotaEntradaTransferencia := ckbNotasdeTransferencia.checked;

   Duplicatas := rgpDuplicatas.ItemIndex;


   DefinirOrdenacao;
   if AbrirConsultas then
     ImprimirRelatorio
   else
     MensagemAviso(format(ctNENHUMREGISTROSELECIONADO, ['registro']));

  end;
end;


function TfrmRelatorioNotasEntrada.ValidarCamposSelecao: Boolean;
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
       //begin
        //Result:=(edtCodigoInicial.Text<>'') or (edtCodigoFinal.Text<>'');
        //if Result then
          Result := OperadorTernario((Trim(fraConsultaFornecedor.edfCodigo.Text) <> ''),fraConsultaFornecedor.edfCodigo.Exist, True)
        //else
        //begin
        // MensagemAviso(ctPARAMETROSINEXISTENTES);
        // edtCodigoInicial.SetFocus;
        //end;
       //end
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

procedure TfrmRelatorioNotasEntrada.sbnMarcarNaturezasClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbNaturezas,True);
end;

procedure TfrmRelatorioNotasEntrada.sbnMarcarEventosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbEventos,True);
end;
procedure TfrmRelatorioNotasEntrada.sbnDesmarcarNaturezasClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbNaturezas,False);
end;
procedure TfrmRelatorioNotasEntrada.sbnDesmarcarEventosClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbEventos,False);
end;

procedure TfrmRelatorioNotasEntrada.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,True);
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure TfrmRelatorioNotasEntrada.sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);
end;

procedure TfrmRelatorioNotasEntrada.sbnDesmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure TfrmRelatorioNotasEntrada.sbnmarcarGrupodeFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,True);
  MarcarLista(clbFiliais,False);
end;

procedure TfrmRelatorioNotasEntrada.fraSelecaoAleatoriaFiltroProdutosbnIncluirItemClick(
  Sender: TObject);
begin
  inherited;
  fraSelecaoAleatoriaFiltroProduto.sbnIncluirItemClick(Sender);

end;

procedure TfrmRelatorioNotasEntrada.fraSelecaoAleatoriaFiltroProdutosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
   AcionarPesquisaGrade;
end;

procedure TfrmRelatorioNotasEntrada.AcionarPesquisaGrade;
begin
      with fraSelecaoAleatoriaFiltroProduto do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar(ctCONTAS);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfrmRelatorioNotasEntrada.AtribuirDadosItemproduto(Found: Boolean);
begin
  with fraSelecaoAleatoriaFiltroProduto do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraItemProdutos.fieldbyname('produto').AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraItemProdutos.fieldbyname('descricaolc').AsString;

    qrySelecaoAleatoria.Post;

  end;
end;

procedure TfrmRelatorioNotasEntrada.fraSelecaoAleatoriaFiltroProdutodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaFiltroProduto.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaFiltroProduto.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGrade
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaFiltroProduto.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaFiltroProduto.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaFiltroProduto.ConsultaSelecaoAleatoria.qryProcuraItemProdutos.IsEmpty then
                    AtribuirDadosItemProduto(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaFiltroProduto.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaFiltroProduto.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;

end;

procedure TfrmRelatorioNotasEntrada.fraSelecaoAleatoriaFiltroProdutodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  acionarPesquisaGrade;
end;

procedure TfrmRelatorioNotasEntrada.fraSelecaoAleatoriaFiltroProdutoqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  with fraSelecaoAleatoriaFiltroProduto do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Código';
//    qrySelecaoAleatoria.FieldByName('codigo').SetFieldType(ftLargeInt);
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'Descrição';
    qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := true;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

end.
