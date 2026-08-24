unit fmcadastroSetoresProducao;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls,
  dmcadastroSetoresProducao, Grids, DBGrids, cpdbgrid, DBCtrls, cptexto,
  Mask, cpdbfindcontrols, frconsultacodigo, ctconstantes, db, Windows,
  cpdbspinedit, cpnumero, ToolWin, frRegistroOperacoes, ActnList;

type
  TfrmCadastroSetoresProducao = class(TfrmCadastroPadrao)
    gbxCodigoMaquina: TGroupBox;
    gbxDescricao: TGroupBox;
    edfCodigo: TtecDbEditFind;
    PageControl1: TPageControl;
    tstCadastro: TTabSheet;
    tstLog: TTabSheet;
    fraRegistroOperacoes1: TfraRegistroOperacoes;
    sbnImprimir: TSpeedButton;
    gbxLideresdoSetor: TGroupBox;
    dbgLideresdoSetor: TtecDBGrid;
    pgcIndicadores: TPageControl;
    tstLideres: TTabSheet;
    tstPremiacao: TTabSheet;
    sbnIncluirLiderdoSetor: TSpeedButton;
    sbnExcluirLiderdoSetor: TSpeedButton;
    actAtualizar: TActionList;
    Action1: TAction;
    gbxMeses: TGroupBox;
    dbgPremiacaoSetor: TtecDBGrid;
    sbnIncluirPremiacao: TSpeedButton;
    sbnExcluirPremiacao: TSpeedButton;
    gbxCustoHomemHora: TGroupBox;
    edtCustoHomemHora: TDBEditNumero;
    lblCustoHomemHora: TLabel;
    edtDescricao: TDBEditTexto;
    gbxFatorCusto: TGroupBox;
    edtFatorCusto: TDBEditNumero;
    lblCustoSetor: TLabel;
    procedure sbnProcurarClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure dbgLideresdoSetorDblClick(Sender: TObject);
    procedure dbgLideresdoSetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnIncluirLiderdoSetorClick(Sender: TObject);
    procedure sbnExcluirLiderdoSetorClick(Sender: TObject);
    procedure Action1Update(Sender: TObject);
    procedure sbnIncluirPremiacaoClick(Sender: TObject);
    procedure sbnExcluirPremiacaoClick(Sender: TObject);
    procedure dbgPremiacaoSetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure AtribuirDadosUsuariosLideres(Found: Boolean);
    procedure CondicoesSetoresProducaoLideres;
    procedure AcionarPesquisaGradeUsuarios;


  protected
    ConsultaSetoresProducao : TfraConsultaCodigo;
    ConsultaUsuarios : TfraConsultaCodigo;
    function InternoExcluir: Boolean; override;
    function InternoGravar: Boolean; override;
    function InternoIncluir: Boolean; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AbrirMotivoParadas(Found: Boolean) ;
    procedure ExcluirSetoresProducaoLideres;
    procedure ExcluirSetoresProducaoPremiacao;


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmCadastroSetoresProducao: TfrmCadastroSetoresProducao;

implementation

uses frconsulta,biblio, fmImprimirsetoresproducao;

{$R *.dfm}

{ TfrmCadastroSetoresProducao }

procedure TfrmCadastroSetoresProducao.AbrirMotivoParadas(Found: Boolean);
begin
  edfCodigo.Text := ConsultaSetoresProducao.qryProcuraSetoresProducaocodigo.AsString;
  dtmCadastroSetoresProducao.
        refazconsulta(dtmCadastroSetoresProducao.qrySetoresProducao,[0],
             [edfCodigo.Text]);
end;

constructor TfrmCadastroSetoresProducao.Create(AOwner: TComponent);
begin
  inherited;
  dtmCadastroSetoresProducao := TdtmCadastroSetoresProducao.Create(Self);
  DataSet := dtmCadastroSetoresProducao.qrySetoresProducao;

  ConsultaSetoresProducao := TfraConsultaCodigo.Create(self);
  ConsultaSetoresProducao.edfCodigo.DataSource := dtmCadastroSetoresProducao.dsrSetoresProducao;
  ConsultaSetoresProducao.edfCodigo.DataField := 'codigo';
  ConsultaSetoresProducao.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaSetoresProducao.AbrirTabelaProcura := false;
  ConsultaSetoresProducao.TipoPesquisa := pesSetoresProducao;
  ConsultaSetoresProducao.OnFound := AbrirMotivoParadas;
  ConsultaSetoresProducao.Name := 'fraConsultaSetoresProducao';

  ConsultaUsuarios := TfraConsultaCodigo.Create(self);
  ConsultaUsuarios.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaUsuarios.Name := 'fraConsultaUsuario';
  ConsultaUsuarios.edfCodigo.MaxLength := 3;
  ConsultaUsuarios.edfCodigo.DataSource := dtmCadastroSetoresProducao.dsrSetoresProducaoLideres;
  ConsultaUsuarios.edfCodigo.DataField := 'usuario';
  ConsultaUsuarios.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaUsuarios.edfCodigo.LookupSource := ConsultaUsuarios.dsrProcuraUsuarios;
  ConsultaUsuarios.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaUsuarios.edfCodigo.LookupField := 'Codigo';
  ConsultaUsuarios.AbrirTabelaProcura := false;
  ConsultaUsuarios.CondicoesdaConsulta := CondicoesSetoresProducaoLideres;
  ConsultaUsuarios.TipoPesquisa := pesUSUARIOS;
  ConsultaUsuarios.OnFound := AtribuirDadosUsuariosLideres;

  dbgLideresdoSetor.OnDelete := ExcluirSetoresProducaoLideres;

  dbgPremiacaoSetor.OnDelete := ExcluirSetoresProducaoPremiacao;

  pgcIndicadores.ActivePage := tstLideres;


end;

destructor TfrmCadastroSetoresProducao.Destroy;
begin
  dtmCadastroSetoresProducao.qrySetoresProducao.close;
  dtmCadastroSetoresProducao := nil;
  inherited;
  frmCadastroSetoresProducao := nil;
end;

function TfrmCadastroSetoresProducao.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroSetoresProducao.ExcluirSetoresProducao;
  end;
end;

function TfrmCadastroSetoresProducao.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if Result then
    dtmCadastroSetoresProducao.GravarSetoresProducao;
end;

function TfrmCadastroSetoresProducao.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then begin
    if not CtrlOn then
      dtmCadastroSetoresProducao.IncluirSetoresProducao;
  end;
end;

procedure TfrmCadastroSetoresProducao.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key =VK_F9) then
    begin
      if sbnProcurar.Enabled then
	  begin
        ConsultaSetoresProducao.InternoPesquisar('Setores da Produção');
        self.SetFocus;
	  end
    end;
    if (key =VK_F7) then
      sbnImprimirClick(frmImprimirsetoresproducao);
  end;

end;

procedure TfrmCadastroSetoresProducao.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaSetoresProducao.InternoPesquisar('Setores da Produção');
  self.SetFocus;
end;

procedure TfrmCadastroSetoresProducao.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  frmImprimirSetoresProducao := TfrmImprimirSetoresProducao.Create(frmImprimirSetoresProducao);
  frmImprimirSetoresProducao.ShowModal;
  frmImprimirSetoresProducao.Free;
end;

procedure TfrmCadastroSetoresProducao.AtribuirDadosUsuariosLideres(Found: Boolean);
begin
  with dtmCadastroSetoresProducao do
  begin
    if (qrySetoresProducaoLideresnomeusuario.AsString <> ConsultaUsuarios.qryProcuraUsuariosnome.AsString) or
       (qrySetoresProducaoLideresusuario.AsString <> ConsultaUsuarios.qryProcuraUsuarioscodigo.AsString) then
    begin
      qrySetoresProducaoLideres.Edit;
      qrySetoresProducaoLideresnomeusuario.AsString := ConsultaUsuarios.qryProcuraUsuariosnome.AsString;
      qrySetoresProducaoLideresusuario.AsString := ConsultaUsuarios.qryProcuraUsuarioscodigo.AsString;
      qrySetoresProducaoLideresturno.AsString := ConsultaUsuarios.qryProcuraUsuariosturno.AsString;
      qrySetoresProducaoLideresdescricaoturno.AsString := ConsultaUsuarios.qryProcuraUsuariosdescricaoturno.AsString;
      qrySetoresProducaoLideresusuariovalidado.AsBoolean := true;

    end;
  end;
end;

procedure TfrmCadastroSetoresProducao.CondicoesSetoresProducaoLideres;
const
  SQL = ' and (codigo not in (%s) or codigo = %s) ';
begin
  if (dtmCadastroSetoresProducao.qrySetoresProducaoLideresusuario.AsString<>'') and
     not (dtmCadastroSetoresProducao.qrySetoresProducaoLideres.state = dsinsert) then
  begin

    ConsultaUsuarios.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      format(SQL,[dtmCadastroSetoresProducao.ListaUsuariosTerminoAberto,
                  inttostr(dtmCadastroSetoresProducao.qrySetoresProducaoLideresusuario.asinteger)]);

    ConsultaUsuarios.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      format(SQL,[dtmCadastroSetoresProducao.ListaUsuariosTerminoAberto,
                  inttostr(dtmCadastroSetoresProducao.qrySetoresProducaoLideresusuario.asinteger)]);
  end
  else
  begin
    ConsultaUsuarios.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      format(SQL,[dtmCadastroSetoresProducao.ListaUsuariosTerminoAberto,
                  inttostr(0)]);

    ConsultaUsuarios.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      format(SQL,[dtmCadastroSetoresProducao.ListaUsuariosTerminoAberto,
                  inttostr(0)]);
  end;
end;


procedure TfrmCadastroSetoresProducao.dbgLideresdoSetorDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeUsuarios;
end;

procedure TfrmCadastroSetoresProducao.AcionarPesquisaGradeUsuarios;
begin
  if dtmCadastroSetoresProducao.qrySetoresProducaoLideres.state = dsinsert then
  begin
    dbgLideresdoSetor.SetFocus;
    case dbgLideresdoSetor.SelectedIndex of
      2,3 :
      begin
        ConsultaUsuarios.CtrlOn := True;
        ConsultaUsuarios.InternoPesquisar(ctUSUARIOS);
        dbgLideresdoSetor.SetFocus;
        dbgLideresdoSetor.SelectedIndex :=  2;
      end;
    end;
  end;
end;

procedure TfrmCadastroSetoresProducao.dbgLideresdoSetorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);

  Procedure VerificarUsuarios;
  begin
    if (dtmCadastroSetoresProducao.qrySetoresProducaoLideres.State in [dsinsert]) {or
       not (dtmCadastroSetoresProducao.qrySetoresProducaoLideres.IsEmpty)} then
       begin
          ConsultaUsuarios.edfCodigo.Modified := true;
          ConsultaUsuarios.edfCodigo.DoExit;
          if ConsultaUsuarios.qryProcuraUsuarios.IsEmpty then
          begin
            dtmCadastroSetoresProducao.LimparOperacoesOSPUsuario;
            dbgLideresdoSetor.SetFocus;
            dbgLideresdoSetor.SelectedIndex := 2;
          end
          else
          begin
            dtmCadastroSetoresProducao.qrySetoresProducaoLideresusuariovalidado.AsBoolean := true;
            AtribuirDadosUsuariosLideres(true);
            dbgLideresdoSetor.SetFocus;
            dbgLideresdoSetor.SelectedIndex := 2;
            if dtmCadastroSetoresProducao.qrySetoresProducaoLideres.CheckRequiredFields then
            begin
              dtmCadastroSetoresProducao.qrySetoresProducaoLideres.post;
              InternoGravar;
              dbgLideresdoSetor.SetFocus;
            end;
          end;
       end;
  end;

begin
  inherited;
  case dbgLideresdoSetor.SelectedIndex of
  0 : begin
        case Key of
         VK_Return: dbgLideresdoSetor.SelectedIndex := dbgLideresdoSetor.SelectedIndex + 1 ;
        end;
      end;

  1 : begin
        case Key of
         VK_Return: begin
                      if not dtmCadastroSetoresProducao.qrySetoresProducaoLideresusuario.ReadOnly then
                        dbgLideresdoSetor.SelectedIndex := dbgLideresdoSetor.SelectedIndex + 1
                      else
                      begin
                        dtmCadastroSetoresProducao.qrySetoresProducaoLideres.post;
                        InternoGravar;
                        dbgLideresdoSetor.SetFocus;
                      end;
                    end;
        end;
      end;

  2,
  3 : begin
        if Shift = [ssCtrl] then
        begin
          case Key of
           VK_F9     : begin
                           if not dtmCadastroSetoresProducao.qrySetoresProducaoLideresusuario.ReadOnly then
                           begin
                             ConsultaUsuarios.CtrlOn := Shift = [ssCtrl];
                             if (Shift = []) or ConsultaUsuarios.CtrlOn then
                               AcionarPesquisaGradeUsuarios
                           end;
                         end;
          end;
        end
        else
        case Key of
         VK_Return: VerificarUsuarios;
        end;
      end;
  end;
end;

procedure TfrmCadastroSetoresProducao.sbnIncluirLiderdoSetorClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroSetoresProducao.IncluirSetoresProducaoLideres;
end;

procedure TfrmCadastroSetoresProducao.sbnExcluirLiderdoSetorClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroSetoresProducao.ExcluirSetoresProducaoLideres
end;

procedure TfrmCadastroSetoresProducao.Action1Update(Sender: TObject);
begin
  inherited;
  sbnExcluirLiderdoSetor.enabled := dtmCadastroSetoresProducao.qrySetoresProducaoLideres.RecNo =
                                    dtmCadastroSetoresProducao.qrySetoresProducaoLideres.Recordcount;

  sbnExcluirPremiacao.enabled := dtmCadastroSetoresProducao.qrySetoresProducaoPremiacao.RecNo =
                                    dtmCadastroSetoresProducao.qrySetoresProducaoPremiacao.Recordcount;


end;

procedure TfrmCadastroSetoresProducao.ExcluirSetoresProducaoLideres;
begin
 if sbnExcluirLiderdoSetor.Enabled then
  dtmCadastroSetoresProducao.ExcluirSetoresProducaoLideres;

end;

procedure TfrmCadastroSetoresProducao.sbnIncluirPremiacaoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroSetoresProducao.IncluirSetoresProducaoPremiacao;
end;

procedure TfrmCadastroSetoresProducao.sbnExcluirPremiacaoClick(
  Sender: TObject);
begin
  inherited;
  dtmCadastroSetoresProducao.ExcluirSetoresProducaoPremiacao
end;

procedure TfrmCadastroSetoresProducao.ExcluirSetoresProducaoPremiacao;
begin
 if sbnExcluirPremiacao.Enabled then
  dtmCadastroSetoresProducao.ExcluirSetoresProducaoPremiacao;

end;

procedure TfrmCadastroSetoresProducao.dbgPremiacaoSetorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case dbgPremiacaoSetor.SelectedIndex of
  0 : begin
        case Key of
         VK_Return: dbgPremiacaoSetor.SelectedIndex := dbgPremiacaoSetor.SelectedIndex + 1 ;
        end;
      end;

  1 : begin
        case Key of
          VK_Return: begin
                       dtmCadastroSetoresProducao.qrySetoresProducaoPremiacao.Post;
                       dbgPremiacaoSetor.setfocus;
                     end;

        end;
      end;
  end;

end;

end.
