unit fmcadastrocontastiposrecebimentos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, frconsulta,
  frconsultacodigo, dmcadastrotabelascrediario, frlercontacorrentesaldo,
  ctconstantes, fmconsultabasica, fmconsultaporcampo, ZQuery, biblio,
  frconsultacontabil, frconsultacodigocontabil, ToolWin;

type
  TfrmCadastroContasTiposRecebimentos = class(TfrmCadastroPadrao)
    gbxFilial: TGroupBox;
    fraConsultaCodigoFilial: TfraConsultaCodigo;
    fraLerContaCorrenteSaldo1: TfraLerContaCorrenteSaldo;
    gbxEvento: TGroupBox;
    fraConsultaCodigoContabilEvento: TfraConsultaCodigoContabil;
    procedure FormLoaded(Sender: TObject);
    procedure fraLerContaCorrenteSaldo1sbnProcurarContaClick(
      Sender: TObject);
    procedure fraLerContaCorrenteSaldo1edfContaFound(Found: Boolean);
  private
    procedure CondicoesEventos;
    { Private declarations }
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
  public
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;

    { Public declarations }
  end;

var
  frmCadastroContasTiposRecebimentos: TfrmCadastroContasTiposRecebimentos;
  TipoPesquisa: TtecTabelasCrediario;
implementation

{$R *.dfm}

{ TfrmCadastroContasTiposRecebimentos }

constructor TfrmCadastroContasTiposRecebimentos.Create(AOwner: TComponent);
begin
  inherited;
  fraConsultaCodigoFilial.TipoPesquisa         := pesFILIAIS;
  fraConsultaCodigoContabilEvento.TipoPesquisa := pesEVENTO;
  fraConsultaCodigoContabilEvento.CondicoesdaConsulta := CondicoesEventos;
end;

procedure TfrmCadastroContasTiposRecebimentos.FormLoaded(Sender: TObject);
begin
  inherited;
  fraConsultaCodigoFilial.edfCodigo.SetFocus;
end;

procedure TfrmCadastroContasTiposRecebimentos.fraLerContaCorrenteSaldo1sbnProcurarContaClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(fraLerContaCorrenteSaldo1.edfConta, ctCONTAS);
end;

procedure TfrmCadastroContasTiposRecebimentos.fraLerContaCorrenteSaldo1edfContaFound(
  Found: Boolean);
begin
  inherited;
  if Found then
  begin
    fraConsultaCodigoFilial.edfCodigo.SetFocus;
    fraConsultaCodigoFilial.edfCodigo.SelectAll;
  end
  else
  begin
    fraLerContaCorrenteSaldo1.edfConta.SetFocus;
    fraLerContaCorrenteSaldo1.edfConta.SelectAll;
  end;
end;

function TfrmCadastroContasTiposRecebimentos.InternoPesquisar(
  Titulo: String): Integer;
begin
  Result:= mrOK;
  TipoPesquisa:= tbcNENHUM;
  if CtrlOn then
  begin
    if ActiveControl = fraLerContaCorrenteSaldo1.edfConta then
      TipoPesquisa:= tbcCONTAS;

    if TipoPesquisa <> tbcNENHUM then
    begin
      dtmCadastroTabelasCrediario.AbrirTabelasConsulta(TipoPesquisa);
      Result:= inherited InternoPesquisar(Titulo);
      if Result = mrOK then
      begin
        dtmCadastroTabelasCrediario.SelecionarMultiplas(TipoPesquisa);
        if (TipoPesquisa = tbcCONTAS) then
          fraLerContaCorrenteSaldo1.edfConta.Exist;
      end;
      dtmCadastroTabelasCrediario.FecharTabelasConsulta(TipoPesquisa);
    end;
  end;
end;

function TfrmCadastroContasTiposRecebimentos.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmCadastroTabelasCrediario do begin
    case TipoPesquisa of
      tbcCONTAS: Result := ExisteConta(NomeCampo, Value)
      else Result := False;
    end;
  end;
end;

function TfrmCadastroContasTiposRecebimentos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa:= True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroContasTiposRecebimentos.TabelaDePesquisa: TZDataSet;
begin
  with dtmCadastroTabelasCrediario do
    case TipoPesquisa of
      tbcCONTAS : Result := qryConsultaContas;
      else Result := nil;
    end;
  end;
function TfrmCadastroContasTiposRecebimentos.InternoExcluir: Boolean;
begin
  result := inherited InternoExcluir;
  if result then
    dtmCadastroTabelasCrediario.ExcluirContasTiposRecebimentos;
end;

function TfrmCadastroContasTiposRecebimentos.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then
    dtmCadastroTabelasCrediario.GravarContasTiposRecebimentos;
end;

function TfrmCadastroContasTiposRecebimentos.InternoIncluir: Boolean;
begin
  Result := dtmCadastroTabelasCrediario.IncluirContasTiposRecebimentos;
end;

procedure TfrmCadastroContasTiposRecebimentos.CondicoesEventos;
begin
  fraConsultaCodigoContabilEvento.qryConsultaEventos.MacroByName('condicoes').AsString := 'AND e.tipomovimentacao = ''E'' ';
  fraConsultaCodigoContabilEvento.qryProcuraEventos.MacroByName('condicoes').AsString  := 'AND e.tipomovimentacao = ''E'' ';
end;

destructor TfrmCadastroContasTiposRecebimentos.Destroy;
begin
  inherited;
  frmCadastroContasTiposRecebimentos := nil;
end;

end.
