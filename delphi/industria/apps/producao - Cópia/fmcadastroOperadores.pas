Unit fmcadastroOperadores;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Mask, ExtCtrls, Windows, Buttons, DBCtrls, Grids, DBGrids, ComCtrls, {Qete,} DB,
  //Terceiros
  ZQuery, ZPgSqlQuery,
  //Componentes
  cpnumero, cptexto, cpdata, cpdbfindcontrols, cpdbdata, cppagecontrol, cpquery,
  cpdbtext, cpdbgrid, cpdbradiogroup,
  //Repositorio
  fmConsultaBasica, fmcadastropadrao, fmconsultaporcampo,
  // Projeto
  dmcadastrooperadores,
  //Biblio
  biblio, ctconstantes, cpeditioncontrolvalidation, ActnList, cpdbmemo,
  frconsulta, frconsultacodigo, ToolWin;


type
  tecBotao  = (btnPROCURAR,btnFILIAL,btnUSERID, btnFILTRO);
  TfrmCadastrooperadores = class(TfrmCadastroPadrao)
    edtNome: TtecDBText;
    edfCodigoUsuario: TtecDbEditFind;
    pnlFundoJanela: TPanel;
    gbxUsuario: TGroupBox;
    aclHabilitar: TActionList;
    actHabilitarAbas: TAction;
    gbxSalarioHora: TGroupBox;
    gbxAnuenio: TGroupBox;
    edtSalarioHora: TDBEditNumero;
    edtAnuenio: TDBEditNumero;
    gbxOperacoesProducao: TGroupBox;
    fraConsultaTurno: TfraConsultaCodigo;
    gbxTurno: TGroupBox;
    gbxCodigo: TGroupBox;
    gbxNomeCompleto: TGroupBox;
    dbgOperacoesdeProducao: TtecDBGrid;
    sbnIncluirInstrucaoTrabalho: TSpeedButton;
    sbnExcluirInstrucaoTrabalho: TSpeedButton;
    dtxInativo: TtecDBText;

    procedure edfCodigoUsuarioMessage(var Msg: String);
    procedure edtSenhaEmailChange(Sender: TObject);
    procedure dbgOperacoesdeProducaoDblClick(Sender: TObject);
    procedure dbgOperacoesdeProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure sbnIncluirInstrucaoTrabalhoClick(Sender: TObject);
    procedure sbnExcluirInstrucaoTrabalhoClick(Sender: TObject);
  private
    procedure CriticarDataInativa(datainativa: TDBEditData);
    procedure AcionarPesquisaGrade;
    procedure CondicoesinstrucaoProducao;
    function VerificarInstrucoes: boolean;
//    procedure AfterScrollInternet(Sender: TObject);
  protected
    ConsultaInstrucoes : TfraConsultaCodigo;
    ConsultaNiveisConhecimento : TfraConsultaCodigo;
    ConsultaOperadores : TfraConsultaCodigo;

    procedure AbrirOperadores;
//    procedure AlterarEstadoBotoes; override;
//    function  InternoIncluir   : Boolean;    override;
    function  InternoGravar    : Boolean;    override;
    procedure AtribuirDadosinstrucaoProducao;
    procedure AtribuirDadosNiveisConhecimento;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmCadastroOperadores: TfrmCadastroOperadores;
  TipoPesquisa       : TtecProcuraUsuarios;
  JaTestouEmail: Boolean;

implementation

uses
  //Biblio
  clusuario,
  //Repositorio
  fmnavcontroles;

{$R *.dfm}



constructor TfrmCadastroOperadores.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroOperadores := TdtmCadastroOperadores.Create(Self);
  DataSet := dtmCadastroOperadores.qryUsuarios;
  dtmCadastroOperadores.Abre(ctCadastroUsuarios);

//  dtmCadastroOperadores.OnScrollInternet := AfterScrollInternet;
  ConsultaOperadores := TfraConsultaCodigo.Create(self);
  ConsultaOperadores.edfCodigo.DataSource := dtmCadastroOperadores.dsrUsuarios;
  ConsultaOperadores.edfCodigo.DataField := 'codigo';
  ConsultaOperadores.edfCodigo.operacao := opATRIBUICAO;
  ConsultaOperadores.AbrirTabelaProcura := false;
  ConsultaOperadores.qryConsultaUsuariosinativo.Visible := True;
  ConsultaOperadores.TipoPesquisa := pesUSUARIOS;
  ConsultaOperadores.OnFound := AbrirOperadores;
  ConsultaOperadores.Name := 'fraConsultaOperadores';



  JatestouEmail:= False;
  ConsultaInstrucoes := TfraConsultaCodigo.Create(self);
  ConsultaInstrucoes.Name := 'fraConsultaInstrucoes';
  ConsultaInstrucoes.edfCodigo.MaxLength := 3;
  ConsultaInstrucoes.edfCodigo.DataSource := dtmCadastroOperadores.dsrUsuariosInstrucoesTrabalho;
  ConsultaInstrucoes.edfCodigo.DataField := 'instrucao';
  ConsultaInstrucoes.edfCodigo.operacao := opATRIBUICAO;
  ConsultaInstrucoes.edfCodigo.LookupSource := ConsultaInstrucoes.dsrProcuraInstrucoesTrabalho;
  ConsultaInstrucoes.edfCodigo.LookupQueryParameter := 'instrucao';
  ConsultaInstrucoes.edfCodigo.LookupField := 'instrucao';
  ConsultaInstrucoes.AbrirTabelaProcura := false;
  ConsultaInstrucoes.CondicoesdaConsulta := CondicoesinstrucaoProducao;
  ConsultaInstrucoes.TipoPesquisa := pesINSTRUCOESTRABALHO;
  ConsultaInstrucoes.OnFound := AtribuirDadosinstrucaoProducao;

  ConsultaNiveisConhecimento := TfraConsultaCodigo.Create(self);
  ConsultaNiveisConhecimento.Name := 'fraConsultaNiveisConhecimento';
  ConsultaNiveisConhecimento.edfCodigo.MaxLength := 3;
  ConsultaNiveisConhecimento.edfCodigo.DataSource := dtmCadastroOperadores.dsrUsuariosInstrucoesTrabalho;
  ConsultaNiveisConhecimento.edfCodigo.DataField := 'nivelconhecimento';
  ConsultaNiveisConhecimento.edfCodigo.operacao := opATRIBUICAO;
  ConsultaNiveisConhecimento.edfCodigo.LookupSource := ConsultaNiveisConhecimento.dsrProcuraNiveisConhecimento;
  ConsultaNiveisConhecimento.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaNiveisConhecimento.edfCodigo.LookupField := 'Codigo';
  ConsultaNiveisConhecimento.AbrirTabelaProcura := false;
  ConsultaNiveisConhecimento.TipoPesquisa := pesNIVEISCONHECIMENTO;
  ConsultaNiveisConhecimento.OnFound := AtribuirDadosNiveisConhecimento;

  fraConsultaTurno.tipopesquisa := pesTURNO;

  dbgOperacoesdeProducao.OnDelete := dtmCadastroOperadores.ExcluirInstrucaoTrabalho;


end;

destructor TfrmCadastroOperadores.Destroy;
begin
  dtmCadastroOperadores := nil;
  inherited;
  frmCadastroOperadores:= nil;
end;





function TfrmCadastroOperadores.InternoGravar: Boolean;
var
  Controle: TWinControl;
begin
  Result:= True;
  if (ActiveControl is TtecFindCustom) and (Trim(TtecFindCustom(ActiveControl).Text) <> '') then
    Result:= TtecFindCustom(ActiveControl).Exist;

  if result then
    Result := inherited InternoGravar;

  if result then
    dtmCadastroOperadores.gravarOperador;
end;

{
procedure TfrmCadastroOperadores.AlterarEstadoBotoes;
begin
  inherited AlterarEstadoBotoes;
  sbnExcluir.Enabled := not dtmCadastroOperadores.qryUsuarios.ReadOnly;
end;
}

procedure TfrmCadastroOperadores.CriticarDataInativa(datainativa: TDBEditData);
begin
  if not dataembranco(datainativa.Text) and datainativa.Criticar(false) then
   if strtodate(datainativa.Text)>dtmCadastroOperadores.DataServidor then
    if MensagemConfirmacao(ctDATASUPERIORAATUAL)=smbCancel then
      datainativa.SetFocus;
end;


procedure TfrmCadastroOperadores.edfCodigoUsuarioMessage(var Msg: String);
begin
  inherited;
  Msg := ctUSUARIONAODISPONIVEL;
end;


procedure TfrmCadastroOperadores.edtSenhaEmailChange(Sender: TObject);
begin
  inherited;
  dtmCadastroOperadores.EditarUsuarios;
end;

procedure TfrmCadastroOperadores.dbgOperacoesdeProducaoDblClick(
  Sender: TObject);
begin
  inherited;
  acionarPesquisaGrade;
end;

procedure TfrmCadastroOperadores.AcionarPesquisaGrade;
begin
  if not dtmCadastroOperadores.qryUsuariosInstrucoesTrabalho.ReadOnly then
  begin
    if dbgOperacoesdeProducao.SelectedIndex in [0..1] then
    begin
      dbgOperacoesdeProducao.SetFocus;
      ConsultaInstrucoes.CtrlOn := True;
      ConsultaInstrucoes.InternoPesquisar(ctINSTRUCOESTRABALHO);
      dbgOperacoesdeProducao.SetFocus;
      dbgOperacoesdeProducao.SelectedIndex :=  0;
    end
    else
    if dbgOperacoesdeProducao.SelectedIndex in [3..4] then
    begin
      dbgOperacoesdeProducao.SetFocus;
      ConsultaNiveisConhecimento.CtrlOn := True;
      ConsultaNiveisConhecimento.InternoPesquisar('Níveis de Conhecimento');
      dbgOperacoesdeProducao.SetFocus;
      dbgOperacoesdeProducao.SelectedIndex :=  3;
    end;
  end;
end;

procedure TfrmCadastroOperadores.CondicoesinstrucaoProducao;
const
  SQLProcura = 'and ((it.codigo not in (%s) and (it.inativo is null or it.inativo > current_date))  or it.codigo = %s)';
  SQLConsulta = 'and (it.codigo not in (%s) and (it.inativo is null or it.inativo > current_date))';
var
  codigoinstrucao : String;
begin
   codigoinstrucao := inttostr(dtmCadastroOperadores.qryUsuariosInstrucoesTrabalhoinstrucaotrabalho.Asinteger);
   if (dtmCadastroOperadores.qryUsuariosInstrucoesTrabalho.State = dsInsert) then
     codigoinstrucao := '0';

   ConsultaInstrucoes.qryProcuraInstrucoesTrabalho.MacroByName('SQLInstrucoesJaSelecionadas').AsString :=
     format(SQLProcura,[dtmCadastroOperadores.ListaInstrucaoSelecionadas, codigoinstrucao]);

   ConsultaInstrucoes.qryConsultaInstrucoesTrabalho.MacroByName('SQLInstrucoesJaSelecionadas').AsString :=
     format(SQLConsulta,[dtmCadastroOperadores.ListaInstrucaoSelecionadas]);

end;


procedure TfrmCadastroOperadores.AtribuirDadosinstrucaoProducao;
begin
  with dtmCadastroOperadores do
  begin
    EditarUsuariosinstrucaoProducao;
    qryUsuariosInstrucoesTrabalhoinstrucaotrabalho.AsInteger := ConsultaInstrucoes.qryProcuraInstrucoesTrabalhocodigo.AsInteger;
    qryUsuariosInstrucoesTrabalhodescricaoinstrucao.AsString := ConsultaInstrucoes.qryProcuraInstrucoesTrabalhodescricao.AsString;

    if ConsultaInstrucoes.qryProcuraInstrucoesTrabalhoinativo.isnull then
      qryUsuariosInstrucoesTrabalhoinativo.clear
    else
      qryUsuariosInstrucoesTrabalhoinativo.AsDateTime := ConsultaInstrucoes.qryProcuraInstrucoesTrabalhoinativo.asdatetime;

//    qryUsuariosInstrucoesTrabalho.Post;
  end;
end;

procedure TfrmCadastroOperadores.dbgOperacoesdeProducaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  if Shift = [ssCtrl] then
  if CtrlOn then
  begin
    case Key of
      VK_F9     : begin
                     ConsultaInstrucoes.CtrlOn := true;
                     AcionarPesquisaGrade
                   end;
    end;
  end
  else if Shift = [] then
  case Key of
    VK_Return: case dbgOperacoesdeProducao.SelectedIndex of
                 0: begin
                      if not VerificarInstrucoes then
                      begin
                        key := 0;
                        dbgOperacoesdeProducao.SelectedIndex := 0;
                      end
                      else
                        dbgOperacoesdeProducao.SelectedIndex := 3;

                    end;
                 1,2: dbgOperacoesdeProducao.SelectedIndex := 3;

                 3: begin
                      if not dtmCadastroOperadores.qryUsuariosInstrucoesTrabalho.ReadOnly then
                      begin
                        if ConsultaNiveisConhecimento.edfCodigo.Exist then
                        begin
                          AtribuirDadosNiveisConhecimento;
                          dtmCadastroOperadores.GravarUsuariosinstrucaoProducao;
                        end
                        else
                        begin
                          key := 0;
                          dbgOperacoesdeProducao.SelectedIndex := 2;
                        end;
                      end;
                    end;
                 4: dbgOperacoesdeProducao.SelectedIndex := 5;
               end;

    VK_Delete: begin
                case dbgOperacoesdeProducao.SelectedIndex of
                 6, 7 : begin
                          dtmCadastroOperadores.qryUsuariosInstrucoesTrabalhodatafinaltreinamento.Clear;
                          dtmCadastroOperadores.qryUsuariosInstrucoesTrabalhodatainicialtreinamento.Clear;
                        end;
                 end;
               end;
  end;
  inherited;

end;

procedure TfrmCadastroOperadores.AtribuirDadosNiveisConhecimento;
begin
  with dtmCadastroOperadores do
  begin
    EditarUsuariosinstrucaoProducao;
    qryUsuariosInstrucoesTrabalhonivelconhecimento.AsInteger := ConsultaNiveisConhecimento.qryProcuraNiveislConhecimentocodigo.AsInteger;
    qryUsuariosInstrucoesTrabalhodescricaonivelconhecimento.AsString := ConsultaNiveisConhecimento.qryProcuraNiveislConhecimentodescricao.AsString;
//    qryUsuariosInstrucoesTrabalho.Post;
  end;

end;

function TfrmCadastroOperadores.VerificarInstrucoes: boolean;
begin
  result := true;
  if not dtmCadastroOperadores.qryUsuariosInstrucoesTrabalho.ReadOnly then
  begin
    ConsultaInstrucoes.edfCodigo.Exist;

    if not ConsultaInstrucoes.qryProcuraInstrucoesTrabalho.IsEmpty then
      AtribuirDadosinstrucaoProducao
    else
    begin
      result := false;
      dbgOperacoesdeProducao.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroOperadores.FormShow(Sender: TObject);
begin
  inherited;
//  chkCobranca.OnClick := chkCobrancaClick;
end;

procedure TfrmCadastrooperadores.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaOperadores.InternoPesquisar(ctUSUARIOS);
  self.SetFocus;
end;

procedure TfrmCadastrooperadores.AbrirOperadores;
begin
  edfCodigoUsuario.Text := ConsultaOperadores.qryProcuraUsuarioscodigo.AsString;
  dtmCadastroOperadores.
        refazconsulta(dtmCadastroOperadores.qryUsuarios,[0],
             [ConsultaOperadores.qryProcuraUsuarioscodigo.AsString]);
end;

procedure TfrmCadastrooperadores.sbnIncluirInstrucaoTrabalhoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperadores.IncluirInstrucaoTrabalho;
end;

procedure TfrmCadastrooperadores.sbnExcluirInstrucaoTrabalhoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroOperadores.ExcluirInstrucaoTrabalho;
end;

procedure TfrmCadastrooperadores.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
    case key of
     VK_F9 : sbnProcurarClick(self);
    end;

end;

end.
