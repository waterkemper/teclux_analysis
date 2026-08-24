unit fmmotivosparadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  StdCtrls, cpdata, frselecaoaleatoria, dmmotivosparadas, ctconstantes,
  frconsulta, frconsultacodigo, cpdbfindcontrols, DB, OleServer, ExcelXP,
  Grids, DBGrids, cpdbgrid, cpdbradiogroup;

type
  Tfrmmotivosparadas = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtdatainicial: TEditData;
    edtdatafinal: TEditData;
    gbxCobrador: TGroupBox;
    fraSelecaoAleatoriaSetoresdeProducao: TfraSelecaoAleatoria;
    GroupBox1: TGroupBox;
    fraSelecaoAleatoriaFuncionarios: TfraSelecaoAleatoria;
    pgcmotivosparadas: TPageControl;
    tstSelecao: TTabSheet;
    tstDados: TTabSheet;
    dbgmotivosparadas: TtecDBGrid;
    sbnGerar: TSpeedButton;
    gbxMaquinas: TGroupBox;
    fraSelecaoAleatoriaMaquinas: TfraSelecaoAleatoria;
    gbxMotivosParadas: TGroupBox;
    fraSelecaoAleatoriaMotivosParadas: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaFuncionariosqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFuncionariossbnProcuraClick(
      Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaMaquinasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaMotivosParadasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaMotivosParadasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaMotivosParadasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  protected
      procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
    procedure AtribuirDadosSetoresProducao(Found: Boolean);
    procedure AtribuirDadosMaquinas(Found: Boolean);
    procedure AtribuirDadosMotivosParadas(Found: Boolean);

    procedure AcionarPesquisaGradeSetoresProducao;
    procedure AcionarPesquisaGradeMaquinas;
    procedure AcionarPesquisaGradeMotivosParadas;

    procedure AtribuirDadosFuncionarios(Found: Boolean);
    procedure AcionarPesquisaFuncionarios;

    procedure InternoImpressao; override;


  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;


  end;

var
  frmmotivosparadas: Tfrmmotivosparadas;

implementation

{$R *.dfm}

{ Tfrmmotivosparadas }

procedure Tfrmmotivosparadas.AcionarPesquisaFuncionarios;
begin
  with fraSelecaoAleatoriaFuncionarios do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar(ctUSUARIOS);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure Tfrmmotivosparadas.AcionarPesquisaGradeSetoresProducao;
begin
  with fraSelecaoAleatoriaSetoresdeProducao do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Setores de Produção');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure Tfrmmotivosparadas.AtribuirDadosFuncionarios(Found: Boolean);
begin
  with fraSelecaoAleatoriaFuncionarios do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraUsuarioscodigo.AsString;

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraUsuariosnome.AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

procedure Tfrmmotivosparadas.AtribuirDadosSetoresProducao(Found: Boolean);
begin
  with fraSelecaoAleatoriaSetoresdeProducao do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraSetoresProducaocodigo.AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraSetoresProducaodescricao.AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

constructor Tfrmmotivosparadas.Create(Aowner: Tcomponent);
var
  Dia, Mes, Ano: Word;
  NData: TDateTime;
begin
  dtmmotivosparadas := Tdtmmotivosparadas.Create(Self);
  inherited;

  fraSelecaoAleatoriaSetoresdeProducao.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaSetoresdeProducao.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaSetoresdeProducao do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaSetoresProducao';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraSetoresProducao;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesSETORESPRODUCAO;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosSetoresProducao;
  end;

  fraSelecaoAleatoriaFuncionarios.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaFuncionarios.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaFuncionarios do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaFuncionarios';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 6;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraUsuarios;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesUSUARIOS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosFuncionarios;
  end;

    fraSelecaoAleatoriaMaquinas.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaMaquinas.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaMaquinas do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaMaquinas';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraMaquinas;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesMaquinas;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosMaquinas;
  end;


  fraSelecaoAleatoriaMotivosParadas.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaMotivosParadas.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaMotivosParadas do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaMotivosParadas';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraMotivosParadas;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesMotivosParadas;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosMotivosParadas;
  end;




end;

destructor Tfrmmotivosparadas.Destroy;
begin
  dtmmotivosparadas:= nil;
  inherited;
  frmmotivosparadas:= nil;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaSetoresdeProducao do begin
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'DESCRIÇÃO';
     qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := true;

     qrySelecaoAleatoria.FieldByName('numeropedidoosp').visible := false;

     qrySelecaoAleatoria.Append;
     qrySelecaoAleatoria.Post;

     with dbgSelecaoAleatoria do
          for nc:= 0 to 1 do with Columns[nc].Title do begin
              Alignment:= taCenter;
              Font.Name:= 'helvetica';
              Font.Height:= -9;
          end;
  end;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaFuncionariosqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaFuncionarios do begin
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'NOME DO OPERADOR';
     qrySelecaoAleatoria.FieldByName('nome').ReadOnly := true;

     qrySelecaoAleatoria.Append;
     qrySelecaoAleatoria.Post;

     with dbgSelecaoAleatoria do
          for nc:= 0 to 1 do with Columns[nc].Title do begin
              Alignment:= taCenter;
              Font.Name:= 'helvetica';
              Font.Height:= -9;
          end;
  end;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaFuncionariossbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaFuncionarios;
end;

procedure Tfrmmotivosparadas.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if dtmmotivosparadas.AbrirConsulta(edtdatainicial.Text, edtdatafinal.Text,
                                          fraSelecaoAleatoriaSetoresdeProducao.StringSelecionada,
                                          fraSelecaoAleatoriaFuncionarios.StringSelecionada,
                                          fraSelecaoAleatoriaMaquinas.StringSelecionada,
                                          fraSelecaoAleatoriaMotivosParadas.StringSelecionada) then

    pgcmotivosparadas.ActivePage := tstDados

end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaSetoresdeProducao.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaSetoresdeProducao.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGradeSetoresProducao
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaSetoresdeProducao.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaSetoresdeProducao.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaSetoresdeProducao.ConsultaSelecaoAleatoria.qryProcuraSetoresProducao.IsEmpty then
                    AtribuirDadosSetoresProducao(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaSetoresdeProducao.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaSetoresdeProducao.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaFuncionarios;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.CtrlOn then
                      AcionarPesquisaFuncionarios
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaFuncionarios.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                 if not fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.qryProcuraUsuarios.IsEmpty then
                    AtribuirDadosFuncionarios(true)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaFuncionarios.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaFuncionarios.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;
end;

procedure Tfrmmotivosparadas.InternoImpressao;
begin
  inherited;
  dtmmotivosparadas.exportarExcell;

end;

procedure Tfrmmotivosparadas.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F6 : sbnGerarClick(self);
  end;   
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaMaquinasqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc, nf: integer;
begin
  inherited;
  with fraSelecaoAleatoriaMaquinas do begin
     for nf:= 0 to qrySelecaoAleatoria.FieldCount - 1 do
         qrySelecaoAleatoria.Fields[nf].Visible := false;

     qrySelecaoAleatoria.FieldByName('codigo').visible := true;
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('descricao').visible := true;
     qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'DESCRIÇÃO';
     qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := true;

     qrySelecaoAleatoria.Append;
     qrySelecaoAleatoria.Post;

     with dbgSelecaoAleatoria do
          for nc:= 0 to 1 do with Columns[nc].Title do begin
              Alignment:= taCenter;
              Font.Name:= 'helvetica';
              Font.Height:= -9;
          end;
  end;

end;

procedure Tfrmmotivosparadas.AtribuirDadosMaquinas(Found: Boolean);
begin
  with fraSelecaoAleatoriaMaquinas do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraMaquinascodigo.AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraMaquinasdescricao.AsString;

    qrySelecaoAleatoria.Post;
  end;

end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeMaquinas;
end;

procedure Tfrmmotivosparadas.AcionarPesquisaGradeMaquinas;
begin
  with fraSelecaoAleatoriaMaquinas do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Setores de Produção');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;

end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaMaquinas.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaMaquinas.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGradeMaquinas
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaMaquinas.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaMaquinas.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaMaquinas.ConsultaSelecaoAleatoria.qryProcuraMaquinas.IsEmpty then
                    AtribuirDadosMaquinas(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaMaquinas.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaMaquinas.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;

end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaMotivosParadasqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc, nf: integer;
begin
  inherited;
  with fraSelecaoAleatoriaMotivosParadas do begin
     for nf:= 0 to qrySelecaoAleatoria.FieldCount - 1 do
         qrySelecaoAleatoria.Fields[nf].Visible := false;


     qrySelecaoAleatoria.FieldByName('codigo').visible := true;
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('descricao').visible := true;
     qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'DESCRIÇÃO';
     qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := true;

     qrySelecaoAleatoria.Append;
     qrySelecaoAleatoria.Post;

     with dbgSelecaoAleatoria do
          for nc:= 0 to 1 do with Columns[nc].Title do begin
              Alignment:= taCenter;
              Font.Name:= 'helvetica';
              Font.Height:= -9;
          end;
  end;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaMotivosParadasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeMotivosParadas;
end;

procedure Tfrmmotivosparadas.AcionarPesquisaGradeMotivosParadas;
begin
  with fraSelecaoAleatoriaMotivosParadas do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Motivo de Paradas');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure Tfrmmotivosparadas.fraSelecaoAleatoriaMotivosParadasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaMotivosParadas.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaMotivosParadas.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGradeMotivosParadas
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaMotivosParadas.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaMotivosParadas.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaMotivosParadas.ConsultaSelecaoAleatoria.qryProcuraMotivosParadas.IsEmpty then
                    AtribuirDadosMotivosParadas(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaMotivosParadas.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaMotivosParadas.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;
end;

procedure Tfrmmotivosparadas.AtribuirDadosMotivosParadas(Found: Boolean);
begin
  with fraSelecaoAleatoriaMotivosParadas do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraMotivosParadascodigo.AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraMotivosParadasdescricao.AsString;

    qrySelecaoAleatoria.Post;
  end;

end;

end.
