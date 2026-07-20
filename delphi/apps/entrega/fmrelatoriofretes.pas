unit fmrelatoriofretes;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmrelatoriopadrao, frconsulta, frconsultacodigo, cpdata,
  ExtCtrls, Buttons, ctconstantes, frlistagrupofornecedores, DB, ZQuery,
  ZPgSqlQuery, cpquery, cpeditioncontrolvalidation, cpdatasource, FR_DSet,
  FR_DBSet, FR_Class, biblio, Grids, DBGrids, cpdbgrid, fmpreviewpadrao,
  dmbasico, dmtecsoft, ToolWin, ComCtrls;

type
  TfrmRelatorioFretes = class(TfrmRelatorioPadrao)
    gbxPeriodoAbertura: TGroupBox;
    edtEmissaoInicial: TEditData;
    lblA: TLabel;
    edtEmissaoFinal: TEditData;
    gbxFornecedor: TGroupBox;
    fraConsultaFornecedor: TfraConsultaCodigo;
    gbxCliente: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    fraListaGrupoFornecedores: TfraListaGrupoFornecedores;
    qryrlfrete: TtecQuery;
    qryrlfretefornecedor: TIntegerField;
    qryrlfretenomefornecedor: TStringField;
    qryrlfretevalor: TFloatField;
    qryrlfretecliente: TIntegerField;
    qryrlfretenomecliente: TStringField;
    qryrlfretevalortotal: TFloatField;
    qryrlfretetotalvaloricmssubstituicao: TFloatField;
    qryrlfretefilialnotafiscal: TIntegerField;
    qryrlfretenotafiscal: TIntegerField;
    qryrlfreteserie: TStringField;
    qryrlfretefilialcupomfiscal: TIntegerField;
    qryrlfretemaquina: TIntegerField;
    qryrlfreteintervensao: TIntegerField;
    qryrlfretecupomfiscal: TIntegerField;
    ecvValida: TtecEditionControlValidation;
    frpRLFrete: TfrReport;
    fdsRLFrete: TfrDBDataSet;
    dsrRLFrete: TtecDataSource;
    qryrlfretedata: TDateField;
    qryrlfretegrupofornecedor: TIntegerField;
    qryrlfretenomegrupofornecedor: TStringField;
    qryrlfretenlinhas: TIntegerField;
    gbxAgrupamento: TGroupBox;
    ckbCliente: TCheckBox;
    ckbGrupoFornecedor: TCheckBox;
    ckbFornecedor: TCheckBox;
    procedure frpRLFreteBeforePrint(Memo: TStringList;
      View: TfrView);
    procedure qryrlfreteAfterOpen(DataSet: TDataSet);
    procedure CalcularNLInhas;
    procedure ckbClienteClick(Sender: TObject);
    procedure ckbGrupoFornecedorClick(Sender: TObject);
    procedure ckbFornecedorClick(Sender: TObject);
  private
    { Private declarations }
    function  ValidarCamposSelecao: Boolean;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure InternoImpressao; override;

  end;

var
  frmRelatorioFretes: TfrmRelatorioFretes;
  ControleValido       : TWinControl;

implementation

{$R *.dfm}

{ TfrmRelatorioFretes }

constructor TfrmRelatorioFretes.Create(Aowner: Tcomponent);
begin
  inherited;
  fraConsultaFornecedor.TipoCliente := 'F';
  fraConsultaFornecedor.TipoPesquisa := pesFORNECEDORES;
  fraConsultaCliente.TipoCliente := 'C';
  fraConsultaCliente.TipoPesquisa := pesCLIENTES;
  edtEmissaoInicial.SetFocus;
  edtEmissaoInicial.SelectAll;
end;

destructor TfrmRelatorioFretes.Destroy;
begin
  inherited;
  frmRelatorioFretes:= nil;
end;

procedure TfrmRelatorioFretes.InternoImpressao;
var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  ParametroCabecalho : String;
begin
  inherited;
  if ValidarCamposSelecao then
  begin
    qryrlfrete.ParamByName('datainicial').AsDateTime := strtodate(edtEmissaoInicial.Text);
    qryrlfrete.ParamByName('datafinal').AsDateTime := strtodate(edtEmissaoFinal.Text);

    ParametroCabecalho:='ENTRE ' + edtEmissaoInicial.Text +
                        ' E '    + edtEmissaoFinal.Text;

    if fraConsultaFornecedor.edfCodigo.Text<>'' then
    begin
      qryrlfrete.MacroByName('WhereFornecedor').AsString := 'and r.fornecedor = '+
              fraConsultaFornecedor.edfCodigo.Text;
      ParametroCabecalho := ParametroCabecalho + 'Fornecedor: '+fraConsultaFornecedor.edfCodigo.Text
    end
    else
      qryrlfrete.MacroByName('WhereFornecedor').AsString := '';

    if fraConsultaCliente.edfCodigo.Text<>'' then
    begin
      qryrlfrete.MacroByName('WhereCliente').AsString := 'and df.cliente = '+
              fraConsultaCliente.edfCodigo.Text;
      ParametroCabecalho := ParametroCabecalho + 'Cliente: '+fraConsultaCliente.edfCodigo.Text
    end
    else
      qryrlfrete.MacroByName('WhereCliente').AsString := '';

    if fraListaGrupoFornecedores.ListaSelecionada<>'' then
    begin
      qryrlfrete.MacroByName('WhereListaFornecedores').AsString :=
        'and f.grupofornecedor in ('+fraListaGrupoFornecedores.ListaSelecionada+')';
      ParametroCabecalho := ParametroCabecalho + 'Grupo de Fornecedores: '+fraListaGrupoFornecedores.ListaSelecionada;
    end
    else
      qryrlfrete.MacroByName('WhereListaFornecedores').AsString := '';
  end;

  frVariables['AgruparCliente']:= false;
  frVariables['AgruparGrupoFornecedor']:= false;
  frVariables['AgruparFornecedor']:= false;

  if ckbCliente.Checked then
  begin
    qryrlfrete.MacroByName('WhereOrdenacao').AsString :=
    'order by vf.nome, df.cliente, df.data, cf.numero, n.numero';
    frVariables['Titulo']:= 'FRETES POR CLIENTE';
    frVariables['AgruparCliente']:= True;
  end;

  if ckbGrupoFornecedor.Checked then
  begin
    qryrlfrete.MacroByName('WhereOrdenacao').AsString :=
      'order by gf.nome, f.grupofornecedor, f.nome, f.codigo, vf.nome, df.cliente, df.data, cf.numero, n.numero';
    frVariables['Titulo']:= 'FRETES POR GRUPO DE FORNECEDOR';
    frVariables['AgruparGrupoFornecedor']:= True;
  end;

  if ckbFornecedor.Checked then
  begin
    qryrlfrete.MacroByName('WhereOrdenacao').AsString :=
    'order by f.nome, f.codigo, df.data, cf.numero, n.numero';
    frVariables['Titulo']:= 'FRETES POR FORNECEDOR';
    frVariables['AgruparFornecedor']:= true;
  end;


  qryrlfrete.Close;
  qryrlfrete.open;

  if qryrlfrete.IsEmpty then
    MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']))
  else
  begin
    frVariables['outras']:= ParametroCabecalho;


    frmPreview := TfrmPreviewPadrao.create(self);
    frmPreview.cmbZoom.ItemIndex := 3; //125%
    try
     Relatorio := frmPreview.frCompositeReport;
     frmPreview.frCompositeReport.Reports.Clear;
//     frpRLFrete.DesignReport;
     frmPreview.frCompositeReport.Reports.Add(frpRLFrete);
     Relatorio.Preview := frmPreview.frPreviewPadrao;
     Relatorio.ShowReport;
     frmPreview.ShowModal;
    finally
     frmPreview.Free
    end;
  end;
end;

function TfrmRelatorioFretes.ValidarCamposSelecao: Boolean;
begin
   Result:= ecvValida.Verify(gbxPeriodoAbertura, ControleValido);
   if Result then
      if strtodate(edtEmissaoInicial.Text)>strtodate(edtEmissaoFinal.Text) then
      begin
         MensagemAviso(ctDTINICIALMAIORDTFINAL);
         edtEmissaoInicial.SetFocus;
         Result:=false;
      end;

end;

procedure TfrmRelatorioFretes.frpRLFreteBeforePrint(
  Memo: TStringList; View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpRLFrete, view);
end;

procedure TfrmRelatorioFretes.qryrlfreteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CalcularNLinhas;
end;

procedure TfrmRelatorioFretes.CalcularNLInhas;
var
 nlinha, codigo: integer;
 posicaocodigo : TBookMark;

 function codigoSelecao: integer;
 begin
   if ckbCliente.Checked then
    result := qryrlfretecliente.AsInteger
   else
   if ckbFornecedor.Checked then
     result := qryrlfretefornecedor.AsInteger
   else
   if ckbGrupoFornecedor.Checked then
    result := qryrlfretegrupofornecedor.AsInteger;
 end;

 procedure guardarnlinhas;
 begin
   qryrlfrete.GotoBookmark(posicaocodigo);
   while (codigo = codigoSelecao) and
         not (qryrlfrete.Eof) do
   begin
     qryrlfrete.Edit;
     qryrlfretenlinhas.AsInteger := nlinha;
     qryrlfrete.Post;
     qryrlfrete.Next;
   end;
   nlinha := 0;
   qryrlfrete.FreeBookmark(posicaocodigo);
   codigo := codigoSelecao;
   posicaocodigo := qryrlfrete.GetBookmark;
 end;

begin
  nlinha:=0;
  qryrlfrete.First;
  codigo := codigoSelecao;
  posicaocodigo := qryrlfrete.GetBookmark;
  while not qryrlfrete.Eof do
  begin
    inc(nlinha);
    qryrlfrete.Next;
    if (codigo <> codigoselecao) then
      guardarnlinhas;
  end;
  guardarnlinhas;
end;

procedure TfrmRelatorioFretes.ckbClienteClick(Sender: TObject);
begin
  inherited;
  if ckbCliente.Checked then
  begin
    ckbFornecedor.Checked := false;
    ckbGrupoFornecedor.Checked := false;
  end;
end;

procedure TfrmRelatorioFretes.ckbGrupoFornecedorClick(Sender: TObject);
begin
  inherited;
  if ckbGrupoFornecedor.Checked then
    ckbCliente.Checked := false;
end;

procedure TfrmRelatorioFretes.ckbFornecedorClick(Sender: TObject);
begin
  inherited;
  if ckbFornecedor.Checked then
    ckbCliente.Checked := false;
end;

end.
