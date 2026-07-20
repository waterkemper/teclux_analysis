unit fmcadastrologotipos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Grids, DBGrids, cpdbgrid,
  ComCtrls, Buttons, ExtCtrls, Mask, cptexto, DB,
    // Terceiros
  ZQuery,
  // Biblio
  ctconstantes, biblio, clparametrossistema,
  // Componentes
  cpdbfindcontrols, cpdbtext, cpdbmemo,
  // Repositorio
  fmconsultabasica, fmcadastropadraonavegacao, fmconsultaporcampo,
  // Outros
  dmcadastrologotipos, cpeditioncontrolvalidation, cpdbradiogroup, ToolWin;

type
  TfrmCadastroLogotipos = class(TFrmCadastroPadraoNav)
    pnlFundoJanela: TPanel;
    flkFilial: TtecDBFindLookup;
    sbnProcuraFilial: TSpeedButton;
    dtxFilial: TtecDBText;
    sbnProcuraLogotipo: TSpeedButton;
    imgLogotipo: TImage;
    dlgLogotipos: TOpenDialog;
    edtArquivo: TDBEditTexto;
    ToolButton1: TToolButton;
    rgpTipoLogotipo: TtecDBRadioGroup;
    rbnRelatorio: TtecRadioButton;
    rbnFrentedeCaixa: TtecRadioButton;
    gbxFilial: TGroupBox;
    gbxDescricao: TGroupBox;
    edtDescricao: TDBEditTexto;
    gbxArquivo: TGroupBox;
    procedure sbnProcuraLogotipoClick(Sender: TObject);
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure sbnPrimeiroClick(Sender: TObject);
    procedure sbnAnteriorClick(Sender: TObject);
    procedure sbnProximoClick(Sender: TObject);
    procedure sbnUltimoClick(Sender: TObject);
    procedure flkFilialExit(Sender: TObject);
  private
    { Private declarations }
  protected
    function  InternoIncluir: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  PesquisaHabilitada: Boolean;
    procedure VerificarFilial(Filial: String);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AtualizarImagem;
 end;

var
  frmCadastroLogotipos: TfrmCadastroLogotipos;
  ControleValido      : TWinControl;

implementation
{$R *.dfm}

{ TfrmCadastroLogotipos }

constructor TfrmCadastroLogotipos.Create(AOwner: TComponent);
begin
  dtmCadastroLogotipos:= TdtmCadastroLogotipos.Create(Self);
  inherited;
  DataSet:= dtmCadastroLogotipos.TabelaLogotipos;
  dlgLogotipos.InitialDir := ParSistema.DiretorioImagens;
  AtualizarImagem;
end;

destructor TfrmCadastroLogotipos.Destroy;
begin
  dtmCadastroLogotipos:=nil;
  inherited;
  frmCadastroLogotipos:=nil;
end;


function TfrmCadastroLogotipos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result:= dtmCadastroLogotipos.ExisteFilial(NomeCampo, Value);
end;

function TfrmCadastroLogotipos.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if not CtrlOn then begin
    if Result then
    begin
      dtmCadastroLogotipos.ExcluirLogotipos;
      AtualizarImagem;
    end;
  end;
end;

function TfrmCadastroLogotipos.InternoGravar: Boolean;
begin
 Result:= inherited InternoGravar;
 if Result then
   dtmCadastroLogotipos.GravarLogotipos;
end;

function TfrmCadastroLogotipos.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if not CtrlOn then begin
    if Result then
    begin
      dtmCadastroLogotipos.IncluirLogotipos;
      AtualizarImagem;
    end;
  end;
end;

function TfrmCadastroLogotipos.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if PesquisaHabilitada then
  begin
    dtmCadastroLogotipos.Abre(ctTabelaConsultaFiliais);
    Titulo:=ctFILIAIS;
    Result:= inherited InternoPesquisar(Titulo);
    if Result = mrOK then
      dtmCadastroLogotipos.Selecionar;
    dtmCadastroLogotipos.Fecha(ctTabelaConsultaFiliais);
  end;
end;

function TfrmCadastroLogotipos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:=TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := false;
end;

function TfrmCadastroLogotipos.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl = flkFilial) then
   Result:= True;
end;

function TfrmCadastroLogotipos.TabelaDePesquisa: TZDataSet;
begin
    Result := dtmCadastroLogotipos.TabelaFiliais;
end;

procedure TfrmCadastroLogotipos.sbnProcuraLogotipoClick(Sender: TObject);
var
Imagem : TImage;
begin
  inherited;
  if dlgLogotipos.Execute then
  begin
   Imagem := Timage.Create(self);
   try
    try
     imagem.Picture.LoadFromFile(ParSistema.DiretorioImagens+ExtractFileName(dlgLogotipos.FileName));
    except end;
   finally
    imgLogotipo.Picture.Assign(imagem.Picture);
    if not (dtmCadastroLogotipos.qryLogotipos.State in [dsinsert, dsedit]) then
       dtmCadastroLogotipos.qryLogotipos.Edit;
    if FileExists(ParSistema.DiretorioImagens+ExtractFileName(dlgLogotipos.FileName)) then
     dtmCadastroLogotipos.qryLogotiposnome.AsString:=ExtractFileName(dlgLogotipos.FileName)
    else
     dtmCadastroLogotipos.qryLogotiposnome.AsString:='';
   end;
  end;
end;

procedure TfrmCadastroLogotipos.sbnProcuraFilialClick(Sender: TObject);
begin
  inherited;
  flkFilial.SetFocus;
  CtrlOn:=True;
  InternoPesquisar(ctFILIAIS);
end;

procedure TfrmCadastroLogotipos.sbnPrimeiroClick(Sender: TObject);
begin
  inherited;
  AtualizarImagem;
end;

procedure TfrmCadastroLogotipos.AtualizarImagem;
var
Imagem : TImage;
begin
  with dtmCadastroLogotipos do
  begin
   Imagem := TImage.Create(self);
   try
    try
    imagem.Picture.LoadFromFile(ParSistema.DiretorioImagens+
                                     qryLogotiposnome.AsString);
    except end;
   finally
    imgLogotipo.Picture.Assign(imagem.Picture);
    imagem.Free;
   end;
  end;
end;

procedure TfrmCadastroLogotipos.sbnAnteriorClick(Sender: TObject);
begin
  inherited;
  AtualizarImagem;
end;

procedure TfrmCadastroLogotipos.sbnProximoClick(Sender: TObject);
begin
  inherited;
  AtualizarImagem;
end;

procedure TfrmCadastroLogotipos.sbnUltimoClick(Sender: TObject);
begin
  inherited;
  AtualizarImagem;
end;

procedure TfrmCadastroLogotipos.flkFilialExit(Sender: TObject);
begin
  inherited;
  if not (dtmCadastroLogotipos.qryLogotipos.State in [dsInsert]) then
    VerificarFilial(flkFilial.Text);
end;

procedure TfrmCadastroLogotipos.VerificarFilial(Filial: String);
begin
  with dtmCadastroLogotipos do
  begin
   if (Filial<>FilialLogotipo) or (Filial='') then
   begin
    if (Filial<>'') then
     ReFazConsulta(qryConsultaLogotipos, [0], [Filial])
    else ReFazConsulta(qryConsultaLogotipos, [0], [0]);
    if not qryConsultalogotipos.IsEmpty then
    begin
     qryLogotipos.Cancel;
     qryLogotipos.Locate('filial', Filial,[]);
     AtualizarImagem;
    end;
   end;
  end;
end;

end.
