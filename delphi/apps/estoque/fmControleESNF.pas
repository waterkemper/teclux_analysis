 unit fmControleESNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmrelatoriopadrao, ExtCtrls, Buttons, ToolWin, ComCtrls,
  frintervalodatas, frselecaoaleatoria, StdCtrls, dmControleESNF, db,
  frconsultacodigo, frconsulta, cpdbfindcontrols, ctconstantes,
  cpeditioncontrolvalidation, cpdbradiogroup;

type
  TfrmControleESNF = class(TFrmRelatorioPadrao)
    gbxNaturezas: TGroupBox;
    fraSelecaoAleatoriaNaturezas: TfraSelecaoAleatoria;
    fraIntervaloDatas1: TfraIntervaloDatas;
    ecvValida: TtecEditionControlValidation;
    rgpRelatorios: TtecDBRadioGroup;
    rbnMercadoriaparaconserto: TtecRadioButton;
    rbnMercadoriaemDemonstracao: TtecRadioButton;
    rgpOrigem: TtecDBRadioGroup;
    rbnClienteouFornecedor: TtecRadioButton;
    rbnEmpresa: TtecRadioButton;
    rgpAgrupamento: TtecDBRadioGroup;
    rbnAGrupamentoCliente: TtecRadioButton;
    rbnAGrupamentoFornecedor: TtecRadioButton;
    gbxSituacaoSaldo: TGroupBox;
    ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE: TCheckBox;
    ckbSALDO_RETORNADO_DO_CONSERTO: TCheckBox;
    ckbSALDO_DISPONIVEL_NA_EMPRESA: TCheckBox;
    rbnMercadoriaTroca: TtecRadioButton;
    rbnConsignacao: TtecRadioButton;
    procedure fraSelecaoAleatoriaClientesqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaNaturezasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaNaturezasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaNaturezassbnProcuraClick(Sender: TObject);
    procedure rbnMercadoriaparaconsertoClick(Sender: TObject);
    procedure rbnMercadoriaemDemonstracaoClick(Sender: TObject);
    procedure rbnAGrupamentoClienteClick(Sender: TObject);
    procedure rbnAGrupamentoFornecedorClick(Sender: TObject);
    procedure rbnClienteouFornecedorClick(Sender: TObject);
    procedure rbnEmpresaClick(Sender: TObject);
    procedure rbnMercadoriaTrocaClick(Sender: TObject);
    procedure rbnConsignacaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtribuirDadosNaturezas(Found: Boolean);
    procedure AcionarPesquisaGradeNaturezas;
    procedure InternoImpressao; override;
    procedure DefinirParametrosdoSaldo;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;

  end;

var
  frmControleESNF: TfrmControleESNF;
  ControleValido       : TWinControl;

implementation

{$R *.dfm}

procedure TfrmControleESNF.AcionarPesquisaGradeNaturezas;
begin
  with fraSelecaoAleatoriaNaturezas do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Naturezas');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;

end;

procedure TfrmControleESNF.AtribuirDadosNaturezas(Found: Boolean);
begin

end;

constructor TfrmControleESNF.Create(Aowner: Tcomponent);
begin
  dtmControleESNF := TdtmControleESNF.Create(Self);
  inherited;

  fraSelecaoAleatoriaNaturezas.CampoParaLista := 'codigofiscal';

  rbnMercadoriaparaconsertoClick(self);
  with fraSelecaoAleatoriaNaturezas do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaNaturezas';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigonatureza';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraNaturezas;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesNATUREZAS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosNaturezas;
  end;

  fraIntervaloDatas1.edtDataInicial.Text := DateToStr(Date);
  fraIntervaloDatas1.edtDataFinal.Text := DateToStr(Date);
  rbnMercadoriaparaconserto.checked := true;
  rbnMercadoriaparaconsertoClick(nil);

end;

destructor TfrmControleESNF.Destroy;
begin

  inherited;
end;

procedure TfrmControleESNF.fraSelecaoAleatoriaClientesqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
var nc: integer;

begin
  inherited;
  with fraSelecaoAleatoriaNaturezas do
  begin
    qrySelecaoAleatoria.FieldByName('codigonatureza').DisplayLabel:= 'NATUREZA';
    qrySelecaoAleatoria.FieldByName('codigonatureza').DisplayWidth:= 10;
    qrySelecaoAleatoria.FieldByName('codigonatureza').ReadOnly    := False;
    qrySelecaoAleatoria.FieldByName('codigonatureza').Alignment   := taCenter;

    qrySelecaoAleatoria.FieldByName('descricaonatureza').DisplayLabel:= 'DESCRIÇÃO DA NATUREZA';
    qrySelecaoAleatoria.FieldByName('descricaonatureza').ReadOnly    := False;

    qrySelecaoAleatoria.FieldByName('codigofiscal').DisplayLabel := 'CFOP';
    qrySelecaoAleatoria.FieldByName('codigofiscal').DisplayWidth := 8;
    qrySelecaoAleatoria.FieldByName('codigofiscal').ReadOnly     := False;
    qrySelecaoAleatoria.FieldByName('codigofiscal').Alignment    := taCenter;

//    qrySelecaoAleatoria.FieldByName('descricaocodigofiscal').DisplayLabel := 'DESCRIÇÃO DO CÓDIGO FISCAL';
//    qrySelecaoAleatoria.FieldByName('descricaocodigofiscal').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('tipo').DisplayLabel:= 'TIPO';
    qrySelecaoAleatoria.FieldByName('tipo').ReadOnly    := False;
    qrySelecaoAleatoria.FieldByName('tipo').Alignment   := taCenter;

//    qrySelecaoAleatoria.Append;
//    qrySelecaoAleatoria.Post;

    with dbgSelecaoAleatoria do
        for nc:= 0 to 3 do with Columns[nc].Title do begin
            Alignment:= taCenter;
            Font.Name:= 'helvetica';
            Font.Height:= -9;
        end;
  end;

end;

procedure TfrmControleESNF.fraSelecaoAleatoriaNaturezasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeNaturezas;
end;

procedure TfrmControleESNF.fraSelecaoAleatoriaNaturezasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaNaturezas.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaNaturezas.ConsultaSelecaoAleatoria.CtrlOn then
                      AcionarPesquisaGradeNaturezas
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaNaturezas.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaNaturezas.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                 if not fraSelecaoAleatoriaNaturezas.ConsultaSelecaoAleatoria.qryProcuraNaturezas.IsEmpty then
                    AtribuirDadosNaturezas(true)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaNaturezas.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaNaturezas.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;
 
end;

procedure TfrmControleESNF.fraSelecaoAleatoriaNaturezassbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeNaturezas;
end;

procedure TfrmControleESNF.InternoImpressao;
begin
  inherited;
  if ecvValida.Verify(fraIntervaloDatas1.gbxPeriodo, ControleValido) then
    dtmControleESNF.ImprimirRelatorio(fraIntervaloDatas1.edtdatainicial.Text, fraIntervaloDatas1.edtdatafinal.Text,
                                            fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria,
                                            rgpRelatorios.ItemIndex,
                                            rgpOrigem.ItemIndex,
                                            rgpAgrupamento.ItemIndex,
                                            ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Checked,
                                            ckbSALDO_RETORNADO_DO_CONSERTO.Checked,
                                            ckbSALDO_DISPONIVEL_NA_EMPRESA.Checked);

end;

procedure TfrmControleESNF.rbnMercadoriaparaconsertoClick(Sender: TObject);
begin
  inherited;
  rbnClienteouFornecedor.Enabled := true;
  
  if rbnClienteouFornecedor.checked then
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := ' and (mod(n.codigofiscal,1000) in (915,916) and coalesce(n.interno,false) and coalesce(n.mercadoriadocliente,false)) '
  else
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := ' and (mod(n.codigofiscal,1000) in (915,916) and coalesce(n.interno,false) and not coalesce(n.mercadoriadocliente,false)) ';

  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Close;
  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Open;
  DefinirParametrosdoSaldo;
end;

procedure TfrmControleESNF.rbnMercadoriaemDemonstracaoClick(
  Sender: TObject);
begin
  inherited;
  rbnClienteouFornecedor.Enabled := true;

  if rbnClienteouFornecedor.checked then
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := 'and mod(n.codigofiscal,1000) in (912,913) and coalesce(n.interno,false) and coalesce(n.mercadoriadocliente,false)'
  else
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := 'and mod(n.codigofiscal,1000) in (912,913) and coalesce(n.interno,false) and not coalesce(n.mercadoriadocliente,false)';

  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Close;
  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Open;
  DefinirParametrosdoSaldo;
end;

procedure TfrmControleESNF.rbnAGrupamentoClienteClick(Sender: TObject);
begin
  inherited;
  DefinirParametrosdoSaldo;
end;

procedure TfrmControleESNF.rbnAGrupamentoFornecedorClick(Sender: TObject);
begin
  inherited;
  DefinirParametrosdoSaldo;
end;

procedure TfrmControleESNF.rbnClienteouFornecedorClick(Sender: TObject);
begin
  inherited;
  rbnMercadoriaTroca.Enabled := false;
  DefinirParametrosdoSaldo;
  if rbnMercadoriaparaconserto.checked then
    rbnMercadoriaparaconsertoClick(sender)
  else
  if rbnMercadoriaemDemonstracao.Checked then
    rbnMercadoriaemDemonstracaoClick(sender)
  else
  if rbnMercadoriaTroca.Checked then
    rbnMercadoriaTrocaClick(Sender)
  else
  if rbnConsignacao.checked then
    rbnConsignacaoClick(Sender)
end;

procedure TfrmControleESNF.rbnEmpresaClick(Sender: TObject);
begin
  inherited;
  rbnMercadoriaTroca.Enabled := true;
  DefinirParametrosdoSaldo;
  if rbnMercadoriaparaconserto.checked then
    rbnMercadoriaparaconsertoClick(sender)
  else
  if rbnMercadoriaemDemonstracao.Checked then
    rbnMercadoriaemDemonstracaoClick(sender)
  else
  if rbnMercadoriaTroca.Checked then
    rbnMercadoriaTrocaClick(Sender)
  else
  if rbnConsignacao.checked then
    rbnConsignacaoClick(Sender);
end;

procedure TfrmControleESNF.DefinirParametrosdoSaldo;
begin
  if rbnMercadoriaparaconserto.checked then
  begin
    rbnClienteouFornecedor.Caption := 'Cliente';
    rbnEmpresa.caption := 'Empresa';
    if rbnClienteouFornecedor.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Cliente';
      rbnAGrupamentoFornecedor.caption := 'Fornecedor';
      if rbnAGrupamentoCliente.Checked then
      begin
        ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para o cliente';
        ckbSALDO_RETORNADO_DO_CONSERTO.Caption := 'Retornado do conserto';
        ckbSALDO_DISPONIVEL_NA_EMPRESA.Caption := 'Disponível na empresa';

        ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
        ckbSALDO_RETORNADO_DO_CONSERTO.visible := True;
        ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := True;
      end
      else
      if rbnAGrupamentoFornecedor.Checked then
      begin
        ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para a empresa';
        ckbSALDO_RETORNADO_DO_CONSERTO.Caption := 'Retornado do conserto';

        ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
        ckbSALDO_RETORNADO_DO_CONSERTO.visible := True;
        ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
      end;
    end
    else
    if rbnEmpresa.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Filial';
      rbnAGrupamentoFornecedor.caption := 'Fornecedor';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para a empresa';
      ckbSALDO_RETORNADO_DO_CONSERTO.Caption := 'Retornado do conserto';

      if rbnAGrupamentoCliente.Checked then
      begin
        ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
        ckbSALDO_RETORNADO_DO_CONSERTO.visible := True;
        ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
      end
      else
      if rbnAGrupamentoFornecedor.Checked then
      begin
        ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
        ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
        ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
      end;

    end;

  end
  else
  if rbnMercadoriaemDemonstracao.Checked then
  begin
    rbnClienteouFornecedor.Caption := 'Fornecedor';
    rbnEmpresa.caption := 'Empresa';

    if rbnClienteouFornecedor.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Fornecedor';
      rbnAGrupamentoFornecedor.caption := 'Filial';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para o fornecedor';

      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
      ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
      ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
    end
    else
    if rbnEmpresa.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Cliente';
      rbnAGrupamentoFornecedor.caption := 'Filial';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para a empresa';

      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
      ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
      ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
    end;

  end
  else
  if rbnMercadoriaTroca.Checked then
  begin
    rbnClienteouFornecedor.Caption := 'Fornecedor';
    rbnEmpresa.caption := 'Empresa';

    if rbnClienteouFornecedor.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Fornecedor';
      rbnAGrupamentoFornecedor.caption := 'Filial';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para o fornecedor';

      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
      ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
      ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
    end
    else
    if rbnEmpresa.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Fornecedor';
      rbnAGrupamentoFornecedor.caption := 'Filial';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para a empresa';

      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
      ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
      ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
    end;

  end
  else
  if rbnConsignacao.Checked then
  begin
    rbnClienteouFornecedor.Caption := 'Fornecedor';
    rbnEmpresa.caption := 'Empresa';

    if rbnClienteouFornecedor.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Fornecedor';
      rbnAGrupamentoFornecedor.caption := 'Filial';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para o fornecedor';

      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
      ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
      ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
    end
    else
    if rbnEmpresa.Checked then
    begin
      rbnAGrupamentoCliente.Caption := 'Cliente';
      rbnAGrupamentoFornecedor.caption := 'Filial';
      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.Caption := 'A devolver para a empresa';

      ckbSALDO_A_DEVOLVER_PARA_O_CLIENTE.visible := True;
      ckbSALDO_RETORNADO_DO_CONSERTO.visible := False;
      ckbSALDO_DISPONIVEL_NA_EMPRESA.visible := False;
    end;
  end;

end;

procedure TfrmControleESNF.rbnMercadoriaTrocaClick(Sender: TObject);
begin
  inherited;
  {
  if rbnClienteouFornecedor.checked then
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := ' and (mod(n.codigofiscal,1000) in (949,949) and coalesce(n.interno,false) and coalesce(n.mercadoriadocliente,false)) '
  else
  }
  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := ' and (mod(n.codigofiscal,1000) in (949,949) and coalesce(n.interno,false) and not coalesce(n.mercadoriadocliente,false)) ';

  rbnClienteouFornecedor.Checked := false;
  rbnClienteouFornecedor.Enabled := false;
  rbnEmpresa.Checked := true;

  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Close;
  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Open;
  DefinirParametrosdoSaldo;

end;

procedure TfrmControleESNF.rbnConsignacaoClick(Sender: TObject);
begin
  inherited;
  rbnClienteouFornecedor.Enabled := true;
  rbnEmpresa.Enabled := true;

  if rbnClienteouFornecedor.checked then
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := 'and mod(n.codigofiscal,1000) in (917,918) and coalesce(n.interno,false) and coalesce(n.mercadoriadocliente,false)'
  else
    fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.MacroByName('SQLListas').asstring := 'and mod(n.codigofiscal,1000) in (917,918) and coalesce(n.interno,false) and not coalesce(n.mercadoriadocliente,false)';

  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Close;
  fraSelecaoAleatoriaNaturezas.qrySelecaoAleatoria.Open;
  DefinirParametrosdoSaldo;

end;

end.


