unit fmcadastrocobranca;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask, DateUtils,
  cpdbfindcontrols, cpnumero, cpdbdata, dmdefinircobrador,
  fmconsultabasica, fmconsultaporcampo, ZQuery, DBCtrls,
  cpdbtext, ctconstantes, biblio, cpdbmemo, ToolWin;

type
  TfrmCadastroCobranca = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    gbxParcelasDevolucao: TGroupBox;
    flkCobrador: TtecDBFindLookup;
    lblCobrador: TLabel;
    sbnCobrador: TSpeedButton;
    dtxCobrador: TtecDBText;
    lblEmissao: TLabel;
    lblRetorno: TLabel;
    lblObservacao: TLabel;
    edtEmissao: TDBEditData;
    edtRetorno: TDBEditData;
    mmoObservacao: TtecDBMemo;
    procedure sbnCobradorClick(Sender: TObject);
  protected
    dtmCobrador: TdtmDefinirCobrador;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    destructor Destroy; override;
    procedure  SetDataModulo(Dtm: TdtmDefinirCobrador);
  end;
var
  frmCadastroCobranca: TfrmCadastroCobranca;
  TipoProcura     : TtecCobranca;

implementation

{$R *.dfm}

{ TfrmCadastroParcelaDevolucao }

destructor TfrmCadastroCobranca.Destroy;
begin
  inherited;
  frmCadastroCobranca:= nil;
end;

function TfrmCadastroCobranca.ExisteInformacao(Parametro: Integer;
         NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCobrador.ExisteCobrador(NomeCampo, Value);
end;

function TfrmCadastroCobranca.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then
    Result:= dtmCobrador.ExcluirCobranca;
end;

function TfrmCadastroCobranca.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
     dtmCobrador.GravarCobranca;
end;

function TfrmCadastroCobranca.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
    Result:= dtmCobrador.IncluirCobranca(False);
end;

function TfrmCadastroCobranca.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  with dtmCobrador do begin
    if CtrlOn and (ActiveControl is TtecFindCustom) then begin
      Titulo     := 'Cobradores';
      TipoProcura:= cobCOBRADOR;

      AbrirTabelas(TipoProcura);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
        Selecionar(TipoProcura);
      FecharTabelas(TipoProcura);
    end;
  end
end;

function TfrmCadastroCobranca.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmCadastroCobranca.SetDataModulo(Dtm: TdtmDefinirCobrador);
begin
  dtmCobrador:= dtm;
end;

function TfrmCadastroCobranca.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCobrador.ConsultaCobrador;
end;

procedure TfrmCadastroCobranca.sbnCobradorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  flkCobrador.SetFocus;
  InternoPesquisar('');
end;

end.
