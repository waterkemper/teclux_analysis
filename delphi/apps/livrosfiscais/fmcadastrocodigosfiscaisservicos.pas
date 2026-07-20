unit fmcadastrocodigosfiscaisservicos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs, ExtCtrls, Buttons,
  DBCtrls, StdCtrls, Mask, ComCtrls,
  //Terceiros
  ZQuery,    
  //Biblio
  ctconstantes, biblio,
  //Componentes
  cpdbdata, cptexto, cpdbfindcontrols, cpnumero, cpdbtext,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, fmconsultaporcampo,
  //Projeto
  dmcadastrocodigosfiscaisservicos, cpdbmemo, cpdbradiogroup, ToolWin;

type
  TfrmCadastroCodigosFiscaisServicos = class(TfrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    edfCodigoFiscal: TtecDbEditFind;
    edtDescricao: TDBEditTexto;
    mmoDetalhes: TtecDBMemo;
    gbxCodigo: TGroupBox;
    gbxDescricao: TGroupBox;
    gbxDetalhes: TGroupBox;
  protected
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    Constructor Create(AOwner: TComponent); override;
    Destructor  Destroy; override;
  end;

var
  frmCadastroCodigosFiscaisServicos: TfrmCadastroCodigosFiscaisServicos;
  TipoPesquisa: TtecCadastroCodigosFiscaisServicos;

implementation

{$R *.dfm}

{ TfrmCadastroCodigosFiscais }

constructor TfrmCadastroCodigosFiscaisServicos.Create(AOwner: TComponent);
begin
  dtmCadastroCodigosFiscaisServicos := TdtmCadastroCodigosFiscaisServicos.Create(Self);
  inherited;
  dtmCadastroCodigosFiscaisServicos.Abre(ctTabelas);
  DataSet := dtmCadastroCodigosFiscaisServicos.TabelaCodigosFiscaisServicos;
  TipoPesquisa := cfsNENHUMA;
end;

destructor TfrmCadastroCodigosFiscaisServicos.Destroy;
begin
  dtmCadastroCodigosFiscaisServicos := nil;
  inherited;
  frmCadastroCodigosFiscaisServicos := nil;
end;

function TfrmCadastroCodigosFiscaisServicos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  case TipoPesquisa of
    cfsCFPS: Result:= dtmCadastroCodigosFiscaisServicos.ExisteCodigosFiscaisServicos(NomeCampo, Value)
    else     Result:= False;
  end;
end;

function TfrmCadastroCodigosFiscaisServicos.InternoExcluir: Boolean;
begin
  Result:= False;
  if MensagemConfirmacao(Format(ctCONFIRMEEXCLUIR, [ctOCODIGOFISCALSERVICO])) = smbOK then begin
    Result := inherited InternoExcluir;
    if Result then
      Result := dtmCadastroCodigosFiscaisServicos.ExcluirCodigoFiscalServico
  end
end;

function TfrmCadastroCodigosFiscaisServicos.InternoGravar: Boolean;
begin
   Result := dtmCadastroCodigosFiscaisServicos.GravarCodigoFiscalServico
end;

function TfrmCadastroCodigosFiscaisServicos.InternoIncluir: Boolean;
begin
   Result := dtmCadastroCodigosFiscaisServicos.IncluirCodigoFiscalServico
end;

function TfrmCadastroCodigosFiscaisServicos.InternoPesquisar(Titulo: String): Integer;
begin
  TipoPesquisa := cfsCFPS;
  Titulo:= 'Códigos Fiscais de Serviços';
  dtmCadastroCodigosFiscaisServicos.Abre(ctConsultaCodigosFiscaisServicos);
  Result := inherited InternoPesquisar(Titulo);
  if Result = mrOK then begin
    if TipoPesquisa = cfsCFPS then
      dtmCadastroCodigosFiscaisServicos.RefazConsultaCodigoFiscalServico;
  end;
  dtmCadastroCodigosFiscaisServicos.Fecha(ctConsultaCodigosFiscaisServicos);
end;

function TfrmCadastroCodigosFiscaisServicos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa    := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela:= False;
end;

function TfrmCadastroCodigosFiscaisServicos.TabelaDePesquisa: TZDataSet;
begin
  case TipoPesquisa of
    cfsCFPS: Result:= dtmCadastroCodigosFiscaisServicos.TabelaConsultaCodigosFiscaisServicos
    else     Result:= nil;
  end;
end;

end.
