unit fmoperacoesosp;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadrao, ComCtrls, Buttons, ExtCtrls, dmoperacoesosp,
  Grids, DBGrids, cpdbgrid, Mask, cpdbfindcontrols, frconsulta, frconsultacodigo,
  ctconstantes, Windows, DB, DBCtrls, cpdbtext, cpnumero, cptexto,
  cpdblookupcombobox, ActnList, dateutils, ToolWin, fmlertexto;

type
  TfrmOperacoesOSP = class(TfrmCadastroPadrao)
    gbxNumero: TGroupBox;
    edfOSP: TtecDbEditFind;
    dbgOPeracoesOSP: TtecDBGrid;
    gbxOperacoesOSP: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbgOPeracoesOSPUsuarioFalhas: TtecDBGrid;
    dbgOPeracoesOSPUsuario: TtecDBGrid;
    pnlRodape: TPanel;
    shNotaImpressa: TShape;
    lblOperacaoAtual: TLabel;
    gbxComplemento: TGroupBox;
    gbxProdutonoCliente: TGroupBox;
    gbxProdutoCliente: TGroupBox;
    edtProdutoCliente: TDBEditTexto;
    gbxFinalidade: TGroupBox;
    edtFinalidade: TDBEditTexto;
    gbxOrigem: TGroupBox;
    edtOrigem: TDBEditTexto;
    gbxPN: TGroupBox;
    edtPN: TDBEditTexto;
    gbxQuantidadeProduto: TGroupBox;
    gbxPedida: TGroupBox;
    edtQuantidade: TDBEditNumero;
    dtxUnidade: TtecDBText;
    gbxEntregue: TGroupBox;
    dtxEntregue: TtecDBText;
    gbxSaldo: TGroupBox;
    dtxSaldo: TtecDBText;
    gbxProduto: TGroupBox;
    gbxCodigoProduto: TGroupBox;
    dtxProduto: TtecDBText;
    dtxComplemento: TtecDBText;
    pnlOperacoesOSP: TPanel;
    pnlOperacoesOSPUsuarios: TPanel;
    pnlOperacoesOSPUsuariosFalhas: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    aclHabilitar: TActionList;
    actHabilitar: TAction;
    gbxTamLoteProducao: TGroupBox;
    edtLoteProducao: TDBEditNumero;
    gbxQtdadeExcedente: TGroupBox;
    edtExcedentePermitido: TDBEditNumero;
    lblDefinirAlternativas: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    lblProduzido: TLabel;
    DBEditNumero1: TDBEditNumero;
    Label3: TLabel;
    DBEditNumero3: TDBEditNumero;
    Shape2: TShape;
    Label4: TLabel;
    edfLote: TtecDbEditFind;
    Label5: TLabel;
    lblLote: TLabel;
    GroupBox1: TGroupBox;
    Timer1: TTimer;
    DBEditNumero4: TDBEditNumero;
    Label6: TLabel;
    dbgOPeracoesOSPUsuarioParadas: TtecDBGrid;
    pnldbgOPeracoesOSPUsuario: TPanel;
    Bevel3: TBevel;
    lblDefiniComplementar: TLabel;
    lblCtrl_C: TLabel;
    gbxDescricaoMaquina: TGroupBox;
    dtxDescricaoMaquina: TtecDBText;
    sbnFechar: TSpeedButton;
    lblCtrl_F: TLabel;
    lblForcarFechamento: TLabel;
    DBEditNumero2: TDBEditNumero;
    DBEditNumero5: TDBEditNumero;
    Label7: TLabel;
    lblFixaraSenha: TLabel;
    gbxFluxograma: TGroupBox;
    DBEditNumero6: TDBEditNumero;
    dbgOutrasOrigensDestinos: TtecDBGrid;
    gbxOutrasOrigensDestinos: TGroupBox;
    procedure sbnProcurarClick(Sender: TObject);
    procedure dbgOPeracoesOSPUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOPeracoesOSPUsuarioDblClick(Sender: TObject);
    procedure dbgOPeracoesOSPDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FocarGradeUsuario;
    procedure dbgOPeracoesOSPUsuarioFalhasDblClick(Sender: TObject);
    procedure dbgOPeracoesOSPUsuarioFalhasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure edfOSPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfOSPFound(Found: Boolean);
    procedure actHabilitarUpdate(Sender: TObject);
    procedure dbgOPeracoesOSPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfLoteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure dbgOPeracoesOSPUsuarioParadasDblClick(Sender: TObject);
    procedure dbgOPeracoesOSPUsuarioParadasKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure sbnFecharClick(Sender: TObject);
    procedure edfOSPEnter(Sender: TObject);
    procedure edfLoteEnter(Sender: TObject);
    procedure edfOSPExit(Sender: TObject);
    procedure edfLoteExit(Sender: TObject);
  protected
    ConsultaOSP : TfraConsultaCodigo;
    ConsultaUsuarios : TfraConsultaCodigo;
    ConsultaUsuariosSetup : TfraConsultaCodigo;
    ConsultaUsuariosFechamento : TfraConsultaCodigo;
    ConsultaMaquinas: TfraConsultaCodigo;
    ConsultaOperacoes : TfraConsultaCodigo;

    ConsultaFalhas : TfraConsultaCodigo;
    ConsultaParadas : TfraConsultaCodigo;

    function  InternoExcluir: Boolean; override;
    procedure Percorrer(Campo: Byte; var Key: Word; Shift: TShiftState);
    function  InternoIncluir: Boolean; override;
    function  InternoGravar: Boolean; override;
    procedure SelecionarCampoQuantidade(Sender: TObject);
    procedure SelecionarCampoUsuario(Sender: TObject);
    procedure SelecionarCampoOSP(Sender: TObject);
    procedure SelecionarGradeFalhas(Sender: TObject);
    procedure SetarParametrosGrade(Sender: TObject);
    procedure CondicoesMaquinas;




  private
    { Private declarations }
    fAtribuirDadosFalhas: boolean;

    procedure AbrirOSP;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure CondicoesOperacoesOSPUsuario;
    procedure CondicoesOperacoesOSPUsuarioSetup;
    procedure CondicoesOperacoesOSPUsuarioFechamento;

    procedure CondicoesOperacoesOSPUsuarioFalhas;
    procedure CondicoesOperacoesOSPUsuarioParadas;

    procedure AtribuirDadosUsuarios;
    procedure AtribuirDadosUsuariosSetup;
    procedure AtribuirDadosUsuariosFechamento;


    procedure AtribuirDadosFalhas;


    procedure AtribuirDadosParadas;
    procedure AtribuirDadosMaquinas;
    procedure AtribuirDadosOperacoesosp;

    procedure AcionarPesquisaGradeUsuarios;
    procedure AcionarPesquisaGradeFalhas;
    procedure AcionarPesquisaGradeParadas;
    procedure CondicoesOperacoesOsp;

    function AcionarPesquisaGradeOperacao: boolean;


  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmOperacoesOSP: TfrmOperacoesOSP;

implementation

uses biblio, fmOperacoesemLote;

{$R *.dfm}

{ TfrmOperacoesOSP }

procedure TfrmOperacoesOSP.AbrirOSP;
begin
  edfOSP.Text := ConsultaOSP.qryProcuraOSP.FieldByName('Numero').AsString;
  edfLote.Text := '1';
  dtmOperacoesOSP.
        refazconsulta(dtmOperacoesOSP.qryOSPLotes,[0,1,2,3],
             [0,0,ConsultaOSP.qryProcuraOSP.FieldByName('Numero').asvariant,1]);

  if dtmOperacoesOSP.qryOSPLotes.IsEmpty then
    MensagemAviso('Esta OSP não possui lotes de produção definidos.');

  sbnIncluir.Enabled := dtmOperacoesOSP.qryOSPLotes.RecordCount <> 0;

end;

constructor TfrmOperacoesOSP.Create(AOwner: TComponent);
begin
  dtmOperacoesOSP := TdtmOperacoesOSP.Create(Self);
  inherited;
  DataSet := dtmOperacoesOSP.qryOSPLotes;

  ConsultaOSP := TfraConsultaCodigo.Create(self);
  ConsultaOSP.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaOSP.edfCodigo.DataSource := dtmOperacoesOSP.dsrOSPLotes;
  ConsultaOSP.edfCodigo.DataField := 'numero';
  ConsultaOSP.edfCodigo.Operacao := opPESQUISA;
  ConsultaOSP.AbrirTabelaProcura := False;
  ConsultaOSP.TipoCliente := 'C';
  ConsultaOSP.Tipovfornecedor := 'C';
  ConsultaOSP.TipoPesquisa := pesOSP;
  ConsultaOSP.OnFound := AbrirOSP;
  ConsultaOSP.Name := 'fraConsultaOSP';

  ConsultaUsuarios := TfraConsultaCodigo.Create(self);
  ConsultaUsuarios.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaUsuarios.Name := 'fraConsultaUsuario';
  ConsultaUsuarios.edfCodigo.MaxLength := 3;
  ConsultaUsuarios.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSPUsuario;
  ConsultaUsuarios.edfCodigo.DataField := 'Usuario';
  ConsultaUsuarios.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaUsuarios.edfCodigo.LookupSource := ConsultaUsuarios.dsrProcuraUsuarios;
  ConsultaUsuarios.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaUsuarios.edfCodigo.LookupField := 'Codigo';
  ConsultaUsuarios.AbrirTabelaProcura := false;
  ConsultaUsuarios.CondicoesdaConsulta := CondicoesOperacoesOSPUsuario;
  ConsultaUsuarios.TipoPesquisa := pesUsuarioS;
  ConsultaUsuarios.OnFound := AtribuirDadosUsuarios;

  ConsultaUsuariosSetup := TfraConsultaCodigo.Create(self);
  ConsultaUsuariosSetup.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaUsuariosSetup.Name := 'fraConsultaUsuarioSetup';
  ConsultaUsuariosSetup.edfCodigo.MaxLength := 3;
  ConsultaUsuariosSetup.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSPUsuario;
  ConsultaUsuariosSetup.edfCodigo.DataField := 'Usuariosetup';
  ConsultaUsuariosSetup.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaUsuariosSetup.edfCodigo.LookupSource := ConsultaUsuariosSetup.dsrProcuraUsuarios;
  ConsultaUsuariosSetup.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaUsuariosSetup.edfCodigo.LookupField := 'Codigo';
  ConsultaUsuariosSetup.AbrirTabelaProcura := false;
  ConsultaUsuariosSetup.CondicoesdaConsulta := CondicoesOperacoesOSPUsuarioSetup;
  ConsultaUsuariosSetup.TipoPesquisa := pesUsuarioS;
//ConsultaUsuariosSetup.OnFound := AtribuirDadosUsuariosSetup;


  ConsultaUsuariosFechamento := TfraConsultaCodigo.Create(self);
  ConsultaUsuariosFechamento.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaUsuariosFechamento.Name := 'fraConsultaUsuarioFechamento';
  ConsultaUsuariosFechamento.edfCodigo.MaxLength := 3;
  ConsultaUsuariosFechamento.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSPUsuario;
  ConsultaUsuariosFechamento.edfCodigo.DataField := 'Usuariotermino';
  ConsultaUsuariosFechamento.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaUsuariosFechamento.edfCodigo.LookupSource := ConsultaUsuariosFechamento.dsrProcuraUsuarios;
  ConsultaUsuariosFechamento.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaUsuariosFechamento.edfCodigo.LookupField := 'Codigo';
  ConsultaUsuariosFechamento.AbrirTabelaProcura := false;
  ConsultaUsuariosFechamento.CondicoesdaConsulta := CondicoesOperacoesOSPUsuarioFechamento;
  ConsultaUsuariosFechamento.TipoPesquisa := pesUsuarioS;
//  ConsultaUsuariosFechamento.OnFound := AtribuirDadosUsuarios;



  ConsultaFalhas := TfraConsultaCodigo.Create(self);
  ConsultaFalhas.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaFalhas.Name := 'fraConsultaFalhas';
  ConsultaFalhas.edfCodigo.MaxLength := 3;
  ConsultaFalhas.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSPUsuarioFalhas;
  ConsultaFalhas.edfCodigo.DataField := 'falha';
  ConsultaFalhas.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaFalhas.edfCodigo.LookupSource := ConsultaFalhas.dsrProcuraFalhas;
  ConsultaFalhas.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaFalhas.edfCodigo.LookupField := 'Codigo';
  ConsultaFalhas.AbrirTabelaProcura := false;
  ConsultaFalhas.CondicoesdaConsulta := CondicoesOperacoesOSPUsuarioFalhas;
  ConsultaFalhas.TipoPesquisa := pesFALHAS;
  ConsultaFalhas.OnFound := AtribuirDadosFalhas;


  ConsultaParadas := TfraConsultaCodigo.Create(self);
  ConsultaParadas.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaParadas.Name := 'fraConsultaParadas';
  ConsultaParadas.edfCodigo.MaxLength := 3;
  ConsultaParadas.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSPUsuarioParadas;
  ConsultaParadas.edfCodigo.DataField := 'codigoparada';
  ConsultaParadas.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaParadas.edfCodigo.LookupSource := ConsultaParadas.dsrProcuraMotivosParadas;
  ConsultaParadas.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaParadas.edfCodigo.LookupField := 'Codigo';
  ConsultaParadas.AbrirTabelaProcura := false;
  ConsultaParadas.CondicoesdaConsulta := CondicoesOperacoesOSPUsuarioParadas;
  ConsultaParadas.TipoPesquisa := pesMOTIVOSPARADAS;
  ConsultaParadas.OnFound := AtribuirDadosParadas;

  ConsultaMaquinas := TfraConsultaCodigo.Create(self);
  ConsultaMaquinas.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaMaquinas.Name := 'fraConsultaMaquina';
  ConsultaMaquinas.edfCodigo.MaxLength := 3;
  ConsultaMaquinas.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSPUsuario;
  ConsultaMaquinas.edfCodigo.DataField := 'maquina';
  ConsultaMaquinas.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaMaquinas.edfCodigo.LookupSource := ConsultaMaquinas.dsrProcuraMaquinas;
  ConsultaMaquinas.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaMaquinas.edfCodigo.LookupField := 'Codigo';
  ConsultaMaquinas.AbrirTabelaProcura := false;
  ConsultaMaquinas.CondicoesdaConsulta := CondicoesMaquinas;
  ConsultaMaquinas.TipoPesquisa := pesMAQUINAS;
  ConsultaMaquinas.OnFound := AtribuirDadosMaquinas;


  ConsultaOperacoes := TfraConsultaCodigo.Create(self);
  ConsultaOperacoes.edfCodigo.NaoExecutarLookupFound := true;
  ConsultaOperacoes.Name := 'fraConsultaOperacoes';
  ConsultaOperacoes.edfCodigo.MaxLength := 3;
  ConsultaOperacoes.edfCodigo.DataSource := dtmOperacoesOSP.dsrOperacoesOSP;
  ConsultaOperacoes.edfCodigo.DataField := 'operacao';
  ConsultaOperacoes.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaOperacoes.edfCodigo.LookupSource := ConsultaOperacoes.dsrProcuraOperacaoes;
  ConsultaOperacoes.edfCodigo.LookupQueryParameter := 'Codigo';
  ConsultaOperacoes.edfCodigo.LookupField := 'Codigo';
  ConsultaOperacoes.AbrirTabelaProcura := false;
 // ConsultaOperacoes.CondicoesdaConsulta := CondicoesOperacoesOsp;
  ConsultaOperacoes.TipoPesquisa := pesOPERACOES;
  ConsultaOperacoes.OnFound := AtribuirDadosOperacoesOsp;

         (*
  if dtmOperacoesOSP.UltimaOSP<>0 then
  begin
    edfOSP.Text := inttostr(dtmOperacoesOSP.UltimaOSP);
    edfLote.text := '1';
    edfosp.Exist;
//    edfLote.exist;

  end;
           *)

  dbgOPeracoesOSP.onDelete := dtmOperacoesOSP.ExcluirOperacao;


  dbgOPeracoesOSPUsuario.OnDelete := dtmOperacoesOSP.ExcluirOperacoesOSPUsuario;
  dbgOPeracoesOSPUsuario.OnPost := dtmOperacoesOSP.GravarOperacoesOSPUsuario;

  dbgOPeracoesOSPUsuarioFalhas.OnDelete := dtmOperacoesOSP.ExcluirOperacoesOSPUsuarioFalhas;
  dbgOPeracoesOSPUsuarioFalhas.onPost := dtmOperacoesOSP.GravarOperacoesOSPUsuarioFalhas;

  dbgOPeracoesOSPUsuarioParadas.OnDelete := dtmOperacoesOSP.ExcluirOperacoesOSPUsuarioParadas;
  dbgOPeracoesOSPUsuarioParadas.onPost := dtmOperacoesOSP.GravarOperacoesOSPUsuarioParadas;

  dtmOperacoesOSP.SelecionarCampoQuantidade := SelecionarCampoQuantidade;
  dtmOperacoesOSP.SelecionarCampoUsuario := SelecionarCampoUsuario;
  dtmOperacoesOSP.SelecionarCampoOSP := SelecionarCampoOSP;
  dtmOperacoesOSP.SelecionarGradeFalhas := SelecionarGradeFalhas;
  dtmOperacoesOSP.SetarParametrosGrade := SetarParametrosGrade;


  dtmOperacoesOSP.TempoAbrirJanela := now()+20;

  self.WindowState := wsMaximized;



end;

destructor TfrmOperacoesOSP.Destroy;
begin

  inherited;
end;

procedure TfrmOperacoesOSP.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not CtrlOn then
  begin
    if (key =VK_F8) then
      sbnFecharClick(self)
    else
    if (key =VK_F9) then
    begin
      if sbnProcurar.Enabled then
      begin
        dtmOperacoesOSP.incluindocodigoUsuario := true;
        ConsultaOSP.InternoPesquisar('OSP');
         dtmOperacoesOSP.incluindocodigoUsuario := false;
        self.SetFocus;
      end
    end
  end
  else
  begin
    if key = VK_G then
    begin
      dtmOperacoesOSP.FixarSenhaGerente;
      if lblFixaraSenha.caption = 'FIXAR A SENHA DO GERENTE' then  lblFixaraSenha.caption := 'RETIRAR A SENHA DO GERENTE'
      else lblFixaraSenha.caption := 'FIXAR A SENHA DO GERENTE';
    end;
      
  end;
  dtmOperacoesOSP.TempoAbrirJanela := now();
end;

procedure TfrmOperacoesOSP.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  ConsultaOSP.InternoPesquisar(ctOSP);
  self.SetFocus;
end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Procedure VerificarUsuarios;
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) or
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.IsEmpty) then
       begin
//          dtmOperacoesOSP.GravarOperacoesOSPUsuario;
          ConsultaUsuarios.edfCodigo.Modified := true;
          ConsultaUsuarios.edfCodigo.DoExit;
          if ConsultaUsuarios.qryProcuraUsuarios.IsEmpty then
          begin
            dtmOperacoesOSP.LimparOperacoesOSPUsuario;
            dbgOPeracoesOSPUsuario.SetFocus;
            dbgOPeracoesOSPUsuario.SelectedIndex := 0;
          end
          else
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuarioValidado.AsBoolean := true;
            AtribuirDadosUsuarios;
            dbgOPeracoesOSPUsuario.SetFocus;
//            dbgOPeracoesOSPUsuario.SelectedIndex := 0;
          end;
       end;
  end;

  Procedure VerificarUsuariosSetup;
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) or
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.IsEmpty) then
       begin
//          dtmOperacoesOSP.GravarOperacoesOSPUsuario;
          ConsultaUsuariosSetup.edfCodigo.Modified := true;
          ConsultaUsuariosSetup.edfCodigo.DoExit;
          if ConsultaUsuariosSetup.qryProcuraUsuarios.IsEmpty then
          begin
            dtmOperacoesOSP.LimparOperacoesOSPUsuarioSetup;
            dbgOPeracoesOSPUsuario.SetFocus;
            dbgOPeracoesOSPUsuario.SelectedIndex := 2;
          end
          else
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuariosetupValidado.AsBoolean := true;
            AtribuirDadosUsuariosSetup;
            dbgOPeracoesOSPUsuario.SetFocus;
//            dbgOPeracoesOSPUsuario.SelectedIndex := 2;
          end;
       end;
  end;

  Procedure VerificarUsuariosFechamento;
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) or
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.IsEmpty) then
       begin
//          dtmOperacoesOSP.GravarOperacoesOSPUsuario;
          ConsultaUsuariosFechamento.edfCodigo.Modified := true;
          ConsultaUsuariosFechamento.edfCodigo.DoExit;
          if ConsultaUsuariosFechamento.qryProcuraUsuarios.IsEmpty then
          begin
            dtmOperacoesOSP.LimparOperacoesOSPUsuarioFechamento;
            dbgOPeracoesOSPUsuario.SetFocus;
            dbgOPeracoesOSPUsuario.SelectedIndex := 5;
          end
          else
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuariofechamentoValidado.AsBoolean := true;
            AtribuirDadosUsuariosFechamento;
            dbgOPeracoesOSPUsuario.SetFocus;
//            dbgOPeracoesOSPUsuario.SelectedIndex := 5;
          end;
       end;
  end;

  Procedure VerificarMaquinas;
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) or
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.IsEmpty) then
       begin
//          dtmOperacoesOSP.GravarOperacoesOSPUsuario;
          ConsultaMaquinas.edfCodigo.Modified := true;
          ConsultaMaquinas.edfCodigo.DoExit;
          if ConsultaMaquinas.qryProcuraMaquinas.IsEmpty then
          begin
            dtmOperacoesOSP.LimparOperacoesOSPUsuarioMaquinas;
            dbgOPeracoesOSPUsuario.SetFocus;
            dbgOPeracoesOSPUsuario.SelectedIndex := 13;
          end
          else
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuariomaquinaValidada.AsBoolean := true;
            AtribuirDadosUsuarios;
            dbgOPeracoesOSPUsuario.SetFocus;
//            dbgOPeracoesOSPUsuario.SelectedIndex := 11;
          end;
       end;
  end;


begin
  inherited;
  case dbgOPeracoesOSPUsuario.SelectedIndex of
  0,
  1 : begin
        if dtmOperacoesOSP.tipologin = gerenteProducao then
        begin
          if Shift = [ssCtrl] then
          begin
            case Key of
             VK_F9     : begin
                             ConsultaUsuarios.CtrlOn := Shift = [ssCtrl];
                             if (Shift = []) or ConsultaUsuarios.CtrlOn then
                               AcionarPesquisaGradeUsuarios
                           end;
            end;
          end
          else
          case Key of
           VK_Return: VerificarUsuarios;

           VK_Up,
           VK_Down,
           VK_PRIOR,
           VK_next: begin
                            if dtmOperacoesOSP.RegistrodeOperacoesOSPUsuario then
                            begin
                              dtmOperacoesOSP.EditarOperacoesOSPUsuario;
                              dtmOperacoesOSP.qryOperacoesOSPUsuario.CheckRequiredFields;
                              key := 0;
                            end;
                          end;

           VK_Escape : begin
                           dtmOperacoesOSP.CancelarOperacoesOSPUsuario;
                           if dbgOPeracoesOSPUsuario.Focused then
                           begin
                             dbgOPeracoesOSPUsuario.SetFocus;
                             dbgOPeracoesOSPUsuario.SelectedIndex := 0;
                           end;
                         end;
          end;
        end;
      end;

  2 : begin
        if dtmOperacoesOSP.tipologin = gerenteProducao then
        begin
          if Shift = [ssCtrl] then
          begin
            case Key of
             VK_F9     : begin
                             ConsultaUsuariosSetup.CtrlOn := Shift = [ssCtrl];
                             if (Shift = []) or ConsultaUsuariosSetup.CtrlOn then
                               AcionarPesquisaGradeUsuarios
                           end;
            end;
          end
          else
          case Key of
           VK_Return: VerificarUsuariosSetup;

           VK_Up,
           VK_Down,
           VK_PRIOR,
           VK_next: begin
                            if dtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioSetup then
                            begin
                              dtmOperacoesOSP.EditarOperacoesOSPUsuario;
                              dtmOperacoesOSP.qryOperacoesOSPUsuario.CheckRequiredFields;
                              key := 0;
                            end;
                          end;

           VK_Escape : begin
                           dtmOperacoesOSP.CancelarOperacoesOSPUsuarioSetup;
                           if dbgOPeracoesOSPUsuario.Focused then
                           begin
                             dbgOPeracoesOSPUsuario.SetFocus;
                             dbgOPeracoesOSPUsuario.SelectedIndex := 2;
                           end;
                         end;
          end;
        end;
      end;

  5 : begin
        if dtmOperacoesOSP.tipologin = gerenteProducao then
        begin
          if Shift = [ssCtrl] then
          begin
            case Key of
             VK_F9     : begin
                             ConsultaUsuariosFechamento.CtrlOn := Shift = [ssCtrl];
                             if (Shift = []) or ConsultaUsuariosFechamento.CtrlOn then
                               AcionarPesquisaGradeUsuarios
                           end;
            end;
          end
          else
          case Key of
           VK_Return: VerificarUsuariosFechamento;

           VK_Up,
           VK_Down,
           VK_PRIOR,
           VK_next: begin
                            if dtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioSetup then
                            begin
                              dtmOperacoesOSP.EditarOperacoesOSPUsuario;
                              dtmOperacoesOSP.qryOperacoesOSPUsuario.CheckRequiredFields;
                              key := 0;
                            end;
                          end;

           VK_Escape : begin
                           dtmOperacoesOSP.CancelarOperacoesOSPUsuarioFechamento;
                           if dbgOPeracoesOSPUsuario.Focused then
                           begin
                             dbgOPeracoesOSPUsuario.SetFocus;
                             dbgOPeracoesOSPUsuario.SelectedIndex := 5;
                           end;
                         end;
          end;
        end;
      end;

  13: begin
        if dtmOperacoesOSP.tipologin = gerenteProducao then
        begin
          if Shift = [ssCtrl] then
          begin
            case Key of
             VK_F9     : begin
                             ConsultaMaquinas.CtrlOn := Shift = [ssCtrl];
                             if (Shift = []) or ConsultaMaquinas.CtrlOn then
                               AcionarPesquisaGradeUsuarios
                           end;
            end;
          end
          else
          case Key of
           VK_Return: VerificarMaquinas;

           VK_Up,
           VK_Down,
           VK_PRIOR,
           VK_next: begin
                            if dtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioMaquinas then
                            begin
                              dtmOperacoesOSP.EditarOperacoesOSPUsuario;
                              dtmOperacoesOSP.qryOperacoesOSPUsuario.CheckRequiredFields;
                              key := 0;
                            end;
                          end;

           VK_Escape : begin
                           dtmOperacoesOSP.CancelarOperacoesOSPUsuario;
                           if dbgOPeracoesOSPUsuario.Focused then
                           begin
                             dbgOPeracoesOSPUsuario.SetFocus;
                             dbgOPeracoesOSPUsuario.SelectedIndex := 13;
                           end;
                         end;
          end;
        end;
      end;

{
  8 : begin
        if (dtmOperacoesOSP.TipoLogin = Operador) and
           (dtmOperacoesOSP.StatusCadastro = FinalizandoOperacao) and
           (dtmOperacoesOSP.qryOperacoesOSPUsuarioquantidade.AsInteger <> 0) then
          case Key of
           VK_Return : begin
                           if dtmOperacoesOSP.GravarOperacoesOSPUsuario then
                           begin
                             actHabilitarUpdate(nil);
                             SelecionarGradeFalhas(nil);
                           end;
                         end;
          end;
      end;
}
  end;

  if dtmOperacoesOSP.tipologin = gerenteProducao then
  begin
    case Key of
      VK_Return: begin
                  if dbgOPeracoesOSPUsuario.SelectedIndex = 13 then
                    InternoGravar
                  else
                    dbgOPeracoesOSPUsuario.SelectedIndex := dbgOPeracoesOSPUsuario.SelectedIndex + 1;
                 end;
    end;
  end;


end;

procedure TfrmOperacoesOSP.CondicoesOperacoesOSPUsuario;
const
//  SQL = ' and ((codigo not in (%s) and (inativo is null or inativo > current_date)) or codigo = %s) ';
  SQL = ' and (codigo not in (%s) and (inativo is null or inativo > current_date)) ';
  SQLCodigoAtual = ' or codigo = %s';
{  SQLOperacao = ' and codigo in (select nsu.Usuario '+
                               ' from niveissalariaisUsuarios nsu '+
                                    ' join operacoesniveissalariais ons '+
                                    ' on nsu.nivelsalarial = ons.nivelsalarial '+
                               ' where ons.operacao = %s) ';}

  SQLOperacao = ' and codigo in (select uit.Usuario '+
                               ' from Usuariosinstrucoestrabalho uit '+
                               '      join instrucoestrabalho it '+
                               '      on uit.instrucaotrabalho = it.codigo '+
                               '      join instrucoestrabalhooperacoes ito '+
                               '      on uit.instrucaotrabalho = ito.instrucaotrabalho '+
                               ' where ito.operacao = %s '+
                               '   and (it.inativo is null or it.inativo > current_date)) '+

                ' and codigo not in (select oou.Usuario '+
                                   ' from operacoesospUsuario oou '+
                                        ' join operacoes o on oou.operacao = o.codigo '+
                                   ' where oou.termino is null '+
                                     ' and not coalesce(o.naobloqueiaUsuario,false)) ';

//  SQL_2 = ' and ((inativo is null or inativo > current_date) or codigo = %s) ';
  SQL_2 = ' and (inativo is null or inativo > current_date) ';
  SQLOperacao_2 = ' and codigo in (select uit.Usuario '+
                               ' from Usuariosinstrucoestrabalho uit '+
                               '      join instrucoestrabalho it '+
                               '      on uit.instrucaotrabalho = it.codigo '+
                               '      join instrucoestrabalhooperacoes ito '+
                               '      on uit.instrucaotrabalho = ito.instrucaotrabalho '+
                               ' where ito.operacao = %s '+
                               '   and (it.inativo is null or it.inativo > current_date)) ';
begin
  if not dtmOperacoesOSP.SenhadoGerenteFixada then
  begin
    ConsultaUsuarios.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaUsuariosTerminoAberto]) +
      format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

    ConsultaUsuarios.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaUsuariosTerminoAberto]) +
      format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuario.AsString<>'') and
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.state = dsinsert) then
    begin
      ConsultaUsuarios.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
        format(SQL,[dtmOperacoesOSP.ListaUsuariosTerminoAberto]) +
        format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]) +
        format(SQLCodigoAtual, [inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuario.asinteger)]);
    end;
  end
  else
  begin
    ConsultaUsuarios.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      SQL_2 +
      format(SQLOperacao_2, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

    ConsultaUsuarios.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
      SQL_2 +
      format(SQLOperacao_2, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuario.AsString<>'') and
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.state = dsinsert) then
    begin

      ConsultaUsuarios.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
        SQL_2  +
        format(SQLOperacao_2, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]) +
        format(SQLCodigoAtual, [inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuario.asinteger)]);
    end;
  end;
end;

procedure TfrmOperacoesOSP.AtribuirDadosUsuarios;
begin
  with dtmOperacoesOSP do
  begin
    if (qryOperacoesOSPUsuarioNome.AsString <> ConsultaUsuarios.qryProcuraUsuariosNome.AsString) or
       (qryOperacoesOSPUsuarioUsuario.AsString <> ConsultaUsuarios.qryProcuraUsuarioscodigo.AsString) then
    begin
      EditarOperacoesOSPUsuario;
      qryOperacoesOSPUsuarioNome.           AsString := ConsultaUsuarios.qryProcuraUsuariosNome.  AsString;
      qryOperacoesOSPUsuarioUsuario.        AsString := ConsultaUsuarios.qryProcuraUsuariosCodigo.AsString;
      qryOperacoesOSPUsuarioTurno.          AsInteger:= ConsultaUsuarios.qryProcuraUsuariosTurno. AsInteger;
      qryOperacoesOSPUsuarioUsuarioValidado.AsBoolean:= true;
    end;
  end;
end;

procedure TfrmOperacoesOSP.AcionarPesquisaGradeUsuarios;
begin
   if not dtmOperacoesOSP.qryOperacoesOSPUsuario.ReadOnly and
      (dtmOperacoesOSP.TipoLogin = GerenteProducao) then
   begin
     dbgOPeracoesOSPUsuario.SetFocus;
     case dbgOPeracoesOSPUsuario.SelectedIndex of
       0,1 : // Usuario abertura
       begin
         ConsultaUsuarios.CtrlOn := True;
         ConsultaUsuarios.InternoPesquisar(ctUsuarioS);
         dbgOPeracoesOSPUsuario.SetFocus;
         dbgOPeracoesOSPUsuario.SelectedIndex :=  0;
       end;
       2:   // Usuario setup
       begin
         ConsultaUsuariosSetup.CtrlOn := True;
         ConsultaUsuariosSetup.InternoPesquisar(ctUsuarioS);
         dbgOPeracoesOSPUsuario.SetFocus;
         dbgOPeracoesOSPUsuario.SelectedIndex :=  2;
       end;
       5: // Usuario fechamento
       begin
         ConsultaUsuariosFechamento.CtrlOn := True;
         ConsultaUsuariosFechamento.InternoPesquisar(ctUsuarioS);
         dbgOPeracoesOSPUsuario.SetFocus;
         dbgOPeracoesOSPUsuario.SelectedIndex :=  5;
       end;
       13: //máquina
       begin
         ConsultaMaquinas.CtrlOn := True;
         ConsultaMaquinas.InternoPesquisar(ctMAQUINAS);
         dbgOPeracoesOSPUsuario.SetFocus;
         dbgOPeracoesOSPUsuario.SelectedIndex :=  13;
       end;
     end;
   end;
end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPUsuarioDblClick(Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeUsuarios;
end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if dtmOperacoesOSP.qryOperacoesOSPoperacaoemandamento.AsBoolean then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clRed;
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
  end
  else
  if (dtmOperacoesOSP.qryOperacoesOSPSaldoFaltanteGeral.AsInteger <= 0) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlue;
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
  end
  else
   TDBGrid(Sender).Canvas.Font.Style := [];

  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if column = dbgOPeracoesOSP.Columns[0] then
  begin
    if dtmOperacoesOSP.qryOperacoesOSPoperacaoliberada.AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Font.Color := clWhite;
      TDBGrid(Sender).Canvas.Brush.Color := clGreen;

//      if not (dtmOperacoesOSP.qryOperacoesOSPSaldoFaltante.AsInteger > 0)  then
//        TDBGrid(Sender).Canvas.Font.Color := clBlack;
//    else
//      TDBGrid(Sender).Canvas.Font.Color := clWhite;

      TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    end;
    {
    else
     TDBGrid(Sender).Canvas.Font.Style := [];
     }

    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;
end;

procedure TfrmOperacoesOSP.FormShow(Sender: TObject);
begin
  inherited;
  edfOSP.SetFocus;
  edfosp.SelectAll
{
  focarGradeUsuario;}
end;

function TfrmOperacoesOSP.InternoExcluir: Boolean;
begin
  Result:= inherited InternoExcluir;
  if Result then begin
    if not CtrlOn then
    begin
      result := dtmOperacoesOSP.ExcluirOperacoesOSP;
      if result then
      begin
        edfOSP.Clear;
        edfLote.clear;
      end;

    end
  end;
end;

procedure TfrmOperacoesOSP.FocarGradeUsuario;
begin
  dbgOPeracoesOSPUsuario.SetFocus;
  if dtmOperacoesOSP.qryOperacoesOSPUsuario.IsEmpty then
    dbgOPeracoesOSPUsuario.SelectedIndex := 0
  else
    dbgOPeracoesOSPUsuario.SelectedIndex := 6;
end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPUsuarioFalhasDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeFalhas;
end;

procedure TfrmOperacoesOSP.AcionarPesquisaGradeFalhas;
begin
  if not dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.ReadOnly and
     (dtmOperacoesOSP.TipoLogin = GerenteProducao) then
  begin
    dbgOPeracoesOSPUsuarioFalhas.SetFocus;
    ConsultaFalhas.CtrlOn := True;
    ConsultaFalhas.InternoPesquisar('FALHAS');
    dbgOPeracoesOSPUsuarioFalhas.SetFocus;
    dbgOPeracoesOSPUsuarioFalhas.SelectedIndex :=  0;
  end;
end;

procedure TfrmOperacoesOSP.AtribuirDadosFalhas;
var
  vResult : boolean;
  vOperacaoAtual : integer;
begin
  fAtribuirDadosFalhas := true;
  vResult := true;
  with dtmOperacoesOSP do
  begin
    if ConsultaFalhas.qryProcuraFalhasoperacaoorigemfalha.AsInteger <> 0 then
    begin
      RefazConsultaPorNome(qryVerificarFalhaOperacaoOrigem,['QuantidadeFalha','falha','osp','lote','sequencia','operacaoorigem'],
        [qryOperacoesOSPUsuarioFalhasquantidadeperda.Asinteger,
         ConsultaFalhas.qryProcuraFalhasfalhaoperacaoorigem.AsInteger,
         qryOSPLotesosp.Asinteger,
         qryOSPLotesnumero.Asinteger,
         qryOperacoesOSPsequencia.asstring,
         ConsultaFalhas.qryProcuraFalhasoperacaoorigemfalha.AsInteger]);

      if qryVerificarFalhaOperacaoOrigem.isempty then
      begin
        if (qryOperacoesOSPUsuarioFalhas.state in [dsinsert, dsedit]) then
          qryOperacoesOSPUsuarioFalhas.Cancel;

        MensagemErro('Esta falha está vinculada à operação "'+
                         Trim(ConsultaFalhas.qryProcuraFalhasNome_operacaofalhaoriginal.asstring+ ' '+
                              ConsultaFalhas.qryProcuraFalhasc01_operacaofalhaoriginal.asstring+ ' '+
                              ConsultaFalhas.qryProcuraFalhasc02_operacaofalhaoriginal.asstring+ ' '+
                              ConsultaFalhas.qryProcuraFalhasc03_operacaofalhaoriginal.asstring+ '"'+#10#13+
                             'que não é precedente da operação atual ou não há quantidade produzida.'));
        vResult := false;

        fAtribuirDadosFalhas := false;
      end;
    end;

    if vResult then
    begin
      EditarOperacoesOSPUsuarioFalhas;
      qryOperacoesOSPUsuarioFalhasfalha.AsString := ConsultaFalhas.qryProcuraFalhascodigo.AsString;
      qryOperacoesOSPUsuarioFalhasdescricao.AsString := ConsultaFalhas.qryProcuraFalhasdescricao.AsString;
      qryOperacoesOSPUsuarioFalhasperdatotal.AsBoolean := ConsultaFalhas.qryProcuraFalhasperdatotal.AsBoolean;
      qryOperacoesOSPUsuarioFalhasFalhaValidada.AsBoolean := true;

      if ConsultaFalhas.qryProcuraFalhasfalhaoperacaoorigem.AsInteger <> 0 then
      begin
        qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.AsInteger := ConsultaFalhas.qryProcuraFalhasoperacaoorigemfalha.AsInteger;
        qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.AsInteger := ConsultaFalhas.qryProcuraFalhasfalhaoperacaoorigem.AsInteger;
      end
      else
      begin
        qryOperacoesOSPUsuarioFalhasoperacaoorigemfalha.clear;
        qryOperacoesOSPUsuarioFalhasfalhaoperacaoorigem.clear;
      end;
    end;
  end;
end;

procedure TfrmOperacoesOSP.CondicoesOperacoesOSPUsuarioFalhas;
const
  SQL = ' and (codigo not in (%s) or codigo = %s) ';
  SQLOperacao = 'and (codigo in (select fo.falha from falhasoperacoes fo where fo.operacao = %s)) ';
begin
  if (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasfalha.AsString<>'') and
     not (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.state = dsinsert) then
  begin
    ConsultaFalhas.qryProcuraFalhas.MacroByName('SQLFalhasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaFalhas,
                  inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasfalha.asinteger)]);

    ConsultaFalhas.qryConsultaFalhas.MacroByName('SQLFalhasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaFalhas,
                  inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasfalha.asinteger)]);
  end
  else
  begin
    ConsultaFalhas.qryProcuraFalhas.MacroByName('SQLFalhasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaFalhas, inttostr(0)]);

    ConsultaFalhas.qryConsultaFalhas.MacroByName('SQLFalhasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaFalhas, inttostr(0)]);
  end;

  if dtmOperacoesOSP.qryOperacoesOSPoperacao.AsString <> '' then
  begin
    ConsultaFalhas.qryProcuraFalhas.MacroByName('SQLOperacoes').AsString :=
    format(SQLOperacao,[dtmOperacoesOSP.qryOperacoesOSPoperacao.AsString]);

    ConsultaFalhas.qryConsultaFalhas.MacroByName('SQLOperacoes').AsString :=
    format(SQLOperacao,[dtmOperacoesOSP.qryOperacoesOSPoperacao.AsString]);
  end
  else
  begin
    ConsultaFalhas.qryProcuraFalhas.MacroByName('SQLOperacoes').AsString :=
    format(SQLOperacao,['0']);

    ConsultaFalhas.qryConsultaFalhas.MacroByName('SQLOperacoes').AsString :=
    format(SQLOperacao,['0']);
  end;
end;


procedure TfrmOperacoesOSP.CondicoesOperacoesOSPUsuarioParadas;
const
  SQL = ' and (codigo not in (%s) or codigo = %s) ';

begin
  if (dtmOperacoesOSP.qryOperacoesOSPUsuarioParadascodigoparada.AsString<>'') and
     not (dtmOperacoesOSP.qryOperacoesOSPUsuarioParadas.state = dsinsert) then
  begin
    ConsultaParadas.qryProcuraMotivosParadas.MacroByName('SQLParadasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaParadas,
                  inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioParadascodigoparada.asinteger)]);

    ConsultaParadas.qryConsultaMotivosParadas.MacroByName('SQLParadasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaParadas,
                  inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioParadascodigoparada.asinteger)]);
  end
  else
  begin
    ConsultaParadas.qryProcuraMotivosParadas.MacroByName('SQLParadasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaParadas, inttostr(0)]);

    ConsultaParadas.qryConsultaMotivosParadas.MacroByName('SQLParadasJaSelecionadas').AsString :=
      format(SQL,[dtmOperacoesOSP.ListaParadas, inttostr(0)]);
  end;

end;


procedure TfrmOperacoesOSP.dbgOPeracoesOSPUsuarioFalhasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
  Procedure VerificarFalhas;
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.State in [dsedit,dsinsert]) or
       not (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.IsEmpty) then
       begin
          ConsultaFalhas.edfCodigo.Modified := true;
          ConsultaFalhas.edfCodigo.DoExit;

          if not fAtribuirDadosFalhas or
             (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasfalha.AsInteger = 0) then
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.cancel;
            dtmOperacoesOSP.LimparOperacoesOSPUsuarioFalhas;
            dbgOPeracoesOSPUsuarioFalhas.SetFocus;
            dbgOPeracoesOSPUsuarioFalhas.SelectedIndex := 0;
          end
          else
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhasfalhaValidada.AsBoolean := true;
//            AtribuirDadosFalhas;
            dbgOPeracoesOSPUsuarioFalhas.SetFocus;
            dbgOPeracoesOSPUsuarioFalhas.SelectedIndex := 0;
          end;
       end;
  end;

begin
  inherited;
  if dtmOperacoesOSP.tipologin = gerenteProducao then
  begin
    case dbgOPeracoesOSPUsuarioFalhas.SelectedIndex of
    0 :
      begin
        if Shift = [ssCtrl] then
        begin
          case Key of
           VK_F9     : begin
                           ConsultaFalhas.CtrlOn := Shift = [ssCtrl];
                           if (Shift = []) or ConsultaFalhas.CtrlOn then
                             AcionarPesquisaGradeFalhas
                         end;
          end;
        end
        else
        case Key of
         VK_Return: VerificarFalhas;

         VK_Up,
         VK_Down,
         VK_PRIOR,
         VK_next: begin
                          if dtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioFalhas then
                          begin
                            dtmOperacoesOSP.EditarOperacoesOSPUsuarioFalhas;
                            dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.CheckRequiredFields;
                            key := 0;
                          end;
                        end;

         VK_Escape : begin
                         dtmOperacoesOSP.CancelarOperacoesOSPUsuarioFalhas;
                         if dbgOPeracoesOSPUsuarioFalhas.Focused then
                         begin
                           dbgOPeracoesOSPUsuarioFalhas.SetFocus;
                           dbgOPeracoesOSPUsuarioFalhas.SelectedIndex := 0;
                         end;
                       end;
        end;
      end;
   {
    1 :
      begin
        if dtmOperacoesOSP.tipologin = operador then
           dtmOperacoesOSP.GravarOperacoesOSPUsuarioFalhas
      end;
      }
    end;
  end;
end;

procedure TfrmOperacoesOSP.edfOSPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Percorrer(cmposp, Key, Shift);
end;

procedure TfrmOperacoesOSP.Percorrer(Campo: Byte; var Key: Word;
  Shift: TShiftState);
begin
   if (Key =VK_next) or
      (Key =VK_PRIOR)   or
     ((ssCtrl in Shift) and ((Key =VK_Home) or (Key =VK_End))) then
   begin
     dtmOperacoesOSP.Percorrer(Campo, Key, Shift);
//     edfCodigo.Text := dtmPlanoContas.qryPlanoContascodigo.AsString;
//     edfcodigo.Exist;
     case campo of
      cmposp : begin
                 edfOSP.SetFocus;
                 edfOSP.SelectAll;
               end;
      cmplote: begin
                 edfLote.SetFocus;
                 edfLote.SelectAll;
               end;
     end;

     SelecionarCampoOSP(self);

     if dtmOperacoesOSP.qryOSPLotes.RecordCount<>0 then
     begin
//       edfOSP.Exist;
       edfOSP.SetControl(true);
//       edfOSPFound(true);
     end;

   end;

end;

function TfrmOperacoesOSP.InternoIncluir: Boolean;
begin
  Result:= inherited InternoIncluir;
  if Result then
     dtmOperacoesOSP.IncluirOperacoesOSP;
end;

procedure TfrmOperacoesOSP.edfOSPFound(Found: Boolean);
begin
  inherited;
  sbnIncluir.Enabled := found;
end;

procedure TfrmOperacoesOSP.SelecionarCampoQuantidade(Sender: TObject);
begin
//  pnlOperacoesOSP.Enabled := false;
//  pnlOperacoesOSPUsuariosFalhas.Enabled := false;
  dbgOPeracoesOSPUsuario.SetFocus;
  dbgOPeracoesOSPUsuario.SelectedIndex := 6;
end;

function TfrmOperacoesOSP.InternoGravar: Boolean;
begin
  if dtmOperacoesOSP.Gravardados then
  begin
    SelecionarCampoOSP(nil);
    dtmOperacoesOSP.MarcarOperacaoemAndamento;

    if dtmOperacoesOSP.SenhadoGerenteFixada then
    begin
      dtmOperacoesOSP.qryOperacoesOSPAfterScroll(nil);
      dbgOPeracoesOSPUsuario.setfocus;
      dbgOPeracoesOSPUsuario.SelectedIndex := 0;
    end;
  end;
end;

procedure TfrmOperacoesOSP.SelecionarCampoUsuario(Sender: TObject);
begin
//  pnlOperacoesOSP.Enabled := false;
//  pnlOperacoesOSPUsuariosFalhas.Enabled := false;
  dbgOPeracoesOSPUsuario.SetFocus;
  dbgOPeracoesOSPUsuario.SelectedIndex := 0;
end;

procedure TfrmOperacoesOSP.SelecionarCampoOSP(Sender: TObject);
begin
//  dtmOperacoesOSP.TipoLogin := NaoInformado;
  dtmOperacoesOSP.StatusCadastro := Nenhum;
  dtmOperacoesOSP.qryOperacoesOSPUsuario.RequestLive := false;
  dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.RequestLive := false;
end;

procedure TfrmOperacoesOSP.SelecionarGradeFalhas(Sender: TObject);
begin
  dbgOPeracoesOSPUsuarioFalhas.SetFocus;
  dbgOPeracoesOSPUsuarioFalhas.SelectedIndex := 0;
end;

procedure TfrmOperacoesOSP.actHabilitarUpdate(Sender: TObject);
begin
  inherited;
  if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) or
     (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.State in [dsedit,dsinsert]) then
  begin
    pnlOperacoesOSP.Enabled := false;

    if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State in [dsedit,dsinsert]) then
       pnlOperacoesOSPUsuariosFalhas.Enabled := false;

    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioFalhas.State in [dsedit,dsinsert]) then
       pnldbgOPeracoesOSPUsuario.Enabled := false;
  end
  else
  begin
    pnlOperacoesOSP.Enabled := true;
    pnldbgOPeracoesOSPUsuario.Enabled := true;
    pnlOperacoesOSPUsuariosFalhas.Enabled := true;
  end;

  sbnExcluir.Enabled := dtmOperacoesOSP.TipoLogin = GerenteProducao;

  lblDefiniComplementar.enabled := (dtmOperacoesOSP.TipoLogin = GerenteProducao) and
                                   (not dtmOperacoesOSP.qryOperacoesOSPtipooperacao.isnull and
                                   ( (dtmOperacoesOSP.qryOperacoesOSPtipooperacao.AsString[1]='N') or
                                     ((dtmOperacoesOSP.qryOperacoesOSPtipooperacao.AsString[1] = 'D') and
                                      dtmOperacoesOSP.qryOperacoesOSPorigemoperacaoalternativa.IsNull))) ;
                                      
  lblCtrl_C.Enabled := lblDefiniComplementar.enabled;

  lblForcarFechamento.enabled := (dtmOperacoesOSP.TipoLogin = GerenteProducao) and dtmOperacoesOSP.qryOperacoesOSPInformarTerminodoProcesso.AsBoolean;
  lblCtrl_F.Enabled := lblForcarFechamento.enabled;

end;

procedure TfrmOperacoesOSP.SetarParametrosGrade(Sender: TObject);
begin
  case dtmOperacoesOSP.TipoLogin of
  Operador: begin
              dbgOPeracoesOSPUsuario.PostOnEnter := false;
              dbgOPeracoesOSPUsuarioFalhas.PostOnEnter := false;

              dbgOPeracoesOSPUsuario.CanDelete := false;
              dbgOPeracoesOSPUsuarioFalhas.CanDelete := false;
            end;
  gerenteProducao:
            begin
              dbgOPeracoesOSPUsuario.PostOnEnter := true;
              dbgOPeracoesOSPUsuarioFalhas.PostOnEnter := true;

              dbgOPeracoesOSPUsuario.CanDelete := true;
              dbgOPeracoesOSPUsuarioFalhas.CanDelete := true;
            end;
  end;

end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

  if Shift = [ssCtrl] then
  begin
    case Key of
    {
     VK_F9     : begin
                     if dbgOPeracoesOSP.SelectedIndex in [1..4] then
                     begin
                       ConsultaOperacoes.CtrlOn := Shift = [ssCtrl];
                       if (Shift = []) or ConsultaOperacoes.CtrlOn then
                         AcionarPesquisaGradeOperacao
                     end;
                   end;
    }


     VK_D      : begin
                   if lblCtrl_C.Enabled then
                   begin
                     CondicoesOperacoesOsp;
                     dtmOperacoesOSP.DefinirComplementar;
                     ConsultaOperacoes.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or ConsultaOperacoes.CtrlOn then
                       if AcionarPesquisaGradeOperacao then
                       begin
                         //AtribuirDadosOperacoesosp;
                         dbgOPeracoesOSP.SetFocus;
                         dbgOPeracoesOSP.SelectedIndex := 2;

                         frmLerTexto := TfrmLerTexto.Create(frmLerTexto, 'Desvio de Processo');

                         frmLerTexto.lblTitulo.Visible := false;
                         frmLerTexto.lblTitulo.Caption := '';

                         frmLerTexto.lblTexto.Visible := true;
                         frmLerTexto.lblTexto.Caption := 'Informe o desvio de processo';

                         frmLerTexto.gbxTexto.Caption := '8D';

                         if frmLerTexto.ShowModal = mrok then
                         begin
                           dtmOperacoesOSP.qryOperacoesOSPc8d.Text := frmLerTexto.edtTexto.text;
                           dtmOperacoesOSP.qryoperacoesosp.post;
                           dtmOperacoesOSP.DefinirOrigemComplementar;
                           internogravar;
                         end
                         else
                         begin
                           dtmOperacoesOSP.qryoperacoesosp.cancel;
                         end;
                         frmLerTexto.free;
                       end
                       else
                         dtmOperacoesOSP.qryOperacoesOSP.Cancel;

                   end;
                 end;

     VK_F       : dtmOperacoesOSP.ConcluirOperacao;

    end;
    {
  end
  else
  if Shift = [] then
  case Key of
   VK_Return: begin
                  if dbgOPeracoesOSP.SelectedIndex = 4 then
                  begin
                    if VerificarOperacoes then
                     dbgOperacoesOSP.SelectedIndex := dbgOperacoesOSP.SelectedIndex + 1
                    else
                      key := 0;
                  end
                  else
                  if dbgOperacoesOSP.SelectedIndex = 6 then
                       dtmOperacoesOSP.GravarFluxoGramaOperacoes
                  else
                  if (dbgOperacoesOSP.SelectedIndex <> 4) then
                     dbgOperacoesOSP.SelectedIndex := dbgOperacoesOSP.SelectedIndex + 1;
                end;
  }
  end;
  inherited;

end;

procedure TfrmOperacoesOSP.edfLoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Percorrer(cmplote, Key, Shift);

  if key =VK_return then
  begin
    if dtmOperacoesOSP.qryOSPLotes.RecordCount<>0 then
    begin
//      if not Assigned(dtmOperacoesosp.UsuarioAut) then
      begin
        focarGradeUsuario;
        InternoIncluir;
      end;
    end;
  end;

end;


procedure TfrmOperacoesOSP.Timer1Timer(Sender: TObject);
begin
  inherited;
  if (strtotime(formatdatetime('HH:MM:SS', (now() -dtmOperacoesOSP.TempoAbrirJanela)) ) >= strtotime('00:00:20')) and
    not dtmOperacoesOSP.incluindocodigoUsuario then
  begin
    if Screen.ActiveForm.Name = 'frmOperacoesOSP' then
    begin
    {
      edfOSP.ActiveSetControls := false;
      edfLote.ActiveSetControls := false;

      edfOSP.group := '';
      edfLote.group := '';
    }
      InternoIncluir;
    {
      edfOSP.ActiveSetControls := True;
      edfLote.ActiveSetControls := True;

      edfOSP.group := 'osplote';
      edfLote.group := 'osplote';
    }
    end;

    dtmOperacoesOSP.TempoAbrirJanela := now();
  end;
end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPUsuarioParadasDblClick(
  Sender: TObject);
begin
  inherited;
  AcionarPesquisaGradeParadas;
end;

procedure TfrmOperacoesOSP.AcionarPesquisaGradeParadas;
begin
  if not dtmOperacoesOSP.qryOperacoesOSPUsuarioParadas.ReadOnly and
     (dtmOperacoesOSP.TipoLogin = GerenteProducao) then
  begin
    dbgOPeracoesOSPUsuarioParadas.SetFocus;
    ConsultaParadas.CtrlOn := True;
    ConsultaParadas.InternoPesquisar('MOTIVO DAS PARADAS');
    dbgOPeracoesOSPUsuarioParadas.SetFocus;
    dbgOPeracoesOSPUsuarioParadas.SelectedIndex :=  0;
  end;

end;

procedure TfrmOperacoesOSP.AtribuirDadosParadas;
begin
  with dtmOperacoesOSP do
  begin
    EditarOperacoesOSPUsuarioParadas;
    qryOperacoesOSPUsuarioParadascodigoParada.AsString := ConsultaParadas.qryProcuraMotivosParadascodigo.AsString;
    qryOperacoesOSPUsuarioParadasdescricao.AsString := ConsultaParadas.qryProcuraMotivosParadasdescricao.AsString;
    qryOperacoesOSPUsuarioParadasbloqueiamaquina.AsBoolean := ConsultaParadas.qryProcuraMotivosParadasbloqueiamaquina.AsBoolean; 
    qryOperacoesOSPUsuarioParadasparadaValidada.AsBoolean := true;
  end;
end;

procedure TfrmOperacoesOSP.dbgOPeracoesOSPUsuarioParadasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);

  Procedure VerificarParadas;
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioParadas.State in [dsedit,dsinsert]) or
       not (dtmOperacoesOSP.qryOperacoesOSPUsuarioParadas.IsEmpty) then
       begin
          ConsultaParadas.edfCodigo.Modified := true;
          ConsultaParadas.edfCodigo.DoExit;
          if ConsultaParadas.qryProcuraMotivosParadas.IsEmpty then
          begin
            dtmOperacoesOSP.LimparOperacoesOSPUsuarioParadas;
            dbgOPeracoesOSPUsuarioParadas.SetFocus;
            dbgOPeracoesOSPUsuarioParadas.SelectedIndex := 0;
          end
          else
          begin
            dtmOperacoesOSP.qryOperacoesOSPUsuarioParadasparadaValidada.AsBoolean := true;
            AtribuirDadosParadas;
            dbgOPeracoesOSPUsuarioParadas.SetFocus;
            dbgOPeracoesOSPUsuarioParadas.SelectedIndex := 0;
          end;
       end;
  end;

begin
  inherited;
  if dtmOperacoesOSP.tipologin = gerenteProducao then
  begin
    case dbgOPeracoesOSPUsuarioParadas.SelectedIndex of
    0 :
      begin
        if Shift = [ssCtrl] then
        begin
          case Key of
           VK_F9     : begin
                           ConsultaParadas.CtrlOn := Shift = [ssCtrl];
                           if (Shift = []) or ConsultaParadas.CtrlOn then
                             AcionarPesquisaGradeParadas
                         end;
          end;
        end
        else
        case Key of
         VK_Return: VerificarParadas;

         VK_Up,
         VK_Down,
         VK_PRIOR,
         VK_next: begin
                          if dtmOperacoesOSP.RegistrodeOperacoesOSPUsuarioParadas then
                          begin
                            dtmOperacoesOSP.EditarOperacoesOSPUsuarioParadas;
                            dtmOperacoesOSP.qryOperacoesOSPUsuarioParadas.CheckRequiredFields;
                            key := 0;
                          end;
                        end;

         VK_Escape : begin
                         dtmOperacoesOSP.CancelarOperacoesOSPUsuarioParadas;
                         if dbgOPeracoesOSPUsuarioParadas.Focused then
                         begin
                           dbgOPeracoesOSPUsuarioParadas.SetFocus;
                           dbgOPeracoesOSPUsuarioParadas.SelectedIndex := 0;
                         end;
                       end;
        end;
      end;
      {
    1 :
      begin
        if dtmOperacoesOSP.tipologin = operador then
           dtmOperacoesOSP.GravarOperacoesOSPUsuarioParadas
      end;
      }
    end;
  end;
end;

procedure TfrmOperacoesOSP.CondicoesOperacoesOSPUsuarioSetup;
const
  SQL = ' and (inativo is null or inativo > current_date)';
  SQLCodigoAtual = ' or codigo = %s';

  SQLOperacao = ' and codigo in (select uit.Usuario '+
                               ' from Usuariosinstrucoestrabalho uit '+
                               '      join instrucoestrabalho it '+
                               '      on uit.instrucaotrabalho = it.codigo '+
                               '      join instrucoestrabalhooperacoes ito '+
                               '      on uit.instrucaotrabalho = ito.instrucaotrabalho '+
                               ' where coalesce(uit.habilitadosetup,false) and ito.operacao = %s '+
                               '   and (it.inativo is null or it.inativo > current_date)) ';

begin
  ConsultaUsuariosSetup.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
    SQL +
    format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

  ConsultaUsuariosSetup.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
    SQL +
    format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

  if not dtmOperacoesOSP.SenhadoGerenteFixada then
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuariosetup.AsString<>'') and
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.state = dsinsert) then
    begin
      ConsultaUsuariosSetup.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
        SQL +
        format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]) +
        format(SQLCodigoAtual, [inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuariosetup.asinteger)]);
    end;
  end;
end;

procedure TfrmOperacoesOSP.CondicoesOperacoesOSPUsuarioFechamento;
const
  SQL = ' and (inativo is null or inativo > current_date)';
  SQLCodigoAtual = ' or codigo = %s';

  SQLOperacao = ' and codigo in (select uit.Usuario '+
                               ' from Usuariosinstrucoestrabalho uit '+
                               '      join instrucoestrabalho it '+
                               '      on uit.instrucaotrabalho = it.codigo '+
                               '      join instrucoestrabalhooperacoes ito '+
                               '      on uit.instrucaotrabalho = ito.instrucaotrabalho '+
                               ' where ito.operacao = %s ' +
                               '   and (it.inativo is null or it.inativo > current_date)) ';

begin

  ConsultaUsuariosFechamento.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
    SQL +
    format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

  ConsultaUsuariosFechamento.qryConsultaUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
    SQL +
    format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]);

  if not dtmOperacoesOSP.SenhadoGerenteFixada then
  begin
    if (dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuariotermino.AsString<>'') and
       not (dtmOperacoesOSP.qryOperacoesOSPUsuario.state = dsinsert) then
    begin
      ConsultaUsuariosFechamento.qryProcuraUsuarios.MacroByName('SQLUsuariosJaSelecionados').AsString :=
        SQL +
        format(SQLOperacao, [inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.asinteger)]) +
        format(SQLCodigoAtual, [inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuarioUsuariotermino.asinteger)]);
    end;
  end;

end;

procedure TfrmOperacoesOSP.AtribuirDadosUsuariosSetup;
begin
  with dtmOperacoesOSP do
  begin
    if (qryOperacoesOSPUsuarioUsuariosetup.AsString <> ConsultaUsuariossetup.qryProcuraUsuarioscodigo.AsString) then
    begin
      EditarOperacoesOSPUsuario;
      qryOperacoesOSPUsuarioUsuariosetup.AsString := ConsultaUsuariossetup.qryProcuraUsuarioscodigo.AsString;
      qryOperacoesOSPUsuarioUsuariosetupValidado.AsBoolean := true;
    end;
  end;
end;

procedure TfrmOperacoesOSP.AtribuirDadosUsuariosFechamento;
begin
  with dtmOperacoesOSP do
  begin
    if (qryOperacoesOSPUsuarioUsuariotermino.AsString <> ConsultaUsuariosFechamento.qryProcuraUsuarioscodigo.AsString) then
    begin
      EditarOperacoesOSPUsuario;
      qryOperacoesOSPUsuarioUsuariotermino.AsString := ConsultaUsuariosFechamento.qryProcuraUsuarioscodigo.AsString;
      qryOperacoesOSPUsuarioUsuariofechamentoValidado.AsBoolean := true;
    end;
  end;
end;

procedure TfrmOperacoesOSP.CondicoesMaquinas;
const
  SQL = 'and (codigo = %s or codigo in (select om.maquina from operacoesmaquinas om where om.operacao = %d))';
var
  Codigo: string;
begin
  Codigo:= inttostr(dtmOperacoesOSP.qryOperacoesOSPUsuariomaquina.AsInteger);
  if (dtmOperacoesOSP.qryOperacoesOSPUsuario.State = dsInsert) then
    Codigo:= '0';

  ConsultaMaquinas.qryProcuraMaquinas.MacroByName('SQLMaquinasJaSelecionadas').AsString :=
    format(SQL,[Codigo,dtmOperacoesOSP.qryOperacoesOSPoperacao.AsInteger]);

  ConsultaMaquinas.qryConsultaMaquinas.MacroByName('SQLMaquinasJaSelecionadas').AsString :=
    format(SQL,[Codigo,dtmOperacoesOSP.qryOperacoesOSPoperacao.AsInteger]);
end;

procedure TfrmOperacoesOSP.AtribuirDadosMaquinas;
begin
  with dtmOperacoesOSP do
  begin
    EditarOperacoesOSPUsuario;
    qryOperacoesOSPUsuariomaquina.AsString := ConsultaMaquinas.qryProcuraMaquinascodigo.AsString;
    qryOperacoesOSPUsuariodescricaomaquina.AsString := ConsultaMaquinas.qryProcuraMaquinasdescricao.AsString;
    qryOperacoesOSPUsuariomaquinaValidada.AsBoolean := true;
  end;
end;

procedure TfrmOperacoesOSP.sbnFecharClick(Sender: TObject);
begin
  inherited;
  dtmOperacoesOSP.AbrirOperacaoesaFechar;
  frmOperacoesemLote := TfrmOperacoesemLote.create(frmOperacoesemLote);
  frmOperacoesemLote.ShowModal;
  frmOperacoesemLote.free;
  dtmOperacoesOSP.qryOperacaoesaFechar.Close;
  dtmOperacoesOSP.qryMaquinasaFechar.Close;
end;

procedure TfrmOperacoesOSP.edfOSPEnter(Sender: TObject);
begin
  inherited;
  dtmOperacoesOSP.qryOSPLotes.ParamByName('numero').AsString   := ifthen_(edfLote.Text<>'',edfLote.Text,'0');
end;

procedure TfrmOperacoesOSP.edfLoteEnter(Sender: TObject);
begin
  inherited;
  dtmOperacoesOSP.qryOSPLotes.ParamByName('osp').AsString      := ifthen_(edfOSP.Text<>'',edfOSP.Text,'0');
end;

procedure TfrmOperacoesOSP.edfOSPExit(Sender: TObject);
begin
  inherited;
  edfLote.Modified := true;
end;

procedure TfrmOperacoesOSP.edfLoteExit(Sender: TObject);
begin
  inherited;
  edfosp.Modified := true;
end;

procedure TfrmOperacoesOSP.CondicoesOperacoesOsp;
const
  SQL = 'and (codigo not in (select oo.operacao from operacoesosp oo where oo.osp = %s and oo.lote = %s))';
//  SQL = 'and (codigo not in (select oo.operacao from operacoesosp oo where oo.osp = %s and oo.lote = %s) or codigo = %s)';
  {
var
  vcodigo : String;}
begin
{
   vcodigo := inttostr(dtmOperacoesOSP.qryOperacoesOSPoperacao.Asinteger);
   if (dtmOperacoesOSP.qryOperacoesOSP.State = dsInsert) or
      (dtmOperacoesOSP.qryOperacoesOSPNome.AsString='') then
     vcodigo := '0';
 }
   ConsultaOperacoes.qryProcuraOperacoes.MacroByName('SQLOperacoesJaSelecionadas').AsString :=
     format(SQL,[inttostr(dtmOperacoesOSP.qryOSPLotesosp.asinteger), inttostr(dtmOperacoesOSP.qryOSPLotesnumero.asinteger)]);

   ConsultaOperacoes.qryConsultaOperacoes.MacroByName('SQLOperacoesJaSelecionadas').AsString :=
     format(SQL,[inttostr(dtmOperacoesOSP.qryOSPLotesosp.asinteger), inttostr(dtmOperacoesOSP.qryOSPLotesnumero.asinteger)]);
end;

procedure TfrmOperacoesOSP.AtribuirDadosOperacoesosp;
begin
  with dtmOperacoesOSP do
  begin
    if qryOperacoesOSP.State = dsinsert then
    begin
      if ConsultaOperacoes.qryProcuraOperacoes.recordcount <> 0 then
      begin
        qryOperacoesOSPoperacao.AsString := ConsultaOperacoes.qryProcuraOperacoescodigo.AsString;
        qryOperacoesOSPNome.AsString := ConsultaOperacoes.qryProcuraOperacoesNome.AsString;
        qryOperacoesOSPc01.AsString := ConsultaOperacoes.qryProcuraOperacoesc01.AsString;
        qryOperacoesOSPc02.AsString := ConsultaOperacoes.qryProcuraOperacoesc02.AsString;
        qryOperacoesOSPc03.AsString := ConsultaOperacoes.qryProcuraOperacoesc03.AsString;
        qryOperacoesOSPtempopadrao.AsString := ConsultaOperacoes.qryProcuraOperacoestempopadrao.AsString;
        qryOperacoesOSPselecionada.AsBoolean := true;
        qryoperacoesosposp.asinteger := qryOSPLotesosp.asinteger;
        qryoperacoesosplote.asinteger := qryOSPLotesnumero.asinteger;
        qryOperacoesOSPsetup.asboolean := ConsultaOperacoes.qryProcuraOperacoessetup.AsBoolean;
        qryOperacoesOSPplanocontrole.AsBoolean := ConsultaOperacoes.qryProcuraOperacoesplanocontrole.AsBoolean;
        qryOperacoesOSPheaprimeiraoperacao.AsBoolean := false;
  //      qryoperacoesosp.tipooperacao.asstring
        qryOperacoesOSPppm.AsInteger := ConsultaOperacoes.qryProcuraOperacoesppm.Asinteger;
        qryOperacoesOSPOperacaoemAndamento.AsBoolean := false;
        qryOperacoesOSPOperacaoemAndamento_Complementar.asboolean := false;
        qryOperacoesOSPOperacaoLiberada.AsBoolean := false;
        qryOperacoesOSPHabilitadoSetup.AsBoolean := false;
        qryOperacoesOSPnaobloqueiaUsuario.AsBoolean := ConsultaOperacoes.qryProcuraOperacoesnaobloqueiaUsuario.Asboolean;
//        qryOperacoesOSPdesviodeprocesso.AsBoolean := false;
        qryOperacoesOSPOperacaoemGrupoComAnterior.AsBoolean := false;
        qryOperacoesOSPInformarTerminodoProcesso.AsBoolean := false;
        qryOperacoesOSPfechamentoforcado.AsBoolean := false;

//        qryOperacoesOSP.Post;
      end;  
    end;
  end;
end;

function TfrmOperacoesOSP.AcionarPesquisaGradeOperacao: boolean;
begin
  dbgOPeracoesOSP.SetFocus;
  ConsultaOperacoes.CtrlOn := True;
  result := ConsultaOperacoes.InternoPesquisar(ctOPERACOES) = mrOK;
end;

end.

