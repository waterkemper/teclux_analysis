unit fmmanutencaoacessos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  cpdbgrid, ctConstantes, StdCtrls, biblio, Mask, DBCtrls, cptexto,{Qete,}
  cppagecontrol, Windows, ToolWin;

type
  TfrmManutencaoAcessos = class(TFrmCadastroPadrao)
    pnlFundoJanela: TPanel;
    sbnMarcarUsuarios: TSpeedButton;
    sbnDesmarcarUsuarios: TSpeedButton;
    sbnMarcarGrupoUsuarios: TSpeedButton;
    sbnDesmarcarGrupoUsuarios: TSpeedButton;
    dbgGruposUsuarios: TtecDBGrid;
    dbgUsuarios: TtecDBGrid;
    rgpRecursos: TRadioGroup;
    edtProcuraNomeUsuario: TEditTexto;
    Label1: TLabel;
    tecPageControl1: TtecPageControl;
    tstTeclux: TTabSheet;
    dbgUsuariosAcessos: TtecDBGrid;
    dbgModulosAcessos: TtecDBGrid;
    sbnRetirarRecursos: TSpeedButton;
    sbnSelecionarRecursos: TSpeedButton;
    tstIteclux: TTabSheet;
    dbgModulosAcessosIteclux: TtecDBGrid;
    sbnRetirarRecursosIteclux: TSpeedButton;
    sbnSelecionarRecursosIteclux: TSpeedButton;
    dbgUsuariosAcessosIteclux: TtecDBGrid;
    procedure dbgUsuariosDblClick(Sender: TObject);
    procedure dbgGruposUsuariosDblClick(Sender: TObject);
    procedure sbnMarcarUsuariosClick(Sender: TObject);
    procedure sbnDesmarcarGrupoUsuariosClick(Sender: TObject);
    procedure sbnMarcarGrupoUsuariosClick(Sender: TObject);
    procedure sbnDesmarcarUsuariosClick(Sender: TObject);
    procedure dbgUsuariosAcessosDblClick(Sender: TObject);
    procedure sbnRetirarRecursosClick(Sender: TObject);
    procedure dbgModulosAcessosDblClick(Sender: TObject);
    procedure sbnSelecionarRecursosClick(Sender: TObject);
    procedure rgpRecursosClick(Sender: TObject);
    procedure edtProcuraNomeUsuarioChange(Sender: TObject);
    procedure edtProcuraNomeUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormLoaded(Sender: TObject);
    procedure sbnRetirarRecursosItecluxClick(Sender: TObject);
    procedure sbnSelecionarRecursosItecluxClick(Sender: TObject);
    procedure dbgUsuariosAcessosItecluxDblClick(Sender: TObject);
    procedure dbgModulosAcessosItecluxDblClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function  InternoGravar: Boolean; Override;

  public
    { Public declarations }
     constructor Create(AOwner: TComponent); Override;
     destructor  Destroy; override;
  end;

var
  frmManutencaoAcessos: TfrmManutencaoAcessos;

implementation
uses dmmanutencaoacessos;

{$R *.dfm}

{ TfrmManutencaoAcessos }

constructor TfrmManutencaoAcessos.Create(AOwner: TComponent);
begin
  dtmManutencaoAcessos := TdtmManutencaoAcessos.Create(Self);
  inherited;
  dtmManutencaoAcessos.Abre(ctTabelas);
  DataSet := dtmManutencaoAcessos.TabelaAtualizaUsuariosAcesso;
//  dtmManutencaoAcessos.TipoRecurso := rgpRecursos.ItemIndex;
  if dtmManutencaoAcessos.TabelaUsuarios.IsEmpty then
  begin
   MensagemAviso(format(ctTABELAVAZIA, ['Usuários']));
   close;
  end;
end;

destructor TfrmManutencaoAcessos.Destroy;
begin
  dtmManutencaoAcessos:=nil;
  inherited;
  frmManutencaoAcessos := nil;
end;

procedure TfrmManutencaoAcessos.dbgUsuariosDblClick(Sender: TObject);
begin
  inherited;
  case rgpRecursos.ItemIndex of
   0: dtmManutencaoAcessos.MarcarUsuario(false, false);
  end;
end;

procedure TfrmManutencaoAcessos.dbgGruposUsuariosDblClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.MarcarGrupoUsuarios(false,false);
end;

procedure TfrmManutencaoAcessos.sbnMarcarUsuariosClick(Sender: TObject);
begin
  inherited;
  case rgpRecursos.ItemIndex of
   0: dtmManutencaoAcessos.MarcarUsuario(true, true);
  end;
end;

procedure TfrmManutencaoAcessos.sbnDesmarcarGrupoUsuariosClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.MarcarGrupoUsuarios(true,false);
end;

procedure TfrmManutencaoAcessos.sbnMarcarGrupoUsuariosClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.MarcarGrupoUsuarios(true,true);
end;

procedure TfrmManutencaoAcessos.sbnDesmarcarUsuariosClick(Sender: TObject);
begin
  inherited;
  case rgpRecursos.ItemIndex of
   0: dtmManutencaoAcessos.MarcarUsuario(true, false);
  end;
end;

procedure TfrmManutencaoAcessos.dbgUsuariosAcessosDblClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.RetirarRecurso(false);
end;

procedure TfrmManutencaoAcessos.sbnRetirarRecursosClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.RetirarRecurso(true);
end;

procedure TfrmManutencaoAcessos.dbgModulosAcessosDblClick(Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.AdicionarRecurso(false);
end;

procedure TfrmManutencaoAcessos.sbnSelecionarRecursosClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.AdicionarRecurso(true);
end;

function TfrmManutencaoAcessos.InternoGravar: Boolean;
begin
 dtmManutencaoAcessos.gravarAtualizaUsuariosAcessos;
 result := true;
end;

procedure TfrmManutencaoAcessos.rgpRecursosClick(Sender: TObject);
begin
  inherited;
  case rgpRecursos.itemindex of
   0: DataSet := dtmManutencaoAcessos.TabelaAtualizaUsuariosAcesso;
   1: begin
       if dtmManutencaoAcessos.TabelaGruposUsuarios.IsEmpty then
       begin
         MensagemAviso(format(ctTABELAVAZIA,['GruposUsuários']));
         rgpRecursos.ItemIndex := 0;
       end
       else
        DataSet := dtmManutencaoAcessos.TabelaAtualizaGruposUsuariosAcesso;
      end;
  end;
  
  if (dtmManutencaoAcessos.TipoRecurso <> rgpRecursos.ItemIndex) then
    dtmManutencaoAcessos.TipoRecurso := rgpRecursos.ItemIndex;

  sbnMarcarUsuarios.Enabled := (rgpRecursos.ItemIndex = 0);
  sbnDesmarcarUsuarios.Enabled := (rgpRecursos.ItemIndex = 0);
end;

procedure TfrmManutencaoAcessos.edtProcuraNomeUsuarioChange(Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.ProcuraNome(edtProcuraNomeUsuario.Text);
end;

procedure TfrmManutencaoAcessos.edtProcuraNomeUsuarioKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  case key of
    VK_DOWN : begin
                 dtmManutencaoAcessos.Proximo;
               end;
    VK_UP   : begin
                 dtmManutencaoAcessos.Anterior;
               end;
  end;
end;

procedure TfrmManutencaoAcessos.FormLoaded(Sender: TObject);
begin
  inherited;
  edtProcuraNomeUsuario.SetFocus;
end;

procedure TfrmManutencaoAcessos.sbnRetirarRecursosItecluxClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.RetirarRecursoIteclux(true);
end;

procedure TfrmManutencaoAcessos.sbnSelecionarRecursosItecluxClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.AdicionarRecursoIteclux(true);
end;

procedure TfrmManutencaoAcessos.dbgUsuariosAcessosItecluxDblClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.RetirarRecursoIteclux(false);
end;

procedure TfrmManutencaoAcessos.dbgModulosAcessosItecluxDblClick(
  Sender: TObject);
begin
  inherited;
  dtmManutencaoAcessos.AdicionarRecursoIteclux(false);
end;

end.
