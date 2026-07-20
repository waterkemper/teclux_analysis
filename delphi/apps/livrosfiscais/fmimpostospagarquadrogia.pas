unit fmimpostospagarquadrogia;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, ComCtrls, Buttons, ExtCtrls,
  DBCtrls, StdCtrls, Mask,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica,
  //Biblio
  ctconstantes,
  //Componentes
  cpdbtext, cpnumero, cpdbdata, cpdbfindcontrols, ToolWin;

type
  TfrmImpostosPagarQuadroGIA = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    flkReceitaTributaria: TtecDBFindLookup;
    flkClassePagto: TtecDBFindLookup;
    edtVencto: TDBEditData;
    edtValor: TDBEditNumero;
    lblReceitaTributaria: TLabel;
    lblVencto: TLabel;
    lblValor: TLabel;
    lblClassePagto: TLabel;
    sbnReceitaTributaria: TSpeedButton;
    sbnClassePagto: TSpeedButton;
    dtxReceitaTributaria: TtecDBText;
    dtxClassePagto: TtecDBText;
    procedure sbnClassePagtoClick(Sender: TObject);
    procedure sbnReceitaTributariaClick(Sender: TObject);
    procedure flkReceitaTributariaEnter(Sender: TObject);
    procedure flkClassePagtoEnter(Sender: TObject);
  protected
    TipoTabela  : TtecTabelasGIA;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  PesquisaHabilitada: Boolean;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TituloPesquisa: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor destroy; override;
  end;

var
  frmImpostosPagarQuadroGIA: TfrmImpostosPagarQuadroGIA;


implementation

uses
  //Biblio
  biblio,
  //Repositorio
  fmconsultaporcampo,
  //Projetos
  dmquadrosgia;

{$R *.dfm}

constructor TfrmImpostosPagarQuadroGIA.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmQuadrosGIA.TabelaImpostoPagar
end;

destructor TfrmImpostosPagarQuadroGIA.destroy;
begin
  inherited;
  frmImpostosPagarQuadroGIA := nil;
end;

function TfrmImpostosPagarQuadroGIA.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmQuadrosGIA do
  case TipoTabela of
    tbgCLASSESPAGTO:        Result := ExisteClassesPagto(NomeCampo, Value);
    tbgRECEITASTRIBUTARIAS: Result := ExisteReceitasTributarias(NomeCampo, Value);
  else                      Result := False;
  end;
end;

procedure TfrmImpostosPagarQuadroGIA.flkClassePagtoEnter(Sender: TObject);
begin
  inherited;
  TipoTabela := tbgCLASSESPAGTO;
end;

procedure TfrmImpostosPagarQuadroGIA.flkReceitaTributariaEnter(Sender: TObject);
begin
  inherited;
  TipoTabela := tbgRECEITASTRIBUTARIAS;
end;

function TfrmImpostosPagarQuadroGIA.InternoExcluir: Boolean;
begin
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctIMPOSTOPAGARQUADROGIA])) = smbOK then
    Result := dtmQuadrosGIA.ExcluirImpostoPagar
  else
    Result := False;
end;

function TfrmImpostosPagarQuadroGIA.InternoGravar: Boolean;
begin
  Result := dtmQuadrosGIA.GravarImpostoPagar
end;

function TfrmImpostosPagarQuadroGIA.InternoIncluir: Boolean;
begin
  Result := dtmQuadrosGIA.IncluirEditarImpostoPagar(True)
end;

function TfrmImpostosPagarQuadroGIA.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then begin
    dtmQuadrosGIA.AbrirTabelasConsulta(TipoTabela);
    Result:= inherited InternoPesquisar(TituloPesquisa);
    if Result = mrOK then
      dtmQuadrosGIA.Selecionar(TipoTabela);
    dtmQuadrosGIA.FecharTabelasConsulta(TipoTabela);
  end else
    Result:= mrNone;
end;

function TfrmImpostosPagarQuadroGIA.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmImpostosPagarQuadroGIA.PesquisaHabilitada: Boolean;
begin
  if CtrlOn then begin
    if ActiveControl is TtecDBFindLookup then
      Result:= True
    else
      Result:= False;
  end else
    Result:= True;
end;

procedure TfrmImpostosPagarQuadroGIA.sbnClassePagtoClick(Sender: TObject);
begin
  inherited;
  TipoTabela := tbgCLASSESPAGTO;
  InternoPesquisar(flkClassePagto, ctCLASSESPAGTO)
end;

procedure TfrmImpostosPagarQuadroGIA.sbnReceitaTributariaClick(Sender: TObject);
begin
  inherited;
  TipoTabela := tbgRECEITASTRIBUTARIAS;
  InternoPesquisar(flkReceitaTributaria, ctRECEITASTRIBUTARIAS)
end;

function TfrmImpostosPagarQuadroGIA.TabelaDePesquisa: TZDataSet;
begin
  with dtmQuadrosGIA do
    case TipoTabela of
      tbgCLASSESPAGTO:        Result := TabelaConsultaClassesPagto;
      tbgRECEITASTRIBUTARIAS: Result := TabelaConsultaReceitasTributarias;
    else                      Result := nil;
    end;
end;

function TfrmImpostosPagarQuadroGIA.TituloPesquisa: String;
begin
  case TipoTabela of
    tbgCLASSESPAGTO:        Result := ctCLASSESPAGTO;
    tbgRECEITASTRIBUTARIAS: Result := ctRECEITASTRIBUTARIAS;
  end;
end;

end.
