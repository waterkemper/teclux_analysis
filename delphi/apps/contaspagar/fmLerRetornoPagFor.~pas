{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O-,P+,Q+,R+,S-,T-,U-,V+,W+,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit fmLerRetornoPagFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajudabt, ComCtrls, Buttons, ToolWin, ExtCtrls, StdCtrls,
  frconsulta, frconsultacodigo, Spin, cptexto, cpdata, AdvPageControl,
  Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, dmLerRetornoPagFor, biblio,
  ctconstantes, FileCtrl, Mask, AdvSpin, IniFiles, clparametrossistema,
  Menus, AdvMenus, cpquery, DBCtrls, cpdbmemo;

type
  TfrmLerRetornoPagFor = class(TfrmAjudaBt)
    pgcSelecaoDados: TPageControl;
    tstSelecaoPorPeriodo: TTabSheet;
    gbxPeriodo: TGroupBox;
    lblA: TLabel;
    edtDataFinal: TEditData;
    edtDataInicial: TEditData;
    tstImportacaoOFX: TTabSheet;
    gbxParametros: TGroupBox;
    gbxDias: TGroupBox;
    edtDiasAcima: TSpinEdit;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    edtDiasAbaixo: TSpinEdit;
    btnRefazeraConsulta: TBitBtn;
    Splitter1: TSplitter;
    OpenDialogImportacao: TOpenDialog;
    AdvPagePagFor: TAdvPageControl;
    AdvTabSheetSegmentos: TAdvTabSheet;
    GroupBoxIdentificados: TGroupBox;
    DBAdvDuplicatas: TDBAdvGrid;
    AdvPageControlTitulo: TAdvPageControl;
    AdvTabSheetSegA: TAdvTabSheet;
    AdvTabSheetSegJ: TAdvTabSheet;
    DBAdvGridsegJ: TDBAdvGrid;
    AdvTabSheetSegN: TAdvTabSheet;
    AdvTabSheetSegO: TAdvTabSheet;
    gbxretorno_pagfor_r1: TGroupBox;
    dbgretorno_pagfor_r1: TDBAdvGrid;
    gbxretorno_pagfor_r3_segJ52: TGroupBox;
    dbgretorno_pagfor_r3_segJ52: TDBAdvGrid;
    gbxretorno_pagfor_trailer_tipo_9: TGroupBox;
    dbgretorno_pagfor_trailer_tipo_9: TDBAdvGrid;
    gbxRetorno_pagfor_r3_segZ: TGroupBox;
    dbgRetorno_pagfor_r3_segZ: TDBAdvGrid;
    AdvTabSheetDetalhes: TAdvTabSheet;
    gbxretorno_pagfor_r3_segB: TGroupBox;
    dbgretorno_pagfor_r3_segB: TDBAdvGrid;
    gbxretorno_pagfor_trailer_tipo_5: TGroupBox;
    dbgretorno_pagfor_trailer_tipo_5: TDBAdvGrid;
    gbxretorno_pagfor_r0: TGroupBox;
    dbgretorno_pagfor_r0: TDBAdvGrid;
    DBAdvGridSegO: TDBAdvGrid;
    DBAdvGridsegA: TDBAdvGrid;
    gbxRetorno_pagfor_r3_segW: TGroupBox;
    dbgRetorno_pagfor_r3_segW: TDBAdvGrid;
    DBAdvGridSEgN: TDBAdvGrid;
    sbnDirRetorno: TSpeedButton;
    btnSelecionarARquivoImportacao: TSpeedButton;
    AdvTabSheetPagamentos: TAdvTabSheet;
    DBAdvGridretorno_pagfor_r3: TDBAdvGrid;
    gbxRefazOperacao: TGroupBox;
    Label4: TLabel;
    AdvSpinEditOPMinutes: TAdvSpinEdit;
    ckbAtivo: TCheckBox;
    gbxUltimaVerificacao: TGroupBox;
    lblUltimaVerificacao: TStaticText;
    Timer2: TTimer;
    lblArquivo: TLabel;
    sbnAtualizarDuplicatas: TSpeedButton;
    gbxretorno_pagfor_r3_segH: TGroupBox;
    DBAdvGrid3: TDBAdvGrid;
    Timer1: TTimer;
    gbxPercentualsobreoValor: TGroupBox;
    edtPercentualValorAcima: TSpinEdit;
    lblDiasAntes: TStaticText;
    edtPercentualValorAbaixo: TSpinEdit;
    lblDiasDepois: TStaticText;
    ckbNaoAplicarPercentualsobreoValor: TCheckBox;
    ckbFiltrarPorNome: TCheckBox;
    AdvPopupMenu1: TAdvPopupMenu;
    Copia1: TMenuItem;
    AdvTabSheetSegG: TAdvTabSheet;
    DBAdvGridSegG: TDBAdvGrid;
    sbnSalvar: TSpeedButton;
    gbxObservacao: TGroupBox;
    mmoObservacaoDuplicata: TtecDBMemo;
    procedure AdvPagePagForChange(Sender: TObject);
    procedure btnSelecionarARquivoImportacaoClick(Sender: TObject);
    procedure sbnDirRetornoClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure sbnAtualizarDuplicatasClick(Sender: TObject);
    procedure AdvSpinEditOPMinutesChange(Sender: TObject);
    procedure ckbAtivoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtDiasAbaixoChange(Sender: TObject);
    procedure edtDiasAcimaChange(Sender: TObject);
    procedure DBAdvDuplicatasCanClickCell(Sender: TObject; ARow, ACol: Integer;
      var Allow: Boolean);
    procedure DBAdvDuplicatasCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btnRefazeraConsultaClick(Sender: TObject);
    procedure edtPercentualValorAbaixoChange(Sender: TObject);
    procedure edtPercentualValorAcimaChange(Sender: TObject);
    procedure ckbNaoAplicarPercentualsobreoValorClick(Sender: TObject);
    procedure DBAdvGridretorno_pagfor_r3RowChanging(Sender: TObject;
      OldRow, NewRow: Integer; var Allow: Boolean);
    procedure ckbFiltrarPorNomeClick(Sender: TObject);
    procedure DBAdvGridsegARowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure DBAdvGridsegJRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure DBAdvGridSegGRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure DBAdvGridSEgNRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure DBAdvGridSegORowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure DBAdvDuplicatasFooterCalc(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure DBAdvGridretorno_pagfor_r3ColumnCalc(Sender: TObject; ACol,
      FromRow, ToRow: Integer; var Res: Double);
    procedure DBAdvGridretorno_pagfor_r3GetEditText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure DBAdvGridretorno_pagfor_r3GetDisplText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure DBAdvGridretorno_pagfor_r3LoadCell(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure DBAdvDuplicatasCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure Copia1Click(Sender: TObject);
    procedure AdvTabSheetSegGShow(Sender: TObject);
    procedure AdvTabSheetPagamentosShow(Sender: TObject);
    procedure AdvPageControlTituloChange(Sender: TObject);
    procedure AdvPagePagForChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbnSalvarClick(Sender: TObject);
  protected
  private
    result_sbnAtualizarDuplicatas : Boolean;
    fdtmLerRetornoPagFor: TdtmLerRetornoPagFor;
    function PastaGravacaoArquivoRetorno: String;
    procedure GuardarPastaGravacaoArquivoRetorno(pasta: String);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
//  procedure PosicionarRetorno_PagFor_r3(Row:integer);


    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property dtmLerRetornoPagFor: TdtmLerRetornoPagFor read fdtmLerRetornoPagFor write fdtmLerRetornoPagFor;
    procedure CalcularTotaisretorno_pagfor_r3;
    procedure CalcularTotaisDuplicatas;
    procedure CalcularTotaissegA;
    procedure CalcularTotaissegG;
    procedure CalcularTotaissegJ;
    procedure CalcularTotaissegN;
    procedure CalcularTotaissegO;


  end;

var
  frmLerRetornoPagFor: TfrmLerRetornoPagFor;
  NomeArquivo: String;

implementation

uses DB;

{$R *.dfm}


constructor TfrmLerRetornoPagFor.Create(AOwner: TComponent);
begin
  inherited;
  dtmLerRetornoPagFor := TdtmLerRetornoPagFor.Create(Self);

  DBAdvGridretorno_pagfor_r3.pagemode := false;
  DBAdvGridsegA.pagemode := false;
  DBAdvGridSegG.pagemode := false;
  DBAdvGridSegJ.pagemode := false;
  DBAdvGridSEgN.pagemode := false;
  DBAdvGridSegO.pagemode := false;

  lblArquivo.Caption := PastaGravacaoArquivoRetorno;

  DBAdvGridretorno_pagfor_r3.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
  DBAdvGridsegA.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
  DBAdvGridSegG.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
  DBAdvGridSegJ.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
  DBAdvGridSEgN.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));
  DBAdvGridSegO.Bands.PrimaryColor := TColor(strtoint(parsistema.CorZebradoRelatorio));

  DBAdvGridretorno_pagfor_r3.Bands.active := True;
  DBAdvGridsegA.Bands.active := True;
  DBAdvGridSegG.Bands.active := True;
  DBAdvGridSegJ.Bands.active := True;
  DBAdvGridSEgN.Bands.active := True;
  DBAdvGridSegO.Bands.active := True;


  dtmLerRetornoPagFor.DiasAbaixo := edtDiasAbaixo.value;
  dtmLerRetornoPagFor.DiasAcima := edtDiasAcima.value;

  dtmLerRetornoPagFor.PercentualValorAbaixo := edtPercentualValorAbaixo.value;
  dtmLerRetornoPagFor.PercentualValorAcima := edtPercentualValorAcima.value;
  dtmLerRetornoPagFor.LimitePercentualAtivo := ckbNaoAplicarPercentualsobreoValor.checked;

  dtmLerRetornoPagFor.FiltrarPorNome := ckbFiltrarPorNome.checked;

  DBAdvGridretorno_pagfor_r3.col := 8;
  DBAdvGridsegA.col := 10;
  DBAdvGridSegG.col := 8;
  DBAdvGridSegJ.col := 11;
  DBAdvGridSEgN.col := 8;
  DBAdvGridSegO.col := 9;

  AdvPageControlTitulo.ActivePageIndex := 0;
  AdvPagePagFor.ActivePageIndex := 0;



end;

procedure TfrmLerRetornoPagFor.AdvPagePagForChange(Sender: TObject);
begin
  inherited;


  if (AdvPagePagFor.activepage = AdvTabSheetPagamentos) or
     (AdvPagePagFor.activepage = AdvTabSheetSegmentos) then
   dtmLerRetornoPagFor.SegmentoG := false
  else
  if (AdvPagePagFor.activepage = AdvTabSheetSegG) then
   dtmLerRetornoPagFor.SegmentoG := true;

  if AdvPagePagFor.ActivePage = AdvTabSheetDetalhes then
    dtmLerRetornoPagFor.AbrirDetalhes
  else
    dtmLerRetornoPagFor.FecharDetalhes;

  if AdvPagePagFor.activepage = AdvTabSheetSegmentos then
  begin
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'A' then
      AdvPageControlTitulo.activepage := AdvTabSheetSegA
    else
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'J' then
      AdvPageControlTitulo.activepage := AdvTabSheetSegJ
    else
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'N' then
      AdvPageControlTitulo.activepage := AdvTabSheetSegN
    else
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'O' then
      AdvPageControlTitulo.activepage := AdvTabSheetSegO;
  end;

end;

procedure TfrmLerRetornoPagFor.btnSelecionarARquivoImportacaoClick(
  Sender: TObject);
begin
  inherited;

  if OpenDialogImportacao.Execute then
  begin
    lblArquivo.caption := OpenDialogImportacao.FileName;
    if FileExists(lblArquivo.caption) then
    begin
      try
        NomeArquivo := lblArquivo.caption;
        dtmLerRetornoPagFor.GerandoConsulta :=  UnicoArquico;
        if dtmLerRetornoPagFor.VerificarInformacoesdoArquivo(lblArquivo.Caption) then
          sbnAtualizarDuplicatasClick(nil);
       finally
         dtmLerRetornoPagFor.GerandoConsulta := NaoGerando;
         NomeArquivo := '';
       end;
    end
    else
      MensagemAviso(format(ctARQUIVONAOENCONTRADO, [lblArquivo.caption]));
  end;

end;

procedure TfrmLerRetornoPagFor.sbnDirRetornoClick(Sender: TObject);
var
  Dir: String;
begin
  inherited;
  if SelectDirectory('Selecionar diretório de Retorno','',Dir) then
  begin
    lblArquivo.caption := Dir;
    GuardarPastaGravacaoArquivoRetorno(lblArquivo.Caption);
  end;
end;

procedure TfrmLerRetornoPagFor.Timer2Timer(Sender: TObject);
var
 vArquivo : String;
 vret : integer;
 F: TSearchRec;

begin
  inherited;
  if (dtmLerRetornoPagFor.gerandoconsulta in [NaoGerando, MultiplosArquivos])   then
  begin
    try
      AdvPagePagFor.ActivePage := AdvTabSheetPagamentos;
      dtmLerRetornoPagFor.ModoIntermitente := true;
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

        try
          dtmLerRetornoPagFor.GerandoConsulta := MultiplosArquivos;
          if vRet = 0 then
          begin
            edtDataInicial.text := datetimetostr(dtmLerRetornoPagFor.dataservidor);
            edtDataFinal.text := datetimetostr(dtmLerRetornoPagFor.dataservidor);
          end;

          while vRet = 0 do
          begin

            lblArquivo.Caption := vArquivo + f.Name;
            NomeArquivo := lblArquivo.Caption;
            DeleteLineBreaksArquivo(lblArquivo.Caption);

            if dtmLerRetornoPagFor.VerificarInformacoesdoArquivo(lblArquivo.Caption) then
              sbnAtualizarDuplicatasClick(nil);
              {
            else
            begin
              exit;
              break;
            end;
            }

//            vRet := FindFirst(vArquivo+'*.ret', faAnyFile, F) ;
            vRet := Findnext(F) ;

          end;
        finally
          dtmLerRetornoPagFor.GerandoConsulta := NaoGerando;
          NomeArquivo := '';
        end;

      end;

    finally
      ckbAtivo.Checked := true;
      AdvSpinEditOPMinutesChange(nil);
      dtmLerRetornoPagFor.ModoIntermitente := false;

    end;
  end;

end;

function TfrmLerRetornoPagFor.PastaGravacaoArquivoRetorno: String;
var
  ArquivoCFG: TIniFile;
  vDiretorio: String;
begin
  if FileExists(NomeArquivoCFG) then
  begin
    try
      ArquivoCFG := TIniFile.Create(NomeArquivoCFG);
      vDiretorio := ArquivoCFG.ReadString('Cobrança Bancária','Diretorio Retorno PagFor', ExtractFilePath(Application.ExeName) + 'Entradas' )+'\';
    finally
      ArquivoCFG.Free;
    end;
  end;
  result := vDiretorio;
end;

procedure TfrmLerRetornoPagFor.GuardarPastaGravacaoArquivoRetorno(
  pasta: String);
var
  ArquivoCFG: TIniFile;
begin
  if FileExists(NomeArquivoCFG) then
  begin
    try

      ArquivoCFG := TIniFile.Create(NomeArquivoCFG);

      ArquivoCFG.WriteString('Cobrança Bancária','Diretorio Retorno PagFor', Pasta );
    finally
      ArquivoCFG.UpdateFile;
      ArquivoCFG.Free;
    end;
  end;
end;

procedure TfrmLerRetornoPagFor.sbnAtualizarDuplicatasClick(
  Sender: TObject);

var ArqLido: String;
    Txt: TextFile;
begin
   inherited;
   try

     result_sbnAtualizarDuplicatas := true;
     if Sender <> nil then
     begin
       dtmLerRetornoPagFor.gerandoconsulta := viaParametros;
       if (edtDataInicial.text = '') and
          (edtDataFinal.text = '') then
       begin
         MensagemAviso('Informe o período ou início/fim da leitura');
         pgcSelecaoDados.activepage := tstSelecaoPorPeriodo;
         edtDataInicial.setfocus;
         exit;
       end;
     end;

     AdvPagePagFor.ActivePage := AdvTabSheetPagamentos;
     DBAdvGridretorno_pagfor_r3.setfocus;

     with dtmLerRetornoPagFor do
     begin
        AbrirConsultaRetorno(edtDataInicial.text, edtDataFinal.text);

        if NomeArquivo <> '' then
        begin
          ArqLido := NomeArquivo;
          Delete(ArqLido, Length(ArqLido)-3,4);
          ArqLido := ArqLido + '.OLD';
          RenameFile(NomeArquivo, ArqLido);
        end;

     end;

   finally
     NomeArquivo := '';
     if dtmLerRetornoPagFor.gerandoconsulta = MultiplosArquivos then
       lblUltimaVerificacao.Caption := FormatDateTime('dd/MM/yyyy HH:mm:ss', dtmLerRetornoPagFor.DataHoraServidor);

     if dtmLerRetornoPagFor.gerandoconsulta = viaParametros then
       if dtmLerRetornoPagFor.qryretorno_pagfor_r3.isempty and
          dtmLerRetornoPagFor.qryretorno_pagfor_r3_G.isempty then
         MensagemAviso(ctCONSULTAVAZIA);

     dtmLerRetornoPagFor.gerandoconsulta := naoGerando;

     if dtmLerRetornoPagFor.qryretorno_pagfor_r3_segG.recordcount <> 0 then
     begin
       dtmLerRetornoPagFor.SegmentoG := True;
       AdvPagePagFor.activepage := AdvTabSheetSegG;
     end
     else
     begin
       dtmLerRetornoPagFor.SegmentoG := False;
       AdvPagePagFor.activepage := AdvTabSheetPagamentos;
     end;
   end;


end; {LerTrailerRetorno}

procedure TfrmLerRetornoPagFor.AdvSpinEditOPMinutesChange(Sender: TObject);
begin
  inherited;
  if AdvSpinEditOPMinutes.Value < 0 then
    AdvSpinEditOPMinutes.Value := 0;

  Timer2.enabled := (AdvSpinEditOPMinutes.Value <> 0) and ckbAtivo.checked;
  Timer2.Interval := AdvSpinEditOPMinutes.Value * 60 * 1000;
  
end;

procedure TfrmLerRetornoPagFor.ckbAtivoClick(Sender: TObject);
begin
  inherited;
  AdvSpinEditOPMinutesChange(Sender);
end;

procedure TfrmLerRetornoPagFor.Timer1Timer(Sender: TObject);
begin
  inherited;
  AdvTabSheetSegA.TabVisible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segA.dataset.isempty;
//AdvTabSheetSegG.TabVisible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segG.dataset.isempty;
  AdvTabSheetSegJ.TabVisible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segJ.dataset.isempty;
  AdvTabSheetSegN.TabVisible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segN.dataset.isempty;
  AdvTabSheetSegO.TabVisible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segO.dataset.isempty;

  gbxretorno_pagfor_r3_segB.visible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segB.dataset.isempty;
  gbxretorno_pagfor_r3_segH.visible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segH.dataset.isempty;
  gbxretorno_pagfor_r3_segJ52.visible := not dtmLerRetornoPagFor.dsrretorno_pagfor_r3_segJ52.dataset.isempty;
  gbxRetorno_pagfor_r3_segW.visible := not dtmLerRetornoPagFor.dsrRetorno_pagfor_r3_segW.dataset.isempty;
  gbxRetorno_pagfor_r3_segZ.visible := not dtmLerRetornoPagFor.dsrRetorno_pagfor_r3_segZ.dataset.isempty;

  { Quando tiver algo para gravar não permite gerar novas informações }
  sbnSalvar.Enabled := dtmLerRetornoPagFor.RegistrosPendentesdeGravacao;
  sbnAtualizarDuplicatas.enabled := not sbnSalvar.Enabled;


end;

procedure TfrmLerRetornoPagFor.edtDiasAbaixoChange(Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.DiasAbaixo := edtDiasAbaixo.value;
end;

procedure TfrmLerRetornoPagFor.edtDiasAcimaChange(Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.DiasAcima := edtDiasAcima.value;
end;

procedure TfrmLerRetornoPagFor.DBAdvDuplicatasCanClickCell(Sender: TObject;
  ARow, ACol: Integer; var Allow: Boolean);
begin
  inherited;
  Allow := not dtmLerRetornoPagFor.qryDuplicatas.IsEmpty;
end;

procedure TfrmLerRetornoPagFor.DBAdvDuplicatasCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  

  {Os comandos abaixo são usados para resolver a situacão de erro no grid: grid index out of range}

                {
  dbgImportacao.datasource.dataset.next;
  if dbgImportacao.datasource.dataset.eof then
  begin
    dbgImportacao.datasource.dataset.prior;
    dbgImportacao.datasource.dataset.next;
  end
  else
    dbgImportacao.datasource.dataset.prior;
    }

//  dtmLerRetornoPagFor.RestaurarPosicaoDuplicatas;

end;

procedure TfrmLerRetornoPagFor.btnRefazeraConsultaClick(Sender: TObject);
begin
  inherited;
  if dtmLerRetornoPagFor.SegmentoG then
    dtmLerRetornoPagFor.qryretorno_pagfor_r3_segGAfterScroll(nil)
  else
    dtmLerRetornoPagFor.qryretorno_pagfor_r3AfterScroll(nil);
end;

procedure TfrmLerRetornoPagFor.edtPercentualValorAbaixoChange(
  Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.PercentualValorAbaixo := edtPercentualValorAbaixo.value;
end;

procedure TfrmLerRetornoPagFor.edtPercentualValorAcimaChange(
  Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.PercentualValorAcima := edtPercentualValorAcima.value;
end;

procedure TfrmLerRetornoPagFor.ckbNaoAplicarPercentualsobreoValorClick(
  Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.LimitePercentualAtivo := ckbNaoAplicarPercentualsobreoValor.checked;
end;

procedure TfrmLerRetornoPagFor.DBAdvGridretorno_pagfor_r3RowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
//  PosicionarRetorno_PagFor_r3(newRow);

  dtmLerRetornoPagFor.PosicionarPagFor_(
     TTecQuery(DBAdvGridretorno_pagfor_r3.datasource.dataset),
     'pagfor',
     DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow],
     DBAdvGridSegG,
     'cod_de_barras',
     DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['cod_de_barras'].index, Newrow]
     );

  if AdvPagePagFor.activepage = AdvTabSheetPagamentos then
  begin

    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'A' then

      dtmLerRetornoPagFor.PosicionarPagFor_(
         dtmLerRetornoPagFor.qryretorno_pagfor_r3_segA,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow],
         DBAdvGridsegA,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow]
         )

    else
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'J' then

      dtmLerRetornoPagFor.PosicionarPagFor_(
         dtmLerRetornoPagFor.qryretorno_pagfor_r3_segJ,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow],
         DBAdvGridsegJ,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow]
         )

    else
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'N' then

      dtmLerRetornoPagFor.PosicionarPagFor_(
         dtmLerRetornoPagFor.qryRetorno_pagfor_r3_segN,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow],
         DBAdvGridSEgN,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow]
         )

    else
    if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'O' then
      dtmLerRetornoPagFor.PosicionarPagFor_(
         dtmLerRetornoPagFor.qryRetorno_pagfor_r3_segO,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow],
         DBAdvGridSegO,
         'pagfor',
         DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, Newrow]
         );
  end;



end;

procedure TfrmLerRetornoPagFor.ckbFiltrarPorNomeClick(Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.FiltrarPorNome := ckbFiltrarPorNome.checked;
end;

procedure TfrmLerRetornoPagFor.CalcularTotaisretorno_pagfor_r3;
begin


  DBAdvGridretorno_pagfor_r3.FloatingFooter.ColumnCalc[
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['vlr_vencto'].Index] := acsum;

  DBAdvGridretorno_pagfor_r3.FloatingFooter.ColumnCalc[
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['vlr_desconto'].Index] := acsum;

  DBAdvGridretorno_pagfor_r3.FloatingFooter.ColumnCalc[
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['vlr_multajuros'].Index] := acsum;

  DBAdvGridretorno_pagfor_r3.FloatingFooter.ColumnCalc[
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['vlr_pagto'].Index] := acsum;

  DBAdvGridretorno_pagfor_r3.FloatingFooter.ColumnCalc[
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['totalconciliado'].Index] := acsum;

  DBAdvGridretorno_pagfor_r3.FloatingFooter.ColumnCalc[
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['SaldoConciliar'].Index] := acsum;


  DBAdvGridretorno_pagfor_r3.AutoSizeCol(
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['vlr_vencto'].Index);

  DBAdvGridretorno_pagfor_r3.AutoSizeCol(
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['vlr_pagto'].Index);

  DBAdvGridretorno_pagfor_r3.AutoSizeCol(
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['totalconciliado'].Index);

  DBAdvGridretorno_pagfor_r3.AutoSizeCol(
    DBAdvGridretorno_pagfor_r3.ColumnByFieldName['SaldoConciliar'].Index);






    {
  DBAdvGridretorno_pagfor_r3.autosize := DBAdvGridretorno_pagfor_r3.RowCount > 1;
  DBAdvGridretorno_pagfor_r3.Repaint;
  DBAdvGridretorno_pagfor_r3.autosize := False;
  }


end;

procedure TfrmLerRetornoPagFor.CalcularTotaisDuplicatas;
begin
  DBAdvDuplicatas.FloatingFooter.ColumnCalc[
    DBAdvDuplicatas.ColumnByFieldName['valorvencto'].Index] := acsum;

  DBAdvDuplicatas.FloatingFooter.ColumnCalc[
    DBAdvDuplicatas.ColumnByFieldName['valordesconto'].Index] := acsum;

  DBAdvDuplicatas.FloatingFooter.ColumnCalc[
    DBAdvDuplicatas.ColumnByFieldName['multajuros'].Index] := acsum;

  DBAdvDuplicatas.FloatingFooter.ColumnCalc[
    DBAdvDuplicatas.ColumnByFieldName['valorpagto'].Index] := acsum;

    {
  DBAdvDuplicatas.FloatingFooter.ColumnCalc[
    DBAdvDuplicatas.ColumnByFieldName['conciliar'].Index] := acCUSTOM;
    }


                    {

  DBAdvDuplicatas.AutoSizeCol(
    DBAdvDuplicatas.ColumnByFieldName['valorvencto'].Index);

  DBAdvDuplicatas.AutoSizeCol(
    DBAdvDuplicatas.ColumnByFieldName['valorpagto'].Index);
    }


    {
  DBAdvDuplicatas.autosize := DBAdvDuplicatas.RowCount > 1;
  DBAdvDuplicatas.Repaint;
  DBAdvDuplicatas.autosize := False;
  }

end;

procedure TfrmLerRetornoPagFor.CalcularTotaissegA;
begin
  DBAdvGridsegA.FloatingFooter.ColumnCalc[
    DBAdvGridsegA.ColumnByFieldName['vlr_pagto'].Index] := acsum;

  DBAdvGridsegA.FloatingFooter.ColumnCalc[
    DBAdvGridsegA.ColumnByFieldName['vlr_real_pagto'].Index] := acsum;

  DBAdvGridsegA.AutoSizeCol(
    DBAdvGridsegA.ColumnByFieldName['vlr_pagto'].Index);

  DBAdvGridsegA.AutoSizeCol(
    DBAdvGridsegA.ColumnByFieldName['vlr_real_pagto'].Index);

    {
  DBAdvGridsegA.autosize := DBAdvGridsegA.RowCount > 1;
  DBAdvGridsegA.Repaint;
  DBAdvGridsegA.autosize := False;
  }

end;

procedure TfrmLerRetornoPagFor.CalcularTotaissegG;
begin
  DBAdvGridSegG.FloatingFooter.ColumnCalc[
    DBAdvGridSegG.ColumnByFieldName['vlr_nominal'].Index] := acsum;

  DBAdvGridSegG.FloatingFooter.ColumnCalc[
    DBAdvGridSegG.ColumnByFieldName['totalconciliado'].Index] := acsum;

  DBAdvGridSegG.FloatingFooter.ColumnCalc[
    DBAdvGridSegG.ColumnByFieldName['SaldoConciliar'].Index] := acsum;

  DBAdvGridSegG.AutoSizeCol(
    DBAdvGridSegG.ColumnByFieldName['totalconciliado'].Index);

  DBAdvGridSegG.AutoSizeCol(
    DBAdvGridSegG.ColumnByFieldName['SaldoConciliar'].Index);

  DBAdvGridSegG.AutoSizeCol(
    DBAdvGridSegG.ColumnByFieldName['vlr_nominal'].Index);


    {
  DBAdvGridsegG.autosize := DBAdvGridsegG.RowCount > 1;
  DBAdvGridsegG.Repaint;
  DBAdvGridsegG.autosize := False;
  }

end;

procedure TfrmLerRetornoPagFor.CalcularTotaissegJ;
begin
  DBAdvGridSegJ.FloatingFooter.ColumnCalc[
    DBAdvGridSegJ.ColumnByFieldName['vlr_nominal'].Index] := acsum;

  DBAdvGridSegJ.FloatingFooter.ColumnCalc[
    DBAdvGridSegJ.ColumnByFieldName['vlr_desconto'].Index] := acsum;

  DBAdvGridSegJ.FloatingFooter.ColumnCalc[
    DBAdvGridSegJ.ColumnByFieldName['vlr_multajuros'].Index] := acsum;

  DBAdvGridSegJ.FloatingFooter.ColumnCalc[
    DBAdvGridSegJ.ColumnByFieldName['vlr_pagto'].Index] := acsum;


  DBAdvGridSegJ.AutoSizeCol(
    DBAdvGridSegJ.ColumnByFieldName['vlr_nominal'].Index);

  DBAdvGridSegJ.AutoSizeCol(
    DBAdvGridSegJ.ColumnByFieldName['vlr_pagto'].Index);


    {
  DBAdvGridSegJ.autosize := DBAdvGridSegJ.RowCount > 1;
  DBAdvGridSegJ.Repaint;
  DBAdvGridSegJ.autosize := False;
  }

  {
  DBAdvGridSegJ.ColumnByFieldName['pagfor'].Width := 1;
  DBAdvGridSegJ.ColumnByFieldName['registro0'].Width := 1;
  DBAdvGridSegJ.ColumnByFieldName['cod_do_banco'].Width := 1;
  DBAdvGridSegJ.ColumnByFieldName['lote_de_serv'].Width := 1;
  DBAdvGridSegJ.ColumnByFieldName['tp_de_registro'].Width := 1;
  DBAdvGridSegJ.ColumnByFieldName['nr_seq_reg_lote'].Width := 1;
  }






end;

procedure TfrmLerRetornoPagFor.CalcularTotaissegN;
begin
  DBAdvGridSEgN.FloatingFooter.ColumnCalc[
    DBAdvGridSEgN.ColumnByFieldName['vlr_pagto'].Index] := acsum;

  DBAdvGridSEgN.AutoSizeCol(
    DBAdvGridSEgN.ColumnByFieldName['vlr_pagto'].Index);


    {
  DBAdvGridsegN.autosize := DBAdvGridsegN.RowCount > 1;
  DBAdvGridsegN.Repaint;
  DBAdvGridsegN.autosize := False;
  }

end;

procedure TfrmLerRetornoPagFor.CalcularTotaissegO;
begin
  DBAdvGridSegO.FloatingFooter.ColumnCalc[
    DBAdvGridSegO.ColumnByFieldName['vlr_pagto'].Index] := acsum;

  DBAdvGridSegO.AutoSizeCol(
    DBAdvGridSegO.ColumnByFieldName['vlr_pagto'].Index);
{

  DBAdvGridsegO.autosize := DBAdvGridsegO.RowCount > 1;
  DBAdvGridsegO.Repaint;
  DBAdvGridsegO.autosize := False;
  }


end;

procedure TfrmLerRetornoPagFor.DBAdvGridsegARowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  if AdvPagePagFor.activepage = AdvTabSheetSegmentos then
  dtmLerRetornoPagFor.PosicionarPagFor_(
     dtmLerRetornoPagFor.qryretorno_pagfor_r3,
     'pagfor',
     DBAdvGridsegA.cells[DBAdvGridsegA.ColumnByFieldName['pagfor'].index, Newrow],
     DBAdvGridretorno_pagfor_r3,
     'pagfor',
     DBAdvGridsegA.cells[DBAdvGridsegA.ColumnByFieldName['pagfor'].index, Newrow]
     );


end;

procedure TfrmLerRetornoPagFor.DBAdvGridsegJRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  if AdvPagePagFor.activepage = AdvTabSheetSegmentos then
  dtmLerRetornoPagFor.PosicionarPagFor_(
     dtmLerRetornoPagFor.qryretorno_pagfor_r3,
     'pagfor',
     DBAdvGridSegJ.cells[DBAdvGridSegJ.ColumnByFieldName['pagfor'].index, NewRow],
     DBAdvGridretorno_pagfor_r3,
     'pagfor',
     DBAdvGridSegJ.cells[DBAdvGridSegJ.ColumnByFieldName['pagfor'].index, NewRow]
     );
end;

procedure TfrmLerRetornoPagFor.DBAdvGridSegGRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;

  dtmLerRetornoPagFor.PosicionarPagFor_(
     TTecQuery(DBAdvGridSegG.datasource.dataset),
     'pagfor',
     DBAdvGridSegG.cells[DBAdvGridSegG.ColumnByFieldName['pagfor'].index, Newrow],
     DBAdvGridretorno_pagfor_r3,
     'cod_de_barras',
     DBAdvGridSegG.cells[DBAdvGridSegG.ColumnByFieldName['cod_de_barras'].index, Newrow]
     );

end;

procedure TfrmLerRetornoPagFor.DBAdvGridSEgNRowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  if AdvPagePagFor.activepage = AdvTabSheetSegmentos then
  dtmLerRetornoPagFor.PosicionarPagFor_(
     dtmLerRetornoPagFor.qryretorno_pagfor_r3,
     'pagfor',
     DBAdvGridSEgN.cells[DBAdvGridSEgN.ColumnByFieldName['pagfor'].index, NewRow],

     DBAdvGridretorno_pagfor_r3,
     'pagfor',
     DBAdvGridSEgN.cells[DBAdvGridSEgN.ColumnByFieldName['pagfor'].index, NewRow]);

end;

procedure TfrmLerRetornoPagFor.DBAdvGridSegORowChanging(Sender: TObject;
  OldRow, NewRow: Integer; var Allow: Boolean);
begin
  inherited;
  if AdvPagePagFor.activepage = AdvTabSheetSegmentos then
  dtmLerRetornoPagFor.PosicionarPagFor_(
     dtmLerRetornoPagFor.qryretorno_pagfor_r3,
     'pagfor',
     DBAdvGridSegO.cells[DBAdvGridSegO.ColumnByFieldName['pagfor'].index, NewRow],

     DBAdvGridretorno_pagfor_r3,
     'pagfor',
     DBAdvGridSegO.cells[DBAdvGridSegO.ColumnByFieldName['pagfor'].index, NewRow]);

end;

procedure TfrmLerRetornoPagFor.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [] then
  begin
    case key of
    vk_f5 : begin
             if sbnSalvar.enabled then
               sbnSalvarClick(sbnSalvar);
            end;

    vk_f6 : begin
             if sbnAtualizarDuplicatas.enabled then
               sbnAtualizarDuplicatasClick(sbnAtualizarDuplicatas);
            end;
    end;        
  end;
end;

procedure TfrmLerRetornoPagFor.DBAdvDuplicatasFooterCalc(Sender: TObject;
  ACol, ARow: Integer; var Value: String);
begin
  inherited;
  {
  if ACol = 13 then
    Value := '10';
    }
end;

procedure TfrmLerRetornoPagFor.DBAdvGridretorno_pagfor_r3ColumnCalc(
  Sender: TObject; ACol, FromRow, ToRow: Integer; var Res: Double);
begin
  inherited;
  {
  if acol = 16 then
    Res := 199}
end;

procedure TfrmLerRetornoPagFor.DBAdvGridretorno_pagfor_r3GetEditText(
  Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
  inherited;
  {
  if acol = 16 then
    Value := '199'
    }

end;

procedure TfrmLerRetornoPagFor.DBAdvGridretorno_pagfor_r3GetDisplText(
  Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
  inherited;
  {
  if acol = 16 then
    Value := '199'}

end;

procedure TfrmLerRetornoPagFor.DBAdvGridretorno_pagfor_r3LoadCell(
  Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
  inherited;
  {
  if acol = 16 then
    Value := '199'}

end;

procedure TfrmLerRetornoPagFor.DBAdvDuplicatasCanEditCell(Sender: TObject;
  ARow, ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if dtmLerRetornoPagFor.SegmentoG then

    CanEdit :=   (ACol = DBAdvDuplicatas.ColumnByFieldName['conciliar'].index) and

       (DBAdvDuplicatas.ColumnByFieldName['conciliar'].Field.AsBoolean or

        (StrToCurrDef(DBAdvGridSegG.Cells[
              DBAdvGridSegG.ColumnByFieldName['SaldoConciliar'].index,
              DBAdvGridSegG.row],0)>0)
         )

  else

    CanEdit :=   (ACol = DBAdvDuplicatas.ColumnByFieldName['conciliar'].index) and

       (DBAdvDuplicatas.ColumnByFieldName['conciliar'].Field.AsBoolean or

        (StrToCurrDef(DBAdvGridretorno_pagfor_r3.Cells[
              DBAdvGridretorno_pagfor_r3.ColumnByFieldName['SaldoConciliar'].index,
              DBAdvGridretorno_pagfor_r3.row],0)>0)
         );

end;

procedure TfrmLerRetornoPagFor.Copia1Click(Sender: TObject);
begin
  inherited;
  TDBAdvGrid(activecontrol).CopySelectionToClipboard;
end;

procedure TfrmLerRetornoPagFor.AdvTabSheetSegGShow(Sender: TObject);
begin
  inherited;

  dtmLerRetornoPagFor.PosicionarPagFor_(
     TTecQuery(DBAdvGridSegG.datasource.dataset),
     'pagfor',
     DBAdvGridSegG.cells[DBAdvGridSegG.ColumnByFieldName['pagfor'].index,
     DBAdvGridSegG.row],
     DBAdvGridretorno_pagfor_r3,
     'cod_de_barras',
     DBAdvGridSegG.cells[DBAdvGridSegG.ColumnByFieldName['cod_de_barras'].index,
     DBAdvGridSegG.row]
     );

end;

procedure TfrmLerRetornoPagFor.AdvTabSheetPagamentosShow(Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.PosicionarPagFor_(
     TTecQuery(DBAdvGridretorno_pagfor_r3.datasource.dataset),
     'pagfor',
     DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index,
     DBAdvGridretorno_pagfor_r3.row],
     DBAdvGridSegG,
     'cod_de_barras',
     DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['cod_de_barras'].index,
     DBAdvGridretorno_pagfor_r3.row]
     );


  if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'A' then

    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryretorno_pagfor_r3_segA,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row],
       DBAdvGridsegA,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row]
       )

  else
  if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'J' then

    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryretorno_pagfor_r3_segJ,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row],
       DBAdvGridsegJ,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row]
       )

  else
  if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'N' then

    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryRetorno_pagfor_r3_segN,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row],
       DBAdvGridSEgN,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row]
       )

  else
  if dtmLerRetornoPagFor.qryretorno_pagfor_r3segmento.asString = 'O' then
    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryRetorno_pagfor_r3_segO,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row],
       DBAdvGridSegO,
       'pagfor',
       DBAdvGridretorno_pagfor_r3.cells[DBAdvGridretorno_pagfor_r3.ColumnByFieldName['pagfor'].index, DBAdvGridretorno_pagfor_r3.row]
       );


end;

procedure TfrmLerRetornoPagFor.AdvPageControlTituloChange(Sender: TObject);
begin
  inherited;
  if AdvPageControlTitulo.activepage = AdvTabSheetSegA then

    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryretorno_pagfor_r3,
       'pagfor',
       DBAdvGridsegA.cells[DBAdvGridsegA.ColumnByFieldName['pagfor'].index,
       DBAdvGridsegA.row],
       DBAdvGridretorno_pagfor_r3,
       'pagfor',
       DBAdvGridsegA.cells[DBAdvGridsegA.ColumnByFieldName['pagfor'].index,
       DBAdvGridsegA.row]
       )

  else
  if AdvPageControlTitulo.activepage = AdvTabSheetSegJ then

    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryretorno_pagfor_r3,
       'pagfor',
       DBAdvGridSegJ.cells[DBAdvGridSegJ.ColumnByFieldName['pagfor'].index,
       DBAdvGridSegJ.Row],
       DBAdvGridretorno_pagfor_r3,
       'pagfor',
       DBAdvGridSegJ.cells[DBAdvGridSegJ.ColumnByFieldName['pagfor'].index,
       DBAdvGridSegJ.Row])
  else
  if AdvPageControlTitulo.activepage = AdvTabSheetSegN then

    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryretorno_pagfor_r3,
       'pagfor',
       DBAdvGridSEgN.cells[DBAdvGridSEgN.ColumnByFieldName['pagfor'].index,
       DBAdvGridSEgN.Row],

       DBAdvGridretorno_pagfor_r3,
       'pagfor',
       DBAdvGridSEgN.cells[DBAdvGridSEgN.ColumnByFieldName['pagfor'].index,
       DBAdvGridSEgN.Row])

   else
   if AdvPageControlTitulo.activepage = AdvTabSheetSegO then
    dtmLerRetornoPagFor.PosicionarPagFor_(
       dtmLerRetornoPagFor.qryretorno_pagfor_r3,
       'pagfor',
       DBAdvGridSegO.cells[DBAdvGridSegO.ColumnByFieldName['pagfor'].index,
       DBAdvGridSegO.Row],

       DBAdvGridretorno_pagfor_r3,
       'pagfor',
       DBAdvGridSegO.cells[DBAdvGridSegO.ColumnByFieldName['pagfor'].index,
       DBAdvGridSegO.Row]);

end;

procedure TfrmLerRetornoPagFor.AdvPagePagForChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if (AdvPagePagFor.activepage = AdvTabSheetPagamentos) or
     (AdvPagePagFor.activepage = AdvTabSheetSegmentos) then
   dtmLerRetornoPagFor.SegmentoG := false
  else
  if (AdvPagePagFor.activepage = AdvTabSheetSegG) then
   dtmLerRetornoPagFor.SegmentoG := true;
end;

procedure TfrmLerRetornoPagFor.FormShow(Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.VerificarRegistrosPendentesdeGravacao;

  if dtmLerRetornoPagFor.qryretorno_pagfor_r3_segG.recordcount <> 0 then
  begin
    dtmLerRetornoPagFor.SegmentoG := True;
    AdvPagePagFor.activepage := AdvTabSheetSegG;
  end
  else
  begin
    dtmLerRetornoPagFor.SegmentoG := False;
    AdvPagePagFor.activepage := AdvTabSheetPagamentos;
  end;
  
end;

procedure TfrmLerRetornoPagFor.sbnSalvarClick(Sender: TObject);
begin
  inherited;
  dtmLerRetornoPagFor.SalvarRetornoPagFor;
end;

end.
