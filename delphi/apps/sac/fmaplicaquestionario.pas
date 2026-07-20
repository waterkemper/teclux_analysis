unit fmaplicaquestionario;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Buttons,
  DBCtrls, ComCtrls,Grids, DBGrids, Mask,
  //Terceiros
  ZQuery,
  //Repositorio
  fmcadastropadrao, fmconsultabasica, frendereco,
  //Componentes
  cpnumero, cpdata,
  //Projeto
  dmsac, fmcadastrocontatos, cpdbdata, cptexto, ImgList, cpsacclient,
  cpdbtext, Types, cpfone;

type
  TtecQueTelefone = (tqfAVULSO,tqfCLIENTE_1,tqfCLIENTE_2,tqfEMPRESA,tqfCONJUGE,
                     tqfREFERENCIA_1,tqfREFERENCIA_2);

  TfrmAplicaQuestionario = class(TfrmCadastroContatos)
    bbnQuestionario: TSpeedButton;
    tstDadosClientes: TTabSheet;
    PageControl1: TPageControl;
    tstPessoais: TTabSheet;
    lblNomeCliente: TLabel;
    lblFoneCliente1: TLabel;
    lblFoneCliente2: TLabel;
    lblFoneEmpresa: TLabel;
    lblFoneConjuge: TLabel;
    lblFoneReferencia1: TLabel;
    lblFoneReferencia2: TLabel;
    tstContratos: TTabSheet;
    tstAtendimentos: TTabSheet;
    dbgContratos: TDBGrid;
    lblContratos: TLabel;
    dbgProdutosContrato: TDBGrid;
    gbxTelefonesContato: TGroupBox;
    fraEnderecoCliente: TfraEndereco;
    dbgAtendimentos: TDBGrid;
    mmoInformes: TDBMemo;
    lblInformes: TLabel;
    tstObservacaoContato: TTabSheet;
    mmoObservacao: TDBMemo;
    bvlSep: TBevel;
    sbnAtendimento: TSpeedButton;
    sbnFichaFinanceira: TSpeedButton;
    edtClienteNome: TDBEditTexto;
    sbnAbortar: TSpeedButton;
    sbnReLigar: TSpeedButton;
    edtClienteCodigo: TDBEditTexto;
    sbnCancelar: TSpeedButton;
    sbnFone1Cliente: TSpeedButton;
    sbnFoneConjuge: TSpeedButton;
    sbnFone1Referencia: TSpeedButton;
    sbnFone2Referencia: TSpeedButton;
    TabSheet1: TTabSheet;
    sbnFone2Cliente: TSpeedButton;
    sbnFoneEmpresa: TSpeedButton;
    lblSexo: TLabel;
    lblFoneAvulso: TLabel;
    sbnFoneAvulso: TSpeedButton;
    edtFoneAvulso: TEditNumero;
    timLigacao: TTimer;
    edtClienteSexo: TDBEditTexto;
    stbDadosCliente: TStatusBar;
    edtFoneCliente1: TDBEditTexto;
    edtFoneCliente2: TDBEditTexto;
    edtFoneConjuge: TDBEditTexto;
    edtFoneReferencia2: TDBEditTexto;
    edtFoneEmpresa: TDBEditTexto;
    edtFoneReferencia1: TDBEditTexto;
    dtxLigacao: TtecDBText;
    lblLigacao: TLabel;
    tstOutros: TTabSheet;
    lblCargo: TLabel;
    DBEditTexto1: TDBEditTexto;
    DBEditTexto2: TDBEditTexto;
    lblConjuge: TLabel;
    procedure nvgPerguntasClick(Sender: TObject; Button: TNavigateBtn);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure sbnAtendimentoClick(Sender: TObject);
    procedure sbnFichaFinanceiraClick(Sender: TObject);
    procedure sbnFone2ClienteClick(Sender: TObject);
    procedure sbnFoneEmpresaClick(Sender: TObject);
    procedure sbnFoneConjugeClick(Sender: TObject);
    procedure sbnFone1ReferenciaClick(Sender: TObject);
    procedure sbnFone2ReferenciaClick(Sender: TObject);
    procedure sbnReLigarClick(Sender: TObject);
    procedure sbnAbortarClick(Sender: TObject);
    procedure sbnCancelarClick(Sender: TObject);
    procedure mmoObservacaoChange(Sender: TObject);
    procedure sbnFone1ClienteClick(Sender: TObject);
    procedure edtFoneAvulsoChange(Sender: TObject);
    procedure timLigacaoTimer(Sender: TObject);
    procedure sbnFoneAvulsoClick(Sender: TObject);
  protected
    FDesligarTimer: Boolean;
    FQueTelefone: TtecQueTelefone;
    FCont  : Integer;
    FStatus: Char;
    FCidade: Integer;
    FEstado: String;
    FPodeTrocarTabSheet: Boolean;
    FCodigoClienteAtual: Integer;
    FNomeClienteAtual: String;
    procedure EnviarChamadaACentral;
    procedure AfterScrollContatos(Sender: TObject);
//    procedure AtribuirNill; override;
    procedure CriarDataModulo; override;
    procedure DestruirDataModulo; override;
    procedure AtualizaEstadoBotoesLigacao;
    procedure AlterarStatusComponetesDaTela;
    procedure AtualizaStatusBar(Status: Char);
    function  PodeAlterarObservacao: Boolean;
    function  InternoCancelar: Boolean; override;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    procedure DoClose(var Action: TCloseAction); override;
  public
    property CodigoClienteAtual: Integer read FCodigoClienteAtual;
    property NomeClienteAtual: String read FNomeClienteAtual;
    Constructor Create(AOwner: TComponent); override;
  end;

var
  frmAplicaQuestionario: TfrmAplicaQuestionario;
  FPodeAtivarBotaoIncluir: Boolean = False;

implementation

uses
  {Qete,}
  //Biblio
  ctConstantes,
  biblio,
  //Projeto
  fmconsultaporcampo, fmcadastroatendimento,
  fmfichafinanceira, fmnavcontroles;


{$R *.dfm}

{ TfrmAplicaQuestionario }

constructor TfrmAplicaQuestionario.Create(AOwner: TComponent);
begin
  inherited;
  tstObservacaoContato.TabVisible:= False;
end;

{procedure TfrmAplicaQuestionario.AtribuirNill;
begin
  frmAplicaQuestionario:= nil;
end;}

function TfrmAplicaQuestionario.PodeAlterarObservacao: Boolean;
begin
  Result:= not (dtmSAC.InserindoContato or dtmSAC.JaExisteContato);
end;

procedure TfrmAplicaQuestionario.CriarDataModulo;
begin
  dtmCadastroContatos := dtmSAC;
  dtmSAC.OnScrollContato                := AfterScrollContatos;
  dtmSAC.OnScrollPerguntaAplicada       := ScrollPerguntaAplicada;
  dtmSAC.OnBeforeScrollPerguntaAplicada := BeforeScrollPerguntaAplicada;
  DataSet := dtmSAC.TabelaContato;
  dtmSAC.Abre(ctCadastroContatos);  
end;

procedure TfrmAplicaQuestionario.DestruirDataModulo;
begin
  dtmSAC.LimparControlesEdicaoContato;
end;

function TfrmAplicaQuestionario.InternoCancelar: Boolean;
begin
  sbnIncluir.Enabled  := True;
  if not dtmSAC.JaExisteContato and dtmSAC.ExisteLigacao then
    dtmCadastroContatos.SetStatusLigacao(ctSACNenhuma);
  mmoObservacao.ReadOnly:= PodeAlterarObservacao;
  sbnReLigar.Enabled:= False;
  sbnCancelar.Enabled:= False;
  Result:= inherited InternoCancelar;
end;

function TfrmAplicaQuestionario.InternoExcluir: Boolean;
begin
  sbnIncluir.Enabled  := True;
  Result := inherited InternoExcluir;
  if Result then
     mmoObservacao.ReadOnly:= PodeAlterarObservacao;
  dtmSAC.LimparControlesEdicaoContato;
  sbnReLigar.Enabled:= False;
  sbnCancelar.Enabled:= False;
end;

function TfrmAplicaQuestionario.InternoGravar: Boolean;
begin
  Result := inherited InternoGravar;
  if not (FStatus in ['C','N','O','S']) then
     sbnIncluir.Enabled:= False;
  if FPodeAtivarBotaoIncluir then begin
     sbnIncluir.Enabled:= True;
     FPodeAtivarBotaoIncluir:= False;
  end;
end;

procedure TfrmAplicaQuestionario.AtualizaEstadoBotoesLigacao;
begin
  sbnFone1Cliente.Enabled    := not sbnFone1Cliente.Enabled    and (dtmSAC.Fone1Cliente    > 0);
  sbnFone2Cliente.Enabled    := not sbnFone2Cliente.Enabled    and (dtmSAC.Fone2Cliente    > 0);
  sbnFone1Referencia.Enabled := not sbnFone1Referencia.Enabled and (dtmSAC.Fone1Referencia > 0);
  sbnFone2Referencia.Enabled := not sbnFone2Referencia.Enabled and (dtmSAC.Fone2Referencia > 0);
  sbnFoneConjuge.Enabled     := not sbnFoneConjuge.Enabled     and (dtmSAC.FoneConjuge     > 0);
  sbnFoneEmpresa.Enabled     := not sbnFoneEmpresa.Enabled     and (dtmSAC.FoneEmpresa     > 0);
end;

procedure TfrmAplicaQuestionario.AlterarStatusComponetesDaTela;
begin
  tstQuestionario.TabVisible := True;
  sbnReLigar.Enabled         := True;
  sbnCancelar.Enabled        := True;

  edtFoneCliente1.Color      := clWindow;
  edtFoneCliente2.Color      := clWindow;
  edtFoneReferencia1.Color   := clWindow;
  edtFoneReferencia2.Color   := clWindow;
  edtFoneConjuge.Color       := clWindow;
  edtFoneEmpresa.Color       := clWindow;
  edtFoneAvulso.Color        := clWindow;
  edtFoneAvulso.Text         := '';

  sbnFone1Cliente.Enabled    := dtmSAC.Fone1Cliente    > 0;
  sbnFone2Cliente.Enabled    := dtmSAC.Fone2Cliente    > 0;
  sbnFoneConjuge.Enabled     := dtmSAC.FoneConjuge     > 0;
  sbnFone1Referencia.Enabled := dtmSAC.Fone1Referencia > 0;
  sbnFone2Referencia.Enabled := dtmSAC.Fone2ReferenciA > 0;
  sbnFoneEmpresa.Enabled     := dtmSAC.FoneEmpresa     > 0;

  pgcContatos.ActivePage     := tstQuestionario;
  sbnIncluir.Enabled         := False;
end;

function TfrmAplicaQuestionario.InternoIncluir: Boolean;
begin
  Result := inherited InternoIncluir;
  if Result then begin
    dtmSAC.NovaLigacao;
    if dtmSAC.ExisteLigacao then begin
      tstObservacaoContato.TabVisible:= True;
      mmoObservacao.ReadOnly:= PodeAlterarObservacao;
      FPodeTrocarTabSheet:= True;
      AlterarStatusComponetesDaTela;
      if dtmSAC.InserindoContato then
        MontaQuadroOpcoes;
      pgcContatos.ActivePage    := tstDadosClientes;
    end
    else
      tstObservacaoContato.TabVisible:= False;
  end
end;

procedure TfrmAplicaQuestionario.nvgPerguntasClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
//  if dtmSAC.InserindoContato then
//     InternoGravar;
end;

procedure TfrmAplicaQuestionario.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case KEY of
    VK_F7 : if (Shift = []) then sbnAtendimento.Click;
    VK_F8 : if (Shift = []) then sbnFichaFinanceira.Click;
  end;
  inherited KeyDown(Key,Shift);
end;

procedure TfrmAplicaQuestionario.sbnAtendimentoClick(Sender: TObject);
var
  AuxTipo: String;
begin
  if (dtmSAC.CodigoClienteContato > 0) then begin
    AuxTipo := dtmSAC.TipoContato;
    if (AuxTipo[1] in ['A','L']) then
      AuxTipo := 'C'
    else if (AuxTipo[1] in ['C','I']) then
      AuxTipo := 'R';
    if not Assigned(frmCadastroAtendimento) then
      frmCadastroAtendimento:= TfrmCadastroAtendimento.Create(Self);
    frmCadastroAtendimento.CodigoClienteAtual := dtmSAC.CodigoClienteContato;
    frmCadastroAtendimento.Tipo               := AuxTipo;
    frmCadastroAtendimento.Show;
  end;
end;

procedure TfrmAplicaQuestionario.sbnFichaFinanceiraClick(Sender: TObject);
begin
  inherited;
  if (dtmSAC.CodigoClienteContato > 0) then begin
    if not Assigned(frmFichaFinanceira) then
      frmFichaFinanceira:= TfrmFichaFinanceira.Create(Self);
    frmFichaFinanceira.CodigoClienteAtual := dtmSAC.CodigoClienteContato;
    frmFichaFinanceira.Show;
  end;
end;

procedure TfrmAplicaQuestionario.AtualizaStatusBar(Status: Char);
begin
  case Status of
    'Z' : stbDadosCliente.Panels[1].Text := 'Estabelecendo comunicação.';
    'X' : stbDadosCliente.Panels[1].Text := 'Servidor efetuando chamada.';
    'A' : stbDadosCliente.Panels[1].Text := 'Central efetuando chamada.';
    'D' : stbDadosCliente.Panels[1].Text := 'Discando para o cliente.';
    'T' : stbDadosCliente.Panels[1].Text := 'Ligação atendida.';

    'C' : stbDadosCliente.Panels[1].Text := 'Ligação com problema.';
    'N' : stbDadosCliente.Panels[1].Text := 'Número incorreto.';
    'O' : stbDadosCliente.Panels[1].Text := 'Telefone Ocupado.';
    'S' : stbDadosCliente.Panels[1].Text := 'Ligação com sucesso.';
  end;
  Application.ProcessMessages;
end;

procedure TfrmAplicaQuestionario.sbnFoneAvulsoClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfAVULSO;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.sbnFone1ClienteClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfCLIENTE_1;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.sbnFone2ClienteClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfCLIENTE_2;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.sbnFoneEmpresaClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfEMPRESA;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.sbnFoneConjugeClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfCONJUGE;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.sbnFone1ReferenciaClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfREFERENCIA_1;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.sbnFone2ReferenciaClick(Sender: TObject);
begin
  inherited;
  FQueTelefone:= tqfREFERENCIA_2;
  EnviarChamadaACentral;
end;

procedure TfrmAplicaQuestionario.EnviarChamadaACentral;
begin
  FDesligarTimer:= True;
  AtualizaEstadoBotoesLigacao;
  FStatus:= 'Z';
  if dtmSAC.InserindoContato then
    InternoGravar;
  sbnAbortar.Enabled:= True;

  if (FQueTelefone <> tqfAvulso) then
    if edtFoneAvulso.Text <> '' then
       edtFoneAvulso.Text:= '';

  case FQueTelefone of
    tqfAVULSO      : edtFoneAvulso.Color:= clInfoBk;
    tqfCLIENTE_1   : edtFoneCliente1.Color:= clInfoBk;
    tqfCLIENTE_2   : edtFoneCliente2.Color:= clInfoBk;
    tqfEMPRESA     : edtFoneEmpresa.Color:= clInfoBk;
    tqfCONJUGE     : edtFoneConjuge.Color:= clInfoBk;
    tqfREFERENCIA_1: edtFoneReferencia1.Color:= clInfoBk;
    tqfREFERENCIA_2: edtFoneReferencia2.Color:= clInfoBk;
  end;

  case FQueTelefone of
    tqfAVULSO      : begin
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[StrToInt64(edtFoneAvulso.Text),
                                                                                      '',
                                                                                      '',
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
    tqfCLIENTE_1   : begin
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[dtmSAC.GetFone1Cliente,
                                                                                      dtmSAC.GetEstadoClienteChamada,
                                                                                      dtmSAC.GetCidadeClienteChamada,
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
    tqfCLIENTE_2   : begin
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[dtmSAC.GetFone2Cliente,
                                                                                      dtmSAC.GetEstadoClienteChamada,
                                                                                      dtmSAC.GetCidadeClienteChamada,
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
    tqfEMPRESA     : begin
                       if (dtmSAC.GetEstadoEmpresaChamada = '') then
                            FEstado:= dtmSAC.GetEstadoClienteChamada
                       else FEstado:= dtmSAC.GetEstadoEmpresaChamada;

                       if (dtmSAC.GetCidadeEmpresaChamada = 0) then
                            FCidade:= dtmSAC.GetCidadeClienteChamada
                       else FCidade:= dtmSAC.GetCidadeEmpresaChamada;
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[dtmSAC.GetFoneEmpresa,
                                                                                      FEstado,
                                                                                      FCidade,
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
    tqfCONJUGE     : begin
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[dtmSAC.GetFoneConjuge,
                                                                                      dtmSAC.GetEstadoClienteChamada,
                                                                                      dtmSAC.GetCidadeClienteChamada,
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
    tqfREFERENCIA_1: begin
                       if (dtmSAC.GetEstadoReferenciaChamada = '') then
                            FEstado:= dtmSAC.GetEstadoClienteChamada
                       else FEstado:= dtmSAC.GetEstadoReferenciaChamada;

                       if (dtmSAC.GetCidadeReferenciaChamada = 0) then
                            FCidade:= dtmSAC.GetCidadeClienteChamada
                       else FCidade:= dtmSAC.GetCidadeReferenciaChamada;
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[dtmSAC.GetFone1Referencia,
                                                                                      FEstado,
                                                                                      FCidade,
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
    tqfREFERENCIA_2: begin
                       if (dtmSAC.GetEstadoReferenciaChamada = '') then
                            FEstado:= dtmSAC.GetEstadoClienteChamada
                       else FEstado:= dtmSAC.GetEstadoReferenciaChamada;

                       if (dtmSAC.GetCidadeReferenciaChamada = 0) then
                            FCidade:= dtmSAC.GetCidadeClienteChamada
                       else FCidade:= dtmSAC.GetCidadeReferenciaChamada;
                       dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaLigar,[0,1,2,3,4],[dtmSAC.GetFone2Referencia,
                                                                                      FEstado,
                                                                                      FCidade,
                                                                                      dtmSAC.GetOperadorChamada,
                                                                                      dtmSAC.GetCampanhaChamada]);
                       dtmSAC.Perpetrar([dtmSAC.GetTabelaChamadaLigar]);
                     end;
  end;

  FDesligarTimer:= False;
  AtualizaStatusBar(FStatus);
end;

procedure TfrmAplicaQuestionario.sbnReLigarClick(Sender: TObject);
begin
  inherited;
//  PodeTrocarTabSheet:= True;
  FPodeAtivarBotaoIncluir    := True;
  sbnReLigar.Enabled         := False;
  tstQuestionario.TabVisible := False;
  pgcContatos.ActivePage     := tstObservacaoContato;
  dtmCadastroContatos.SetStatusLigacao(ctSACReligando);
end;

procedure TfrmAplicaQuestionario.sbnAbortarClick(Sender: TObject);
begin
  inherited;
  dtmSAC.ReFazConsulta(dtmSAC.qryChamadaDesligar,[0],[dtmSAC.GetNumeroChamada]);
  dtmSAC.Perpetrar([dtmSAC.qryChamadaDesligar]);
  sbnAbortar.Enabled := False;
end;

procedure TfrmAplicaQuestionario.sbnCancelarClick(Sender: TObject);
begin
  FPodeTrocarTabSheet        := False;
  dtmCadastroContatos.ExcluirRespostasContato;
  dtmCadastroContatos.SetStatusLigacao(ctSACCancelarLigacao);
  sbnReLigar.Enabled         := False;
  sbnCancelar.Enabled        := False;
  tstQuestionario.TabVisible := False;
  FPodeAtivarBotaoIncluir    := True;
  pgcContatos.ActivePage     := tstObservacaoContato;
end;

procedure TfrmAplicaQuestionario.mmoObservacaoChange(Sender: TObject);
begin
  inherited;
  dtmSAC.RequerContato:= mmoObservacao.Text <> '';
end;

procedure TfrmAplicaQuestionario.AfterScrollContatos(Sender: TObject);
begin
  if Assigned(frmAplicaquestionario) then begin
    if dtmSAC.qryContatos.IsEmpty then
       AtualizaEstadoBotoesLigacao;
    if dtmSAC.qryContatosnumero.AsInteger > 0 then
       mmoObservacao.ReadOnly:= PodeAlterarObservacao;
  end;
end;

procedure TfrmAplicaQuestionario.DoClose(var Action: TCloseAction);
begin
  inherited;
  if (not dtmSAC.JaExisteContato) and dtmSAC.ExisteLigacao then
     dtmSAC.SetStatusLigacao(ctSACNenhuma);
end;

procedure TfrmAplicaQuestionario.edtFoneAvulsoChange(Sender: TObject);
begin
  inherited;
  sbnFoneAvulso.Enabled:= edtFoneAvulso.Text <> '';
end;

procedure TfrmAplicaQuestionario.timLigacaoTimer(Sender: TObject);
begin
  inherited;
  if not FDesligarTimer and (FStatus in ['Z','X','A','D','T']) then begin
    dtmSAC.ReFazConsulta(dtmSAC.GetTabelaChamadaStatus,[0,1],[dtmSAC.GetNumeroChamada,
                                                              FStatus]);
    FStatus:= dtmSAC.qryChamadaStatusQueStatus.AsString[1];
    if FStatus in ['C','N','O','S'] then begin
       AtualizaEstadoBotoesLigacao;
       sbnIncluir.Enabled  := True;
    end;
    AtualizaStatusBar(FStatus);
  end;
end;

end.




