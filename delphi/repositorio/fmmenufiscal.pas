unit fmmenufiscal;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cpnumero, cpdata, ExtCtrls, Buttons, fmnavcontroles,
  ComCtrls, clecf;

type
  TfrmMenuFiscal = class(TfrmNavControles)
    rgpFonteDados: TRadioGroup;
    rgpDestino: TRadioGroup;
    gbxFaixas: TGroupBox;
    lblDe: TLabel;
    lblAte: TLabel;
    pnlDatas: TPanel;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    pnlCupons: TPanel;
    edtCupomInicial: TEditNumero;
    edtCupomFinal: TEditNumero;
    btnLX: TButton;
    btnEspelhoMFD: TButton;
    btnArqMFD: TButton;
    btnEstoque: TButton;
    btnMovimentoECF: TButton;
    btnMeiosPagto: TButton;
    btnIdentificaPAF: TButton;
    gbxComandos: TGroupBox;
    SaveDialog1: TSaveDialog;
    gbxArquivoSaida: TGroupBox;
    lblArquivoSaida: TLabel;
    btnTabIndiceTecnicoProducao: TButton;
    btnReducaoZ: TButton;
    btnParamConfig: TButton;
    btnArqMFBin: TButton;
    btnArqMFDBin: TButton;
    VendasDoPeriodo: TButton;
    LeituraMemoriaFiscal: TButton;
    btnFiscoEstoque: TButton;
    btnFiscoReducaoZ: TButton;
    btnVendasIdentificadas: TButton;
    btnRequisicoesExternasRegistradas: TButton;
    btnTransmitiArquivosRequisitoXXVI: TButton;
    procedure rgpFonteDadosClick(Sender: TObject);
    procedure btnLXClick(Sender: TObject);
    procedure btnLMFCClick(Sender: TObject);
    procedure btnLMFSClick(Sender: TObject);
    procedure btnEspelhoMFDClick(Sender: TObject);
    procedure btnArqMFDClick(Sender: TObject);
    procedure btnTabProdClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure btnMovimentoECFClick(Sender: TObject);
    procedure btnMeiosPagtoClick(Sender: TObject);
    procedure btnIdentificaPAFClick(Sender: TObject);
    procedure btnTabIndiceTecnicoProducaoClick(Sender: TObject);
    procedure btnReducaoZClick(Sender: TObject);
    procedure btnVendasPeriodoSintegraClick(Sender: TObject);
    procedure btnVendasPeriodoEFDClick(Sender: TObject);
    procedure cmbECFsChange(Sender: TObject);
    procedure btnParamConfigClick(Sender: TObject);
    procedure btnLMFC1704Click(Sender: TObject);
    procedure btnArqMFBinClick(Sender: TObject);
    procedure btnArqMFDBinClick(Sender: TObject);
    procedure VendasDoPeriodoClick(Sender: TObject);
    procedure LeituraMemoriaFiscalClick(Sender: TObject);
    procedure btnFiscoEstoqueClick(Sender: TObject);
    procedure btnFiscoReducaoZClick(Sender: TObject);
    procedure btnVendasIdentificadasClick(Sender: TObject);
    procedure btnRequisicoesExternasRegistradasClick(Sender: TObject);
    procedure btnTransmitiArquivosRequisitoXXVIClick(Sender: TObject);
  private

  private
    FArquivoSaida: String;
    FSerieECFSelecionado: String;
    FCodigoECFSelecionado: String;
    procedure carregaECFs;
    function InformarArquivoSaida(nome:String =  'retorno.txt'): Boolean;


    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;

    { Public declarations }
  end;

var
  frmMenuFiscal: TfrmMenuFiscal;

implementation

uses
  dmmenufiscal, biblio, ctconstantes, inifiles, fmOpcaoEstoqueMenuFiscal,fmOpcaoVendasPeriodoMenuFiscal
  ,fmOpcaoLeituraMemoriaFiscalMenuFiscal, fmOpcaoVendasIdentificadas;

{$R *.dfm}

procedure TfrmMenuFiscal.rgpFonteDadosClick(Sender: TObject);
begin
  gbxFaixas.Caption := rgpFonteDados.Items[rgpFonteDados.ItemIndex] + 's';
  case rgpFonteDados.ItemIndex of
    0 : begin
          pnlDatas.BringToFront;
        end;
    1 : begin
          pnlCupons.BringToFront;
        end;
    2 : begin
          pnlCupons.BringToFront;
        end;
  end;
end;

constructor TfrmMenuFiscal.Create(AOwner: TComponent);
begin
  dtmMenuFiscal := TdtmMenuFiscal.Create(Self);
  inherited;
  carregaECFs;
end;

procedure TfrmMenuFiscal.btnLXClick(Sender: TObject);
begin
  inherited;
  dtmMenuFiscal.LX;
end;

procedure TfrmMenuFiscal.btnLMFCClick(Sender: TObject);
begin
  inherited;
  if rgpFonteDados.ItemIndex = 0 then // SELECAO POR PERÍODO
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, False)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, FArquivoSaida, False) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
  if rgpFonteDados.ItemIndex = 1 then // SELECAO POR NUMERO DE REDUCOES ;
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, False)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, FArquivoSaida, False) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
    ShowMessage('Fonte de Dados Incorreta!')
end;

procedure TfrmMenuFiscal.btnLMFSClick(Sender: TObject);
begin
  inherited;
  if rgpFonteDados.ItemIndex = 0 then // SELECAO POR PERÍODO
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, True)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFData(edtPeriodoInicial.Text,edtPeriodoFinal.Text, FArquivoSaida, True) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
  if rgpFonteDados.ItemIndex = 1 then // SELECAO POR NUMERO DE REDUCOES ;
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, True)
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFReducao(edtCupomInicial.Text,edtCupomFinal.Text, FArquivoSaida, True) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end
  else
    ShowMessage('Fonte de Dados Incorreta!')
end;

procedure TfrmMenuFiscal.btnEspelhoMFDClick(Sender: TObject);
begin
  inherited;
  if rgpDestino.ItemIndex = 0 then
    ShowMessage('Saída Incorreta!')
  else if rgpFonteDados.ItemIndex = 1 then
    ShowMessage('Fonte de Dados Incorreta!')
  else if InformarArquivoSaida then
  begin
    case rgpFonteDados.ItemIndex of
      0 : // SELECAO POR DATA
          if dtmMenuFiscal.EspelhoMFD(StrToDate(edtPeriodoInicial.Text),StrToDate(edtPeriodoFinal.Text), FArquivoSaida) then
            ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
          else
            ShowMessage(ctFUNCAONAOSUPORTADAECF);
      2 : // SELECAO POR NUMERO DE OPERACAO
          if dtmMenuFiscal.EspelhoMFD(StrToInt(edtCupomInicial.Text),StrToInt(edtCupomFinal.Text), FArquivoSaida) then
            ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
          else
            ShowMessage(ctFUNCAONAOSUPORTADAECF);
    end;
  end;
end;

procedure TfrmMenuFiscal.btnArqMFDClick(Sender: TObject);
begin
  inherited;
  if rgpDestino.ItemIndex = 0 then
    ShowMessage('Saída Incorreta!')
  else if rgpFonteDados.ItemIndex = 1 then
    ShowMessage('Fonte de Dados Incorreta!')
  else if InformarArquivoSaida then
  begin
    case rgpFonteDados.ItemIndex of
      0 : // SELECAO POR DATA
          if dtmMenuFiscal.ArquivoMFD(StrToDate(edtPeriodoInicial.Text),StrToDate(edtPeriodoFinal.Text), FArquivoSaida) then
            ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
          else
            ShowMessage(ctFUNCAONAOSUPORTADAECF);
      2 : // SELECAO POR NUMERO DE OPERACAO
          if dtmMenuFiscal.ArquivoMFD(StrToInt(edtCupomInicial.Text),StrToInt(edtCupomFinal.Text), FArquivoSaida) then
            ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
          else
            ShowMessage(ctFUNCAONAOSUPORTADAECF);
    end;
  end;
end;

procedure TfrmMenuFiscal.btnTabProdClick(Sender: TObject);
begin
  inherited;
  if rgpDestino.ItemIndex = 0 then
    ShowMessage('Saída Incorreta!')
  else if InformarArquivoSaida then
    if dtmMenuFiscal.TabelaProdutos(FArquivoSaida) then
     ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');
end;

procedure TfrmMenuFiscal.btnEstoqueClick(Sender: TObject);
begin
  inherited;

  if InformarArquivoSaida then
  begin
    frmOpcaoEstoqueMenuFiscal := tfrmOpcaoEstoqueMenuFiscal.create(frmOpcaoEstoqueMenuFiscal);
    frmOpcaoEstoqueMenuFiscal.ShowModal;
    if frmOpcaoEstoqueMenuFiscal.ModalResult = mrOK then
    begin
    if dtmMenuFiscal.RegistrosPafEcf(FArquivoSaida,
        frmOpcaoEstoqueMenuFiscal.rbnOpcaoEstoque.ItemIndex,
        frmOpcaoEstoqueMenuFiscal.fraSelecaoAleatoriaEstoqueMenuFiscal.StringSelecionada,strToDate(frmOpcaoEstoqueMenuFiscal.edtPeriodoInicial.Text),StrToDate(frmOpcaoEstoqueMenuFiscal.edtPeriodoFinal.Text)) then
          ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');

    end;
  end;
end;

function TfrmMenuFiscal.InformarArquivoSaida(nome:String): Boolean;
var
  ArqSaida: TIniFile;
  Arquivo: String;
begin
  Result := true;
  Arquivo := ExtractFilePath(Application.ExeName) + nome;
  if FileExists(Arquivo) then
    DeleteFile(Arquivo);
  ArqSaida := TIniFile.Create(Arquivo);
  try
    try
      ArqSaida.UpdateFile;
    except
      Result := False;
    end;
  finally
    ArqSaida.Free;
  end;
  if Result then
  begin
    FArquivoSaida := Arquivo;
    lblArquivoSaida.Caption := Arquivo;
  end;
end;

procedure TfrmMenuFiscal.btnMovimentoECFClick(Sender: TObject);
begin
  inherited;
  {if edtPeriodoInicial.Text='' then
    ShowMessage('Informe a data inicial!')
  else
  if edtPeriodoFinal.Text='' then
    ShowMessage('Informe a data final!')
  else
  if cmbECFs.ItemIndex < 0 then
  begin
    ShowMessage('Informe o ECF!');
    cmbECFs.SetFocus;
  end
  else
  if rgpDestino.ItemIndex = 0 then
    ShowMessage('Saída Incorreta!')
  else
  if rgpFonteDados.ItemIndex <> 0 then
    ShowMessage('Fonte de Dados Incorreta!')
  else
  begin

    FArquivoSaida := ExtractFilePath(Application.ExeName) + 'PAF-ECF\MOVECF';

    if not DirectoryExists(FArquivoSaida) then
      if not CreateDir(FArquivoSaida) then
      raise Exception.Create('Impossível criar o diretório '+FArquivoSaida);

    FArquivoSaida := FArquivoSaida+'\'+
                     ECFPadrao.CNIEE +
                     cortaPreencheString(FSerieECFSelecionado,'0',14,False) +
                     FormatDateTime('ddmmyyyy',dtmMenuFiscal.DataServidor)+
                     '.txt';

   lblArquivoSaida.Caption := FArquivoSaida;

   // SELECAO POR DATA
   if dtmMenuFiscal.MovimentosECF(StrToDate(edtPeriodoInicial.Text),
                                  StrToDate(edtPeriodoFinal.Text),
                                  //FSerieECFSelecionado,
                                  FCodigoECFSelecionado,
                                  FArquivoSaida) then
     ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');
  end;}
end;

procedure TfrmMenuFiscal.btnMeiosPagtoClick(Sender: TObject);
begin
  inherited;
  if (trim(edtPeriodoInicial.Text) <> '') and edtPeriodoInicial.DataValida then
    if (trim(edtPeriodoFinal.Text) <> '') and edtPeriodoFinal.DataValida then
      dtmMenuFiscal.MeiosPagto(StrToDate(edtPeriodoInicial.Text),
                             StrToDate(edtPeriodoFinal.Text))
    else
    begin
      MensagemAviso('Data inválida!');
      edtPeriodoFinal.SetFocus;
    end
  else
  begin
    MensagemAviso('Data inválida!');
    edtPeriodoInicial.SetFocus;
  end;
end;

procedure TfrmMenuFiscal.btnIdentificaPAFClick(Sender: TObject);
begin
  inherited;
  dtmMenuFiscal.IdentificacaoPAFECF;
end;

procedure TfrmMenuFiscal.btnTabIndiceTecnicoProducaoClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Este PAF-ECF não executa funções de baixa de estoque com base em índices técnicos de produção, não podendo ser utilizado por estabelecimento que necessite deste recurso.');
end;

procedure TfrmMenuFiscal.btnReducaoZClick(Sender: TObject);
begin
  inherited;
  dtmMenuFiscal.ReducaoZ;
    
end;

procedure TfrmMenuFiscal.btnVendasPeriodoSintegraClick(Sender: TObject);
begin
  inherited;
  if edtPeriodoInicial.Text='' then
    ShowMessage('Informe a data inicial!')
  else
  if edtPeriodoFinal.Text='' then
    ShowMessage('Informe a data final!')
  else
  if rgpDestino.ItemIndex = 0 then
    ShowMessage('Saída Incorreta!')
  else
  if rgpFonteDados.ItemIndex <> 0 then
    ShowMessage('Fonte de Dados Incorreta!')
  else
  begin

    FArquivoSaida := ExtractFilePath(Application.ExeName);

    if not DirectoryExists(FArquivoSaida) then
      if not CreateDir(FArquivoSaida) then
      raise Exception.Create('Impossível criar o diretório '+FArquivoSaida);

    FArquivoSaida := FArquivoSaida+
                     'UNS0382014'+FormatDateTime('DDMMYYYYhhmmss',now())+'.txt';

   lblArquivoSaida.Caption := FArquivoSaida;

   // SELECAO POR DATA
   if dtmMenuFiscal.VendasdoPeriodo_Sintegra(StrToDate(edtPeriodoInicial.Text),
                                  StrToDate(edtPeriodoFinal.Text),
                                  edtPeriodoInicial.text,
                                  FArquivoSaida) then
     ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');
  end;

end;

procedure TfrmMenuFiscal.btnVendasPeriodoEFDClick(Sender: TObject);
begin
  inherited;
  if edtPeriodoInicial.Text='' then
    ShowMessage('Informe a data inicial!')
  else
  if edtPeriodoFinal.Text='' then
    ShowMessage('Informe a data final!')
  else
  if rgpDestino.ItemIndex = 0 then
    ShowMessage('Saída Incorreta!')
  else
  if rgpFonteDados.ItemIndex <> 0 then
    ShowMessage('Fonte de Dados Incorreta!')
  else
  begin

    FArquivoSaida := ExtractFilePath(Application.ExeName);

    if not DirectoryExists(FArquivoSaida) then
      if not CreateDir(FArquivoSaida) then
      raise Exception.Create('Impossível criar o diretório '+FArquivoSaida);

    FArquivoSaida := FArquivoSaida+
                     'UNS0382014'+FormatDateTime('DDMMYYYYhhmmss',now())+'.txt';


   lblArquivoSaida.Caption := FArquivoSaida;

   // SELECAO POR DATA
   if dtmMenuFiscal.VendasdoPeriodo_EFD(StrToDate(edtPeriodoInicial.Text),
                                  StrToDate(edtPeriodoFinal.Text),
                                  FArquivoSaida) then
     ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');
  end;
end;

procedure TfrmMenuFiscal.carregaECFs;
var
  ArqECF: TIniFile;
  i: Integer;
begin
{  cmbECFs.Items.Clear;
  if FileExists(NomeArquivoECFs) then
  begin
    ArqECF := TIniFile.Create(NomeArquivoECFs);
    try
      i := 1;
      while i <= 50 do
      begin
        if ArqECF.SectionExists(intTostr(i)) then
        begin
          cmbECFs.Items.Append(inttostr(i)+';'+Descriptografar(ArqECF.ReadString(inttostr(i),'marca','')) + ';' +
                            Descriptografar(ArqECF.ReadString(inttostr(i),'serie','')));
        end;
        inc(i);
      end;
    finally
      ArqECF.Free;
    end;
  end;}
end;

procedure TfrmMenuFiscal.cmbECFsChange(Sender: TObject);
var
  ArqECF: TIniFile;
  Separador: Integer;
begin
{  inherited;
  if FileExists(NomeArquivoECFs) then
  begin
    ArqECF := TIniFile.Create(NomeArquivoECFs);
    try
      Separador := pos(';',cmbECFs.Text)-1;
      FCodigoECFSelecionado:=copy(cmbECFs.Text,0,Separador);
      Separador := pos(';',cmbECFs.Text)+1;
      fSerieECFSelecionado := copy(cmbECFs.Text,Separador,length(cmbECFs.Text));
      Separador := pos(';',FSerieECFSelecionado)+1;
      fSerieECFSelecionado := copy(FSerieECFSelecionado,Separador,length(cmbECFs.Text));
      //

    finally
      ArqECF.Free;
    end;
  end;}
end;

procedure TfrmMenuFiscal.btnParamConfigClick(Sender: TObject);
begin
  inherited;
  dtmMenuFiscal.ParametrosConfiguracao;
end;

procedure TfrmMenuFiscal.btnLMFC1704Click(Sender: TObject);
begin
  inherited;
  if rgpFonteDados.ItemIndex = 0 then // SELECAO POR PERÍODO
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      ShowMessage('Saida Incorreta!')
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFCotepeData1704(edtPeriodoInicial.Text,edtPeriodoFinal.Text, FArquivoSaida) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
        {
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF)};
  end
  else
  if rgpFonteDados.ItemIndex = 1 then // SELECAO POR NUMERO DE REDUCOES ;
  begin
    if rgpDestino.ItemIndex = 0 then // SAIDA NO ECF
      ShowMessage('Saida Incorreta!')
    else if InformarArquivoSaida then
      if dtmMenuFiscal.LMFReducaoCotepe1704(edtCupomInicial.Text,edtCupomFinal.Text, FArquivoSaida) then
        ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
        {
      else
        ShowMessage(ctFUNCAONAOSUPORTADAECF)};
  end
  else
    ShowMessage('Fonte de Dados Incorreta!')
end;
procedure TfrmMenuFiscal.btnArqMFBinClick(Sender: TObject);
begin
  inherited;
//  FArquivoSaida := 'DR0509BR000000189654_20161025_09381032_MF.MF';

  if InformarArquivoSaida(dtmMenuFiscal.NomedoArquivoconformePAF0204['MF']) then
  begin
    if dtmMenuFiscal.ArquivoMF(FArquivoSaida) then
      ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
    else
      ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end;
end;

procedure TfrmMenuFiscal.btnArqMFDBinClick(Sender: TObject);
begin
  inherited;
  if InformarArquivoSaida(dtmMenuFiscal.NomedoArquivoconformePAF0204['MFD']) then
  begin
    if dtmMenuFiscal.ArquivoMFDBinario(FArquivoSaida) then
      ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!')
    else
      ShowMessage(ctFUNCAONAOSUPORTADAECF);
  end;
end;

procedure TfrmMenuFiscal.VendasDoPeriodoClick(Sender: TObject);
begin
  inherited;
    frmOpcaoVendasPeriodoMenuFiscal := TfrmOpcaoVendasPeriodoMenuFiscal.create(frmOpcaoVendasPeriodoMenuFiscal);
    frmOpcaoVendasPeriodoMenuFiscal.ShowModal;
    if frmOpcaoVendasPeriodoMenuFiscal.ModalResult = mrOK then
    begin
      FArquivoSaida := ExtractFilePath(Application.ExeName);

      if not DirectoryExists(FArquivoSaida) then
        if not CreateDir(FArquivoSaida) then
        raise Exception.Create('Impossível criar o diretório '+FArquivoSaida);

      FArquivoSaida := FArquivoSaida+
                       'UNS0382014'+FormatDateTime('DDMMYYYYhhmmss',now())+'.txt';

     lblArquivoSaida.Caption := FArquivoSaida;
     case frmOpcaoVendasPeriodoMenuFiscal.rbnOpcaoVendasPeriodo.ItemIndex of
     0: dtmMenuFiscal.VendasdoPeriodo_Sintegra(strtodate(frmOpcaoVendasPeriodoMenuFiscal.edtPeriodoInicial.Text),
                                               StrToDate(frmOpcaoVendasPeriodoMenuFiscal.edtPeriodoFinal.text),
                                               frmOpcaoVendasPeriodoMenuFiscal.EdtDataInventario.text,
                                               FArquivoSaida);
     1: dtmMenuFiscal.VendasdoPeriodo_EFD(strtodate(frmOpcaoVendasPeriodoMenuFiscal.edtPeriodoInicial.Text),StrToDate(frmOpcaoVendasPeriodoMenuFiscal.edtPeriodoFinal.text),FArquivoSaida);
     end;
     ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');
   end;
end;

procedure TfrmMenuFiscal.LeituraMemoriaFiscalClick(Sender: TObject);
begin
  inherited;
     frmOpcaoLeituraMemoriaFiscalMenuFiscal := TfrmOpcaoLeituraMemoriaFiscalMenuFiscal.create(frmOpcaoLeituraMemoriaFiscalMenuFiscal);
    frmOpcaoLeituraMemoriaFiscalMenuFiscal.ShowModal;
end;

procedure TfrmMenuFiscal.btnFiscoEstoqueClick(Sender: TObject);
begin
  inherited;

  if not DataEmBranco(edtPeriodoInicial.Text) and not DataEmBranco(edtPeriodoFinal.Text) then
    dtmMenuFiscal.BlocoXEstoqueMesAnterior(nil){(StrToDate(edtPeriodoInicial.Text),StrToDate(edtPeriodoFinal.Text))}
  else
    dtmMenuFiscal.BlocoXEstoqueMesAnterior(nil){(now(),now())}

end;



procedure TfrmMenuFiscal.btnFiscoReducaoZClick(Sender: TObject);
begin
  inherited;
  case rgpFonteDados.ItemIndex of
    0 : // SELECAO POR DATA
        begin
{          if not DataEmBranco(edtPeriodoInicial.Text) and not DataEmBranco(edtPeriodoFinal.Text) then}
            dtmMenuFiscal.BlocoXReducaoZ(nil) {(rgpFonteDados.itemindex, StrToDate(edtPeriodoInicial.Text),StrToDate(edtPeriodoFinal.Text), 0,0)};
        end;
    1 : // SELECAO POR NUMERO DE REDUÇÃO
        begin
{          if (edtCupomInicial.Text<>'') and (edtCupomFinal.Text<>'') then}
            dtmMenuFiscal.BlocoXReducaoZ(nil){(rgpFonteDados.itemindex, date(), Date(), edtCupomInicial.ValorSemFormatacao, edtCupomFinal.ValorSemFormatacao)};
        end;
  end;
end;

procedure TfrmMenuFiscal.btnVendasIdentificadasClick(Sender: TObject);
begin
  inherited;

  if InformarArquivoSaida then
  begin
    frmOpcaoVendasIdentificadas := TfrmOpcaoVendasIdentificadas.create(frmOpcaoVendasIdentificadas);
    frmOpcaoVendasIdentificadas.ShowModal;
    if frmOpcaoVendasIdentificadas.ModalResult = mrOK then
    begin
     if dtmMenuFiscal.VendasIdentificadas(FArquivoSaida,
                                         frmOpcaoVendasIdentificadas.edtMesInicial.text,
                                         frmOpcaoVendasIdentificadas.edtMesFinal.text,
                                         frmOpcaoVendasIdentificadas.edtCPFouCNPJ.text) then
                                         
          ShowMessage('Arquivo ' + FArquivoSaida + ' gerado com sucesso!');
    end;
  end;

end;

procedure TfrmMenuFiscal.btnRequisicoesExternasRegistradasClick(
  Sender: TObject);
begin
  inherited;
  ShowMessage('o PAF-ECF não suporta esta função.');
end;

procedure TfrmMenuFiscal.btnTransmitiArquivosRequisitoXXVIClick(Sender: TObject);
begin
  inherited;
  ShowMessage('o PAF-ECF não suporta esta função.');
end;

end.
