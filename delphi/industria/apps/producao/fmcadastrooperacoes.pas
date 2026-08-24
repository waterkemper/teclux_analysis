unit fmcadastrooperacoes;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, windows,
  StdCtrls, dmcadastrooperacoes, fmcadastropadrao, DBCtrls, cptexto, variants,
  Mask, cpdbfindcontrols, ComCtrls, Buttons, ExtCtrls, cpnumero, db, biblio,
  Grids, DBGrids, cpdbgrid, frconsulta, frconsultacodigo, cpdbmemo, ctconstantes,
  cpdbtext, cpdbdata, ToolWin, frRegistroOperacoes, ZQuery, ZPgSqlQuery,
  cpquery, fmImprimirOperacoes, ActnList;

type
  TfrmCadastroOperacoes = class(TfrmCadastroPadrao)
    gbxNome: TGroupBox;
    edfNome: TtecDbEditFind;
    gbxc11: TGroupBox;
    edfc1: TtecDbEditFind;
    edfdescricaoc1: TDBEditTexto;
    gbxc21: TGroupBox;
    edfc2: TtecDbEditFind;
    edfdescricaoc2: TDBEditTexto;
    gbxc31: TGroupBox;
    edfc3: TtecDbEditFind;
    edfdescricaoc3: TDBEditTexto;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
    ckbNecessitaSetup: TDBCheckBox;
    ckbNecessitaPlanoControle: TDBCheckBox;
    gbxppmMax: TGroupBox;
    edtPPM: TDBEditNumero;
    gbxOperadores: TGroupBox;
    edtNrOperadores: TDBEditNumero;
    gbxNecessita: TGroupBox;
    gbxNiveisOperadores: TGroupBox;
    dbgOperacoesNiveisSalariais: TtecDBGrid;
    pnlOpcoesFuncionarios: TPanel;
    sbnExcluirFuncionarios: TSpeedButton;
    pgcOperacoes: TPageControl;
    tstOperacoes: TTabSheet;
    tstSetup: TTabSheet;
    gbxDescricaoSetup1: TGroupBox;
    dbgDescricaoSetup: TtecDBGrid;
    pnlDescricaoSetup: TPanel;
    gbxDescricaoSetup: TGroupBox;
    mmoDescricaoSetup: TtecDBMemo;
    gbxC1: TGroupBox;
    gbxC2: TGroupBox;
    gbxC3: TGroupBox;
    Shape1: TShape;
    Shape2: TShape;
    lblV1: TLabel;
    lblV2: TLabel;
    gbxCaracteristicas: TGroupBox;
    sbnIncluirSetup: TSpeedButton;
    tstControleProcesso: TTabSheet;
    gbxRevisao_1: TGroupBox;
    gbxResponsavel_1: TGroupBox;
    gbxEquipe_1: TGroupBox;
    tstFMEA: TTabSheet;
    dbgFMEA: TtecDBGrid;
    gbxCausasMecanismos: TGroupBox;
    edtRevisao: TDBEditData;
    edtResponsavel: TDBEditTexto;
    edtEquipe: TDBEditTexto;
    sbnIncluirProcessosControle: TSpeedButton;
    GBXMetodosControle: TGroupBox;
    GBXtoleranciaespecproduto: TGroupBox;
    GBXtecnicaavaliacaomedicao: TGroupBox;
    GBXtamanho: TGroupBox;
    GBXfrequencia: TGroupBox;
    MMOtoleranciaespecproduto: TtecDBMemo;
    MMOtecnicaavaliacaomedicao: TtecDBMemo;
    MMOtamanho: TtecDBMemo;
    mmofrequencia: TtecDBMemo;
    pnlOperacoesProcessoControle: TPanel;
    pnlOperacoesProcessos: TPanel;
    pnlOperacoesProcessosFMEA: TPanel;
    gbxRevisao_1FMEA: TGroupBox;
    edtRevisaoFMEA: TDBEditData;
    gbxResponsavel_1FMEA: TGroupBox;
    edtResponsavelFMEA: TDBEditTexto;
    gbxEquipe_1FMEA: TGroupBox;
    edtEquipeFMEA: TDBEditTexto;
    pnlRodapeOperacoesProcessoControle: TPanel;
    Shape3: TShape;
    lblReverProcessoControle: TLabel;
    ckbNaoBloqueiaUsuario: TDBCheckBox;
    gbxRegua_1: TGroupBox;
    gbxRegua_3: TGroupBox;
    GroupBox1: TGroupBox;
    tstFalhasAssociadas: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    edtDescricao_2: TDBEditTexto;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    gbxFalhasAssociadas: TGroupBox;
    Bevel1: TBevel;
    dbgFalhasAssociadas: TtecDBGrid;
    pnlOperacoes: TPanel;
    sbnIncluirFalha: TSpeedButton;
    sbnExcluirFalha: TSpeedButton;
    edtNome_2: TDBEditTexto;
    edtC1_2: TDBEditTexto;
    edtC2_2: TDBEditTexto;
    edtC3_2: TDBEditTexto;
    gbxMaquinas: TGroupBox;
    dbgOperacoesMaquinas: TtecDBGrid;
    Panel1: TPanel;
    sbnExcluirMaquinasAssociadasaOperacao: TSpeedButton;
    sbnIncluirMaquinasAssociadasaOperacao: TSpeedButton;
    pgcMaquina_PlanosControle: TPageControl;
    tstMaquinaDispositivo: TTabSheet;
    tstPlanoControle: TTabSheet;
    dbgMaquinaDispositivo: TtecDBGrid;
    dbgPlanoControle: TtecDBGrid;
    gbxTolerancia: TGroupBox;
    gbxAvaliacao: TGroupBox;
    gbxTamanho_: TGroupBox;
    gbxFrequencia_: TGroupBox;
    lblMaquinaDispositivo: TGroupBox;
    gbxCaracterisitcaProduto: TGroupBox;
    lblTipoRegistro: TGroupBox;
    GroupBox7: TGroupBox;
    lblCaracProduto: TLabel;
    Label1: TLabel;
    fraRegistroOperacoes1: TfraRegistroOperacoes;
    sbnImprimir: TSpeedButton;
    gbxTemposPadrao: TGroupBox;
    dbgTemposPadrao: TtecDBGrid;
    Panel2: TPanel;
    sbnIncluirTemposPadrao: TSpeedButton;
    sbnExcluirTemposPadrao: TSpeedButton;
    gbxNrOperadores: TGroupBox;
    lblPPMax: TLabel;
    sbnCopiarOperacao: TSpeedButton;
    ActionList1: TActionList;
    ActEstadosBotoes: TAction;
    procedure dbgOperacoesNiveisSalariaisDblClick(Sender: TObject);
    procedure dbgOperacoesNiveisSalariaisKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure sbnExcluirFuncionariosClick(Sender: TObject);
    procedure sbnExcluirOperacoesSetupClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure sbnIncluirSetupClick(Sender: TObject);
    procedure dbgDescricaoSetupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfc3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnIncluirProcessosControleClick(Sender: TObject);
    procedure dbgPlanoControleDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgPlanoControleDblClick(Sender: TObject);
    procedure dbgPlanoControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnIncluirFMEAClick(Sender: TObject);
    procedure dbgFMEAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfCopiaC3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFalhasAssociadasDblClick(Sender: TObject);
    procedure dbgOperacoesMaquinasDblClick(Sender: TObject);
    procedure dbgOperacoesMaquinasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnExcluirMaquinasAssociadasaOperacaoClick(Sender: TObject);
    procedure sbnIncluirMaquinasAssociadasaOperacaoClick(Sender: TObject);
    procedure sbnIncluirFalhaClick(Sender: TObject);
    procedure sbnExcluirFalhaClick(Sender: TObject);
    procedure dbgFalhasAssociadasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnImprimirClick(Sender: TObject);
    procedure dbgTemposPadraoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnIncluirTemposPadraoClick(Sender: TObject);
    procedure sbnExcluirTemposPadraoClick(Sender: TObject);
    procedure ActEstadosBotoesUpdate(Sender: TObject);
    procedure sbnCopiarOperacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure CondicoesOperacoesNiveisSalariais;
    procedure OperacoesNiveisSalariaisNewRecord(Sender: TObject);
    procedure AcionarPesquisaGradeNivelSalarial;
    procedure AcionarPesquisaOperacoesMaquinas;

//    procedure ZerarCamposChave;
    function VerificarNiveisSalariais: boolean;
    function VerificarMaquinas: boolean;


  protected
    ConsultaFalhas,
    ConsultaOperacoes : TfraConsultaCodigo;
    ConsultaNiveisSalariais : TfraConsultaCodigo;
    ConsultaMaquinas: TfraConsultaCodigo;
//    ConsultaTemposPadrao: TfraConsultaCodigo;

    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AbrirOperacoes(Found: Boolean);
    procedure AtribuirDadosOperacoesNiveisSalariais(Found: Boolean);
    procedure CondicoesFalhasOperacoes;
    procedure CondicoesMaquinas;

    procedure AtribuirDadosFalhasOperacoes(Found: Boolean);
    procedure AtribuirDadosMaquinas(Found: Boolean);

    procedure AcionarPesquisaGradeFalhas;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroOperacoes: TfrmCadastroOperacoes;

implementation

uses fmOpcoesCopiarOperacoes;

{$R *.dfm}

{ TfrmCadastroOperacoes }

procedure TfrmCadastroOperacoes.AbrirOperacoes(Found: Boolean);
begin
  edfNome.Text := ConsultaOperacoes.qryProcuraOperacoesnome.AsString;
  edfc1.Text := ConsultaOperacoes.qryProcuraOperacoesc01.AsString;
  edfc2.Text := ConsultaOperacoes.qryProcuraOperacoesc02.AsString;
  edfc3.Text := ConsultaOperacoes.qryProcuraOperacoesc03.AsString;
  dtmCadastroOperacoes.
        refazconsulta(dtmCadastroOperacoes.qryOperacoes,[0,1,2,3],
             [ConsultaOperacoes.qryProcuraOperacoesnome.AsString,
              ConsultaOperacoes.qryProcuraOperacoesc01.AsString,
              ConsultaOperacoes.qryProcuraOperacoesc02.AsString,
              ConsultaOperacoes.qryProcuraOperacoesc03.AsString]);
end;

procedure TfrmCadastroOperacoes.AtribuirDadosOperacoesNiveisSalariais(Found: Boolean);
begin
  with dtmCadastroOperacoes do
  begin
    EditarOperacoesNiveisSalariais;
    qryOperacoesNiveisSalariaisdescricao.AsString := ConsultaNiveisSalariais.qryProcuraNivelSalarialdescricao.AsString;
    qryOperacoesNiveisSalariaisnivelsalarial.AsString := ConsultaNiveisSalariais.qryProcuraNivelSalarialcodigo.AsString;
  end;
end;

procedure TfrmCadastroOperacoes.CondicoesOperacoesNiveisSalariais;
const
  SQL = 'and (codigo not in (%s) or codigo = %s)';
var
  codigoproduto : String;
begin
   codigoproduto := '0';
   if (dtmCadastroOperacoes.qryOperacoesNiveisSalariais.State = dsInsert) or
      (dtmCadastroOperacoes.qryOperacoesNiveisSalariaisdescricao.AsString='') then
     codigoproduto := '0'
   else
   if dtmCadastroOperacoes.qryOperacoesNiveisSalariaisauxnivelsalarial.Asinteger =
      dtmCadastroOperacoes.qryOperacoesNiveisSalariaisnivelsalarial.Asinteger then
     codigoproduto := inttostr(dtmCadastroOperacoes.qryOperacoesNiveisSalariaisnivelsalarial.Asinteger)
   else
   if pos(','+dtmCadastroOperacoes.qryOperacoesNiveisSalariaisnivelsalarial.Asstring+',',
          dtmCadastroOperacoes.FListaNiveisSelecionadoscomvirgula)<>0 then
     codigoproduto := '0';

   ConsultaNiveisSalariais.qryProcuraNivelSalarial.MacroByName('SQLNiveisJaSelecionados').AsString :=
     format(SQL,[dtmCadastroOperacoes.ListaNiveisSelecionados, codigoproduto]);
   ConsultaNiveisSalariais.qryConsultaNivelSalarial.MacroByName('SQLNiveisJaSelecionados').AsString :=
     format(SQL,[dtmCadastroOperacoes.ListaNiveisSelecionados, codigoproduto]);
end;

constructor TfrmCadastroOperacoes.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroOperacoes := TdtmCadastroOperacoes.Create(Self);
  DataSet := dtmCadastroOperacoes.qryOperacoes;

  ConsultaOperacoes := TfraConsultaCodigo.Create(self);
  ConsultaOperacoes.edfCodigo.DataSource := dtmCadastroOperacoes.dsrOperacoes;
  ConsultaOperacoes.edfCodigo.DataField := 'codigo';
  ConsultaOperacoes.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaOperacoes.AbrirTabelaProcura := false;
  ConsultaOperacoes.TipoPesquisa := pesOPERACOES;
  ConsultaOperacoes.OnFound := AbrirOperacoes;
  ConsultaOperacoes.Name := 'fraConsultaOperacoes';

  ConsultaNiveisSalariais := TfraConsultaCodigo.Create(self);
  ConsultaNiveisSalariais.Name := 'fraConsultaNiveisSalariais';
  ConsultaNiveisSalariais.edfCodigo.MaxLength := 3;
  ConsultaNiveisSalariais.edfCodigo.DataSource := dtmCadastroOperacoes.dsrOperacoesNiveisSalariais;
  ConsultaNiveisSalariais.edfCodigo.DataField := 'nivelsalarial';
  ConsultaNiveisSalariais.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaNiveisSalariais.edfCodigo.LookupSource := ConsultaNiveisSalariais.dsrProcuraNivelSalarial;
  ConsultaNiveisSalariais.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaNiveisSalariais.edfCodigo.LookupField := 'Codigo';
  ConsultaNiveisSalariais.AbrirTabelaProcura := false;
  ConsultaNiveisSalariais.CondicoesdaConsulta := CondicoesOperacoesNiveisSalariais;
  ConsultaNiveisSalariais.TipoPesquisa := pesNIVELSALARIAL;
  ConsultaNiveisSalariais.OnFound := AtribuirDadosOperacoesNiveisSalariais;

  ConsultaFalhas := TfraConsultaCodigo.Create(self);
  ConsultaFalhas.Name := 'fraConsultaFalhas';
  ConsultaFalhas.edfCodigo.MaxLength := 3;
  ConsultaFalhas.edfCodigo.DataSource := dtmCadastroOperacoes.dsrFalhasOperacoes;
  ConsultaFalhas.edfCodigo.DataField := 'falha';
  ConsultaFalhas.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaFalhas.edfCodigo.LookupSource := ConsultaFalhas.dsrProcuraFalhas;
  ConsultaFalhas.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaFalhas.edfCodigo.LookupField := 'Codigo';
  ConsultaFalhas.AbrirTabelaProcura := false;
  ConsultaFalhas.CondicoesdaConsulta := CondicoesFalhasOperacoes;
  ConsultaFalhas.TipoPesquisa := pesFALHAS;
  ConsultaFalhas.OnFound := AtribuirDadosFalhasOperacoes;

  ConsultaMaquinas := TfraConsultaCodigo.Create(self);
  ConsultaMaquinas.Name := 'fraConsultaMaquina';
  ConsultaMaquinas.edfCodigo.MaxLength := 3;
  ConsultaMaquinas.edfCodigo.DataSource := dtmCadastroOperacoes.dsrOperacoesMaquinas;
  ConsultaMaquinas.edfCodigo.DataField := 'maquina';
  ConsultaMaquinas.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaMaquinas.edfCodigo.LookupSource := ConsultaMaquinas.dsrProcuraMaquinas;
  ConsultaMaquinas.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaMaquinas.edfCodigo.LookupField := 'Codigo';
  ConsultaMaquinas.AbrirTabelaProcura := false;
  ConsultaMaquinas.CondicoesdaConsulta := CondicoesMaquinas;
  ConsultaMaquinas.TipoPesquisa := pesMAQUINAS;
  ConsultaMaquinas.OnFound := AtribuirDadosMaquinas;

  dtmCadastroOperacoes.onOperacoesNiveisSalariaisNewRecord := OperacoesNiveisSalariaisNewRecord;
  dbgOperacoesNiveisSalariais.OnDelete := dtmCadastroOperacoes.ExcluirOperacoesNiveisSalariais;
  dbgDescricaoSetup.OnDelete := dtmCadastroOperacoes.ExcluirOperacoesSetup;

  dbgTemposPadrao.OnDelete := dtmCadastroOperacoes.ExcluirOperacoesTemposPadrao;
  dbgOperacoesMaquinas.OnDelete := dtmCadastroOperacoes.ExcluirOperacoesMaquinas;


  dbgPlanoControle.     OnDelete := dtmCadastroOperacoes.ExcluirProcessosControle;
  dbgMaquinaDispositivo.OnDelete := dtmCadastroOperacoes.ExcluirProcessosControle;
  dbgFalhasAssociadas.  OnDelete := dtmCadastroOperacoes.ExcluirFalhasOperacoes;

  pgcOperacoes.ActivePage := tstOperacoes;
  edfNome.SetFocus;
  edfNome.SelectAll;

end;

destructor TfrmCadastroOperacoes.Destroy;
begin
  dtmCadastroOperacoes.qryOperacoes.close;
  dtmCadastroOperacoes.qryOperacoesSetup.close;
  dtmCadastroOperacoes.qryOperacoesNiveisSalariais.close;
  dtmCadastroOperacoes := nil;
  inherited;
//  frmCadastroOperacoes := nil;
end;

function TfrmCadastroOperacoes.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroOperacoes.ExcluirOperacoes;
  end;
end;

function TfrmCadastroOperacoes.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    if dtmCadastroOperacoes.ValidarNiveisSalariais then
      dtmCadastroOperacoes.GravarOperacoes
    else
    begin
      MensagemAviso('O número de operadores difere do informado');
      edtNrOperadores.SetFocus;
    end;
end;

function TfrmCadastroOperacoes.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
    begin
      dtmCadastroOperacoes.IncluirOperacoes;
      edfNome.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroOperacoes.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin

    if (key =VK_F9) then
    begin
      if sbnProcurar.Enabled then
      begin
        ConsultaOperacoes.InternoPesquisar(ctoperacoes);
        self.SetFocus;
      end
    end;

    if (key =VK_F7) then
      if sbnImprimir.Enabled then
        sbnImprimirClick(frmImprimiroperacoes);

    if (key =VK_F4) then
      if sbnCopiarOperacao.Enabled then
        sbnCopiarOperacaoClick(frmOpcoesCopiarOperacoes);

  end;
end;

procedure TfrmCadastroOperacoes.OperacoesNiveisSalariaisNewRecord(
  Sender: TObject);
begin
  dbgOperacoesNiveisSalariais.SelectedIndex := 0;
end;

procedure TfrmCadastroOperacoes.dbgOperacoesNiveisSalariaisDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeNivelSalarial;
end;

procedure TfrmCadastroOperacoes.AcionarPesquisaGradeNivelSalarial;
begin
  dbgOperacoesNiveisSalariais.SetFocus;
  ConsultaNiveisSalariais.CtrlOn := True;
  ConsultaNiveisSalariais.InternoPesquisar(ctNIVELSALARIAL);
  dbgOperacoesNiveisSalariais.SetFocus;
  dbgOperacoesNiveisSalariais.SelectedIndex :=  0;
end;

procedure TfrmCadastroOperacoes.dbgOperacoesNiveisSalariaisKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);

begin
  if Shift = [ssCtrl] then
  begin
    case Key of
     VK_F9     : begin
                     ConsultaNiveisSalariais.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or ConsultaNiveisSalariais.CtrlOn then
                       AcionarPesquisaGradeNivelSalarial
                   end;
    end;
  end
  else
  case Key of
   VK_Return: if dbgOperacoesNiveisSalariais.SelectedIndex = 0 then
                begin
                  if VerificarNiveisSalariais then
                    dtmCadastroOperacoes.GravarOperacoesNiveisSalariais;
                end;
  end;
  inherited;
end;


procedure TfrmCadastroOperacoes.sbnExcluirFuncionariosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.ExcluirOperacoesNiveisSalariais;
end;

function TfrmCadastroOperacoes.VerificarNiveisSalariais: boolean;
begin
  result := true;
  ConsultaNiveisSalariais.edfCodigo.DoExit;
  if not ConsultaNiveisSalariais.qryProcuraNivelSalarial.IsEmpty then
    AtribuirDadosOperacoesNiveisSalariais(true)
  else
  begin
    result := false;
    dbgOperacoesNiveisSalariais.SetFocus;
    dbgOperacoesNiveisSalariais.SelectedIndex := 0;
  end;
end;


procedure TfrmCadastroOperacoes.sbnExcluirOperacoesSetupClick(Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.ExcluirOperacoesSetup;
end;

procedure TfrmCadastroOperacoes.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaOperacoes.InternoPesquisar(ctOPERACOES);
  self.SetFocus;
end;

procedure TfrmCadastroOperacoes.sbnIncluirSetupClick(Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.IncluirSetUp(False);
end;

procedure TfrmCadastroOperacoes.dbgDescricaoSetupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (shift = [ssCtrl]) and (key =VK_F3) then
    sbnIncluirSetup.Click;


end;

procedure TfrmCadastroOperacoes.edfc3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
{  if (Shift=[]) and (TeclaEnterOuReturn(key) or (key =VK_tab)) then
    dtmCadastroOperacoes.RefazConsultaOperacoes(edfNome.Text,edfc1.Text,edfc2.Text,edfc3.Text);}
end;
{
procedure TfrmCadastroOperacoes.ZerarCamposChave;
begin
  edfNome.Modified := true;
  edfc1.Modified   := true;
  edfc2.Modified   := true;
  edfc3.Modified   := true;
end;
}
procedure TfrmCadastroOperacoes.sbnIncluirProcessosControleClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.IncluirProcessosControle(False);

end;

procedure TfrmCadastroOperacoes.dbgPlanoControleDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dtmCadastroOperacoes.qryProcessosControlerevisar.AsBoolean then
    TDBGrid(Sender).Canvas.Font.Color := clRed
  else
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadastroOperacoes.dbgPlanoControleDblClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.MarcarDesmarcarRevisao;
end;

procedure TfrmCadastroOperacoes.dbgPlanoControleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (shift = [ssCtrl]) and (key =VK_F3) then
    sbnIncluirProcessosControle.Click;

  if (key =VK_space) and ctrlon then
    if dbgPlanoControle.SelectedIndex = 12 then
      dtmCadastroOperacoes.MarcarDesmarcarRevisao;


end;

procedure TfrmCadastroOperacoes.sbnIncluirFMEAClick(Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.IncluirProcessosControle(False);

end;

procedure TfrmCadastroOperacoes.dbgFMEAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (shift = [ssCtrl]) and (key =VK_F3) then
    sbnIncluirProcessosControle.Click;


end;

procedure TfrmCadastroOperacoes.edfCopiaC3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  if (key =VK_return) then
    if not fraConsultaOperacoes.qryProcuraOperacoes.isempty then
    begin
      if (MensagemConfirmacao('A importação dos processos de controle da operação:  '+
                              fraConsultaOperacoes.qryProcuraOperacoesnome.AsString + ' '+
                              fraConsultaOperacoes.qryProcuraOperacoesc01.AsString + ' ' +
                              fraConsultaOperacoes.qryProcuraOperacoesc02.AsString + ' ' +
                              fraConsultaOperacoes.qryProcuraOperacoesc03.AsString) = smbOk) then
        dtmCadastroOperacoes.importarprocessoscontrole(fraConsultaOperacoes.qryProcuraOperacoescodigo.AsInteger);
    end;
    }
end;

procedure TfrmCadastroOperacoes.CondicoesFalhasOperacoes;
const
  SQL = 'and (codigo not in (%s) or codigo = %s)';
var
  Codigo: string;
begin
  Codigo:= inttostr(dtmCadastroOperacoes.qryFalhasOperacoesFalha.AsInteger);
  if (dtmCadastroOperacoes.qryFalhasOperacoes.State = dsInsert){ or
     (dtmCadastroFalha.qryFalhasOperacoesdescricao.AsString='')} then
    Codigo:= '0';

  ConsultaFalhas.qryProcuraFalhas.MacroByName('SQLFalhasJaSelecionadas').AsString :=
    format(SQL,[dtmCadastroOperacoes.ListaFalhasSelecionadas, Codigo]);

  ConsultaFalhas.qryConsultaFalhas.MacroByName('SQLFalhasJaSelecionadas').AsString :=
    format(SQL,[dtmCadastroOperacoes.ListaFalhasSelecionadas, Codigo]);
end;

procedure TfrmCadastroOperacoes.AtribuirDadosFalhasOperacoes(Found: Boolean);
begin
  with dtmCadastroOperacoes do begin
    EditarFalhasOperacoes;
    qryFalhasOperacoesFalha.    AsString := ConsultaFalhas.qryProcuraFalhasCodigo.   AsString;
    qryFalhasOperacoesDescricao.AsString := ConsultaFalhas.qryProcuraFalhasDescricao.AsString;
    qryFalhasOperacoes.Post;
  end;
end;



procedure TfrmCadastroOperacoes.dbgFalhasAssociadasDblClick(
  Sender: TObject);
begin
  inherited;
  if dbgFalhasAssociadas.SelectedIndex in [0..1] then
    AcionarPesquisaGradeFalhas;

end;

procedure TfrmCadastroOperacoes.AcionarPesquisaGradeFalhas;
begin
  dbgFalhasAssociadas.SetFocus;
  ConsultaFalhas.CtrlOn := True;
  ConsultaFalhas.InternoPesquisar('FALHAS');
  dbgFalhasAssociadas.SetFocus;
  dbgFalhasAssociadas.SelectedIndex :=  1;
end;


procedure TfrmCadastroOperacoes.CondicoesMaquinas;
const
  SQL = 'and (codigo not in (%s) or codigo = %s)';
var
  Codigo: string;
begin
  Codigo:= inttostr(dtmCadastroOperacoes.qryOperacoesMaquinasmaquina.AsInteger);
  if (dtmCadastroOperacoes.qryOperacoesMaquinas.State = dsInsert) then
    Codigo:= '0';

  ConsultaMaquinas.qryProcuraMaquinas.MacroByName('SQLMaquinasJaSelecionadas').AsString :=
    format(SQL,[dtmCadastroOperacoes.ListaMaquinasSelecionadas, Codigo]);

  ConsultaMaquinas.qryConsultaMaquinas.MacroByName('SQLMaquinasJaSelecionadas').AsString :=
    format(SQL,[dtmCadastroOperacoes.ListaMaquinasSelecionadas, Codigo]);
end;

procedure TfrmCadastroOperacoes.AtribuirDadosMaquinas(Found: Boolean);
begin
  with dtmCadastroOperacoes do
  begin
    EditarOperacoesMaquinas;
    qryOperacoesMaquinasmaquina.AsString := ConsultaMaquinas.qryProcuraMaquinascodigo.   AsString;
    qryOperacoesMaquinasdescricao.AsString := ConsultaMaquinas.qryProcuraMaquinasdescricao.   AsString;
    qryOperacoesMaquinas.Post;
  end;
end;

procedure TfrmCadastroOperacoes.dbgOperacoesMaquinasDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaOperacoesMaquinas;
end;

procedure TfrmCadastroOperacoes.AcionarPesquisaOperacoesMaquinas;
begin
  dbgOperacoesMaquinas.SetFocus;
  ConsultaMaquinas.CtrlOn := True;
  ConsultaMaquinas.InternoPesquisar(ctMAQUINAS);
  dbgOperacoesMaquinas.SetFocus;
  dbgOperacoesMaquinas.SelectedIndex :=  0;
end;

procedure TfrmCadastroOperacoes.dbgOperacoesMaquinasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
     VK_F9     : begin
                     ConsultaMaquinas.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or ConsultaMaquinas.CtrlOn then
                       AcionarPesquisaOperacoesMaquinas
                   end;
    end;
  end
  else
  case Key of
   VK_Return: if dbgOperacoesMaquinas.SelectedIndex = 0 then
                begin
                  if VerificarMaquinas then
                    dtmCadastroOperacoes.GravarOperacoesMaquinas;
                end;
  end;
  inherited;

end;

function TfrmCadastroOperacoes.VerificarMaquinas: boolean;
begin
  result := true;
  ConsultaMaquinas.edfCodigo.DoExit;
  if not ConsultaMaquinas.qryProcuraMaquinas.IsEmpty then
    AtribuirDadosMaquinas(True)
  else
  begin
    result := false;
    dbgOperacoesMaquinas.SetFocus;
    dbgOperacoesMaquinas.SelectedIndex := 0;
  end;

end;

procedure TfrmCadastroOperacoes.sbnExcluirMaquinasAssociadasaOperacaoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.ExcluirOperacoesMaquinas;
end;

procedure TfrmCadastroOperacoes.sbnIncluirMaquinasAssociadasaOperacaoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.IncluirOperacoesMaquinas;
end;

procedure TfrmCadastroOperacoes.sbnIncluirFalhaClick(Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.IncluirFalha;
end;

procedure TfrmCadastroOperacoes.sbnExcluirFalhaClick(Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.ExcluirFalhasOperacoes;
end;

procedure TfrmCadastroOperacoes.dbgFalhasAssociadasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
     VK_F9     : begin
                     ConsultaFalhas.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or ConsultaFalhas.CtrlOn then
                       AcionarPesquisaGradeFalhas
                   end;
    end;
  end
  else
  case Key of
    VK_Return:
    begin
      if dbgFalhasAssociadas.SelectedIndex = 0 then
      begin
        if ConsultaFalhas.edfcodigo.Exist then
        begin
          ConsultaFalhas.edfcodigo.Modified := true;
          ConsultaFalhas.edfcodigo.DoExit;
          dbgFalhasAssociadas.SelectedIndex := 1;
        end
        else
        begin
          dtmCadastroOperacoes.qryFalhasOperacoesfalha.Clear;
          dtmCadastroOperacoes.qryFalhasOperacoesdescricao.Clear;
        end;
      end
      else
      if dbgFalhasAssociadas.SelectedIndex = 1 then
      begin
        if (dtmCadastroOperacoes.qryFalhasOperacoes.State in [dsinsert,dsedit]) then
          dtmCadastroOperacoes.GravarFalhasOperacoes;
      end;
    end;
  end;
end;

procedure TfrmCadastroOperacoes.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  frmImprimirOperacoes := TfrmImprimirOperacoes.Create(frmImprimirOperacoes);

  if (dtmCadastroOperacoes.qryOperacoes.RecordCount = 1) and
     (dtmCadastroOperacoes.qryOperacoes.state <> dsinsert)
  then begin
//     frmImprimirOperacoes.ckbSomenteOperacaoAtual.checked := true;
     frmImprimirOperacoes.ckbSomenteOperacaoAtual.enabled := true;
  end
  else begin
//      frmImprimirOperacoes.ckbSomenteOperacaoAtual.checked := false;
      frmImprimirOperacoes.ckbSomenteOperacaoAtual.enabled := false;
  end;

  frmImprimirOperacoes.ShowModal;
  frmImprimirOperacoes.Free;
end;

procedure TfrmCadastroOperacoes.dbgTemposPadraoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

function VerificarTemposPadrao: boolean;
begin
  result := true;
  {
  if pos(dbgTemposPadrao.Columns[0].Field.Value,dtmCadastroOperacoes.ListaTemposPadraoSelecionados)<>0 then
  begin
    result := false;
    MensagemErro('A data do tempo padrão já existe.')
  end;
  }
end;

begin
  inherited;
  case Key of
   VK_Return: case dbgTemposPadrao.SelectedIndex of
              0: begin
                   if VerificarTemposPadrao then
                   begin
                     dbgTemposPadrao.SelectedIndex := dbgTemposPadrao.SelectedIndex + 1;
//                     dtmCadastroOperacoes.GravarOperacoesMaquinas;
                   end;
                 end;
              1: dtmCadastroOperacoes.SalvarOperacoesTemposPadrao;
              end;
  end;
  inherited;

end;

procedure TfrmCadastroOperacoes.sbnIncluirTemposPadraoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.IncluirOperacoesTemposPadrao;
end;

procedure TfrmCadastroOperacoes.sbnExcluirTemposPadraoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperacoes.ExcluirOperacoesTemposPadrao;
end;

procedure TfrmCadastroOperacoes.ActEstadosBotoesUpdate(Sender: TObject);
begin
  inherited;
  sbnCopiarOperacao.Enabled := (dtmCadastroOperacoes.qryOperacoes.RecordCount <> 0) or
                               (dtmCadastroOperacoes.qryOperacoes.state = dsinsert) ;
end;

procedure TfrmCadastroOperacoes.sbnCopiarOperacaoClick(Sender: TObject);
begin
  inherited;
  frmOpcoesCopiarOperacoes := TfrmOpcoesCopiarOperacoes.Create(frmOpcoesCopiarOperacoes);

  if frmOpcoesCopiarOperacoes.ShowModal = mrOK then
  begin
    if frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoes.RecordCount <> 0 then
    begin
      if frmOpcoesCopiarOperacoes.ckbMaquinas.Checked then
      begin
        if (MensagemConfirmacao('A importação das máquinas associadas a operação:  '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesnome.AsString + ' '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc01.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc02.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc03.AsString) = smbOk) then
          dtmCadastroOperacoes.ImportarMaquinas(frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoescodigo.AsInteger);
      end;

      if frmOpcoesCopiarOperacoes.ckbDescricaoSetup.Checked then
      begin
        if (MensagemConfirmacao('A importação dos Setup´s da operação:  '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesnome.AsString + ' '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc01.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc02.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc03.AsString) = smbOk) then
          dtmCadastroOperacoes.ImportarSetups(frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoescodigo.AsInteger);
      end;

      if frmOpcoesCopiarOperacoes.ckbMaquinas.Checked then

      if frmOpcoesCopiarOperacoes.ckbControldeProcesso.Checked then
      begin
        if (MensagemConfirmacao('A importação dos processos de controle da operação:  '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesnome.AsString + ' '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc01.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc02.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc03.AsString) = smbOk) then
          dtmCadastroOperacoes.importarprocessoscontrole(frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoescodigo.AsInteger);
      end;

      if frmOpcoesCopiarOperacoes.ckbFalhasAssociadas.Checked then
      begin
        if (MensagemConfirmacao('A importação das falhas associadas a operação:  '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesnome.AsString + ' '+
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc01.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc02.AsString + ' ' +
                                frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoesc03.AsString) = smbOk) then
          dtmCadastroOperacoes.importarfalhas(frmOpcoesCopiarOperacoes.fraConsultaOperacoes.qryProcuraOperacoescodigo.AsInteger);
      end;

    end;
  end;

  frmOpcoesCopiarOperacoes.Free;
end;

end.
