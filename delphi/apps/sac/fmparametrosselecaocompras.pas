unit fmparametrosselecaocompras;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Mask,
  StdCtrls, DBCtrls, ExtCtrls, Buttons,
  //Componentes
  cpdbfindcontrols,
  //Repositorio
  dmbasico, fmparametroselecaobasica, frintervalodata, DB, Grids, DBGrids,
  cpdbtext, ZQuery, ZPgSqlQuery, cpquery, cpdatasource, cpdbgrid, cpnumero,
  ComCtrls;

type
  TfrmParametrosSelecaoCompras = class(TfrmParametroSelecaoBasica)
    fraDataVenda: TfraIntervaloData;
    gbxGruposFiliais: TGroupBox;
    edfGruposFiliais: TtecDbEditFind;
    edfFiliais: TtecDbEditFind;
    dtxMnemonicoFilial: TtecDBText;
    dtxMnemonicoGrupoFilial: TtecDBText;
    sbnFilial: TSpeedButton;
    sbnGrupoFiliais: TSpeedButton;
    lblFiliais: TLabel;
    lblGrupoFiliais: TLabel;
    rgpEntregue: TRadioGroup;
    rgpMontado: TRadioGroup;
    rgpTelefone: TRadioGroup;
    gbxValor: TGroupBox;
    lblValorMinimo: TLabel;
    lblValorMaximo: TLabel;
    edtValorMinimo: TEditNumero;
    edtValorMaximo: TEditNumero;
    procedure fraDataVendamkeDataInicioChange(Sender: TObject);
    procedure fraDataVendamkeDataFinalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbnGrupoFiliaisClick(Sender: TObject);
    procedure edfFiliaisEnter(Sender: TObject);
    procedure edfGruposFiliaisEnter(Sender: TObject);
    procedure edfFiliaisFound(Found: Boolean);
    procedure edfGruposFiliaisFound(Found: Boolean);
    procedure bbnExecutarClick(Sender: TObject);
    procedure sbnFilialClick(Sender: TObject);
    procedure sbnGrupoFiliaisClick(Sender: TObject);
    procedure rgpEntregueClick(Sender: TObject);
    procedure rgpMontadoClick(Sender: TObject);
    procedure rgpTelefoneClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  protected
    procedure AtivarProcura; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MontarParametroSelecao(Parametros:TStringList); virtual;
    function  ExisteFilial(Ind: Integer; NomeCampo: String; inf: Variant): boolean;
    function  ExisteGrupoDeFilial(Ind: Integer; NomeCampo: String; inf: Variant): boolean;
    function  GetSQLCompras: WideString;
    function  GetFiltros: TStringList; override;
    function  NrRegistrosSelecionados: Integer; override;
  public
    constructor Create(AOwner: TComponent;SelecaoAnterior: TStringList); reintroduce; virtual;
    destructor  Destroy; override;
    property    SQLCompras: WideString read GetSQLCompras;    
  end;

implementation

uses
  //CLX
  {Qete,}
  //Biblio
  biblio, ctconstantes,
  //Repositorio
  fmconsultaporcampo,
  //Projetos
  dmparametrosselecaocompras;

{$R *.dfm}

constructor TfrmParametrosSelecaoCompras.Create(AOwner: TComponent;SelecaoAnterior: TStringList);
begin
  inherited Create(AOwner);
  FDataModulo:= TdtmParametrosSelecaoCompras.Create(Self);
  DataSet:= TdtmParametrosSelecaoCompras(DataModulo).TabelaParametroContrato;
  lblQtde.Caption:= '';
  rgpTelefoneClick(rgpTelefone);
  rgpMontadoClick(rgpMontado);
  rgpEntregueClick(rgpEntregue);
end;

destructor TfrmParametrosSelecaoCompras.Destroy;
begin
  DataModulo.Fecha(ctSACTabelasConsultaContratos);
  TdtmParametrosSelecaoCompras(DataModulo).Free;
  inherited;
end;

procedure TfrmParametrosSelecaoCompras.MontarParametroSelecao(Parametros: TStringList);
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
    if Rotulo = 'DATAVENDA' then begin
       Valor := Trocar(Copy(Texto,Idx+1,Length(Texto)-Idx),'/',{{DateSeparator} '/'} '/');
       if (Length(Valor) > 10) then begin
         fraDataVenda.DataInicial:= Copy(Valor,1,10);
         fraDataVenda.DataFinal  := Copy(Valor,11,20);
       end
       else
         fraDataVenda.DataInicial:= Copy(Valor,1,10);
    end
    else
    if Rotulo = 'FILIAIS' then begin
       Valor  := Copy(Texto,Idx+1,Length(Texto)-Idx);
       edfFiliais.Text:= Valor;
       TdtmParametrosSelecaoCompras(DataModulo).Filiais := True;
    end
    else
    if Rotulo = 'GRUPOFILIAIS' then begin
       Valor  := Copy(Texto,Idx+1,Length(Texto)-Idx);
       edfGruposFiliais.Text:= Valor;
       TdtmParametrosSelecaoCompras(DataModulo).GrupoFiliais := True;
    end
    else
    if Rotulo = 'ENTREGUE' then begin
        Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
        if ANSIUpperCase(Valor) = 'O' then rgpEntregue.ItemIndex := 0
        else
          if ANSIUpperCase(Valor) = 'N' then rgpEntregue.ItemIndex := 1
          else
            rgpEntregue.ItemIndex := 2;
        rgpEntregueClick(rgpEntregue);
    end
    else
    if Rotulo = 'MONTADOS' then begin
        Valor := Copy(Texto,Idx+1,Length(Texto)-Idx);
        if ANSIUpperCase(Valor) = 'O' then rgpMontado.ItemIndex := 0
        else
          if ANSIUpperCase(Valor) = 'N' then rgpMontado .ItemIndex := 1
          else
            rgpMontado.ItemIndex := 2;
        rgpMontadoClick(rgpMontado);
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

procedure TfrmParametrosSelecaoCompras.fraDataVendamkeDataInicioChange(Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoCompras(DataModulo).DataVendaInicial := fraDataVenda.DataInicial;
end;

procedure TfrmParametrosSelecaoCompras.fraDataVendamkeDataFinalChange(Sender: TObject);
begin
  inherited;
  TdtmParametrosSelecaoCompras(DataModulo).DataVendaFinal := fraDataVenda.DataFinal
end;

procedure TfrmParametrosSelecaoCompras.FormCreate(Sender: TObject);
begin
  inherited;
  fraDataVenda.mkeDataInicio.EditMask := MascaraData;
  fraDataVenda.mkeDataFinal.EditMask  := MascaraData;
end;

function TfrmParametrosSelecaoCompras.ExisteFilial(Ind: Integer; NomeCampo: String;
  inf: Variant): boolean;
begin
  Result := TdtmParametrosSelecaoCompras(DataModulo).ExisteFilial(NomeCampo, inf);
end;

function TfrmParametrosSelecaoCompras.ExisteGrupoDeFilial(Ind: Integer; NomeCampo: String;
  inf: Variant): boolean;
begin
  Result := TdtmParametrosSelecaoCompras(DataModulo).ExisteGrupoDeFilial(NomeCampo, inf);
end;

procedure TfrmParametrosSelecaoCompras.bbnGrupoFiliaisClick(Sender: TObject);
var
  Procurar: TfrmConsultaPorCampo;
begin
  inherited;
  Procurar := TfrmConsultaPorCampo.Create(nil);
  Procurar.ConsultaInterativa := True;
  Procurar.DataSet := TdtmParametrosSelecaoCompras(DataModulo).TabelaConsultaGrupoDeFilial;
  Procurar.ExisteCodigo := ExisteGrupoDeFilial;
//  TdtmParametrosSelecaoCompras(DataModulo).Abre(ctTabelasConsultaGrupoFiliais);
  if Procurar.ShowModal('Grupo Filial') = mrOk then begin
    TdtmParametrosSelecaoCompras(DataModulo).PosicionarGrupoFiliais;
    TdtmParametrosSelecaoCompras(DataModulo).GrupoFiliais := True;
    edfFiliais.Text := '';
  end;
  Procurar.Free;
//  TdtmParametrosSelecaoCompras(DataModulo).Fecha(ctTabelasConsultaGrupoFiliais);
  SetFocus
end;

procedure TfrmParametrosSelecaoCompras.edfFiliaisEnter(Sender: TObject);
begin
  inherited;
  if edfGruposFiliais.Text = '' then
    TdtmParametrosSelecaoCompras(DataModulo).GrupoFiliais := False
end;

procedure TfrmParametrosSelecaoCompras.edfFiliaisFound(Found: Boolean);
begin
  inherited;
  if Assigned(DataModulo) then
  if Found then TdtmParametrosSelecaoCompras(DataModulo).Filiais := True
  else          TdtmParametrosSelecaoCompras(DataModulo).Filiais := False
end;

procedure TfrmParametrosSelecaoCompras.edfGruposFiliaisEnter(Sender: TObject);
begin
  inherited;
  if edfFiliais.Text = '' then
    TdtmParametrosSelecaoCompras(DataModulo).Filiais := False
end;

procedure TfrmParametrosSelecaoCompras.edfGruposFiliaisFound(Found: Boolean);
begin
  inherited;
  if Assigned(DataModulo) then
  if Found then TdtmParametrosSelecaoCompras(DataModulo).GrupoFiliais := True
  else          TdtmParametrosSelecaoCompras(DataModulo).GrupoFiliais := False
end;

function TfrmParametrosSelecaoCompras.NrRegistrosSelecionados: Integer;
begin
  Result := TdtmParametrosSelecaoCompras(DataModulo).NrRegistrosSelecionados
end;

procedure TfrmParametrosSelecaoCompras.bbnExecutarClick(Sender: TObject);
begin
  if Assigned(DataModulo) then begin
    DataModulo.Fecha(ctSACTabelasConsultaContratos);
    TdtmParametrosSelecaoCompras(DataModulo).SetarFaixaValor(edtValorMinimo.Text,edtValorMaximo.Text);
    DataModulo.Abre(ctSACTabelasConsultaContratos);
  end;
  inherited;
end;

procedure TfrmParametrosSelecaoCompras.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F9: if Shift = [ssCtrl] then
               AtivarProcura
  end;
  inherited KeyDown(Key,Shift);
end;

procedure TfrmParametrosSelecaoCompras.AtivarProcura;
begin
  if edfFiliais.Focused then
     sbnFilial.Click
  else if edfGruposFiliais.Focused then
     sbnGrupoFiliais.Click;
end;

procedure TfrmParametrosSelecaoCompras.sbnFilialClick(Sender: TObject);
var
  Procurar: TfrmConsultaPorCampo;
begin
  inherited;
  Procurar := TfrmConsultaPorCampo.Create(nil);
  Procurar.ConsultaInterativa := True;
  Procurar.DataSet := TdtmParametrosSelecaoCompras(DataModulo).TabelaConsultaFilial;
  Procurar.ExisteCodigo := ExisteFilial;
//  TdtmParametrosSelecaoCompras(DataModulo).Abre(ctTabelasConsultaFiliais);
  if Procurar.ShowModal('Filial') = mrOk then begin
    TdtmParametrosSelecaoCompras(DataModulo).PosicionarFiliais;
    TdtmParametrosSelecaoCompras(DataModulo).Filiais := True;
    TdtmParametrosSelecaoCompras(DataModulo).ReFazConsulta(TdtmParametrosSelecaoCompras(DataModulo).qryGruposDeFiliais,[0],[0]);
    edfGruposFiliais.Text := '';    
  end;
  Procurar.Free;
//  TdtmParametrosSelecaoCompras(DataModulo).Fecha(ctTabelasConsultaFiliais);
  SetFocus
end;

procedure TfrmParametrosSelecaoCompras.sbnGrupoFiliaisClick(
  Sender: TObject);
var
  Procurar: TfrmConsultaPorCampo;
begin
  inherited;
  Procurar := TfrmConsultaPorCampo.Create(nil);
  Procurar.ConsultaInterativa := True;
  Procurar.DataSet := TdtmParametrosSelecaoCompras(DataModulo).TabelaConsultaGrupoDeFilial;
  Procurar.ExisteCodigo := ExisteGrupoDeFilial;
//  TdtmParametrosSelecaoCompras(DataModulo).Abre(ctTabelasConsultaGrupoFiliais);
  if Procurar.ShowModal('Grupo Filial') = mrOk then begin
    TdtmParametrosSelecaoCompras(DataModulo).PosicionarGrupoFiliais;
    TdtmParametrosSelecaoCompras(DataModulo).GrupoFiliais := True;
    TdtmParametrosSelecaoCompras(DataModulo).ReFazConsulta(TdtmParametrosSelecaoCompras(DataModulo).qryFiliais,[0],[0]);
  end;
  Procurar.Free;
//  TdtmParametrosSelecaoCompras(DataModulo).Fecha(ctTabelasConsultaGrupoFiliais);
  SetFocus
end;

procedure TfrmParametrosSelecaoCompras.rgpEntregueClick(Sender: TObject);
begin
  inherited;
  if rgpEntregue.ItemIndex > -1 then
    TdtmParametrosSelecaoCompras(DataModulo).Entregue := TtecSelecao(rgpEntregue.ItemIndex);
end;

procedure TfrmParametrosSelecaoCompras.rgpMontadoClick(Sender: TObject);
begin
  inherited;
  if rgpMontado.ItemIndex > -1 then
    TdtmParametrosSelecaoCompras(DataModulo).Montados := TtecSelecao(rgpMontado.ItemIndex);
end;

procedure TfrmParametrosSelecaoCompras.rgpTelefoneClick(Sender: TObject);
begin
  inherited;
  if rgpTelefone.ItemIndex > -1 then
    TdtmParametrosSelecaoCompras(DataModulo).Telefones:= TtecSelecao(rgpTelefone.ItemIndex);
end;

procedure TfrmParametrosSelecaoCompras.FormActivate(Sender: TObject);
begin
  inherited;
  fraDataVenda.mkeDataInicio.SetFocus;
end;

function TfrmParametrosSelecaoCompras.GetSQLCompras: WideString;
begin
  TdtmParametrosSelecaoCompras(DataModulo).qryConsultaContratos.Sql.Delete(0);
  Result := TdtmParametrosSelecaoCompras(DataModulo).qryConsultaContratos.Sql.Text;
end;

function TfrmParametrosSelecaoCompras.GetFiltros: TStringList;
var
  DataVenda: String;
begin
  DataVenda  := '';
  Result:= TStringList.Create;
  with TdtmParametrosSelecaoCompras(DataModulo) do begin
    if not DataEmBranco(DataVendaInicial) then
       DataVenda:= '''' + Trocar(DataVendaInicial,'-','/') + '''';
    if not DataEmBranco(DataVendaFinal) then
       DataVenda:= DataVenda + ',' + '''' + Trocar(DataVendaFinal,'-','/') + '''';
    if not DataEmBranco(DataVenda) then
       Result.Add('" DATAVENDA: ' + DataVenda + ' ",');
    if Filiais then
       Result.Add('" FILIAIS: ' + edfFiliais.Text + ' ",');
    if GrupoFiliais then
       Result.Add('" GRUPOFILIAIS: ' + edfGruposFiliais.Text + ' ",');
    case Entregue of
      slSIM: Result.Add('" ENTREGUE: O ",');
      slNAO: Result.Add('" ENTREGUE: N ",');
    end;
    case Montados of
      slSIM: Result.Add('" MONTADOS: O ",');
      slNAO: Result.Add('" MONTADOS: N ",');
    end;
    case Telefones of
      slSIM: Result.Add('" TELEFONE: SIM ",');
      slNAO: Result.Add('" TELEFONE: NAO ",');
    end;
  end;
end;

End.


