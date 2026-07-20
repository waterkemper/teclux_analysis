unit fmrepassecheques;

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
  dmrepassecheques, cpdbradiogroup, ComCtrls, ActnList, DB,
  ZPgSqlQuery, cpquery, frconsulta, frconsultacodigo, frlistafiliais,
  cpdbdata, cpdbmemo, fmcadastrochequesrepassados, fmcadastrocheques,
  ToolWin;

type
  Tfrmrepassecheques = class(TfrmCadastroPadrao)
    gbxFundoJanela: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtterminoPeriodo: TEditData;
    edtInicioPeriodo: TEditData;
    bvlCheques: TBevel;
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    aclHabilita: TActionList;
    actHabilita: TAction;
    dbgPesquisa: TtecDBGrid;
    gbxSelecionados: TGroupBox;
    edtQtdeCheques: TEditNumero;
    edtQtdeMarcados: TEditNumero;
    gbxMarcados: TGroupBox;
    edtTotalCheques: TEditNumero;
    edtTotalMarcados: TEditNumero;
    ckbSelecionarTodos: TCheckBox;
    svdCaminho: TSaveDialog;
    lblA: TLabel;
    gbxQtdeMarcados: TGroupBox;
    gbxValorMarcados: TGroupBox;
    gbxQtdeSelecionados: TGroupBox;
    gbxValorSelecionados: TGroupBox;
    fraListaFiliais1: TfraListaFiliais;
    gbxCliente: TGroupBox;
    fraConsultaClientes: TfraConsultaCodigo;
    gbxBanco: TGroupBox;
    fraConsultaBancos: TfraConsultaCodigo;
    gbxFaixaValores: TGroupBox;
    Label1: TLabel;
    edtValorInicial: TEditNumero;
    edtValorFinal: TEditNumero;
    pgcRepasseCheques: TPageControl;
    tstCadastro: TTabSheet;
    tstSelecao: TTabSheet;
    gbxNumero: TGroupBox;
    edfNumeroRepasse: TtecDbEditFind;
    gbxDataEmissao: TGroupBox;
    edtDataEmissao: TDBEditData;
    gbxFornecedor: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    gbxCheque: TGroupBox;
    dbgChequesRepassados: TtecDBGrid;
    gbxObservacao: TGroupBox;
    mmoObservacaoRepasse: TtecDBMemo;
    sbnImprimir: TSpeedButton;
    pnlOpcoesRepasseCheques: TPanel;
    sbnIncluirDuplicatas: TSpeedButton;
    sbnExcluirChequesRepassados: TSpeedButton;
    sbnConfirma: TSpeedButton;
    sbnDevolverChequeRepassado: TSpeedButton;
    gbxRepassadoPor: TGroupBox;
    lblDataRepassadoPor: TLabel;
    dtxNomeRepassador: TtecDBText;
    dtxCodigoRepassador: TtecDBText;
    dtxDataRepasse: TtecDBText;
    gbxExcluidoPor: TGroupBox;
    Label4: TLabel;
    dtxNomeExcluidor: TtecDBText;
    dtxCodigoExcluidor: TtecDBText;
    dtxDataExclusao: TtecDBText;
    GroupBox2: TGroupBox;
    dtxQuantidadeRepasse: TDBEditNumero;
    GroupBox3: TGroupBox;
    dtxTotalRepasse: TDBEditNumero;
    GroupBox4: TGroupBox;
    dtxQuantidadeRepasseCancelado: TDBEditNumero;
    GroupBox5: TGroupBox;
    dtxTotalRepasseCancelado: TDBEditNumero;
    gbxTotais: TGroupBox;
    gbxCancelados: TGroupBox;
    gbxSituacao: TGroupBox;
    gbxSaldos: TGroupBox;
    GroupBox6: TGroupBox;
    dtxSaldoQuantidadeRepasse: TDBEditNumero;
    GroupBox7: TGroupBox;
    dtxSaldoTotalRepasse: TDBEditNumero;
    dtxSituacao: TtecDBText;
    lblChequesEmVermelho: TLabel;
    gbxConsultaFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    procedure sbnGerarClick(Sender: TObject);
    procedure edtterminoPeriodoEnter(Sender: TObject);
    procedure actHabilitaUpdate(Sender: TObject);
    procedure dbgPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure dbgPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbSelecionarTodosClick(Sender: TObject);
    procedure sbnConfirmaClick(Sender: TObject);
    procedure pgcRepasseChequesChange(Sender: TObject);
    procedure sbnExcluirChequesRepassadosClick(Sender: TObject);
    procedure sbnDevolverChequeRepassadoClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure sbnIncluirDuplicatasClick(Sender: TObject);
    procedure dbgChequesRepassadosDblClick(Sender: TObject);
    procedure dbgChequesRepassadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnProcurarClick(Sender: TObject);
    procedure dbgChequesRepassadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  protected
    ConsultaRepasseCheques : TfraConsultaCodigo;
    procedure AbrirRepasseCheques(Found: Boolean);

    procedure MontaPesquisa(Exibirmsg: boolean = true);
    function  ValidaControles: Boolean;
    procedure AtualizarContadores(SoMarcados: Boolean);
    procedure ZeraContadores;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure AtribuirDadosFornecedor(Found: Boolean);
    procedure AtribuirParametrosConsultaFornecedor;
    procedure ExcluirChequeRepassado;
    procedure ReatualizarCadastrodeCheques;

  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmrepassecheques: Tfrmrepassecheques;

implementation

uses
  //Repositorio
  fmlerdata, fmlerdatanumero, fmlerdadosdefinicaocobrador, fmlerdadosdefinirmotivo;

{$R *.dfm}

{ Tfrmrepassecheques }

constructor Tfrmrepassecheques.Create(AOwner: TComponent);
begin
  dtmrepassecheques := Tdtmrepassecheques.Create(Self);
  inherited;
  DataSet := dtmrepassecheques.qryRepasseCheques;

  pgcRepasseCheques.ActivePage := tstSelecao;

  edtInicioPeriodo.Text  := DateToStr(Date);
  edtterminoPeriodo.Text := DateToStr(Date);

  fraConsultaFilial.TipoPesquisa := pesFILIAIS;

  fraConsultaClientes.TipoPesquisa    := pesCLIENTES;

  if fraConsultaClientes.TipoCliente = '' then
    fraConsultaClientes.TipoCliente := 'C';


  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.TipoPesquisa  := pesFORNECEDORES;
  fraconsultafornecedor.OnFound := AtribuirDadosFornecedor;
  fraconsultafornecedor.CondicoesdaConsulta := AtribuirParametrosConsultaFornecedor;

  fraConsultaBancos.TipoPesquisa    := pesBANCOS;

  ConsultaRepasseCheques := TfraConsultaCodigo.Create(self);
  ConsultaRepasseCheques.edfCodigo.DataSource := dtmrepassecheques.dsrRepasseCheques;
  ConsultaRepasseCheques.edfCodigo.DataField := 'numero';
  ConsultaRepasseCheques.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaRepasseCheques.AbrirTabelaProcura := false;
  ConsultaRepasseCheques.TipoCliente := 'F';
//  ConsultaRepasseCheques.Tipovfornecedor := 'C';
  ConsultaRepasseCheques.TipoPesquisa := pesRepasseCheques;
  ConsultaRepasseCheques.OnFound := AbrirRepasseCheques;
  ConsultaRepasseCheques.Name := 'fraConsultaRepasseCheques';



  pgcRepasseChequesChange(nil);

  dbgChequesRepassados.OnDelete := ExcluirChequeRepassado;

end;

destructor Tfrmrepassecheques.Destroy;
begin
  dtmrepassecheques:=nil;
  inherited;
  frmrepassecheques := Nil;
end;



procedure Tfrmrepassecheques.MontaPesquisa(Exibirmsg: boolean = true);
begin
  if ValidaControles then
  begin
    ZeraContadores;
    with dtmrepassecheques do
    begin
      if not ExecutarConsultaCheque(fraListaFiliais1.ListaSelecionada,
                                edtInicioPeriodo.Text,
                                edtterminoPeriodo.Text,
                                fraConsultaClientes.edfcodigo.text,
                                fraConsultaClientes.qryProcuraClientetipo.AsString,
                                fraConsultaBancos.edfcodigo.text,
                                edtValorInicial.valorsemformatacao,
                                edtValorFinal.valorsemformatacao) then
      begin
        if Exibirmsg then
          MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
      end;
      AtualizarContadores(False);
    end;
  end;
end;


procedure Tfrmrepassecheques.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case key of
    VK_F5: if pgcRepasseCheques.ActivePage = tstSelecao  then
            begin
               if sbnConfirma.Enabled then sbnConfirmaClick(nil);
            end   
            else
               if sbnSalvar.Enabled then sbnSalvarClick(nil);

    VK_F6: case pgcRepasseCheques.ActivePageIndex of
              0  : if sbnGerar.enabled then sbnGerarClick(nil);
              1  : if sbnExcluir.enabled then sbnExcluirClick(nil);
            end;
    VK_F7: if (sbnImprimir.Enabled) {and (pgcRepasseCheques.ActivePage = tstCadastro)} then
                sbnImprimirClick(nil);

    VK_F9: begin
              if not CtrlOn then
              begin
                if sbnProcurar.Enabled then
                begin
                  ConsultaRepasseCheques.InternoPesquisar('Repasse Cheques');
                  self.SetFocus;
                end
              end;
            end;
    else
     inherited;
  end;
end;



procedure Tfrmrepassecheques.sbnGerarClick(Sender: TObject);
begin
  inherited;
  MontaPesquisa;
end;

procedure Tfrmrepassecheques.edtterminoPeriodoEnter(Sender: TObject);
begin
  inherited;
  if edtInicioPeriodo.Text <> '' then
    edtterminoPeriodo.Minimo:= DaysBetween(Date,StrToDate(edtInicioPeriodo.Text));
end;

procedure Tfrmrepassecheques.actHabilitaUpdate(Sender: TObject);
begin
  inherited;
  sbnConfirma.Enabled  := (dtmrepassecheques.QtdeMarcados > 0);
  sbnImprimir.Enabled := not sbnSalvar.Enabled and (dtmrepassecheques.qryRepasseCheques.RecordCount<>0) and (dtmrepassecheques.qryChequesRepassados.RecordCount<>0);
  sbnExcluirChequesRepassados.enabled := not dtmrepassecheques.qryChequesRepassados.ReadOnly and (dtmrepassecheques.qryChequesRepassados.RecordCount<>0);
  sbnDevolverChequeRepassado.enabled := dtmrepassecheques.qryChequesRepassadosdevolvido.IsNull and
                                        (dtmrepassecheques.qryChequesRepassados.RecordCount<>0) and
                                        not (dtmrepassecheques.qryRepasseCheques.State = dsInsert);
  sbnIncluirDuplicatas.enabled := not dtmrepassecheques.qryChequesRepassados.ReadOnly;

  sbnExcluir.Enabled := not (dtmrepassecheques.qryRepasseCheques.state = dsinsert) and
                        (dtmrepassecheques.qryRepasseChequesexcluido.IsNull) and
                        (dtmrepassecheques.qryRepasseCheques.RecordCount = 1);

  if (dtmrepassecheques.qryRepasseChequessituacao.asstring = 'CANCELADO') or
     (dtmrepassecheques.qryRepasseChequessituacao.asstring = 'DEVOLVIDO') then
    dtxSituacao.Font.Color := clRed
  else
    dtxSituacao.Font.Color := clblue;

end;

procedure Tfrmrepassecheques.dbgPesquisaDrawColumnCell(Sender: TObject;
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


function Tfrmrepassecheques.ValidaControles: Boolean;
//var
//  Ctrl: TWinControl;
begin
//  Result:= ecvValidar.Verify(gbxFundoJanela, Ctrl);
//  if Result then
     Result:= OperadorTernario(fraConsultaClientes.edfCodigo.Text  <> '',fraConsultaClientes.edfCodigo.Exist,True) and
              OperadorTernario(fraConsultaBancos.edfCodigo.Text  <> '',fraConsultaBancos.edfCodigo.Exist,True);
end;

procedure Tfrmrepassecheques.dbgPesquisaDblClick(Sender: TObject);
begin
  inherited;
  dtmrepassecheques.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
  AtualizarContadores(True);
end;

procedure Tfrmrepassecheques.AtualizarContadores(SoMarcados: Boolean);
begin
  with dtmrepassecheques do begin
    if not SoMarcados then begin
      edtQtdeCheques.Text  := IntToStr(QtdeCheques);
      edtTotalCheques.Text := Format('%8.2m', [TotalCheques]);
    end;
    edtQtdeMarcados.Text  := IntToStr(QtdeMarcados);
    edtTotalMarcados.Text := Format('%8.2m', [TotalMarcados]);
  end;
end;

procedure Tfrmrepassecheques.dbgPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if (Shift = [ssCtrl]) then begin
      dtmrepassecheques.MarcarSelecionados(ckbSelecionarTodos.Checked, False);
      AtualizarContadores(True);
    end;
end;

procedure Tfrmrepassecheques.ckbSelecionarTodosClick(Sender: TObject);
begin
  inherited;
  dtmrepassecheques.MarcarSelecionados(ckbSelecionarTodos.Checked,True);
  AtualizarContadores(True);
end;

procedure Tfrmrepassecheques.ZeraContadores;
begin
  with dtmrepassecheques do begin
    ckbSelecionarTodos.Checked :=False;
    MarcarSelecionados(ckbSelecionarTodos.Checked, true);
    AtualizarContadores(False);
  end;
end;



procedure Tfrmrepassecheques.sbnConfirmaClick(Sender: TObject);
begin
  inherited;
  dtmrepassecheques.AtribuirDadosChequesemChequesRepassados(true);
  MontaPesquisa(false);
end;

function Tfrmrepassecheques.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    if dtmrepassecheques.ExcluirRepasseCheques then
    begin
      MontaPesquisa(false);
      ReatualizarCadastrodeCheques;
    end;
end;

function Tfrmrepassecheques.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
  begin
    dtmrepassecheques.GravarRepasseCheques;
    ReatualizarCadastrodeCheques;
  end;

  actHabilitaUpdate(nil);
end;

function Tfrmrepassecheques.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
    begin
      dtmrepassecheques.IncluirRepasse;
      edtDataEmissao.SetFocus;
      edtDataEmissao.SelectAll;
    end;
  end;

end;

procedure Tfrmrepassecheques.pgcRepasseChequesChange(Sender: TObject);
begin
  inherited;

  if pgcRepasseCheques.ActivePage = tstSelecao then
  begin
    sbnIncluir.visible := false;
    sbnIncluir.left := 0;
    sbnIncluir.width := 0;

    sbnSalvar.Visible := false;
    sbnSalvar.left := 0;
    sbnSalvar.width := 0;

    sbnExcluir.Visible := false;
    sbnExcluir.left := 0;
    sbnExcluir.width := 0;

    sbnImprimir.visible := false;
    sbnImprimir.left := 0;
    sbnImprimir.width := 0;

    sbnconfirma.visible := true;
    sbnconfirma.left := 0;
    sbnconfirma.width := 75;

    sbnGerar.visible := true;
    sbnGerar.left := 75;
    sbnGerar.width := 75;
    
    tblBarraCadastro.Width := 150;
  end
  else
  begin
    sbnIncluir.visible := true;
    sbnIncluir.left := 0;
    sbnIncluir.width := 75;

    sbnSalvar.Visible := true;
    sbnSalvar.left := 75;
    sbnSalvar.width := 75;

    sbnExcluir.Visible := true;
    sbnExcluir.left := 150;
    sbnExcluir.width := 75;

    sbnImprimir.visible := true;
    sbnImprimir.left := 225;
    sbnImprimir.width := 75;

    sbnconfirma.visible := false;
    sbnconfirma.left := 300;
    sbnConfirma.width := 0;

    sbnGerar.visible := false;
    sbnGerar.left := 300;
    sbnGerar.width := 0;
  end;

  refresh;

end;

procedure Tfrmrepassecheques.sbnExcluirChequesRepassadosClick(
  Sender: TObject);
begin
  inherited;
  if dtmrepassecheques.ExcluirChequeRepassado then
    MontaPesquisa(false);

end;

procedure Tfrmrepassecheques.sbnDevolverChequeRepassadoClick(
  Sender: TObject);
begin
  inherited;
  if dtmrepassecheques.DevolverChequeRepassado then
  begin
    MontaPesquisa(false);
    ReatualizarCadastrodeCheques;
  end;
end;

procedure Tfrmrepassecheques.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmrepassecheques.ImprimirRepasse;
  dbgChequesRepassados.refresh;
end;

procedure Tfrmrepassecheques.sbnIncluirDuplicatasClick(Sender: TObject);
var
  frmCadastroChequesRepassados: TfrmCadastroChequesRepassados;
begin
  inherited;
  frmCadastroChequesRepassados := TfrmCadastroChequesRepassados.Create(self);
  dtmrepassecheques.IncluirChequesRepassados;
  frmCadastroChequesRepassados.ShowModal;
  frmCadastroChequesRepassados.free;


end;

procedure Tfrmrepassecheques.dbgChequesRepassadosDblClick(Sender: TObject);
begin
  inherited;
  if sbnIncluirDuplicatas.Enabled then
    sbnIncluirDuplicatasClick(nil);
end;

procedure Tfrmrepassecheques.dbgChequesRepassadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Shift = [ssCtrl] then begin
    case Key of
      TeclaEditarRegistro, 
      TeclaInserirRegistro:  if sbnIncluirDuplicatas.Enabled then sbnIncluirDuplicatasClick(nil);
    end;
  end;

end;

procedure Tfrmrepassecheques.AtribuirDadosFornecedor(Found: Boolean);
begin
  dtmrepassecheques.qryRepasseChequesnomefornecedor.asstring := fraConsultaFornecedor.qryProcuraClientenome.AsString;
  dtmrepassecheques.qryRepasseChequespessoanumero.AsString := FormatarCPFouCGC(fraConsultaFornecedor.qryProcuraClientepessoanumero.AsString);
  if fraconsultafornecedor.qryProcuraClientepessoatipo.AsString = 'F' then
    dtmrepassecheques.qryRepasseChequesnomepessoanumero.AsString := 'CPF'
  else dtmrepassecheques.qryRepasseChequesnomepessoanumero.AsString := 'CNPJ';
end;

procedure Tfrmrepassecheques.AbrirRepasseCheques(Found: Boolean);
begin
  pgcRepasseCheques.ActivePage := tstCadastro;
  edfNumeroRepasse.Text := ConsultaRepasseCheques.ValorSelecionado;
  dtmrepassecheques.
        refazconsulta(dtmrepassecheques.qryRepasseCheques,[0],
             [ConsultaRepasseCheques.ValorSelecionado]);
end;

procedure Tfrmrepassecheques.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaRepasseCheques.InternoPesquisar('Repasse de Cheques');
  self.SetFocus;
end;

procedure Tfrmrepassecheques.AtribuirParametrosConsultaFornecedor;
begin
  fraConsultaFornecedor.qryProcuraCliente.ParamByName('tipocliente').AsString := dtmrepassecheques.TipoFornecedor;
end;

procedure Tfrmrepassecheques.ExcluirChequeRepassado;
begin
  if sbnExcluirChequesRepassados.Enabled then
   dtmrepassecheques.ExcluirChequeRepassado;
end;

procedure Tfrmrepassecheques.dbgChequesRepassadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (dbgChequesRepassados.DataSource.DataSet.FieldByName('devolvedor').Asinteger<>0) then begin
    TDBGrid(Sender).Canvas.Font.Color := clRed
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure Tfrmrepassecheques.ReatualizarCadastrodeCheques;
var
  Frm: TForm;
begin
  Frm := TfrmCadastroCheques.Referencia;
  if Assigned(Frm) then
    TfrmCadastroCheques(Frm).SelecionarCheque(dtmrepassecheques.ListadeCheques);
end;

end.
