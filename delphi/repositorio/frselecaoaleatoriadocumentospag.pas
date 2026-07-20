unit frselecaoaleatoriadocumentospag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frselecaoaleatoria, DB, frconsultacodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoAleatoriadocumentospag = class(TFrame)
    fraSelecaoAleatoriadocumentospag: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriadocumentospagsbnProcuraClick(Sender: TObject);
    procedure fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function GetListaCondicional: String;
    procedure AtribuirDadosdocumentospag(Found: Boolean);
    procedure AcionarPesquisaGrade;


    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;

  end;

implementation

uses frconsulta;

{$R *.dfm}

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriadocumentospag do
  begin
    qrySelecaoAleatoria.FieldByName('numero').DisplayLabel := 'Documento';
    qrySelecaoAleatoria.FieldByName('numero').ReadOnly := False;

//    qrySelecaoAleatoria.FieldByName('tipo').visible := false;
{
    qrySelecaoAleatoria.FieldByName('tipo').DisplayLabel := 'T';
    qrySelecaoAleatoria.FieldByName('tipo').ReadOnly := true;
    }

    qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'Nome do Fornecedor/Cliente';
    qrySelecaoAleatoria.FieldByName('nome').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('opcomparacao').DisplayLabel := 'Comparação';
    qrySelecaoAleatoria.FieldByName('opcomparacao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraSelecaoAleatoriadocumentospag do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'numero';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriadocumentospag.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriadocumentospag.qrySelecaoAleatoria.FieldByName('numero')) then
    acionarPesquisaGrade;

end;

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriadocumentospagsbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

constructor TfraSelecaoAleatoriadocumentospag.Create(AOwner: TComponent);
begin
  inherited;

  fraSelecaoAleatoriadocumentospag.PossuiCampoFilial := false;
  fraSelecaoAleatoriadocumentospag.PossuiCamposerie := false;
  fraSelecaoAleatoriadocumentospag.PossuiCamponumeronota := false;
  fraSelecaoAleatoriadocumentospag.PossuiCampooperacao := false;
  fraSelecaoAleatoriadocumentospag.PossuiCampochv_nfe := false;
  fraSelecaoAleatoriadocumentospag.PossuiCampocodigonota := false;
  fraSelecaoAleatoriadocumentospag.PossuiCampoTipo := false;
  fraSelecaoAleatoriadocumentospag.PossuiCampoDescricao := false;


  fraSelecaoAleatoriadocumentospag.qrySelecaoAleatoria.Sql.Text :=
    'SELECT  cast(null as char(20)) as numero, '+
    '            cast(null as varchar(60)) as nome, '+
    '            cast(null as varchar(11)) as campo, '+
    '            cast(null as varchar(20)) as opcomparacao, '+
    '            cast(null as varchar(2)) as oplogico ';


  fraSelecaoAleatoriadocumentospag.CampoParaLista := 'numero';
//  fraSelecaoAleatoriaContrato.CampoParaLista2 := 'tipo';


  with fraSelecaoAleatoriadocumentospag do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 8;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'numero';

    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldInterno := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.DataaFieldVisual := 'numero';


    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraDocumentosPag;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldinterno := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.LookupaFieldVisual := 'numero';

    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesdocumentospag;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosdocumentospag;
    ConsultaSelecaoAleatoria.TipoCliente := 'F';
    ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;
    fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;
  end;
  
  fraSelecaoAleatoriadocumentospag.UtilizarCamparacaoeLogica := true;

end;

function TfraSelecaoAleatoriadocumentospag.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriadocumentospag.ListaCondicional, 'numero','dp.numero');
  result := trocar(result, 'nomefornecedor','dp.nome');
end;

procedure TfraSelecaoAleatoriadocumentospag.AtribuirDadosdocumentospag(Found: Boolean);
begin
  with fraSelecaoAleatoriadocumentospag do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('numero').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraDocumentosPagnumero.AsString;
{
    qrySelecaoAleatoria.FieldByName('tipo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraContratotipo.AsString;}

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraDocumentosPagnomefornecedor.AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'numero';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;
  end;
end;

procedure TfraSelecaoAleatoriadocumentospag.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriadocumentospag do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Documentos');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriadocumentospag.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriadocumentospag.qrySelecaoAleatoria.FieldByName('numero')) then
                     begin
                       fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriadocumentospag.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriadocumentospag.qrySelecaoAleatoria.FieldByName('numero')) then
                begin
                  fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriadocumentospag.qrySelecaoAleatoria.FieldByName('numero').asString;
                  fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.edfCodigo.modified := true;
                  fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.qryProcuraDocumentosPag.close;
                  fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.qryProcuraDocumentosPag.parambyname('numero').asString :=
                    fraSelecaoAleatoriadocumentospag.qrySelecaoAleatoria.FieldByName('numero').asString;
                  fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.qryProcuraDocumentosPag.open;
                  fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraSelecaoAleatoriadocumentospag.ConsultaSelecaoAleatoria.qryProcuraDocumentospag.IsEmpty then
                    AtribuirDadosdocumentospag(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriadocumentospag.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriadocumentospag.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;

end;

end.
