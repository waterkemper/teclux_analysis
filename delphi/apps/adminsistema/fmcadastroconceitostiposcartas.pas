unit fmcadastroconceitostiposcartas;

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
  dmcadastrotabelascrediario, StdCtrls, Mask, DBCtrls, cptexto, cpdbfindcontrols, cpdbtext,
  ComCtrls, ToolWin;

type
  TfrmCadastroConceitosTiposCartas = class(TfrmCadastroPadrao)
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
    FCadastroTabelasCrediario: TdtmCadastroTabelasCrediario;
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
    procedure SetDataModulo(Dtm: TdtmCadastroTabelasCrediario);
    property CadastroTabelasCrediario: TdtmCadastroTabelasCrediario read FCadastroTabelasCrediario;
  end;

var
  frmCadastroConceitosTiposCartas: TfrmCadastroConceitosTiposCartas;

implementation

{$R *.dfm}

procedure TfrmCadastroConceitosTiposCartas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CadastroTabelasCrediario.TabelaConceitosTiposCartas.State in [dsInsert, dsEdit] then
    CadastroTabelasCrediario.TabelaConceitosTiposCartas.Cancel;
end;

procedure TfrmCadastroConceitosTiposCartas.sbnProcurarConceitoClick(Sender: TObject);
begin
  CtrlOn:= True;
  ActiveControl:= flkCodigo;
  InternoPesquisar('Conceitos');
end;

destructor TfrmCadastroConceitosTiposCartas.Destroy;
begin
  inherited;
  frmCadastroConceitosTiposCartas:= nil;
end;

procedure TfrmCadastroConceitosTiposCartas.SetDataModulo(Dtm: TdtmCadastroTabelasCrediario);
begin
  FCadastroTabelasCrediario:= Dtm;
end;

function TfrmCadastroConceitosTiposCartas.PesquisaHabilitada: Boolean;
begin
  if (CtrlOn) and (ActiveControl = flkCodigo) then
     Result:= True
  else
     Result:= False;
end;

function TfrmCadastroConceitosTiposCartas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= CadastroTabelasCrediario.ExisteConceitoTiposCartas(NomeCampo, Value);
end;

function TfrmCadastroConceitosTiposCartas.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroTabelasCrediario.ExcluirConceitoTipoCarta;
  end;
end;

function TfrmCadastroConceitosTiposCartas.InternoGravar: Boolean;
var
  EditandoConceito: Boolean;
begin
  with CadastroTabelasCrediario do begin
    if flkCodigo.Exist then begin
      EditandoConceito:= CadastroTabelasCrediario.TabelaConceitosTiposCartas.State = dsEdit;
      Result:= GravarConceitoTipoCarta;
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

function TfrmCadastroConceitosTiposCartas.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      Result:= CadastroTabelasCrediario.IncluirConceitoTipoCarta(False);
  end;
end;

function TfrmCadastroConceitosTiposCartas.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with CadastroTabelasCrediario do
    begin
      AbrirTabelasConsulta(tbcCONCEITOTIPOCARTA);
      Result:= inherited InternoPesquisar('Conceitos');
      if Result = mrOK then begin
        SelecionarMultiplas(tbcCONCEITOTIPOCARTA);
        flkCodigo.Modified:= True;
      end;
      FecharTabelasConsulta(tbcCONCEITOTIPOCARTA);
    end
  else
    Result:= 0;
end;

function TfrmCadastroConceitosTiposCartas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := False;
end;

function TfrmCadastroConceitosTiposCartas.TabelaDePesquisa: TZDataSet;
begin
  Result:= CadastroTabelasCrediario.TabelaConsultaConceitosTiposCartas;
end;

procedure TfrmCadastroConceitosTiposCartas.flkCodigoMessage(var Msg: String);
begin
  Msg := Format(ctREGISTROINCLUIDO,['Conceito','no Aviso']);
end;

procedure TfrmCadastroConceitosTiposCartas.flkCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) then
    if (flkCodigo.ForeignFound = stFound) then
      InternoGravar;
end;

end.
