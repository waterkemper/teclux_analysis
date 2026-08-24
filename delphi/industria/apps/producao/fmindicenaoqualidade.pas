unit fmindicenaoqualidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  StdCtrls, cpdata, frselecaoaleatoria, dmindicenaoqualidade, ctconstantes,
  frconsulta, frconsultacodigo, cpdbfindcontrols, DB, OleServer, ExcelXP,
  Grids, DBGrids, cpdbgrid, cpdbradiogroup;

type
  Tfrmindicenaoqualidade = class(TfrmRelatorioPadrao)
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtdatainicial: TEditData;
    edtdatafinal: TEditData;
    gbxCobrador: TGroupBox;
    fraSelecaoAleatoriaSetoresdeProducao: TfraSelecaoAleatoria;
    GroupBox1: TGroupBox;
    fraSelecaoAleatoriaFuncionarios: TfraSelecaoAleatoria;
    pgcindicenaoqualidade: TPageControl;
    tstSelecao: TTabSheet;
    tstDados: TTabSheet;
    dbgindicenaoqualidade: TtecDBGrid;
    sbnGerar: TSpeedButton;
    rgbTipoEficiencia: TtecDBRadioGroup;
    rbn_Custo_nao_qualidade: TtecRadioButton;
    rbn_PPM: TtecRadioButton;
    rbnPN_PPM_Custos: TtecRadioButton;
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
    procedure rbn_Custo_nao_qualidadeClick(Sender: TObject);
    procedure rbn_PPMClick(Sender: TObject);
    procedure rbnPN_PPM_CustosClick(Sender: TObject);
    procedure rbnTempoMotivosParadasClick(Sender: TObject);
  private
  protected
      procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
    procedure AtribuirDadosSetoresProducao(Found: Boolean);
    procedure AcionarPesquisaGradeSetoresProducao;

    procedure AtribuirDadosFuncionarios(Found: Boolean);
    procedure AcionarPesquisaFuncionarios;
    procedure InternoImpressao; override;


  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;


  end;

var
  frmindicenaoqualidade: Tfrmindicenaoqualidade;

implementation

{$R *.dfm}

{ Tfrmindicenaoqualidade }

procedure Tfrmindicenaoqualidade.AcionarPesquisaFuncionarios;
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

procedure Tfrmindicenaoqualidade.AcionarPesquisaGradeSetoresProducao;
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

procedure Tfrmindicenaoqualidade.AtribuirDadosFuncionarios(Found: Boolean);
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

procedure Tfrmindicenaoqualidade.AtribuirDadosSetoresProducao(Found: Boolean);
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

constructor Tfrmindicenaoqualidade.Create(Aowner: Tcomponent);
var
  Dia, Mes, Ano: Word;
  NData: TDateTime;
begin
  dtmindicenaoqualidade := Tdtmindicenaoqualidade.Create(Self);
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

  dtmindicenaoqualidade.TipoConsultaNaoQualidade := tpCustoNaoQualidade;
  pgcindicenaoqualidade.ActivePage := tstSelecao;
end;

destructor Tfrmindicenaoqualidade.Destroy;
begin
  dtmindicenaoqualidade:= nil;
  inherited;
  frmindicenaoqualidade:= nil;
end;

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaSetoresdeProducaoqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
var nc: byte;
begin
  inherited;
  with fraSelecaoAleatoriaSetoresdeProducao do
  begin
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

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaFuncionariosqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
var nc: byte;
begin
  inherited;
  with fraSelecaoAleatoriaFuncionarios do
  begin
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

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaSetoresdeProducaosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaFuncionariossbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaFuncionarios;
end;

procedure Tfrmindicenaoqualidade.sbnGerarClick(Sender: TObject);
var nc: integer;
begin
  inherited;

  if dtmindicenaoqualidade.AbrirConsulta(edtdatainicial.Text, edtdatafinal.Text,
                                          fraSelecaoAleatoriaSetoresdeProducao.StringSelecionada,
                                          fraSelecaoAleatoriaFuncionarios.StringSelecionada)
  then begin;
//       for nc:= 0 to dbgindicenaoqualidade.FieldCount do
//           dbgindicenaoqualidade.Columns[nc].Title.Alignment:= taCenter;
       pgcindicenaoqualidade.ActivePage := tstDados;
  end;


end;

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeSetoresProducao;

end;

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaSetoresdeProducaodbgSelecaoAleatoriaKeyDown(
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

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaFuncionarios;
end;

procedure Tfrmindicenaoqualidade.fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaKeyDown(
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

procedure Tfrmindicenaoqualidade.InternoImpressao;
begin
  inherited;
  dtmindicenaoqualidade.exportarExcell;
end;


procedure Tfrmindicenaoqualidade.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F6 : sbnGerarClick(self);
  end;   
end;

procedure Tfrmindicenaoqualidade.rbn_Custo_nao_qualidadeClick(
  Sender: TObject);
begin
  inherited;
  dtmindicenaoqualidade.TipoConsultaNaoQualidade := tpCustoNaoQualidade;
end;

procedure Tfrmindicenaoqualidade.rbn_PPMClick(Sender: TObject);
begin
  inherited;
  dtmindicenaoqualidade.TipoConsultaNaoQualidade := tpPPM;
end;

procedure Tfrmindicenaoqualidade.rbnPN_PPM_CustosClick(Sender: TObject);
begin
  inherited;
  dtmindicenaoqualidade.TipoConsultaNaoQualidade:= tpPN_PPM_Custos;
end;

procedure Tfrmindicenaoqualidade.rbnTempoMotivosParadasClick(
  Sender: TObject);
begin
  inherited;
  dtmindicenaoqualidade.TipoConsultaNaoQualidade:= tpTemposMotivosParadas;
end;

end.
