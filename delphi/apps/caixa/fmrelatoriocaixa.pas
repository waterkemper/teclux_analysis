unit fmrelatoriocaixa;

interface

uses     
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  fmrelatoriopadrao, ExtCtrls, Buttons, StdCtrls, CheckLst, cpdata,
  dmrelatoriocaixa, biblio, ctconstantes, Mask, DBCtrls, cpcpfcnpj2,
  ToolWin, ComCtrls, frselecaoaleatoria, db, windows,
  frconsulta, frconsultacodigo, frconsultacontabil, frconsultacodigocontabil, cpdbfindcontrols;

type
  Tfrmrelatoriocaixa = class(TfrmRelatorioPadrao)
    gbxRelatorioCaixa: TGroupBox;
    gbxPeriodo: TGroupBox;
    edtPeriodoInicial: TEditData;
    edtPeriodoFinal: TEditData;
    lblPeriodoInicial: TLabel;
    lblPeriodoFinal: TLabel;
    gbxFiliais: TGroupBox;
    clbFiliais: TCheckListBox;
    gbxGruposFiliais: TGroupBox;
    clbGrupodeFiliais: TCheckListBox;
    sbnMarcarFiliais: TSpeedButton;
    sbnDesmarcarFiliais: TSpeedButton;
    sbnMarcarGruposFiliais: TSpeedButton;
    sbnDesmarcarGruposFiliais: TSpeedButton;
    gbxAutenticacoes: TGroupBox;
    clbAutenticacoes: TCheckListBox;
    sbnMarcarAutenticacoes: TSpeedButton;
    sbnDesmarcarAutenticacoes: TSpeedButton;
    gbxAgrupamento: TGroupBox;
    ckbAgruparTipoAutenticacao: TCheckBox;
    gbxCaixas: TGroupBox;
    fraSelecaoAleatoriaFuncionarios: TfraSelecaoAleatoria;
    gbxEvento: TGroupBox;
    fraSelecaoAleatoriaEventos: TfraSelecaoAleatoria;
    procedure sbnMarcarFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarFiliaisClick(Sender: TObject);
    procedure sbnMarcarGruposFiliaisClick(Sender: TObject);
    procedure sbnDesmarcarGruposFiliaisClick(Sender: TObject);
    procedure clbFiliaisClickCheck(Sender: TObject);
    procedure clbGrupodeFiliaisClickCheck(Sender: TObject);
    procedure sbnMarcarAutenticacoesClick(Sender: TObject);
    procedure sbnDesmarcarAutenticacoesClick(Sender: TObject);
    procedure fraSelecaoAleatoriaFuncionariosqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaFuncionariossbnProcuraClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fraSelecaoAleatoriaEventosqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraSelecaoAleatoriaEventossbnProcuraClick(Sender: TObject);
    procedure fraSelecaoAleatoriaEventosdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraSelecaoAleatoriaEventosdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure AtribuirDadosFuncionarios(Found: Boolean);
    procedure AcionarPesquisaFuncionarios;
    procedure AtribuirDadosEventos(Found: Boolean);
    procedure AcionarPesquisaEventos;


  protected
    procedure InternoImpressao; override;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
    procedure   ObterLista(Origem: TStrings; Destino: TCheckListBox);
    procedure   MontaPesquisa;
    function    ValidarCamposSelecao: Boolean;
  end;

var
  frmrelatoriocaixa: Tfrmrelatoriocaixa;

implementation

{$R *.dfm}

{ Tfrmrelatoriocaixa }

constructor Tfrmrelatoriocaixa.Create(Aowner: Tcomponent);
begin
  dtmrelatoriocaixa := Tdtmrelatoriocaixa.Create(self);
  inherited;
  dtmrelatoriocaixa.Abre(ctTabelas);
  ObterLista(dtmrelatoriocaixa.ListaFiliais,clbFiliais);
  ObterLista(dtmrelatoriocaixa.ListaGruposFiliais,clbGrupodeFiliais);
  ObterLista(dtmrelatoriocaixa.ListaAutenticacoes,clbAutenticacoes);
  edtPeriodoInicial.Text := DateToStr(UltimoDiaMesPassado(1));
  edtPeriodoFinal.Text := DateToStr(DataLocal);



  fraSelecaoAleatoriaFuncionarios.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaFuncionarios.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaFuncionarios do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatoriaFuncionarios';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 6;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrProcuraUsuarios;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
    ConsultaSelecaoAleatoria.qryProcuraUsuarios.Sql.Text := dtmrelatoriocaixa.qryCaixas.sql.Text;
    ConsultaSelecaoAleatoria.qryConsultaUsuarios.Sql.Text := dtmrelatoriocaixa.qryConsultaCaixas.sql.Text;
    ConsultaSelecaoAleatoria.naofechartabelapesquisa := true;

    ConsultaSelecaoAleatoria.TipoPesquisa := pesUSUARIOS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosFuncionarios;
  end;

  fraSelecaoAleatoriaEventos.CampoParaLista := 'codigo';
  fraSelecaoAleatoriaEventos.qrySelecaoAleatoria.Open;
  with fraSelecaoAleatoriaEventos do
  begin
    ConsultaSelecaoAleatoriaContabil := TfraConsultaCodigoContabil.Create(self);
    ConsultaSelecaoAleatoriaContabil.Name := 'fraConsultaSelecaoAleatoriaContabilEventos';
    ConsultaSelecaoAleatoriaContabil.edfCodigo.MaxLength := 6;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.DataField := 'codigo';
    ConsultaSelecaoAleatoriaContabil.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.LookupSource := ConsultaSelecaoAleatoriaContabil.dsrProcuraEventos;
    ConsultaSelecaoAleatoriaContabil.edfCodigo.LookupQueryParameter := 'Codigo';
    ConsultaSelecaoAleatoriaContabil.edfCodigo.LookupField := 'Codigo';
    ConsultaSelecaoAleatoriaContabil.AbrirTabelaProcura := false;
    ConsultaSelecaoAleatoriaContabil.TipoPesquisa := pesEVENTO;
    ConsultaSelecaoAleatoriaContabil.OnFound := AtribuirDadosEventos;
  end;


end;

destructor Tfrmrelatoriocaixa.Destroy;
begin
  dtmrelatoriocaixa:=nil;
  inherited;
  frmrelatoriocaixa := nil;
end;

procedure Tfrmrelatoriocaixa.ObterLista(Origem: TStrings;
  Destino: TCheckListBox);
begin
  Destino.Items.AddStrings(Origem);
end;

procedure Tfrmrelatoriocaixa.sbnMarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,True);
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure Tfrmrelatoriocaixa.sbnDesmarcarFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);
end;

procedure Tfrmrelatoriocaixa.sbnMarcarGruposFiliaisClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,True);
  MarcarLista(clbFiliais,False);
end;

procedure Tfrmrelatoriocaixa.sbnDesmarcarGruposFiliaisClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure Tfrmrelatoriocaixa.clbFiliaisClickCheck(Sender: TObject);
begin
  inherited;
  MarcarLista(clbGrupodeFiliais,False);
end;

procedure Tfrmrelatoriocaixa.clbGrupodeFiliaisClickCheck(Sender: TObject);
begin
  inherited;
  MarcarLista(clbFiliais,False);
end;

function Tfrmrelatoriocaixa.ValidarCamposSelecao: Boolean;
begin
  Result := (edtPeriodoInicial.DataValida and edtPeriodoFinal.DataValida);
  if Result then
   begin
    if (not dataembranco(edtPeriodoInicial.text) and not dataembranco(edtPeriodoFinal.text)) then
      Result:=StrToDate(edtPeriodoInicial.Text) <= StrToDate(edtPeriodoFinal.Text);
    if result then
    begin
      Result:=(not dataembranco(edtPeriodoInicial.text) or not dataembranco(edtPeriodoFinal.text));
      if not Result then
      begin
       MensagemAviso(ctDATAINVALIDA);
       edtPeriodoInicial.SetFocus;
      end;
    end
    else
    begin
      MensagemAviso(ctDTINICIALMAIORDTFINAL);
      edtPeriodoInicial.SetFocus;
    end;
   end;
end;

procedure Tfrmrelatoriocaixa.InternoImpressao;
begin
  inherited;
  MontaPesquisa;
end;

procedure Tfrmrelatoriocaixa.MontaPesquisa;
begin
  if ValidarCamposSelecao then begin
    with dtmrelatoriocaixa do begin
      ParametroCabecalho := '';
      DataInicial := edtPeriodoInicial.Text;
      DataFinal   := edtPeriodoFinal.Text;
      Caixas := fraSelecaoAleatoriaFuncionarios.StringSelecionada;
      Eventos := fraSelecaoAleatoriaEventos.StringSelecionada;

      MontarFiltroFiliais(clbFiliais);
      MontarFiltroGrupoFiliais(clbGrupodeFiliais);
      MontarFiltroAutenticacoes(clbAutenticacoes);
      AgruparAutenticacao := ckbAgruparTipoAutenticacao.Checked;

      qryImprimirRelatorio.Open;
      if not qryImprimirRelatorio.IsEmpty then
        ImprimirRelatorio
      else
        MensagemAviso(Format(ctNENHUMREGISTROENCONTRADO,['Registro']));
        qryImprimirRelatorio.Close;
    end;
  end;
end;

procedure Tfrmrelatoriocaixa.sbnMarcarAutenticacoesClick(Sender: TObject);
begin
  inherited;
  MarcarLista(clbAutenticacoes,True);
end;

procedure Tfrmrelatoriocaixa.sbnDesmarcarAutenticacoesClick(
  Sender: TObject);
begin
  inherited;
  MarcarLista(clbAutenticacoes,False);
end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaFuncionariosqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
  var nc: integer;
begin
  inherited;
  with fraSelecaoAleatoriaFuncionarios do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'NOME DO OPERADOR';
    qrySelecaoAleatoria.FieldByName('nome').ReadOnly := true;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;

    with dbgSelecaoAleatoria do
    for nc:= 0 to 1 do with Columns[nc].Title do
    begin
        Alignment:= taCenter;
        Font.Name:= 'helvetica';
        Font.Height:= -9;
    end;
  end;
end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaFuncionariossbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaFuncionarios;

end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaFuncionarios;

end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaFuncionariosdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.CtrlOn then
                      AcionarPesquisaFuncionarios
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaFuncionarios.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.edfCodigo.DoExit;
                 if not fraSelecaoAleatoriaFuncionarios.ConsultaSelecaoAleatoria.qryProcuraUsuarios.IsEmpty then
                    AtribuirDadosFuncionarios(true)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaFuncionarios.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaFuncionarios.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;

end;

procedure Tfrmrelatoriocaixa.AcionarPesquisaFuncionarios;
begin
  with fraSelecaoAleatoriaFuncionarios do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar(ctUSUARIOS);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure Tfrmrelatoriocaixa.AtribuirDadosFuncionarios(Found: Boolean);
begin
  with fraSelecaoAleatoriaFuncionarios do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraUsuarioscodigo.AsString;

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoria.qryProcuraUsuariosnome.AsString;

    qrySelecaoAleatoria.Post;
  end;
end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaEventosqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
  var nc: integer;
  
begin
  inherited;
  with fraSelecaoAleatoriaEventos do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'CÓDIGO';
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := False;

    qrySelecaoAleatoria.FieldByName('nome').DisplayLabel := 'EVENTO';
    qrySelecaoAleatoria.FieldByName('nome').ReadOnly := true;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;

    with dbgSelecaoAleatoria do
    for nc:= 0 to 1 do with Columns[nc].Title do
    begin
        Alignment:= taCenter;
        Font.Name:= 'helvetica';
        Font.Height:= -9;
    end;
    dbgSelecaoAleatoria.Columns[1].Width := 300;
  end;
end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaEventossbnProcuraClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaEventos;
end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaEventosdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaEventos;
end;

procedure Tfrmrelatoriocaixa.AcionarPesquisaEventos;
begin
  with fraSelecaoAleatoriaEventos do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoriaContabil.CtrlOn := True;
    ConsultaSelecaoAleatoriaContabil.InternoPesquisar(ctEVENTO);
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure Tfrmrelatoriocaixa.AtribuirDadosEventos(Found: Boolean);
begin
  with fraSelecaoAleatoriaEventos do
  begin
    qrySelecaoAleatoria.Edit;
    qrySelecaoAleatoria.FieldByName('codigo').AsString :=
        ConsultaSelecaoAleatoriaContabil.qryProcuraEventos.fieldbyname('codigo').AsString;

    qrySelecaoAleatoria.FieldByName('nome').AsString :=
        ConsultaSelecaoAleatoriaContabil.qryProcuraEventos.fieldbyname('descricao').AsString;

    qrySelecaoAleatoria.Post;
  end;

end;

procedure Tfrmrelatoriocaixa.fraSelecaoAleatoriaEventosdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                    fraSelecaoAleatoriaEventos.ConsultaSelecaoAleatoriaContabil.CtrlOn := Shift = [ssCtrl];
                    if (Shift = []) or fraSelecaoAleatoriaEventos.ConsultaSelecaoAleatoriaContabil.CtrlOn then
                      AcionarPesquisaEventos
                  end;
    end;
  end
  else
  case Key of
    VK_Return: if fraSelecaoAleatoriaEventos.dbgSelecaoAleatoria.SelectedIndex = 0  then
               begin
                 fraSelecaoAleatoriaEventos.ConsultaSelecaoAleatoriaContabil.edfCodigo.DoExit;
                 if not fraSelecaoAleatoriaEventos.ConsultaSelecaoAleatoriaContabil.qryProcuraEventos.IsEmpty then
                    AtribuirDadosEventos(True)
                 else
                 begin
                   key := 0;
                   fraSelecaoAleatoriaEventos.dbgSelecaoAleatoria.SelectedIndex := 0;
                   fraSelecaoAleatoriaEventos.dbgSelecaoAleatoria.SetFocus;
                 end;
               end;
  end;
  inherited;

end;

end.
