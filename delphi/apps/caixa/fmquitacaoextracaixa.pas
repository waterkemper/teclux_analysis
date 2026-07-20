unit fmquitacaoextracaixa;

interface                   

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, fmcadastropadrao, StdCtrls,
  dmquitacaoextracaixa, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  fmconsultabasica, fmconsultaporcampo, ZQuery, Grids, DBGrids, cpdbgrid,
  Windows, ctconstantes, ActnList, biblio, ToolWin;

type
  TfrmQuitacaoExtraCaixa = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxQuitacaoExtraCaixa: TGroupBox;
    lblCliente: TLabel;
    sbnProcuraCliente: TSpeedButton;
    dtxNomeCliente: TtecDBText;
    edfCliente: TtecDbEditFind;
    dbgContratos: TtecDBGrid;
    dbgParcelas: TtecDBGrid;
    lblDataEmissao: TLabel;
    dtxEmissao: TtecDBText;
    lblPlano: TLabel;
    dtxDescricaoPlano: TtecDBText;
    lblValor: TLabel;
    dtxValor: TtecDBText;
    lblVendedor: TLabel;
    dtxDescricaoVendedor: TtecDBText;
    dbgNotas: TtecDBGrid;
    lblNotas: TLabel;
    sbnIncluirParcela: TSpeedButton;
    sbnExcluirParcela: TSpeedButton;
    sbnAutenticar: TSpeedButton;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure dbgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbnAutenticarClick(Sender: TObject);
    procedure sbnExcluirParcelaClick(Sender: TObject);
    procedure sbnIncluirParcelaClick(Sender: TObject);
    procedure dbgParcelasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edfClienteFound(Found: Boolean);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure dbgParcelasDblClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AcionaAlteracaoParcelas(Editando: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    function    InternoPesquisar(Titulo:String): Integer; override;
    function    JanelaPesquisa: TfrmConsultaBasica; override;
    function    TabelaDePesquisa: TZDataSet; override;
    function    ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    destructor  Destroy; override;
  end;

var
  frmQuitacaoExtraCaixa: TfrmQuitacaoExtraCaixa;
  FAlterouParcela: Boolean;
  TipoPesquisa: TtecQuitacaoExtraCaixa;

implementation

uses fmparcelaquitacaoextra, clparametrossistema;

{$R *.dfm}

{ TfrmQuitacaoExtraCaixa }

procedure TfrmQuitacaoExtraCaixa.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnAutenticar.Enabled := FAlterouParcela;
end;

constructor TfrmQuitacaoExtraCaixa.Create(AOwner: TComponent);
begin
  dtmQuitacaoExtraCaixa:= TdtmQuitacaoExtraCaixa.Create(Self);
  inherited;
  FAlterouParcela:= False;
  dbgParcelas.Columns[03].Visible:= ParSistema.ExibirDescontoSugerido;
  dbgParcelas.Columns[04].Visible:= ParSistema.ExibirDescontoSugerido;
end;

destructor TfrmQuitacaoExtraCaixa.Destroy;
begin
  dtmQuitacaoExtraCaixa.free;
  inherited;
  frmQuitacaoExtraCaixa:= nil;
end;

function TfrmQuitacaoExtraCaixa.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmQuitacaoExtraCaixa.ExisteCliente(NomeCampo,Value)
end;

function TfrmQuitacaoExtraCaixa.InternoPesquisar(Titulo: String): Integer;
begin
   Result:= mrNone;
   if CtrlOn then begin
      if ActiveControl = edfCliente then begin
         TipoConsulta:= qecCLIENTE;
         Titulo := 'Clientes';
      end
      else TipoConsulta:= qecNENHUM;

      if TipoConsulta <> qecNENHUM then begin
         dtmQuitacaoExtraCaixa.AbrirTabelasConsulta(TipoConsulta);
         Result:= inherited InternoPesquisar(Titulo);
         if Result = mrOk
         then dtmQuitacaoExtraCaixa.Selecionar(TipoConsulta);
         dtmQuitacaoExtraCaixa.FecharTabelasConsulta(TipoConsulta);
      end;
   end;

end;

function TfrmQuitacaoExtraCaixa.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmQuitacaoExtraCaixa.TabelaDePesquisa: TZDataSet;
begin
   with dtmQuitacaoExtraCaixa do
      case TipoConsulta of
         qecCLIENTE: Result:= ConsultarCliente;
         qecCONTA:   Result:= ConsultaContas;
      end;
end;

procedure TfrmQuitacaoExtraCaixa.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCliente.SetFocus;
  InternoPesquisar('');
  // se o cliente não possuir contratos, os botões de
  // incluir e excluir não podem estar habilitados...
  if dtmQuitacaoExtraCaixa.dsrContratosPorCliente.DataSet.RecordCount<1 then
  begin
    sbnIncluirParcela.Enabled := False;
    sbnExcluirParcela.Enabled := False;
    dbgParcelas.Enabled := False;
  end else
  begin
    sbnIncluirParcela.Enabled := True;
    sbnExcluirParcela.Enabled := True;
    dbgParcelas.Enabled := True;
  end;
end;

procedure TfrmQuitacaoExtraCaixa.dbgParcelasDrawColumnCell(Sender: TObject;
          const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if dtmQuitacaoExtraCaixa.ParcelaQuitada then
     dbgParcelas.Canvas.Brush.Color := $00E9E9E9;
  if dtmQuitacaoExtraCaixa.ParcelaQuitar then     dbgParcelas.Canvas.Brush.Color := $00D5FFD5;

  dbgParcelas.Canvas.Font.Color:= clBlack;  dbgParcelas.DefaultDrawColumnCell(Rect, DataCol, Column, State)
end;


procedure TfrmQuitacaoExtraCaixa.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_ESCAPE: ;
       VK_F12: if (Shift = []) and sbnAutenticar.Enabled then sbnAutenticar.Click;
  end;
end;

procedure TfrmQuitacaoExtraCaixa.sbnAutenticarClick(Sender: TObject);
begin
  inherited;
  if dtmQuitacaoExtraCaixa.ProcessarPagamento then
    FAlterouParcela:= False;
end;

procedure TfrmQuitacaoExtraCaixa.sbnExcluirParcelaClick(Sender: TObject);
begin
  inherited;
  if dtmQuitacaoExtraCaixa.ExcluirParcela then
    FAlterouParcela:= True;
end;

procedure TfrmQuitacaoExtraCaixa.sbnIncluirParcelaClick(Sender: TObject);
begin
  inherited;
  AcionaAlteracaoParcelas(False);
end;

procedure TfrmQuitacaoExtraCaixa.AcionaAlteracaoParcelas(Editando: Boolean);
begin
  if dtmQuitacaoExtraCaixa.PodeAlterarParcela then begin
    frmParcelaQuitacaoExtra := TfrmParcelaQuitacaoExtra.Create(frmParcelaQuitacaoExtra);
    if not Editando then dtmQuitacaoExtraCaixa.IncluirParcela;
    frmParcelaQuitacaoExtra.ShowModal;
    FAlterouParcela:= frmParcelaQuitacaoExtra.ParcelaAlterada;
    frmParcelaQuitacaoExtra.Free;
    dbgParcelas.SetFocus;
  end
  else MensagemAviso(ctSEMPERMISSAOALTERARPARCELA);
end;

procedure TfrmQuitacaoExtraCaixa.dbgParcelasKeyDown(Sender: TObject;
          var Key: Word; Shift: TShiftState);
begin
  inherited;
  if dbgParcelas.Focused and (Shift = [ssCtrl]) then
    case Key of
      TeclaInserirRegistro: AcionaAlteracaoParcelas(False);
      TeclaEditarRegistro : AcionaAlteracaoParcelas(True);
    end;
end;

procedure TfrmQuitacaoExtraCaixa.edfClienteFound(Found: Boolean);
begin
  inherited;
  if Found then begin
    dbgContratos.SetFocus;
    FAlterouParcela:= False;
  end
  else          edfCliente.SetFocus;
end;

procedure TfrmQuitacaoExtraCaixa.dbgParcelasDblClick(Sender: TObject);
begin
  inherited;
  AcionaAlteracaoParcelas(True);
end;

end.
