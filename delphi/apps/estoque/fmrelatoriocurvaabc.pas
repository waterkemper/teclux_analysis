unit fmrelatoriocurvaabc;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, frlistafiliais, ComCtrls,
  frlistagruposfiliais, Grids, DBGrids, cpdbgrid, StdCtrls, cpnumero,
  cpdata, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, cppagecontrol,
  dmrelatoriocurvaabc, frconsulta, biblio,
  ctconstantes, cpeditioncontrolvalidation, CheckLst, FR_PTabl, Windows,
  frconsultaippgcm, ToolWin, ActnList;

type
  TfrmRelatorioCurvaABC = class(TfrmRelatorioPadrao)
    pgcParametros: TPageControl;
    tstParametros: TTabSheet;
    tstDados: TTabSheet;
    gbxPercentuaisABC: TGroupBox;
    lblpercentualA: TLabel;
    edtpercentualA: TEditNumero;
    lblpercentualB: TLabel;
    edtpercentualB: TEditNumero;
    lblpercentualC: TLabel;
    edtpercentualC: TEditNumero;
    dbgCurvaABC: TtecDBGrid;
    gbxProdutos: TGroupBox;
    ckbProdutoEmLinha: TCheckBox;
    ckbProdutoForadeLinha: TCheckBox;
    ckbProdutoComMontagem: TCheckBox;
    ckbProdutoSemMontagem: TCheckBox;
    ckbProdutoNaoBrinde: TCheckBox;
    ckbProdutoBrinde: TCheckBox;
    ckbProdutoAtivo: TCheckBox;
    ckbProdutoInativo: TCheckBox;
    gbxPeriodo: TGroupBox;
    lblDataInicial: TLabel;
    edtDataInicial: TEditData;
    lblDataFinal: TLabel;
    edtDataFinal: TEditData;
    rbnAnalisar: TRadioGroup;
    rbnCurvaABC: TRadioGroup;
    gbxQuantidade: TGroupBox;
    edtQuantidade: TEditNumero;
    rbnAnalizarProdutos: TRadioGroup;
    fraListaFiliais1: TfraListaFiliais;
    fraListaGruposFiliais1: TfraListaGruposFiliais;
    sbnGerar: TSpeedButton;
    ecvValida: TtecEditionControlValidation;
    fraConsultaIPPGCM: TfraConsultaIPPGCM;
    svdExportarExcel: TSaveDialog;
    sbnSalvar: TSpeedButton;
    procedure sbnGerarClick(Sender: TObject);
    procedure ckbProdutoEmLinhaClick(Sender: TObject);
    procedure ckbProdutoForadeLinhaClick(Sender: TObject);
    procedure ckbProdutoAtivoClick(Sender: TObject);
    procedure ckbProdutoInativoClick(Sender: TObject);
    procedure ckbProdutoComMontagemClick(Sender: TObject);
    procedure ckbProdutoSemMontagemClick(Sender: TObject);
    procedure ckbProdutoBrindeClick(Sender: TObject);
    procedure ckbProdutoNaoBrindeClick(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
  protected
  private
    { Private declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function  ValidarCamposSelecao: Boolean;
    procedure InternoImpressao; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    { Public declarations }
  end;

var
  frmRelatorioCurvaABC: TfrmRelatorioCurvaABC;
  ControleValido: TWinControl;
implementation

{$R *.dfm}

{ TfrmRelatorioCurvaABC }

constructor TfrmRelatorioCurvaABC.Create(AOwner: TComponent);
begin
  inherited;
  dtmRelatorioCurvaABC := TdtmRelatorioCurvaABC.Create(Self);
  edtDataInicial.Text := datetostr(Date());
  edtDataFinal.Text := datetostr(Date());
  edtpercentualA.Text := '20';
  edtpercentualB.Text := '30';
  edtpercentualC.Text := '50';
  edtQuantidade.Text  := '100';
  sbnImprimir.Enabled := false;


  with fraConsultaIPPGCM do
  begin
    tstItemProduto.TabVisible := false;
    MultiplosFiltros := true;
//    fraConsultaItemProduto.TipoPesquisa := pesITEMPRODUTOS;
    fraConsultaProduto.TipoPesquisa     := pesPRODUTOS;
    fraConsultaGrupo.TipoPesquisa       := pesGRUPOS;
    fraConsultaClasse.TipoPesquisa      := pesCLASSES;
    fraConsultaMarcas.TipoPesquisa      := pesMARCAS;
  end;

  sbnSalvar.Enabled := false;

end;

destructor TfrmRelatorioCurvaABC.Destroy;
begin
  inherited;
  dtmRelatorioCurvaABC := nil;
end;

procedure TfrmRelatorioCurvaABC.sbnGerarClick(Sender: TObject);
begin
  inherited;
  if ValidarCamposSelecao then
    if dtmRelatorioCurvaABC.AbrirConsulta(
            rbnAnalisar.ItemIndex,
            rbnCurvaABC.ItemIndex,
            rbnAnalizarProdutos.ItemIndex,
            edtQuantidade.ValorSemFormatacao,
            strtodate(edtDataInicial.Text),
            strtodate(edtDataFinal.Text),
            edtpercentualA.ValorSemFormatacao,
            edtpercentualB.ValorSemFormatacao,
            edtpercentualC.ValorSemFormatacao,
            ckbProdutoEmLinha.Checked,
            ckbProdutoForadeLinha.Checked,
            ckbProdutoAtivo.Checked,
            ckbProdutoInativo.Checked,
            ckbProdutoComMontagem.Checked,
            ckbProdutoSemMontagem.Checked,
            ckbProdutoBrinde.Checked,
            ckbProdutoNaoBrinde.Checked,
            fraConsultaIPPGCM.fraConsultaProduto.edfCodigo.Text,
            fraConsultaIPPGCM.fraConsultaGrupo.edfCodigo.Text,
            fraConsultaIPPGCM.fraConsultaClasse.edfCodigo.Text,
            fraConsultaIPPGCM.fraConsultaMarcas.edfCodigo.Text,
            fraListaFiliais1.ListaSelecionada,
            fraListaGruposFiliais1.ListaSelecionada) then
    begin
       pgcParametros.ActivePage := tstDados;
       sbnImprimir.Enabled := true;
       sbnsalvar.Enabled := true;
    end
    else
    begin
      MensagemAviso(format(ctNENHUMREGISTROENCONTRADO,['registro']));
      sbnImprimir.Enabled := false;
      sbnsalvar.Enabled := false;      
    end;


end;

function TfrmRelatorioCurvaABC.ValidarCamposSelecao: Boolean;
begin
   result := ecvValida.Verify(tstParametros,ControleValido);
   if result then
   begin
     Result := (edtDataInicial.DataValida and edtDataFinal.DataValida);
     if Result then
     begin
      if (not dataembranco(edtDataInicial.text) and not dataembranco(edtDataFinal.text)) then
        Result:=StrToDate(edtDataInicial.Text) <= StrToDate(edtDataFinal.Text);
      if result then
      begin
        Result:=(not dataembranco(edtDataInicial.text) or not dataembranco(edtDataFinal.text));
        if Result then
        begin
          result := (edtpercentualA.ValorSemFormatacao +
                     edtpercentualB.ValorSemFormatacao +
                     edtpercentualC.ValorSemFormatacao) = 100;
          if not result then
          begin
            MensagemAviso('Os percentuais A, B e C devem fechar em 100%');
            edtpercentualA.SetFocus;
          end;
        end
        else
        begin
         MensagemAviso(ctDATAINVALIDA);
         edtDataInicial.SetFocus;
        end;
      end
      else
      begin
        MensagemAviso(ctDTINICIALMAIORDTFINAL);
        edtDataInicial.SetFocus;
      end;
     end;
   end;
end;

procedure TfrmRelatorioCurvaABC.ckbProdutoEmLinhaClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoForadeLinha.Checked and
     not ckbProdutoEmLinha.Checked then
     ckbProdutoforadelinha.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoForadeLinhaClick(
  Sender: TObject);
begin
  inherited;
  if not ckbProdutoForadeLinha.Checked and
     not ckbProdutoEmLinha.Checked then
     ckbProdutoEmLinha.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoAtivoClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoInativo.Checked and
     not ckbProdutoAtivo.Checked then
     ckbProdutoInativo.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoInativoClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoInativo.Checked and
     not ckbProdutoAtivo.Checked then
     ckbProdutoAtivo.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoComMontagemClick(
  Sender: TObject);
begin
  inherited;
  if not ckbProdutoComMontagem.Checked and
     not ckbProdutoSemMontagem.Checked then
     ckbProdutoSemMontagem.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoSemMontagemClick(
  Sender: TObject);
begin
  inherited;
  if not ckbProdutoComMontagem.Checked and
     not ckbProdutoSemMontagem.Checked then
     ckbProdutoComMontagem.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoBrindeClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoBrinde.Checked and
     not ckbProdutoNaoBrinde.Checked then
     ckbProdutoNaoBrinde.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.ckbProdutoNaoBrindeClick(Sender: TObject);
begin
  inherited;
  if not ckbProdutoBrinde.Checked and
     not ckbProdutoNaoBrinde.Checked then
     ckbProdutoBrinde.Checked := True;

end;

procedure TfrmRelatorioCurvaABC.InternoImpressao;
begin
  inherited;
  {$IFDEF MSWINDOWS}
  if MensagemSimNaoOpcaoCancelar('Deseja Exportar para o Excel','',False)= mryes then
  begin
    svdExportarExcel.FileName:= 'Relatório Curva ABC';
    if svdExportarExcel.Execute then
    begin
      dtmRelatorioCurvaABC.LocalGravacao:= svdExportarExcel.FileName;
      dtmRelatorioCurvaABC.GravarExcel;
    end;
  end
  else
    with dtmRelatorioCurvaABC do
      ImprimirRelatorio;
  {$ELSE }
  with dtmRelatorioCurvaABC do
    ImprimirRelatorio;
  {$ENDIF}
end;

procedure TfrmRelatorioCurvaABC.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
      vk_F5: if sbnSalvar.enabled then
              sbnSalvar.Click;
      vk_F6: sbnGerar.Click;
  end;
  inherited;

end;

procedure TfrmRelatorioCurvaABC.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  sbnsalvar.Enabled := false;
  dtmRelatorioCurvaABC.AtualizarResultadoCurvaABC;
end;

end.
