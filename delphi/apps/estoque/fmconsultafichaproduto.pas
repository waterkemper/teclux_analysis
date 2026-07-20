unit fmconsultafichaproduto;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, Mask, DBCtrls, Windows, DB,
  // Repositorio
  fmajudabt, fmconsultaporcampo, fmconsultabasica,
  // Constantes
  ctconstantes, biblio, clparametrossistema,
  // Terceiros
  ZQuery,
  // Componenetes
  cpdbfindcontrols, cpdatasource, cpdbgrid, cpdbtext, cpdata,
  cpeditioncontrolvalidation, ComCtrls, fmcadastropadrao, ToolWin,
  frconsulta, frconsultacodigo, frConsultaProduto;

type
  TfrmConsultaFichaProduto = class(TfrmCadastroPadrao)
    gbxFichaProduto: TPanel;
    sbnPesquisarFilial: TSpeedButton;
    sbnPesquisarTipoMovimento: TSpeedButton;
    dtxFilial: TtecDBText;
    dtxTipoMovimento: TtecDBText;
    edfFilial: TtecDbEditFind;
    edfTipoMovimento: TtecDbEditFind;
    gbxPeriodo: TGroupBox;
    edtDataInicial: TEditData;
    edtDataFinal: TEditData;
    ecvValida: TtecEditionControlValidation;
    pnlFundoJanela: TPanel;
    pnlLegenda: TPanel;
    sbnGerar: TSpeedButton;
    dbgFichaProduto: TtecDBGrid;
    gbxFilial: TGroupBox;
    gbxMovimento: TGroupBox;
    lblAte: TLabel;
    ckbSomenteLancamentosAvulsos: TCheckBox;
    dbgFichaProdutoporContrato: TtecDBGrid;
    splitterProdutosporContratos: TSplitter;
    sbnVisualizarGradeProdutosContratos: TSpeedButton;
    fraConsultaProduto: TfraConsultaProduto;
    pgcMovimentos: TPageControl;
    tstMovimentos: TTabSheet;
    tstLotes: TTabSheet;
    dbgFichaProdutoLotes: TtecDBGrid;
    procedure dbgFichaProdutoTitleClick(Column: TColumn);
    procedure sbnPesquisarFilialClick(Sender: TObject);
    procedure sbnPesquisarTipoMovimentoClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure edtDataFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edfProdutoChange(Sender: TObject);
    procedure edfFilialChange(Sender: TObject);
    procedure edfTipoMovimentoChange(Sender: TObject);
    procedure edtDataInicialChange(Sender: TObject);
    procedure dbgFichaProdutoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbnVisualizarGradeProdutosContratosClick(Sender: TObject);
    procedure pgcMovimentosChange(Sender: TObject);
  protected
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function InternoPesquisar(Titulo: String): Integer; override;
    function  InternoGravar: Boolean; override;
    function ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;
  public
    function PesquisaHabilitada: Boolean;
    function TituloPesquisa: String;
    function VerificaCamposConsulta: Boolean;
    procedure LimpaControles;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure OperacaoPadrao(Value: Array of Variant); override;
  end;

var
  frmConsultaFichaProduto: TfrmConsultaFichaProduto;
  TipoPesquisa: TtecPesquisa;
  IndReferencia,
  IndValores,
  IndQuantidade: Byte;
  ControleValido: TWinControl;
  Aux_1, Aux_2, Aux_3: String;
  Operacao: Boolean;

implementation

uses dmconsultafichaproduto, DateUtils, dmbasico;

{$R *.dfm}

constructor TfrmConsultaFichaProduto.Create(AOwner: TComponent);
begin
  inherited;
  sbnSalvar.Enabled := false;

  dtmConsultaFichaProduto := TdtmConsultaFichaProduto.Create(Self);

  dataset := dtmConsultaFichaProduto.qryFichaProduto;
  sbnSalvar.Visible := dtmConsultaFichaProduto.GerenteEstoque;
  dbgFichaProduto.ReadOnly := not dtmConsultaFichaProduto.GerenteEstoque;

  IndQuantidade := 1;
  IndReferencia := 1;
  IndValores    := 1;
  dtmConsultaFichaProduto.ReferenciaQuantidade := 1;
  edtDataInicial.Text := '01' + Copy(DateToStr(Date), 3, 9);
  edtDataFinal.Text := DateToStr(Date);
  Operacao:= False;
  if dtmConsultaFichaProduto.GerenteEstoque then
  begin
    Aux_1 := 'Alt F5 - Custo'
  end
  else
  begin
    Aux_1 := '';
    dbgFichaProduto.ColumnByName('financeiro').Visible:= False;
    dbgFichaProduto.ColumnByName('customedio').Visible:= False;
    dbgFichaProduto.ColumnByName('precocomicms').Visible:= False;
    dbgFichaProduto.ColumnByName('precosemicms').Visible:= False;
    dbgFichaProduto.ColumnByName('moedaLookup').Visible:= False;
    dbgFichaProduto.ColumnByName('valormoeda').Visible:= False;

    dbgFichaProdutoLotes.ColumnByName('financeiro').Visible:= False;
    dbgFichaProdutoLotes.ColumnByName('customedio').Visible:= False;
    dbgFichaProdutoLotes.ColumnByName('precocomicms').Visible:= False;
    dbgFichaProdutoLotes.ColumnByName('precosemicms').Visible:= False;
    dbgFichaProdutoLotes.ColumnByName('moedaLookup').Visible:= False;
    dbgFichaProdutoLotes.ColumnByName('valormoeda').Visible:= False;


  end;
  Aux_2 := 'Alt F7 - Operações';
  Aux_3 := 'Alt F8 - Ocultar Quantidades';
  pnlLegenda.Caption := Aux_1 + '               ' +
                        Aux_2 + '               ' +
                        Aux_3 + '               ';

  if dbgFichaProduto.ColumnByName('quantidade').Width < ParSistema.TamanhoMascaraQuantidade then
    dbgFichaProduto.ColumnByName('quantidade').Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgFichaProduto.ColumnByName('emEstoque').Width < ParSistema.TamanhoMascaraQuantidade then
    dbgFichaProduto.ColumnByName('emEstoque').Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgFichaProdutoLotes.ColumnByName('quantidade').Width < ParSistema.TamanhoMascaraQuantidade then
    dbgFichaProdutoLotes.ColumnByName('quantidade').Width := ParSistema.TamanhoMascaraQuantidade;

  if dbgFichaProdutoLotes.ColumnByName('emEstoque').Width < ParSistema.TamanhoMascaraQuantidade then
    dbgFichaProdutoLotes.ColumnByName('emEstoque').Width := ParSistema.TamanhoMascaraQuantidade;

  if not dtmConsultaFichaProduto.GerenteEstoque then
  begin
    edfFilial.SetFocus;
    edfFilial.Text:= inttoStr(dtmConsultaFichaProduto.Filial);
    edfFilial.Enabled:= False;
    edfFilial.ReadOnly:= True;
    sbnPesquisarFilial.Enabled:= False;
  end;
  fraConsultaProduto.fraConsultaItemProduto.edfCodigo.SetFocus;

//  fraConsultaItemProduto.TipoPesquisa := pesITEMPRODUTOS;

//  dbgFichaProdutoporContrato.visible := false;
//  splitterProdutosporContratos.visible := false;

  SetarActivePage(self);


end;

destructor TfrmConsultaFichaProduto.Destroy;
begin
  dtmConsultaFichaProduto.Free;
  inherited;
  frmConsultaFichaProduto := nil;
end;

procedure TfrmConsultaFichaProduto.sbnPesquisarFilialClick(Sender: TObject);
begin
  CtrlOn := True;
  ActiveControl := edfFilial;
  InternoPesquisar('');
end;

procedure TfrmConsultaFichaProduto.sbnPesquisarTipoMovimentoClick(Sender: TObject);
begin
  CtrlOn := True;
  ActiveControl := edfTipoMovimento;
  InternoPesquisar('');
end;

procedure TfrmConsultaFichaProduto.dbgFichaProdutoTitleClick(Column: TColumn);
var
  I: Integer;
begin  
  if dtmConsultaFichaProduto.TabelaFichaProduto.Active then
  begin

    if AltOn or ShiftOn then
    begin
      case Column.Index of
        4: begin      //referencia
             Inc(IndReferencia);
             if IndReferencia > 3 then
               IndReferencia:= 1;
             if IndReferencia = 1 then begin
               Aux_2:= 'Alt F7 - Operações';
               dbgFichaProduto.ColumnByName('referencia').Visible := True;
               dbgFichaProdutoLotes.ColumnByName('referencia').Visible := True;


               for i := dbgFichaProduto.columnbyname('clientefornecedor').Index to
                        dbgFichaProduto.columnbyname('tven').Index do
                 dbgFichaProduto.Columns[I].Visible := False;

               for i := dbgFichaProdutoLotes.columnbyname('clientefornecedor').Index to
                        dbgFichaProdutoLotes.columnbyname('tven').Index do
                 dbgFichaProdutoLotes.Columns[I].Visible := False;


             end;
             if IndReferencia = 2 then begin
               Aux_2:= 'Alt F7 - Cliente/Fornecedor';
               dbgFichaProduto.ColumnByName('referencia').Visible := False;
               dbgFichaProduto.ColumnByName('clientefornecedor').Visible := False;

               dbgFichaProdutoLotes.ColumnByName('referencia').Visible := False;
               dbgFichaProdutoLotes.ColumnByName('clientefornecedor').Visible := False;

               for i := dbgFichaProduto.columnbyname('est').Index to
                        dbgFichaProduto.columnbyname('tven').Index do
                 dbgFichaProduto.Columns[I].Visible := True;

               for i := dbgFichaProdutoLotes.columnbyname('est').Index to
                        dbgFichaProdutoLotes.columnbyname('tven').Index do
                 dbgFichaProdutoLotes.Columns[I].Visible := True;

             end;
             if IndReferencia = 3 then
             begin
               Aux_2:= 'Alt F7 - Referência';
               dbgFichaProduto.ColumnByName('referencia').Visible := False;
               dbgFichaProduto.ColumnByName('clientefornecedor').Visible := True;

               for i := dbgFichaProduto.columnbyname('est').Index to
                        dbgFichaProduto.columnbyname('tven').Index do
                 dbgFichaProduto.Columns[I].Visible := False;

               dbgFichaProdutoLotes.ColumnByName('referencia').Visible := False;
               dbgFichaProdutoLotes.ColumnByName('clientefornecedor').Visible := True;

               for i := dbgFichaProdutoLotes.columnbyname('est').Index to
                        dbgFichaProdutoLotes.columnbyname('tven').Index do
                 dbgFichaProdutoLotes.Columns[I].Visible := False;

             end;
           end;

       22: begin
             if dtmConsultaFichaProduto.GerenteEstoque then
             begin
               Inc(IndValores);
               if (IndValores > 3)  then
                 IndValores := 1;

               case IndValores of
               1: begin
                    dbgFichaProduto.Columns[22].Title.Caption := 'FINANCEIRO';
                    dbgFichaProduto.Columns[22].FieldName := 'financeiro';

                    dbgFichaProdutoLotes.Columns[22].Title.Caption := 'FINANCEIRO';
                    dbgFichaProdutoLotes.Columns[22].FieldName := 'financeiro';

                    Aux_1 := 'Alt F5 - Custo'
                  end;

               2: begin
                    Aux_1 := 'Alt F5 - Aliquota IPI';
                    dbgFichaProduto.Columns[22].Title.Caption := 'CUSTO';
                    dbgFichaProduto.Columns[22].FieldName := 'valor';

                    dbgFichaProdutoLotes.Columns[22].Title.Caption := 'CUSTO';
                    dbgFichaProdutoLotes.Columns[22].FieldName := 'valor';

                  end;

               3: begin
                    Aux_1 := 'Alt F5 - Financeiro';
                    dbgFichaProduto.Columns[22].Title.Caption := 'ALÍQ. IPI';
                    dbgFichaProduto.Columns[22].FieldName := 'aliquotaipi';

                    dbgFichaProdutoLotes.Columns[22].Title.Caption := 'ALÍQ. IPI';
                    dbgFichaProdutoLotes.Columns[22].FieldName := 'aliquotaipi';

                  end;
               end;
             end;
           end;
      end;

      pnlLegenda.Caption := Aux_1 + '               ' +
                            Aux_2 + '               ' +
                            Aux_3 + '               ';

      with dtmConsultaFichaProduto do
      begin
        ReferenciaQuantidade := IndQuantidade - 1;
      end;
    end;
  end;
end;

procedure TfrmConsultaFichaProduto.LimpaControles;
begin
  with dtmConsultaFichaProduto do begin
    Selecionar(pesPRODUTOS);
    if GerenteEstoque then
    Selecionar(pesFILIAIS);
    Selecionar(pesTIPOSMOVIMENTOS);
  end;
end;

procedure TfrmConsultaFichaProduto.sbnGerarClick(Sender: TObject);
begin
  if VerificaCamposConsulta then
    with dtmConsultaFichaProduto do
    begin
      ParametroFilial := edfFilial.Text;
      ParametroTipoMovimento := ANSIUpperCase(edfTipoMovimento.Text);
      ParametroProduto := fraConsultaProduto.fraConsultaItemProduto.edfCodigo.ValoraDataFieldInterno;
      ParametroLote := fraConsultaProduto.fraConsultaLote.edfCodigo.ValoraDataFieldInterno;

      ParametroDataInicial := edtDataInicial.Text;
      ParametroDataFinal := edtDataFinal.Text;
      SomenteLancamentosAvulsos := ckbSomenteLancamentosAvulsos.checked;

      ConsultaFichaProduto;
      sbnSalvar.Enabled := false;

      pgcMovimentos.ActivePage := tstMovimentos;
      dbgFichaProduto.SetFocus;


    end;
end;


function TfrmConsultaFichaProduto.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if (CtrlOn) and (ActiveControl is TtecDBEditFind) then
  begin
    if edfFilial.Focused then
      TipoPesquisa := pesFILIAIS
    else
      TipoPesquisa := pesTIPOSMOVIMENTOS;
    Result:= True;
  end;
end;

function TfrmConsultaFichaProduto.TituloPesquisa: String;
begin
  case TipoPesquisa of
    pesPRODUTOS     : Result := 'Produtos';
    pesFILIAIS      : Result := 'Filiais';
  pesTIPOSMOVIMENTOS: Result := 'Tipos Movimento';
  end;
end;

function TfrmConsultaFichaProduto.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    with dtmConsultaFichaProduto do
    begin
      AbreTabelaPesquisa(TipoPesquisa);
      Result := inherited InternoPesquisar(TituloPesquisa);
      if Result = mrOK then begin
        dtmConsultaFichaProduto.FechaTabelaFichaProdutos;
        Selecionar(TipoPesquisa);
      end;
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
    Result := 0;
end;

function TfrmConsultaFichaProduto.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmConsultaFichaProduto do
    case TipoPesquisa of
      pesFILIAIS      : Result := ExisteFilial(NomeCampo, Value);
    pesTIPOSMOVIMENTOS: Result := ExisteTipoMovimento(NomeCampo, Value);
    else Result := False;
    end;
end;

function TfrmConsultaFichaProduto.TabelaDePesquisa: TZDataSet;
begin
  with dtmConsultaFichaProduto do
    case TipoPesquisa of
      pesFILIAIS      : Result := ConsultarFilial;
    pesTIPOSMOVIMENTOS: Result := ConsultarTipoMovimento;
    else Result := nil;
    end;
end;

function TfrmConsultaFichaProduto.JanelaPesquisa;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = pesPRODUTOS then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := TipoPesquisa<>pesPRODUTOS;
end;

procedure TfrmConsultaFichaProduto.KeyDown(var Key: Word; Shift: TShiftState);
var
  i: byte;

begin
  inherited;

  case Key of
    VK_Escape  : begin
                    dtmConsultaFichaProduto.FechaTabelaFichaProdutos;
                    LimpaControles;
                    fraConsultaProduto.fraConsultaItemProduto.edfCodigo.SetFocus;
                  end;
        VK_F5  : begin
                    if AltOn then
                      if dtmConsultaFichaProduto.GerenteEstoque then
                      begin
                        dtmConsultaFichaProduto.qryFichaProduto.DisableControls;
                        dbgFichaProdutoTitleClick(dbgFichaProduto.Columns.Items[22]);
                        dtmConsultaFichaProduto.qryFichaProduto.EnableControls;
                      end;
                  end;
        VK_F6  : begin
                    dtmConsultaFichaProduto.qryFichaProduto.DisableControls;
                    sbnGerar.Click;
                    dtmConsultaFichaProduto.qryFichaProduto.EnableControls;
                  end;
        VK_F7  : begin
                    if AltOn then
                    begin
                      dtmConsultaFichaProduto.qryFichaProduto.DisableControls;
                      dbgFichaProdutoTitleClick(dbgFichaProduto.Columns.Items[4]);
                      dtmConsultaFichaProduto.qryFichaProduto.EnableControls;
                    end;
                  end;

        VK_F8  :  begin

                    if AltOn then
                    begin
                      dtmConsultaFichaProduto.qryFichaProduto.DisableControls;

                      if pos('Alt F8 - Ocultar Quantidades', pnlLegenda.Caption)<>0 then
                      begin
                        pnlLegenda.Caption := Trocar(pnlLegenda.Caption,
                                                'Alt F8 - Ocultar Quantidades',
                                                'Alt F8 - Exibir Quantidades');

                        for i:= 23 to 30 do
                        begin
                          dbgFichaProduto.Columns.Items[i].visible := false;
                          dbgFichaProdutoLotes.Columns.Items[i].visible := false;

                        end;
                      end
                      else
                      begin

                        pnlLegenda.Caption := Trocar(pnlLegenda.Caption,
                                                'Alt F8 - Exibir Quantidades',
                                                'Alt F8 - Ocultar Quantidades');


                        for i:= 23 to 30 do
                        begin
                          dbgFichaProduto.Columns.Items[i].visible := true;
                          dbgFichaProdutoLotes.Columns.Items[i].visible := true;

                        end;
                      end;
                      dtmConsultaFichaProduto.qryFichaProduto.EnableControls;

                    end;
                  end;
//        Key_F11 : dbgFichaProdutoTitleClick(dbgFichaProduto.Columns.Items[18]);
  end;
end;

procedure TfrmConsultaFichaProduto.edtDataFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if TeclaEnterouReturn(Key) and (Shift = []) then
    sbnGerar.Click;
end;

function TfrmConsultaFichaProduto.VerificaCamposConsulta: Boolean;
begin
  Result := False;
{  if ecvValida.Verify(gbxProduto, ControleValido) then}
    Result := fraConsultaProduto.fraConsultaItemProduto.edfCodigo.Exist;

  if edtDataInicial.Criticar(false) and edtDataFinal.Criticar(false) then
   if StrToDate(edtDataInicial.Text) > StrToDate(edtDataFinal.Text) then
   begin
    MensagemErro(ctDTINICIALMAIORDTFINAL);
    Result := False;
   end;
   if Result then
    Result := {( ecvValida.Verify(gbxProduto, ControleValido) )
              and}
              ( OperadorTernario(Trim(edfFilial.Text) <> '', edfFilial.Exist, True) )
              and
              ( OperadorTernario(Trim(edfTipoMovimento.Text) <> '' , edfTipoMovimento.Exist, True) );
end;


procedure TfrmConsultaFichaProduto.edfProdutoChange(Sender: TObject);
begin
  inherited;
  dtmConsultaFichaProduto.FechaTabelaFichaProdutos;
end;

procedure TfrmConsultaFichaProduto.edfFilialChange(Sender: TObject);
begin
  inherited;
  dtmConsultaFichaProduto.FechaTabelaFichaProdutos;
end;

procedure TfrmConsultaFichaProduto.edfTipoMovimentoChange(Sender: TObject);
begin
  inherited;
  dtmConsultaFichaProduto.FechaTabelaFichaProdutos;
end;

procedure TfrmConsultaFichaProduto.edtDataInicialChange(Sender: TObject);
begin
  inherited;
  dtmConsultaFichaProduto.FechaTabelaFichaProdutos;
end;

procedure TfrmConsultaFichaProduto.dbgFichaProdutoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  {if not Odd(dbgFichaProduto.DataSource.DataSet.RecNo) then  begin
    if not (gdSelected in State) then begin
      TDBGrid(Sender).Canvas.Brush.Color := $0080FFFF;
      TDBGrid(Sender).Canvas.Font.Color  := clBlack;
      TDBGrid(Sender).Canvas.Font.Style  := fsBold;
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;                                                    }
end;

procedure TfrmConsultaFichaProduto.AlterarEstadoBotoes;
begin
  if not sbnSalvar.Enabled then
    inherited;
end;

function TfrmConsultaFichaProduto.InternoGravar: Boolean;
begin
  Result:= inherited InternoGravar;
  if result then
    if dtmConsultaFichaProduto.GravarMovimento then
      sbnSalvar.Enabled := false;
end;

procedure TfrmConsultaFichaProduto.OperacaoPadrao(Value: array of Variant);
begin
  inherited;
  if Value[0] = 'Abrir' then
  begin
      fraConsultaProduto.fraConsultaItemProduto.edfCodigo.text := Value[1];
      fraConsultaProduto.fraConsultaItemProduto.edfCodigo.exist;
      edfFilial.clear;
      edfFilial.setfocus;
  end;
end;

procedure TfrmConsultaFichaProduto.sbnVisualizarGradeProdutosContratosClick(
  Sender: TObject);
begin
  inherited;
  dbgFichaProdutoporContrato.visible := not dbgFichaProdutoporContrato.visible;
  splitterProdutosporContratos.visible := not splitterProdutosporContratos.visible;
  dtmConsultaFichaProduto.VisualizarProdutosporContrato := dbgFichaProdutoporContrato.visible;
end;

procedure TfrmConsultaFichaProduto.pgcMovimentosChange(Sender: TObject);
begin
  inherited;
  if pgcMovimentos.activepage = tstMovimentos then
    dbgFichaProdutoporContrato.datasource := dtmConsultaFichaProduto.dsrFichaProduto_Contrato
  else
  if pgcMovimentos.activepage = tstLotes then
  begin
    dbgFichaProdutoporContrato.datasource := dtmConsultaFichaProduto.dsrFichaProdutoLote_Contrato;
    dtmConsultaFichaProduto.IncluirLinhaSaldoLotes;
  end;

end;

end.


