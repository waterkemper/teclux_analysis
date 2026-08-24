unit frselecaoaleatoriadocumentospag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frselecaoaleatoria, DB, frconsultacodigo, cpdbfindcontrols, ctconstantes, biblio;

type
  TfraSelecaoAleatoriadocumentospag = class(TFrame)
    fraSelecaoAleatoriaContrato: TfraSelecaoAleatoria;
    procedure fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriadocumentospagqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriadocumentospagsbnProcuraClick(Sender: TObject);
    procedure fraSelecaoAleatoriaContratodbgSelecaoAleatoriaKeyDown(
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
  with fraSelecaoAleatoriaContrato do
  begin
    qrySelecaoAleatoria.FieldByName('contrato').DisplayLabel := 'Contrato';
    qrySelecaoAleatoria.FieldByName('contrato').ReadOnly := False;

//    qrySelecaoAleatoria.FieldByName('tipo').visible := false;
{
    qrySelecaoAleatoria.FieldByName('tipo').DisplayLabel := 'T';
    qrySelecaoAleatoria.FieldByName('tipo').ReadOnly := true;
    }

    qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'Nome do Cliente';
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
  with fraSelecaoAleatoriaContrato do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'contrato';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriadocumentospagdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  if (fraSelecaoAleatoriaContrato.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaContrato.qrySelecaoAleatoria.FieldByName('contrato')) then
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

  fraSelecaoAleatoriaContrato.PossuiCampoFilial := false;
  fraSelecaoAleatoriaContrato.PossuiCamposerie := false;
  fraSelecaoAleatoriaContrato.PossuiCamponumeronota := false;
  fraSelecaoAleatoriaContrato.PossuiCampooperacao := false;
  fraSelecaoAleatoriaContrato.PossuiCampochv_nfe := false;
  fraSelecaoAleatoriaContrato.PossuiCampocodigonota := false;
  fraSelecaoAleatoriaContrato.PossuiCampoTipo := false;
  fraSelecaoAleatoriaContrato.PossuiCampoDescricao := false;


  fraSelecaoAleatoriaContrato.qrySelecaoAleatoria.Sql.Text :=
    'SELECT  cast(null as char(20)) as contrato, '+
    '            cast(null as varchar(60)) as nome, '+
    '            cast(null as varchar(11)) as campo, '+
    '            cast(null as varchar(20)) as opcomparacao, '+
    '            cast(null as varchar(2)) as oplogico ';


  fraSelecaoAleatoriaContrato.CampoParaLista := 'contrato';
//  fraSelecaoAleatoriaContrato.CampoParaLista2 := 'tipo';


  with fraSelecaoAleatoriaContrato do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoria';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'contrato';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraContrato;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesdocumentospag;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosdocumentospag;
    ConsultaSelecaoAleatoria.TipoCliente := 'C';
    ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;
  end;
  
  fraSelecaoAleatoriaContrato.UtilizarCamparacaoeLogica := true;

end;

function TfraSelecaoAleatoriadocumentospag.GetListaCondicional: String;
begin
  result := trocar(fraSelecaoAleatoriaContrato.ListaCondicional, 'contrato','ct.numero');
  result := trocar(result, 'nome','ct.nome');
end;

procedure TfraSelecaoAleatoriadocumentospag.AtribuirDadosdocumentospag(Found: Boolean);
begin
  with fraSelecaoAleatoriaContrato do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('contrato').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraContratonumero.AsString;
{
    qrySelecaoAleatoria.FieldByName('tipo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraContratotipo.AsString;}

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraContratonome.AsString;

    if qrySelecaoAleatoria.FieldByName('campo').asString = '' then
      qrySelecaoAleatoria.FieldByName('campo').asString := 'contrato';

    if qrySelecaoAleatoria.FieldByName('opcomparacao').asString = '' then
      qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';

    if qrySelecaoAleatoria.FieldByName('oplogico').asString = '' then
      qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';

    qrySelecaoAleatoria.Post;
  end;
end;

procedure TfraSelecaoAleatoriadocumentospag.AcionarPesquisaGrade;
begin
  with fraSelecaoAleatoriaContrato do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('documentospag');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure TfraSelecaoAleatoriadocumentospag.fraSelecaoAleatoriaContratodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     if (fraSelecaoAleatoriaContrato.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaContrato.qrySelecaoAleatoria.FieldByName('contrato')) then
                     begin
                       fraSelecaoAleatoriaContrato.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or fraSelecaoAleatoriaContrato.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if (fraSelecaoAleatoriaContrato.dbgSelecaoAleatoria.SelectedField = fraSelecaoAleatoriaContrato.qrySelecaoAleatoria.FieldByName('contrato')) then
                begin
                  fraSelecaoAleatoriaContrato.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriaContrato.qrySelecaoAleatoria.FieldByName('contrato').asString;
                  fraSelecaoAleatoriaContrato.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraSelecaoAleatoriaContrato.ConsultaSelecaoAleatoria.qryProcuraContrato.IsEmpty then
                    AtribuirDadosdocumentospag(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaContrato.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaContrato.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;

end;

end.
