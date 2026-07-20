unit fmemissaobalancetes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, StdCtrls, cpnumero, Mask,
  cpdata, fmrelatoriopadrao, biblio, cpeditioncontrolvalidation, QCheckLst,
  frlistafiliais, clparametrossistema, ctconstantes, frconsulta, dmbasico,
  frconsultacodigo, DBCtrls, cpdbtext, fmencerramentoexercicio, dateutils,
  frselecaoaleatoria, db, cpdbfindcontrols, Windows,{Qete,} frconsultacontabil,
  frconsultacodigocontabil, ToolWin;

type
  TfrmEmissaoBalancetes = class(TfrmRelatorioPadrao)
    rgpForma: TRadioGroup;
    rgpFuncao: TRadioGroup;
    gbxNumeracao: TGroupBox;
    edtLivro: TEditNumero;
    edtPagina: TEditNumero;
    gbxImprimir: TGroupBox;
    ckbSomenteSaldos: TCheckBox;
    ckbSubContasComSaldos: TCheckBox;
    ckbClassificacao: TCheckBox;
    edtMaximo: TEditNumero;
    ecvValida: TtecEditionControlValidation;
    fraListaFiliais1: TfraListaFiliais;
    ckbConsolidarFiliais: TCheckBox;
    ckbLinhaBranco: TCheckBox;
    ckbDataUltimoMovto: TCheckBox;
    gbxContaDemonstrativo: TGroupBox;
    fraConsultaPlanoContas: TfraConsultaCodigoContabil;
    dtxClassificacaoContabil: TtecDBText;
    ckbDataResponsavel: TCheckBox;
    ckbImprimirCodigoReduzido: TCheckBox;
    ckbOrdenarporcodigoreduzido: TCheckBox;
    gbxLivro: TGroupBox;
    gbxPagina: TGroupBox;
    gbxMaximo: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtMesInicial: TEditMesAno;
    edtMesFinal: TEditMesAno;
    gbxContasSelecionadas: TGroupBox;
    fraSelecaoAleatoriaContas: TfraSelecaoAleatoria;
    lblA: TLabel;
    stxForma: TStaticText;
    stxBalancete: TStaticText;
    procedure fraListaFiliais1sbnMarcarFiliaisClick(Sender: TObject);
    procedure fraListaFiliais1sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure rgpFuncaoClick(Sender: TObject);
    procedure ckbSomenteSaldosClick(Sender: TObject);
    procedure rgpFormaClick(Sender: TObject);
    procedure fraSelecaoAleatoriaContasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaContasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaContassbnProcuraClick(Sender: TObject);
    procedure fraSelecaoAleatoriaContasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function ValidaCampos: Boolean;
    { Private declarations }
  protected
    procedure InternoImpressao; override;
    procedure AtribuirDadosContaContabil(Found: Boolean);
    procedure AcionarPesquisaGrade;
    function SelecionarAnalitica: Boolean;
    function SelecionarSintetica: Boolean;

  public
    constructor Create(AOwner: TComponent);override;
    destructor  Destroy; override;
    { Public declarations }
  end;

var
  frmEmissaoBalancetes: TfrmEmissaoBalancetes;
  ControleValido: TWinControl;

implementation
uses dmemissaobalancetes;

{$R *.dfm}

{ TfrmEmissaoBalancetes }

constructor TfrmEmissaoBalancetes.Create(AOwner: TComponent);
begin
  dtmEmissaoBalancetes := TdtmEmissaoBalancetes.Create(Self);
  inherited;
  if ParSistema.LivrosFiscaisFolhaouPagina = 0 then
    gbxPagina.Caption := AnsiUpperCase(ctFOLHA)
  else
    gbxPagina.Caption := AnsiUpperCase(ctPAGINA);
  edtPagina.Text := '2';
  edtMaximo.Text := '499';
  edtMesInicial.Text:= FormatDateTime('mm/yyyy',UltimoDiaMesPassado(1));
  edtMesFinal.  Text:= FormatDateTime('mm/yyyy',UltimoDiaMesPassado(1));

  gbxLivro.Enabled := rgpForma.ItemIndex = 1;
//  ckbDataUltimoMovto.Checked := not ckbSomenteSaldos.Checked;
//  ckbDataUltimoMovto.Enabled := not ckbSomenteSaldos.Checked;

  fraConsultaPlanoContas.TipoContaContabilCreditoSelecionavel := 'S';
  fraConsultaPlanoContas.TipoPesquisa := pesCONTACREDITO;
  gbxContaDemonstrativo.Enabled := false;
  edtMesInicial.SetFocus;
  edtMesInicial.SelectAll;
  fraSelecaoAleatoriaContas.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaContas.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaContas do
  begin
    ConsultaSelecaoAleatoriaContabil := TfraConsultaCodigoContabil.Create(self);
    ConsultaSelecaoAleatoriaContabil.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoriaContabil.edfCodigo.MaxLength := 6;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoriaContabil.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.LookupSource := ConsultaSelecaoAleatoriaContabil.dsrProcuraDebitar;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoriaContabil.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoriaContabil.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoriaContabil.TipoPesquisa := pesCONTADEBITO;
    ConsultaSelecaoAleatoriaContabil.OnFound := AtribuirDadosContaContabil;
  end;
  {
  fraSelecaoAleatoriaContas.fraConsultaCodigo.edfCodigo.DataSource :=
    fraSelecaoAleatoriaContas.fraConsultaCodigo.dsrProcuraDebitar;

  fraSelecaoAleatoriaContas.fraConsultaCodigo.TipoContaContabilDebitoSelecionavel := '';
  fraSelecaoAleatoriaContas.fraConsultaCodigo.TipoContaContabilConsultaSelecionavel:= '';
  fraSelecaoAleatoriaContas.fraConsultaCodigo.TipoPesquisa := pesCONTADEBITO;
  }
  fraListaFiliais1.gbxFiliais.Font.Height:= -11;
end;

destructor TfrmEmissaoBalancetes.Destroy;
begin
  dtmEmissaoBalancetes:=nil;
  inherited;
  frmEmissaoBalancetes := nil;
end;

procedure TfrmEmissaoBalancetes.InternoImpressao;
var
  ListaAnalitica: String;
  ListaSintetica: vString;
begin
  inherited;
  ListaAnalitica := '';
  if ValidaCampos then
  begin
    fraSelecaoAleatoriaContas.CampoParaLista := 'codigo';
    fraSelecaoAleatoriaContas.condicaodaselecao := SelecionarAnalitica;
    ListaAnalitica := fraSelecaoAleatoriaContas.StringSelecionada;

    fraSelecaoAleatoriaContas.CampoParaLista := 'classificacao';
    fraSelecaoAleatoriaContas.condicaodaselecao := SelecionarSintetica;
    ListaSintetica := fraSelecaoAleatoriaContas.ListaSelecionada;

    dtmEmissaoBalancetes.ImprimirBalanco(rgpForma.ItemIndex, rgpFuncao.ItemIndex,
                      edtMesInicial.Text, edtMesFinal.Text,
                      edtLivro.Text, edtPagina.Text,
                      edtMaximo.Text, fraListaFiliais1.ListaSelecionada,
                      fraconsultaplanocontas.edfCodigo.Text,
                      fraConsultaPlanoContas.edfCodigo.DataSource.DataSet.FieldByName('classificacao').AsString,
                      ListaAnalitica, ListaSintetica,
                      ckbSomenteSaldos.Checked, ckbSubContasComSaldos.Checked,
                      ckbClassificacao.Checked, ckbImprimirCodigoReduzido.checked,
                      fraListaFiliais1.TodosMarcados,
                      ckbConsolidarFiliais.Checked, ckbLinhaBranco.Checked,
                      ckbDataUltimoMovto.Checked, ckbDataResponsavel.Checked,
                      ckbOrdenarporcodigoreduzido.checked,
                      fraListaFiliais1.ListadeFiliaisSelecionadas,
                      fraListaFiliais1.ListageraldeFiliais);
  end;
end;

procedure TfrmEmissaoBalancetes.fraListaFiliais1sbnMarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnMarcarFiliaisClick(Sender);
end;

procedure TfrmEmissaoBalancetes.fraListaFiliais1sbnDesmarcarFiliaisClick(
  Sender: TObject);
begin
  inherited;
  fraListaFiliais1.sbnDesmarcarFiliaisClick(Sender);
end;

function TfrmEmissaoBalancetes.ValidaCampos: Boolean;
begin
  result := edtMesInicial.DataValida and edtMesFinal.DataValida;
  if result then
  begin
    result := (not MesAnoEmBranco(edtMesInicial.text) and not MesAnoEmBranco(edtMesFinal.text));
    if result then
    begin
      Result:=StrToDate('01/'+edtMesInicial.Text) <= StrToDate('01/'+edtMesFinal.Text);
      if not result then
      begin
        MensagemAviso(ctDTINICIALMAIORDTFINAL);
        edtMesInicial.SetFocus;
      end
      else
      begin
        result := copy(edtMesInicial.Text,4,4) = copy(edtMesFinal.Text,4,4);
        if not result then
        begin
          MensagemAviso('O intervalo deve ser do mesmo exercício');
          edtMesInicial.SetFocus;
        end;
      end;
    end
    else
    begin
      MensagemAviso(ctDATAINVALIDA);
      edtMesInicial.SetFocus;
    end;

    if result then
    begin
      Result := ecvValida.Verify(gbxNumeracao, ControleValido);
      if Result then
        if (rgpForma.ItemIndex = 1) and (edtLivro.Text = '') then
        begin
          Result := False;
          MensagemAviso('Os controles de edição necessitam' + #10#13 +
                        'ser preenchidos com uma informação válida!');
          edtLivro.SetFocus;
        end;
    end;
  end;
end;

procedure TfrmEmissaoBalancetes.rgpFuncaoClick(Sender: TObject);
begin
  inherited;
  if rgpFuncao.ItemIndex <> 0 then
    gbxContasSelecionadas.Enabled := false
  else
    gbxContasSelecionadas.Enabled := true;

  if rgpFuncao.ItemIndex = 2 then
    ckbSomenteSaldos.Checked := True;

  if rgpFuncao.ItemIndex <> 3 then
  begin
    fraConsultaPlanoContas.edfCodigo.Clear;
    fraConsultaPlanoContas.edfCodigo.exist;
    gbxContaDemonstrativo.Enabled := false;
  end
  else
  begin
   gbxContaDemonstrativo.Enabled := true;
   fraConsultaPlanoContas.edfCodigo.Text := ParSistema.Contademonstrativaderesultados;
   fraConsultaPlanoContas.edfCodigo.exist;
  end;
end;

procedure TfrmEmissaoBalancetes.ckbSomenteSaldosClick(Sender: TObject);
begin
  inherited;
  ckbDataUltimoMovto.Checked := not ckbSomenteSaldos.Checked;
  ckbDataUltimoMovto.Enabled := not ckbSomenteSaldos.Checked;
end;

procedure TfrmEmissaoBalancetes.rgpFormaClick(Sender: TObject);
begin
  inherited;
  gbxLivro.Enabled := rgpForma.ItemIndex = 1;
end;

procedure TfrmEmissaoBalancetes.fraSelecaoAleatoriaContasqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  with fraSelecaoAleatoriaContas do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'DESCRIÇÃO';
    qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('classificacao').DisplayLabel := 'CLASSIFICAÇÃO';
    qrySelecaoAleatoria.FieldByName('classificacao').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('tipo').DisplayLabel := 'TIPO';
    qrySelecaoAleatoria.FieldByName('tipo').ReadOnly := true;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfrmEmissaoBalancetes.AtribuirDadosContaContabil(Found: Boolean);
begin
  with fraSelecaoAleatoriaContas do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsInteger :=
        ConsultaSelecaoAleatoriaContabil.qryProcuraDebitarcodigo.AsInteger;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoriaContabil.qryProcuraDebitardescricao.AsString;

    qrySelecaoAleatoria.FieldByName('classificacao').AsString :=
        ConsultaSelecaoAleatoriaContabil.qryProcuraDebitarclassificacao.AsString;

    qrySelecaoAleatoria.FieldByName('tipo').AsString :=
        ConsultaSelecaoAleatoriaContabil.qryProcuraDebitartipo.AsString;

    qrySelecaoAleatoria.Post;

  end;

end;

procedure TfrmEmissaoBalancetes.fraSelecaoAleatoriaContasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  acionarPesquisaGrade;
end;

procedure TfrmEmissaoBalancetes.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriaContas do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoriaContabil.CtrlOn := True;
    ConsultaSelecaoAleatoriaContabil.InternoPesquisar(ctCONTAS);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfrmEmissaoBalancetes.fraSelecaoAleatoriaContassbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGrade;
end;

procedure TfrmEmissaoBalancetes.fraSelecaoAleatoriaContasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaContas.ConsultaSelecaoAleatoriaContabil.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaContas.ConsultaSelecaoAleatoriaContabil.CtrlOn then
                       AcionarPesquisaGrade
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaContas.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaContas.ConsultaSelecaoAleatoriaContabil.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaContas.ConsultaSelecaoAleatoriaContabil.qryProcuraDebitar.IsEmpty then
                    AtribuirDadosContaContabil(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaContas.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaContas.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;
end;

function TfrmEmissaoBalancetes.SelecionarAnalitica: Boolean;
begin
  result := fraSelecaoAleatoriaContas.qrySelecaoAleatoria.FieldByName('tipo').AsString = 'A';
end;

function TfrmEmissaoBalancetes.SelecionarSintetica: Boolean;
begin
  result := fraSelecaoAleatoriaContas.qrySelecaoAleatoria.FieldByName('tipo').AsString = 'S';
end;

end.
