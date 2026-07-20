unit fmcadastroimoveis;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs, {Qete,}
  biblio, dmtecsoft, dmbasico, DB, ctconstantes, fmcadastropadrao,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, frconsulta, frconsultacodigo,
  Mask, cpdbfindcontrols, dmcadastroimoveis, cpdbradiogroup, cpnumero,
  DBCtrls, cpdbmemo, frendereco, cpdbtext, fmconsultabasica, ZQuery,
  fmconsultaporcampo, cppagecontrol, cpdbcombobox, Grids, DBGrids,
  cpdbgrid, cptexto, cpdblookupcombobox, ToolWin;

type
  TfrmCadastroImoveis = class(TfrmCadastroPadrao)
    gbxImoveis: TGroupBox;
    gbxDados: TGroupBox;
    gbxNumero: TGroupBox;
    gbxEmpreendimentos: TGroupBox;
    gbxAreas: TGroupBox;
    gbxPrivativa: TGroupBox;
    gbxComum: TGroupBox;
    gbxTotal: TGroupBox;
    gbxFracaoIdeal: TGroupBox;
    lblMais: TLabel;
    lblIgual: TLabel;
    edtareaprivativa: TDBEditNumero;
    edtAreaComum: TDBEditNumero;
    edtAreaTotal: TDBEditNumero;
    edtfracaoIdeal: TDBEditNumero;
    gbxPreco: TGroupBox;
    edtPrecoImovel: TDBEditNumero;
    gbxObsImovel: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    gbxPavimentos: TGroupBox;
    gbxBlocos: TGroupBox;
    pgcDadosAdicionais: TtecPageControl;
    tstCompradores: TTabSheet;
    tstOutrosImoveis: TTabSheet;
    gbxContrato: TGroupBox;
    edtContrato: TDBEditNumero;
    dbgCompradores: TtecDBGrid;
    edfCodigoEmpreendimento: TtecDBFindLookup;
    sbnProcuraEmpreendimento: TSpeedButton;
    dtxDescricao: TtecDBText;
    dbgOutrosImoveis: TtecDBGrid;
    rgpsituacao: TtecDBRadioGroup;
    rgbDisponivel: TtecRadioButton;
    Rgbreservado: TtecRadioButton;
    Rgbvendido: TtecRadioButton;
    sbnProcurarNUmeroImoveis: TSpeedButton;
    edfNumeroImovel: TtecDbEditFind;
    edtPavimento: TDBEditTexto;
    cbxBlocos: TTecDBLookupComboBox;
    gbxObsEmpreendimento: TGroupBox;
    mmoobservacoesimoveis: TtecDBMemo;
    gbxTipodeUnidade: TGroupBox;
    cbxTipodeUnidade: TTecDBLookupComboBox;
    lblAreasDo: TLabel;
    GroupBox5: TGroupBox;
    gbxAreaTotal: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    DBEditNumero1: TDBEditNumero;
    DBEditNumero3: TDBEditNumero;
    DBEditNumero2: TDBEditNumero;
    DBEditNumero4: TDBEditNumero;
    procedure cbxBlocosChange(Sender: TObject);
    procedure edfNumeroImovelChange(Sender: TObject);
    procedure edfNumeroImovelExit(Sender: TObject);
    procedure edfCodigoEmpreendimentoFound(Found: Boolean);
    procedure sbnProcuraEmpreendimentoClick(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure sbnProcurarNUmeroImoveisClick(Sender: TObject);
    procedure edfNumeroImoveisFound(Found: Boolean);
    procedure cbxBlocosEnter(Sender: TObject);
    procedure cbxBlocosExit(Sender: TObject);
    procedure cbxBlocosCloseUp(Sender: TObject);
    procedure edfNumeroImovelFound(Found: Boolean);
    procedure cbxBlocosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfNumeroImovelEnter(Sender: TObject);
    procedure edtfracaoIdealExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbxTipodeUnidadeCloseUp(Sender: TObject);
    procedure cbxTipodeUnidadeEnter(Sender: TObject);
    procedure cbxTipodeUnidadeExit(Sender: TObject);
    procedure cbxTipodeUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    CodigoImovel: String;
    NomeBloco: String;
    Acessado: Boolean;
    AcessadoTipoUnidade: Boolean;

    procedure AtribuirCampos;

  protected
    function PermitirProcura: Boolean;
    function GetTitulo: String;
    function InternoGravar: Boolean; override;
    function InternoCancelar: Boolean; override;
    function InternoExcluir: Boolean; override;
    function InternoIncluir: boolean; override;
    function InternoPesquisar(Titulo:String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function TabelaDePesquisa: TZDataSet; override;
    function TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;
    procedure OnEnterComboBlocos;
    procedure OnEnterComboTipodeUnidade;
  public
    { Public declarations }
    TipoPesquisa : TtecPesquisa;
    ParametroEmpreendimento : Variant;
    ParametroBloco          : Variant;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroImoveis: TfrmCadastroImoveis;

implementation

uses fmnavcontroles, fmajudabt;

{$R *.dfm}

{ TfrmCadastroImoveis }

procedure TfrmCadastroImoveis.AtribuirCampos;
begin
  with dtmCadastroImoveis do
  begin
    qryConsultaImoveis.ParamByName('Empreendimento').AsInteger:=  qryProcuraEmpreendimentoscodigo.AsInteger;
    qryConsultaImoveis.ParamByName('Bloco').AsInteger:= qryConsultaBlocoscodigo.AsInteger;;
  end;
end;

constructor TfrmCadastroImoveis.Create(AOwner: TComponent);
begin
  dtmCadastroImoveis:= TdtmCadastroImoveis.Create(Self);
  inherited;
  dtmCadastroImoveis.qryImoveis.ParamByName('Imovel').AsString:=  '';
  dtmCadastroImoveis.qryImoveis.ParamByName('Bloco').AsInteger:= 0;
  DataSet:= dtmCadastroImoveis.qryImoveis;
  dtmCadastroImoveis.qryImoveis.Open;
  dtmCadastroImoveis.qryProcuraEmpreendimentos.Open;
  edfCodigoEmpreendimento.SetFocus;
  edfNumeroImovel.SetControl(False);
end;

destructor TfrmCadastroImoveis.Destroy;
begin
  dtmCadastroImoveis:= nil;
  inherited;
  frmCadastroImoveis:= nil;
end;

function TfrmCadastroImoveis.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroImoveis do
  begin
    case TipoPesquisa of
      pesIMOVEIS         : Result:= ExisteImoveis(NomeCampo, Value);
      pesEMPREENDIMENTOS : result:= ExisteEmpreendimento(NomeCampo, Value);
      pesNUMEROSIMOVEIS  : Result:= ExisteNumeroImoveis(NomeCampo, Value);
    end;
  end;
end;

function TfrmCadastroImoveis.GetTitulo: String;
begin
  case TipoPesquisa of
    pesIMOVEIS         : Result:= 'Imóveis';
    pesNUMEROSIMOVEIS  : Result:= 'Imóveis';
    pesEMPREENDIMENTOS : Result:= 'Empreendimentos';
  end;
end;

function TfrmCadastroImoveis.InternoPesquisar(Titulo: String): Integer;
begin
  NomeBloco:= '';
  Result:= mrCancel;

  with dtmCadastroImoveis do
  begin
    AbreTabelasConsulta(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      Selecionar(TipoPesquisa);
    FechaTabelasConsulta(TipoPesquisa);
  end;

  if TipoPesquisa = pesIMOVEIS then
  begin
    with dtmCadastroImoveis do
    begin
      if qryImoveis.RecordCount > 0 then
        edtPavimento.SetFocus
      else
        edfNumeroImovel.SetFocus;
    end;
  end;

  if TipoPesquisa = pesNUMEROSIMOVEIS then
  begin
    if dtmCadastroImoveis.qryImoveis.RecordCount > 0 then
      edfNumeroImovel.SetFocus;
    if dtmCadastroImoveis.Vendido then
      gbxContrato.Visible:= true;
  end;
end;

function TfrmCadastroImoveis.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  case TipoPesquisa of
    pesIMOVEIS, pesEMPREENDIMENTOS, pesNUMEROSIMOVEIS :
      begin
        TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
        TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
      end;
  end;
end;

function TfrmCadastroImoveis.PermitirProcura: Boolean;
begin

end;

function TfrmCadastroImoveis.TabelaDePesquisa: TZDataSet;
begin
  with dtmCadastroImoveis do
  begin
    case TipoPesquisa of
      pesIMOVEIS         : Result:= qryCOnsultaImoveis;
      pesNUMEROSIMOVEIS  : Result:= qryConsultaNumeroImovel;
      pesEMPREENDIMENTOS : Result:= qryConsultaEmpreendimentos;
    end;
  end;
end;

function TfrmCadastroImoveis.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result := nil;
  with dtmCadastroImoveis do
  begin
    case TipoPesquisa of
      pesIMOVEIS         : Result:= qryConsultaImoveis;
      pesNUMEROSIMOVEIS  : Result:= qryConsultaNumeroImovel;
      pesEMPREENDIMENTOS : result:= qryConsultaEmpreendimentos;
    end;
  end;
end;

procedure TfrmCadastroImoveis.cbxBlocosChange(Sender: TObject);
begin
  inherited;
    dtmCadastroImoveis.qryImoveis.ParamByName('Bloco').AsInteger:= dtmCadastroImoveis.qryConsultaBlocoscodigo.AsInteger;
end;

function TfrmCadastroImoveis.InternoGravar: Boolean;
begin
  if not dtmCadastroImoveis.GravarImovel
  then MensagemAviso('Os seguintes campos não foram preenchidos:'+#10#13+ dtmCadastroImoveis.Mensagem);
end;

procedure TfrmCadastroImoveis.edfNumeroImovelChange(Sender: TObject);
begin
  inherited;
  CodigoImovel := edfNumeroImovel.Text;
end;

procedure TfrmCadastroImoveis.edfNumeroImovelExit(Sender: TObject);
begin
  inherited;
  dtmCadastroImoveis.NumeroImovel:= edfNumeroImovel.Text;
  dtmCadastroImoveis.AbrirImoveis;
end;

procedure TfrmCadastroImoveis.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if ActiveControl = edfCodigoEmpreendimento then
    begin
      InternoCancelar;
      edfCodigoEmpreendimento.SetFocus;
     end
    else if ActiveControl = edfNumeroImovel then
    begin
      edfCodigoEmpreendimento.SetFocus
    end
    else
      edfNumeroImovel.SetFocus
  end
  else if Key = VK_F9 then
  begin
    if (edfCodigoEmpreendimento.Focused) and (Shift = [ssCtrl]) then
    begin
      TipoPesquisa:= pesEMPREENDIMENTOS;
      InternoPesquisar('Empreendimentos');
    end
    else if (edfNumeroImovel.Focused) and (shift = [ssCtrl]) then
    begin
      TipoPesquisa:= pesNUMEROSIMOVEIS;
      InternoPesquisar('Imóveis');
    end
    else
    begin
      if sbnProcurar.Enabled then
      begin
        TipoPesquisa:= pesIMOVEIS;
        InternoPesquisar('Imóveis');
      end;
    end;
  end
  else
    inherited;
end;

function TfrmCadastroImoveis.InternoCancelar: Boolean;
begin
  with dtmCadastroImoveis do
  begin
    Cancelado:= True;
    qryImoveis.Cancel;
    dtmCadastroImoveis.Bloqueado:= False;
    //ReFazConsulta(qryImoveis,[0,1],[0,'']);
    //qryConsultaBlocos.Close;
    Cancelado:= False;
  end;
  gbxContrato.Visible:= False;
end;

procedure TfrmCadastroImoveis.edfCodigoEmpreendimentoFound(Found: Boolean);
begin
  inherited;
  with dtmCadastroImoveis do
  begin
    RefazConsulta(qryProcuraEmpreendimentos,[0],[strtoint(edfCodigoEmpreendimento.Text)]);
    RefazConsultaBlocos(strtoint(edfCodigoEmpreendimento.Text));
   // PreencherCombo;
  end;
end;

procedure TfrmCadastroImoveis.sbnProcuraEmpreendimentoClick(Sender: TObject);
begin
  inherited;
  TipoPesquisa:= pesEMPREENDIMENTOS;
  InternoPesquisar(edfCodigoEmpreendimento, 'Empreendimento');
end;

procedure TfrmCadastroImoveis.sbnProcurarClick(Sender: TObject);
begin
  TipoPesquisa:= pesIMOVEIS;
  inherited;
end;

function TfrmCadastroImoveis.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, ['o IMÓVEL'])) = smbOk then
  begin
    dtmCadastroImoveis.ExcluirImovel;
    dtmCadastroImoveis.qryImoveis.Cancel;
    dtmCadastroImoveis.qryProcuraEmpreendimentos.Close;
    dtmCadastroImoveis.ReFazConsulta(dtmCadastroImoveis.qryProcuraEmpreendimentos,[0],[0]);
    edfCodigoEmpreendimento.SetFocus;
  end;
end;

function TfrmCadastroImoveis.InternoIncluir: boolean;
begin
  dtmCadastroImoveis.FechaTabelasSecundarias;
  edfCodigoEmpreendimento.Clear;
  edfCodigoEmpreendimento.Exist;
  //cbxBlocos.Clear;
  //cbxBlocos.ItemIndex:= -1;
  dtmCadastroImoveis.IncluirImovel;
  if dtmCadastroImoveis.Empreendimento > 0 then
  begin
    edfCodigoEmpreendimento.Text := inttostr(dtmCadastroImoveis.Empreendimento);
    edfCodigoEmpreendimento.Exist;
    dtmCadastroImoveis.qryImoveisbloco.AsInteger:= dtmCadastroImoveis.Bloco;
    edfNumeroImovel.SetFocus;
  end
  else
  begin
    dtmCadastroImoveis.qryConsultaBlocos.Close;
    edfCodigoEmpreendimento.SetFocus;
  end;
end;

procedure TfrmCadastroImoveis.sbnProcurarNumeroImoveisClick(
  Sender: TObject);
begin
  inherited;
  TipoPesquisa:= pesNUMEROSIMOVEIS;
  InternoPesquisar(edfNumeroImovel, 'Imóveis');
end;

procedure TfrmCadastroImoveis.edfNumeroImoveisFound(Found: Boolean);
begin
  inherited;
  edtPavimento.SetFocus;
end;

procedure TfrmCadastroImoveis.cbxBlocosEnter(Sender: TObject);
begin
  inherited;
  OnEnterComboBlocos;
end;

procedure TfrmCadastroImoveis.cbxBlocosExit(Sender: TObject);
begin
  inherited;
  if not (dtmCadastroImoveis.qryImoveis.State = dsedit) then
    dtmCadastroImoveis.qryImoveis.Edit;
  dtmCadastroImoveis.qryImoveisbloco.AsVariant := dtmCadastroImoveis.qryConsultaBlocoscodigo.AsVariant;
  cbxBlocos.Color:= clWindow;
  cbxTipodeUnidade.SetFocus;
{  edfNumeroImovel.SetControl(false);}
  Acessado:= False;
end;

procedure TfrmCadastroImoveis.cbxBlocosCloseUp(Sender: TObject);
begin
  inherited;
{  edfNumeroImovel.SetFocus;}
  cbxTipodeUnidade.SetFocus;
end;

procedure TfrmCadastroImoveis.edfNumeroImovelFound(Found: Boolean);
begin
  inherited;
  with dtmCadastroImoveis do
  begin
    if qryImoveis.RecordCount > 0 then
    begin
      if SituacaoContrato in [sciQUITADO, sciVENDIDO] then
        edtPavimento.SetFocus;
    end
    else
    begin
      IncluirImovel;
      qryImoveisnumero.AsString:= CodigoImovel;
      edtPavimento.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroImoveis.cbxBlocosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
{    edfNumeroImovel.SetFocus;}
   cbxTipodeUnidade.SetFocus;

  if (key = VK_DOWN) and not(Acessado) then
  begin
    key := 0;
    cbxBlocos.DropDown;
    acessado:= True;
  end;
end;


procedure TfrmCadastroImoveis.edfNumeroImovelEnter(Sender: TObject);
begin
  inherited;
  if (dtmCadastroImoveis.qryImoveis.State <> dsinsert) then
    edfNumeroImovel.SetControl(True)
  else
    edfNumeroImovel.SetControl(False);
end;

procedure TfrmCadastroImoveis.edtfracaoIdealExit(Sender: TObject);
begin
  inherited;
  if edtfracaoIdeal.ValorSemFormatacao > 100 then
  begin
    MensagemAviso(ctERRORVALORINVALIDO);
    edtfracaoIdeal.SetFocus
  end;
end;

procedure TfrmCadastroImoveis.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if edfNumeroImovel.Focused then
    edfNumeroImovel.OnEnter:= nil;
end;

procedure TfrmCadastroImoveis.AlterarEstadoBotoes;
begin
  inherited;
  with dtmCadastroImoveis do
  begin
    if (SituacaoContrato IN [sciVENDIDO, sciQUITADO, sciRESERVADO]) then
      sbnExcluir.Enabled := false
    else
    begin
      if (qryImoveis.RecordCount > 0) then
        sbnExcluir.Enabled := True;
    end;
  end;
end;

procedure TfrmCadastroImoveis.OnEnterComboBlocos;
begin
  if dtmCadastroImoveis.qryProcuraEmpreendimentoscodigo.AsInteger > 0 then
  begin
    cbxBlocos.Color:= CorFundoControle;
    //cbxBlocos.DropDown;
    dtmCadastroImoveis.qryImoveis.ReadOnly:= False;
    dtmCadastroImoveis.qryImoveis.Edit;
  end;
end;

procedure TfrmCadastroImoveis.cbxTipodeUnidadeCloseUp(Sender: TObject);
begin
  inherited;
  edfNumeroImovel.SetFocus;
end;

procedure TfrmCadastroImoveis.cbxTipodeUnidadeEnter(Sender: TObject);
begin
  inherited;
  OnEnterComboTipodeUnidade;
end;

procedure TfrmCadastroImoveis.OnEnterComboTipodeUnidade;
begin
  if dtmCadastroImoveis.qryProcuraEmpreendimentoscodigo.AsInteger > 0 then
  begin
    cbxTipodeUnidade.Color:= CorFundoControle;
    dtmCadastroImoveis.qryImoveis.ReadOnly:= False;
    dtmCadastroImoveis.qryImoveis.Edit;
  end;
end;

procedure TfrmCadastroImoveis.cbxTipodeUnidadeExit(Sender: TObject);
begin
  inherited;
  if not (dtmCadastroImoveis.qryImoveis.State = dsedit) then
    dtmCadastroImoveis.qryImoveis.Edit;
  dtmCadastroImoveis.qryImoveisUnidade.AsVariant := dtmCadastroImoveis.qryConsultaTiposUnidadescodigo.AsVariant;
  cbxTipodeUnidade.Color:= clWindow;
  edfNumeroImovel.SetControl(false);
  AcessadoTipoUnidade := False;
end;

procedure TfrmCadastroImoveis.cbxTipodeUnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    edfNumeroImovel.SetFocus;
  if (key = VK_DOWN) and not(AcessadoTipoUnidade) then
  begin
    key := 0;
    cbxTipodeUnidade.DropDown;
    AcessadoTipoUnidade := True;
  end;
end;

end.
