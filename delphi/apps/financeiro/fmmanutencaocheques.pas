unit fmmanutencaocheques;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Windows, DateUtils,
  // Componentes
  cpdbgrid, cpdbfindcontrols, cpdbtext, cpdata, cpnumero,
  // Constantes
  ctconstantes, biblio, cpeditioncontrolvalidation,
  // Repositorio
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo, fmajudabt,
  // Terceiros
  ZQuery,
  // Projeto
  dmmanutencaocheques, cpdbradiogroup, ComCtrls, ActnList, DB,
  ZPgSqlQuery, cpquery, ToolWin;

type
  TfrmManutencaoCheques = class(TfrmAjudaBt)
    gbxFundoJanela: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtterminoPeriodo: TEditData;
    edtInicioPeriodo: TEditData;
    bvlCheques: TBevel;
    gbxFilial: TGroupBox;
    flkFilial: TtecDbEditFind;
    sbnProcurarFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    gbxRemessa: TGroupBox;
    edtRemessa: TEditData;
    edtNumero: TEditNumero;
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    aclHabilita: TActionList;
    actHabilita: TAction;
    gbxCobrador: TGroupBox;
    sbnProcurarCobrador: TSpeedButton;
    flkCobrador: TtecDbEditFind;
    dtxCobrador: TtecDBText;
    rgpOperacaoes: TRadioGroup;
    sbnConfirma: TSpeedButton;
    dbgPesquisa: TtecDBGrid;
    gbxCheques: TGroupBox;
    edtQtdeCheques: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    gbxValores: TGroupBox;
    edtTotalCheques: TEditNumero;
    edtTotalMarcados: TEditNumero;
    ckbSelecionarTodos: TCheckBox;
    svdCaminho: TSaveDialog;
    rgbTipoCheque: TtecDBRadioGroup;
    rbnChequeVista: TRadioButton;
    rbnChequePrazo: TRadioButton;
    ecvValidar: TtecEditionControlValidation;
    ckbChequesSemCobrador: TCheckBox;
    rbnTodos: TRadioButton;
    lblA: TLabel;
    gbxDataRemessa: TGroupBox;
    gbxNrRemessa: TGroupBox;
    gbxQtdeMarcados: TGroupBox;
    gbxValorMarcados: TGroupBox;
    gbxQtdeSelecionados: TGroupBox;
    gbxValorSelecionados: TGroupBox;
    gbxConta: TGroupBox;
    sbnProcurarConta: TSpeedButton;
    dtxDigito: TtecDBText;
    Label1: TLabel;
    flkConta: TtecDBFindLookup;
    gbxSiglaBanco: TGroupBox;
    dtxSigla: TtecDBText;
    gbxNomeAgencia: TGroupBox;
    dtxNomeAgencia: TtecDBText;
    gbxOperacoes: TGroupBox;
    procedure dbgPesquisaTitleClick(Column: TColumn);
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarCobradorClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure edtterminoPeriodoEnter(Sender: TObject);
    procedure actHabilitaUpdate(Sender: TObject);
    procedure dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgpOperacaoesClick(Sender: TObject);
    procedure sbnAtribuiCobradorClick(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure dbgPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure flkAgenciaFound(Found: Boolean);
    procedure sbnProcurarContaClick(Sender: TObject);
  protected
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure PosicionarTabelaNoParametro(Ind: Integer; var continuar: Boolean); override;
    procedure AtribuirRemessa;
    procedure ExcluirRemessa;
    procedure AtribuirCobrador;
    procedure DevolverCheque;
    procedure FecharConsulta;
    procedure MontaPesquisa;
    function  ValidaControles: Boolean;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure ZeraContadores;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmManutencaoCheques: TfrmManutencaoCheques;
  TipoProcura: TtecManutencaoCheques;
  IdxNome: Integer;
  IdxRemessa: Integer;

implementation

uses
  //Repositorio
  fmlerdata, fmlerdatanumero, fmlerdadosdefinicaocobrador, fmlerdadosdefinirmotivo;

{$R *.dfm}

{ TfrmManutencaoCheques }

constructor TfrmManutencaoCheques.Create(AOwner: TComponent);
begin
  dtmManutencaoCheques := TdtmManutencaoCheques.Create(Self);
  inherited;
  edtInicioPeriodo.Text  := DateToStr(Date);
  edtterminoPeriodo.Text := DateToStr(Date);
  IdxNome:= 1;
  IdxRemessa:= 1;
end;

destructor TfrmManutencaoCheques.Destroy;
begin
  dtmManutencaoCheques:=nil;
  inherited;
  frmManutencaoCheques := Nil;
end;

function TfrmManutencaoCheques.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= False;
  with dtmManutencaoCheques do
    case TipoProcura of
         tpManutencaoChequesFiliais: Result:= ExisteFilial(NomeCampo, Value);
      tpManutencaoChequesCobradores: Result:= ExisteCobrador(NomeCampo, Value);
           tpManutencaoChequesBanco: case Parametro of
                                       -1: Result:= ExisteAgencia(NomeCampo, Value);
                                        0: Result:= ExisteBanco(NomeCampo, Value);
                                     end;
      else                           Result:= False;
    end;
end;

function TfrmManutencaoCheques.InternoPesquisar(Titulo: String): Integer;
begin
   Result := mrNone;
   if CtrlOn then begin
     if ActiveControl = flkFilial then begin
       TipoProcura := tpManutencaoChequesFiliais;
       Titulo := 'Filiais';
     end
     else if ActiveControl = flkCobrador then begin
       TipoProcura:= tpManutencaoChequesCobradores;
       Titulo:= 'Cobradores';
     end
     else if ActiveControl = flkConta then begin
       TipoProcura := tpManutencaoChequesConta;
       Titulo       := 'Contas';
     end
     else TipoProcura:= tpManutencaoChequesNenhum;

     if TipoProcura <> tpManutencaoChequesNenhum then begin
       with dtmManutencaoCheques do begin
         AbreTabelaPesquisa(TipoProcura);
         Result := inherited InternoPesquisar(Titulo);
         if Result = mrOK then
           Selecionar(tipoProcura);
         FechaTabelaPesquisa(TipoProcura);
       end;
     end;
   end;
end;

function TfrmManutencaoCheques.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= (TipoProcura = tpManutencaoChequesBanco);
end;

procedure TfrmManutencaoCheques.MontaPesquisa;
begin
  if ValidaControles then begin
    ZeraContadores;
    with dtmManutencaoCheques do begin
      dtmManutencaoCheques.fecha(ctManutencaoChequesPesquisa);
      if rbnChequeVista.Checked then
        dtmManutencaoCheques.porTipoCheque(0)
      else if rbnChequePrazo.Checked then
        dtmManutencaoCheques.porTipoCheque(1)
      else
        dtmManutencaoCheques.porTipoCheque(2);
      TipoOperacao := rgpOperacaoes.ItemIndex;
      porRemessa(edtNumero.Text);
      porDataRemessa(edtRemessa.Text);
      porFilial(flkFilial.Text);
      porCobrador(flkCobrador.Text, ckbChequesSemCobrador.Checked);
      porPeriodo(edtInicioPeriodo.Text,edtTerminoPeriodo.Text);
      if ExecutarConsultaCheque then
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
      AtualizarContadores(False);
    end;
  end;
end;

function TfrmManutencaoCheques.TabelaDePesquisa: TZDataSet;
begin
  with dtmManutencaoCheques do
    case TipoProcura of
      tpManutencaoChequesFiliais   : Result:= TabelaConsultaFiliais;
      tpManutencaoChequesCobradores: Result:= TabelaConsultaCobradores;
           tpManutencaoChequesBanco: Result:= TabelaConsultaAgencias;
           tpManutencaoChequesConta: Result:= qryconsultarContas;
      else                           Result:= Nil;
    end;
end;

procedure TfrmManutencaoCheques.dbgPesquisaTitleClick(Column: TColumn);
begin
  inherited;
  if AltOn then
  begin
    case Column.Index of
      7: begin
           Inc(IdxNome);
           if IdxNome < 1 then IdxNome:= 3;
           if IdxNome > 3 then IdxNome:= 1;
           case IdxNome of
             1: begin
                  dbgPesquisa.Columns[07].Title.Caption := 'Nome Cliente...';
                  dbgPesquisa.Columns[07].FieldName     := 'cliente';
                end;
             2: begin
                  dbgPesquisa.Columns[07].Title.Caption := 'Nome Titular...';
                  dbgPesquisa.Columns[07].FieldName     := 'titular';
                end;
             3: begin
                  dbgPesquisa.Columns[07].Title.Caption := 'Nome Cobrador...';
                  dbgPesquisa.Columns[07].FieldName     := 'cobrador';
                end;
           end;
         end;
      8: begin
           Inc(IdxRemessa);
           if IdxRemessa < 1 then IdxRemessa:= 2;
           if IdxRemessa > 2 then IdxRemessa:= 1;
           case IdxRemessa of
             1: begin
                  dbgPesquisa.Columns[08].Title.Caption := '1º Remessa';
                  dbgPesquisa.Columns[08].FieldName     := 'primeiraremessa';
                end;
             2: begin
                  dbgPesquisa.Columns[08].Title.Caption := '2º Remessa';
                  dbgPesquisa.Columns[08].FieldName     := 'segundaremessa';
                end;
           end;
         end;
    end;
  end;
end;

procedure TfrmManutencaoCheques.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE: FecharConsulta;
    VK_F5: if sbnConfirma.Enabled then sbnConfirmaClick(self);
    VK_F6: sbnGerarClick(sbnGerar);
  end;
  inherited;
end;

procedure TfrmManutencaoCheques.sbnProcurarFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkFilial.setfocus;
  InternoPesquisar('');
end;

procedure TfrmManutencaoCheques.sbnProcurarCobradorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkCobrador.setfocus;
  InternoPesquisar('');
end;

procedure TfrmManutencaoCheques.AtribuirRemessa;
begin
  with dtmManutencaoCheques do begin
    AtribuirRemessa;
    ExecutarConsultaCheque;
    ckbSelecionarTodos.Checked:= False;
  end;  
end;

procedure TfrmManutencaoCheques.DevolverCheque;
begin
  frmLerDadosDefinirMotivo := TfrmLerDadosDefinirMotivo.Create(Self);
  if frmLerDadosDefinirMotivo.ShowModal = mrok then
    dtmManutencaoCheques.DevolverCheque(frmLerDadosDefinirMotivo.Data,
                                        frmLerDadosDefinirMotivo.Motivo);
  frmLerDadosDefinirMotivo.Free;
  dtmManutencaoCheques.ExecutarConsultaCheque;
end;

procedure TfrmManutencaoCheques.sbnGerarClick(Sender: TObject);
begin
  inherited;
  MontaPesquisa;
end;

procedure TfrmManutencaoCheques.edtterminoPeriodoEnter(Sender: TObject);
begin
  inherited;
  if edtInicioPeriodo.Text <> '' then
    edtterminoPeriodo.Minimo:= DaysBetween(Date,StrToDate(edtInicioPeriodo.Text));
end;

procedure TfrmManutencaoCheques.actHabilitaUpdate(Sender: TObject);
begin
  inherited;
  sbnConfirma.Enabled  := (dtmManutencaoCheques.QtdeMarcados > 0);
  if (rgpOperacaoes.ItemIndex = 3) then
       gbxPeriodo.Caption:= 'DATAS DE DEVOLUÇÃO'
  else gbxPeriodo.Caption:= 'DATAS DE VENCIMENTO';
  rgbTipoCheque.Enabled:= (rgpOperacaoes.ItemIndex in [0,2]);
  gbxRemessa.Enabled   := (rgpOperacaoes.ItemIndex <> 0);
  if (rgpOperacaoes.ItemIndex = 0) then begin
    edtRemessa.Clear;
    edtNumero.Clear;
  end;
  gbxFilial.Enabled    := (rgpOperacaoes.ItemIndex in [0,3]);
  if not (rgpOperacaoes.ItemIndex in [0,3]) then begin
    flkFilial.Clear;
    dtxFilial.DataSource.DataSet.FieldByName('nome').Clear;
  end;
  gbxPeriodo.Enabled   := (rgpOperacaoes.ItemIndex in [0,2,3]);
  if not (rgpOperacaoes.ItemIndex in [0,2,3]) then begin
    edtInicioPeriodo.Clear;
    edtterminoPeriodo.Clear;
  end;

  gbxConta.Enabled := (rgpOperacaoes.ItemIndex = 0);
  if (rgpOperacaoes.ItemIndex <> 0) then begin
    flkConta.Clear;
    dtxDigito.DataSource.DataSet.FieldByName('Digito').Clear;
    dtxSigla.DataSource.DataSet.FieldByName('Sigla').Clear;
    dtxNomeAgencia.DataSource.DataSet.FieldByName('Nome').Clear;
  end;

  gbxCobrador.Enabled:= (rgpOperacaoes.ItemIndex = 3) and not ckbChequesSemCobrador.Checked;
  if (rgpOperacaoes.ItemIndex <> 3) or ckbChequesSemCobrador.Checked then begin
    flkCobrador.Clear;
    dtxCobrador.DataSource.DataSet.FieldByName('nome').Clear;
  end;
  ckbChequesSemCobrador.Enabled:= (rgpOperacaoes.ItemIndex = 3);
end;

procedure TfrmManutencaoCheques.dbgPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgPesquisa.DataSource.DataSet.FieldByName('marcar').AsBoolean then begin
    TDBGrid(Sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmManutencaoCheques.rgpOperacaoesClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoCheques.Fecha(ctManutencaoChequesPesquisa);
  ZeraContadores;
end;

procedure TfrmManutencaoCheques.sbnAtribuiCobradorClick(Sender: TObject);
begin
  inherited;
  AtribuirCobrador
end;

procedure TfrmManutencaoCheques.AtribuirCobrador;
begin
  frmLerDadosDefinicaoCobrador := TfrmLerDadosDefinicaoCobrador.Create(Self);
  if frmLerDadosDefinicaoCobrador.ShowModal = mrok then
    dtmManutencaoCheques.AtribuirCobrador(frmLerDadosDefinicaoCobrador.Cobrador);
  frmLerDadosDefinicaoCobrador.Free;
  dtmManutencaoCheques.ExecutarConsultaCheque;
end;

procedure TfrmManutencaoCheques.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  case rgpOperacaoes.ItemIndex of
    0 : AtribuirRemessa;
    1 : ExcluirRemessa;
    2 : DevolverCheque;
    3 : AtribuirCobrador;
  end;
end;

function TfrmManutencaoCheques.ValidaControles: Boolean;
var
  Ctrl: TWinControl;

  procedure RemoverControles;
  Var
    A: Integer;
  begin
    for A:= ecvValidar.EditionControl.Count-1 DownTo 0 do
      ecvValidar.EditionControl.Delete(A);
  end;

begin
  Result:= False;
  RemoverControles;
  if rgpOperacaoes.ItemIndex = 0 then begin
    TtecEditionControlItem(ecvValidar.EditionControl.Add).Control:= edtInicioPeriodo;
    TtecEditionControlItem(ecvValidar.EditionControl.Add).Control:= edtterminoPeriodo;
    TtecEditionControlItem(ecvValidar.EditionControl.Add).Control:= flkConta;
    Result:= ecvValidar.Verify(gbxFundoJanela, Ctrl);
    if Result then
       Result:= OperadorTernario(flkFilial.Text  <> '',flkFilial.Exist,True) and
                OperadorTernario(flkConta.Text <> '',flkConta.Exist,False);
  end
  else if rgpOperacaoes.ItemIndex = 1 then begin
    TtecEditionControlItem(ecvValidar.EditionControl.Add).Control:= edtRemessa;
    TtecEditionControlItem(ecvValidar.EditionControl.Add).Control:= edtNumero;
    Result:= ecvValidar.Verify(gbxFundoJanela, Ctrl);
  end
  else if rgpOperacaoes.ItemIndex = 2 then begin
    Result:= (edtInicioPeriodo.DataValida and edtterminoPeriodo.DataValida and edtRemessa.DataValida);
  end
  else if rgpOperacaoes.ItemIndex = 3 then begin
    Result:= (edtInicioPeriodo.DataValida and edtterminoPeriodo.DataValida and edtRemessa.DataValida) and
              OperadorTernario(flkFilial.Text <> '', flkFilial.Exist, True);
    if Result then
      if not ckbChequesSemCobrador.Checked then begin
        TtecEditionControlItem(ecvValidar.EditionControl.Add).Control:= flkCobrador;
        Result:= ecvValidar.Verify(gbxFundoJanela, Ctrl);
        if Result then
          OperadorTernario(flkCobrador.Text <> '', flkCobrador.Exist, False)
      end;
  end;
end;

procedure TfrmManutencaoCheques.dbgPesquisaDblClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoCheques.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure TfrmManutencaoCheques.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmManutencaoCheques do begin
    if not SoMarcados then begin
      edtQtdeCheques.Text  := IntToStr(QtdeCheques);
      edtTotalCheques.Text := Format('%8.2m', [TotalCheques]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure TfrmManutencaoCheques.dbgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if (Shift = [ssCtrl]) then begin
      dtmManutencaoCheques.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure TfrmManutencaoCheques.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoCheques.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure TfrmManutencaoCheques.ZeraContadores;
begin
  with dtmManutencaoCheques do begin
    ckbSelecionarTodos.Checked :=False;
    MarcarSelecionados(ckbSelecionarTodos.Checked, true);
    AtualizarContadores(False);
  end;
end;

procedure TfrmManutencaoCheques.ExcluirRemessa;
begin
  with dtmManutencaoCheques do begin
    ExcluirRemessa(edtRemessa.Text,edtNumero.Text);
    ExecutarConsultaCheque;
  end;
end;

procedure TfrmManutencaoCheques.FecharConsulta;
begin
  dtmManutencaoCheques.Fecha(ctManutencaoChequesPesquisa)
end;

function TfrmManutencaoCheques.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  case Parametro of
    0 :  Result:= dtmManutencaoCheques.TabelaConsultaBancos;
    else Result:= nil;
  end;
end;

procedure TfrmManutencaoCheques.PosicionarTabelaNoParametro(Ind: Integer; var continuar: Boolean);
begin
  inherited;
  case TipoProcura of
    tpManutencaoChequesBanco: begin
                                case Ind of
                                  0:   Continuar := dtmManutencaoCheques.PosicionarBanco;
                                  else Continuar := False;
                                end;
                              end;
  end;
end;


procedure TfrmManutencaoCheques.flkAgenciaFound(Found: Boolean);
begin
  inherited;
  with dtmManutencaoCheques do
    ReFazConsulta(qryProcurarContas,[0,1],[qryAgenciasBanco.AsInteger, qryAgenciasCodigo.AsInteger]);
end;

procedure TfrmManutencaoCheques.sbnProcurarContaClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkConta.setfocus;
  InternoPesquisar('');
end;

end.
