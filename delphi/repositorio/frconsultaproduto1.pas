unit frconsultaproduto1;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, cpdbtext, Mask, cpdbfindcontrols, Buttons,
  ComCtrls, cppagecontrol, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  fmnavcontroles, frconsulta, fmconsultabasica, ctconstantes,
  fmconsultaporcampo{Qete,};

type
  TfraConsultaProduto1 = class(TfraConsulta)
    pgcProdutos: TtecPageControl;
    tstItemProduto: TTabSheet;
    sbnConsultaItemProduto: TSpeedButton;
    edfItemProduto: TtecDbEditFind;
    dtxItemProduto: TtecDBText;
    tstProdutos: TTabSheet;
    sbnConsultaProdutos: TSpeedButton;
    edfProduto: TtecDbEditFind;
    dtxProduto: TtecDBText;
    tstGrupodeProdutos: TTabSheet;
    sbnConsultaGrupoProduto: TSpeedButton;
    edfGrupoProduto: TtecDbEditFind;
    dtxGrupoProduto: TtecDBText;
    tstClasses: TTabSheet;
    sbnConsultaClasse: TSpeedButton;
    edfClasse: TtecDbEditFind;
    dtxClasse: TtecDBText;
    tstMarcas: TTabSheet;
    sbnProcuraMarca: TSpeedButton;
    edfMarca: TtecDbEditFind;
    dtxMarca: TtecDBText;
    procedure sbnConsultaItemProdutoClick(Sender: TObject);
    procedure sbnConsultaProdutosClick(Sender: TObject);
    procedure sbnConsultaGrupoProdutoClick(Sender: TObject);
    procedure sbnConsultaClasseClick(Sender: TObject);
    procedure sbnProcuraMarcaClick(Sender: TObject);
    procedure edfItemProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfGrupoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfClasseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edfMarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgcProdutosChange(Sender: TObject);
  private
    FMultiplosFiltros: boolean;
    procedure SettipoPesquisaCodigo(const Value: TTipoPesquisaCodigo);
    { Private declarations }
  protected
    function InternoPesquisar(Titulo: String): Integer; override;
    function JanelaPesquisa: TfrmConsultaBasica; override;
    function PesquisaHabilitada: Boolean;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property TipoPesquisaCodigo: TTipoPesquisaCodigo read FTipoPesquisaCodigo write SettipoPesquisaCodigo;
    property MultiplosFiltros: boolean read FMultiplosFiltros write FMultiplosFiltros;
  end;

var
  TipoPesquisa: TTecPesquisa;


implementation

{$R *.dfm}

function TfraConsultaProduto1.InternoPesquisar(Titulo: String): Integer;
begin
  if PesquisaHabilitada then
    begin
      AbreTabelaConsulta(TipoPesquisa);
      Result := inherited InternoPesquisar(Titulo);
      if Result = mrOK then
      begin
        Selecionar(TipoPesquisa);
        ActiveControl.SetFocus;
      end;
      FechaTabelaPesquisa(TipoPesquisa);
    end
  else
  Result := 0;
end;

function TfraConsultaProduto1.JanelaPesquisa: TfrmConsultaBasica;
var
  Jan: TfrmConsultaPorCampo;
begin
  Jan := TfrmConsultaPorCampo.Create(nil);
  Jan.ConsultaInterativa := Not (TipoPesquisa in [pesPRODUTOS, pesITEMPRODUTOS, pesCLIENTES]) and CtrlOn;
  Jan.UsarParametrosDaTabela := False;
  Result := Jan
end;

function TfraConsultaProduto1.PesquisaHabilitada: Boolean;
begin
  Result:= False;
  if CtrlOn and (ActiveControl is TtecDBEditFind) then
  begin
    if edfItemProduto.Focused then
      Tipopesquisa := pesITEMPRODUTOS
    else
    if edfProduto.Focused then
      TipoPesquisa := pesPRODUTOS
    else
    if edfGrupoProduto.Focused then
      TipoPesquisa := pesGRUPOS
    else
    if edfClasse.Focused then
      TipoPesquisa := pesCLASSES
    else
    if edfMarca.Focused then
      TipoPesquisa := pesMARCAS;
{
    else
    if edfVendedor.Focused then
      TipoPesquisa := pesVENDEDORES
    else
    if edfFornecedor.Focused then
      TipoPesquisa := pesFORNECEDORES
    else
    if edfCliente.Focused then
      TipoPesquisa := pesCLIENTES;
}
    Result := True;
  end;

end;

procedure TfraConsultaProduto1.sbnConsultaItemProdutoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfItemProduto, ctITEMPRODUTO);
end;

procedure TfraConsultaProduto1.sbnConsultaProdutosClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfProduto, ctPRODUTO);
end;

procedure TfraConsultaProduto1.sbnConsultaGrupoProdutoClick(
  Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfGrupoProduto, ctGRUPO);
end;

procedure TfraConsultaProduto1.sbnConsultaClasseClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfClasse, ctCLASSES);
end;

procedure TfraConsultaProduto1.sbnProcuraMarcaClick(Sender: TObject);
begin
  inherited;
  InternoPesquisar(edfMarca, ctCLASSES);
end;

constructor TfraConsultaProduto1.Create(AOwner: TComponent);
begin
  inherited;
  MultiplosFiltros := false;
end;

procedure TfraConsultaProduto1.edfItemProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or CtrlOn then
                     InternoPesquisar(edfItemProduto, ctITEMPRODUTO);
                 end;
  end;
end;


procedure TfraConsultaProduto1.edfProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or CtrlOn then
                     InternoPesquisar(edfProduto, ctPRODUTO);
                 end;
  end;
end;

procedure TfraConsultaProduto1.edfGrupoProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or CtrlOn then
                     InternoPesquisar(edfGrupoProduto, ctGRUPO);
                 end;
  end;
end;

procedure TfraConsultaProduto1.edfClasseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or CtrlOn then
                     InternoPesquisar(edfClasse, ctCLASSES);
                 end;
  end;
end;

procedure TfraConsultaProduto1.edfMarcaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  Case Key of
    VK_F9     : begin
                   CtrlOn := Shift = [ssCtrl];
                   if (Shift = []) or CtrlOn then
                     InternoPesquisar(edfMarca, ctCLASSES);
                 end;
  end;
end;

procedure TfraConsultaProduto1.pgcProdutosChange(Sender: TObject);

 procedure LimparControles(Controle: TTecFindCustom);
 begin
   if controle <> edfItemProduto then
   begin
     edfItemProduto.Clear;
     dtxItemProduto.Field.Clear;
   end;
   if controle <> edfProduto then
   begin
     edfProduto.Clear;
     dtxProduto.Field.Clear;
   end;
   if controle <> edfGrupoProduto then
   begin
     edfGrupoProduto.Clear;
     dtxGrupoProduto.Field.Clear;
   end;
   if controle <> edfClasse then
   begin
     edfClasse.Clear;
     dtxClasse.Field.Clear;
   end;
   if controle <> edfMarca then
   begin
     edfMarca.Clear;
     dtxMarca.Field.Clear;
   end;
 end;

begin
  inherited;
  if not MultiplosFiltros then
  begin
    if pgcProdutos.ActivePage = tstItemProduto then
      LimparControles(edfItemProduto)
    else
    if pgcProdutos.ActivePage = tstProdutos then
      LimparControles(edfProduto)
    else
    if pgcProdutos.ActivePage = tstGrupodeProdutos then
      LimparControles(edfGrupoProduto)
    else
    if pgcProdutos.ActivePage = tstClasses then
      LimparControles(edfClasse)
    else
    if pgcProdutos.ActivePage = tstMarcas then
      LimparControles(edfMarca);
  end;
end;

procedure TfraConsultaProduto1.SettipoPesquisaCodigo(
  const Value: TTipoPesquisaCodigo);
begin
  FTipoPesquisaCodigo := Value;
  AbreTabelaTipoPesquisacodigo(TipoPesquisaCodigo);
end;

end.



