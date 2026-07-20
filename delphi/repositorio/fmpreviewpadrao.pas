unit fmpreviewpadrao;
interface
uses
  SysUtils, Classes, QGraphics, QControls, QForms, QDialogs, Types,
  fr_ctrls, fr_view, fr_dock, fr_class, QExtCtrls, QButtons, QStdCtrls,
  QMenus, QTypes, FR_E_HTM, FR_E_RTF, FR_E_TXT, FR_E_CSV, QComCtrls,
  QImgList, QT, biblio, dmbasico, variants;
const  VK_X = 88;type  TModoRelatorio = (MPadrao, MSimples, MPersonalizado);
  TModoResumo = (ComResumo, SemResumo, SoResumo);
  TArrayofTfrReport = array of TfrReport;type
  TfrmPreviewPadrao = class(TForm)    Panel2: TPanel;
    pnlPreview: TPanel;
    frTextExport1: TfrTextExport;
    frRTFExport1: TfrRTFExport;
    frHTMExport1: TfrHTMExport;
    frPreviewPadrao: TfrPreview;
    frCSVExport1: TfrCSVExport;
    MainImages: TImageList;
    Panel1: TToolBar;
    sbnUmaPagina: TfrSpeedButton;
    sbnDuasPaginas: TfrSpeedButton;
    sbnLarguraPagina: TfrSpeedButton;
    sbnPrimeiraPagina: TfrSpeedButton;
    sbnPaginaAnterior: TfrSpeedButton;
    sbnProximaPagina: TfrSpeedButton;
    sbnUltimaPagina: TfrSpeedButton;
    sbnImprimir: TfrSpeedButton;
    cmbZoom: TComboBox;
    lblPorcentagem: TLabel;
    LoadBtn: TToolButton;
    SaveBtn: TToolButton;
    ExitBtn: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    frCompositeReport: TfrCompositeReport;
    lblEmpresa: TLabel;    btnExportarLinear: TSpeedButton;
    procedure sbnPrimeiraPaginaClick(Sender: TObject);    procedure sbnPaginaAnteriorClick(Sender: TObject);
    procedure sbnProximaPaginaClick(Sender: TObject);
    procedure sbnUltimaPaginaClick(Sender: TObject);
    procedure sbnAbrirClick(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure sbnUmaPaginaClick(Sender: TObject);
    procedure sbnDuasPaginasClick(Sender: TObject);
    procedure sbnLarguraPaginaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SaiBtnClick(Sender: TObject);
    procedure cmbZoomClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);    procedure LoadBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure frPreviewPadraoDblClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure frCompositeReportEndDoc;    procedure btnExportarLinearClick(Sender: TObject);    procedure FormShow(Sender: TObject);    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);  protected    dmbasico : TdtmBasico;
  private

  public
    constructor Create(AOwner: TComponent; maximizar: boolean = false); reintroduce;    destructor  Destroy; override;  end;


var
  frmPreviewPadrao: TfrmPreviewPadrao;
  ImprimirRelatoriofast: procedure (Titulo, ParametroCabecalho: Variant; Modo: TModoRelatorio; IndModo: integer; fReports: array of TfrReport; DoublePass: boolean = false; AOwner: TComponent = nil);
  FecharRelatoriosQForms : procedure;

implementation
uses
  fmprincipalbasico;


{$R *.xfm}procedure  FecharRelatoriosQForms_;var  cnt: Integer;
  v_frmPreviewPadrao : TfrmPreviewPadrao;
  vFormtemp : String;
  vcountScreen : integer;
begin  vcountscreen :=  Screen.FormCount;  for cnt := 0 to vcountscreen - 1 do
  begin
    vFormTemp := Screen.Forms[cnt].classname;
    if ('TfrmPreviewPadrao'=vFormTemp) then
    begin
//      mensagemaviso(vFormTemp);
      v_frmPreviewPadrao := TfrmPreviewPadrao(Screen.Forms[cnt]);
      v_frmPreviewPadrao.ModalResult := mrOK;
    end;
  end;
end;procedure ImprimirRelatoriofast_(Titulo, ParametroCabecalho: Variant; Modo: TModoRelatorio; IndModo: integer; fReports: array of TfrReport; DoublePass: boolean = false; AOwner: TComponent = nil);
 var
  Relatorio: TfrReport;
  frmPreview: TfrmPreviewPadrao;
  i: integer;
begin

//  TfrmPrincipalBasico(Application.MainForm).MostrarFormRegistrado([], 'TfrmPreviewPadrao', True);

//  frmPreview := TfrmPreviewPadrao.create(self.owner);
//  frmPreview.show;


  if AOwner <> nil then
    frmPreview := TfrmPreviewPadrao.create(AOwner)
  else
    frmPreview := TfrmPreviewPadrao.create(nil);


//  frmPreview.Show;

//  frmPreview.frCompositeReport.modalpreview := true;
  Relatorio := frmPreview.frCompositeReport;

//  relatorio.modalpreview := true;

//  frmPreview.frCompositeReport.DoublePass := true;

//  mensagemaviso('Definindo');
//  Relatorio.DoublePass := DoublePass;
//  mensagemaviso('Definido');


  with frmPreview do
  begin
    frVariables['RAZAOFILIALBASE']   := dmBasico.RazaoFilialBase;
    frVariables['ENDERECOFILIALBASE']:= dmBasico.RuaFilialBase;
    frVariables['BAIRROFILIALBASE']  := dmBasico.BairroFilialBase;
    frVariables['CEP_CIDADE']        := FormatarCEP(dmBasico.CEPFilialBase)+'  '+dmBasico.CidadeFilialBase+ '  '+ dmBasico.EstadoFilialBase;
    frVariables['FONEFILIALBASE']    := FormatarFone(dmBasico.DDDFilialBase,dmBasico.FoneFilialBase);

    frVariables['RAZAOFILIALBASE']  := dmBasico.RazaoFilialBase;
    frVariables['ENDERECO_BAIRRO']   := dmBasico.RuaFilialBase+ ' - '+dmBasico.BairroFilialBase;
    frVariables['CEP_CIDADE_UF']:= FormatarCEP(dmBasico.CEPFilialBase)+'  '+dmBasico.CidadeFilialBase+ '  '+ dmBasico.EstadoFilialBase;

    frVariables['Razao'] := dmBasico.RazaoFilialBase;
    frVariables['Rua']   := dmBasico.RuaFilialBase;
    frVariables['Bairro']:= dmBasico.BairroFilialBase + ' - CEP: ' + dmBasico.CEPFilialBase;
    frVariables['Cidade']:= dmBasico.CidadeFilialBase + ' - ' + dmBasico.EstadoFilialBase;
    frVariables['Fone']  := dmBasico.FoneFilialBase;

    if Titulo <> null then
      frVariables['Titulo']:= Titulo;

    if ParametroCabecalho <> null then
      frVariables['outras']:= ParametroCabecalho;

    try

      case modo of
        MPadrao:
        begin
          case IndModo of
          0 : begin
               frCompositeReport.Dataset := TfrReport(fReports[0]).dataset;
               frCompositeReport.Reports.Add(fReports[0]);
               frCompositeReport.Reports.Add(fReports[1]);
              end;

          1 : begin
               frCompositeReport.Dataset := TfrReport(fReports[0]).dataset;
               frCompositeReport.Reports.Add(fReports[0]);
              end;

          2 : begin
               frCompositeReport.Dataset := TfrReport(fReports[1]).dataset;
               frCompositeReport.Reports.Add(fReports[1]);
              end;

          end;
        end;
        MSimples :
        begin
          frCompositeReport.Dataset := TfrReport(fReports[0]).dataset;
          for i := 0 to High(fReports) do
            frCompositeReport.Reports.Add(fReports[i]);
        end;
      end;
      //Ocorre um travamento quando doublepass. Veja relatorioprodutosconferidos
      frmPreview.frCompositeReport.DoublePass := DoublePass;
//      Relatorio.PreviewOptions.Modal := true;
      Relatorio.Preview := frmPreview.frPreviewPadrao;
//      Relatorio.modalpreview := true;


      relatorio.ShowReport;
//      frmPreview.Showmodal;
      frmPreview.cmbZoom.ItemIndex:= 3;
      frmPreview.Showmodal;
{      frmPreview.visible := true;
      frmPreview.bringtofront;
      frmPreview.Show;}

    finally
//      if assigned(frmPreview) then
//        freeandnil(frmPreview);

//      frCompositeReport.Reports.clear;
//      mensagemaviso('Definido '+frmPreview.name);
//      freeandnil(frmPreview);
    end;

  end;

end;


procedure TfrmPreviewPadrao.sbnPrimeiraPaginaClick(Sender: TObject);begin
  frPreviewPadrao.First;
end;
procedure TfrmPreviewPadrao.sbnPaginaAnteriorClick(Sender: TObject);begin
  frPreviewPadrao.Prev;
end;

procedure TfrmPreviewPadrao.sbnProximaPaginaClick(Sender: TObject);begin
  frPreviewPadrao.Next;
end;

procedure TfrmPreviewPadrao.sbnUltimaPaginaClick(Sender: TObject);begin
  frPreviewPadrao.Last;
end;

procedure TfrmPreviewPadrao.sbnAbrirClick(Sender: TObject);begin
  frPreviewPadrao.LoadFromFile;
end;

procedure TfrmPreviewPadrao.sbnSalvarClick(Sender: TObject);begin
  frPreviewPadrao.SaveToFile;
end;

procedure TfrmPreviewPadrao.sbnImprimirClick(Sender: TObject);begin
  frPreviewPadrao.Print;
end;

procedure TfrmPreviewPadrao.sbnUmaPaginaClick(Sender: TObject);
begin
  frPreviewPadrao.OnePage;
end;

procedure TfrmPreviewPadrao.sbnDuasPaginasClick(Sender: TObject);begin
  frPreviewPadrao.TwoPages;
//  frPreviewPadrao.Zoom := StrToInt(cmbZoom.Items.Strings[cmbZoom.ItemIndex]);
end;

procedure TfrmPreviewPadrao.sbnLarguraPaginaClick(Sender: TObject);begin
  frPreviewPadrao.PageWidth;
end;

procedure TfrmPreviewPadrao.FormActivate(Sender: TObject);begin
  cmbZoomClick(nil);
//  frSpeedButton2.Down := True;
//  frSpeedButton2Click(nil);
end;

procedure TfrmPreviewPadrao.SaiBtnClick(Sender: TObject);begin
  ModalResult := mrOk;
end;

procedure TfrmPreviewPadrao.cmbZoomClick(Sender: TObject);begin
  frPreviewPadrao.Zoom := StrToInt(cmbZoom.Items.Strings[cmbZoom.ItemIndex]);
end;

procedure TfrmPreviewPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=Key_escape then
   ExitBtn.Click
  else
  if (ssCtrl in Shift) and (key = vk_x) then
  begin
    if frCompositeReport.dataset <> nil then
      frPreviewPadrao.ExportarLinear;
  end
  else
   frPreviewpadrao.Window.FormKeyDown(Sender, Key, Shift);
end;

procedure TfrmPreviewPadrao.LoadBtnClick(Sender: TObject);
begin
  frPreviewPadrao.LoadFromFile;
end;

procedure TfrmPreviewPadrao.SaveBtnClick(Sender: TObject);
begin
  frPreviewPadrao.SaveToFile;
end;

procedure TfrmPreviewPadrao.ExitBtnClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPreviewPadrao.frPreviewPadraoDblClick(Sender: TObject);
begin
 frPreviewPadrao.next;
end;

procedure TfrmPreviewPadrao.FormDblClick(Sender: TObject);
begin
 frPreviewPadrao.next;
end;

procedure TfrmPreviewPadrao.N5Click(Sender: TObject);
begin
  frPreviewPadrao.next;
end;


procedure TfrmPreviewPadrao.frCompositeReportEndDoc;
begin
  if assigned(sbnImprimirRelatorio)  then
    sbnImprimirRelatorio.enabled := true;
  vPodeImprimirRelatorio := true;
end;

constructor TfrmPreviewPadrao.Create(AOwner: TComponent; maximizar: boolean);
begin
  Inherited Create(AOwner);
  if maximizar then
    windowState := wsmaximized
  else
    windowState := wsnormal;

end;

procedure TfrmPreviewPadrao.btnExportarLinearClick(Sender: TObject);
begin
  frPreviewPadrao.ExportarLinear;
end;

procedure TfrmPreviewPadrao.FormShow(Sender: TObject);
begin
  btnExportarLinear.visible := (frCompositeReport.dataset <> nil) or
                                assigned(frPreviewPadrao.OnExportLinear);
end;

destructor TfrmPreviewPadrao.Destroy;
begin
//  frCompositeReport.Reports.clear;
  inherited;
//  self := nil;
//  frCompositeReport.Reports.clear;

end;

procedure TfrmPreviewPadrao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
  {
var
  cnt: Integer;
  v_frmPreviewPadrao : TfrmPreviewPadrao;
  }
begin
{
  for cnt :=self.ComponentCount-1 downto 0 do
    if Components[cnt] is TfrmPreviewPadrao then
    begin
      v_frmPreviewPadrao := TfrmPreviewPadrao(Components[cnt]);

      v_frmPreviewPadrao.ModalResult := mrOK;
    end;
    }

//  ModalResult := mrOK;
//  CanClose := True;
end;

initialization
   ImprimirRelatoriofast := ImprimirRelatoriofast_;
   FecharRelatoriosQForms := FecharRelatoriosQForms_;

end.
