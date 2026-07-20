unit fmcadastroconceitosaviso;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, DB,
  // Terceiros
  ZQuery,
  // Constantes
  ctconstantes, biblio,
  // Repositorio
  fmconsultabasica, fmcadastropadrao, fmconsultaporcampo,
  // Outros
  dmaviso, StdCtrls, Mask, DBCtrls, cptexto, cpdbfindcontrols, cpdbtext,
  ComCtrls;

type
  TfrmCadastroConceitosAviso = class(TfrmCadastroPadrao)
    lblCodigo: TLabel;
    lblConceito: TLabel;
    flkCodigo: TtecDBFindLookup;
    sbnProcurarConceito: TSpeedButton;
    dtxConceito: TtecDBText;
    pnlFundoJanela: TPanel;
    gbxConceitosAviso: TGroupBox;
    procedure sbnProcurarConceitoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure flkCodigoMessage(var Msg: String);
    procedure flkCodigoKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
  private
    FCadastroAviso: TdtmAviso;
  protected
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
  public
    destructor  Destroy; override;
    function  PesquisaHabilitada: Boolean;
    procedure SetDataModulo(Dtm: TdtmAviso);
    property CadastroAviso: TdtmAviso read FCadastroAviso;
  end;

var
  frmCadastroConceitosAviso: TfrmCadastroConceitosAviso;

implementation

{$R *.dfm}

procedure TfrmCadastroConceitosAviso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dtmAviso.TabelaConceitosTiposCartas.State in [dsInsert, dsEdit] then
    dtmAviso.TabelaConceitosTiposCartas.Cancel;
end;

procedure TfrmCadastroConceitosAviso.sbnProcurarConceitoClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkCodigo;
  InternoPesquisar('Conceitos');
end;

destructor TfrmCadastroConceitosAviso.Destroy;
begin
  inherited;
  frmCadastroConceitosAviso:= nil;
end;

procedure TfrmCadastroConceitosAviso.SetDataModulo(Dtm: TdtmAviso);
begin
  FCadastroAviso:= Dtm;
end;

function TfrmCadastroConceitosAviso.PesquisaHabilitada: Boolean;
begin
  if (CtrlOn) and (ActiveControl = flkCodigo) then
     Result:= True
  else
     Result:= False;
end;

function TfrmCadastroConceitosAviso.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= CadastroAviso.ExisteConceito(NomeCampo, Value);
end;

function TfrmCadastroConceitosAviso.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroAviso.ExcluirConceitoTipoCarta;
  end;
end;

function TfrmCadastroConceitosAviso.InternoGravar: Boolean;
var
  EditandoConceito: Boolean;
begin
  with CadastroAviso do begin
    if flkCodigo.Exist then begin
      EditandoConceito:= CadastroAviso.TabelaConceitosTiposCartas.State = dsEdit;
      Result:= CadastroAviso.GravarConceitoTipoCarta;
      if Result then begin
        if EditandoConceito then
             Close
        else InternoIncluir;
      end
    end
    else
      Result := False;
  end;
end;

function TfrmCadastroConceitosAviso.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroAviso.IncluirConceitoTipoCarta(False);
  end;
end;

function TfrmCadastroConceitosAviso.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with CadastroAviso do
    begin
      AbreTabelaPesquisa(pesCONCEITOS);
      Result:= inherited InternoPesquisar('Conceitos');
      if Result = mrOK then begin
        SelecionarConceito;
        flkCodigo.Modified:= True;
      end;  
      FechaTabelaPesquisa(pesCONCEITOS);
    end
  else
    Result:= 0;
end;

function TfrmCadastroConceitosAviso.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroConceitosAviso.TabelaDePesquisa: TZDataSet;
begin
  Result:= CadastroAviso.TabelaConceitos;
end;

procedure TfrmCadastroConceitosAviso.flkCodigoMessage(var Msg: String);
begin
  Msg := Format(ctREGISTROINCLUIDO,['Conceito','no Aviso']);
end;

procedure TfrmCadastroConceitosAviso.flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    if (flkCodigo.ForeignFound = stFound) then
      InternoGravar;
end;

end.
