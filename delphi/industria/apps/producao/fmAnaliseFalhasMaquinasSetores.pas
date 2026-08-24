unit fmAnaliseFalhasMaquinasSetores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  StdCtrls, cpdata, frselecaoaleatoria, dmAnaliseFalhasMaquinasSetores, ctconstantes,
  frconsulta, frconsultacodigo, cpdbfindcontrols, DB, OleServer, ExcelXP,
  Grids, DBGrids, cpdbgrid, cpdbradiogroup;

type
  TfrmAnaliseFalhasMaquinasSetores = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtdatainicial: TEditData;
    edtdatafinal: TEditData;
    gbxMaquinas: TGroupBox;
    fraSelecaoAleatoriaMaquinas: TfraSelecaoAleatoria;
    pgcAnaliseFalhasMaquinasSetores: TPageControl;
    tstSelecao: TTabSheet;
    tstDados: TTabSheet;
    dbgAnaliseFalhasMaquinasSetores: TtecDBGrid;
    sbnGerar: TSpeedButton;
    rgbTipoIndices: TtecDBRadioGroup;
    rbnMaquinasXFalhas: TtecRadioButton;
    rbnSetores_x_Falhas: TtecRadioButton;
    gbxSetoresdeProducao: TGroupBox;
    fraSelecaoAleatoriaSetoresdeProducao: TfraSelecaoAleatoria;
    gbxFalhas: TGroupBox;
    fraSelecaoAleatoriaFalhas: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriaMaquinasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaMaquinassbnProcuraClick(
      Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaFalhasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaFalhasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFalhasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaFalhassbnProcuraClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtribuirDadosMaquinas(Found: Boolean);
    procedure AtribuirDadosFalhas(Found: Boolean);

    procedure AcionarPesquisaGradeMaquinas;
    procedure AcionarPesquisaGradeFalhas;

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
  frmAnaliseFalhasMaquinasSetores: TfrmAnaliseFalhasMaquinasSetores;

implementation

{$R *.dfm}

{ TfrmAnaliseFalhasMaquinasSetores }

procedure TfrmAnaliseFalhasMaquinasSetores.AcionarPesquisaGradeMaquinas;
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


procedure TfrmAnaliseFalhasMaquinasSetores.AtribuirDadosMaquinas(Found: Boolean);
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

constructor TfrmAnaliseFalhasMaquinasSetores.Create(Aowner: Tcomponent);
var
  Dia, Mes, Ano: Word;
  NData: TDateTime;
begin
  dtmAnaliseFalhasMaquinasSetores := TdtmAnaliseFalhasMaquinasSetores.Create(Self);
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

  fraSelecaoAleatoriaFalhas.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaFalhas.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaFalhas do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaFalhas';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraFalhas;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesFalhas;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosFalhas;
  end;



end;

destructor TfrmAnaliseFalhasMaquinasSetores.Destroy;
begin
  dtmAnaliseFalhasMaquinasSetores := nil;
  inherited;
  frmAnaliseFalhasMaquinasSetores := nil;
end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaMaquinasqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
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


procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaMaquinassbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeMaquinas;

end;


procedure TfrmAnaliseFalhasMaquinasSetores.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if dtmAnaliseFalhasMaquinasSetores.AbrirConsulta(edtdatainicial.Text, edtdatafinal.Text,
                                          fraSelecaoAleatoriaMaquinas.StringSelecionada,
                                          fraSelecaoAleatoriaSetoresdeProducao.StringSelecionada,
                                          fraSelecaoAleatoriaFalhas.StringSelecionada,
                                          rgbTipoIndices.ItemIndex) then
    pgcAnaliseFalhasMaquinasSetores.ActivePage := tstDados

end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeMaquinas;

end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaMaquinasdbgSelecaoAleatoriaKeyDown(
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



procedure TfrmAnaliseFalhasMaquinasSetores.InternoImpressao;
begin
  inherited;
  dtmAnaliseFalhasMaquinasSetores.exportarExcell;
end;

procedure TfrmAnaliseFalhasMaquinasSetores.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F6 : sbnGerarClick(self);
  end;   

end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaSetoresdeProducao do begin
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

procedure TfrmAnaliseFalhasMaquinasSetores.AcionarPesquisaGradeSetoresProducao;
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

procedure TfrmAnaliseFalhasMaquinasSetores.AtribuirDadosSetoresProducao(Found: Boolean);
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

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
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

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaFalhasqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc, nf: integer;

begin
  inherited;
  with fraSelecaoAleatoriaFalhas do begin
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

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaFalhasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeFalhas;

end;

procedure TfrmAnaliseFalhasMaquinasSetores.AcionarPesquisaGradeFalhas;
begin
  with fraSelecaoAleatoriaFalhas do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Falhas');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaFalhasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaFalhas.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaFalhas.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGradeFalhas
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaFalhas.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaFalhas.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaFalhas.ConsultaSelecaoAleatoria.qryProcuraFalhas.IsEmpty then
                    AtribuirDadosFalhas(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaFalhas.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaFalhas.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;

end;

procedure TfrmAnaliseFalhasMaquinasSetores.AtribuirDadosFalhas(Found: Boolean);
begin
  with fraSelecaoAleatoriaFalhas do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraFalhascodigo.AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraFalhasdescricao.AsString;

    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfrmAnaliseFalhasMaquinasSetores.fraSelecaoAleatoriaFalhassbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeFalhas;
end;

end.
