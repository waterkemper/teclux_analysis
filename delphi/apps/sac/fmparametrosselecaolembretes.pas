unit fmparametrosselecaolembretes;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, DBCtrls, Mask, DBGrids, DB, Grids,
  //Terceiros
  ZQuery,
  //Componentes
  cpdbfindcontrols,
  //Respositorio
  fmparametroselecaobasica, frintervalodata, dmBasico, fmajuda,
  fmconsultabasica,
  //Projetos
  dmparametrosselecaoatendimentos, cpdbtext, cpnumero, cpdatasource, cpdbgrid,
  ComCtrls;

type
  TfrmParametrosSelecaoLembretes = class(TfrmParametroSelecaoBasica)
    rgbConcluido: TRadioGroup;
    rgbTelefone: TRadioGroup;
    fraDataLembrete: TfraIntervaloData;
    rgbTipoAtendimento: TRadioGroup;
    gbxVazio: TGroupBox;
    lblDiasdeAtraso: TLabel;
    lblA: TLabel;
    lblConceito: TLabel;
    edfConceito: TtecDbEditFind;
    edtAtrasoInicio: TEditNumero;
    edtAtrasoFinal: TEditNumero;
    sbnConceito: TSpeedButton;
    dtxConceito: TtecDBText;
    procedure fraIntervaloDataLembretemkeDataInicioChange(Sender: TObject);
    procedure fraIntervaloDataLembretemkeDataFinalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbnExecutarClick(Sender: TObject);
    procedure rgbTelefoneClick(Sender: TObject);
    procedure rgbConcluidoClick(Sender: TObject);
    procedure rgbTipoAtendimentoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edfConceitoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbnConceitoClick(Sender: TObject);
    procedure edtAtrasoInicioChange(Sender: TObject);
    procedure edtAtrasoFinalChange(Sender: TObject);
    procedure edfConceitoFound(Found: Boolean);
    procedure edtAtrasoInicioExit(Sender: TObject);
    procedure edtAtrasoFinalExit(Sender: TObject);
  protected
    procedure MontarParametroSelecao(Parametros:TStringList);
    function  GetSQLLembrete: WideString;
    function  GetFiltros: TStringList; override;
    Function  NrRegistrosSelecionados: Integer; override;
    function  InternoPesquisar(Titulo:String) : integer;
    function  JanelaPesquisa: TfrmConsultaBasica;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    function  TabelaDePesquisa: TZDataSet;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet;
    function  Pesquisar(Titulo:String) : integer;
    function  PreparaPeriodo: boolean;
  public
    constructor Create(AOwner: TComponent; SelecaoAnterior:TStringList); reintroduce;
    destructor  Destroy; override;
    property    SQLLembrete: WideString read GetSQLLembrete;
  end;

implementation

uses
  //CLX
  {Qete,}
  //Biblio
  ctconstantes, biblio,
  //Repositorio
  fmconsultaporcampo;

{$R *.dfm}

constructor TfrmParametrosSelecaoLembretes.Create(AOwner: TComponent; SelecaoAnterior:TStringList);
begin
  inherited Create(AOwner);
  FDataModulo:= TdtmParametrosSelecaoAtendimentos.Create(Self);
  UsarParametrosDaTabela:= False;
  DataSet:= TdtmParametrosSelecaoAtendimentos(DataModulo).TabelaParametroLembrete;
  rgbTipoAtendimentoClick(rgbTipoAtendimento);
  rgbTelefoneClick(rgbTelefone);
  edtAtrasoInicioChange(Self);
  edtAtrasoFinalChange(Self);
  lblQtde.Caption:= '';
  if (SelecaoAnterior.Count > 0) then
    MontarParametroSelecao(SelecaoAnterior);
  TdtmParametrosSelecaoAtendimentos(DataModulo).Abre(ctTabelasConsultaAtendimentosConceito);
end;

destructor TfrmParametrosSelecaoLembretes.Destroy;
begin
  TdtmParametrosSelecaoAtendimentos(DataModulo).Fecha(ctTabelasConsultaAtendimentosConceito);
  DataModulo.Fecha(ctTabelasConsultaAtendimentos);
  TdtmParametrosSelecaoAtendimentos(DataModulo).Free;
  inherited;
end;

procedure TfrmParametrosSelecaoLembretes.MontarParametroSelecao(Parametros: TStringList);
var
  a,b                         : integer;
  Rotulo,Valor,AuxTexto,Texto : String;
  Idx                         : Integer;
begin
  for a:=0 to Parametros.Count - 1 do begin
    Texto:= ''; Rotulo:= ''; AuxTexto:= ''; Valor:= '';
    AuxTexto:= Parametros.Strings[a];
    for b:= 1 to Length(AuxTexto) do
      if not (AuxTexto[b] in ['"','''',',',' ']) then
         Texto:= Texto + AuxTexto[b];
    Idx   := Pos(':',Texto);
    Rotulo:= Copy(Texto,1,Idx-1);
    if Rotulo = 'DATALEMBRETE' then begin
       Valor := Trocar(Copy(Texto,Idx+1,Length(Texto)-Idx),'/',{{DateSeparator} '/'} '/');
       if (Length(Valor) > 10) then begin
         fraDataLembrete.DataInicial:= Copy(Valor,1,10);
         fraDataLembrete.DataFinal  := Copy(Valor,11,20);
       end
       else
         fraDataLembrete.DataInicial:= Copy(Valor,1,10);
    end
    else
    if Rotulo = 'CONCLUIDO' then begin
        Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
        if UpperCase(Valor) = 'SIM' then rgbConcluido.ItemIndex := 0
        else
          if UpperCase(Valor) = 'NAO' then rgbConcluido.ItemIndex := 1
          else
            rgbConcluido.ItemIndex := 2;
        rgbConcluidoClick(rgbConcluido);
      end
    else
      if (Rotulo = 'TIPOATENDIMENTO') then begin
        Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
        if UpperCase(Valor) = 'R' then rgbTipoAtendimento.ItemIndex := 0
        else
          if UpperCase(Valor) = 'V' then rgbTipoAtendimento.ItemIndex := 1
          else
            if UpperCase(Valor) = 'C' then rgbTipoAtendimento.ItemIndex := 2
            else
              rgbTipoAtendimento.ItemIndex := 3;
        rgbTipoAtendimentoClick(rgbTipoAtendimento);
      end
    else
      if (Rotulo = 'TELEFONE') then begin
        Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
        if UpperCase(Valor) = 'SIM' then rgbTelefone.ItemIndex := 0
        else
          if UpperCase(Valor) = 'NAO' then rgbTelefone.ItemIndex := 1
          else
            rgbTelefone.ItemIndex := 2;
        rgbTelefoneClick(rgbTelefone);
      end;
  end;
end;

procedure TfrmParametrosSelecaoLembretes.fraIntervaloDataLembretemkeDataInicioChange(Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoAtendimentos(DataModulo).DataLembreteInicial := fraDataLembrete.DataInicial;
end;

procedure TfrmParametrosSelecaoLembretes.fraIntervaloDataLembretemkeDataFinalChange(Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoAtendimentos(DataModulo).DataLembreteFinal := fraDataLembrete.DataFinal
end;

procedure TfrmParametrosSelecaoLembretes.FormCreate(Sender: TObject);
begin
  inherited;
  fraDataLembrete.mkeDataInicio.EditMask := MascaraData;
  fraDataLembrete.mkeDataFinal.EditMask  := MascaraData;
  rgbTipoAtendimentoClick(rgbTipoAtendimento);
  rgbTelefoneClick(rgbTelefone);
  rgbConcluidoClick(rgbConcluido);
end;

procedure TfrmParametrosSelecaoLembretes.bbnExecutarClick(Sender: TObject);
begin        //ctDTINICIALMAIORDTFINAL
  if (DataEmBranco(fraDataLembrete.mkeDataInicio.Text)) and (DataEmBranco(fraDataLembrete.mkeDataFinal.Text)) then
     MensagemAviso(ctERRORDATAEMBRANCO)
  else if PreparaPeriodo then
     if Assigned(DataModulo) then begin
        DataModulo.Fecha(ctTabelasConsultaAtendimentos);
        DataModulo.Abre(ctTabelasConsultaAtendimentos);
     end;
  inherited;
end;

procedure TfrmParametrosSelecaoLembretes.rgbTelefoneClick(Sender: TObject);
begin
  inherited;
  if rgbTelefone.ItemIndex > -1 then
    TdtmParametrosSelecaoAtendimentos(DataModulo).Telefones:= TtecSelecao(rgbTelefone.ItemIndex);
end;

procedure TfrmParametrosSelecaoLembretes.rgbConcluidoClick(Sender: TObject);
begin
  inherited;
  if rgbConcluido.ItemIndex > -1 then
    TdtmParametrosSelecaoAtendimentos(DataModulo).Concluido:= TtecSelecao(rgbConcluido.ItemIndex);
end;

procedure TfrmParametrosSelecaoLembretes.rgbTipoAtendimentoClick(
  Sender: TObject);
begin
  inherited;
  if rgbTipoAtendimento.ItemIndex > -1 then
    TdtmParametrosSelecaoAtendimentos(DataModulo).TipoAtendimento:= TtecTipoAtendimento(rgbTipoAtendimento.ItemIndex);
end;

function TfrmParametrosSelecaoLembretes.NrRegistrosSelecionados: Integer;
begin
  Result := TdtmParametrosSelecaoAtendimentos(DataModulo).NrRegistrosSelecionados
end;

function TfrmParametrosSelecaoLembretes.GetFiltros: TStringList;
var
  DataLembrete: String;
begin
  DataLembrete  := '';
  Result:= TStringList.Create;
  with TdtmParametrosSelecaoAtendimentos(DataModulo) do begin
    if not DataEmBranco(DataLembreteInicial) then
       DataLembrete:= '''' + Trocar(DataLembreteInicial,'-','/') + '''';
    if not DataEmBranco(DataLembreteFinal) then
       DataLembrete:= DataLembrete + ',' + '''' + Trocar(DataLembreteFinal,'-','/') + '''';
    if not DataEmBranco(DataLembrete) then
       Result.Add('" DATALEMBRETE: ' + DataLembrete + ' ",');
    case Concluido of
      slSIM: Result.Add('" CONCLUIDO: SIM ",');
      slNAO: Result.Add('" CONCLUIDO: NAO ",');
    end;
    case TipoAtendimento of
      tpaRECLAMACAO: Result.Add('" TIPOATENDIMENTO: R ",');
      tpaVISITA    : Result.Add('" TIPOATENDIMENTO: V ",');
      tpaCOBRANCA  : Result.Add('" TIPOATENDIMENTO: C ",');
    end;
    case Telefones of
      slSIM: Result.Add('" TELEFONE: SIM ",');
      slNAO: Result.Add('" TELEFONE: NAO ",');
    end;
    Result.Add('" DIAS ATRASO: DE '+edtAtrasoInicio.Text+' ATE '+edtAtrasoFinal.Text+'"');
    if edfConceito.Text <> '' then
       Result.Add('" CONCEITO : '+edfConceito.Text+'"');
  end;
end;

function TfrmParametrosSelecaoLembretes.GetSQLLembrete: WideString;
begin
  TdtmParametrosSelecaoAtendimentos(DataModulo).qryConsultaAtendimentos.Sql.Delete(0);
  Result := TdtmParametrosSelecaoAtendimentos(DataModulo).qryConsultaAtendimentos.Sql.Text;
end;

procedure TfrmParametrosSelecaoLembretes.FormActivate(Sender: TObject);
begin
  inherited;
  fraDataLembrete.mkeDataInicio.SetFocus;
  if DataEmBranco(fraDataLembrete.mkeDataInicio.Text) then
     TdtmParametrosSelecaoAtendimentos(DataModulo).Data;
end;

function TfrmParametrosSelecaoLembretes.ExisteInformacao(
  Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
begin
  Result := TdtmParametrosSelecaoAtendimentos(DataModulo).ExisteConceito(NomeCampo, Value)
end;

function TfrmParametrosSelecaoLembretes.InternoPesquisar(
  Titulo: String): integer;
var
  procurar: TfrmConsultaBasica;
begin
  procurar := JanelaPesquisa;
  procurar.ExisteCodigo := ExisteInformacao;
  procurar.DataSet := TabelaDePesquisa;
  procurar.TabelaParametro := TabelaDoParametro;
  procurar.ProximoControle := ProximoControle;
  Result := procurar.ShowModal(Titulo);
  procurar.Free;
  SetFocus
end;

function TfrmParametrosSelecaoLembretes.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmParametrosSelecaoLembretes.TabelaDePesquisa: TZDataSet;
begin
   Result:= TdtmParametrosSelecaoAtendimentos(DataModulo).ConsultaConceito
end;

function TfrmParametrosSelecaoLembretes.TabelaDoParametro(
  Parametro: Integer): TZDataSet;
begin
   Result:= TdtmParametrosSelecaoAtendimentos(DataModulo).ConsultaConceito
end;

procedure TfrmParametrosSelecaoLembretes.edfConceitoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   if Shift = [ssCtrl] then begin
                      Pesquisar('');
                   end;
    end;
  end;
end;

function TfrmParametrosSelecaoLembretes.Pesquisar(Titulo: String): integer;
begin
  TdtmParametrosSelecaoAtendimentos(DataModulo).Abre(ctTabelasConsultaAtendimentosConsultaConceito);
  Result := InternoPesquisar('Conceito');
  if Result = mrOK then
  TdtmParametrosSelecaoAtendimentos(DataModulo).RefazConsultaConceito(TdtmParametrosSelecaoAtendimentos(DataModulo).CodigoConceito);
  TdtmParametrosSelecaoAtendimentos(DataModulo).Fecha(ctTabelasConsultaAtendimentosConsultaConceito);
end;

procedure TfrmParametrosSelecaoLembretes.sbnConceitoClick(
  Sender: TObject);
begin
  inherited;
  Pesquisar('');
end;

procedure TfrmParametrosSelecaoLembretes.edtAtrasoInicioChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoAtendimentos(DataModulo).AtrasoInicial := edtAtrasoInicio.Text;
end;

procedure TfrmParametrosSelecaoLembretes.edtAtrasoFinalChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoAtendimentos(DataModulo).AtrasoFinal := edtAtrasoFinal.Text;
end;

procedure TfrmParametrosSelecaoLembretes.edfConceitoFound(Found: Boolean);
begin
  inherited;
  TdtmParametrosSelecaoAtendimentos(DataModulo).Conceito := edfConceito.Text;
end;

function TfrmParametrosSelecaoLembretes.PreparaPeriodo: boolean;
begin
   if (DataEmBranco(fraDataLembrete.mkeDataInicio.Text)) then begin
      fraDataLembrete.mkeDataInicio.Text:=fraDataLembrete.mkeDataFinal.Text;
      fraIntervaloDataLembretemkeDataInicioChange(Self);
   end;
   if (DataEmBranco(fraDataLembrete.mkeDataFinal.Text)) then begin
      fraDataLembrete.mkeDataFinal.Text:=fraDataLembrete.mkeDataInicio.Text;
      fraIntervaloDataLembretemkeDataFinalChange(Self);
   end;
   if StrToDate(fraDataLembrete.mkeDataInicio.Text) <= StrToDate(fraDataLembrete.mkeDataFinal.Text) then
      Result := True
   else begin
     MensagemErro(ctDTINICIALMAIORDTFINAL);    
     Result := false;
   end;
end;

procedure TfrmParametrosSelecaoLembretes.edtAtrasoInicioExit(
  Sender: TObject);
begin
  inherited;
  if StrtoInt(edtAtrasoInicio.Text) < 1 then begin
     MensagemErro(ctERRORDIASATRASOINICIAL);
     edtAtrasoInicio.SetFocus;
  end;
end;

procedure TfrmParametrosSelecaoLembretes.edtAtrasoFinalExit(
  Sender: TObject);
begin
  inherited;
  if StrtoInt(edtAtrasoFinal.Text) < StrtoInt(edtAtrasoInicio.Text) then begin
     MensagemErro(ctERRORDIASATRASOFINAL);
     edtAtrasoFinal.SetFocus;
  end;
end;

end.
