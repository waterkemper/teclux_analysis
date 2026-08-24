unit fmcadastroatendimento;

interface
                                 
uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, ComCtrls, Windows,{Qete,}
  dateutils, ActnList,
  //Terceiros
  ZQuery,
  //Biblio
  ctconstantes,biblio,
  //Componentes
  cpdata, cptexto, cpnumero, cpdbfindcontrols, cpdbdata, cpdbtext, cpdbgrid,
  cpdbradiogroup, cpdbmemo,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo,
  //Projeto
  dmcadastroatendimentos, ToolWin, clparametrossistema, DB, ZPgSqlQuery,
  cpquery, fmconsultavendas, DBDateTimePicker, DBEditDateTimePicker,
  DBDateTimePicker2,
  Menus, DBMaplistCombobox, cpmemo, fmPrincipalBasico, AdvDateTimePicker,
  AdvDBDateTimePicker, AdvEdit, AdvEdBtn, DBPlannerDatePicker, frconsulta,
  frconsultacodigo, fmArquivosAnexados;

type
  TMostraProp = class (TtecDBGrid);
  TfrmCadastroAtendimento = class(TfrmCadastroPadrao)
    sbnCliente: TSpeedButton;
    edfCodigoCliente: TtecDBFindLookup;
    dtxNome: TtecDBText;
    pnlFundoJanela: TPanel;
    rgpTipo: TtecDBRadioGroup;
    ckbTipoReclamacao: TtecRadioButton;
    ckbTipoVisita: TtecRadioButton;
    ckbTipoCobranca: TtecRadioButton;
    edfTipoAtendimento: TtecDBFindLookup;
    sbnTipoAtendimento: TSpeedButton;
    dtxTipoAtendimento: TtecDBText;
    dtxData: TtecDBText;
    edtDataSPC: TDBEditData;
    edtDataAviso: TDBEditData;
    gbxListaAtendimentos: TGroupBox;
    dbgOcorrencias: TtecDBGrid;
    edfCodigo: TtecDbEditFind;
    pgcInformes: TPageControl;
    tstEditarInformes: TTabSheet;
    tstHistorico: TTabSheet;
    mmoEditarInformes: TRichEdit;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    dtxAtendente: TtecDBText;
    mmoUltimaReclamacao: TDBMemo;
    lblCobrancas: TLabel;
    gbxCodigo: TGroupBox;
    gbxDataInclusao: TGroupBox;
    gbxAtendente: TGroupBox;
    gbxCliente: TGroupBox;
    gbxTipoAtendimento: TGroupBox;
    gbxLembrarEm: TGroupBox;
    gbxSemSPC: TGroupBox;
    gbxSemAviso: TGroupBox;
    gbxData: TGroupBox;
    edtData: TDBEditData;
    gbxUltimaReclamacao: TGroupBox;
    ckbNaoLigarTelefone: TDBCheckBox;
    gbxAtendenteLogado: TGroupBox;
    dtxAtendenteLogado: TtecDBText;
    sbnImprimir: TSpeedButton;
    sbnConsultaVendas: TSpeedButton;
    sbnFollow_up: TSpeedButton;
    gbxAssunto: TGroupBox;
    edtAssunto: TDBEditTexto;
    pnlTop: TPanel;
    pnlLeft: TPanel;
    Splitter1: TSplitter;
    rgpStatus: TtecDBRadioGroup;
    rbnFechado: TtecRadioButton;
    rbnAberto: TtecRadioButton;
    sbnCadastroCliente: TSpeedButton;
    ckbOrcamento: TtecRadioButton;
    gbxLIgacoesClientes: TGroupBox;
    gbxOrcamento: TGroupBox;
    edtOrcamento: TDBEditTexto;
    sbnOrcamento: TSpeedButton;
    gbxOrigem: TGroupBox;
    dtxOrigem: TtecDBText;
    StaticText1: TStaticText;
    dtxDataOrigem: TtecDBText;
    gbxContrato: TGroupBox;
    edtContrato: TDBEditTexto;
    edtRenegociado: TDBEditTexto;
    gbxMotivoCancelamento: TGroupBox;
    dtxMotivodoCancelamento: TtecDBText;
    sbnImprimirMultiplos: TSpeedButton;
    sbnTrocarUsuario: TSpeedButton;
    gbxAlertaFicha: TGroupBox;
    mmoFichaAlerta: TtecDBMemo;
    edttpLembrarHora: TAdvDBDateTimePicker;
    edttpLembrar: TDBPlannerDatePicker;
    gbxSelecaoFilial: TGroupBox;
    fraConsultaFilial: TfraConsultaCodigo;
    sbnArquivosAnexados: TSpeedButton;
    gbxHistoricos: TGroupBox;
    lbxExibirInformes: TRichEdit;
    pnlRight: TPanel;
    Splitter2: TSplitter;
    ckbEntrega: TtecRadioButton;
    sbnContrato: TSpeedButton;
    procedure actHabilitarUpdate(Sender: TObject);
    procedure edtDataAvisoEnter(Sender: TObject);
    procedure edtDataSPCEnter(Sender: TObject);
    procedure edtLembreteEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbnClienteClick(Sender: TObject);
    procedure sbnTipoAtendimentoClick(Sender: TObject);
    procedure dbgOcorrenciasDblClick(Sender: TObject);
    procedure rgpTipoClickItem(Sender: TObject);
    procedure edfCodigoClienteFound(Found: Boolean);
    procedure ckbTipoCobrancaClick(Sender: TObject);
    procedure ckbTipoReclamacaoClick(Sender: TObject);
    procedure ckbTipoVisitaClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure sbnConsultaVendasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbnFollow_upClick(Sender: TObject);
    procedure dbgOcorrenciasKeyPress(Sender: TObject; var Key: Char);
    procedure dbgOcorrenciasCellClick(Column: TColumn);
    procedure dbgOcorrenciasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure mmoEditarInformesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnCadastroClienteClick(Sender: TObject);
    procedure sbnOrcamentoClick(Sender: TObject);
    procedure rbnFechadoClick(Sender: TObject);
    procedure rbnAbertoClick(Sender: TObject);
    procedure pnlTopMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure rgpStatusMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure mmoEditarInformesKeyPress(Sender: TObject; var Key: Char);
    procedure sbnImprimirMultiplosClick(Sender: TObject);
    procedure sbnTrocarUsuarioClick(Sender: TObject);
    procedure edtDataExit(Sender: TObject);
    procedure dbgOcorrenciasColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure edttpLembrarValueValidate(Sender: TObject; value: String;
      var IsValid: Boolean);
    procedure sbnArquivosAnexadosClick(Sender: TObject);
    procedure sbnContratoClick(Sender: TObject);
  private
    vMovimentoUsuario : boolean;
  protected
    procedure ExibirInformes({Tipo: TtecTipoAtendimento;} MostrarAtendimento: Boolean);
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoIncluir   : Boolean;  overload; Override;
    function  InternoIncluir(Followup: boolean) : boolean; overload;
    function  InternoExcluir   : Boolean;  Override;
    function  InternoGravar    : Boolean;  Override;
    function  InternoPesquisar(Titulo:String):Integer; Override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AfterOpenProcuraCliente(Sender: TObject);
    procedure AtendimentosAfterScroll(Sender: TObject);
    procedure AlterarEstadoBotoes; override;

  public
    procedure OperacaoPadrao(Value: Array of Variant); override;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    function VerificarDescricaodosInformes: boolean;
    function DescricaodosInformes: String;
    procedure RefazConsultaAtendimentos;
  end;

var
  frmCadastroAtendimento: TfrmCadastroAtendimento;
  TipoConsulta: TtecTipoConsultaAtendimento;

implementation

uses dmbasico, PlannerCal;

{$R *.dfm}

procedure TfrmCadastroAtendimento.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  with dtmcadastroatendimentos do
  begin
    rgpTipo.ReadOnly := qryAtendimentostipo.ReadOnly;
    ckbTipoCobranca.ReadOnly := rgpTipo.ReadOnly;
    ckbTipoVisita.ReadOnly :=  rgpTipo.ReadOnly;
    ckbTipoReclamacao.ReadOnly :=  rgpTipo.ReadOnly;

    gbxSemSPC.   Enabled := Atendimento = 'C';
    edtDataSPC.  Enabled := gbxSemSPC.Enabled;
    gbxSemAviso. Enabled := gbxSemSPC.Enabled;
    edtDataAviso.Enabled := gbxSemSPC.Enabled;

    if Atendimento = 'C' then ckbTipoCobranca.Font.Color:= clRed
    else                      ckbTipoCobranca.Font.Color:= clBlack;

    if Atendimento = 'R' then ckbTipoReclamacao.Font.Color:= clRed
    else                      ckbTipoReclamacao.Font.Color:= clBlack;

    if Atendimento = 'V' then ckbTipoVisita.Font.Color:= clRed
    else                      ckbTipoVisita.Font.Color:= clBlack;

    if Atendimento = 'O' then ckbOrcamento.Font.Color:= clRed
    else                      ckbOrcamento.Font.Color:= clBlack;


//    mmoUltimaReclamacao.Visible:= ExisteReclamacao and (Atendimento = 'C');

    sbnImprimir.Enabled := not dtmCadastroAtendimentos.qryAtendimentos.IsEmpty;

    sbnConsultaVendas.enabled := (qryAtendimentoscliente.asinteger <> 0);
    sbnCadastroCliente.enabled := (qryAtendimentoscliente.asinteger <> 0);

    if dtmCadastroAtendimentos.qryAtendimentosstatus.asstring = 'A' then
    begin
      rbnAberto.font.style := [fsBold];
      rbnAberto.font.color := clRed;
      rbnFechado.font.style := [];
      rbnFechado.font.color := clBlack;
    end
    else
    if dtmCadastroAtendimentos.qryAtendimentosstatus.asstring = 'F' then
    begin
      rbnAberto.font.style := [];
      rbnAberto.font.color := clBlack;
      rbnFechado.font.style := [fsBold];
      rbnFechado.font.color := clGreen;
    end
    else
    if dtmCadastroAtendimentos.qryAtendimentosstatus.isnull then
    begin
      rbnAberto.font.style := [];
      rbnAberto.font.color := clBlack;
      rbnFechado.font.style := [];
      rbnFechado.font.color := clBlack;
    end;

    sbnOrcamento.enabled := (dtmCadastroAtendimentos.qryAtendimentosCodigo.asInteger <> 0) and
                            ((dtmCadastroAtendimentos.qryAtendimentosorcamento.asinteger <> 0) or
                             (dtmCadastroAtendimentos.qryAtendimentostipo.asstring = 'V') or
                             (dtmCadastroAtendimentos.qryAtendimentostipo.asstring = 'O'));

    sbnContrato.enabled := (dtmCadastroAtendimentos.qryAtendimentosCodigo.asInteger <> 0) and
                           (dtmCadastroAtendimentos.qryAtendimentoscontrato.asString <> '');


    gbxOrigem.visible := not dtmCadastroAtendimentos.qryAtendimentosOrigem.isnull;

    if not gbxOrigem.visible then
      dtxAtendenteLogado.width := 573
    else
      dtxAtendenteLogado.width := 416;

    sbnCliente.enabled :=  not edfCodigoCliente.ReadOnly and not dtmCadastroAtendimentos.qryAtendimentoscliente.ReadOnly;

//    sbnTrocarUsuario.enabled := (dtmCadastroAtendimentos.qryAtendimentosstatus.asString = 'A');

    if dtmCadastroAtendimentos.qryAtendimentosos.asboolean and
       (gbxContrato.caption <> 'ORDEM SERVIÇO') then
      gbxContrato.caption := 'ORDEM SERVIÇO'
    else
    if NOT dtmCadastroAtendimentos.qryAtendimentosos.asboolean and
       (gbxContrato.caption <> 'CONTRATO') then
      gbxContrato.caption := 'CONTRATO';

    sbnArquivosAnexados.enabled := (qryAtendimentos.recordcount <> 0) and
                                   (qryAtendimentos.state <> dsinsert);


  end;
end;

procedure TfrmCadastroAtendimento.AfterOpenProcuraCliente(Sender: TObject);
begin
  if pgcInformes.ActivePageIndex = 1 then
    pgcInformes.ActivePageIndex:= 0;
//  tstHistorico.Caption:= 'Históric&os - cobrança';

  ckbTipoCobranca.OnClick := nil;
  ckbTipoReclamacao.OnClick := nil;
  ckbTipoVisita.OnClick := nil;

  ExibirInformes(False);

  ckbTipoCobranca.OnClick := ckbTipoCobrancaClick;
  ckbTipoReclamacao.OnClick := ckbTipoReclamacaoClick;
  ckbTipoVisita.OnClick := ckbTipoVisitaClick;

end;

constructor TfrmCadastroAtendimento.Create(AOwner: TComponent);
begin
  dtmcadastroatendimentos:= Tdtmcadastroatendimentos.Create(Self);
  inherited;
  with dtmcadastroatendimentos do
  begin
    DataSet := qryAtendimentos;
    Abre(ctCadastroAtendimentos);
    ProcuraClienteAfterOpen:= AfterOpenProcuraCliente;
    TipoAtendimento:= tpaCOBRANCA;
  end;
  dtmcadastroatendimentos.AtendimentosAfterScroll := AtendimentosAfterScroll;

  dtmcadastroatendimentos.DescricaodosInformes := DescricaodosInformes;
  dtmcadastroatendimentos.VerificarDescricaodosInformes := VerificarDescricaodosInformes;

  gbxAtendente.Visible := parsistema.Solicitarusuarionocadastrodeatendimentos;
//  edttpLembrar.width := 90;
  self.activecontrol := edfCodigo;

  edttpLembrar.Calendar.MaxDate.Use := true;
  edttpLembrar.Calendar.MaxDate.Date := dtmCadastroAtendimentos.DataServidor + parsistema.Data_maxima_atendimento_Lembrar_em;
  edtData.Minimo := parsistema.Data_minima_atendimento_Data;

  fraConsultaFilial.TipoPesquisa := pesFILIAIS;

end;

destructor TfrmCadastroAtendimento.Destroy;
begin
  edttpLembrar.free;

  dtmcadastroatendimentos:=nil;
  inherited;
  frmCadastroAtendimento := nil;
end;

procedure TfrmCadastroAtendimento.edtDataAvisoEnter(Sender: TObject);
var
 Data : TDatetime;
begin
  inherited;
  Data := dtmCadastroAtendimentos.DataServidor;
  if dtmCadastroAtendimentos.IncluindoAtendimentos or
     dtmCadastroAtendimentos.qryAtendimentossemaviso.ReadOnly then
       Data := dtmCadastroAtendimentos.DataAtendimento;
  if edtDataAviso.Text <> '' then
      edtDataAviso.Minimo:= DaysBetween(dtmCadastroAtendimentos.DataServidor,
                                       data)
end;

procedure TfrmCadastroAtendimento.edtDataSPCEnter(Sender: TObject);
var
 Data : TDatetime;
begin
  inherited;
  Data := dtmCadastroAtendimentos.DataServidor;
  if dtmCadastroAtendimentos.IncluindoAtendimentos or
     dtmCadastroAtendimentos.qryAtendimentossemspc.ReadOnly then
       Data := dtmCadastroAtendimentos.DataAtendimento;
  if edtDataSPC.Text <> '' then
      edtDataSPC.Minimo:= DaysBetween(dtmCadastroAtendimentos.DataServidor,
                                       data)
end;



procedure TfrmCadastroAtendimento.edtLembreteEnter(Sender: TObject);
var
 Data : TDatetime;
begin
  inherited;
  Data := dtmCadastroAtendimentos.DataServidor;
  if dtmCadastroAtendimentos.IncluindoAtendimentos or
     dtmCadastroAtendimentos.qryAtendimentoslembrar.ReadOnly then
       Data := dtmCadastroAtendimentos.DataAtendimento;

//  edttpLembrar.MinDate:= Data;
  edttpLembrar.Calendar.MinDate.Date := Data;
end;


procedure TfrmCadastroAtendimento.ExibirInformes({Tipo: TtecTipoAtendimento;} MostrarAtendimento: Boolean);
Var
  Informes: TStringList;
  PosIni, PosFim,
  NL: Integer;
  zebrando: boolean;

  procedure DrawLine;

  var
    aCanvas: Tcanvas;
    X1, X2, Y1: Integer;
    byLineLength: BYTE;

  begin
    byLineLength := 80; // Draw the line after 80 chars on the RichEdit
    aCanvas := TCanvas.Create;
    Y1 := lbxExibirInformes.Height;
    try
      aCanvas.Handle := GetDC(lbxExibirInformes.Handle);
      aCanvas.Font := lbxExibirInformes.Font;
      X1 := aCanvas.TextWidth('W');
      X2 := aCanvas.TextWidth('i');
      aCanvas.Pen.color := clred; // Color of line

      if X1 = X2 then // Check for fixed or variable font
      begin
        aCanvas.MoveTo(byLineLength * X1, 0);
        aCanvas.LineTo(byLineLength * X1, Y1);
      end;
    finally
      ReleaseDC(lbxExibirInformes.Handle, aCanvas.Handle);
      aCanvas.Free;
    end;
  end;

                     (*
  // Modos possíveis: SCF_ALL / SCF_SELECTION / SCF_WORD  (*** declaradas na unit RichEdit)
  procedure MarkRichEditText(RichEdit:TRichEdit; fgColor, bkColor :TColor; MarkMode :Integer);
  var
    CharFormat :TChar;
  begin
    // na marcação de palavra, na chamada a EM_SETCHARFORMAT deve ser
    // concatenado SCF_SELECTION ao parâmetro SCF_WORD
    if MarkMode = SCF_WORD then
      MarkMode := MarkMode or SCF_SELECTION;
    CharFormat.cbSize := SizeOf(CharFormat);
    CharFormat.dwMask := CFM_BACKCOLOR or CFM_COLOR;
    CharFormat.crBackColor := ColorToRGB(bkColor);
    CharFormat.crTextColor := ColorToRGB(fgColor);
    SendMessage(RichEdit.handle, EM_SETCHARFORMAT, MarkMode, LongInt(@CharFormat));
  end;
                     *)
begin
  if not dtmCadastroAtendimentos.ListandoInformes then
    dtmCadastroAtendimentos.ListarInformes(lbxExibirInformes, MostrarAtendimento);
end;

function TfrmCadastroAtendimento.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmcadastroatendimentos do begin
    case TipoConsulta of
          tcaATENDIMENTO: Result:= ExisteAtendimentos(Parametro, NomeCampo, Value);
              tcaCLIENTE: Result:= ExisteClientes(Parametro, NomeCampo, Value);
      tcaTIPOATENDIMENTO: Result:= ExisteTiposAtendimentos(NomeCampo, Value)
      else                Result:= False;
    end;
  end;
end;

procedure TfrmCadastroAtendimento.FormActivate(Sender: TObject);
begin
  inherited;
//  if edfCodigoCliente.CanFocus then
//    edfCodigoCliente.SetFocus;
end;

function TfrmCadastroAtendimento.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    dtmcadastroatendimentos.ExcluirAtendimentos;
end;

function TfrmCadastroAtendimento.InternoGravar: Boolean;

  function VerificarCampos: boolean;
  var
    vRetornoMensagem : TModalResult;
  begin
    result := true;
    {
    if (((dtmCadastroAtendimentos.qryAtendimentosstatus.asString <> dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString) and
         (dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString <> '')) or

        ((dtmCadastroAtendimentos.qryAtendimentosstatus.asString = 'F') and
         (dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString = ''))) and

       (dtmCadastroAtendimentos.AtendimentosStatusRead) then
    begin
      result := false;
      if ((dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString = 'A') and (dtmCadastroAtendimentos.qryAtendimentosstatus.asString = 'F')) or
         ((dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString = '') and (dtmCadastroAtendimentos.qryAtendimentosstatus.asString = 'F')) then
        mensagemaviso('Este atendimento refere-se a um orçamento. O fechamento deve ocorrer pelo cancelamento ou mudança do status do orçamento.')
      else
      if ((dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString = 'F') and (dtmCadastroAtendimentos.qryAtendimentosstatus.asString = 'A')) then
        mensagemaviso('Este atendimento refere-se a um orçamento. A mudança do status deve ocorrer pelo orçamento.');

      if dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString <> '' then
        dtmCadastroAtendimentos.qryAtendimentosstatus.asString := dtmCadastroAtendimentos.qryAtendimentosstatusaux.asString
      else
        dtmCadastroAtendimentos.qryAtendimentosstatus.asString := 'A';

    end
    else
    }
    if (dtmCadastroAtendimentos.qryAtendimentosstatus.asString = 'A') and
       (dtmCadastroAtendimentos.qryAtendimentoslembrar.isnull) then
    begin
      if dtmCadastroAtendimentos.AtendimentosStatusRead then
        vRetornoMensagem := MensagemSimNaoOpcaoCancelar('O status do atendimento está "em Aberto" e a data para "lembrar em" não está preenchida. Deseja informar a data?', '', true)
      else
        vRetornoMensagem := MensagemSimNaoOpcaoCancelar('O status do atendimento está "em Aberto" e a data para "lembrar em" não está preenchida. Deseja informar a data?', '&Fechar atendimento', true);

      if vRetornoMensagem = mrYES then
      begin
        result := false;
        edttpLembrar.setfocus;
      end
      else
      if vRetornoMensagem = mrCancel then
        result := false
      else
      if vRetornoMensagem = mrOK then
      begin
        dtmcadastroatendimentos.vFecharAtendimento := true;
        result := true;
      end;
    end;

    if result then
    begin
      if not dtmCadastroAtendimentos.qryAtendimentoslembrar.isnull and
         dtmCadastroAtendimentos.eH_Follow_up and
         dtmCadastroAtendimentos.VerificarDataLembrar and
         not dtmcadastroatendimentos.vFecharAtendimento then
      begin
        if dtmCadastroAtendimentos.AtendimentosStatusRead then
          vRetornoMensagem := MensagemSimNaoOpcaoCancelar('Existe um followup com a data e hora "lembrar em" superior à informada. Deseja alterar a data e hora?', '', true)
        else
          vRetornoMensagem := MensagemSimNaoOpcaoCancelar('Existe um followup com a data e hora "lembrar em" superior à informada. Deseja alterar a data e hora?', '&Fechar atendimento', true);

        if vRetornoMensagem = mrYES then
        begin
          result := false;
          edttpLembrar.setfocus;
        end
        else
        if vRetornoMensagem = mrCancel then
          result := false
        else
        if vRetornoMensagem = mrOK then
        begin
          dtmcadastroatendimentos.vFecharAtendimento := true;
          result := true;
        end;
      end;
    end;

    if result then
    begin
      if not dtmCadastroAtendimentos.qryAtendimentoslembrar.isnull then
        if StrToDateTime(dtmCadastroAtendimentos.qryAtendimentoslembrar.asString + ' ' +
                         dtmCadastroAtendimentos.qryAtendimentoslembrarhora.asString) <
           dtmCadastroAtendimentos.qryAtendimentosdatainclusao.asDateTime then
        begin
          result := false;
          mensagemAviso('A data e hora de ''Lembrar em'' não pode ser inferior à de inclusão');
        end;
    end;
  end;

begin

    Result := Inherited InternoGravar;
    if Result then
    begin
      dtmcadastroatendimentos.vFecharAtendimento := false;

      result := VerificarCampos;

      if result then
      begin
        Result := dtmcadastroatendimentos.GravarAtendimentos;
        if result then
          if edfCodigoCliente.CanFocus then
            edfCodigoCliente.SetFocus
          else
            edttpLembrar.SetFocus;
      end;
    end;
end;

function TfrmCadastroAtendimento.InternoIncluir: Boolean;
begin
  edfCodigo.SetFocus;
  Result := inherited InternoIncluir;
  if Result then begin
    dtmcadastroatendimentos.IncluirAtendimentos;
    edfTipoAtendimento.SetFocus;
  end;
end;

function TfrmCadastroAtendimento.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrNone;
  with dtmCadastroAtendimentos do begin
    if CtrlOn Then begin
      if (ActiveControl = edfCodigoCliente) then
      begin
        if edfCodigoCliente.ReadOnly or dtmCadastroAtendimentos.qryAtendimentoscliente.ReadOnly then
          TipoConsulta := tcaNENHUM
        else TipoConsulta := tcaCLIENTE;
        Titulo:= 'Cliente';
      end
      else if (ActiveControl = edfTipoAtendimento) then begin
        TipoConsulta:= tcaTIPOATENDIMENTO;
        Titulo:= 'Tipo Atendimento';
      end
      else
        TipoConsulta:= tcaNENHUM;
    end
    else begin
      TipoConsulta:= tcaATENDIMENTO;
      Titulo:= 'Atendimentos';
    end;

    if (TipoConsulta <> tcaNENHUM) then begin
      AbreTabelasConsulta(TipoConsulta);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrok then begin
        if TipoConsulta = tcaATENDIMENTO then
        begin
//         edttpLembrar.DBEdit.Clear;
//         edttpLembrar.clear;
         edtDataSPC.Clear;
         edtDataAviso.Clear;
        end;
        Selecionar(TipoConsulta);
        if (TipoConsulta <> tcaTIPOATENDIMENTO) and edfCodigoCliente.CanFocus then
          edfCodigoCliente.SetFocus;
      end;
      FechaTabelasConsulta(TipoConsulta);
    end;
  end;
end;

function TfrmCadastroAtendimento.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if (TipoConsulta in [tcaCLIENTE, tcaATENDIMENTO]) then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela  := False;
end;

procedure TfrmCadastroAtendimento.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_ESCAPE: begin
//                  dtmCadastroAtendimentos.FecharTabelasAtendimentos;
                  if pgcInformes.ActivePageIndex = 1 then
                    pgcInformes.ActivePageIndex:= 0;
                  if lbxExibirInformes.lines.Count > 0 then
                    lbxExibirInformes.lines.Clear;
                end;
    VK_SPACE : if Shift = [ssCtrl] then begin
                  if dbgOcorrencias.Focused then
                    dbgOcorrenciasDblClick(dbgOcorrencias)
                end;

    VK_F4: begin
             if sbnFollow_up.Enabled then
               sbnFollow_upClick(sbnFollow_up);
           end;

    VK_F7: begin
             if sbnImprimir.Enabled then
               sbnImprimirClick(sbnimprimir);
           end;
    VK_F8: sbnImprimirMultiplosClick(sbnImprimirMultiplos);
  end;
end;

procedure TfrmCadastroAtendimento.OperacaoPadrao(Value: Array of Variant);
begin
  inherited;
  edfCodigo.SetControl(false);
  if (value[0] = 'IncluirAtendimento') or
     (value[0] = 'AbrirUltimoAtendimento') then
  begin
    rgpTipo.ReadOnly := false;
    ckbTipoReclamacao.ReadOnly := false;
    ckbTipoVisita.ReadOnly := false;
    edfTipoAtendimento.ReadOnly := false;
    edfCodigoCliente.ReadOnly := false;
    sbnCliente.Enabled := true;
    dtmCadastroAtendimentos.IncluirAtendimentos(Value);
    edfCodigo.SetControl(true);

    if not dtmcadastroatendimentos.qryatendimentos.isempty then
      edfTipoAtendimento.SetFocus
    else
      edfCodigo.setfocus;

    if (value[0] = 'AbrirUltimoAtendimento') then
      ExibirInformes(True);
  end
  else
  if (value[0] = 'IncluirFollowup') then
  begin
    edfCodigo.text := inttostr(value[1]);
    if edfcodigo.Exist then
      sbnFollow_upClick(nil);

    edfTipoAtendimento.SetFocus
  end
  else
  if (value[0] = 'IncluirFollowupOrcamento') then
  begin
     {
    if (value[1] <> 0) then
    begin
      edfCodigo.text := inttostr(value[1]);
      if edfcodigo.Exist then
        sbnFollow_upClick(nil);
    end
    else
    begin
    }
      dtmCadastroAtendimentos.IncluirAtendimentos(Value);

      if dtmCadastroAtendimentos.qryAtendimentostipoatendimento.asinteger <> 0 then
      begin
        if mmoEditarInformes.canfocus then
          mmoEditarInformes.setfocus
      end
      else
        edfTipoAtendimento.SetFocus;


        ExibirInformes(false);
//    end;
  end
  else
  if (value[0] = 'IncluirFollowupRomaneio') then
  begin
      dtmCadastroAtendimentos.IncluirAtendimentos(Value);
      mmoEditarInformes.Text := Value[6];

      if self.formstyle=fsMDIChild then
      begin
        if dtmCadastroAtendimentos.qryAtendimentostipoatendimento.asinteger <> 0 then
        begin
          if mmoEditarInformes.canfocus then
            mmoEditarInformes.setfocus
        end
        else
          edfTipoAtendimento.SetFocus;
      end;    

      ExibirInformes(false);
  end
  else
  if (value[0] = 'IncluirFollowupContrato') then
  begin
     {
    if (value[1] <> 0) then
    begin
      edfCodigo.text := inttostr(value[1]);
      if edfcodigo.Exist then
        sbnFollow_upClick(nil);
    end
    else
    begin
    }
      dtmCadastroAtendimentos.IncluirAtendimentos(Value);

      if dtmCadastroAtendimentos.qryAtendimentostipoatendimento.asinteger <> 0 then
        mmoEditarInformes.setfocus
      else
        edfTipoAtendimento.SetFocus;


        ExibirInformes(false);
//    end;
  end
  else
  if value[0] = 'IncluirAtendimentoAvisosCartas' then
  begin
    rgpTipo.ReadOnly := true;
    ckbTipoReclamacao.ReadOnly := true;
    ckbTipoVisita.ReadOnly := true;
    edfTipoAtendimento.ReadOnly := true;
    edfCodigoCliente.ReadOnly := true;
    sbnCliente.Enabled := false;
    dtmCadastroAtendimentos.IncluirAtendimentos(Value);

//    if edttpLembrar.dbedit.CanFocus then
    if edttpLembrar.CanFocus then
      edttpLembrar.SetFocus
    else edfCodigo.SetFocus;
  end
  else
  if value[0] = 'ReabrirAtendimentodoContrato' then
  begin

    if dtmcadastroatendimentos.qryatendimentoscontrato.asstring = value[1] then
    begin
       dtmcadastroatendimentos.RefazConsultaPorNome(dtmcadastroatendimentos.qryAtendimentosProdutos,
                           ['atendimento'],[dtmcadastroatendimentos.qryAtendimentoscodigo.asinteger]);

      if not dtmcadastroatendimentos.qryAtendimentosProdutos.isempty then
        dtmCadastroAtendimentos.refazconsultaAtendimento;
    end;

  end
  else
  if value[0] = 'ReabrirAtendimentodoOrcamento' then
  begin

    if dtmcadastroatendimentos.qryatendimentosorcamento.asstring = value[1] then
    begin
       dtmcadastroatendimentos.RefazConsultaPorNome(dtmcadastroatendimentos.qryAtendimentosProdutos,
                           ['atendimento'],[dtmcadastroatendimentos.qryAtendimentoscodigo.asinteger]);

      if not dtmcadastroatendimentos.qryAtendimentosProdutos.isempty then
        dtmCadastroAtendimentos.refazconsultaAtendimento;
    end;

  end;




  edttpLembrar.Calendar.MaxDate.Date := dtmCadastroAtendimentos.DataServidor + parsistema.Data_maxima_atendimento_Lembrar_em;
  edtData.Minimo := parsistema.Data_minima_atendimento_Data;

//  edtLembrete. Maximo := 90;
  edtDataSPC.  Maximo := 90;
  edtDataAviso.Maximo := 90;
end;

procedure TfrmCadastroAtendimento.sbnClienteClick(Sender: TObject);
begin
  if not edfCodigoCliente.ReadOnly and
     not dtmCadastroAtendimentos.qryAtendimentoscliente.ReadOnly then
  begin
    CtrlOn:= True;
    edfCodigoCliente.SetFocus;
    InternoPesquisar('');
  end;   
end;

procedure TfrmCadastroAtendimento.sbnTipoAtendimentoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfTipoAtendimento.SetFocus;
  InternoPesquisar('');
end;

function TfrmCadastroAtendimento.TabelaDePesquisa: TZDataSet;
begin
  with dtmCadastroAtendimentos do begin
    case TipoConsulta of
          tcaATENDIMENTO: Result:= TabelaConsultaAtendimentos;
              tcaCLIENTE: Result:= TabelaConsultaCliente;
      tcaTIPOATENDIMENTO: Result:= ConsultaTiposAtendimentos
      else                Result:= nil;
    end;
  end;
end;


procedure TfrmCadastroAtendimento.dbgOcorrenciasDblClick(Sender: TObject);
begin
  inherited;
  if dbgOcorrencias.DataSource.DataSet.RecNo > 0 then
  begin
    {
    if pgcInformes.ActivePageIndex = 0 then
    begin
      pgcInformes.ActivePageIndex:= 1;
      pgcInformes.SetFocus;
    end;
    }

    ckbTipoCobranca.OnClick := nil;
    ckbTipoReclamacao.OnClick := nil;
    ckbTipoVisita.OnClick := nil;

    ExibirInformes(True);


    ckbTipoCobranca.OnClick := ckbTipoCobrancaClick;
    ckbTipoReclamacao.OnClick := ckbTipoReclamacaoClick;
    ckbTipoVisita.OnClick := ckbTipoVisitaClick;
  end;
end;

procedure TfrmCadastroAtendimento.rgpTipoClickItem(Sender: TObject);
begin
  inherited;
//  dtmCadastroAtendimentos.ValidarTipoAtendimento;
end;

procedure TfrmCadastroAtendimento.edfCodigoClienteFound(Found: Boolean);
begin
  inherited;
  dtmCadastroAtendimentos.CartaDevolvida(ClassName);
end;

procedure TfrmCadastroAtendimento.ckbTipoCobrancaClick(Sender: TObject);
begin
  inherited;
  ckbTipoCobranca.OnClick := nil;
  ExibirInformes(False);
  ckbTipoCobranca.OnClick := ckbTipoCobrancaClick;
end;

procedure TfrmCadastroAtendimento.ckbTipoReclamacaoClick(Sender: TObject);
begin
  inherited;
  ckbTipoReclamacao.OnClick := nil;
  ExibirInformes(False);
  ckbTipoReclamacao.OnClick := ckbTipoReclamacaoClick;
end;

procedure TfrmCadastroAtendimento.ckbTipoVisitaClick(Sender: TObject);
begin
  inherited;
  ckbTipoVisita.OnClick := nil;
  ExibirInformes(False);
  ckbTipoVisita.OnClick := ckbTipoVisitaClick;
end;

procedure TfrmCadastroAtendimento.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmCadastroAtendimentos.imprimirRegistroAtendimentos;
end;

procedure TfrmCadastroAtendimento.sbnConsultaVendasClick(Sender: TObject);
begin
  inherited;
  AcionarTelaConsultaVendas(dtmCadastroAtendimentos.qryAtendimentoscliente.asinteger,
                            dtmCadastroAtendimentos.qryAtendimentostipocliente.asString)
end;

procedure TfrmCadastroAtendimento.AlterarEstadoBotoes;
begin
  inherited;
  sbnFollow_up.enabled := sbnIncluir.enabled and (dtmCadastroAtendimentos.qryAtendimentos.recordcount<>0);
end;

function TfrmCadastroAtendimento.InternoIncluir(
  Followup: boolean): boolean;
begin
  edfCodigo.SetFocus;
  Result := inherited InternoIncluir;
  if Result then
    dtmcadastroatendimentos.IncluirAtendimentos(true);
end;

procedure TfrmCadastroAtendimento.FormShow(Sender: TObject);
begin
  inherited;
  sbnFollow_up.left := sbnincluir.width;
  if self.formstyle=fsMDIChild then
  begin
    self.activecontrol := edfCodigo;
    self.setfocus;
  end;  
end;

procedure TfrmCadastroAtendimento.sbnFollow_upClick(Sender: TObject);
begin
  inherited;
  InternoIncluir(true);
  edtData.setfocus;
end;

procedure TfrmCadastroAtendimento.dbgOcorrenciasKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '+' then
    dtmCadastroAtendimentos.FiltrarOcorrencias('+')
  else
  if key = '-' then
     dtmCadastroAtendimentos.FiltrarOcorrencias('-');
end;

procedure TfrmCadastroAtendimento.dbgOcorrenciasCellClick(Column: TColumn);
begin
  inherited;
  if dbgOcorrencias.DataSource.DataSet.active then
    if dbgOcorrencias.selectedfield.name = 'qryocorrenciasexpandir' then
      dtmCadastroAtendimentos.FiltrarOcorrencias('')
end;

procedure TfrmCadastroAtendimento.dbgOcorrenciasDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgOcorrencias.DataSource.DataSet.active then
  begin

    if column.fieldname = 'origem' then
    begin
      if (dbgOcorrencias.DataSource.DataSet.FieldByName('origem').AsString='') then
        TDBGrid(Sender).Canvas.Font.style := [fsBold]
      else
        TDBGrid(Sender).Canvas.Font.style := [];
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
    else
    if column.fieldname = 'status' then
    begin
      if (dbgOcorrencias.DataSource.DataSet.FieldByName('status').AsString='A') then
        TDBGrid(Sender).Canvas.Font.Color := clRed
      else
      if (dbgOcorrencias.DataSource.DataSet.FieldByName('status').AsString='F') then
         TDBGrid(Sender).Canvas.Font.Color := clGreen;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmCadastroAtendimento.AtendimentosAfterScroll(Sender: TObject);
begin
  mmoEditarInformes.text := dtmCadastroAtendimentos.qryAtendimentosTextinformes.asstring;

  gbxMotivoCancelamento.visible := not dtmCadastroAtendimentos.qryAtendimentosdescricaomotivo.isnull;

  if not gbxMotivoCancelamento.visible then
    pnlTop.height := 349
  else
    pnlTop.height := 384;
end;

function TfrmCadastroAtendimento.VerificarDescricaodosInformes: boolean;
begin
  result := (trim(mmoEditarInformes.text) <> '');
  if not result then
  begin
    MensagemAviso(ctCODIGONECESSARIO + ' e o campo " informes' + #13#10 + '" não está preenchido com uma informação válida.');
    pgcInformes.activepageindex := 0;
    mmoEditarInformes.setfocus;
  end;
end;

function TfrmCadastroAtendimento.DescricaodosInformes: String;
begin
  result := mmoEditarInformes.text;
end;

procedure TfrmCadastroAtendimento.mmoEditarInformesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  if not CtrlOn and (key = VK_RETURN) then
      key :=  0
  else
  if (Key in [32..255]) and
     not (GetCharFromVirtualKey(Key)[1] in CharSemAcentos + CharComAcentos) and
        (key <> vk_back) then
     Key := 0
  else

  if (GetCharFromVirtualKey(Key)[1] in CharSemAcentos + CharComAcentos) or (key = vk_back) then
    dtmCadastroAtendimentos.editarAtendimentos;
    }
end;

procedure TfrmCadastroAtendimento.sbnCadastroClienteClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroAtendimentos.qryAtendimentosTipoCliente.aSstring =  'C' then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmCadastroAtendimentos.qryAtendimentosCliente.asString, ClassName], 'TfrmCadastroClientes', True)
  else
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmCadastroAtendimentos.qryAtendimentosCliente.asString, ClassName], 'TfrmCadastroFornecedores', True);

  application.processmessages;

end;

procedure TfrmCadastroAtendimento.sbnOrcamentoClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroAtendimentos.qryAtendimentosorcamento.asinteger <> 0 then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Open',dtmCadastroAtendimentos.qryAtendimentosorcamento.asinteger], 'TfrmOrcamentos', True)
  else
  if (dtmCadastroAtendimentos.qryAtendimentostipo.asstring = 'V') or
     (dtmCadastroAtendimentos.qryAtendimentostipo.asstring = 'O') then
   TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado(['Insert',
                   dtmCadastroAtendimentos.qryAtendimentosorcamento.asinteger,
                   dtmCadastroAtendimentos.qryAtendimentoscliente.asinteger,
                   dtmCadastroAtendimentos.qryAtendimentostipocliente.asString,
                   dtmCadastroAtendimentos.qryAtendimentosCodigo.asinteger], 'TfrmOrcamentos', True)




end;

procedure TfrmCadastroAtendimento.rbnFechadoClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroAtendimentos.AtendimentosStatusRead then
  begin
    if vMovimentoUsuario then
    begin
  //  rbnAberto.OnClick := nil;
  //  rbnFechado.OnClick := nil;
      mensagemaviso('Este atendimento refere-se a um orçamento. O fechamento deve ocorrer pelo cancelamento ou mudança do status do orçamento.');
      vMovimentoUsuario := false;
      rgpStatus.ItemIndex := 0;
  //    rbnAberto.checked := true;
  //    rbnFechado.checked := false;
  //  rbnAberto.OnClick := rbnAbertoClick;
  //  rbnFechado.OnClick := rbnFechadoClick;
    end
    else
      rgpStatus.ItemIndex := 0;
  end;

end;

procedure TfrmCadastroAtendimento.rbnAbertoClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroAtendimentos.AtendimentosStatusRead then
  begin
    if vMovimentoUsuario then
    begin
  //  rbnAberto.OnClick := nil;
  //  rbnFechado.OnClick := nil;
      mensagemaviso('Este atendimento refere-se a um orçamento. A mudança do status deve ocorrer pelo orçamento.');
      vMovimentoUsuario := false;
      rgpStatus.ItemIndex := 1;
  //    rbnFechado.checked := true;
  //    rbnAberto.checked := false;
  //  rbnAberto.OnClick := rbnAbertoClick;
  //  rbnFechado.OnClick := rbnFechadoClick;
    end
    else
      rgpStatus.ItemIndex := 1;
  end;

end;


procedure TfrmCadastroAtendimento.pnlTopMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  vMovimentoUsuario := false;
end;

procedure TfrmCadastroAtendimento.rgpStatusMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  vMovimentoUsuario := true;
end;

procedure TfrmCadastroAtendimento.mmoEditarInformesKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
//  if ((Key in CharSemAcentos + CharComAcentos )) or (key <> chr(vk_back)) then
    dtmCadastroAtendimentos.editarAtendimentos;
end;

procedure TfrmCadastroAtendimento.sbnImprimirMultiplosClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroAtendimentos.AbrirJanelaSelecao(true);
end;

procedure TfrmCadastroAtendimento.sbnTrocarUsuarioClick(Sender: TObject);
begin
  inherited;
  dtmCadastroAtendimentos.TrocarUsuarioAtendimento;
end;

procedure TfrmCadastroAtendimento.RefazConsultaAtendimentos;
begin
  dtmCadastroAtendimentos.refazconsultaAtendimento;
end;

procedure TfrmCadastroAtendimento.edtDataExit(Sender: TObject);
begin
  inherited;
//  edttpLembrar.MinDate := dtmCadastroAtendimentos.DataAtendimento;
  edttpLembrar.Calendar.MinDate.Date := dtmCadastroAtendimentos.DataAtendimento;
end;

procedure TfrmCadastroAtendimento.dbgOcorrenciasColumnMoved(
  Sender: TObject; FromIndex, ToIndex: Integer);
begin
  inherited;
  if dbgOcorrencias.DataSource.DataSet.active then
    TDBGrid(Sender).Columns[ToIndex].Index := FromIndex; // impede de mover
end;

procedure TfrmCadastroAtendimento.edttpLembrarValueValidate(
  Sender: TObject; value: String; var IsValid: Boolean);
begin
  inherited;
  try
    IsValid := strtodate(value) <= edttpLembrar.Calendar.MaxDate.Date;
    if not IsValid then
    begin
      MensagemAviso(format('Data superior ao(s) %d dia(s) permitido(s)!',[parsistema.Data_maxima_atendimento_Lembrar_em]));
      edttpLembrar.text := formatdatetime('dd/MM/yyyy',edttpLembrar.Calendar.MaxDate.Date);
      edttpLembrar.setfocus;
    end
  except
    IsValid := false;
  end;
end;

procedure TfrmCadastroAtendimento.sbnArquivosAnexadosClick(
  Sender: TObject);
begin
  inherited;
  AcionarTelaArquivosAnexados(self,
     'ATENDIMENTOS',
     dtmCadastroAtendimentos.qryAtendimentoscodigo.asstring);
end;

procedure AbrirTelaAtendimentos(
  Value: array of Variant; Modal: Boolean);
begin
  frmCadastroAtendimento := TfrmCadastroAtendimento.create(nil);
  frmCadastroAtendimento.formstyle := fsNormal;
  frmCadastroAtendimento.visible := false;
  frmCadastroAtendimento.operacaopadrao(Value);
  frmCadastroAtendimento.showmodal;
  freeandnil(frmCadastroAtendimento);
end;


procedure TfrmCadastroAtendimento.sbnContratoClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroAtendimentos.qryAtendimentoscontrato.asString <> '' then
    TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([dtmCadastroAtendimentos.qryAtendimentoscontrato.asString], 'TfrmCadastroContratos', True)

end;

initialization
  dmBasico.AbrirTelaAtendimentos := AbrirTelaAtendimentos;


end.
