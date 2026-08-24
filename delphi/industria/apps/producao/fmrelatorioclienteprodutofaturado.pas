unit fmrelatorioclienteprodutofaturado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frselecaoaleatoria, StdCtrls, dmrelatorioclienteprodutofaturado, db,
  ctconstantes, frconsultacodigo, cpdbfindcontrols, Mask, cpdata,
  cpeditioncontrolvalidation, biblio, Grids, DBGrids, cpdbgrid;

type
  TfrmRelatorioClienteProdutoFaturado = class(TfrmRelatorioPadrao)
    sbnGerar: TSpeedButton;
    gbxClientes: TGroupBox;
    fraSelecaoAleatoriaClientes: TfraSelecaoAleatoria;
    gbxGrupos: TGroupBox;
    fraSelecaoAleatoriaGruposdeProdutos: TfraSelecaoAleatoria;
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtDataInicial: TEditMesAno;
    edtDataFinal: TEditMesAno;
    pgcRelatorioClienteProdutoFaturado: TPageControl;
    tstParametros: TTabSheet;
    tstDados: TTabSheet;
    ecvValida: TtecEditionControlValidation;
    dbgDados: TtecDBGrid;
    procedure fraSelecaoAleatoriaClientesqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaGruposdeProdutosqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaGruposdeProdutossbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaGruposdeProdutosdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaGruposdeProdutosdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaClientessbnProcuraClick(Sender: TObject);
    procedure fraSelecaoAleatoriaClientessbnIncluirItemClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaClientesdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaClientesdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbnGerarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtribuirDadosClientes(Found: Boolean);
    procedure AtribuirDadosGruposdeProdutos(Found: Boolean);
    procedure AcionarPesquisaGruposdeProdutos;
    procedure AcionarPesquisaClientes;
    function ValidarCamposSelecao: Boolean;
    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

var
  frmRelatorioClienteProdutoFaturado: TfrmRelatorioClienteProdutoFaturado;
  ControleValido       : TWinControl;


implementation

uses frconsulta;

{$R *.dfm}

procedure TfrmRelatorioClienteProdutoFaturado.AcionarPesquisaGruposdeProdutos;
begin
  with fraSelecaoAleatoriaGruposdeProdutos do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar(ctGRUPOS);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfrmRelatorioClienteProdutoFaturado.AtribuirDadosClientes(Found: Boolean);
begin
  with fraSelecaoAleatoriaClientes do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraClientecodigo.AsString;

    qrySelecaoAleatoria.FieldByName('tipo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraClientetipo.AsString;

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraClientenome.AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

procedure TfrmRelatorioClienteProdutoFaturado.AtribuirDadosGruposdeProdutos(Found: Boolean);
begin
  with fraSelecaoAleatoriaGruposdeProdutos do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraGrupoProdutos.FieldByname('codigo').AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraGrupoProdutos.FieldByname('descricao').AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

constructor TfrmRelatorioClienteProdutoFaturado.Create(Aowner: Tcomponent);
begin
  dtmRelatorioClienteProdutoFaturado := TdtmRelatorioClienteProdutoFaturado.Create(Self);
  inherited;

  fraSelecaoAleatoriaClientes.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaClientes.CampoParaLista2 := 'tipo';

  fraSelecaoAleatoriaClientes.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaClientes do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaClientes';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraCliente;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesCLIENTES;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosClientes;
    ConsultaSelecaoAleatoria.TipoCliente := 'C';
  end;

  fraSelecaoAleatoriaGruposdeProdutos.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaGruposdeProdutos.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaGruposdeProdutos do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaGruposdeProdutos';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraGrupoProdutos;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesGRUPOS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosGruposdeProdutos;
  end;

end;

destructor TfrmRelatorioClienteProdutoFaturado.Destroy;
begin

  inherited;
end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaClientesqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaClientes do begin
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('tipo').DisplayLabel := 'T';
     qrySelecaoAleatoria.FieldByName('tipo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'NOME DO CLIENTE';
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

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaGruposdeProdutosqrySelecaoAleatoriaAfterOpen(DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaGruposdeProdutos do begin
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

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaGruposdeProdutossbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGruposdeProdutos;
end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaGruposdeProdutosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGruposdeProdutos;
end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaGruposdeProdutosdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaGruposdeProdutos.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaGruposdeProdutos.ConsultaSelecaoAleatoria.CtrlOn then
                      AcionarPesquisaGruposdeProdutos
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaGruposdeProdutos.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaGruposdeProdutos.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                 if not fraSelecaoAleatoriaGruposdeProdutos.ConsultaSelecaoAleatoria.qryProcuraGrupoProdutos.IsEmpty then
                    AtribuirDadosGruposdeProdutos(true)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaGruposdeProdutos.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaGruposdeProdutos.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;

end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaClientessbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaClientes;
end;

procedure TfrmRelatorioClienteProdutoFaturado.AcionarPesquisaClientes;
begin
  with fraSelecaoAleatoriaClientes do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar(ctCLIENTES);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaClientessbnIncluirItemClick(
  Sender: TObject);
begin
  inherited;
  fraSelecaoAleatoriaClientes.sbnIncluirItemClick(Sender);

end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaClientesdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaClientes;
end;

procedure TfrmRelatorioClienteProdutoFaturado.fraSelecaoAleatoriaClientesdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaClientes.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaClientes.ConsultaSelecaoAleatoria.CtrlOn then
                      AcionarPesquisaClientes
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaClientes.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaClientes.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                 if not fraSelecaoAleatoriaClientes.ConsultaSelecaoAleatoria.qryProcuraCliente.IsEmpty then
                    AtribuirDadosClientes(true)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaClientes.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaClientes.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;

end;

procedure TfrmRelatorioClienteProdutoFaturado.sbnGerarClick(
  Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    if dtmRelatorioClienteProdutoFaturado.AbrirConsulta(edtDataInicial.Text, edtDataFinal.Text,
                                            fraSelecaoAleatoriaClientes.StringSelecionada,
                                            fraSelecaoAleatoriaGruposdeProdutos.StringSelecionada) then
      pgcRelatorioClienteProdutoFaturado.ActivePage := tstDados
  end;
end;

function TfrmRelatorioClienteProdutoFaturado.ValidarCamposSelecao: Boolean;
begin
  result := ecvValida.Verify(tstParametros, ControleValido);
end;

procedure TfrmRelatorioClienteProdutoFaturado.InternoImpressao;
begin
  inherited;
  dtmRelatorioClienteProdutoFaturado.ExportarExcel; 
end;

procedure TfrmRelatorioClienteProdutoFaturado.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F6 : sbnGerarClick(self);
  end;  

end;

end.
