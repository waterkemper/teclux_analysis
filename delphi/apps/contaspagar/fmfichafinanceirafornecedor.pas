unit fmfichafinanceirafornecedor;

interface

uses
  SysUtils, Windows, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  ComCtrls, Buttons, ExtCtrls, Mask, DateUtils, DBCtrls, Grids, DBGrids, 
  // Constantes
  biblio, ctconstantes,
  // Terceiros
  ZQuery,
  // Componentes
  cpdbfindcontrols, cpdbgrid, cpdbtext, cpdata, cpeditioncontrolvalidation,
  // Repositorio
  fmajudabt, fmconsultabasica, fmconsultaporcampo,
  // Projeto
  dmfichafinanceirafornecedor, cppagecontrol, ActnList, clparametrossistema,
  cpnumero, ToolWin, cpdbmemo;


type
  TfrmFichaFinanceiraFornecedor = class(TfrmAjudaBt)
    sbnGerar: TSpeedButton;
    pnlFundoJanela: TPanel;
    pgcDuplicatasProdutos: TtecPageControl;
    tstDuplicatas: TTabSheet;
    tstProdutos: TTabSheet;
    dbgDuplicatas: TtecDBGrid;
    dbgProdutos: TtecDBGrid;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    tstGeral: TTabSheet;
    pgcFilialGrupoFilial: TtecPageControl;
    tstFilial: TTabSheet;
    tstGrupoFilial: TTabSheet;
    sbnProcuraGrupoFilial: TSpeedButton;
    dtxGrupoFilial: TtecDBText;
    edfGrupoFilial: TtecDbEditFind;
    edfFilial: TtecDbEditFind;
    sbnProcuraFilial: TSpeedButton;
    dtxDescricaoFilial: TtecDBText;
    pgcFornecedorGrupoFornecedor: TtecPageControl;
    tstFornecedor: TTabSheet;
    tstGrupoFornecedor: TTabSheet;
    sbnProcuraGrupoFornecedor: TSpeedButton;
    dtxGrupoFornecedor: TtecDBText;
    edfGrupoFornecedor: TtecDbEditFind;
    edfFornecedor: TtecDbEditFind;
    sbnProcuraFornecedor: TSpeedButton;
    dtxDescricaoFornecedor: TtecDBText;
    gbxCFOP: TGroupBox;
    edfCFOP: TtecDbEditFind;
    sbnCFOP: TSpeedButton;
    dtxDescricaoCFOP: TtecDBText;
    ecvFichaFornecedor: TtecEditionControlValidation;
    dbgNotas: TtecDBGrid;
    dtxFilial: TtecDBText;
    dtxFornecedor: TtecDBText;
    dtxCFOP: TtecDBText;
    dtxValor: TtecDBText;
    dtxDescricaoFilial2: TtecDBText;
    dtxNomeFornecedor: TtecDBText;
    dtxDescricaoCFOP2: TtecDBText;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    gbxFilial: TGroupBox;
    gbxFornecedor: TGroupBox;
    gbxEmissao2: TGroupBox;
    dtxEmissao: TtecDBText;
    gbxCFOP2: TGroupBox;
    gbxValorBruto: TGroupBox;
    gbxImpostosRetidos: TGroupBox;
    lblIR: TLabel;
    lblINSS: TLabel;
    lblISS: TLabel;
    lblCofins: TLabel;
    lblPis: TLabel;
    lblCSLL: TLabel;
    GroupBox1: TGroupBox;
    dtxValorLiquido: TtecDBText;
    dtxIRRFRetido: TtecDBText;
    dtxINSSRetido: TtecDBText;
    dtxISSRetido: TtecDBText;
    dtxPISRetido: TtecDBText;
    dtxCOFINSRetido: TtecDBText;
    dtxCSLLRetido: TtecDBText;
    dtxPisConfinsCsll: TtecDBText;
    lblPIS_CSLL: TLabel;
    lbl_COFINS: TLabel;
    lblA: TLabel;
    gbxDoctosFiscais: TGroupBox;
    gbxEvento: TGroupBox;
    dtxDescricaoEvento: TtecDBText;
    dtxEvento: TtecDBText;
    gbxReferencia: TGroupBox;
    mmoReferencia: TtecDBMemo;
    gbxAlertaFicha: TGroupBox;
    mmoFichaAlerta: TtecDBMemo;
    procedure sbnProcuraFilialClick(Sender: TObject);
    procedure sbnProcuraFornecedorClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
    procedure dbgDuplicatasTitleClick(Column: TColumn);
    procedure sbnCFOPClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure edfFilialChange(Sender: TObject);
    procedure edfFornecedorChange(Sender: TObject);
    procedure edfCFOPChange(Sender: TObject);
    procedure edtDataInicialChange(Sender: TObject);
    procedure edtDataFinalChange(Sender: TObject);
    procedure sbnProcuraGrupoFilialClick(Sender: TObject);
    procedure sbnProcuraGrupoFornecedorClick(Sender: TObject);
    procedure pgcFilialGrupoFilialChange(Sender: TObject);
    procedure pgcFornecedorGrupoFornecedorChange(Sender: TObject);
    procedure edfFilialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfGrupoFilialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edfFornecedorEnter(Sender: TObject);
    procedure edfFornecedorExit(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);

  protected
    dtmFichaFinanceiraFornecedor: TdtmFichaFinanceiraFornecedor;
    FShift: TShiftState;
    procedure AlternarColunaDuplicatas(Column: TColumn; Incrementa: Boolean);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  VerificaCamposConsulta: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmFichaFinanceiraFornecedor: TfrmFichaFinanceiraFornecedor;
  TipoPesquisa: TtecFichaFornecedor;
  ControleAtivo: TWinControl;
  IndRef: Byte;
  IndChe: Byte;

implementation

uses fmnavcontroles;

{$R *.dfm}

{ TfrmFichaFinanceiraFornecedor }

procedure TfrmFichaFinanceiraFornecedor.actHabilitarUpdate(Sender: TObject);
begin
   inherited;
   case dtmFichaFinanceiraFornecedor.TipoPessoa[1] of
      'F': tstFornecedor.Caption:= 'Forn&ecedor';
      'C': tstFornecedor.Caption:= 'Cliente forn&ecedor';
      'L': tstFornecedor.Caption:= 'Filial forn&ecedor';
   end;
end;

constructor TfrmFichaFinanceiraFornecedor.Create(AOwner: TComponent);
begin
  dtmFichaFinanceiraFornecedor:= TdtmFichaFinanceiraFornecedor.Create(Self);
  inherited;
  edtDataInicial.Text:= DateToStr(Date - 365);
  edtDataFinal.  Text:= DateToStr(Date);
  IndRef:= 1;
  IndChe:= 1;
  dbgProdutos.Columns[3].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.Columns[4].Visible := ParSistema.UsarGradesProdutos;
  dtmFichaFinanceiraFornecedor.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  dbgProdutos.Columns[5].Width := length(ParSistema.MascaraQuantidade)*7;
  pgcDuplicatasProdutos.ActivePageIndex := 0;
  pgcFornecedorGrupoFornecedor.ActivePageIndex:= 0;
end;

procedure TfrmFichaFinanceiraFornecedor.dbgDuplicatasTitleClick(Column: TColumn);
begin
  inherited;
  if Alton then
    if (Column.fieldname = 'chequepagto') or
       (Column.fieldname = 'bancopagto') or
       (Column.fieldname = 'agenciapagto') then
      AlternarColunaDuplicatas(dbgDuplicatas.Columns.Items[08], True);
end;

destructor TfrmFichaFinanceiraFornecedor.Destroy;
begin
  dtmFichaFinanceiraFornecedor:=nil;
  inherited;
  frmFichaFinanceiraFornecedor:= nil;
end;

procedure TfrmFichaFinanceiraFornecedor.edfCFOPChange(Sender: TObject);
begin
  inherited;
  dtmFichaFinanceiraFornecedor.LimparTabelas;
end;

procedure TfrmFichaFinanceiraFornecedor.edfFilialChange(Sender: TObject);
begin
  inherited;
  dtmFichaFinanceiraFornecedor.LimparTabelas;
end;

procedure TfrmFichaFinanceiraFornecedor.edfFornecedorChange(Sender: TObject);
begin
  inherited;
  dtmFichaFinanceiraFornecedor.LimparTabelas;
end;

procedure TfrmFichaFinanceiraFornecedor.edtDataFinalChange(Sender: TObject);
begin
  inherited;
  dtmFichaFinanceiraFornecedor.LimparTabelas;
end;

procedure TfrmFichaFinanceiraFornecedor.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if (edtDataInicial.Text <> '') and (edtDataInicial.Criticar(False)) then
    edtDataFinal.Minimo:= DaysBetween(Date,StrToDate(edtDataInicial.Text));
end;

procedure TfrmFichaFinanceiraFornecedor.edtDataInicialChange(Sender: TObject);
begin
  inherited;
  dtmFichaFinanceiraFornecedor.LimparTabelas;
end;


function TfrmFichaFinanceiraFornecedor.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmFichaFinanceiraFornecedor do
    case TipoPesquisa of
           tfcFILIAIS: Result:= ExisteFiliais(NomeCampo, Value);
      tfcGRUPOFILIAIS: Result:= ExisteGrupoFiliais(NomeCampo, Value);
      tfcFORNECEDORES: Result:= ExisteFornecedores(NomeCampo, Value);
 tfcGRUPOFORNECEDORES: Result:= ExisteGrupoFornecedores(NomeCampo, Value);
      tfcCODIGOFISCAL: Result:= ExisteCodigosFiscais(NomeCampo, Value);
      else             Result:= False
    end;
end;

function TfrmFichaFinanceiraFornecedor.InternoPesquisar(Titulo: String): Integer;
begin
  Result := mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfFilial then begin
        TipoPesquisa := tfcFILIAIS;
        Titulo       := 'Filiais';
      end
      else if ActiveControl = edfGrupoFilial then begin
        TipoPesquisa := tfcGRUPOFILIAIS;
        Titulo       := 'Grupo Filiais';
      end
      else if ActiveControl = edfFornecedor then begin
        TipoPesquisa := tfcFORNECEDORES;
        Titulo       := 'Fornecedores';
      end
      else if ActiveControl = edfGrupoFornecedor then begin
        TipoPesquisa := tfcGRUPOFORNECEDORES;
        Titulo       := 'Grupo Fornecedores';
      end
      else if ActiveControl = edfCFOP then begin
        TipoPesquisa := tfcCODIGOFISCAL;
        Titulo       := 'Códigos Fiscais de Operação';
      end;

      with dtmFichaFinanceiraFornecedor do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result:= inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end;
    end;
  end;
end;

function TfrmFichaFinanceiraFornecedor.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result:= TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = tfcFORNECEDORES then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmFichaFinanceiraFornecedor.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_Escape : if edtDataInicial.Criticar(false) and edtDataFinal.Criticar(false) then
                    edtDataInicial.SetFocus;
//                  if pgcFilialGrupoFilial.ActivePage = tstFilial then
//                       edfFilial.SetFocus
//                   else edfGrupoFilial.SetFocus;
     VK_Right : if (Shift = [ssCtrl]) then begin
                   if dbgDuplicatas.Focused then
                     AlternarColunaDuplicatas(dbgDuplicatas.Columns.Items[08], True);
                 end;
      VK_Left : if (Shift = [ssCtrl]) then begin
                   if dbgDuplicatas.Focused then
                     AlternarColunaDuplicatas(dbgDuplicatas.Columns.Items[08], False);
                 end;
        VK_F6 : sbnGerar.Click;
  end;
end;

procedure TfrmFichaFinanceiraFornecedor.pgcFilialGrupoFilialChange(Sender: TObject);
begin
  inherited;
  if pgcFilialGrupoFilial.ActivePage = tstFilial then begin
    edfGrupoFilial.Clear;
    dtxGrupoFilial.DataSource.DataSet.FieldByName('descricao').Clear;
  end
  else begin
    edfFilial.Clear;
    dtxDescricaoFilial.DataSource.DataSet.FieldByName('nome').Clear;
  end;
end;

procedure TfrmFichaFinanceiraFornecedor.pgcFornecedorGrupoFornecedorChange(Sender: TObject);
begin
  inherited;
  if pgcFornecedorGrupoFornecedor.ActivePage = tstFornecedor then begin
    edfGrupoFornecedor.Clear;
    dtxGrupoFornecedor.DataSource.DataSet.FieldByName('nome').clear;
  end
  else begin
    edfFornecedor.Clear;
    dtxDescricaoFornecedor.DataSource.DataSet.FieldByName('nome').Clear;
  end;
end;

procedure TfrmFichaFinanceiraFornecedor.sbnCFOPClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfCFOP.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmFichaFinanceiraFornecedor.sbnProcuraFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmFichaFinanceiraFornecedor.sbnProcuraFornecedorClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfFornecedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmFichaFinanceiraFornecedor.sbnGerarClick(Sender: TObject);
begin
  if VerificaCamposConsulta then begin
    with dtmFichaFinanceiraFornecedor do begin
      DataInicial    := edtDataInicial.Text;
      DataFinal      := edtDataFinal.Text;
      Filial         := edfFilial.Text;
      GrupoFilial    := edfGrupoFilial.Text;
      Fornecedor     := edfFornecedor.Text;
      GrupoFornecedor:= edfGrupoFornecedor.Text;
      CFOP           := edfCFOP.Text;
      if ReFazConsultaFichaFornecedor then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edtDataInicial.SetFocus;
      end
      else
        dbgNotas.SetFocus;
    end;
  end;
end;

procedure TfrmFichaFinanceiraFornecedor.sbnProcuraGrupoFilialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmFichaFinanceiraFornecedor.sbnProcuraGrupoFornecedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfGrupoFornecedor.SetFocus;
  InternoPesquisar('');
end;

function TfrmFichaFinanceiraFornecedor.TabelaDePesquisa: TZDataSet;
begin
  with dtmFichaFinanceiraFornecedor do
    case TipoPesquisa of
             tfcFILIAIS: Result:= ConsultarFiliais;
        tfcGRUPOFILIAIS: Result:= ConsultarGrupoFiliais;
        tfcFORNECEDORES: Result:= ConsultarFornecedores;
   tfcGRUPOFORNECEDORES: Result:= ConsultarGrupoFornecedores;
        tfcCODIGOFISCAL: Result:= ConsultarCFOP;
    else                 Result:= nil;
    end;
end;

function TfrmFichaFinanceiraFornecedor.VerificaCamposConsulta: Boolean;
begin
  Result:= False;
  if ecvFichaFornecedor.Verify(pnlFundoJanela,ControleAtivo) then begin
     if (edfFornecedor.Text <> '') or (edfGrupoFornecedor.Text <> '') then begin
       Result:= OperadorTernario((Trim(edfFornecedor.Text) <> ''),edfFornecedor.Exist, False);
       if not Result then
         Result := OperadorTernario((Trim(edfGrupoFornecedor.Text) <> ''),edfGrupoFornecedor.Exist, False);
     end
     else begin
       Result:= False;
       MensagemAviso('Os Controles de edição necessitam'+#10#13+
                     'ser preenchidos com uma informação válida.');
       if pgcFilialGrupoFilial.ActivePage = tstFilial then
            edfFilial.SetFocus
       else edfGrupoFilial.SetFocus;
     end;
     if Result then
       Result := OperadorTernario((Trim(edfFilial.Text) <> ''),edfFilial.Exist, True);
     if Result then
       Result := OperadorTernario((Trim(edfGrupoFilial.Text) <> ''),edfGrupoFilial.Exist, True);
     if Result then
       Result := OperadorTernario((Trim(edfCFOP.Text) <> ''),edfCFOP.Exist, True);
  end;
end;

procedure TfrmFichaFinanceiraFornecedor.AlternarColunaDuplicatas(Column: TColumn; Incrementa: Boolean);
begin
  case Column.Index of
    8: begin
         if Incrementa then Inc(IndChe)
         else               Dec(IndChe);
         if IndChe < 1 then IndChe:= 3;
         if IndChe > 3 then IndChe:= 1;
         case IndChe of
           1: begin
                dbgDuplicatas.Columns[08].Title.Caption := 'Nº CHEQUE...';
                dbgDuplicatas.Columns[08].FieldName     := 'chequepagto';
              end;
           2: begin
                dbgDuplicatas.Columns[08].Title.Caption := 'BANCO...';
                dbgDuplicatas.Columns[08].FieldName     := 'bancopagto';
              end;
           3: begin
                dbgDuplicatas.Columns[08].Title.Caption := 'AGÊNCIA...';
                dbgDuplicatas.Columns[08].FieldName     := 'agenciapagto';
              end;
         end;
       end;
  end;
end;

procedure TfrmFichaFinanceiraFornecedor.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutos.Columns[3].Title.Caption := dtmFichaFinanceiraFornecedor.LinhadaGrade;
  dbgProdutos.Columns[4].Title.Caption := dtmFichaFinanceiraFornecedor.colunadaGrade;
end;


procedure TfrmFichaFinanceiraFornecedor.edfFilialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    sbnGerar.Click;
end;

procedure TfrmFichaFinanceiraFornecedor.edfGrupoFilialKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterOuReturn(Key) then
    sbnGerar.Click;
end;

procedure TfrmFichaFinanceiraFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmFichaFinanceiraFornecedor.edfFornecedorEnter(
  Sender: TObject);
begin
  inherited;
  CodClienteAnt := dtmFichaFinanceiraFornecedor.qryFornecedorcodigo.AsInteger;
  TipoClienteAnt := dtmFichaFinanceiraFornecedor.qryFornecedortipo.AsString;

end;

procedure TfrmFichaFinanceiraFornecedor.edfFornecedorExit(Sender: TObject);
begin
  inherited;

  if ((CodClienteAnt <> dtmFichaFinanceiraFornecedor.qryFornecedorcodigo.AsInteger) or
      (TipoClienteAnt <> dtmFichaFinanceiraFornecedor.qryFornecedortipo.AsString)) or

      ((CodClienteAnt=0) and (TipoclienteAnt='') and
       (dtmFichaFinanceiraFornecedor.qryFornecedorcodigo.AsInteger<>0) and
       (dtmFichaFinanceiraFornecedor.qryFornecedortipo.AsString<>'')) then
  begin
    dtmFichaFinanceiraFornecedor.ExibirFicha(ClassName);
    edfFornecedor.setfocus;
    edfFornecedor.selectall;
  end;


end;

end.
