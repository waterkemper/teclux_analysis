unit fmtrocarimoveiscontrato;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,BIBLIO,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, ctconstantes,
  frendereco, cpnumero, DBCtrls, cpdbmemo, cpdbtext, cpdblookupcombobox,
  dmcontratosimoveis, Mask, cpdbfindcontrols, frconsulta, frconsultacodigo,
  cpdbcombobox, {Qete,} Messages, fmconsultabasica, DB, Zquery, fmConsultaPorCampo,
  ToolWin;

type
  TfrmTrocarImoveisContrato = class(TFrmCadastroPadrao)
    gbxDadosImovelaTrocar: TGroupBox;
    gbxEmpreendimentosaTrocar: TGroupBox;
    gbxBlocosaTrocar: TGroupBox;
    gbxNumeroaTrocar: TGroupBox;
    gbxTipoUnidadeaTrocar: TGroupBox;
    dtxTipoUnidadeaTrocar: TtecDBText;
    gbxPavimentoaTrocar: TGroupBox;
    dtxpavimentoaTrocar: TtecDBText;
    gbxareasaTrocar: TGroupBox;
    gbxPrivativaaTrocar: TGroupBox;
    gbxComumaTrocar: TGroupBox;
    gbxTotalaTrocar: TGroupBox;
    gbxFracaoIdealaTrocar: TGroupBox;
    lblMais: TLabel;
    lblIgual: TLabel;
    gbxObservacoesaTrocar: TGroupBox;
    mmoObservacoesaTrocar: TtecDBMemo;
    dtxPrivativaaTrocar: TtecDBText;
    dtxComumaTrocar: TtecDBText;
    dtxtotalaTrocar: TtecDBText;
    dtxFracaoidealaTrocar: TtecDBText;
    gbxPrecoVendaaTrocar: TGroupBox;
    edtPrecoVendaaTrocar: TDBEditNumero;
    gbxObsContratoaTrocar: TGroupBox;
    mmoObsContratoaTrocar: TtecDBMemo;
    gbxDadosImovelTrocado: TGroupBox;
    gbxEmpreendimentosTrocado: TGroupBox;
    fraConsultaEmpreendimentoImovelTrocado: TfraConsultaCodigo;
    gbxBlocosTrocado: TGroupBox;
    clxBlocosTrocado: TTecDBLookupComboBox;
    gbxNumeroTrocado: TGroupBox;
    clxImoveisTrocado: TTecDBLookupComboBox;
    gbxTipoUnidadeTrocado: TGroupBox;
    dtxTipoUnidadeTrocada: TtecDBText;
    GroupBox6: TGroupBox;
    gbxPavimentoTrocado: TtecDBText;
    gbxareasTrocada: TGroupBox;
    gbxPrivativaTrocada: TGroupBox;
    dtxPrivativaTrocado: TtecDBText;
    gbxComumTrocado: TGroupBox;
    dtxComumTrocado: TtecDBText;
    gbxTotalTrocado: TGroupBox;
    dtxtotalTrocado: TtecDBText;
    gbxFracaoIdealTrocada: TGroupBox;
    dtxFracaoidealTrocada: TtecDBText;
    Label1: TLabel;
    Label2: TLabel;
    gbxObservacoesTrocada: TGroupBox;
    mmoObservacoesTrocada: TtecDBMemo;
    gbxPrecoVendaTrocado: TGroupBox;
    edtPrecoVendaTrocado: TDBEditNumero;
    gbxObsContratoTrocado: TGroupBox;
    tecDBMemo2: TtecDBMemo;
    dtxNomeBloco: TtecDBText;
    dtxCodigoEmpreendimento: TtecDBText;
    dtxDescricaoEmpreendimento: TtecDBText;
    dtxNumero: TtecDBText;
    procedure clxImoveisaTrocarCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure fraConsultaEmpreendimentoedfCodigoFound(Found: Boolean);
    procedure clxBlocosTrocadoCloseUp(Sender: TObject);
    procedure clxBlocosTrocadoEnter(Sender: TObject);
    procedure clxImoveisTrocadoEnter(Sender: TObject);
    procedure clxImoveisTrocadoExit(Sender: TObject);
    procedure clxBlocosTrocadoExit(Sender: TObject);
  private
    { Private declarations }

  protected
    Jan: TfrmConsultaPorCampo;
    TipoPesquisa: TtecPesquisa;
    procedure AtribuirParametros;
    procedure AtribuirMacro;
    procedure AlterarEstadoBotoes; override;
    function  InternoCancelar: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure CancelarInclusao(Sender: TObject);

  public
    { Public declarations }
    Editar: boolean;
    Gravando: boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Function AtualizarBlocos: Boolean;
    procedure AtualizarImoveis(Sender: TObject);
  end;

var
  frmTrocarImoveisContrato: TfrmTrocarImoveisContrato;

implementation

uses dmbasico, fmajudabt;

{$R *.dfm}

{ TfrmTrocarImoveisContrato }

procedure TfrmTrocarImoveisContrato.AtribuirParametros;
begin
  dtmContratosImoveis.RefazConsultaPorNome(dtmContratosImoveis.qryConsultaBlocos,['Empreendimento'],
                                          [fraConsultaEmpreendimentoImovelTrocado.qryProcuraEmpreendimentoscodigo.AsVariant]);
end;

function TfrmTrocarImoveisContrato.AtualizarBlocos: Boolean;
begin
  with dtmContratosImoveis do
  begin
    RefazConsulta(qryConsultaImoveis,[0],[qryConsultaBlocoscodigo.AsVariant]);
    Result:= qryConsultaImoveis.RecordCount > 0;
  end;
end;

procedure TfrmTrocarImoveisContrato.AtualizarImoveis(Sender: TObject);
begin
  with dtmContratosImoveis do
  begin
    if not (qryImoveisVendidos.State in [dsinsert,dsedit]) then
      qryImoveisVendidos.Edit;
//    qryImoveisVendidostipounidadetrocado.AsInteger  := qryConsultaImoveisunidade.AsInteger;
    qryImoveisVendidostipounidadetrocado.AsString    := qryConsultaImoveistipounidade.AsString;
    qryImoveisVendidospavimentotrocado.AsString      := qryConsultaImoveispavimento.AsString;
//    qryImoveisVendidosPrecoVenda.asfloat      := qryConsultaImoveisPreco.AsFloat;
    qryImoveisVendidosareaprivativatrocado.AsFloat   := qryConsultaImoveisareaprivativa.AsFloat;
    qryImoveisVendidosareacomumtrocado.AsFloat       := qryConsultaImoveisareacomum.AsFloat;
//    qryImoveisVendidosareatotaltrocado.AsFloat       := qryConsultaImoveisAreaTotal.AsFloat;
    qryImoveisVendidosfracaoidealtrocado.AsFloat     := qryConsultaImoveisfracaoideal.AsFloat;
//    qryImoveisVendidosnomebloco.AsString      := qryConsultaImoveisnomebloco.AsString;
//    qryImoveisVendidosempreendimento.AsString := qryConsultaImoveisempreendimento.AsString;
//    qryImoveisVendidosdatahabitese.AsDateTime := qryConsultaImoveisdatahabitese.AsDateTime;




  end;
end;

constructor TfrmTrocarImoveisContrato.Create(AOwner: TComponent);
begin
  inherited;
  DataSet:= dtmContratosImoveis.qryImoveisVendidos;
  dtmContratosImoveis.qryImoveisVendidos.Open;
  fraConsultaEmpreendimentoImovelTrocado.TipoPesquisa := pesEMPREENDIMENTOS;
  fraConsultaEmpreendimentoImovelTrocado.CondicoesdaConsulta:= AtribuirMacro;
  fraConsultaEmpreendimentoImovelTrocado.OnFound := AtribuirParametros;
  dtmContratosImoveis.CancelarInclusao := cancelarInclusao;
end;

destructor TfrmTrocarImoveisContrato.Destroy;
begin
  frmTrocarImoveisContrato:= nil;
  inherited;
end;

procedure TfrmTrocarImoveisContrato.clxImoveisaTrocarCloseUp(Sender: TObject);
begin
  inherited;
  AtualizarImoveis(Self);
  with dtmContratosImoveis do
  begin
    if not (qryImoveisVendidos.State in [dsinsert, dsedit]) then
      qryImoveisVendidos.Edit;
    if qryConsultaImoveis.RecordCount > 0 then
      qryImoveisVendidosnumerotrocado.AsString := qryConsultaImoveisimovel.AsString;
  end;
end;

function TfrmTrocarImoveisContrato.InternoCancelar: Boolean;
begin
  dtmContratosImoveis.qryImoveisVendidos.Cancel;
  dtmContratosImoveis.FecharTabelasConsultas;
  fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Text:= '';
  fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Exist;
  dtmContratosImoveis.qryConsultaBlocos.Close;
  dtmContratosImoveis.qryConsultaImoveis.Close;

end;

function TfrmTrocarImoveisContrato.InternoExcluir: Boolean;
begin
end;

function TfrmTrocarImoveisContrato.InternoGravar: Boolean;
begin
  Gravando:= True;
  dtmContratosImoveis.GravarImovelContrato;
  edtPrecoVendaTrocado.SetFocus;
  Gravando:= false;
end;

function TfrmTrocarImoveisContrato.InternoIncluir: Boolean;
begin
end;

procedure TfrmTrocarImoveisContrato.FormShow(Sender: TObject);
begin
  inherited;
  with dtmContratosImoveis do
  begin
    fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Text:= qryimoveisvendidosCodigoEmpreendimento.AsString;
    fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Exist;
    ReFazConsulta(qryConsultaBlocos,[0],[qryimoveisvendidosCodigoEmpreendimento.AsVariant]);
    ReFazConsulta(qryConsultaImoveis,[0],[qryImoveisVendidosbloco.AsVariant]);
    edtPrecoVendaTrocado.SetFocus;
  end;
end;

function TfrmTrocarImoveisContrato.InternoPesquisar(Titulo: String): Integer;
begin
  if not CtrlOn then
  begin
    TipoPesquisa:= pesIMOVEIS;
    Titulo:= 'Imóveis';
    dtmContratosImoveis.AbreTabelasConsulta(TipoPesquisa);
    Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then
    begin
      case TipoPesquisa of
        pesIMOVEIS :  begin
                        with dtmContratosImoveis do
                        begin
                          Selecionar(TipoPesquisa);
                          if (not(Editar) and not (qryImoveisVendidos.State in [dsinsert])) then
                            qryImoveisVendidos.Insert
                          else if Editar then
                            qryImoveisVendidos.Edit;
                          fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Text:= qryConsultarImoveisemp.AsString;
                          fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Exist;
                          qryImoveisVendidosbloco.AsInteger:= qryConsultarImoveisbloco.AsInteger;
                          qryImoveisVendidosnumero.AsString:= qryConsultarImoveisnumero.AsString;
                          clxImoveisTrocadoExit(Self);
                          edtPrecoVendaTrocado.SetFocus;
                        end;
                      end;
      end;
    end;
    dtmContratosImoveis.FechaTabelaConsulta(TipoPesquisa);
  end;
end;

function TfrmTrocarImoveisContrato.JanelaPesquisa: TfrmConsultaBasica;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := True;
  Result := Jan;
end;

function TfrmTrocarImoveisContrato.TabelaDePesquisa: TZDataSet;
begin
  WITH dtmContratosImoveis DO
  BEGIN
    case TipoPesquisa of
      pesIMOVEIS : Result:= qryConsultarImoveis;
    end;
  END;
end;

function TfrmTrocarImoveisContrato.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin

end;

procedure TfrmTrocarImoveisContrato.sbnProcurarClick(Sender: TObject);
begin
  TipoPesquisa:= pesIMOVEIS;
  inherited;
end;

procedure TfrmTrocarImoveisContrato.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if ActiveControl = fraConsultaEmpreendimentoImovelTrocado.edfCodigo then
    begin
      InternoCancelar;
      fraConsultaEmpreendimentoImovelTrocado.edfCodigo.SetFocus;
     end
    else
    begin
      fraConsultaEmpreendimentoImovelTrocado.edfCodigo.SetFocus;
    end;
  end
  else
    inherited;
end;

procedure TfrmTrocarImoveisContrato.AtribuirMacro;
begin
  if dtmContratosImoveis.Empreendimento <> '' then
  begin
    fraConsultaEmpreendimentoImovelTrocado.qryConsultaEmpreendimentos.MacroByName('JaCadastrado').AsString:= 'and e.Codigo = '+dtmContratosImoveis.Empreendimento;
    fraConsultaEmpreendimentoImovelTrocado.qryProcuraEmpreendimentos.MacroByName('JaCadastrado').AsString:= 'and em.Codigo = '+dtmContratosImoveis.Empreendimento;
  end;
end;

procedure TfrmTrocarImoveisContrato.fraConsultaEmpreendimentoedfCodigoFound(Found: Boolean);
begin
  inherited;
  if fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Text <> '' then
  begin
    dtmContratosImoveis.ParametrosImoveis(fraConsultaEmpreendimentoImovelTrocado.edfCodigo.Text,'','');
    AtribuirParametros;
    clxBlocosTrocado.SetFocus;
  end;
end;


procedure TfrmTrocarImoveisContrato.AlterarEstadoBotoes;
begin
  inherited;
  sbnProcurar.Enabled:= True;
end;

function TfrmTrocarImoveisContrato.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmContratosImoveis do
  begin
    case TipoPesquisa of
      pesIMOVEIS : ExisteCodigo(qryConsultarImoveis,NomeCampo,Value);
    end;
  end;    
end;

procedure TfrmTrocarImoveisContrato.clxBlocosTrocadoCloseUp(
  Sender: TObject);
begin
  inherited;
  if AtualizarBlocos then
  begin
    with dtmContratosImoveis do
    begin
      if not (qryImoveisVendidos.State in [dsinsert, dsedit]) then
        qryImoveisVendidos.Edit;
      qryImoveisVendidosblocotrocado.AsInteger:= qryConsultaBlocoscodigo.AsInteger;
    end;
  end;

end;

procedure TfrmTrocarImoveisContrato.clxBlocosTrocadoEnter(Sender: TObject);
begin
  inherited;
  clxBlocosTrocado.Color:= CorFundoControle;
  clxBlocosTrocado.OnExit:= clxBlocosTrocadoExit;
  clxBlocosTrocado.DropDown;
  with dtmContratosImoveis do
  begin
    if qryImoveisVendidos.ReadOnly then
      qryImoveisVendidos.ReadOnly:= False;
    if not (qryImoveisVendidos.State in [dsinsert, dsedit]) then
      qryImoveisVendidos.Edit;
    qryImoveisVendidosblocotrocado.AsInteger:= qryConsultaBlocoscodigo.AsInteger;
  end;

end;

procedure TfrmTrocarImoveisContrato.clxImoveisTrocadoEnter(
  Sender: TObject);
begin
  inherited;
  clxImoveisTrocado.Color:= CorFundoControle;
  clxImoveisTrocado.DropDown;
  with dtmContratosImoveis do
  begin
    if qryImoveisVendidos.ReadOnly then
      qryImoveisVendidos.ReadOnly:= False;
    if not (qryImoveisVendidos.State in [dsinsert, dsedit]) then
      qryImoveisVendidos.Edit;
    if qryConsultaImoveis.RecordCount > 0 then
      qryImoveisVendidosnumerotrocado.AsString := qryConsultaImoveisimovel.AsString;
  end;

end;

procedure TfrmTrocarImoveisContrato.clxImoveisTrocadoExit(Sender: TObject);
begin
  inherited;
    if not Gravando then
    AtualizarImoveis(Self);
end;

procedure TfrmTrocarImoveisContrato.clxBlocosTrocadoExit(Sender: TObject);
begin
  inherited;
  if not AtualizarBlocos then
    fraConsultaEmpreendimentoImovelTrocado.edfCodigo.SetFocus;
end;

procedure TfrmTrocarImoveisContrato.CancelarInclusao(Sender: TObject);
begin
  clxBlocosTrocado.SetFocus;
end;

end.
