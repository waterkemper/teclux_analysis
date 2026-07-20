unit fmcadastropadraonavegacao;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, Windows,
  //Repositorio
  fmcadastropadrao, ToolWin;

type
  TfrmCadastroPadraoNav = class(TfrmCadastroPadrao)
    sbnPrimeiro: TSpeedButton;
    sbnAnterior: TSpeedButton;
    sbnProximo: TSpeedButton;
    sbnUltimo: TSpeedButton;
    procedure sbnPrimeiroClick(Sender: TObject);
    procedure sbnAnteriorClick(Sender: TObject);
    procedure sbnProximoClick(Sender: TObject);
    procedure sbnUltimoClick(Sender: TObject);
  protected
    procedure AlterarEstadoBotoesNavegacao; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    BloquerAcaoBotes_Prior_Next : boolean;
  end;

implementation

{$R *.dfm}

{ TfrmCadastroPadraoNav }

procedure TfrmCadastroPadraoNav.AlterarEstadoBotoesNavegacao;
begin
  sbnPrimeiro.Enabled := Not DataSet.Bof;
  sbnAnterior.Enabled := Not DataSet.Bof;
  sbnProximo.Enabled  := Not DataSet.Eof;
  sbnUltimo.Enabled   := Not DataSet.Eof;
  inherited;
end;

procedure TfrmCadastroPadraoNav.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not BloquerAcaoBotes_Prior_Next then
    if Shift = [ssCtrl] then
      case Key of
        VK_HOME : sbnPrimeiroClick(sbnPrimeiro);
        VK_PRIOR: sbnAnteriorClick(sbnAnterior);
        VK_NEXT:  sbnProximoClick(sbnProximo);
        VK_END: sbnUltimoClick(sbnUltimo);
      end;
end;

procedure TfrmCadastroPadraoNav.sbnAnteriorClick(Sender: TObject);
begin
  inherited;
  if Cancelar then
  begin
   DataSet.Prior;
   AlterarEstadoBotoesNavegacao;
  end;
end;

procedure TfrmCadastroPadraoNav.sbnPrimeiroClick(Sender: TObject);
begin
  inherited;
  if Cancelar then
  begin
   DataSet.First;
   AlterarEstadoBotoesNavegacao;
  end;
end;

procedure TfrmCadastroPadraoNav.sbnProximoClick(Sender: TObject);
begin
  inherited;
  if Cancelar then
  begin
    DataSet.Next;
    AlterarEstadoBotoesNavegacao;
  end;
end;

procedure TfrmCadastroPadraoNav.sbnUltimoClick(Sender: TObject);
begin
  inherited;
  if Cancelar then
   DataSet.Last;
  AlterarEstadoBotoesNavegacao;
end;

end.
