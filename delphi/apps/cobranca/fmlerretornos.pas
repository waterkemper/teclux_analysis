unit fmLerRetornos;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, cpdbgrid, Mask, cpdbfindcontrols, DBCtrls,
  cpdbtext,  Buttons, ActnList, 
  ComCtrls, DB, ZQuery, ZPgSqlQuery,
  cpquery, FileCtrl, cpnumero, ToolWin, ExtCtrls,

//CLX
  Variants,
  //Repositorio
  fmajudabt, QCheckLst,
  cpdata, cpeditioncontrolvalidation, ctconstantes, biblio,
  fmconsultabasica, fmconsultaporcampo,  frconsultadadoscliente,
  frconsultadadosclientecod, dmconsultadadoscliente,
  Windows,
  // Constantes
  clparametrossistema,
  // Componenetes
  cpdatasource,  cptexto,
  fmcadastropadrao,fmrelatoriopadrao, cpcep, AdvSpin, IniFiles,
  cppagecontrol, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, frintervalodatas,
  AsgListb, asgcheck, Menus, AdvMenus, tmsAdvGridExcel, AsgFindDialog;

type
  TfrmLerRetornos = class(TfrmAjudaBt)
    dbgParcelas: TtecDBGrid;
    gbxNomeArquivo: TGroupBox;
    sbnArquivo: TSpeedButton;
    lblArquivo: TLabel;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    dlgLerRetornos: TOpenDialog;
    sbnAtualizarParcelas: TSpeedButton;
    plnFundoJanela: TPanel;
    gbxFilial: TGroupBox;
    gbxConta: TGroupBox;
    edfConta: TtecDbEditFind;
    dtxDigito: TtecDBText;
    Label3: TLabel;
    gbxSiglaBanco: TGroupBox;
    dtxSigla: TtecDBText;
    gbxNomeAgencia: TGroupBox;
    dtxNomeAgencia: TtecDBText;
    edfFiliais: TtecDbEditFind;
    dtxFilial: TtecDBText;
    sbnProcurarConta:  TSpeedButton;
    sbnProcurarFilial: TSpeedButton;
    pnlParametros: TPanel;
    pnlCabecalhoParcelasRetornadas: TPanel;
    gbxContrato: TGroupBox;
    StaticText1: TStaticText;
    GroupBox1: TGroupBox;
    StaticText3: TStaticText;
    gbxTotais: TGroupBox;
    edtTotalPagto: TDBEditNumero;
    lblTotalPagto: TStaticText;
    edtTotalVencto: TDBEditNumero;
    lblTotalVencto: TStaticText;
    StaticText4: TStaticText;
    edtTotalRecebidoBoleto: TDBEditNumero;
    sbnDirRetorno: TSpeedButton;
    gbxRefazOperacao: TGroupBox;
    Label4: TLabel;
    AdvSpinEditOPMinutes: TAdvSpinEdit;
    gbxUltimaVerificacao: TGroupBox;
    lblUltimaVerificacao: TStaticText;
    ckbAtivo: TCheckBox;
    Timer2: TTimer;
    pgcRetornos: TtecPageControl;
    tstParcelas: TTabSheet;
    tstLogRetornos: TTabSheet;
    DBAdvretorno_cobranca: TDBAdvGrid;
    DBAdvretorno_cobranca_titulo: TDBAdvGrid;
    pnlParametrosLog: TPanel;
    fraIntervaloDatas1: TfraIntervaloDatas;
    sbnAplicar: TSpeedButton;
    AdvGridFindDialog_C_BT: TAdvGridFindDialog;
    AdvGridFindDialog_C_B: TAdvGridFindDialog;
    AdvGridExcelIO1: TAdvGridExcelIO;
    AdvPopupMenu1: TAdvPopupMenu;
    Pesquizar1: TMenuItem;
    ExportarExcel1: TMenuItem;
    Copia1: TMenuItem;
    gbxNumerodoContrato: TGroupBox;
    edtNrContrato: TEditTexto;
    procedure sbnProcurarFilialClick(Sender: TObject);
    procedure sbnProcurarContaClick(Sender: TObject);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure sbnAtualizarParcelasClick(Sender: TObject);
    procedure sbnArquivoClick(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure FormShow(Sender: TObject);
    procedure dbgParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbnDirRetornoClick(Sender: TObject);
    procedure AdvSpinEditOPMinutesChange(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ckbAtivoClick(Sender: TObject);
    procedure pgcRetornosChange(Sender: TObject);
    procedure sbnAplicarClick(Sender: TObject);
    procedure Pesquizar1Click(Sender: TObject);
    procedure ExportarExcel1Click(Sender: TObject);
    procedure AdvGridFindDialog_C_BCellFound(Sender: TObject;
      Grid: TAdvStringGrid; ACol, ARow: Integer; Value: String);
    procedure AdvGridFindDialog_C_BDialogKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure AdvGridFindDialog_C_BFindClose(Sender: TObject);
    procedure AdvGridFindDialog_C_BFindDone(Sender: TObject);
    procedure Copia1Click(Sender: TObject);
    procedure DBAdvretorno_cobranca_tituloRowSizing(Sender: TObject; ARow,
      RowSize: Integer);
    procedure DBAdvretorno_cobranca_tituloResize(Sender: TObject);
    procedure DBAdvretorno_cobranca_tituloColumnSizing(Sender: TObject;
      ACol, ColumnSize: Integer);

 protected
    vgerandoconsulta : Boolean;
    Function InternoPesquisar(Titulo: string): Integer; override;
    Function ValidaControles: Boolean;
    Function ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean; Override;
    Function PermitirPesquisa: Boolean;
    Function TabelaDePesquisa: TZdataSet; override;
    Function TituloPesquisa: string;
    Function JanelaPesquisa: TfrmConsultaBasica; override;
    Function LeiauteEstaCadastrado(Banco: integer): boolean;


  private
    { Private declarations }
     result_sbnAtualizarParcelas : Boolean;

    function PastaGravacaoArquivoRetorno: String;
    procedure GuardarPastaGravacaoArquivoRetorno(pasta: String);

    procedure retorno_cobrancaAfterScroll(Sender: TObject);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmLerRetornos: TfrmLerRetornos;
  TipoPesquisa: TtecGerarRemessas;
  NomeArquivo: String;

implementation

uses  dmLerRetornos;

{$R *.dfm}

procedure TfrmLerRetornos.sbnProcurarFilialClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfFiliais.SetFocus;
  InternoPesquisar('');
end;

procedure TfrmLerRetornos.sbnProcurarContaClick(Sender: TObject);
begin
  CtrlOn:= True;
  edfConta.SetFocus;
  InternoPesquisar('');
end;

{------------------------------ Bancos para os quais o tecLUX está apto a fazer a cobrança bancária}
function TfrmLerRetornos.LeiauteEstaCadastrado(Banco: integer): boolean;
begin
   if dtmLerRetornos.TipoArquivo = Boleto then
   begin

     Result:= (Banco = 001) or                  {Banco do Brasil}
              (Banco = 021) or                  {Banestes}
              (Banco = 033) or (Banco = 008) or (Banco = 353) or {Santander}
              (Banco = 041) or                  {Banrisul}
              (Banco = 104) or                  {CaixaSiCob}
  //          (Banco = 104) or                  {Caixa Economica}         {Aparentemente, este modelo}
  //                                                                      {está desatualizado        }
              (Banco = 237) or                  {Bradesco}
              (Banco = 087) or                  {Unicred-Bradesco}
              (Banco = 341) or                  {Itaú}
              (Banco = 085) or                  {CECRED}
              (Banco = 748) or                  {TipoCobranca := cobSicred }
              (Banco = 756);                    {Sicoob - Bancocoob}

   end
   else
   if dtmLerRetornos.TipoArquivo = PIX then
     result := (banco = 033);

   if not Result then
   begin
      MensagemAviso('O leiaute do banco "' + FStr(Banco,$31) + '" não está cadastrado');
      edfConta.SetFocus;
   end;
end;

Function TfrmLerRetornos.ValidaControles: Boolean;
begin
   Result := True;
   if edfConta.Text = '' then begin
      MensagemAviso(ctCONTABRANCO);
      edfConta.SetFocus;
      Result:= False;         Exit;
   end
   else if not LeiauteEstaCadastrado(dtmLerRetornos.qryContasBancoReferencia.AsInteger) then begin
           Result:= false;           Exit;
        end;

   if edfFiliais.Text = '' then begin
      MensagemAviso(ctCODIGOFILIALBRANCO);
      edfFiliais.SetFocus;
      Result:= False;                Exit;
   end;
end;

Function TfrmLerRetornos.InternoPesquisar(Titulo: string): Integer;
begin
  Result:= mrNone;
  if PermitirPesquisa then begin
     dtmLerRetornos.AbreTabelaConsulta(TipoPesquisa);
     Result := inherited InternoPesquisar(TituloPesquisa);
     if Result = mrOK then
        dtmLerRetornos.Selecionar(TipoPesquisa);

     dtmLerRetornos.FechaTabelaConsulta(TipoPesquisa);
  end;
end;

Function TfrmLerRetornos.PermitirPesquisa: Boolean;
begin
   Result := False;
   if CtrlOn
   then if ActiveControl is TtecFindCustom then begin
                if edfFiliais.Focused then TipoPesquisa:= grsFILIAIS
           else if edfConta.Focused   then TipoPesquisa:= grsCONTAS;

           Result:= True;
        end;
end;

Function TfrmLerRetornos.ExisteInformacao(Parametro: Integer; NomeCampo: string; Value: Variant): Boolean;
begin
  with dtmLerRetornos do
    case TipoPesquisa of
          grsFILIAIS: Result:= dtmLerRetornos.ExisteFiliais(NomeCampo, Value);
          grsCONTAS:  Result:= dtmLerRetornos.ExisteConta  (NomeCampo, Value);
          else        Result:= False
    end;
end;

Function TfrmLerRetornos.TabelaDePesquisa: TZdataSet;
begin
  case TipoPesquisa of
    grsFILIAIS: Result := dtmLerRetornos.ConsultarFiliais;
    grsCONTAS:  Result := dtmLerRetornos.ConsultarContas;
    else        Result := nil;
  end;
end;

Function TfrmLerRetornos.TituloPesquisa: string;
begin
  case TipoPesquisa of
    grsFILIAIS: Result := 'Filiais';
    grsCONTAS:  Result := 'Contas';
  end;
end;


constructor TfrmLerRetornos.Create(AOwner: TComponent);
begin
   dtmLerRetornos:= TdtmLerRetornos.Create(Self);
   inherited;
   dtmLerRetornos.Abre(ctConsultaTabelas);

   if ParSistema.ClienteUsaContrato then begin
      tstParcelas.       Caption:= ' PARCELAS RETORNADAS ';
      dbgParcelas.Columns[6].FieldName := 'contrato';
      dbgParcelas.Columns[6].Title.Caption := 'CONTRATO';
      dbgParcelas.Columns[7].Title.Caption := 'NP';
   end
   else begin
      tstParcelas.Caption:= ' DUPLICATAS RETORNADAS ';
      dbgParcelas.Columns[6].FieldName := 'nrnota';
      dbgParcelas.Columns[6].Title.Caption := 'NOTA FISCAL';
      dbgParcelas.Columns[7].Title.Caption := 'ND';
   end;

   lblArquivo.Caption := PastaGravacaoArquivoRetorno;

   dtmLerRetornos.retorno_cobrancaAfterScroll := self.retorno_cobrancaAfterScroll;

end;

Function TfrmLerRetornos.JanelaPesquisa: TfrmConsultaBasica;
var jan: TfrmConsultaPorCampo;
begin
  jan:=TfrmConsultaPorCampo.Create(nil);
  jan.ConsultaInterativa     := not (TipoPesquisa in [grsClientes]) and CtrlOn;
  jan.UsarParametrosDaTabela := False;
  Result:=jan;
end;


destructor TfrmLerRetornos.Destroy;
begin
  inherited;
  frmLerRetornos := nil;
end;

procedure TfrmLerRetornos.actHabilitarUpdate(Sender: TObject);
begin
  sbnProcurarFilial.Enabled:= True;
  sbnProcurarConta. Enabled:= True;
end;

procedure TfrmLerRetornos.sbnAtualizarParcelasClick(Sender: TObject);
var ArqLido: String;
    Resultado :  boolean;
    Txt: TextFile;
begin
   inherited;
   try
     result_sbnAtualizarParcelas := true;
     vgerandoconsulta := true;
     Resultado := false;
     if not ValidaControles then Exit;

     NomeArquivo := lblArquivo.Caption;

     if NomeArquivo = '' then
     begin
        result_sbnAtualizarParcelas := false;
        MensagemAviso(ctRETORNOVAZIO);
        Exit;
     end;

     if dtmLerRetornos.qryContasBancoReferencia.AsInteger <> 237 then
     begin
        AssignFile(Txt, NomeArquivo);
        Reset(Txt);
        Closefile(Txt);
     end;

//     DeleteLineBreaksArquivo(lblArquivo.Caption);

     with dtmLerRetornos do
     begin
        Filiais := edfFiliais.text;
        if LeiauteEstaCadastrado(qryContasBancoReferencia.AsInteger) then
        begin
          Adicionar_retorno_cobranca(lblArquivo.Caption);

          if TipoArquivo = Boleto then
            Resultado := AtualizarParcelasBradescoACBR(lblArquivo.Caption)
          else
            Resultado := AtualizarParcelasPIX;
        end
        else
        begin
          result_sbnAtualizarParcelas := false;
          Exit;
        end;

        dbgParcelas.SetFocus;
        edfFiliais.SetFocus;

        if Resultado or dtmLerRetornos.ModoIntermitente then
        begin
          if NomeArquivo <> '' then
          begin
            ArqLido := NomeArquivo;
            Delete(ArqLido, Length(ArqLido)-3,4);
            ArqLido := ArqLido + '.OLD';
            RenameFile(NomeArquivo, ArqLido);
          end;
        end;

        result_sbnAtualizarParcelas := resultado;

     end;
   finally
     vgerandoconsulta := false;
     lblUltimaVerificacao.Caption := FormatDateTime('dd/MM/yyyy HH:mm:ss', dtmLerRetornos.DataHoraServidor);
   end;
end; {LerTrailerRetorno}


procedure TfrmLerRetornos.sbnArquivoClick(Sender: TObject);
{ var Txt: TextFile; }
begin
  inherited;
  dlgLerRetornos.Title := 'Procurar Arquivo de Retorno';
  if dlgLerRetornos.Execute then
  begin
    try
       {
      NomeArquivo := dlgLerRetornos.Filename;
      AssignFile(Txt, NomeArquivo);
      Reset(Txt);
      Closefile(Txt);
        }
      try
        vgerandoconsulta := true;
        lblArquivo.Caption := dlgLerRetornos.Filename;

        GuardarPastaGravacaoArquivoRetorno(ExtractFileDir(lblArquivo.Caption));

        DeleteLineBreaksArquivo(lblArquivo.Caption);

        dtmLerRetornos.VerificarInformacoesdoArquivo(lblArquivo.Caption);
      finally
        vgerandoconsulta := false;
      end;  

    except
      on EInOutError do
      MensagemAviso(ctERROABERTURARETORNO);
    end;
  end;
end;


procedure TfrmLerRetornos.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F6 then begin
    if sbnAtualizarParcelas.Enabled  then
      sbnAtualizarParcelas.Click;
  end;
end;

procedure TfrmLerRetornos.FormShow(Sender: TObject);
begin
   inherited;
//   edfConta.SetFocus;
   gbxNomeArquivo.setfocus;
end;



procedure TfrmLerRetornos.dbgParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dbgParcelas.DataSource.DataSet.FieldByName('desmembrada').AsBoolean then
    TDBGrid(Sender).Canvas.Font.Color := clRed;

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmLerRetornos.sbnDirRetornoClick(Sender: TObject);
var
  Dir: String;
begin
  inherited;
  if SelectDirectory('Selecionar diretório de Retorno','',Dir) then
  begin
    lblArquivo.Caption := Dir;
    GuardarPastaGravacaoArquivoRetorno(lblArquivo.Caption);
  end;
end;

procedure TfrmLerRetornos.AdvSpinEditOPMinutesChange(Sender: TObject);
begin
  inherited;
  if AdvSpinEditOPMinutes.Value < 0 then
    AdvSpinEditOPMinutes.Value := 0;

  Timer2.enabled := (AdvSpinEditOPMinutes.Value <> 0) and ckbAtivo.checked;
  Timer2.Interval := AdvSpinEditOPMinutes.Value * 60 * 1000;

end;

procedure TfrmLerRetornos.Timer2Timer(Sender: TObject);
var
 vArquivo : String;
 vret : integer;
 F: TSearchRec;

begin
  inherited;
  if not vgerandoconsulta then
  begin
    try
      pgcRetornos.ActivePage := tstParcelas;
      dtmLerRetornos.ModoIntermitente := true;
      Timer2.enabled := false;
      ckbAtivo.Checked := false;

      vArquivo := PastaGravacaoArquivoRetorno;

      if vArquivo = '' then
      begin
        MensagemAviso('A pasta de retorno não foi informada! O modo intermitente não pode ser executado.');
        exit;
      end
      else
      begin

        vRet := FindFirst(vArquivo+'*.ret', faAnyFile, F) ;

        while vRet = 0 do
        begin

          lblArquivo.Caption := vArquivo + f.Name;
          DeleteLineBreaksArquivo(lblArquivo.Caption);
          if dtmLerRetornos.VerificarInformacoesdoArquivo(lblArquivo.Caption) then
            sbnAtualizarParcelasClick(nil);
            {
          else
          begin
            exit;
            break;
          end;
          }

//          vRet := FindFirst(vArquivo+'*.ret', faAnyFile, F) ;
          vRet := FindNext(F) ;
        end;

                                         {
        vRet := FindFirst(vArquivo+'*.txt', faAnyFile, F) ;

        while vRet = 0 do
        begin

          lblArquivo.Caption := vArquivo + f.Name;
          DeleteLineBreaksArquivo(lblArquivo.Caption);
          if dtmLerRetornos.VerificarInformacoesdoArquivo(lblArquivo.Caption) then
            sbnAtualizarParcelasClick(nil)
          else
          begin
            exit;
            break;
          end;

          vRet := FindFirst(vArquivo+'*.txt', faAnyFile, F) ;
        end;
        }


      end;

    finally
      ckbAtivo.Checked := true;
      AdvSpinEditOPMinutesChange(nil);
      dtmLerRetornos.ModoIntermitente := false;

    end;
  end;

end;

procedure TfrmLerRetornos.ckbAtivoClick(Sender: TObject);
begin
  inherited;
  AdvSpinEditOPMinutesChange(Sender);
end;

procedure TfrmLerRetornos.GuardarPastaGravacaoArquivoRetorno(
  pasta: String);
var
  ArquivoCFG: TIniFile;
begin
  if FileExists(NomeArquivoCFG) then
  begin
    try

      ArquivoCFG := TIniFile.Create(NomeArquivoCFG);

      ArquivoCFG.WriteString('Cobrança Bancária','Diretorio Retorno', Pasta );
    finally
      ArquivoCFG.UpdateFile;
      ArquivoCFG.Free;
    end;
  end;
end;


function TfrmLerRetornos.PastaGravacaoArquivoRetorno: String;
var
  ArquivoCFG: TIniFile;
  vDiretorio: String;
begin
  if FileExists(NomeArquivoCFG) then
  begin
    try
      ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
      vDiretorio := ArquivoCFG.ReadString('Cobrança Bancária','Diretorio Retorno', ExtractFilePath(Application.ExeName) + 'Entradas' )+'\';
    finally
      ArquivoCFG.Free;
    end;
  end;
  result := vDiretorio;
end;

procedure TfrmLerRetornos.pgcRetornosChange(Sender: TObject);
  procedure AlternarDataSource(vDataSource: TDataSource);
  begin
    edtTotalRecebidoBoleto.datasource := vDataSource;
    edtTotalVencto.datasource := vDataSource;
    edtTotalPagto.datasource := vDataSource;
  end;

begin
  inherited;
  (*
  if pgcRetornos.activepage = tstLogRetornos then
  begin
    DBAdvretorno_cobranca.datasource := dtmLerRetornos.dsrretorno_cobranca;
    DBAdvretorno_cobranca_titulo.datasource := dtmLerRetornos.dsrretorno_cobranca_titulo;

//    DBAdvretorno_cobranca.Reload;
//    DBAdvretorno_cobranca_titulo.Reload;
  end
  else
  begin
    DBAdvretorno_cobranca.datasource := dtmLerRetornos.dsrretorno_cobranca;
    DBAdvretorno_cobranca_titulo.datasource := dtmLerRetornos.dsrretorno_cobranca_titulo;
  end;
  *)

  if pgcRetornos.ActivePageIndex = 0 then
    AlternarDataSource(dtmLerRetornos.dsrcdsParcelas)
  else
  begin
    AlternarDataSource(dtmLerRetornos.dsrretorno_cobranca);
    dtmLerRetornos.reabrirRetornos;

//    DBAdvretorno_cobranca_titulo.AutoSizeCol(12);
  end;

end;

procedure TfrmLerRetornos.sbnAplicarClick(Sender: TObject);
begin
  inherited;
  if (fraIntervaloDatas1.edtDataInicial.text = '') and
     (fraIntervaloDatas1.edtDataFinal.text = '') and
     (edtNrContrato.text = '') then
  begin
    MensagemAviso('Informe uma data ou contrato como parâmetro!');
    fraIntervaloDatas1.edtDataInicial.setfocus;
  end
  else
  begin
    dtmLerRetornos.abrirLogRetornos(fraIntervaloDatas1.edtDataInicial.text,
                                    fraIntervaloDatas1.edtDataFinal.text,
                                    edtNrContrato.text);
//    DBAdvretorno_cobranca_titulo.AutoSizeRows(False,4);
//    DBAdvretorno_cobranca_titulo.AutoSizeRows(true,44);
//    DBAdvretorno_cobranca_titulo.AutoSizeRow(12, 33);

  end;
end;

procedure TfrmLerRetornos.Pesquizar1Click(Sender: TObject);
begin
  inherited;
  if self.ActiveControl = DBAdvretorno_cobranca then
  begin
    AdvGridFindDialog_C_B.Grid := DBAdvretorno_cobranca;
    AdvGridFindDialog_C_B.Execute;
  end
  else
  begin
    AdvGridFindDialog_C_BT.Grid := DBAdvretorno_cobranca_titulo;
    AdvGridFindDialog_C_BT.Execute;
  end;
  
end;

procedure TfrmLerRetornos.ExportarExcel1Click(Sender: TObject);
var
  vNomeArquivo : String;

begin
  inherited;
  AdvGridExcelIO1.AdvStringGrid := DBAdvretorno_cobranca_titulo;
  vNomeArquivo := ExtractFilePath(Application.ExeName) + 'Saidas\'+ChangeFileExt(dtmLerRetornos.qryretorno_cobrancanomearquivo.asString, '.xls');
  AdvGridExcelIO1.XLSExport(vNomeArquivo, 'Retorno');
end;

procedure TfrmLerRetornos.AdvGridFindDialog_C_BCellFound(Sender: TObject;
  Grid: TAdvStringGrid; ACol, ARow: Integer; Value: String);
begin
  inherited;
;
end;

procedure TfrmLerRetornos.AdvGridFindDialog_C_BDialogKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
;
end;

procedure TfrmLerRetornos.AdvGridFindDialog_C_BFindClose(Sender: TObject);
begin
  inherited;
;
end;

procedure TfrmLerRetornos.AdvGridFindDialog_C_BFindDone(Sender: TObject);
begin
  inherited;
;
end;

procedure TfrmLerRetornos.Copia1Click(Sender: TObject);
begin
  inherited;
  DBAdvretorno_cobranca_titulo.CopySelectionToClipboard;
end;

procedure TfrmLerRetornos.DBAdvretorno_cobranca_tituloRowSizing(
  Sender: TObject; ARow, RowSize: Integer);
begin
  inherited;
//  RowSize := 44;
  DBAdvretorno_cobranca_titulo.AutoSizeRows(False);
end;

procedure TfrmLerRetornos.retorno_cobrancaAfterScroll(Sender: TObject);
begin
   DBAdvretorno_cobranca_titulo.AutoSizeRows(False);
end;

procedure TfrmLerRetornos.DBAdvretorno_cobranca_tituloResize(
  Sender: TObject);
begin
  inherited;
   DBAdvretorno_cobranca_titulo.AutoSizeRows(False);
end;

procedure TfrmLerRetornos.DBAdvretorno_cobranca_tituloColumnSizing(
  Sender: TObject; ACol, ColumnSize: Integer);
begin
  inherited;
  DBAdvretorno_cobranca_titulo.AutoSizeRows(False);
end;

end.
