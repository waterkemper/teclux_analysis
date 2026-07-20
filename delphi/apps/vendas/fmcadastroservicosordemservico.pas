unit fmcadastroservicosordemservico;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, ComCtrls,
  //Biblio
  ctconstantes,
  //Componentes
  cpdbtext, cpnumero, cpdbfindcontrols, cpdbradiogroup,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, cptexto, ActnList, cpdbmemo, ToolWin;

type
  TfrmCadastroServicosOrdemServico = class(TfrmCadastroPadrao)
    flkServico: TtecDBFindLookup;
    dtxDescricaoServico: TtecDBText;
    sbnProcuraServicos: TSpeedButton;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    edtISSQN: TDBEditNumero;
    edtValor: TDBEditNumero;
    mmoComplemento: TtecDBMemo;
    edtQuantidade: TDBEditNumero;
    gbxServico: TGroupBox;
    gbxQuantidade: TGroupBox;
    gbxAliquotaISS: TGroupBox;
    gbxValorServicos: TGroupBox;
    lblAliqISS: TLabel;
    gbxComplemento: TGroupBox;
    procedure flkServicoMessage(var Msg: String);
    procedure sbnProcuraServicosClick(Sender: TObject);
  protected
    TipoConsulta: TtecOrdemServicoTipoConsulta;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroServicosOrdemServico: TfrmCadastroServicosOrdemServico;

implementation

uses
  //Biblio
  biblio, clusuario, clparametrossistema,
  //Repositorio
  fmconsultaporcampo,
  //Projeto
  dmordemservico;

{$R *.dfm}

{ TfrmCadastroServicosOrdemServico }

constructor TfrmCadastroServicosOrdemServico.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmOrdemServico.TabelaServicosOrdemServico;
  TipoConsulta := ctosNENHUM;
end;

destructor TfrmCadastroServicosOrdemServico.Destroy;
begin
  inherited;
  frmCadastroServicosOrdemServico := nil;
end;

function TfrmCadastroServicosOrdemServico.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoConsulta = ctosSERVICOSOS then
    Result := dtmOrdemServico.ExisteServico(NomeCampo, Value)
  else
    Result := False;
end;

procedure TfrmCadastroServicosOrdemServico.flkServicoMessage(var Msg: String);
begin
  inherited;
  Msg:= Format(ctREGISTROINCLUIDO, [flkServico.Text,'na OS']);
end;

function TfrmCadastroServicosOrdemServico.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
  begin
    Result := dtmOrdemServico.ExcluirServicoOrdemServico;
    flkServico.SetFocus;
  end;
end;

function TfrmCadastroServicosOrdemServico.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
  begin
    Result := dtmOrdemServico.GravarServicoOrdemServico;
    if Result then
    begin
     // dtmCadastroContratos.CalcularValorTotalServicos;     //  dtmCadastroContratos.CalcularValorAVista;   end;    flkServico.SetFocus;
  end;
end;
end;

function TfrmCadastroServicosOrdemServico.InternoIncluir: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
  begin
    Result := dtmOrdemServico.IncluirServicosOrdemServico(False);
    flkServico.SetFocus;
  end;
end;

function TfrmCadastroServicosOrdemServico.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNONE;
  if CtrlOn then
  begin
    if ActiveControl = flkServico then
    begin
      Titulo := 'Serviços';
      TipoConsulta:= ctosSERVICOSOS;
    end
    else
    begin
      TipoConsulta:= ctosNENHUM;
    end;

    if TipoConsulta <> ctosNENHUM then
    begin
      dtmOrdemServico.AbreTabelasConsulta(TipoConsulta);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
      begin
        dtmOrdemServico.SelecionaTabelasConsulta(TipoConsulta);
      end;
      dtmOrdemServico.FechaTabelasConsulta(TipoConsulta);
    end;
  end;
end;

function TfrmCadastroServicosOrdemServico.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa     := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroServicosOrdemServico.TabelaDePesquisa: TZDataSet;
begin
  if TipoConsulta = ctosSERVICOSOS then
  begin
    Result := dtmOrdemServico.TabelaConsultaServicos;
  end
  else
  begin
    Result := nil
  end;
end;

procedure TfrmCadastroServicosOrdemServico.sbnProcuraServicosClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkServico.SetFocus;
  InternoPesquisar('');
end;
end.
