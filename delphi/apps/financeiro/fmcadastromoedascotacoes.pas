unit fmcadastromoedascotacoes;

interface

uses
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, fmcadastropadraonavegacao, ComCtrls, Buttons, ExtCtrls,
  DBCtrls, cptexto, cpnumero, Mask, cpdbfindcontrols, cpdbdata, ToolWin;

type
  TfrmCadastroMoedasCotacoes = class(TfrmCadastroPadraoNav)
    gbxDataCotacao: TGroupBox;
    gbxCotacao: TGroupBox;
    edtCotacao: TDBEditNumero;
    gbxObservacaoCotacao: TGroupBox;
    edtDescricaoMoeda: TDBEditTexto;
    edtDataCotacao: TtecDBFindLookup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroMoedasCotacoes: TfrmCadastroMoedasCotacoes;

implementation
uses dmcadastromoedas;

{$R *.dfm}

end.
