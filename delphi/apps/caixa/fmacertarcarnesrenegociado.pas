unit fmacertarcarnesrenegociado;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmajudabt, ComCtrls, Buttons, ExtCtrls, fmcadastropadrao, StdCtrls,
  dmacertarcarnesrenegociado, Mask, cpdbfindcontrols, DBCtrls, cpdbtext,
  fmconsultabasica, fmconsultaporcampo, ZQuery, Grids, DBGrids, cpdbgrid,
  Windows, ctconstantes, ActnList, biblio, ToolWin;

type
  TfrmAcertarCarnesRenegociado = class(TfrmAjudaBt)
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
    lblValor: TLabel;
    dtxValor: TtecDBText;
    sbnIncluirParcela: TSpeedButton;
    sbnExcluirParcela: TSpeedButton;
    sbnAutenticar: TSpeedButton;
    procedure sbnProcuraClienteClick(Sender: TObject);
    procedure sbnAutenticarClick(Sender: TObject);
    procedure sbnExcluirParcelaClick(Sender: TObject);
    procedure edfClienteFound(Found: Boolean);
    procedure sbnIncluirParcelaClick(Sender: TObject);
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    function    InternoPesquisar(Titulo:String): Integer; override;
    function    JanelaPesquisa: TfrmConsultaBasica; override;
    function    TabelaDePesquisa: TZDataSet; override;
    function    ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    destructor  Destroy; override;
  end;

var
  frmAcertarCarnesRenegociado: TfrmAcertarCarnesRenegociado;

implementation

uses fmparcelaquitacaoextra, clparametrossistema;

{$R *.dfm}

{ TfrmQuitacaoExtraCaixa }

constructor TfrmAcertarCarnesRenegociado.Create(AOwner: TComponent);
begin
  dtmAcertarCarnesRenegociado:= TdtmAcertarCarnesRenegociado.Create(Self);
  inherited;
end;

destructor TfrmAcertarCarnesRenegociado.Destroy;
begin
  dtmAcertarCarnesRenegociado:=nil;
  inherited;
  frmAcertarCarnesRenegociado:= nil;
end;

function TfrmAcertarCarnesRenegociado.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmAcertarCarnesRenegociado.ExisteCliente(NomeCampo,Value)
end;

function TfrmAcertarCarnesRenegociado.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn and (ActiveControl = edfCliente) then begin
    dtmAcertarCarnesRenegociado.AbrirTabelasConsulta(qecCLIENTE);
    Result := inherited InternoPesquisar('Clientes');
    if Result = mrOK then
      dtmAcertarCarnesRenegociado.Selecionar(qecCLIENTE);
    dtmAcertarCarnesRenegociado.FecharTabelasConsulta(qecCLIENTE);
  end;
end;

function TfrmAcertarCarnesRenegociado.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := False;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmAcertarCarnesRenegociado.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmAcertarCarnesRenegociado.ConsultarCliente;
end;

procedure TfrmAcertarCarnesRenegociado.sbnProcuraClienteClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfCliente.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmAcertarCarnesRenegociado.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_ESCAPE: ;
       VK_F12: sbnAutenticar.Click;
  end;
end;

procedure TfrmAcertarCarnesRenegociado.sbnAutenticarClick(Sender: TObject);
begin
  inherited;
  dtmAcertarCarnesRenegociado.ProcessarPagamento;
end;

procedure TfrmAcertarCarnesRenegociado.sbnExcluirParcelaClick(Sender: TObject);
begin
  inherited;
  dtmAcertarCarnesRenegociado.ExcluirParcela;
end;

procedure TfrmAcertarCarnesRenegociado.edfClienteFound(Found: Boolean);
begin
  inherited;
  if Found then
       dbgContratos.SetFocus
  else edfCliente.SetFocus;
end;

procedure TfrmAcertarCarnesRenegociado.sbnIncluirParcelaClick(Sender: TObject);
begin
  inherited;
  dtmAcertarCarnesRenegociado.IncluirParcela;
end;

end.
