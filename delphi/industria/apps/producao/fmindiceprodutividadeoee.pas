unit fmindiceprodutividadeoee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  StdCtrls, cpdata, frselecaoaleatoria, dmindiceprodutividadeoee, ctconstantes,
  frconsulta, frconsultacodigo, cpdbfindcontrols, DB, OleServer, ExcelXP,
  Grids, DBGrids, cpdbgrid, cpdbradiogroup;

type
  TfrmIndiceProdutividadeOEE = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtdatainicial: TEditData;
    edtdatafinal: TEditData;
    gbxMaquinas: TGroupBox;
    fraSelecaoAleatoriaMaquinas: TfraSelecaoAleatoria;
    pgcIndiceProdutividadeOEE: TPageControl;
    tstSelecao: TTabSheet;
    tstDados: TTabSheet;
    dbgIndiceProdutividadeOEE: TtecDBGrid;
    sbnGerar: TSpeedButton;
    gbxTurnos: TGroupBox;
    dbgTurnos: TtecDBGrid;
    ckbPorTurnos: TCheckBox;
    rgbTipoIndices: TtecDBRadioGroup;
    rbnIndicesPorMaquina: TtecRadioButton;
    rbnIndicesPorSetor: TtecRadioButton;
    gbxSetoresProducao: TGroupBox;
    fraSelecaoAleatoriaSetoresdeProducao: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriaMaquinasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaMaquinassbnProcuraClick(
      Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckbPorTurnosClick(Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure AtribuirDadosMaquinas(Found: Boolean);
    procedure AcionarPesquisaGradeMaquinas;

    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AcionarPesquisaGradeSetoresProducao;
    procedure AtribuirDadosSetoresProducao(Found: Boolean);





  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;


  end;

var
  frmIndiceProdutividadeOEE: TfrmIndiceProdutividadeOEE;

implementation

{$R *.dfm}

{ TfrmIndiceProdutividadeOEE }

procedure TfrmIndiceProdutividadeOEE.AcionarPesquisaGradeMaquinas;
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


procedure TfrmIndiceProdutividadeOEE.AtribuirDadosMaquinas(Found: Boolean);
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

constructor TfrmIndiceProdutividadeOEE.Create(Aowner: Tcomponent);
var
  Dia, Mes, Ano: Word;
  NData: TDateTime;
begin
  dtmIndiceProdutividadeOEE := TdtmIndiceProdutividadeOEE.Create(Self);
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


end;

destructor TfrmIndiceProdutividadeOEE.Destroy;
begin
  dtmIndiceProdutividadeOEE := nil;
  inherited;
  frmIndiceProdutividadeOEE := nil;
end;

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaMaquinasqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
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


procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaMaquinassbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeMaquinas;

end;


procedure TfrmIndiceProdutividadeOEE.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if dtmIndiceProdutividadeOEE.AbrirConsulta(edtdatainicial.Text, edtdatafinal.Text,
                                          fraSelecaoAleatoriaMaquinas.StringSelecionada,
                                          fraSelecaoAleatoriaSetoresdeProducao.StringSelecionada,
                                          ckbPorTurnos.Checked,
                                          rgbTipoIndices.ItemIndex) then
    pgcIndiceProdutividadeOEE.ActivePage := tstDados

end;

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeMaquinas;

end;

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
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



procedure TfrmIndiceProdutividadeOEE.InternoImpressao;
begin
  inherited;
  dtmIndiceProdutividadeOEE.exportarExcell;
end;

procedure TfrmIndiceProdutividadeOEE.ckbPorTurnosClick(Sender: TObject);
begin
  inherited;
  if ckbPorTurnos.Checked then
    gbxTurnos.Enabled := true
  else
    gbxTurnos.Enabled := false;
    
end;

procedure TfrmIndiceProdutividadeOEE.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F6 : sbnGerarClick(self);
  end;   

end;

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaSetoresdeProducao do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

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

procedure TfrmIndiceProdutividadeOEE.AcionarPesquisaGradeSetoresProducao;
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

procedure TfrmIndiceProdutividadeOEE.AtribuirDadosSetoresProducao(Found: Boolean);
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

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure TfrmIndiceProdutividadeOEE.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
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

end.
