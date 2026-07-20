unit fmcadastrotabelasgia;

interface

uses

  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ComCtrls, ExtCtrls, Buttons, {Qete,}
  Grids, DBGrids,
  // Componentes
  cpdbfindcontrols, cpdata, cpnumero, cptexto, cpdbdata, cpdbgrid,
  cpdbtext, cppagecontrol, cpquery, cpdbradiogroup,
  // Biblio
  ctconstantes, biblio,
  // Terceiros
  ZQuery,
  // Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao, frcomissao,
  // Projeto
  dmcadastrotabelasgia, ToolWin;

type
  TfrmCadastroTabelasGIA = class(TfrmCadastroPadrao)
    pgcTabelas: TtecPageControl;
    tstClassesPagto: TTabSheet;
    tstReceitasTributarias: TTabSheet;
    gbxClassesPagto: TGroupBox;
    edtDescricaoClassesPagto: TDBEditTexto;
    lblDescricaoClassesPagto: TLabel;
    lblCodigoClassesPagto: TLabel;
    edfCodigoClassePagto: TtecDbEditFind;
    gbxColuna: TGroupBox;
    lblCodigoReceita: TLabel;
    lblDescricaoReceita: TLabel;
    edtDescricaoReceita: TDBEditTexto;
    edfCodigoReceita: TtecDbEditFind;
    pnlFundoJanela: TPanel;
    lblPeriodoReceita: TLabel;
    edtPeriodoReceita: TDBEditTexto;
    procedure pgcTabelasChange(Sender: TObject);
  protected
    TipoTabela  : TtecTabelasGIA;
    TipoPesquisa: TtecPesquisa;
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
    function TituloPesquisa : String;
    function PesquisaHabilitada: Boolean;
  end;

var
  frmCadastroTabelasGIA: TfrmCadastroTabelasGIA;

implementation

{$R *.dfm}

constructor TfrmCadastroTabelasGIA.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroTabelasGIA := TdtmCadastroTabelasGIA.Create(Self);
  dtmCadastroTabelasGIA.Abre(ctLIVTabelaClassesPagto);
  pgcTabelas.ActivePage := tstClassesPagto;
  DataSet := dtmCadastroTabelasGIA.TabelaClassesPagto;
end;

destructor TfrmCadastroTabelasGIA.Destroy;
begin
  dtmCadastroTabelasGIA := nil;
  inherited;
  frmCadastroTabelasGIA := nil;
end;

procedure TfrmCadastroTabelasGIA.pgcTabelasChange(Sender: TObject);
begin
  with dtmCadastroTabelasGIA do begin
    case TtecTabelasGIA(pgcTabelas.ActivePageIndex) of
      tbgCLASSESPAGTO:        DataSet := TabelaClassesPagto;
      tbgRECEITASTRIBUTARIAS: DataSet := TabelaReceitasTributarias;
    end;
    TipoTabela := TtecTabelasGIA(pgcTabelas.ActivePageIndex);
    AbrirTabelasCadastro(TipoTabela);
  end;
end;

function TfrmCadastroTabelasGIA.PesquisaHabilitada: Boolean;
begin
  if CtrlOn then begin
    if ActiveControl is TtecDBFindLookup then begin
      Result:= True;
    end else
      Result:= False;
  end else begin
    TipoPesquisa:= pesNENHUMA;
    Result:= True;
  end;
end;

function TfrmCadastroTabelasGIA.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrNone;
  if PesquisaHabilitada then
    with dtmCadastroTabelasGIA do
    begin
      AbrirTabelasConsulta(TipoTabela);
      Result:= inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then
        Selecionar(TipoTabela);
      FecharTabelasConsulta(TipoTabela);
    end;
end;

function TfrmCadastroTabelasGIA.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result and not CtrlOn then
     with dtmCadastroTabelasGIA do
      case TipoTabela of
        tbgCLASSESPAGTO:        Result := IncluirClassesPagto;
        tbgRECEITASTRIBUTARIAS: Result := IncluirReceitasTributarias;
      end;
end;

function TfrmCadastroTabelasGIA.InternoExcluir: Boolean;
begin
  Result := False;
  if not CtrlOn then begin
    case TipoTabela of
      tbgCLASSESPAGTO:        Result := dtmCadastroTabelasGIA.ExcluirClassesPagto;
      tbgRECEITASTRIBUTARIAS: Result := dtmCadastroTabelasGIA.ExcluirReceitasTributarias;
    end;
    if Result then
      Result:= inherited InternoExcluir;
  end
end;

function TfrmCadastroTabelasGIA.InternoGravar: Boolean;
begin
  Result := True;
  if ActiveControl is TtecDBFindLookup then
    Result := TtecDBFindLookup(ActiveControl).Exist;
  if Result then begin
    Result := inherited InternoGravar;
    if Result then
      with dtmCadastroTabelasGIA do
      case TipoTabela of
        tbgCLASSESPAGTO:        Result := GravarClassesPagto;
        tbgRECEITASTRIBUTARIAS: Result := GravarReceitasTributarias;
      end;
  end;
end;

function TfrmCadastroTabelasGIA.TituloPesquisa: String;
begin
  case TipoTabela of
    tbgCLASSESPAGTO:        Result := ctCLASSESPAGTO;
    tbgRECEITASTRIBUTARIAS: Result := ctRECEITASTRIBUTARIAS;
  end;
end;

function TfrmCadastroTabelasGIA.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroTabelasGIA.TabelaDePesquisa: TZDataSet;
begin
  with dtmCadastroTabelasGIA do
    case TipoTabela of
      tbgCLASSESPAGTO:        Result := TabelaConsultaClassesPagto;
      tbgRECEITASTRIBUTARIAS: Result := TabelaConsultaReceitasTributarias;
    else                      Result := nil;
    end;
end;

function TfrmCadastroTabelasGIA.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroTabelasGIA do
  case TipoTabela of
    tbgCLASSESPAGTO:        Result := ExisteClassesPagto(NomeCampo, Value);
    tbgRECEITASTRIBUTARIAS: Result := ExisteReceitasTributarias(NomeCampo, Value);
  else                      Result := False;
  end;
end;

end.
