unit fmmaladireta;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  {Qete,} ComCtrls,
  // Terceiros
  ZQuery,
  // Componentes
  cpdbgrid, cpdbfindcontrols, cpdbtext, cpdata, cpnumero, cppagecontrol,
  cpdbradiogroup,
  // Repositorio
  fmcadastropadrao, fmconsultaporcampo, fmconsultabasica, fmajudabt,
  // Projeto
  dmmaladireta,
  // Constante
  ctconstantes, biblio;


type
  TfrmMalaDireta = class(TfrmCadastroPadrao)
    gbxPesquisa: TGroupBox;
    pgcMalaDireta: TtecPageControl;
    tstFiltro: TTabSheet;
    lbxFiltro: TListBox;
    btnFiltroConfirma: TButton;
    btnFiltroCancela: TButton;
    cmbOperador: TComboBox;
    cmbFiltro: TComboBox;
    lblFiltro: TLabel;
    edtDadoTexto: TEdit;
    lblOperador: TLabel;
    lblDado: TLabel;
    tstMalaDireta: TTabSheet;
    cmbMalaDireta: TComboBox;
    btnMalaDiretaConfirma: TButton;
    btnMalaDiretaCancela: TButton;
    lbxMalaDireta: TListBox;
    lblCampos: TLabel;
    btnFiltroLimpaLinha: TButton;
    btnFiltroLimpaLista: TButton;
    btnMalaDiretaLimpaLista: TButton;
    btnMalaDiretaLimpaLinha: TButton;
    btnEditarFiltro: TButton;
    edtDadoNumero: TEditNumero;
    edtDadoData: TEditData;
    cmbDadoBoolean: TComboBox;
    SaveDialog1: TSaveDialog;
    gbxTipoMalaDireta: TGroupBox;
    lblMalaDireta: TLabel;
    edfMalaDireta: TtecDbEditFind;
    sbnRelatorio: TSpeedButton;
    Bevel1: TBevel;
    tstSQL: TTabSheet;
    mmoSQL: TMemo;
    rgpNumeroPorPagina: TtecDBRadioGroup;
    rbnNroPag1: TRadioButton;
    rbnNroPag2: TRadioButton;
    procedure btnFiltroConfirmaClick(Sender: TObject);
    procedure btnFiltroCancelaClick(Sender: TObject);
    procedure btnMalaDiretaConfirmaClick(Sender: TObject);
    procedure btnFiltroLimpaLinhaClick(Sender: TObject);
    procedure btnFiltroLimpaListaClick(Sender: TObject);
    procedure btnMalaDiretaCancelaClick(Sender: TObject);
    procedure btnMalaDiretaLimpaLinhaClick(Sender: TObject);
    procedure btnMalaDiretaLimpaListaClick(Sender: TObject);
    procedure btnEditarFiltroClick(Sender: TObject);
    procedure cmbFiltroChange(Sender: TObject);
    procedure edfMalaDiretaFound(Found: Boolean);
    procedure sbnRelatorioClick(Sender: TObject);
  protected
    dtmMalaDireta: TdtmMalaDireta;
    function  InternoExcluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoPesquisar(Titulo:String): Integer; override;
    function  JanelaPesquisa: TfrmConsultaBasica; override;
    function  ExisteInformacao(Parametro: Integer; NomeCampo: String; Value: Variant): Boolean; override;
    function  TabelaDePesquisa: TZDataSet; override;
    function  TabelaDoParametro(Parametro: Integer): TZDataSet; override;

    //procedimentos externos do modulo
    function  ConfereProximoFiltro(i:integer):boolean;
    function  MontaOr(var i:integer):string;
    function  MontaCabecalho:string;
    function  MontaFrom     :string;
    function  MontaSelect   :string;
    function  MontaWhere    :string;
    procedure LeFiltro(linha:string;var filtro,operador,dado:string);
    procedure MontaMalaDireta;
    procedure MontaCombo;
    procedure SelecionaTipoDado(tipo:Char);
    procedure UsaTabelas(tab:string);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;

var
  frmMalaDireta: TfrmMalaDireta;
  tipoPesquisa : TtecPesquisa;
  TabelasUsadas: array [0..2] of boolean;

implementation

//uses fmfiltrocodigo;

//uses fmdevolvecheque, fmalteraremessa;

{$R *.dfm}

{ TfrmManutencaoCheques }

constructor TfrmMalaDireta.Create(AOwner: TComponent);
begin
  dtmMalaDireta := TdtmMalaDireta.Create(Self);
  inherited;
  dtmMalaDireta.Abre(ctMalaDireta);
  DataSet := dtmMalaDireta.TabelaMalaDireta;

  cmbFiltro.Items.Clear;
  cmbMalaDireta.Items.Clear;
  MontaCombo;
  cmbFiltro.ItemIndex:=-1;
  cmbMalaDireta.ItemIndex:=-1;
  pgcMalaDireta.ActivePageIndex:=0;
  mmoSQL.Lines.Clear;
end;

destructor TfrmMalaDireta.Destroy;
begin
  dtmMalaDireta.Fecha(ctMalaDireta);
  dtmMalaDireta.Fecha(ctMalaDiretaMontada);
  inherited;
  frmMalaDireta := nil;
end;

function TfrmMalaDireta.InternoPesquisar(Titulo: String): Integer;
begin
  Titulo:='Mala Direta';
  dtmMalaDireta.Abre(ctMalaDiretaConsulta);
  Result := inherited InternoPesquisar(Titulo);
    if Result = mrOK then begin
       dtmMalaDireta.RefazConsultaMalaDireta;
       lbxFiltro.Items.Text:=(dtmMalaDireta.GetMalaDiretaFiltro);
       lbxMalaDireta.Items.Text:=(dtmMalaDireta.GetMalaDiretaDados);
       pgcMalaDireta.ActivePageIndex:=0;
    end;
  dtmMalaDireta.Fecha(ctMalaDiretaConsulta);
end;

procedure TfrmMalaDireta.MontaCombo;
begin
  dtmMalaDireta.PrimeiroFiltro;
  while dtmMalaDireta.FiltroEof = false do begin
    cmbFiltro.Items.Add(dtmMalaDireta.NomeFiltro);
    cmbMalaDireta.Items.Add(dtmMalaDireta.NomeFiltro);
    dtmMalaDireta.ProximoFiltro;
  end;
end;

procedure TfrmMalaDireta.btnFiltroConfirmaClick(Sender: TObject);
begin
  inherited;
  if (cmbFiltro.Text <> '') and (cmbOperador.Text <> '') then
     if edtDadoTexto.Visible then
        lbxFiltro.Items.Add(cmbFiltro.Text+ '"' + cmbOperador.Text + '"' +edtDadoTexto.Text)
     else if edtDadoNumero.Visible then
        lbxFiltro.Items.Add(cmbFiltro.Text+ '"' + cmbOperador.Text + '"' +edtDadoNumero.Text)
     else if edtDadoData.Visible then
        lbxFiltro.Items.Add(cmbFiltro.Text+ '"' + cmbOperador.Text + '"' +edtDadoData.Text)
     else if cmbDadoBoolean.Visible then
        lbxFiltro.Items.Add(cmbFiltro.Text+ '"' + cmbOperador.Text + '"' +cmbDadoBoolean.Text);
  cmbFiltro.ItemIndex:=-1;
  cmbOperador.ItemIndex:=-1;
  cmbDadoBoolean.ItemIndex:=-1;
  edtDadoTexto.Clear;
  edtDadoNumero.Clear;
  edtDadoData.clear;
  dtmMalaDireta.SetMalaDiretaFiltro(lbxFiltro.Items.Text);
end;

procedure TfrmMalaDireta.btnFiltroCancelaClick(Sender: TObject);
begin
  inherited;
  cmbFiltro.ItemIndex:=-1;
  cmbOperador.ItemIndex:=-1;
  cmbDadoBoolean.ItemIndex:=-1;
  edtDadoTexto.Text:='';
  edtDadoNumero.Text:='';
  edtDadoData.Text:='';
end;

procedure TfrmMalaDireta.btnMalaDiretaConfirmaClick(Sender: TObject);
begin
  inherited;
  if cmbMalaDireta.Text <> '' then
     lbxMalaDireta.Items.Add(cmbMalaDireta.Text);
  cmbMalaDireta.ItemIndex:=-1;
  dtmMalaDireta.SetMalaDiretaDados(lbxMalaDireta.Items.Text);
end;

procedure TfrmMalaDireta.btnFiltroLimpaLinhaClick(Sender: TObject);
begin
  inherited;
  lbxFiltro.Items.Delete(lbxFiltro.ItemIndex);
end;

procedure TfrmMalaDireta.btnFiltroLimpaListaClick(Sender: TObject);
begin
  inherited;
  lbxFiltro.Items.Clear;
end;

procedure TfrmMalaDireta.btnMalaDiretaCancelaClick(Sender: TObject);
begin
  inherited;
  cmbMalaDireta.ItemIndex:=-1;
end;

procedure TfrmMalaDireta.btnMalaDiretaLimpaLinhaClick(Sender: TObject);
begin
  inherited;
  lbxMalaDireta.Items.Delete(lbxMalaDireta.ItemIndex);
end;

procedure TfrmMalaDireta.btnMalaDiretaLimpaListaClick(Sender: TObject);
begin
  inherited;
  lbxMalaDireta.Items.Clear;
end;

function TfrmMalaDireta.MontaSelect: string;
var
  i:integer;
  select:string;
  campo,tabela:string;
begin
  i:=1;
  select:='';
  if lbxMalaDireta.Items.Count < 1 then
     MensagemErro(ctERRORMALADIRETADADOS)
  else begin
     select:='select distinct'+#13+#10;
     dtmMalaDireta.GetCampo(lbxMalaDireta.Items.Strings[i-1],campo,tabela);
     UsaTabelas(Tabela);
     select:=Select+campo+#13+#10;
     while i < lbxMalaDireta.Items.Count do begin
        dtmMalaDireta.GetCampo(lbxMalaDireta.Items.Strings[i],campo,tabela);
        UsaTabelas(Tabela);
        select:=select+','+campo+#13+#10;
        inc(i);
     end;
  end;
  Result:=select;
end;

procedure TfrmMalaDireta.btnEditarFiltroClick(Sender: TObject);
var
  filtro,operador,dado:string;
  TipoDado:char;
  aux:String;
begin
  inherited;
  if lbxFiltro.ItemIndex < 0 then
     MensagemErro(ctERRORMALADIRETAFILTROSELECAO)
  else begin
     LeFiltro(lbxFiltro.Items.Strings[lbxFiltro.ItemIndex],filtro,operador,dado);
     lbxFiltro.Items.Delete(lbxFiltro.ItemIndex);
     edtDadoTexto.Clear;
     edtDadoNumero.Clear;
     cmbFiltro.ItemIndex:=cmbFiltro.Items.IndexOf(filtro);
     cmbOperador.ItemIndex:=cmbOperador.Items.IndexOf(operador);
     aux:=dtmMalaDireta.GetTipoDeDado(cmbFiltro.Text);
     TipoDado:=aux[1];
     SelecionaTipoDado(TipoDado);
  end;
end;

procedure TfrmMalaDireta.LeFiltro(linha: string; var filtro, operador, dado: string);
var
  i,n,m:integer;
begin
  i:=1;
  n:=1;
  m:=1;
  filtro:='';
  operador:='';
  dado:='';
  while i < length(Linha) do begin
    if linha[i] <> '"' then begin
       filtro:=filtro+Linha[i];
       n:=i+2;
       inc(i);
    end else i:=length(Linha);
  end;
  while n < length(linha) do begin
    if linha[n] <> '"' then begin
       operador:=operador+Linha[n];
       m:=n+2;
       inc(n);
    end else n:=length(Linha);
  end;
  while m < length(linha)+1 do begin
    dado:=dado+linha[m];
    inc(m);
  end;
end;

function TfrmMalaDireta.MontaWhere: string;
var
  sql,filtro,operador,dado,tabela:string;
  i:integer;
  where:string;
begin
  where:='';
  i:=0;
  while i < lbxFiltro.Items.Count do begin
    LeFiltro(lbxFiltro.Items.Strings[i],filtro,operador,dado);
    if (i <> lbxFiltro.Items.Count-1) and (ConfereProximoFiltro(i)) then begin
       where:=where+'and ('+MontaOr(i)+')'+#13+#10;
    end else begin
       dtmMalaDireta.GetSQL(filtro,sql,tabela);
       UsaTabelas(Tabela);
       if Dado = 'Falso' then Dado:='False';
       if Dado = 'Verdadeiro' then Dado:='True';
       where:=where+'and '+'('+sql+operador+''''+Dado+''''+')'+#13+#10;
       inc(i);
    end;
  end;
  Result:=where;
end;

function TfrmMalaDireta.ConfereProximoFiltro(i:integer): boolean;
var
  filtro ,operador ,dado :string;
  tfiltro,toperador,tdado:string;
begin
   LeFiltro(lbxFiltro.Items.Strings[i],filtro,operador,dado);
   LeFiltro(lbxFiltro.Items.Strings[i+1],tfiltro,toperador,tdado);
   if ((filtro = tfiltro) and ((operador = '=') and (operador = toperador))) then
      Result:=True
   else Result:=false;
end;


function TfrmMalaDireta.MontaOr(var i: integer): string;
var
  filtro ,operador ,dado ,sql, tabela:string;
  teste:boolean;
  resultado:string;
begin
  teste:=true;
  resultado:='';
  LeFiltro(lbxFiltro.Items.Strings[i],filtro,operador,dado);
  dtmMalaDireta.GetSQL(filtro,sql,tabela);
  UsaTabelas(Tabela);
  resultado:='('+sql+operador+''''+Dado+''''+')';
  while teste = true do begin
    LeFiltro(lbxFiltro.Items.Strings[i+1],filtro,operador,dado);
    dtmMalaDireta.GetSQL(filtro,sql,tabela);
    UsaTabelas(Tabela);
    resultado:=resultado+' or ('+sql+operador+''''+Dado+''''+')';
    inc(i);
    if (i <> lbxFiltro.Items.Count-1) then
       teste:=ConfereProximoFiltro(i)
    else teste:=false;
  end;
  inc(i);
  Result:=Resultado;
end;

procedure TfrmMalaDireta.cmbFiltroChange(Sender: TObject);
var
  filtro:char;
  aux:String;
begin
  inherited;
  aux:=dtmMalaDireta.GetTipoDeDado(cmbFiltro.Text);
  filtro:=aux[1];
  SelecionaTipoDado(filtro);
end;

procedure TfrmMalaDireta.SelecionaTipoDado(tipo: char);
begin
  case tipo of
   'S' : begin
           edtDadoTexto.Visible  :=True;
           edtDadoNumero.Visible :=False;
           edtDadoData.Visible   :=False;
           cmbDadoBoolean.Visible:=False;
         end;
   'N' : begin
           edtDadoTexto.Visible  :=False;
           edtDadoNumero.Visible :=True;
           edtDadoData.Visible   :=False;
           cmbDadoBoolean.Visible:=False;
         end;
   'D' : begin
           edtDadoTexto.Visible  :=False;
           edtDadoNumero.Visible :=False;
           edtDadoData.Visible   :=True;
           cmbDadoBoolean.Visible:=False;
         end;
   'B' : begin
           edtDadoTexto.Visible  :=False;
           edtDadoNumero.Visible :=False;
           edtDadoData.Visible   :=False;
           cmbDadoBoolean.Visible:=True;
         end;
   end;
end;

function TfrmMalaDireta.MontaCabecalho: string;
var
  i:integer;
  cabecalho,cabecalho1:string;
  sql,tabela:string;
begin
  TabelasUsadas[0]:=false;//tabela clientes
  TabelasUsadas[1]:=false;//tabela contratos
  TabelasUsadas[2]:=false;//tabela parcelas
  i:=1;
  cabecalho:='';
  cabecalho1:='';
  dtmMalaDireta.GetSQL(lbxMalaDireta.Items.Strings[i-1],sql,tabela);
  cabecalho:=cabecalho+sql;
  while i < lbxMalaDireta.Items.Count do begin
     dtmMalaDireta.GetSQL(lbxMalaDireta.Items.Strings[i],sql,tabela);
     cabecalho:=cabecalho+','+sql;
     inc(i);
  end;
  i:=1;
  cabecalho:=cabecalho+',CONTADOR';
  if rgpNumeroPorPagina.ItemIndex = 1 then begin
     dtmMalaDireta.GetSQL(lbxMalaDireta.Items.Strings[i-1],sql,tabela);
     cabecalho1:=cabecalho1+sql+'1';
     while i < lbxMalaDireta.Items.Count do begin
       dtmMalaDireta.GetSQL(lbxMalaDireta.Items.Strings[i],sql,tabela);
       cabecalho1:=cabecalho1+','+sql+'1';
       inc(i);
     end;
     Result := cabecalho+','+cabecalho1+',CONTADOR1';
  end else Result := cabecalho;
end;

procedure TfrmMalaDireta.MontaMalaDireta;
var
  arquivo: TStringList;
  i,count:integer;
  linha,linha1:string;
  frag:boolean;
begin
  arquivo:= TStringList.Create;
  arquivo.Clear;
  arquivo.Add(MontaCabecalho);
  Linha:='';
  frag:=false;
  count:=1;
  dtmMalaDireta.PrimeiraLinha;
  while not dtmMalaDireta.UltimaLinha do begin
    for i:=1 to dtmMalaDireta.GetMontadaFieldCount do
      if i=1 then
         Linha:=''+(dtmMalaDireta.GetMontadaField(i-1))
      else Linha:=Linha+','+(dtmMalaDireta.GetMontadaField(i-1));
    Linha:=Linha+','+IntToStr(Count)+'';
    if rgpNumeroPorPagina.ItemIndex = 1 then
       if frag = false then begin
          Linha1:=Linha;
          frag:=true;
          inc(count);
          dtmMalaDireta.ProximaLinha;
       end else begin
          arquivo.Add(linha1+','+linha);
          linha :='';
          linha1:='';
          inc(count);
          dtmMalaDireta.ProximaLinha;
          frag:=false;
       end
    else begin
       arquivo.Add(linha);
       linha:='';
       inc(Count);
       dtmMalaDireta.ProximaLinha;
    end;
  end;
  SaveDialog1.Execute;
  arquivo.SaveToFile(SaveDialog1.FileName);
end;


function TfrmMalaDireta.InternoExcluir: Boolean;
begin
    Result := dtmMalaDireta.ExcluirMalaDireta
end;

function TfrmMalaDireta.InternoGravar: Boolean;
begin
    Result := dtmMalaDireta.GravarMalaDireta
end;

function TfrmMalaDireta.InternoIncluir: Boolean;
begin
    Result := dtmMalaDireta.IncluirMalaDireta
end;

function TfrmMalaDireta.ExisteInformacao(Parametro: Integer;
  NomeCampo: String; Value: Variant): Boolean;
begin
  Result := dtmMalaDireta.ExisteMalaDireta(NomeCampo, Value)
end;

function TfrmMalaDireta.JanelaPesquisa: TfrmConsultaBasica;
begin
  Result := TfrmConsultaPorCampo.Create(nil);
  TfrmConsultaPorCampo(Result).ConsultaInterativa := True;
  TfrmConsultaPorCampo(Result).UsarParametrosDaTabela := True;
end;

function TfrmMalaDireta.TabelaDePesquisa: TZDataSet;
begin
  Result := dtmMalaDireta.ConsultaMaladDireta
end;

function TfrmMalaDireta.TabelaDoParametro(Parametro: Integer): TZDataSet;
begin
  Result := dtmMalaDireta.ConsultaMaladDireta
end;

procedure TfrmMalaDireta.edfMalaDiretaFound(Found: Boolean);
begin
  inherited;
  lbxFiltro.Items.Text:=(dtmMalaDireta.GetMalaDiretaFiltro);
  lbxMalaDireta.Items.Text:=(dtmMalaDireta.GetMalaDiretaDados);
  pgcMalaDireta.ActivePageIndex:=0;
end;

procedure TfrmMalaDireta.sbnRelatorioClick(Sender: TObject);
var
  select,where:string;
begin
  inherited;
  if (lbxFiltro.Items.Text = '') or (lbxMalaDireta.Items.Text = '') then
     MensagemErro(ctERRORMALADIRETAGERACAO)
  else begin
    select:=MontaSelect;
    where :=MontaWhere;
    mmoSQL.Text:=select+MontaFrom+where;
    dtmMalaDireta.Fecha(ctMalaDiretaMontada);
    dtmMalaDireta.SetMontadaSql(select+MontaFrom+where);
    dtmMalaDireta.Abre(ctMalaDiretaMontada);
    MontaMalaDireta;
  end;
end;

procedure TfrmMalaDireta.UsaTabelas(tab: string);
begin
  tab:= ANSIUpperCase(tab);
  if tab = 'CLIENTES'  then TabelasUsadas[0] := True;
  if tab = 'CONTRATOS' then TabelasUsadas[1] := True;
  if tab = 'PARCELAS'  then TabelasUsadas[2] := True;
end;

function TfrmMalaDireta.MontaFrom: string;
var
  aux:string;
begin
  aux:='';
  if (TabelasUsadas[0] = True) and (TabelasUsadas[1] = False) and (TabelasUsadas[2] = False) then
      aux := 'from clientes'+#13+#10+'where (clientes.codigo is not null)'+#13+#10
  else if (TabelasUsadas[1] = True) and (TabelasUsadas[0] = False) and (TabelasUsadas[2] = False) then
      aux := 'from contratos'+#13+#10+'where (contratos.numero is not null)'+#13+#10
  else if (TabelasUsadas[2] = True) and (TabelasUsadas[0] = False) and (TabelasUsadas[1] = False) then
      aux := 'from parcelas'+#13+#10+'where (parcelas.contrato is not null)'+#13+#10
  else if (TabelasUsadas[0] = True) and (TabelasUsadas[1] = True) and (TabelasUsadas[2] = False) then
      aux := 'from clientes,contratos'+#13+#10+'where (clientes.codigo = contratos.cliente)'+#13+#10
  else if (TabelasUsadas[1] = True) and (TabelasUsadas[2] = True) and (TabelasUsadas[0] = False) then
      aux := 'from contratos,parcelas'+#13+#10+'where (parcelas.contrato = contratos.numero)'+#13+#10
  else begin
      aux := 'from clientes,contratos,parcelas'+#13+#10;
      aux := aux + 'where (clientes.codigo = contratos.cliente)'+#13+#10;
      aux := aux + 'and (parcelas.contrato = contratos.numero)'+#13+#10;
  end;
  Result := aux;
end;

procedure TfrmMalaDireta.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F6 : sbnRelatorio.Click;
  end;
  inherited;
end;

end.
