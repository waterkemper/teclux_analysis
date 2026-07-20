unit fmconsultaprodutosadquiridos;

interface

uses
  SysUtils, Windows, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  DateUtils, Mask, cpdbfindcontrols, DBCtrls, cpdbtext, cpdata, Grids, DBGrids,
  cpdbgrid, ctconstantes, ZQuery, {Qete,} dmconsultaprodutosadquiridos, fmconsultabasica,
  fmconsultaporcampo, biblio, cpeditioncontrolvalidation, ActnList, DB,
  ZPgSqlQuery, cpquery, clparametrossistema, ToolWin;

type
  TfrmConsultaProdutosAdquiridos = class(TfrmAjudaBt)
    sbnGerar: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbx: TGroupBox;
    edfFilial: TtecDbEditFind;
    edfFornecedor: TtecDbEditFind;
    sbnProcuraFiliais: TSpeedButton;
    sbnProcuraFornecedor: TSpeedButton;
    dtxDescricaoFilial: TtecDBText;
    dtxDescricaoFornecedor: TtecDBText;
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    dbgProdutosAdquiridos: TtecDBGrid;
    sbnIncluir: TSpeedButton;
    ecvValida: TtecEditionControlValidation;
    aclHabilitar: TActionList;
    actHabilitarBotoes: TAction;
    ckbRequisitarQtdeAdquirida: TCheckBox;
    ckbSelecionarTodos: TCheckBox;
    ckbIncluirTransferencias: TCheckBox;
    gbxFilial: TGroupBox;
    gbxFornecedor: TGroupBox;
    gbxOpcoes: TGroupBox;
    procedure sbnProcuraFiliaisClick(Sender: TObject);
    procedure sbnProcuraFornecedorClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure dbgProdutosAdquiridosDblClick(Sender: TObject);
    procedure sbnIncluirClick(Sender: TObject);
    procedure dbgProdutosAdquiridosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure actHabilitarBotoesUpdate(Sender: TObject);
    procedure edfFilialMessage(var Msg: String);
    procedure edfFornecedorFound(Found: Boolean);
    procedure edfFilialFound(Found: Boolean);
    procedure ckbSelecionarTodosClick(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);

  protected
    dtmConsultaProdutosAdquiridos: TdtmConsultaProdutosAdquiridos;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  ValidarInformacao: Boolean;
  public
    constructor Create(AWoner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmConsultaProdutosAdquiridos: TfrmConsultaProdutosAdquiridos;
  TipoPesquisa: TtecProdutosAdquiridos;
  ControleAtivo: TWinControl;

implementation

{$R *.dfm}

{ TfrmConsultaProdutosAdquiridos }

procedure TfrmConsultaProdutosAdquiridos.actHabilitarBotoesUpdate(Sender: TObject);
begin
  inherited;
  sbnIncluir.Enabled:= (dtmConsultaProdutosAdquiridos.QtdeMarcados > 0);
  sbnGerar.Enabled  := (dtmConsultaProdutosAdquiridos.QtdeMarcados = 0);
end;

constructor TfrmConsultaProdutosAdquiridos.Create(AWoner: TComponent);
begin
  dtmConsultaProdutosAdquiridos:= TdtmConsultaProdutosAdquiridos.Create(Self);
  inherited;
  edtDataInicial.Text:= DateToStr(dtmConsultaProdutosAdquiridos.DataServidor);
  edtDataFinal.Text  := DateToStr(dtmConsultaProdutosAdquiridos.DataServidor);
  dbgProdutosAdquiridos.Columns[7].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutosAdquiridos.Columns[8].Visible := ParSistema.UsarGradesProdutos;
  dtmConsultaProdutosAdquiridos.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  if Length(ParSistema.MascaraQuantidade) * 7 < 50
  then begin dbgProdutosAdquiridos.Columns[ 9].Width := 50;
             dbgProdutosAdquiridos.Columns[10].Width := 50;
  end
  else begin dbgProdutosAdquiridos.Columns[ 9].Width := length(ParSistema.MascaraQuantidade)*7;
             dbgProdutosAdquiridos.Columns[10].Width := length(ParSistema.MascaraQuantidade)*7;
  end;             

end;

destructor TfrmConsultaProdutosAdquiridos.Destroy;
begin
  dtmConsultaProdutosAdquiridos:=nil;
  inherited;
  frmConsultaProdutosAdquiridos:= Nil;
end;

function TfrmConsultaProdutosAdquiridos.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmConsultaProdutosAdquiridos do begin
    case TipoPesquisa of
          tpiFILIAIS: Result:= ExisteFiliais(NomeCampo, Value);
     tpiFORNECEDORES: Result:= ExisteFornecedores(NomeCampo , Value);
     else            Result:= False;
    end;
  end;
end;

function TfrmConsultaProdutosAdquiridos.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  with dtmConsultaProdutosAdquiridos do begin
    if CtrlOn then begin
      if (ActiveControl = edfFilial) then begin
        TipoPesquisa := tpiFILIAIS;
        Titulo := 'Filiais';
      end
      else if (ActiveControl = edfFornecedor) then begin
        TipoPesquisa := tpiFORNECEDORES;
        Titulo := 'Fornecedores';
      end
      else
        TipoPesquisa:= tpiNENHUM;
    end;
    if TipoPesquisa <> tpiNENHUM then begin
      AbrirTabelas(TipoPesquisa);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoPesquisa);
      FecharTabelas(TipoPesquisa);
    end;
  end;
end;

function TfrmConsultaProdutosAdquiridos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = tpiFORNECEDORES then
       TfrmConsultaPorCampo(Result).ConsultaInterativa:= False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

function TfrmConsultaProdutosAdquiridos.TabelaDePesquisa: TZDataSet;
begin
  with dtmConsultaProdutosAdquiridos do begin
    case TipoPesquisa of
          tpiFILIAIS: Result:= ConsultaFiliais;
     tpiFORNECEDORES: Result:= ConsultaFornecedores;
         else         Result:= nil;
    end;
  end;
end;

procedure TfrmConsultaProdutosAdquiridos.sbnProcuraFiliaisClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaProdutosAdquiridos.sbnProcuraFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaProdutosAdquiridos.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarInformacao then
  begin
    ckbSelecionarTodos.Checked:=false;
    with dtmConsultaProdutosAdquiridos do begin
      DataInicial:= edtDataInicial.Text;
      DataFinal  := edtDataFinal.Text;
      Filial     := edfFilial.Text;
      Fornecedor := edfFornecedor.Text;
      IncluirTransferencias:=ckbIncluirTransferencias.checked;
      if GerarConsultaProdutos then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edfFilial.SetFocus;
      end
      else
        dbgProdutosAdquiridos.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaProdutosAdquiridos.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataInicial.Text) then
    edtDataFinal.Minimo:= DaysBetween(dtmConsultaProdutosAdquiridos.DataServidor,
                                      StrToDate(edtDataInicial.Text));
end;

function TfrmConsultaProdutosAdquiridos.ValidarInformacao: Boolean;
begin
  Result:= ecvValida.Verify(gbxPeriodo,ControleAtivo) and
           (OperadorTernario(edfFilial.Text <> '',edfFilial.Exist,True) or
            OperadorTernario(edfFornecedor.Text <> '',edfFornecedor.Exist,True));
end;

procedure TfrmConsultaProdutosAdquiridos.dbgProdutosAdquiridosDblClick(Sender: TObject);
begin
  inherited;
  dtmConsultaProdutosAdquiridos.SelecionarRegistros;
end;

procedure TfrmConsultaProdutosAdquiridos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F3    : if (Shift = []) and sbnIncluir.Enabled then sbnIncluir.Click;
    VK_F6    : if (Shift = []) and sbnGerar.Enabled then sbnGerar.Click;
    VK_SPACE : if Shift = [ssCtrl] then dtmConsultaProdutosAdquiridos.SelecionarRegistros;
    VK_ESCAPE: begin
                  dtmConsultaProdutosAdquiridos.FecharTabelaProdutosAdquiridos;
                  edfFilial.SetFocus;
                end;
    VK_Return: if (ActiveControl = edtDataFinal) and (Shift = []) then begin
                  if edtDataFinal.DataValida then begin
                    sbnGerar.Click;
                    if (dtmConsultaProdutosAdquiridos.NrRegistros > 0) then
                      dbgProdutosAdquiridos.SetFocus;
                  end
                  else edtDataFinal.SetFocus;
                end
                else inherited;

    else  inherited;
  end
end;

procedure TfrmConsultaProdutosAdquiridos.sbnIncluirClick(Sender: TObject);
begin
  inherited;
  dtmConsultaProdutosAdquiridos.IncluirQtdeAdquirida:=ckbRequisitarQtdeAdquirida.Checked;
  if not dtmConsultaProdutosAdquiridos.IncluirRequisicaoExposicao then
    dbgProdutosAdquiridos.SetFocus;
end;

procedure TfrmConsultaProdutosAdquiridos.dbgProdutosAdquiridosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFocused in State) then begin
    if dtmConsultaProdutosAdquiridos.ProdutoSelecionado then begin
      TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
    if not dtmConsultaProdutosAdquiridos.RequisicaoOk and (dtmConsultaProdutosAdquiridos.NrRegistros > 0) then begin
      TDBGrid(Sender).Canvas.Brush.Color := clRed;
      TDBGrid(Sender).Canvas.Font.Color := clBlack;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmConsultaProdutosAdquiridos.edfFilialMessage(var Msg: String);
begin
  inherited;
//  Msg:= Format(ctFILIALIGUALFILIALBASE,[edfFilial.Text]);
end;

procedure TfrmConsultaProdutosAdquiridos.edfFornecedorFound(Found: Boolean);
begin
  inherited;
  if Found then begin
    Case dtmConsultaProdutosAdquiridos.TipoFornecedor[1] of
      'C': gbxFornecedor.Caption:= 'Cliente';
      'F': gbxFornecedor.Caption:= 'Fornecedor';
      'L': gbxFornecedor.Caption:= 'Filial';
    end;
  end
  else begin
    edfFornecedor.Clear;
    gbxFornecedor.Caption:= 'Fornecedor';
  end;
end;

procedure TfrmConsultaProdutosAdquiridos.edfFilialFound(Found: Boolean);
begin
  inherited;
  if not Found then
    edfFilial.Clear;
end;

procedure TfrmConsultaProdutosAdquiridos.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutosAdquiridos.Columns[7].Title.Caption := dtmConsultaProdutosAdquiridos.LinhadaGrade;
  dbgProdutosAdquiridos.Columns[8].Title.Caption := dtmConsultaProdutosAdquiridos.colunadaGrade;

end;

procedure TfrmConsultaProdutosAdquiridos.ckbSelecionarTodosClick(
  Sender: TObject);
begin
  inherited;
  dtmConsultaProdutosAdquiridos.MarcarSelecionados(ckbSelecionarTodos.Checked, True);
end;

end.
