unit fmcadastrofornecedoresgrupos;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, biblio,
  //Biblio
  ctconstantes,
  //Terceiros
  ZQuery,
  //Componentes
  cpdbtext, cpdbfindcontrols,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, ComCtrls, ToolWin;

type
  TfrmCadastroFornecedoresGrupos = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    flkGrupo: TtecDBFindLookup;
    dtxGrupo: TtecDBText;
    sbnGrupo: TSpeedButton;
    flkClasse: TtecDBFindLookup;
    sbnClasse: TSpeedButton;
    dtxClasse: TtecDBText;
    gbxGrupo: TGroupBox;
    gbxClasse: TGroupBox;
    procedure sbnGrupoClick(Sender: TObject);
    procedure sbnClasseClick(Sender: TObject);
  protected
    TipoProcura: TtecPesquisa;
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
  frmCadastroFornecedoresGrupos: TfrmCadastroFornecedoresGrupos;

implementation

uses
  //Repositorio
  fmconsultaporcampo, dmcadastrofornecedores,
  //Projeto
  fmnavcontroles;

{$R *.dfm}


{ TfrmCadastroGrupoPlanoPagamento }

constructor TfrmCadastroFornecedoresGrupos.Create(AOwner: TComponent);
begin
  inherited;
  DataSet := dtmCadastroFornecedores.TabelaFornecedoresGrupos;
  TipoProcura:= pesNENHUMA;
end;

destructor TfrmCadastroFornecedoresGrupos.Destroy;
begin
  inherited;
  frmCadastroFornecedoresGrupos := nil
end;

function TfrmCadastroFornecedoresGrupos.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoProcura of
     pesGRUPOS : Result := dtmCadastroFornecedores.ExisteGrupos(NomeCampo, Value);
    pesCLASSES : Result := dtmCadastroFornecedores.ExisteClasses(NomeCampo, Value)
    else         Result := False;
  end;
end;

function TfrmCadastroFornecedoresGrupos.InternoExcluir: Boolean;
begin
  Result := dtmCadastroFornecedores.ExcluirFornecedoresGrupos
end;

function TfrmCadastroFornecedoresGrupos.InternoGravar: Boolean;
begin
  Result:= False;
  if flkGrupo.Exist then
    dtmCadastroFornecedores.GravarFornecedoresGrupos
end;

function TfrmCadastroFornecedoresGrupos.InternoIncluir: Boolean;
begin
  Result := dtmCadastroFornecedores.IncluirFornecedoresGrupos(False)
end;

function TfrmCadastroFornecedoresGrupos.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if (ActiveControl = flkGrupo) then begin
      TipoProcura:= pesGRUPOS;
      Titulo:= 'Grupos';
    end
    else if (ActiveControl = flkClasse) then begin
      TipoProcura:= pesCLASSES;
      Titulo:= 'Classes';
    end
    else
      TipoProcura:= pesNENHUMA;

    if TipoProcura <> pesNENHUMA then begin
      dtmCadastroFornecedores.AbrirTabelasConsulta(TipoProcura);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        dtmCadastroFornecedores.PosicionarTabelas(TipoProcura);
      dtmCadastroFornecedores.FecharTabelasConsulta(TipoProcura);
    end;
  end;
end;

function TfrmCadastroFornecedoresGrupos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
end;

procedure TfrmCadastroFornecedoresGrupos.sbnGrupoClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkGrupo.setFocus;
  InternoPesquisar('')
end;

function TfrmCadastroFornecedoresGrupos.TabelaDePesquisa: TZDataSet;
begin
  case TipoProcura of
     pesGRUPOS: Result := dtmCadastroFornecedores.ConsultaGrupos;
    pesCLASSES: Result := dtmCadastroFornecedores.ConsultaClasses;
    else        Result := Nil;
  end;
end;

procedure TfrmCadastroFornecedoresGrupos.sbnClasseClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkClasse.setFocus;
  InternoPesquisar('');
end;

end.
