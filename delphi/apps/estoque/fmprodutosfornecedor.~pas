unit fmprodutosfornecedor;

interface

uses
  SysUtils, Qtypes, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, DBGrids, ComCtrls, Windows, DBCtrls, ExtCtrls, Buttons,
  // Terceiros
  ZQuery,
  // Repositorio
  fmconsultaporcampo, fmconsultabasica, fmajudabt,
  // Biblio
  ctconstantes, biblio,
  // Componentes
  cptexto, cpdbfindcontrols, cpdbgrid, cpdbtext, cppagecontrol, cpdata,
  // Projeto
  dmprodutosfornecedor, ActnList, cpnumero, CheckLst, ToolWin;

type
  TfrmProdutosFornecedor = class(TfrmAjudaBt)
    gbxInformar: TGroupBox;
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    aclHabilitar: TActionList;
    actEvento: TAction;
    pgcManutencaoPreco: TtecPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gbxSelecionar: TGroupBox;
    GroupBox1: TGroupBox;
    dbgSelecionados: TtecDBGrid;
    gbxProdutos: TGroupBox;
    edfProdutoInicial: TtecDbEditFind;
    sbnProdutoInicial: TSpeedButton;
    dtxProdutoInicial: TtecDBText;
    gbxFornecedores: TGroupBox;
    sbnFornecedorInicial: TSpeedButton;
    edfFornecedorInicial: TtecDbEditFind;
    dtxFornecedorInicial: TtecDBText;
    rgbOrdenacao: TRadioGroup;
    edfProdutoFinal: TtecDbEditFind;
    sbnProdutoFinal: TSpeedButton;
    dtxProdutoFinal: TtecDBText;
    rgbProduto: TRadioGroup;
    edfFornecedorFinal: TtecDbEditFind;
    sbnFornecedorFinal: TSpeedButton;
    dtxFornecedorFinal: TtecDBText;
    rgbFornecedor: TRadioGroup;
    gbxMarcas: TGroupBox;
    sbnMarcarMarcas: TSpeedButton;
    sbnDesmarcarMarcas: TSpeedButton;
    clbMarcas: TCheckListBox;
    gbxGrupos: TGroupBox;
    sbnMarcarGrupos: TSpeedButton;
    sbnDesmarcarGrupos: TSpeedButton;
    clbGrupos: TCheckListBox;
    gbxClasses: TGroupBox;
    sbnMarcarClasses: TSpeedButton;
    sbnDesmarcarClasses: TSpeedButton;
    clbClasses: TCheckListBox;
    gbxCidadeUF: TGroupBox;
    lblCidade: TLabel;
    edtCidade: TEditTexto;
    lblUF: TLabel;
    edtEstado: TEditTexto;
    gbxExibir: TGroupBox;
    ckbFornecedor: TCheckBox;
    ckbMarca: TCheckBox;
    ckbGrupo: TCheckBox;
    ckbClasse: TCheckBox;
    ckbProduto: TCheckBox;
    sbnImprimir: TSpeedButton;
    pnlTotalRegistros: TPanel;
    lblTotalRegistros: TLabel;
    lblExibirTotal: TLabel;
    procedure actEventoUpdate(Sender: TObject);
    procedure sbnProdutoInicialClick(Sender: TObject);
    procedure pgcConsultaChange(Sender: TObject);
    procedure sbnFornecedorInicialClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnMarcarMarcasClick(Sender: TObject);
    procedure sbnDesmarcarMarcasClick(Sender: TObject);
    procedure sbnMarcarGruposClick(Sender: TObject);
    procedure sbnDesmarcarGruposClick(Sender: TObject);
    procedure sbnMarcarClassesClick(Sender: TObject);
    procedure sbnDesmarcarClassesClick(Sender: TObject);
    procedure sbnProdutoFinalClick(Sender: TObject);
    procedure sbnFornecedorFinalClick(Sender: TObject);
    procedure dbgSelecionadosTitleClick(Column: TColumn);
    procedure sbnImprimirClick(Sender: TObject);
  protected
    dtmProdutosFornecedor: TdtmProdutosFornecedor;
    function  ValidarCampos: Boolean;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure ObterLista(Origem: TLista; Destino: TCheckListBox);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmProdutosFornecedor: TfrmProdutosFornecedor;
  TipoPesquisa: TtecRelatorioProdutosFornecedor;
  IndFOR: Integer;

implementation

{$R *.dfm}

procedure TfrmProdutosFornecedor.actEventoUpdate(Sender: TObject);
begin
  inherited;
  sbnGerar.Enabled   := (pgcManutencaoPreco.ActivePageIndex = 0);
  sbnImprimir.Enabled:= (pgcManutencaoPreco.ActivePageIndex = 1) and
                        (dtmProdutosFornecedor.NumeroRegistro > 0);
end;

constructor TfrmProdutosFornecedor.Create(AOwner: TComponent);
begin
  dtmProdutosFornecedor:= TdtmProdutosFornecedor.Create(Self);
  inherited;
  ObterLista(dtmProdutosFornecedor.ListaMarcas, clbMarcas);
  ObterLista(dtmProdutosFornecedor.ListaGrupos, clbGrupos);
  ObterLista(dtmProdutosFornecedor.ListaClasses, clbClasses);
  pgcManutencaoPreco.ActivePageIndex:= 0;
  IndFOR:= 1;
  edfProdutoInicial.SetFocus;
end;

destructor TfrmProdutosFornecedor.Destroy;
begin
  dtmProdutosFornecedor:=nil;
  inherited;
  frmProdutosFornecedor := nil;
end;

function TfrmProdutosFornecedor.ExisteInformacao(Parametro: Integer;NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmProdutosFornecedor do begin
    case TipoPesquisa of
      rpfPRODUTOINICIAL,
         rpfPRODUTOFINAL : Result := ExisteProdutos(NomeCampo, Value);
   rpfFORNECEDORINICIAL,
      rpfFORNECEDORFINAL : Result := ExisteFornecedores(NomeCampo, Value);
      else                 Result := False;
    end;
  end;
end;

function TfrmProdutosFornecedor.InternoPesquisar(Titulo:String): Integer;
begin
  Result:= mrNone;
  if ActiveControl is TtecFindCustom then begin
    if CtrlOn then begin
      if ActiveControl = edfProdutoInicial then begin
        TipoPesquisa:= rpfPRODUTOINICIAL;
        Titulo      := 'Produtos';
      end
      else if ActiveControl = edfProdutoFinal then begin
        TipoPesquisa:= rpfPRODUTOFINAL;
        Titulo      := 'Produtos';
      end
      else if ActiveControl = edfFornecedorInicial then begin
        TipoPesquisa:= rpfFORNECEDORINICIAL;
        Titulo      := 'Fornecedores';
      end
      else if ActiveControl = edfFornecedorFinal then begin
        TipoPesquisa:= rpfFORNECEDORFINAL;
        Titulo      := 'Fornecedores';
      end
      else TipoPesquisa:= rpfNENHUM;

      if TipoPesquisa <> rpfNENHUM then begin
        with dtmProdutosFornecedor do begin
          AbreTabelaPesquisa(TipoPesquisa);
          Result := inherited InternoPesquisar(Titulo);
          if Result = mrOK then
            Selecionar(TipoPesquisa);
          FechaTabelaPesquisa(TipoPesquisa);
        end;
      end;
    end;
  end;
end;

function TfrmProdutosFornecedor.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if (TipoPesquisa in [rpfPRODUTOINICIAL, rpfPRODUTOFINAL ]) then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

procedure TfrmProdutosFornecedor.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_Escape : dtmProdutosFornecedor.LimpaTabelas;
        VK_F6 : if (Shift = []) and sbnGerar.Enabled then
                   sbnGerar.Click;
        VK_F7 : if (Shift = []) and sbnImprimir.Enabled then
                   sbnImprimir.Click;           
  end;
  inherited;
end;

procedure TfrmProdutosFornecedor.pgcConsultaChange(Sender: TObject);
begin
  dtmProdutosFornecedor.LimpaTabelas
end;

procedure TfrmProdutosFornecedor.sbnProdutoInicialClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfProdutoInicial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmProdutosFornecedor.sbnFornecedorInicialClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedorInicial.SetFocus;
  InternoPesquisar('');
end;

function TfrmProdutosFornecedor.TabelaDePesquisa: TZDataSet;
begin
  with dtmProdutosFornecedor do begin
    case TipoPesquisa of
       rpfPRODUTOINICIAL,
         rpfPRODUTOFINAL : Result := ConsultarCaracteristicas;
    rpfFORNECEDORINICIAL,
      rpfFORNECEDORFINAL : Result := ConsultarFornecedores;
      else                 Result := nil;
    end;
  end;
end;

function TfrmProdutosFornecedor.ValidarCampos: Boolean;
begin
  Result:= OperadorTernario(edfProdutoInicial.Text <> '', edfProdutoInicial.Exist, True);
end;

procedure TfrmProdutosFornecedor.sbnGerarClick(Sender: TObject);
begin
  inherited;
  with dtmProdutosFornecedor do begin
    if ValidarCampos then begin
      SelecaoProduto:= rgbProduto.ItemIndex;
      ProdutoInicial:= edfProdutoInicial.Text;
      ProdutoFinal  := edfProdutoFinal.Text;
      SelecaoFornecedor:= rgbFornecedor.ItemIndex;
      FornecedorInicial:= edfFornecedorInicial.Text;
      FornecedorFinal  := edfFornecedorFinal.Text;
      Cidade:= edtCidade.Text;
      Estado:= edtEstado.Text;
      MontarFiltroMarcas(clbMarcas);
      MontarFiltroGrupos(clbGrupos);
      MontarFiltroClasses(clbClasses);
      Ordenacao := rgbOrdenacao.ItemIndex;
      dtmProdutosFornecedor.GerarRelatorio;
      if NumeroRegistro > 0 then begin
        dbgSelecionados.Columns[01].Visible:= ckbProduto.Checked;
        dbgSelecionados.Columns[02].Visible:= ckbFornecedor.Checked;
        dbgSelecionados.Columns[12].Visible:= ckbMarca.Checked;
        dbgSelecionados.Columns[12].Visible:= ckbGrupo.Checked;
        dbgSelecionados.Columns[13].Visible:= ckbClasse.Checked;
        lblExibirTotal.Caption:= IntToStr(NumeroRegistro);
        pgcManutencaoPreco.ActivePageIndex:= 1;
        dbgSelecionados.SetFocus;
      end
      else begin
        lblExibirTotal.Caption:= '0';
        dtmProdutosFornecedor.Fecha(ctManutencaoPreco);
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        pgcManutencaoPreco.ActivePageIndex:= 0;
        edfProdutoInicial.SetFocus
      end;
    end;
  end;
end;

procedure TfrmProdutosFornecedor.ObterLista(Origem: TLista; Destino: TCheckListBox);
var
  Ind: Integer;
begin
  for Ind:= 0 to (Length(Origem) - 1) do
    Destino.Items.Add(Origem[Ind].descricao);
end;

procedure TfrmProdutosFornecedor.sbnMarcarMarcasClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbMarcas,True);
end;

procedure TfrmProdutosFornecedor.sbnDesmarcarMarcasClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbMarcas,False);
end;

procedure TfrmProdutosFornecedor.sbnMarcarGruposClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupos,True);
end;

procedure TfrmProdutosFornecedor.sbnDesmarcarGruposClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupos,False);
end;

procedure TfrmProdutosFornecedor.sbnMarcarClassesClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbClasses,True);
end;

procedure TfrmProdutosFornecedor.sbnDesmarcarClassesClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbClasses,False);
end;

procedure TfrmProdutosFornecedor.sbnProdutoFinalClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfProdutoFinal.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmProdutosFornecedor.sbnFornecedorFinalClick(Sender: TObject);
begin
  inherited;
  CtrlOn:= True;
  edfFornecedorFinal.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmProdutosFornecedor.dbgSelecionadosTitleClick(Column: TColumn);
begin
  inherited;
  if AltOn then
  begin
    case Column.Index of
      2: begin
           if Column.Visible then begin
             if IndFOR < 3 then Inc(IndFOR)
             else IndFOR:= 1;
             case IndFOR of
               1: begin
                    dbgSelecionados.Columns[02].Title.Caption := 'Fornecedor...';
                    dbgSelecionados.Columns[02].FieldName := 'nome';
                  end;
               2: begin
                    dbgSelecionados.Columns[02].Title.Caption := 'Código fornecedor...';
                    dbgSelecionados.Columns[02].FieldName := 'fornecedor';
                  end;
               3: begin
                    dbgSelecionados.Columns[02].Title.Caption := 'Obs. fornecedor X produto...';
                    dbgSelecionados.Columns[02].FieldName := 'observacao';
                  end;
             end;
           end;
         end;
    end;
  end;  
end;

procedure TfrmProdutosFornecedor.sbnImprimirClick(Sender: TObject);
begin
  inherited;
  dtmProdutosFornecedor.Imprimir;
end;

end.



