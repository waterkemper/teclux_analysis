unit fmrelatorioentrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frintervalodatas, frselecaoaleatoria, StdCtrls, dmrelatorioentrega,
  frconsultacodigo, ctconstantes, cpdbfindcontrols, db,
  cpeditioncontrolvalidation, dateUtils, frselecaoaleatoriaclientes;

type
  Tfrmrelatorioentrega = class(TfrmRelatorioPadrao)
    fraIntervaloDatasVenda: TfraIntervaloDatas;
    gbxMaquinas: TGroupBox;
    fraSelecaoAleatoriaRegioes: TfraSelecaoAleatoria;
    gbxAgrupamento: TGroupBox;
    ckbAgruparRegioes: TCheckBox;
    ckbAgruparClientes: TCheckBox;
    rgpSituacao: TRadioGroup;
    fraIntervaloDatasEntrega: TfraIntervaloDatas;
    ecvValida: TtecEditionControlValidation;
    gbxListaFornecedores: TGroupBox;
    fraSelecaoAleatoriaFornecedores1: TfraSelecaoAleatoriaClientes;
    gbxListadeClientes: TGroupBox;
    fraSelecaoAleatoriaClientes1: TfraSelecaoAleatoriaClientes;
    procedure fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaRegioesqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaRegioessbnProcuraClick(Sender: TObject);
  private
    { Private declarations }

    procedure AcionarPesquisaGradeRegioes;
    procedure AtribuirDadosRegioes(Found: Boolean);
    procedure InternoImpressao; override;




  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;

  end;

var
  frmrelatorioentrega: Tfrmrelatorioentrega;
  ControleValido       : TWinControl;

implementation

uses frconsulta;

{$R *.dfm}

{ Tfrmrelatorioentrega }

procedure Tfrmrelatorioentrega.AcionarPesquisaGradeRegioes;
begin
  with fraSelecaoAleatoriaRegioes do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Regiões');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;

end;

procedure Tfrmrelatorioentrega.AtribuirDadosRegioes(Found: Boolean);
begin
  with fraSelecaoAleatoriaRegioes do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraRegioescodigo.AsString;

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraRegioesnome.AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

constructor Tfrmrelatorioentrega.Create(Aowner: Tcomponent);
begin
  dtmrelatorioentrega := Tdtmrelatorioentrega.Create(Self);
  inherited;

  fraSelecaoAleatoriaRegioes.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaRegioes.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaRegioes do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaRegioes';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraRegioes;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesRegioes;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosRegioes;
  end;

  fraIntervaloDatasEntrega.edtDataInicial.Text := DateToStr(Date);
  fraIntervaloDatasEntrega.edtDataFinal.Text := DateToStr(incWeek(Date));


  fraSelecaoAleatoriaFornecedores1.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoPesquisa := pesFORNECEDORESTRANSPORTE;
  fraSelecaoAleatoriaFornecedores1.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.TipoCliente := 'F';
  fraSelecaoAleatoriaFornecedores1.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.Tipovfornecedor := 'F';
  fraSelecaoAleatoriaFornecedores1.fraSelecaoAleatoriaCliente.ConsultaSelecaoAleatoria.ConsultarTodos := true;


end;

destructor Tfrmrelatorioentrega.Destroy;
begin
  dtmrelatorioentrega := nil;
  inherited;
  frmrelatorioentrega := nil;
end;

procedure Tfrmrelatorioentrega.fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeRegioes;
end;

procedure Tfrmrelatorioentrega.fraSelecaoAleatoriaRegioesdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.CtrlOn then
                       AcionarPesquisaGradeRegioes
                   end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaRegioes.dbgSelecaoAleatoria.SelectedIndex = 0  then
                begin
                  fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                  if not fraSelecaoAleatoriaRegioes.ConsultaSelecaoAleatoria.qryProcuraRegioes.IsEmpty then
                    AtribuirDadosRegioes(true)
                  else
                  begin
                    key := 0;
                    fraSelecaoAleatoriaRegioes.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraSelecaoAleatoriaRegioes.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  inherited;

end;

procedure Tfrmrelatorioentrega.fraSelecaoAleatoriaRegioesqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);

var nc: integer;

begin
  inherited;
  with fraSelecaoAleatoriaRegioes do begin
     for nc:= 0 to qrySelecaoAleatoria.FieldCount - 1 do
         qrySelecaoAleatoria.Fields[nc].Visible := false;

     qrySelecaoAleatoria.FieldByName('codigo').visible := true;
     qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
     qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

     qrySelecaoAleatoria.FieldByName('nome').visible := true;
     qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'NOME';
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

procedure Tfrmrelatorioentrega.InternoImpressao;
var
  vContinuar : Boolean;
begin
  inherited;

  vContinuar := true;

  ecvValida.EditionControl.Clear;


  if (fraIntervaloDatasEntrega.edtDataInicial.Text = '') and
     (fraIntervaloDatasEntrega.edtDataFinal.Text = '') then
  begin
    TtecEditionControlItem(ecvValida.EditionControl.Add).Control:= fraIntervaloDatasEntrega.edtDataInicial;
    ecvValida.Verify(fraIntervaloDatasEntrega.gbxPeriodo, ControleValido);
    vContinuar := false;
  end;

  if vcontinuar then
    dtmrelatorioentrega.ImprimirRelatorio(fraIntervaloDatasVenda.edtdatainicial.Text, fraIntervaloDatasVenda.edtdatafinal.Text,
                                          fraIntervaloDatasEntrega.edtdatainicial.Text, fraIntervaloDatasEntrega.edtdatafinal.Text,

                                            fraSelecaoAleatoriaClientes1.ListaCondicionalComTipo,
                                            fraSelecaoAleatoriaFornecedores1.ListaCondicional,
                                            fraSelecaoAleatoriaRegioes.StringSelecionada,
                                            rgpSituacao.ItemIndex);
end;

procedure Tfrmrelatorioentrega.fraSelecaoAleatoriaRegioessbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeRegioes;
end;

end.
