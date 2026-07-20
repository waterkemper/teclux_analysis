unit fmparametrosselecaoinativos;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmparametroselecaobasica, DB, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, frintervalodata, Mask, ZQuery, {Qete,}
  ctconstantes, cpdbfindcontrols, fmconsultabasica, fmconsultaporcampo,
  cpdatasource, cpdbgrid, cpnumero;

type
  TfrmParametrosSelecaoInativos = class(TfrmParametroSelecaoBasica)
    fraDataPagamento: TfraIntervaloData;
    rgpTelefone: TRadioGroup;
    gbxConceitos: TGroupBox;
    lblConceito: TLabel;
    mkeDiasAtrasoMaximo: TMaskEdit;
    lblMaximoAtrasoDias: TLabel;
    rgbRenegociado: TRadioGroup;
    gbxVazio: TGroupBox;
    lblEstado: TLabel;
    edfConceito: TtecDbEditFind;
    edfEstado: TtecDbEditFind;
    sbnConceito: TSpeedButton;
    sbnEstado: TSpeedButton;
    gbxValor: TGroupBox;
    lblValorMinimo: TLabel;
    lblValorMaximo: TLabel;
    edtValorMinimo: TEditNumero;
    edtValorMaximo: TEditNumero;
    procedure fraIntervaloData1mkeDataInicioChange(Sender: TObject);
    procedure fraIntervaloData1mkeDataFinalChange(Sender: TObject);
    procedure rgbRenegociadoClick(Sender: TObject);
    procedure rgpTelefoneClick(Sender: TObject);
    procedure mkeDiasAtrasoMaximoChange(Sender: TObject);
    procedure bbnExecutarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edfEstadoChange(Sender: TObject);
    procedure edfConceitoChange(Sender: TObject);
    procedure edfConceitoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfEstadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfEstadoExit(Sender: TObject);
    procedure sbnConceitoClick(Sender: TObject);
    procedure sbnEstadoClick(Sender: TObject);
  protected
    procedure MontarParametroSelecao(Parametros:TStringList);
    function  GetSQLInativo: WideString;
    function  GetFiltros: TStringList; override;
    function  NrRegistrosSelecionados: Integer; override;
//procura
    function  InternoPesquisar(Titulo:String) : integer;
    function  JanelaPesquisa: TfrmConsultaBasica;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean;
    function  TabelaDePesquisa: TZDataSet;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet;
    function  Pesquisar(Titulo:String) : integer;
  public
    constructor Create(AOwner: TComponent;SelecaoAnterior: TStringList); reintroduce; virtual;
    destructor  Destroy; override;
    property    SQLInativo: WideString read GetSQLInativo;
  end;

var
  frmParametrosSelecaoInativos: TfrmParametrosSelecaoInativos;
  TipoPesquisa: TtecProcuraClientesCrediario;

implementation

Uses
  biblio,
  dmparametrosselecaoinativos;

{$R *.dfm}

constructor TfrmParametrosSelecaoInativos.Create(AOwner: TComponent;  SelecaoAnterior: TStringList);
begin
  inherited Create(AOwner);
  FDataModulo:= TdtmParametrosSelecaoInativos.Create(Self);
  DataSet:= TdtmParametrosSelecaoInativos(DataModulo).TabelaConsultaInativo;
  TdtmParametrosSelecaoInativos(DataModulo).Abre(ctSACTabelasConsultaInativosFind);
  rgbRenegociadoClick(rgbRenegociado);
  rgpTelefoneClick(rgpTelefone);
  lblQtde.Caption:= '';
  if (SelecaoAnterior.Count > 0) then
     MontarParametroSelecao(SelecaoAnterior);
end;

destructor TfrmParametrosSelecaoInativos.Destroy;
begin                        
  TdtmParametrosSelecaoInativos(DataModulo).Fecha(ctSACTabelasConsultaInativosFind);
  DataModulo.Fecha(ctSACTabelasConsultaInativos);
  TdtmParametrosSelecaoInativos(DataModulo).Free;
  inherited;
end;

procedure TfrmParametrosSelecaoInativos.fraIntervaloData1mkeDataInicioChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).DataPagInicial := fraDataPagamento.DataInicial;
end;

procedure TfrmParametrosSelecaoInativos.fraIntervaloData1mkeDataFinalChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).DataPagFinal := fraDataPagamento.DataFinal;
end;

procedure TfrmParametrosSelecaoInativos.rgbRenegociadoClick(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).Renegociados := TtecSelecao(rgbRenegociado.ItemIndex)
end;

procedure TfrmParametrosSelecaoInativos.rgpTelefoneClick(Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).Telefones := TtecSelecao(rgpTelefone.ItemIndex)
end;

procedure TfrmParametrosSelecaoInativos.mkeDiasAtrasoMaximoChange(Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).DiasAtrasoMaximo := mkeDiasAtrasoMaximo.Text
end;

procedure TfrmParametrosSelecaoInativos.MontarParametroSelecao(Parametros: TStringList);
var
  a,b                         : integer;
  Rotulo,Valor,AuxTexto,Texto : String;
  Idx                         : Integer;
begin
  inherited;
  for a:=0 to Parametros.Count - 1 do begin
    Texto:= ''; Rotulo:= ''; AuxTexto:= ''; Valor:= '';
    AuxTexto:= Parametros.Strings[a];
    for b:= 1 to Length(AuxTexto) do
      if not (AuxTexto[b] in ['"','''',',',' ']) then
         Texto:= Texto + AuxTexto[b];
    Idx   := Pos(':',Texto);
    Rotulo:= Copy(Texto,1,Idx-1);
    if Rotulo = 'DATAPAGAMENTO' then begin
       Valor := Trocar(Copy(Texto,Idx+1,Length(Texto)-Idx),'/',{{DateSeparator} '/'} '/');
       if (Length(Valor) > 10) then begin
         fraDataPagamento.DataInicial:= Copy(Valor,1,10);
         fraDataPagamento.DataFinal  := Copy(Valor,11,20);
       end
       else
         fraDataPagamento.DataInicial:= Copy(Valor,1,10);
    end
    else
      if Rotulo = 'DIASATRASOMAXIMO' then begin
         Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
         mkeDiasAtrasoMaximo.Text:= Valor;
      end
    else
      if Rotulo = 'RENEGOCIADO' then begin
        Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
        if Valor = 'SIM' then rgbRenegociado.ItemIndex := 0
        else
          if Valor = 'NAO' then rgbRenegociado.ItemIndex := 1
          else
            rgbRenegociado.ItemIndex := 2;
        rgbRenegociadoClick(rgbRenegociado);
      end
    else
    if Rotulo = 'CONCEITO' then begin
       Valor  := Copy(Texto,Idx+1,Length(Texto)-Idx);
       edfConceito.Text:= Valor;
    end
    else
    if (Rotulo = 'TELEFONE') then begin
      Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
      if ANSIUpperCase(Valor) = 'SIM' then rgPTelefone.ItemIndex := 0
      else
        if ANSIUpperCase(Valor) = 'NAO' then rgPTelefone.ItemIndex := 1
        else
          rgpTelefone.ItemIndex := 2;
      rgpTelefoneClick(rgpTelefone);
    end;
  end;
end;

function TfrmParametrosSelecaoInativos.GetFiltros: TStringList;
var
  DataVenda,
  DataPagto  :String;
begin
  DataVenda  := '';
  DataPagto := '';
  Result:= TStringList.Create;
  with TdtmParametrosSelecaoInativos(DataModulo) do begin
    if not DataEmBranco(DataPagInicial) then
       DataPagto:= '''' + Trocar(DataPagInicial,'-','/') + '''';
    if not DataEmBranco(DataPagFinal) then
       DataPagto:= DataPagto + ',' + '''' + Trocar(DataPagFinal,'-','/') + '''';
    if not DataEmBranco(DataPagto) then
       Result.Add('" DATAPAGAMENTO: ' + DataPagto + ' ",');
    if Conceitos <> '' then
       Result.Add('" CONCEITO: ' + edfConceito.Text + ' ",');
    if DiasAtrasoMaximo <> '' then
       Result.Add('" DIASATRASOMAXIMO: ' + mkeDiasAtrasoMaximo.Text + ' ",');
    case Renegociados of
      slSIM: Result.Add('" RENEGOCIADO: SIM ",');
      slNAO: Result.Add('" RENEGOCIADO: NAO ",');
    end;
    case Telefones of
      slSIM: Result.Add('" TELEFONE: SIM ",');
      slNAO: Result.Add('" TELEFONE: NAO ",');
    end;
  end;
end;

function TfrmParametrosSelecaoInativos.NrRegistrosSelecionados: Integer;
begin
  Result := TdtmParametrosSelecaoInativos(DataModulo).NrRegistrosSelecionados
end;

procedure TfrmParametrosSelecaoInativos.bbnExecutarClick(Sender: TObject);
begin
//  inherited;
  if Assigned(DataModulo) then begin
    DataModulo.Fecha(ctSACTabelasConsultaInativos);
    TdtmParametrosSelecaoInativos(DataModulo).SetarFaixaValor(edtValorMinimo.Text,edtValorMaximo.Text);
    DataModulo.Abre(ctSACTabelasConsultaInativos);
  end;
  lblQtde.Caption:= IntToStr(NrRegistrosSelecionados);
  bbnOK.Enabled := NrRegistrosSelecionados > 0;
end;

function TfrmParametrosSelecaoInativos.GetSQLInativo: WideString;
begin
  TdtmParametrosSelecaoInativos(DataModulo).qryConsultaInativos.Sql.Delete(0);
  Result := TdtmParametrosSelecaoInativos(DataModulo).qryConsultaInativos.Sql.Text;
end;

procedure TfrmParametrosSelecaoInativos.FormActivate(Sender: TObject);
begin
  inherited;
  fraDataPagamento.mkeDataInicio.SetFocus;
end;

procedure TfrmParametrosSelecaoInativos.edfEstadoChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).Estado := edfEstado.Text
end;

procedure TfrmParametrosSelecaoInativos.edfConceitoChange(
  Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoInativos(DataModulo).Conceitos := edfConceito.Text
end;

function TfrmParametrosSelecaoInativos.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  if TipoPesquisa = tpCONCEITOSCLIENTES then
     Result := TdtmParametrosSelecaoInativos(DataModulo).ExisteConceito(NomeCampo, Value)
  else if TipoPesquisa = tpESTADOSCLIENTES then
     Result := TdtmParametrosSelecaoInativos(DataModulo).ExisteEstado(NomeCampo, Value)
  else Result := false;
end;

function TfrmParametrosSelecaoInativos.InternoPesquisar(
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

function TfrmParametrosSelecaoInativos.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
end;

function TfrmParametrosSelecaoInativos.Pesquisar(Titulo: String): integer;
begin
  TdtmParametrosSelecaoInativos(DataModulo).Abre(ctSACTabelasConsultaInativosProcura);
  Result := InternoPesquisar('Conceito');
  if Result = mrOK then begin
    if TipoPesquisa = tpCONCEITOSCLIENTES then
       TdtmParametrosSelecaoInativos(DataModulo).RefazConsultaConceito(TdtmParametrosSelecaoInativos(DataModulo).CodigoConceito);
    if TipoPesquisa = tpESTADOSCLIENTES then
       TdtmParametrosSelecaoInativos(DataModulo).RefazConsultaEstado(TdtmParametrosSelecaoInativos(DataModulo).CodigoEstado);
  end else Result := mrNone;
  TdtmParametrosSelecaoInativos(DataModulo).Fecha(ctSACTabelasConsultaInativosProcura);
end;

function TfrmParametrosSelecaoInativos.TabelaDePesquisa: TZDataSet;
begin
  if TipoPesquisa = tpCONCEITOSCLIENTES then
     Result := TdtmParametrosSelecaoInativos(DataModulo).ConsultaConceito
  else if TipoPesquisa = tpESTADOSCLIENTES then
     Result := TdtmParametrosSelecaoInativos(DataModulo).ConsultaEstado
  else Result := nil;
end;

function TfrmParametrosSelecaoInativos.TabelaDoParametro(
  Parametro: Integer): TZDataSet;
begin
  if TipoPesquisa = tpCONCEITOSCLIENTES then
     Result := TdtmParametrosSelecaoInativos(DataModulo).ConsultaConceito
  else if TipoPesquisa = tpESTADOSCLIENTES then
     Result := TdtmParametrosSelecaoInativos(DataModulo).ConsultaEstado
  else Result := nil;
end;

procedure TfrmParametrosSelecaoInativos.edfConceitoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   if Shift = [ssCtrl] then begin
                      TipoPesquisa := tpCONCEITOSCLIENTES;
                      Pesquisar('');
                   end;
    end;
  end;

end;

procedure TfrmParametrosSelecaoInativos.edfEstadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   if Shift = [ssCtrl] then begin
                      TipoPesquisa := tpESTADOSCLIENTES;
                      Pesquisar('');
                   end;
    end;
  end;
end;

procedure TfrmParametrosSelecaoInativos.edfEstadoExit(Sender: TObject);
begin
  inherited;
  mkeDiasAtrasoMaximo.SetFocus;
end;

procedure TfrmParametrosSelecaoInativos.sbnConceitoClick(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpCONCEITOSCLIENTES;
  Pesquisar('');
end;

procedure TfrmParametrosSelecaoInativos.sbnEstadoClick(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpESTADOSCLIENTES;
  Pesquisar('');
end;

end.
