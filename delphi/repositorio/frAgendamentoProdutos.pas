unit frAgendamentoProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource, dmtecsoft,
  Grids, DBGrids, cpdbgrid, StdCtrls, ExtCtrls, dmbasico, biblio, DBCtrls,
  cpdbmemo;

type
  TfraAgendamentoProdutos = class(TFrame)
    dsrAgendamentoProdutos: TtecDataSource;
    qryAgendamentoProdutos: TtecQuery;
    dbgAgendamentoProdutos: TtecDBGrid;
    qryAgendamentoProdutoscodigovisual: TStringField;
    qryAgendamentoProdutosdescricao: TStringField;
    qryAgendamentoProdutosdias: TIntegerField;
    qryAgendamentoProdutosobservacoes: TStringField;
    qryAgendamentoProdutosagendamento: TDateField;
    qryAgendamentoProdutosmarcar: TBooleanField;
    pnlBottom: TPanel;
    ckbMarcar: TCheckBox;
    lblLegenda: TLabel;
    qryAgendamentoProdutosproduto: TLargeintField;
    gbxComplemento: TGroupBox;
    mmoComplemento: TtecDBMemo;
    qryAgendamentoProdutoscomplemento: TMemoField;
    procedure ckbMarcarClick(Sender: TObject);
    procedure dbgAgendamentoProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgAgendamentoProdutosDblClick(Sender: TObject);
  private
    fdmbasico: TdtmBasico;
    { Private declarations }
  protected
  public
    { Public declarations }
    vQuantidadeMarcados: integer;
    constructor Create(AOwner: TComponent); override;
    procedure AbrirqryAgendamentoProdutos;
    property dmbasico : TdtmBasico read fdmbasico write fdmbasico;
  end;

implementation

{$R *.dfm}

procedure TfraAgendamentoProdutos.AbrirqryAgendamentoProdutos;
begin
  qryAgendamentoProdutos.close;
  qryAgendamentoProdutos.open;
end;

procedure TfraAgendamentoProdutos.ckbMarcarClick(Sender: TObject);
begin
  dmBasico.MarcarRegistros(qryAgendamentoProdutos, qryAgendamentoProdutosmarcar, ckbMarcar.checked, true, true);
  vQuantidadeMarcados := dmbasico.QtdeMarcados;
end;

procedure TfraAgendamentoProdutos.dbgAgendamentoProdutosKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CtrlOn and (Key = VK_Space) then
  begin
    dmBasico.MarcarRegistros(qryAgendamentoProdutos, TBooleanField(qryAgendamentoProdutosmarcar), not qryAgendamentoProdutosmarcar.asboolean, false);
    vQuantidadeMarcados := dmbasico.QtdeMarcados;
  end;
end;

procedure TfraAgendamentoProdutos.dbgAgendamentoProdutosDblClick(
  Sender: TObject);
begin
  dmBasico.MarcarRegistros(qryAgendamentoProdutos, TBooleanField(qryAgendamentoProdutosmarcar), not qryAgendamentoProdutosmarcar.asboolean, false);
  vQuantidadeMarcados := dmbasico.QtdeMarcados;
end;

constructor TfraAgendamentoProdutos.Create(AOwner: TComponent);
begin
  inherited;
  vQuantidadeMarcados := 0;
  if not assigned(dmbasico) then
    dmbasico := TdtmBasico.create(self);
end;

end.
