unit fmFCI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frselecaoaleatoria, StdCtrls, dmFCI, frconsultacodigo, frconsulta,
  ctconstantes, cpdbfindcontrols, biblio, Grids, DBGrids, cpdbgrid, DB,
  ActnList, fmajudabt, cptexto;

type
  TfrmFCI = class(TFrmAjudaBT)
    gbxPNs: TGroupBox;
    fraSelecaoAleatoriaPN: TfraSelecaoAleatoria;
    gbxArquivo: TGroupBox;
    lblArquivo: TLabel;
    sbnArquivo: TSpeedButton;
    dlgArquivoaExportar: TSaveDialog;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    sbnGerar_: TSpeedButton;
    sbnExportar: TSpeedButton;
    gbxDados: TGroupBox;
    dbgfci: TtecDBGrid;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnArquivoClick(Sender: TObject);
    procedure dbgFCIDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure sbnGerar_Click(Sender: TObject);
    procedure sbnExportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtribuirDadosPN;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


  end;

var
  frmFCI: TfrmFCI;

implementation

{$R *.dfm}

{ TfrmFCI }

procedure TfrmFCI.AtribuirDadosPN;
begin
  with fraSelecaoAleatoriaPN do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraItemProdutoscodigo.AsString;

    qrySelecaoAleatoria.FieldByName('descricao').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraItemProdutosdescricaolc.AsString;

    qrySelecaoAleatoria.Post;

  end;
end;

constructor TfrmFCI.Create(AOwner: TComponent);
begin
  inherited;
  dtmFCI := TdtmFCI.Create(Self);

  fraSelecaoAleatoriaPN.qrySelecaoAleatoria.Sql.Text :=
//     'SELECT  Codigo, descricao FROM produtos WHERE false';
     'SELECT  cast(null as char(10)) as Codigo, cast(null as varchar(50)) as descricao';

  fraSelecaoAleatoriaPN.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaPN.qrySelecaoAleatoria.Open;
  fraSelecaoAleatoriaPN.qrySelecaoAleatoria.delete;

(*
  with fraSelecaoAleatoriaPN do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 10;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';

    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
//    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraPN;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
//    ConsultaSelecaoAleatoria.TipoPesquisa := pesPN;
//    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosItemProduto;
  end;
*)
  lblArquivo.Caption := 'FCI_'+FormatDateTime('DDMMYYYY',now)+'.TXT';
end;

destructor TfrmFCI.Destroy;
begin
  dtmFCI := nil;
  inherited;
  frmFCI := nil;
end;


procedure TfrmFCI.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if dtmFCI.GerarArquivo(lblArquivo.Caption) then
    MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[lblArquivo.Caption]));
end;

procedure TfrmFCI.sbnArquivoClick(Sender: TObject);
begin
  inherited;
  if dlgArquivoaExportar.Execute then
   lblarquivo.Caption:=trim(dlgArquivoaExportar.FileName);
end;

procedure TfrmFCI.dbgFCIDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if column.FieldName = 'precovenda' then
  begin
    if (dbgFCI.DataSource.DataSet.FieldByName('precovenda').isnull) or
       (dbgFCI.DataSource.DataSet.FieldByName('precovenda').value = 0) or

       ((dbgFCI.DataSource.DataSet.FieldByName('precovenda').value <> 0) and
        (dbgFCI.DataSource.DataSet.FieldByName('valorimportacao').value <> 0) and
        (dbgFCI.DataSource.DataSet.FieldByName('precovenda').ascurrency <
         dbgFCI.DataSource.DataSet.FieldByName('valorimportacao').ascurrency)) then

      dbgFCI.Canvas.Brush.Color := clRed
    else
      dbgFCI.Canvas.Brush.Color:= clWindow;

    dbgFCI.Canvas.FillRect(Rect);
    dbgFCI.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  if column.FieldName = 'valorimportacao' then
  begin
    if (dbgFCI.DataSource.DataSet.FieldByName('valorimportacao').isnull) or
       (dbgFCI.DataSource.DataSet.FieldByName('valorimportacao').value = 0) or

       ((dbgFCI.DataSource.DataSet.FieldByName('precovenda').value <> 0) and
        (dbgFCI.DataSource.DataSet.FieldByName('valorimportacao').value <> 0) and
        (dbgFCI.DataSource.DataSet.FieldByName('precovenda').ascurrency <
         dbgFCI.DataSource.DataSet.FieldByName('valorimportacao').ascurrency)) then

      dbgFCI.Canvas.Brush.Color := clRed
    else
      dbgFCI.Canvas.Brush.Color:= clWindow;

    dbgFCI.Canvas.FillRect(Rect);
    dbgFCI.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  if column.FieldName = 'ncm' then
  begin
    if (dbgFCI.DataSource.DataSet.FieldByName('ncm').isnull) or
       (length(trim(dbgFCI.DataSource.DataSet.FieldByName('ncm').asstring))<>8) then
      dbgFCI.Canvas.Brush.Color := clRed
    else
      dbgFCI.Canvas.Brush.Color:= clWindow;

    dbgFCI.Canvas.FillRect(Rect);
    dbgFCI.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end


end;

procedure TfrmFCI.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  sbnExportar.Enabled := dtmFCI.qryFCI.RecordCount <> 0;
end;

procedure TfrmFCI.sbnGerar_Click(Sender: TObject);
begin
  inherited;
  with dtmFCI do
  begin
   ParametroCabecalho:='';
   ListadePNsSelecionadasAleatoriamente := fraSelecaoAleatoriaPN.StringSelecionada;
   if not AbrirConsultas then
     MensagemAviso(format(ctNENHUMREGISTROSELECIONADO, ['registro']));
  end;

end;

procedure TfrmFCI.sbnExportarClick(Sender: TObject);
begin
  inherited;
  if dtmFCI.GerarArquivo(lblArquivo.Caption) then
    MensagemAviso(format(ctARQUIVOGERADOSUCESSO,[lblArquivo.Caption]));

end;

end.
