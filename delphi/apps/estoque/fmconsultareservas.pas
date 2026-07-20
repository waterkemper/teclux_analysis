unit fmconsultareservas;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DBCtrls, Mask, ExtCtrls, Buttons, Windows, DB,
  ComCtrls, DateUtils,
  // Repositorio
  fmajudabt, fmconsultaporcampo, fmconsultabasica,
  // Constantes
  ctconstantes, biblio, clparametrossistema,
  // Terceiros
  ZQuery,
  // Componenetes
  cptexto, cpdbfindcontrols, cpdatasource, cpdbgrid, cpdbtext,
  cppagecontrol, cpeditioncontrolvalidation, cpdbradiogroup, cpdata,
  ToolWin;

type
  TfrmConsultaReservas = class(TfrmAjudaBt)
    gbxReservas: TGroupBox;
    sbnProcuraProdutos: TSpeedButton;
    sbnPesquisaFilial: TSpeedButton;
    lblProdutos: TLabel;
    lblFilial: TLabel;
    dtxProdutos: TtecDBText;
    dtxFilial: TtecDBText;
    edfProdutos: TtecDbEditFind;
    edfFilial: TtecDbEditFind;
    pnlFundoJanela: TPanel;
    sbnGerar: TSpeedButton;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    rgbSituacao: TtecDBRadioGroup;
    ckbAberta: TtecRadioButton;
    ckbCancelada: TtecRadioButton;
    ckbFechada: TtecRadioButton;
    rgbOrdenar: TtecDBRadioGroup;
    ckbReserva: TtecRadioButton;
    ckbProduto: TtecRadioButton;
    ckbEmissao: TtecRadioButton;
    gbxReserva: TGroupBox;
    edtReserva: TEditTexto;
    edfVendedor: TtecDbEditFind;
    lblVendedor: TLabel;
    sbnProcuraVendedor: TSpeedButton;
    dtxDescricaoVendedor: TtecDBText;
    dbgProdutos: TtecDBGrid;
    ckbAmbas: TtecRadioButton;
    ecvValida: TtecEditionControlValidation;
    procedure dbgProdutosTitleClick(Column: TColumn);
    procedure sbnProcuraProdutosClick(Sender: TObject);
    procedure sbnPesquisaFilialClick(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnProcuraVendedorClick(Sender: TObject);
    procedure edtDataFinalEnter(Sender: TObject);
  private
    procedure AfterScrollLinhaColunaGrade(Sender: TObject);
  protected
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  InternoPesquisar(Titulo: String): Integer; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    function  VerificaCamposConsulta: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmConsultaReservas: TfrmConsultaReservas;
  TipoPesquisa: TtecPesquisa;
  ControleValido: TWinControl;
  Escolha: Byte;

implementation

uses dmconsultareservas;

{$R *.dfm}

constructor TfrmConsultaReservas.Create(AOwner: TComponent);
begin
  dtmConsultaReservas := TdtmConsultaReservas.Create(Self);
  inherited;
  Escolha := 1;
  edfFilial.Text     := IntToStr(dtmConsultaReservas.FilialBase);
  edfFilial.Exist;
  edtDataInicial.Text:= DateToStr(dtmConsultaReservas.DataServidor - 180);
  edtDataFinal.Text  := DateToStr(dtmConsultaReservas.DataServidor);
  dbgProdutos.Columns[5].Visible := ParSistema.UsarGradesProdutos;
  dbgProdutos.Columns[6].Visible := ParSistema.UsarGradesProdutos;
  dtmConsultaReservas.OnScrollLinhaColunaGrade := AfterScrollLinhaColunaGrade;
  if dbgProdutos.Columns[8].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutos.Columns[8].Width := ParSistema.TamanhoMascaraQuantidade;
  if dbgProdutos.Columns[9].Width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutos.Columns[9].Width := ParSistema.TamanhoMascaraQuantidade;
end;

destructor TfrmConsultaReservas.Destroy;
begin
  dtmConsultaReservas:=nil;
  inherited;
  frmConsultaReservas := nil;
end;

procedure TfrmConsultaReservas.sbnProcuraProdutosClick(Sender: TObject);
begin
  CtrlOn := True;
  edfProdutos.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaReservas.sbnPesquisaFilialClick(Sender: TObject);
begin
  CtrlOn := True;
  edfFilial.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaReservas.dbgProdutosTitleClick(Column: TColumn);
begin
  if AltOn then
  begin
    if (Escolha = 3) then Escolha:= 1
    else                  Inc(Escolha);
    if Column.Index = 10 then begin
      case Escolha of
        1: begin
             dbgProdutos.Columns[10].Title.Caption := 'Nome cliente...';
             dbgProdutos.Columns[10].FieldName := 'cliente';
           end;
        2: begin
             dbgProdutos.Columns[10].Title.Caption := 'Vendedor...';
             dbgProdutos.Columns[10].FieldName := 'nomeusuario';
           end;
        3: begin
             dbgProdutos.Columns[10].Title.Caption := 'Endereço...';
             dbgProdutos.Columns[10].FieldName := 'endereco';
           end;
      end;
    end;
  end;  
end;

function TfrmConsultaReservas.VerificaCamposConsulta: Boolean;
begin
  Result := False;
  if ecvValida.Verify(gbxPeriodo,ControleValido) then
    Result := OperadorTernario((Trim(edfFilial.Text)   <> ''), edfFilial.Exist, True)   and
              OperadorTernario((Trim(edfProdutos.Text) <> ''), edfProdutos.Exist, True) and
              OperadorTernario((Trim(edfVendedor.Text) <> ''), edfVendedor.Exist, True);
end;

function TfrmConsultaReservas.InternoPesquisar(Titulo: String): Integer;
begin
  Result:= mrNone;
  if CtrlOn then begin
    if ActiveControl = edfProdutos then begin
      TipoPesquisa := pesCARACTERISTICAS;
      Titulo       := 'Item Produtos';
    end
    else if ActiveControl = edfFilial then begin
      TipoPesquisa := pesFILIAIS;
      Titulo       := 'Filiais';
    end
    else if ActiveControl = edfVendedor then begin
      TipoPesquisa := pesVENDEDORES;
      Titulo       := 'Vendedores';
    end
    else TipoPesquisa := pesNENHUMA;

    if TipoPesquisa <> pesNENHUMA then begin
      with dtmConsultaReservas do begin
        AbreTabelaPesquisa(TipoPesquisa);
        Result := inherited InternoPesquisar(Titulo);
        if Result = mrOK then
          Selecionar(TipoPesquisa);
        FechaTabelaPesquisa(TipoPesquisa);
      end
    end;
  end;
end;

function TfrmConsultaReservas.JanelaPesquisa;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  if TipoPesquisa = pesCARACTERISTICAS then
       TfrmConsultaPorCampo(Result).ConsultaInterativa := False
  else TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmConsultaReservas.TabelaDePesquisa: TZDataSet;
begin
  with dtmConsultaReservas do
   case TipoPesquisa of
     pesCARACTERISTICAS: Result := ConsultarProdutos;
     pesFILIAIS        : Result := ConsultarFiliais;
     pesVENDEDORES     : Result := ConsultarVendedores;
     else                Result := nil;
   end;
end;

function TfrmConsultaReservas.ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  with dtmConsultaReservas do
    case TipoPesquisa of
      pesCARACTERISTICAS: Result := ExisteProduto(NomeCampo, Value);
      pesFILIAIS        : Result := ExisteFilial(NomeCampo, Value);
      pesVENDEDORES     : Result := ExisteVendedor(NomeCampo, Value);
      else                Result := False;
    end;
end;

procedure TfrmConsultaReservas.sbnGerarClick(Sender: TObject);
begin
  if VerificaCamposConsulta then begin
    with dtmConsultaReservas do begin
      Produto     := edfProdutos.Text;
      Filial      := edfFilial.Text;
      Vendedor    := edfVendedor.Text;
      Reserva     := edtReserva.Text;
      DataInicial := edtDataInicial.Text;
      DataFinal   := edtDataFinal.Text;
      Situacao    := rgbSituacao.ItemIndex;
      Ordenar     := rgbOrdenar.ItemIndex;
      if ConsultaReserva then begin
        MensagemAviso(Format(ctNENHUMREGISTROSELECIONADO,['registro']));
        edfFilial.SetFocus;
      end
      else dbgProdutos.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaReservas.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
        VK_F6 : sbnGerar.Click;
    VK_Escape : dtmConsultaReservas.FecharTabelaReserva;
  end;
  inherited;
end;

procedure TfrmConsultaReservas.sbnProcuraVendedorClick(Sender: TObject);
begin
  inherited;
  CtrlOn := True;
  edfVendedor.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmConsultaReservas.edtDataFinalEnter(Sender: TObject);
begin
  inherited;
  if not DataEmBranco(edtDataInicial.Text) then
    edtDataFinal.Minimo:= DaysBetween(dtmConsultaReservas.DataServidor,StrToDate(edtDataInicial.Text));
end;

procedure TfrmConsultaReservas.AfterScrollLinhaColunaGrade(
  Sender: TObject);
begin
  dbgProdutos.Columns[5].Title.Caption := dtmConsultaReservas.LinhadaGrade;
  dbgProdutos.Columns[6].Title.Caption := dtmConsultaReservas.ColunadaGrade;
end;

end.
