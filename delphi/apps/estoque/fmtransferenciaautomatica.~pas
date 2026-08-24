unit fmtransferenciaautomatica;

interface

uses
  //CLX
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, Buttons,
  //Repositorio
  fmajudabt, clparametrossistema,
  //Componentes
  cpdata, cpdbgrid, ToolWin;

type
  TfrmTransferenciaAutomatica = class(TfrmAjudaBt)
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    dbgProdutos: TtecDBGrid;
    edtDataEmissao: TEditData;
    sbnGerar: TSpeedButton;
    sbnImprimir: TSpeedButton;
    ckbMarcarTodos: TCheckBox;
    lblNrProdutos: TLabel;
    lblNrSelecionados: TLabel;
    gbxEmissao: TGroupBox;
    gbxNrProdutos: TGroupBox;
    gbxSelecionados: TGroupBox;
    procedure sbnGerarClick(Sender: TObject);
    procedure sbnImprimirClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgProdutosDblClick(Sender: TObject);
    procedure ckbMarcarTodosClick(Sender: TObject);
    procedure AtualizarContadores;
  protected
    procedure ExecutarConsulta;
    procedure ImprimirNota;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure ExibirMensagemPadronizadaDataEmissao;

  public
    Constructor Create(Awoner: TComponent); override;
    Destructor  Destroy; override;
  end;

var
  frmTransferenciaAutomatica: TfrmTransferenciaAutomatica;
  QuaisMarcados: Array of Boolean;
  

implementation

uses
  //CLX
  Windows,
  //Biblio
  ctconstantes, biblio,
  //Projeto
  dmtransferenciaautomatica;

{$R *.dfm}

{ TfrmTransferenciaAutomatica }

constructor TfrmTransferenciaAutomatica.Create(Awoner: TComponent);
begin
  inherited;
  if ParSistema.PermitirProdutoAlfanumerico then
     dbgProdutos.Columns[2].Width:= 217
  else
     dbgProdutos.Columns[2].Width:= 135;
  dtmTransferenciaAutomatica := TdtmTransferenciaAutomatica.Create(Self);
  edtDataEmissao.Minimo := dtmTransferenciaAutomatica.NDiasLimiteEmissao;
  edtDataEmissao.MensagemPadronizada := ExibirMensagemPadronizadaDataEmissao;

  if dtmTransferenciaAutomatica.SerieSugestao = '' then begin
    sbnGerar.Enabled := False;
    MensagemAviso(Format(ctFILIALSEMSERIE, [dtmTransferenciaAutomatica.FilialBase, 'mercadorias']))
  end else if dtmTransferenciaAutomatica.ModeloNota = 0 then begin
    sbnGerar.Enabled := False;
    MensagemConfirmacao(ctSERIESUGESTAOSEMMODELO)
  end;
  if dbgProdutos.Columns[4].width < ParSistema.TamanhoMascaraQuantidade then
    dbgProdutos.Columns[4].width := ParSistema.TamanhoMascaraQuantidade;
end;

procedure TfrmTransferenciaAutomatica.dbgProdutosDblClick(Sender: TObject);
begin
   Inherited;
   dtmTransferenciaAutomatica.Selecionar;
   AtualizarContadores;
end;

procedure TfrmTransferenciaAutomatica.dbgProdutosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   Inherited;
   if Key = VK_SPACE then begin
      dtmTransferenciaAutomatica.Selecionar;
      AtualizarContadores;
   end;
end;

destructor TfrmTransferenciaAutomatica.Destroy;
begin
  dtmTransferenciaAutomatica:=nil;
  inherited;
  frmTransferenciaAutomatica := nil
end;

procedure TfrmTransferenciaAutomatica.ExecutarConsulta;
begin
   if sbnGerar.Enabled then begin
      if edtDataEmissao.DataValida then begin
         dtmTransferenciaAutomatica.SelecionarTodos:= ckbMarcarTodos.Checked;
         dtmTransferenciaAutomatica.Data:= Trim(edtDataEmissao.Text);
         dtmTransferenciaAutomatica.Fecha(ctEstoqueTransferencia);
         dtmTransferenciaAutomatica.Abre(ctEstoqueTransferencia);
         dtmTransferenciaAutomatica.MarcarProdutos(ckbMarcarTodos.Checked, True);
         AtualizarContadores;
      end;
   end;
end;

procedure TfrmTransferenciaAutomatica.ImprimirNota;
begin
   if sbnImprimir.Enabled then   begin
      dtmTransferenciaAutomatica.ImprimirNotas;
      dtmTransferenciaAutomatica.MarcarProdutos(ckbMarcarTodos.Checked, True);
      AtualizarContadores;
   end;
end;

procedure TfrmTransferenciaAutomatica.KeyDown(var Key: Word; Shift: TShiftState);
begin
   if Shift = []
   then case Key of
           VK_F6:     ExecutarConsulta;
           VK_F7:     ImprimirNota;
           VK_RETURN: if ActiveControl = edtDataEmissao then
                          ExecutarConsulta;
       end;
end;

procedure TfrmTransferenciaAutomatica.sbnGerarClick(Sender: TObject);
begin
   Inherited;
   ExecutarConsulta;
end;

procedure TfrmTransferenciaAutomatica.sbnImprimirClick(Sender: TObject);
begin
   Inherited;
   ImprimirNota;
end;

procedure TfrmTransferenciaAutomatica.ckbMarcarTodosClick(Sender: TObject);
begin
   inherited;
   dtmTransferenciaAutomatica.MarcarProdutos(ckbMarcarTodos.Checked, True);
   AtualizarContadores;
end;

procedure TfrmTransferenciaAutomatica.AtualizarContadores;
begin
   with dtmTransferenciaAutomatica do begin
      lblNrProdutos.    Caption:= IntToStr(TotalRegistros);
      lblNrSelecionados.Caption:= IntToStr(QtdeMarcados);
      sbnImprimir.Enabled:= QtdeMarcados > 0;
   end;
end;

procedure TfrmTransferenciaAutomatica.ExibirMensagemPadronizadaDataEmissao;
begin
  if strtodate(edtDataEmissao.Text) <= ParSistema.DataContabil then
    MensagemAviso(format(ctDATACONTABILMAIORDATALANCTO, ['de emissão',
                     edtDataEmissao.Text, 'contábil', ParSistema.DataContabilstring]))
  else
    if strtodate(edtDataEmissao.Text) < DataLocal - edtDataEmissao.minimo then
      MensagemAviso(format(ctDATACONTABILMAIOROUIGUALDATALANCTO, ['de emissão',
                       edtDataEmissao.Text, 'retroativa',
                       datetostr(DataLocal - edtDataEmissao.Minimo)]))
end;

End.

