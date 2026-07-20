unit fmcadastrotransportadores;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Buttons, StdCtrls, Mask, DBCtrls, biblio,
  // Biblio
  ctconstantes,
  // Componentes
  cptexto, cpfone, cpnumero, cpcpf, cpdocumento, cpdata, cpdbdata, cpdbfindcontrols,
  // Terceiros
  ZQuery,
  // Repositorio
  fmcadastropadrao, fmconsultabasica,fmconsultaporcampo, frenderecoeditor,
  dmconsultaenderecos, frtelefone, frcgcoucpf, frendereco, DB, ZPgSqlQuery,
  cpquery, ToolWin;

type
  TfrmCadastroTransportadores = class(TfrmCadastroPadrao)
    gbxTransportador: TGroupBox;
    edfCodigo: TtecDbEditFind;
    lblCodigo: TLabel;
    lblInativo: TLabel;
    edtInativo: TDBEditData;
    edtRazao: TDBEditTexto;
    lblRazao: TLabel;
    fraEnderecoTransportador: TfraEnderecoEditor;
    fraFoneTransportador: TfraTelefone;
    fraFaxTransportador: TfraTelefone;
    pnlFundoJanela: TPanel;
    gbxInscricao: TGroupBox;
    lblDocumento: TLabel;
    edtInscEstadual: TDBEditDocumento;
    fracgcoucpf: Tfracgcoucpf;
    procedure edtInscEstadualExit(Sender: TObject);
    procedure fracgcoucpf1rgbTipoPessoaChange(Sender: TObject);
  protected
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroTransportadores: TfrmCadastroTransportadores;

implementation

uses dmcadastrotransportadores;

{$R *.dfm}

constructor TfrmCadastroTransportadores.Create(AOwner: TComponent);
begin
  dtmCadastroTransportadores:= TdtmCadastroTransportadores.Create(Self);
  inherited;
  DataSet:= dtmCadastroTransportadores.TabelaTransportadores;
  fracgcoucpf.edtCPFCNPJ.Tipo := 'J';
end;

destructor TfrmCadastroTransportadores.Destroy;
begin
  dtmCadastroTransportadores:=nil;
  inherited;
  frmCadastroTransportadores:= nil;
end;

procedure TfrmCadastroTransportadores.edtInscEstadualExit(Sender: TObject);
begin
  edtInscEstadual.Estado:= dtmCadastroTransportadores.TransportadorEstado;
  edtInscEstadual.Criticar;
end;

function TfrmCadastroTransportadores.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
   Result:= dtmCadastroTransportadores.ExisteTransportador(NomeCampo, Value)
end;

procedure TfrmCadastroTransportadores.fracgcoucpf1rgbTipoPessoaChange(Sender: TObject);
begin
  inherited;
  if Assigned(dtmCadastroTransportadores) then
    fracgcoucpf.edtCPFCNPJ.Tipo := dtmCadastroTransportadores.TipoPessoa
end;

function TfrmCadastroTransportadores.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if not CtrlOn then begin
    if Result then
      dtmCadastroTransportadores.ExcluirTransportador;
  end;
end;

function TfrmCadastroTransportadores.InternoGravar: Boolean;
begin
  Result:= True;
  edtInscEstadual.Estado:= dtmCadastroTransportadores.TransportadorEstado;
  if edtInscEstadual.Criticar then begin
    Result := inherited InternoGravar;
    if Result then dtmCadastroTransportadores.GravarTransportador;
  end;
end;

function TfrmCadastroTransportadores.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then begin
    if Result then
      dtmCadastroTransportadores.IncluirTransportador;
      edtRazao.SetFocus;
  end;
end;

function TfrmCadastroTransportadores.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if not CtrlOn then
    with dtmCadastroTransportadores do begin
      Abre(ctTabelasConsultaTransportadores);
      Result:= inherited InternoPesquisar('Transportador');
      if Result = mrOK then
        PosicionarTransportadores;
      Fecha(ctTabelasConsultaTransportadores);
    end
end;

function TfrmCadastroTransportadores.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroTransportadores.TabelaDePesquisa: TZDataSet;
begin
  Result:= dtmCadastroTransportadores.ConsultarTransportador;
end;

end.
