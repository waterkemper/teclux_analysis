unit fmcadastroperguntas;

interface

uses
  //CVX
  SysUtils, Types, Classes, Graphics, Controls , Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids,
  //Terceiros
  ZQuery,
  //Componentes
  cpnumero, cptexto, cpdbfindcontrols, 
  //Repositorio
  dmBasico, fmconsultabasica, fmcadastropadrao,
  //Projeto
  dmcadastroperguntas;

type
  TfrmCadastroPerguntas = class(TfrmCadastroPadrao)
    lblpesquisa: TLabel;
    lblEnunciado: TLabel;
    edtEnunciado: TDBEditTexto;
    lblComplementos: TLabel;
    mnoComplemento: TDBMemo;
    edfCodigoPergunta: TtecDbEditFind;
    sbnIncluirOpcoes: TSpeedButton;
    sbnExcluirOpcoes: TSpeedButton;
    dbgOpcoesPerguntas: TDBGrid;
    gbxTipoPergunta: TGroupBox;
    cbxTipoObjetiva: TCheckBox;
    cbxTipoDiscursiva: TCheckBox;
    gbxValida: TGroupBox;
    chkPerguntaValida: TDBCheckBox;
    lblOrdem: TLabel;
    edtOrdem: TDBEditNumero;
    gbxNrOpcoes: TGroupBox;
    lblMinimo: TLabel;
    edtMinimo: TDBEditNumero;
    lblMaximo: TLabel;
    edtMaximo: TDBEditNumero;
    procedure sbnExcluirOpcoesClick(Sender: TObject);
    procedure sbnIncluirOpcoesClick(Sender: TObject);
    procedure dbgOpcoesPerguntasEnter(Sender: TObject);
    procedure cbxTipoObjetivaClick(Sender: TObject);
    procedure cbxTipoDiscursivaClick(Sender: TObject);
    procedure edfCodigoPerguntaFound(Found: Boolean);
    procedure edfCodigoPerguntaExit(Sender: TObject);
  protected
    procedure AtualizaValorTipo;
    procedure AtualizaEstadoComponentesTela;
    function  InternoIncluir     : Boolean;    override;
    function  InternoGravar      : Boolean;    override;
    function  InternoExcluir     : Boolean;    override;
    function  InternoPesquisar(Titulo:String) : integer;    override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
  public
    constructor Create(AOwner: TComponent);   Override;
    destructor  Destroy; override;
  end;

var
  frmCadastroPerguntas: TfrmCadastroPerguntas;
//  FocoGrid : Boolean = False;

implementation

Uses
  //CLX
  {Qete,}
  //Biblio
  ctconstantes, biblio,
  //Repositorio
  fmconsultaporcampo;

{$R *.dfm}

constructor TfrmCadastroPerguntas.Create(AOwner: TComponent);
begin
  dtmCadastroPerguntas:= TdtmCadastroPerguntas.Create(Self);
  inherited;
  dtmCadastroPerguntas.Abre(ctCadastroPerguntas);
  DataSet := dtmCadastroPerguntas.TabelaPerguntas;
end;

destructor TfrmCadastroPerguntas.Destroy;
begin
  dtmCadastroPerguntas.Fecha(ctCadastroPerguntas);
  dtmCadastroPerguntas:=nil;
  inherited;
  frmCadastroPerguntas := nil;
end;

procedure TfrmCadastroPerguntas.AtualizaEstadoComponentesTela;
begin
  dbgOpcoesPerguntas.Visible := cbxTipoObjetiva.Checked;
  sbnExcluirOpcoes.Visible   := cbxTipoObjetiva.Checked;
  sbnIncluirOpcoes.Visible   := cbxTipoObjetiva.Checked;
  gbxNrOpcoes.Enabled        := cbxTipoObjetiva.Checked;
end;

function TfrmCadastroPerguntas.InternoIncluir: Boolean;
begin
  if CtrlOn then begin
    if (ActiveControl is TInplaceEdit) then begin
      if (ActiveControl.Parent = dbgOpcoesPerguntas) then
        dtmCadastroPerguntas.IncluirOpcoesPerguntas;
    end;
    Result:= True;
  end
  else begin
    Result := inherited InternoIncluir;
    if Result then begin
      dtmCadastroPerguntas.IncluirPerguntas;
      AtualizaEstadoComponentesTela;
//      edfCodigoPergunta.SetControl(True);
//      SelectNext(ActiveControl, True, ActiveControl.TabStop);
    end
  end
end;

function TfrmCadastroPerguntas.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if Result then begin
    Result := dtmCadastroPerguntas.GravarPerguntas;
    if Result then
      AtualizaEstadoComponentesTela;
  end
end;

function TfrmCadastroPerguntas.InternoExcluir: Boolean;
begin
  if CtrlOn then begin
    if (ActiveControl is TInplaceEdit) then begin
      if (ActiveControl.Parent = dbgOpcoesPerguntas) then
        dtmCadastroPerguntas.ExcluirOpcoesPerguntas(False);
    end;
    Result:= True;
  end
  else begin
    Result := dtmCadastroPerguntas.ExcluirPerguntas;
    if Result then begin
      Result := inherited InternoExcluir;
      AtualizaEstadoComponentesTela;
    end;
  end;
end;

function TfrmCadastroPerguntas.InternoPesquisar(Titulo:String): Integer;
begin
  if not CtrlOn then begin
    dtmCadastroPerguntas.Abre(ctTabelasConsultaPerguntas);
    Result := inherited InternoPesquisar('Pergunta');
    if Result  = mrok then begin
      dtmCadastroPerguntas.PosicionarPergunta;
    end;
    dtmCadastroPerguntas.Fecha(ctTabelasConsultaPerguntas);
    AtualizaEstadoComponentesTela;
  end
  else
    Result:= mrNone;
end;

procedure TfrmCadastroPerguntas.sbnExcluirOpcoesClick(Sender: TObject);
begin
  inherited;
  dtmCadastroPerguntas.ExcluirOpcoesPerguntas(False);
end;

function TfrmCadastroPerguntas.ExisteInformacao(Parametro: Integer; NomeCampo: String;
  Value: Variant): Boolean;
begin
  Result := dtmCadastroPerguntas.ExistePergunta(Parametro, NomeCampo, Value)
end;

function TfrmCadastroPerguntas.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmCadastroPerguntas.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmCadastroPerguntas.TabelaConsultaPergunta
end;

procedure TfrmCadastroPerguntas.sbnIncluirOpcoesClick(Sender: TObject);
begin
  inherited;
  dtmCadastroPerguntas.IncluirOpcoesPerguntas;
  dbgOpcoesPerguntas.SetFocus;
end;

procedure TfrmCadastroPerguntas.dbgOpcoesPerguntasEnter(Sender: TObject);
begin
  inherited;
//  FocoGrid:= True;
end;

procedure TfrmCadastroPerguntas.cbxTipoObjetivaClick(Sender: TObject);
begin
  inherited;
  cbxTipoDiscursiva.Checked  := not cbxTipoObjetiva.Checked;
  AtualizaValorTipo;
  AtualizaEstadoComponentesTela;
end;

procedure TfrmCadastroPerguntas.cbxTipoDiscursivaClick(Sender: TObject);
begin
  inherited;
  cbxTipoObjetiva.Checked := not cbxTipoDiscursiva.Checked;
  AtualizaValorTipo;
  AtualizaEstadoComponentesTela;
end;

procedure TfrmCadastroPerguntas.AtualizaValorTipo;
begin
  if ((cbxTipoDiscursiva.Checked) and dtmCadastroPerguntas.ExisteOpcoesPerguntas) then begin
    if MensagemConfirmacao(format(ctEXCLUIROPCOES, [ctINFORMACAO])) = smbOk then begin
       dtmCadastroPerguntas.ExcluirOpcoesPerguntas(True);
       dtmCadastroPerguntas.ExcluirMaximoMinimo;
       dtmCadastroPerguntas.SetarTipoPergunta('D')
    end
    else begin
       cbxTipoObjetiva.Checked := True;
       dtmCadastroPerguntas.SetarTipoPergunta('O');
    end;
  end;
end;

procedure TfrmCadastroPerguntas.edfCodigoPerguntaFound(Found: Boolean);
begin
  inherited;
  if Found then begin
    cbxTipoObjetiva.Checked  := dtmCadastroPerguntas.BuscaTipoPergunta = 'O';
    cbxTipoDiscursiva.Checked:= dtmCadastroPerguntas.BuscaTipoPergunta = 'D';
  end;
end;

procedure TfrmCadastroPerguntas.edfCodigoPerguntaExit(Sender: TObject);
begin
  inherited;
  AtualizaEstadoComponentesTela;
end;

end.
