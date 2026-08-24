unit fmRelatorioComposicaoPN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frselecaoaleatoria, StdCtrls, dmRelatorioComposicaoPN, frconsultacodigo, frconsulta,
  ctconstantes, cpdbfindcontrols, biblio;

type
  TfrmRelatorioComposicaoPN = class(TFrmRelatorioPadrao)
    gbxPNs: TGroupBox;
    fraSelecaoAleatoriaPN: TfraSelecaoAleatoria;
  private
    { Private declarations }
    procedure AtribuirDadosPN;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure internoImpressao; Override;


  end;

var
  frmRelatorioComposicaoPN: TfrmRelatorioComposicaoPN;

implementation

{$R *.dfm}

{ TfrmRelatorioComposicaoPN }

procedure TfrmRelatorioComposicaoPN.AtribuirDadosPN;
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

constructor TfrmRelatorioComposicaoPN.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioComposicaoPN := TdtmRelatorioComposicaoPN.Create(Self);

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

end;

destructor TfrmRelatorioComposicaoPN.Destroy;
begin
  dtmRelatorioComposicaoPN := nil;
  inherited;
  frmRelatorioComposicaoPN := nil;
end;

procedure TfrmRelatorioComposicaoPN.internoImpressao;
begin
  inherited;
  with dtmRelatorioComposicaoPN do
  begin

   ParametroCabecalho:='';
   ListadePNsSelecionadasAleatoriamente := fraSelecaoAleatoriaPN.StringSelecionada;
   if AbrirConsultas then
     ImprimirRelatorio
   else
     MensagemAviso(format(ctNENHUMREGISTROSELECIONADO, ['registro']));
  end;

end;

end.
