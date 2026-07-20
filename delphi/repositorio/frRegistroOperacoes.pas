unit frRegistroOperacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Mask, DBCtrls, cpdbtext, DB, cpdatasource;

type
  TfraRegistroOperacoes = class(TFrame)
    gbxRegistrodasOperacoes: TGroupBox;
    gbxRegistroInclusao: TGroupBox;
    sttDataInclusao: TStaticText;
    sttUsuarioInclusao: TStaticText;
    gbxRegistroAlteracao: TGroupBox;
    dtxDataInclusao: TtecDBText;
    dtxUsuarioInclusao: TtecDBText;
    sttDataAlteracao: TStaticText;
    dtxDataAlteracao: TtecDBText;
    sttUsuarioAlteracao: TStaticText;
    dtxUsuarioAlteracao: TtecDBText;
    sttOperacao: TStaticText;
    dtxOperacao: TtecDBText;
    sttTabela: TStaticText;
    dtxTabela: TtecDBText;
    dsrRegistrodasOperacaoes: TtecDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
