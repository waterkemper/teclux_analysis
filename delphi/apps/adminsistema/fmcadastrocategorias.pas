unit fmcadastrocategorias;

interface 

uses
  //CLX
  SysUtils, Types, Classes, Variants, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, {Qete,} DB, biblio,
  //Componentes
  cptexto, cpdbdata, ctconstantes, cpdbfindcontrols,
  //Terceiros
  ZQuery,
  //Repositorio
  fmconsultabasica, fmconsultaporcampo, fmcadastropadrao,
  //Projeto
  ComCtrls, cpnumero, ZPgSqlQuery, cpquery, ToolWin;

type
  TfrmCadastroCategorias = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    gbxCodigo: TGroupBox;
    gbxHierarquia: TGroupBox;
    edfCodigo: TtecDbEditFind;
    edtHierarquia: TDBEditTexto;
    gbxInativo: TGroupBox;
    edtInativo: TDBEditData;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
  protected
     function  InternoIncluir: Boolean; override;
     function  InternoExcluir: Boolean; override;
     Function  InternoGravar: Boolean; Override;
     function  InternoPesquisar(Titulo:String): Integer; override;
     function  JanelaPesquisa: TfrmConsultaBasica; override;
     function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
     function  TabelaDePesquisa: TZDataSet; override;
     function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;
  public
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
  end;

var
  frmCadastroCategorias: TfrmCadastroCategorias;

implementation

uses dmcadastrocategorias;

{$R *.dfm}

constructor TfrmCadastroCategorias.Create(AOwner: TComponent);
begin
   dtmCadastroCategorias:= TdtmCadastroCategorias.Create(Self);
   inherited;
   dtmcadastroCategorias.Abre(ctCaixaCadastroHistoricos);
   DataSet:= dtmcadastroCategorias.TabelaCategorias;
end;

destructor TfrmCadastroCategorias.Destroy;
begin
  dtmcadastroCategorias:=nil;
  inherited;
  frmCadastroCategorias := nil;
end;

function TfrmCadastroCategorias.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastroCategorias.IncluirCategorias;
  end;
end;

function TfrmCadastroCategorias.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmcadastroCategorias.ExcluirCategorias;
  end;
end;

function TfrmCadastroCategorias.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmcadastroCategorias.GravarCategoria;
end;

function TfrmCadastroCategorias.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrOK;
  if not CtrlOn then begin
    dtmcadastroCategorias.Abre(ctConsultaCategorias);
    Result:= inherited InternoPesquisar(ctCategoria);
    if Result = mrOK then
       dtmcadastroCategorias.SelecionarCategorias;
    dtmcadastroCategorias.Fecha(ctConsultaCategorias);
  end;
end;

function TfrmCadastroCategorias.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroCategorias.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmcadastroCategorias.ExisteCategoria(NomeCampo, Value);
end;

function TfrmCadastroCategorias.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmcadastroCategorias.TabelaConsultarCategoria;
end;

function TfrmCadastroCategorias.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result:= dtmcadastroCategorias.TabelaCategorias;
end;

end.
