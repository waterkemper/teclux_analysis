unit fmSelecaoImpressaoAtendimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajuda, frselecaoaleatoriaclientes, StdCtrls, CheckLst,
  frintervalodata, frselecaoaleatoriausuarios, fmajudabt, ComCtrls,
  Buttons, ToolWin, ExtCtrls, fmrelatoriopadrao, Grids, DBGrids, cpdbgrid,
  ActnList, fmselecionarusuario, frlistatiposAtendimentos,
  frselecaoaleatoriagruposusuarios, cppagecontrol, frlistafiliais;

type
  TfrmSelecaoImpressaoAtendimentos = class(TfrmRelatorioPadrao)
    fraSelecaoAleatoriaClientes: TfraSelecaoAleatoriaClientes;
    gbxTiposdeAtendimentos: TGroupBox;
    ckbListaTiposOrcamentos: TCheckListBox;
    gbxListadeClientes: TGroupBox;
    fraSelecaoAleatoriausuarios: TfraSelecaoAleatoriausuarios;
    gbxStatus: TGroupBox;
    ckbStatus: TCheckListBox;
    fraIntervaloDataCadastro: TfraIntervaloData;
    fraIntervaloDataLembrar: TfraIntervaloData;
    pgcSelecaoAtendimentos: TPageControl;
    tstParametrosSelecao: TTabSheet;
    tstDadosSelecionados: TTabSheet;
    sbnGerar: TSpeedButton;
    sbnTrocarUsuario: TSpeedButton;
    dbgDadosSelecionados: TtecDBGrid;
    Timer1: TTimer;
    fraListatiposatendimentos: TfraListatiposatendimentos;
    pgcAntendentes: TtecPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    fraSelecaoAleatoriaGrupoCadastrantes: TfraSelecaoAleatoriagruposusuarios;
    fraListaFiliais1: TfraListaFiliais;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnTrocarUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure InternoImpressao; override;
  end;

var
  frmSelecaoImpressaoAtendimentos: TfrmSelecaoImpressaoAtendimentos;

implementation

uses dmcadastroatendimentos;

{$R *.dfm}

{ TfrmSelecaoImpressaoAtendimentos }

procedure TfrmSelecaoImpressaoAtendimentos.InternoImpressao;
begin
  inherited;
  dtmCadastroAtendimentos.ImprimirMultiplosRegistroAtendimentos;
end;

procedure TfrmSelecaoImpressaoAtendimentos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_f6: if sbnGerar.enabled then
             sbnGerarClick(nil);
  end;

end;

procedure TfrmSelecaoImpressaoAtendimentos.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if dtmCadastroAtendimentos.GerarMultiplosRegistroAtendimentos(
                          fraSelecaoAleatoriaClientes.ListaCondicional,
                          fraSelecaoAleatoriausuarios.ListaCondicional,
                          fraSelecaoAleatoriaGrupoCadastrantes.ListaCondicional,
                          fraListatiposatendimentos.ListaSelecionada,
                          fraListaFiliais1.ListaSelecionada,
                          ckbListaTiposOrcamentos.Checked[0],
                          ckbListaTiposOrcamentos.Checked[1],
                          ckbListaTiposOrcamentos.Checked[2],
                          ckbListaTiposOrcamentos.Checked[3],
                          ckbStatus.Checked[0],
                          ckbStatus.Checked[1],
                          fraIntervaloDataCadastro.mkeDataInicio.text,
                          fraIntervaloDataCadastro.mkeDataFinal.text,
                          fraIntervaloDataLembrar.mkeDataInicio.text,
                          fraIntervaloDataLembrar.mkeDataFinal.text

                          ) then
  begin
    pgcSelecaoAtendimentos.ActivePage := tstDadosSelecionados;
    if vImprimir then
      dtmCadastroAtendimentos.ImprimirMultiplosRegistroAtendimentos;

  end;
end;

procedure TfrmSelecaoImpressaoAtendimentos.sbnTrocarUsuarioClick(
  Sender: TObject);
begin
  inherited;
  frmSelecionarUsuario := TfrmSelecionarUsuario.create(frmSelecionarUsuario);
  frmSelecionarUsuario.showmodal;
  if frmSelecionarUsuario.modalresult = mrOK then
    if frmSelecionarUsuario.fraConsultaUsuarios.edfcodigo.text<> '' then
       if dtmCadastroAtendimentos.TrocarUsuarioManualmente(frmSelecionarUsuario.fraConsultaUsuarios.edfcodigo.text,
        frmSelecionarUsuario.fraConsultaUsuarios.qryProcuraUsuariosnome.AsString) then
          sbnGerarClick(nil);


end;

procedure TfrmSelecaoImpressaoAtendimentos.FormShow(Sender: TObject);
begin
  inherited;
  sbnGerar.left := 0;
end;

procedure TfrmSelecaoImpressaoAtendimentos.Timer1Timer(Sender: TObject);
begin
  inherited;
   sbnImprimir.enabled := (dtmCadastroAtendimentos.qryatendimentos_.recordcount <> 0) and
                         (pgcSelecaoAtendimentos.ActivePage = tstDadosSelecionados);

  sbnTrocarUsuario.enabled := sbnImprimir.enabled;
end;

end.
