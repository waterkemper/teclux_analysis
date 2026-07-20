unit fmLancamentosDepreciacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, StdCtrls, Mask,
  cpdata, frconsultacontabil, frconsultacodigocontabil, dmLancamentosDepreciacao, dateutils,
  frselecaoaleatoria, db, ctconstantes, frconsulta, frconsultacodigo, cpdbfindcontrols, biblio, clparametrossistema,
  Spin, clusuario;

type
  TfrmLancamentosDepreciacao = class(TFrmAjudaBt)
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtMesInicial: TEditMes;
    edtMesFinal: TEditMes;
    gbxHistorico: TGroupBox;
    fraConsultaHistorico: TfraConsultaCodigoContabil;
    gbxBens: TGroupBox;
    fraSelecaoAleatoriaImobilizado: TfraSelecaoAleatoria;
    sbnGerar: TSpeedButton;
    gbxExercicio: TGroupBox;
    sbnExcluir: TSpeedButton;
    edtAnoExercicio: TSpinEdit;
    procedure fraSelecaoAleatoriaImobilizadoqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaImobilizadosbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaImobilizadodbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaImobilizadodbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnExcluirClick(Sender: TObject);
    procedure edtAnoExercicioChange(Sender: TObject);
  private
    { Private declarations }

    procedure AtribuirDadosImobilizado(Found: Boolean);
    procedure AcionarPesquisaImobilizado;
    function ValidaCampos: Boolean;


  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    destructor  Destroy; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;


  end;

var
  frmLancamentosDepreciacao: TfrmLancamentosDepreciacao;

implementation

{$R *.dfm}

{ TfrmLancamentosDepreciacao }

procedure TfrmLancamentosDepreciacao.AcionarPesquisaImobilizado;
begin
  with fraSelecaoAleatoriaImobilizado do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Imobilizado');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;

end;


procedure TfrmLancamentosDepreciacao.AtribuirDadosImobilizado(Found: Boolean);
begin
  with fraSelecaoAleatoriaImobilizado do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('numero').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraImobilizado.fieldbyname('numero').AsString;

    qrySelecaoAleatoria.FieldByName('produtovisual').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraImobilizado.fieldbyname('produtovisual').AsString;

    qrySelecaoAleatoria.FieldByName('descricaodobem').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraImobilizado.fieldbyname('descricaodobem').AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

constructor TfrmLancamentosDepreciacao.Create(AOwner: TComponent);
begin

  dtmLancamentosDepreciacao := TdtmLancamentosDepreciacao.Create(self);
  inherited;
  fraConsultaHistorico.TipoPesquisa := pesHISTORICOCONTABIL;

  fraSelecaoAleatoriaImobilizado.CampoParaLista := 'numero';
  fraSelecaoAleatoriaImobilizado.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaImobilizado do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaImobilizado';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 6;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraimobilizado;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'numero';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'numero';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
    ConsultaSelecaoAleatoria.naofechartabelapesquisa := true;

    ConsultaSelecaoAleatoria.TipoPesquisa := pesIMOBILIZADO;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosImobilizado;
  end;


  edtMesInicial.Text:= '01';
  edtMesFinal.Text  := '12';

  if parsistema.EXERCICIOCONTABILIDADE = YearOf(dtmLancamentosDepreciacao.DataServidor) then
    edtMesFinal.Text := FormatStringOut(inttostr(MonthOf(dtmLancamentosDepreciacao.DataServidor)), 'R', '0', 2, false );

  if UsuarioLogin.AlterarDadosContabeis then
  begin
    edtAnoExercicio.MaxValue := ParSistema.EXERCICIOCONTABILIDADE;
    edtAnoExercicio.MinValue := ParSistema.EXERCICIOCONTABILIDADE -1;
    gbxExercicio.Enabled := true;
  end
  else
  begin
    edtAnoExercicio.MaxValue := ParSistema.EXERCICIOCONTABILIDADE;
    edtAnoExercicio.MinValue := ParSistema.EXERCICIOCONTABILIDADE;
    gbxExercicio.Enabled := false;
  end;
  edtAnoExercicio.Value:= ParSistema.EXERCICIOCONTABILIDADE;

end;

destructor TfrmLancamentosDepreciacao.Destroy;
begin
  inherited;
  frmLancamentosDepreciacao := nil;
end;

procedure TfrmLancamentosDepreciacao.fraSelecaoAleatoriaImobilizadoqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaImobilizado do
  begin
    qrySelecaoAleatoria.FieldByName('numero').DisplayLabel := 'NÚMERO';
    qrySelecaoAleatoria.FieldByName('numero').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('produtovisual').DisplayLabel := 'PRODUTO VISUAL';
    qrySelecaoAleatoria.FieldByName('produtovisual').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('descricaodobem').DisplayLabel := 'DESCRIÇÃO DO BEM';
    qrySelecaoAleatoria.FieldByName('descricaodobem').ReadOnly := true;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;

    with dbgSelecaoAleatoria do

    for nc:= 0 to 2 do with Columns[nc].Title do
    begin
        Alignment:= taCenter;
        Font.Name:= 'helvetica';
        Font.Height:= -9;
    end;
  end;

end;

procedure TfrmLancamentosDepreciacao.fraSelecaoAleatoriaImobilizadosbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaImobilizado;
end;

procedure TfrmLancamentosDepreciacao.fraSelecaoAleatoriaImobilizadodbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaImobilizado;
end;

procedure TfrmLancamentosDepreciacao.fraSelecaoAleatoriaImobilizadodbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaImobilizado.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaImobilizado.ConsultaSelecaoAleatoria.CtrlOn then
                      AcionarPesquisaImobilizado
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaImobilizado.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaImobilizado.ConsultaSelecaoAleatoria.edfCodigo.text := fraSelecaoAleatoriaImobilizado.qrySelecaoAleatoria.FieldByName('codigo').asString;
                 fraSelecaoAleatoriaImobilizado.ConsultaSelecaoAleatoria.edfCodigo.Exist;
                 if not fraSelecaoAleatoriaImobilizado.ConsultaSelecaoAleatoria.qryProcuraImobilizado.IsEmpty then
                    AtribuirDadosImobilizado(true)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaImobilizado.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaImobilizado.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;

end;

procedure TfrmLancamentosDepreciacao.FormShow(Sender: TObject);
begin
  inherited;
  edtMesInicial.SetFocus;
  edtMesInicial.SelectAll;

end;

function TfrmLancamentosDepreciacao.ValidaCampos: Boolean;
begin
  result := edtMesInicial.DataValida and edtMesFinal.DataValida;
  if result then
  begin
    result := (not MesAnoEmBranco(edtMesInicial.text) and not MesAnoEmBranco(edtMesFinal.text));
    if result then
    begin
      Result:=StrToDate('01/'+edtMesInicial.Text) <= StrToDate('01/'+edtMesFinal.Text);
      if not result then
      begin
        MensagemAviso('O mês inicial deve ser menor ou igual ao final.');
        edtMesInicial.SetFocus;
      end
      else
      begin
        result := copy(edtMesInicial.Text,4,4) = copy(edtMesFinal.Text,4,4);
        if not result then
        begin
          MensagemAviso('Os meses devem ser do mesmo exercício');
          edtMesInicial.SetFocus;
        end;
      end;
    end
    else
    begin
      MensagemAviso(ctDATAINVALIDA);
      edtMesInicial.SetFocus;
    end;

  end;

end;

procedure TfrmLancamentosDepreciacao.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidaCampos then
    dtmLancamentosDepreciacao.GerarLancamentos(edtAnoExercicio.value, edtMesInicial.text, edtMesFinal.text, fraConsultaHistorico.edfcodigo.text,
                                               fraSelecaoAleatoriaImobilizado.StringSelecionada);


end;

procedure TfrmLancamentosDepreciacao.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
  VK_F5: if sbnGerar.Enabled then sbnGerarClick(nil);
  end;
end;

procedure TfrmLancamentosDepreciacao.sbnExcluirClick(Sender: TObject);
begin
  inherited;
  if ValidaCampos then
  dtmLancamentosDepreciacao.ExcluirLancamentosDepreciacao(true, edtAnoExercicio.Value,
  strtodate('01/'+preencheString(edtMesInicial.text,'0',2,false)+'/'+inttostr(edtAnoExercicio.value)),
  UltimoDiaMes(strtodate('01/'+preencheString(edtMesFinal.text,'0',2,false)+'/'+inttostr(edtAnoExercicio.value)))  );
end;

procedure TfrmLancamentosDepreciacao.edtAnoExercicioChange(
  Sender: TObject);
begin
  inherited;
    if edtAnoExercicio.Value = YearOf(dtmLancamentosDepreciacao.DataServidor) then
      edtMesFinal.Text := FormatStringOut(inttostr(MonthOf(dtmLancamentosDepreciacao.DataServidor)), 'R', '0', 2, false )
    else
      edtMesFinal.Text := '12';


end;

end.
